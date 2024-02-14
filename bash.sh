#!/bin/sh
echo Building react build 

docker build -t build:v1.0 . -f Dockerfile.build 

docker run -dt --name extract build:v1.0

docker cp extract:/app/build ./app 

docker rm -f extract 

echo Building react:v1.0

docker build -t react:v1.0 . -f Dockerfile.main

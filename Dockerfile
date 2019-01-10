FROM golang:1.8 as builder

RUN go get -u github.com/gin-gonic/gin

# COPY payworker.go .
COPY . /go/src/
WORKDIR /go/src/consumer
RUN go build -o payworker payworker.go
CMD ["./payworker"]

# # Application image.
# FROM golang:1.8

# COPY --from=builder /go/src/app/app /usr/local/bin/app

# CMD ["/usr/local/bin/app"]
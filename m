Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9602D399C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B956F6EBB3;
	Fri, 11 Oct 2019 06:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EE96EB88
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 21:07:02 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b8so4420777pgm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 14:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qC40adZXU/tV5QzYgkBZx24z9et5UNUWBE0VYT7PPKM=;
 b=dDCjWxYLtoFsr6bfxrRUNoSYE3HZfCSTS/977i/VOLcepMsXaPUE3WZ8m7oBi5Dg6G
 ue6s21K9ybJjeb4C0Ic+BRV2N8pxU1La0u4narNyKtcDUXuXr0dDUPdeLFjFe9cix1w9
 GDi/gmBqQW+KN1U59da2UoDTsvgmCSXnN7V8Fv1QF8ey1XSB0wcVrJ3N+FGvZdWsZlPT
 8VHIWqbygXGg4Si17hED1jJP3ssgO1SvokRuMVEcA1M2lt8blmQ967m+Qa9AjCJGaDo0
 A7KwcHXy1hpYeMvEk/A73MHR7z10mmQq1juoi6M9deuyGwHZxibYTinA6eReGyDJmjti
 0kew==
X-Gm-Message-State: APjAAAWKvIupvPrTQ0yXLp9Df9dQtY580nWAEpvOM7NUm2tyneFA0Bsz
 OkfqCiBLqU7/hwniA7c3NYc=
X-Google-Smtp-Source: APXvYqxHvLlCmq0oZPemzFhc9sfBvjJdNcYUNGHxi4jnZ2DaNVAPm7JpzEYskIcPh0DGt6hKAW5iCg==
X-Received: by 2002:aa7:8ece:: with SMTP id b14mr12791904pfr.113.1570741622461; 
 Thu, 10 Oct 2019 14:07:02 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id v68sm7898208pfv.47.2019.10.10.14.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 14:07:02 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robh+dt@kernel.org,
	mark.rutland@arm.com
Subject: [PATCH] dt-bindings: display: Convert sharp,
 ld-d5116z01b panel to DT schema
Date: Thu, 10 Oct 2019 14:06:54 -0700
Message-Id: <20191010210654.37426-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qC40adZXU/tV5QzYgkBZx24z9et5UNUWBE0VYT7PPKM=;
 b=I9lwiD04t1jKp5V8AgRfsBgUtqOqxbP2i2vMH/gvkQdGrPNFU8oba65acyXERV2WxY
 v22XAjePeSNoSnuHvvSA3n0sZueH/ek4qoDsV1mF5gUidtlh0f9FoQfVDAR/jhkOcGhB
 rnykdBOTlPwXGv1tJqfm+muTrjPsvtCHqZ6NIxprQmcBoo3Q1X3BOiJAKexs+98gGLXI
 gy3kJH4Zzmx8dl5/AWZaZXQWidW/uMELQ+Df4m0RopDxA1X73CcmKuvV8DuDVa+IPveD
 5JW71HSCGxBV95p5y9yuhCfuGDL78Qh7kwGviirnVfRQLpsrBLlk1ua2yXpUwA+5aM6b
 ks0g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 thierry.reding@gmail.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgc2hhcnAsbGQtZDUxMTZ6MDFiIHBhbmVsIGJpbmRpbmcgdG8gRFQgc2NoZW1h
LgoKU2lnbmVkLW9mZi1ieTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+
Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnR4dCAgICAgIHwgMjYg
LS0tLS0tLS0tLS0tLS0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnlh
bWwgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNl
cnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTExNnowMWIu
dHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTEx
NnowMWIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
ZmQ5Y2YzOWJkZTc3Li4wMDAwMDAwMDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnR4dAorKysgL2Rldi9u
dWxsCkBAIC0xLDI2ICswLDAgQEAKLVNoYXJwIExELUQ1MTE2WjAxQiAxMi4zIiBXVVhHQSsgZURQ
IHBhbmVsCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNvbXBhdGlibGU6IHNob3VsZCBiZSAi
c2hhcnAsbGQtZDUxMTZ6MDFiIgotLSBwb3dlci1zdXBwbHk6IHJlZ3VsYXRvciB0byBwcm92aWRl
IHRoZSBWQ0Mgc3VwcGx5IHZvbHRhZ2UgKDMuMyB2b2x0cykKLQotVGhpcyBiaW5kaW5nIGlzIGNv
bXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRpbmcuCi0KLVRoZSBkZXZpY2Ugbm9k
ZSBjYW4gY29udGFpbiBvbmUgJ3BvcnQnIGNoaWxkIG5vZGUgd2l0aCBvbmUgY2hpbGQKLSdlbmRw
b2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVkIGluIFsxXS4gVGhp
cwotbm9kZSBzaG91bGQgZGVzY3JpYmUgcGFuZWwncyB2aWRlbyBidXMuCi0KLVsxXTogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0Ci0K
LUV4YW1wbGU6Ci0KLQlwYW5lbDogcGFuZWwgewotCQljb21wYXRpYmxlID0gInNoYXJwLGxkLWQ1
MTE2ejAxYiI7Ci0JCXBvd2VyLXN1cHBseSA9IDwmdmxjZF8zdjM+OwotCi0JCXBvcnQgewotCQkJ
cGFuZWxfZXA6IGVuZHBvaW50IHsKLQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmJyaWRnZV9vdXRf
ZXA+OwotCQkJfTsKLQkJfTsKLQl9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTEx
NnowMWIueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmZiYjY0
N2ViMzNjOQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxkLWQ1MTE2ejAxYi55YW1sCkBAIC0wLDAgKzEsMzAg
QEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCisk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQt
ZDUxMTZ6MDFiLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNoYXJwIExELUQ1MTE2WjAxQiAxMi4zIiBXVVhHQSsg
ZURQIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1
Z29AZ21haWwuY29tPgorCithbGxPZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKwor
cHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogc2hhcnAsbGQtZDUxMTZ6MDFi
CisKKyAgcG93ZXItc3VwcGx5OiB0cnVlCisgIGJhY2tsaWdodDogdHJ1ZQorICBwb3J0OiB0cnVl
CisgIG5vLWhwZDogdHJ1ZQorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworcmVxdWly
ZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHBvd2VyLXN1cHBseQorCisuLi4KLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

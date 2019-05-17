Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B921A46
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 17:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594ED8991E;
	Fri, 17 May 2019 15:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C4E8991A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 15:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id B7B7E27DBF2
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panfrost: Select devfreq
Date: Fri, 17 May 2019 12:00:42 -0300
Message-Id: <20190517150042.776-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5LCB0aGVyZSBpcyBzb21lIGxvZ2ljIGZvciB0aGUgZHJpdmVyIHRvIHdvcmsgd2l0
aG91dCBkZXZmcmVxLgpIb3dldmVyLCB0aGUgZHJpdmVyIGFjdHVhbGx5IGZhaWxzIHRvIHByb2Jl
IGlmICFDT05GSUdfUE1fREVWRlJFUS4KCkZpeCB0aGlzIGJ5IHNlbGVjdGluZyBkZXZmcmVxLCBh
bmQgZHJvcCB0aGUgYWRkaXRpb25hbCBjaGVja3MKZm9yIGRldmZyZXEuCgpTaWduZWQtb2ZmLWJ5
OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L0tjb25maWcgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAxMyArKy0tLS0tLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvS2NvbmZpZwppbmRleCA1OTE2MTFkYzRlMzQuLjgxOTYzZTk2NGIwZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L0tjb25maWcKQEAgLTksNiArOSw3IEBAIGNvbmZpZyBEUk1fUEFORlJPU1QKIAlzZWxl
Y3QgSU9NTVVfU1VQUE9SVAogCXNlbGVjdCBJT01NVV9JT19QR1RBQkxFX0xQQUUKIAlzZWxlY3Qg
RFJNX0dFTV9TSE1FTV9IRUxQRVIKKwlzZWxlY3QgUE1fREVWRlJFUQogCWhlbHAKIAkgIERSTSBk
cml2ZXIgZm9yIEFSTSBNYWxpIE1pZGdhcmQgKFQ2eHgsIFQ3eHgsIFQ4eHgpIGFuZAogCSAgQmlm
cm9zdCAoRzN4LCBHNXgsIEc3eCkgR1BVcy4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2ZnJlcS5jCmluZGV4IDIzOGJkMWQ4OWQ0My4uMjlmY2ZmZGYyZDU3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKQEAgLTE0MCw4ICsxNDAs
OCBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2KQogCQlyZXR1cm4gMDsKIAogCXJldCA9IGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCZwZmRl
di0+cGRldi0+ZGV2KTsKLQlpZiAocmV0ID09IC1FTk9ERVYpIC8qIE9wdGlvbmFsLCBjb250aW51
ZSB3aXRob3V0IGRldmZyZXEgKi8KLQkJcmV0dXJuIDA7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJl
dDsKIAogCXBhbmZyb3N0X2RldmZyZXFfcmVzZXQocGZkZXYpOwogCkBAIC0xNzAsOSArMTcwLDYg
QEAgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc3VtZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpw
ZmRldikKIHsKIAlpbnQgaTsKIAotCWlmICghcGZkZXYtPmRldmZyZXEuZGV2ZnJlcSkKLQkJcmV0
dXJuOwotCiAJcGFuZnJvc3RfZGV2ZnJlcV9yZXNldChwZmRldik7CiAJZm9yIChpID0gMDsgaSA8
IE5VTV9KT0JfU0xPVFM7IGkrKykKIAkJcGZkZXYtPmRldmZyZXEuc2xvdFtpXS5idXN5ID0gZmFs
c2U7CkBAIC0xODIsOSArMTc5LDYgQEAgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc3VtZShzdHJ1
Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3N1c3Bl
bmQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiB7Ci0JaWYgKCFwZmRldi0+ZGV2ZnJl
cS5kZXZmcmVxKQotCQlyZXR1cm47Ci0KIAlkZXZmcmVxX3N1c3BlbmRfZGV2aWNlKHBmZGV2LT5k
ZXZmcmVxLmRldmZyZXEpOwogfQogCkBAIC0xOTQsOSArMTg4LDYgQEAgc3RhdGljIHZvaWQgcGFu
ZnJvc3RfZGV2ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0IHBhbmZyb3N0X2RldmljZSAq
cGZkZXYsIGkKIAlrdGltZV90IG5vdzsKIAlrdGltZV90IGxhc3Q7CiAKLQlpZiAoIXBmZGV2LT5k
ZXZmcmVxLmRldmZyZXEpCi0JCXJldHVybjsKLQogCW5vdyA9IGt0aW1lX2dldCgpOwogCWxhc3Qg
PSBwZmRldi0+ZGV2ZnJlcS5zbG90W3Nsb3RdLnRpbWVfbGFzdF91cGRhdGU7CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

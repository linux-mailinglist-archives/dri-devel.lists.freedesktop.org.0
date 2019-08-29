Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24DDA3268
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A536E2BF;
	Fri, 30 Aug 2019 08:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A9CE6E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:14 +0000 (UTC)
X-UUID: df2a1ba617b04533866ed7395c2e20a8-20190829
X-UUID: df2a1ba617b04533866ed7395c2e20a8-20190829
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1731137527; Thu, 29 Aug 2019 22:51:12 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:15 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5,
 10/32] drm/mediatek: add mutex sof register offset into ddp private
 data
Date: Thu, 29 Aug 2019 22:50:32 +0800
Message-ID: <1567090254-15566-11-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D33B4E8515851DCFAA612D8C61321D8956F5891A8DF27C9B420DBD700CFDBA552000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgptdXRleCBz
b2YgcmVnaXN0ZXIgb2Zmc2V0IHdpbGwgYmUgcHJpdmF0ZSBkYXRhIG9mIGRkcAoKU2lnbmVkLW9m
Zi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+ClJldmlld2Vk
LWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5jIHwgMTMgKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYwppbmRleCA5YmRiZDhkLi40ODY2YTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHAuYwpAQCAtMzQsMTIgKzM0LDEzIEBACiAjZGVmaW5lIERJU1BfUkVHX0NP
TkZJR19EUElfU0VMCQkJMHgwNjQKIAogI2RlZmluZSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMAkJ
CTB4MmMKKyNkZWZpbmUgTVQyNzAxX0RJU1BfTVVURVgwX1NPRjAJCQkweDMwCiAKICNkZWZpbmUg
RElTUF9SRUdfTVVURVhfRU4obikJCQkoMHgyMCArIDB4MjAgKiAobikpCiAjZGVmaW5lIERJU1Bf
UkVHX01VVEVYKG4pCQkJKDB4MjQgKyAweDIwICogKG4pKQogI2RlZmluZSBESVNQX1JFR19NVVRF
WF9SU1QobikJCQkoMHgyOCArIDB4MjAgKiAobikpCiAjZGVmaW5lIERJU1BfUkVHX01VVEVYX01P
RChtdXRleF9tb2RfcmVnLCBuKQkobXV0ZXhfbW9kX3JlZyArIDB4MjAgKiAobikpCi0jZGVmaW5l
IERJU1BfUkVHX01VVEVYX1NPRihuKQkJCSgweDMwICsgMHgyMCAqIChuKSkKKyNkZWZpbmUgRElT
UF9SRUdfTVVURVhfU09GKG11dGV4X3NvZl9yZWcsIG4pCShtdXRleF9zb2ZfcmVnICsgMHgyMCAq
IChuKSkKICNkZWZpbmUgRElTUF9SRUdfTVVURVhfTU9EMihuKQkJCSgweDM0ICsgMHgyMCAqIChu
KSkKIAogI2RlZmluZSBJTlRfTVVURVgJCQkJQklUKDEpCkBAIC0xNTUsNiArMTU2LDcgQEAgc3Ry
dWN0IG10a19kZHBfZGF0YSB7CiAJY29uc3QgdW5zaWduZWQgaW50ICptdXRleF9tb2Q7CiAJY29u
c3QgdW5zaWduZWQgaW50ICptdXRleF9zb2Y7CiAJY29uc3QgdW5zaWduZWQgaW50IG11dGV4X21v
ZF9yZWc7CisJY29uc3QgdW5zaWduZWQgaW50IG11dGV4X3NvZl9yZWc7CiB9OwogCiBzdHJ1Y3Qg
bXRrX2RkcCB7CkBAIC0yMjYsMTggKzIyOCwyMSBAQCBzdHJ1Y3QgbXRrX2RkcCB7CiAJLm11dGV4
X21vZCA9IG10MjcwMV9tdXRleF9tb2QsCiAJLm11dGV4X3NvZiA9IG10MjcxMl9tdXRleF9zb2Ys
CiAJLm11dGV4X21vZF9yZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMCwKKwkubXV0ZXhfc29m
X3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9TT0YwLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBtdGtfZGRwX2RhdGEgbXQyNzEyX2RkcF9kcml2ZXJfZGF0YSA9IHsKIAkubXV0ZXhfbW9kID0g
bXQyNzEyX211dGV4X21vZCwKIAkubXV0ZXhfc29mID0gbXQyNzEyX211dGV4X3NvZiwKIAkubXV0
ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9NT0QwLAorCS5tdXRleF9zb2ZfcmVnID0g
TVQyNzAxX0RJU1BfTVVURVgwX1NPRjAsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19k
ZHBfZGF0YSBtdDgxNzNfZGRwX2RyaXZlcl9kYXRhID0gewogCS5tdXRleF9tb2QgPSBtdDgxNzNf
bXV0ZXhfbW9kLAogCS5tdXRleF9zb2YgPSBtdDI3MTJfbXV0ZXhfc29mLAogCS5tdXRleF9tb2Rf
cmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAsCisJLm11dGV4X3NvZl9yZWcgPSBNVDI3MDFf
RElTUF9NVVRFWDBfU09GMCwKIH07CiAKIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9tb3V0
X2VuKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwKQEAgLTUxOSw3ICs1MjQsOCBAQCB2b2lkIG10
a19kaXNwX211dGV4X2FkZF9jb21wKHN0cnVjdCBtdGtfZGlzcF9tdXRleCAqbXV0ZXgsCiAJfQog
CiAJd3JpdGVsX3JlbGF4ZWQoZGRwLT5kYXRhLT5tdXRleF9zb2Zbc29mX2lkXSwKLQkJICAgICAg
IGRkcC0+cmVncyArIERJU1BfUkVHX01VVEVYX1NPRihtdXRleC0+aWQpKTsKKwkJICAgICAgIGRk
cC0+cmVncyArCisJCSAgICAgICBESVNQX1JFR19NVVRFWF9TT0YoZGRwLT5kYXRhLT5tdXRleF9z
b2ZfcmVnLCBtdXRleC0+aWQpKTsKIH0KIAogdm9pZCBtdGtfZGlzcF9tdXRleF9yZW1vdmVfY29t
cChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LApAQCAtNTQxLDcgKzU0Nyw4IEBAIHZvaWQg
bXRrX2Rpc3BfbXV0ZXhfcmVtb3ZlX2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwK
IAljYXNlIEREUF9DT01QT05FTlRfRFBJMToKIAkJd3JpdGVsX3JlbGF4ZWQoTVVURVhfU09GX1NJ
TkdMRV9NT0RFLAogCQkJICAgICAgIGRkcC0+cmVncyArCi0JCQkgICAgICAgRElTUF9SRUdfTVVU
RVhfU09GKG11dGV4LT5pZCkpOworCQkJICAgICAgIERJU1BfUkVHX01VVEVYX1NPRihkZHAtPmRh
dGEtPm11dGV4X3NvZl9yZWcsCisJCQkJCQkgIG11dGV4LT5pZCkpOwogCQlicmVhazsKIAlkZWZh
dWx0OgogCQlpZiAoZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdIDwgMzIpIHsKLS0gCjEuOC4xLjEu
ZGlydHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

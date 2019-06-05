Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6DF36CBE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122358937C;
	Thu,  6 Jun 2019 07:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF743898CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:48:48 +0000 (UTC)
X-UUID: 63ed7b3bb466408cb65bfd6572626f4b-20190605
X-UUID: 63ed7b3bb466408cb65bfd6572626f4b-20190605
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1291459427; Wed, 05 Jun 2019 19:43:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:44 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 09/27] drm/mediatek: add mutex sof register offset into ddp private
 data
Date: Wed, 5 Jun 2019 19:42:48 +0800
Message-ID: <1559734986-7379-10-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
Zi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAxMyArKysrKysrKysrLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IGUxYTUxMGYuLjcxNzYwOWQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCkBAIC00MiwxMiArNDIsMTMgQEAKICNk
ZWZpbmUgRElTUF9SRUdfQ09ORklHX0RQSV9TRUwJCQkweDA2NAogCiAjZGVmaW5lIE1UMjcwMV9E
SVNQX01VVEVYMF9NT0QwCQkJMHgyYworI2RlZmluZSBNVDI3MDFfRElTUF9NVVRFWDBfU09GMAkJ
CTB4MmMKIAogI2RlZmluZSBESVNQX1JFR19NVVRFWF9FTihuKQkJCSgweDIwICsgMHgyMCAqIChu
KSkKICNkZWZpbmUgRElTUF9SRUdfTVVURVgobikJCQkoMHgyNCArIDB4MjAgKiAobikpCiAjZGVm
aW5lIERJU1BfUkVHX01VVEVYX1JTVChuKQkJCSgweDI4ICsgMHgyMCAqIChuKSkKICNkZWZpbmUg
RElTUF9SRUdfTVVURVhfTU9EKG11dGV4X21vZF9yZWcsIG4pCShtdXRleF9tb2RfcmVnICsgMHgy
MCAqIChuKSkKLSNkZWZpbmUgRElTUF9SRUdfTVVURVhfU09GKG4pCQkJKDB4MzAgKyAweDIwICog
KG4pKQorI2RlZmluZSBESVNQX1JFR19NVVRFWF9TT0YobXV0ZXhfc29mX3JlZywgbikJKG11dGV4
X3NvZl9yZWcgKyAweDIwICogKG4pKQogI2RlZmluZSBESVNQX1JFR19NVVRFWF9NT0QyKG4pCQkJ
KDB4MzQgKyAweDIwICogKG4pKQogCiAjZGVmaW5lIElOVF9NVVRFWAkJCQlCSVQoMSkKQEAgLTE2
NCw2ICsxNjUsNyBAQCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIHsKIAljb25zdCB1bnNpZ25lZCBpbnQg
Km11dGV4X21vZDsKIAljb25zdCB1bnNpZ25lZCBpbnQgKm11dGV4X3NvZjsKIAljb25zdCB1bnNp
Z25lZCBpbnQgbXV0ZXhfbW9kX3JlZzsKKwljb25zdCB1bnNpZ25lZCBpbnQgbXV0ZXhfc29mX3Jl
ZzsKIH07CiAKIHN0cnVjdCBtdGtfZGRwIHsKQEAgLTIzNSwxOCArMjM3LDIxIEBAIHN0cnVjdCBt
dGtfZGRwIHsKIAkubXV0ZXhfbW9kID0gbXQyNzAxX211dGV4X21vZCwKIAkubXV0ZXhfc29mID0g
bXQyNzEyX211dGV4X3NvZiwKIAkubXV0ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9N
T0QwLAorCS5tdXRleF9zb2ZfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX1NPRjAsCiB9OwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBtdDI3MTJfZGRwX2RyaXZlcl9kYXRhID0g
ewogCS5tdXRleF9tb2QgPSBtdDI3MTJfbXV0ZXhfbW9kLAogCS5tdXRleF9zb2YgPSBtdDI3MTJf
bXV0ZXhfc29mLAogCS5tdXRleF9tb2RfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAsCisJ
Lm11dGV4X3NvZl9yZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfU09GMCwKIH07CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2RkcF9kYXRhIG10ODE3M19kZHBfZHJpdmVyX2RhdGEgPSB7CiAJLm11
dGV4X21vZCA9IG10ODE3M19tdXRleF9tb2QsCiAJLm11dGV4X3NvZiA9IG10MjcxMl9tdXRleF9z
b2YsCiAJLm11dGV4X21vZF9yZWcgPSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMCwKKwkubXV0ZXhf
c29mX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9TT0YwLAogfTsKIAogc3RhdGljIHVuc2lnbmVk
IGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLApAQCAtNTI4LDcg
KzUzMyw4IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfYWRkX2NvbXAoc3RydWN0IG10a19kaXNwX211
dGV4ICptdXRleCwKIAl9CiAKIAl3cml0ZWxfcmVsYXhlZChkZHAtPmRhdGEtPm11dGV4X3NvZltz
b2ZfaWRdLAotCQkgICAgICAgZGRwLT5yZWdzICsgRElTUF9SRUdfTVVURVhfU09GKG11dGV4LT5p
ZCkpOworCQkgICAgICAgZGRwLT5yZWdzICsKKwkJICAgICAgIERJU1BfUkVHX01VVEVYX1NPRihk
ZHAtPmRhdGEtPm11dGV4X3NvZl9yZWcsIG11dGV4LT5pZCkpOwogfQogCiB2b2lkIG10a19kaXNw
X211dGV4X3JlbW92ZV9jb21wKHN0cnVjdCBtdGtfZGlzcF9tdXRleCAqbXV0ZXgsCkBAIC01NTAs
NyArNTU2LDggQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9yZW1vdmVfY29tcChzdHJ1Y3QgbXRrX2Rp
c3BfbXV0ZXggKm11dGV4LAogCWNhc2UgRERQX0NPTVBPTkVOVF9EUEkxOgogCQl3cml0ZWxfcmVs
YXhlZChNVVRFWF9TT0ZfU0lOR0xFX01PREUsCiAJCQkgICAgICAgZGRwLT5yZWdzICsKLQkJCSAg
ICAgICBESVNQX1JFR19NVVRFWF9TT0YobXV0ZXgtPmlkKSk7CisJCQkgICAgICAgRElTUF9SRUdf
TVVURVhfU09GKGRkcC0+ZGF0YS0+bXV0ZXhfc29mX3JlZywKKwkJCQkJCSAgbXV0ZXgtPmlkKSk7
CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWlmIChkZHAtPmRhdGEtPm11dGV4X21vZFtpZF0gPCAz
MikgewotLSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134763169
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9E4898A7;
	Tue,  9 Jul 2019 07:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 51DB089D39
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:31 +0000 (UTC)
X-UUID: 649ffb48337a46ceb5d8b95e6db3e5eb-20190709
X-UUID: 649ffb48337a46ceb5d8b95e6db3e5eb-20190709
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 810021551; Tue, 09 Jul 2019 06:34:30 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:28 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 09/33] drm/mediatek: add mutex mod register offset into ddp private
 data
Date: Tue, 9 Jul 2019 06:33:49 +0800
Message-ID: <1562625253-29254-10-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgptdXRleCBt
b2QgcmVnaXN0ZXIgb2Zmc2V0IHdpbGwgYmUgcHJpdmF0ZSBkYXRhIG9mIGRkcC4KClNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgMjQgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IDQxMmI4MmYuLjhi
ZGUyY2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCkBAIC00MSwxMiAr
NDEsMTQgQEAKICNkZWZpbmUgRElTUF9SRUdfQ09ORklHX0RTSV9TRUwJCQkweDA1MAogI2RlZmlu
ZSBESVNQX1JFR19DT05GSUdfRFBJX1NFTAkJCTB4MDY0CiAKLSNkZWZpbmUgRElTUF9SRUdfTVVU
RVhfRU4obikJKDB4MjAgKyAweDIwICogKG4pKQotI2RlZmluZSBESVNQX1JFR19NVVRFWChuKQko
MHgyNCArIDB4MjAgKiAobikpCi0jZGVmaW5lIERJU1BfUkVHX01VVEVYX1JTVChuKQkoMHgyOCAr
IDB4MjAgKiAobikpCi0jZGVmaW5lIERJU1BfUkVHX01VVEVYX01PRChuKQkoMHgyYyArIDB4MjAg
KiAobikpCi0jZGVmaW5lIERJU1BfUkVHX01VVEVYX1NPRihuKQkoMHgzMCArIDB4MjAgKiAobikp
Ci0jZGVmaW5lIERJU1BfUkVHX01VVEVYX01PRDIobikJKDB4MzQgKyAweDIwICogKG4pKQorI2Rl
ZmluZSBNVDI3MDFfRElTUF9NVVRFWDBfTU9EMAkJCTB4MmMKKworI2RlZmluZSBESVNQX1JFR19N
VVRFWF9FTihuKQkJCSgweDIwICsgMHgyMCAqIChuKSkKKyNkZWZpbmUgRElTUF9SRUdfTVVURVgo
bikJCQkoMHgyNCArIDB4MjAgKiAobikpCisjZGVmaW5lIERJU1BfUkVHX01VVEVYX1JTVChuKQkJ
CSgweDI4ICsgMHgyMCAqIChuKSkKKyNkZWZpbmUgRElTUF9SRUdfTVVURVhfTU9EKG11dGV4X21v
ZF9yZWcsIG4pCShtdXRleF9tb2RfcmVnICsgMHgyMCAqIChuKSkKKyNkZWZpbmUgRElTUF9SRUdf
TVVURVhfU09GKG4pCQkJKDB4MzAgKyAweDIwICogKG4pKQorI2RlZmluZSBESVNQX1JFR19NVVRF
WF9NT0QyKG4pCQkJKDB4MzQgKyAweDIwICogKG4pKQogCiAjZGVmaW5lIElOVF9NVVRFWAkJCQlC
SVQoMSkKIApAQCAtMTQ5LDYgKzE1MSw3IEBAIHN0cnVjdCBtdGtfZGlzcF9tdXRleCB7CiAKIHN0
cnVjdCBtdGtfZGRwX2RhdGEgewogCWNvbnN0IHVuc2lnbmVkIGludCAqbXV0ZXhfbW9kOworCWNv
bnN0IHVuc2lnbmVkIGludCBtdXRleF9tb2RfcmVnOwogfTsKIAogc3RydWN0IG10a19kZHAgewpA
QCAtMjA4LDE0ICsyMTEsMTcgQEAgc3RydWN0IG10a19kZHAgewogCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG10a19kZHBfZGF0YSBtdDI3MDFfZGRwX2RyaXZlcl9kYXRhID0gewogCS5tdXRleF9tb2Qg
PSBtdDI3MDFfbXV0ZXhfbW9kLAorCS5tdXRleF9tb2RfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgw
X01PRDAsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBtdDI3MTJfZGRw
X2RyaXZlcl9kYXRhID0gewogCS5tdXRleF9tb2QgPSBtdDI3MTJfbXV0ZXhfbW9kLAorCS5tdXRl
eF9tb2RfcmVnID0gTVQyNzAxX0RJU1BfTVVURVgwX01PRDAsCiB9OwogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IG10a19kZHBfZGF0YSBtdDgxNzNfZGRwX2RyaXZlcl9kYXRhID0gewogCS5tdXRleF9t
b2QgPSBtdDgxNzNfbXV0ZXhfbW9kLAorCS5tdXRleF9tb2RfcmVnID0gTVQyNzAxX0RJU1BfTVVU
RVgwX01PRDAsCiB9OwogCiBzdGF0aWMgdW5zaWduZWQgaW50IG10a19kZHBfbW91dF9lbihlbnVt
IG10a19kZHBfY29tcF9pZCBjdXIsCkBAIC00ODEsNyArNDg3LDggQEAgdm9pZCBtdGtfZGlzcF9t
dXRleF9hZGRfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAogCQlicmVhazsKIAlk
ZWZhdWx0OgogCQlpZiAoZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdIDwgMzIpIHsKLQkJCW9mZnNl
dCA9IERJU1BfUkVHX01VVEVYX01PRChtdXRleC0+aWQpOworCQkJb2Zmc2V0ID0gRElTUF9SRUdf
TVVURVhfTU9EKGRkcC0+ZGF0YS0+bXV0ZXhfbW9kX3JlZywKKwkJCQkJCSAgICBtdXRleC0+aWQp
OwogCQkJcmVnID0gcmVhZGxfcmVsYXhlZChkZHAtPnJlZ3MgKyBvZmZzZXQpOwogCQkJcmVnIHw9
IDEgPDwgZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdOwogCQkJd3JpdGVsX3JlbGF4ZWQocmVnLCBk
ZHAtPnJlZ3MgKyBvZmZzZXQpOwpAQCAtNTE5LDcgKzUyNiw4IEBAIHZvaWQgbXRrX2Rpc3BfbXV0
ZXhfcmVtb3ZlX2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAkJYnJlYWs7CiAJ
ZGVmYXVsdDoKIAkJaWYgKGRkcC0+ZGF0YS0+bXV0ZXhfbW9kW2lkXSA8IDMyKSB7Ci0JCQlvZmZz
ZXQgPSBESVNQX1JFR19NVVRFWF9NT0QobXV0ZXgtPmlkKTsKKwkJCW9mZnNldCA9IERJU1BfUkVH
X01VVEVYX01PRChkZHAtPmRhdGEtPm11dGV4X21vZF9yZWcsCisJCQkJCQkgICAgbXV0ZXgtPmlk
KTsKIAkJCXJlZyA9IHJlYWRsX3JlbGF4ZWQoZGRwLT5yZWdzICsgb2Zmc2V0KTsKIAkJCXJlZyAm
PSB+KDEgPDwgZGRwLT5kYXRhLT5tdXRleF9tb2RbaWRdKTsKIAkJCXdyaXRlbF9yZWxheGVkKHJl
ZywgZGRwLT5yZWdzICsgb2Zmc2V0KTsKLS0gCjEuOC4xLjEuZGlydHkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

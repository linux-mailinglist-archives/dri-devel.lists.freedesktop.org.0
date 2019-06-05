Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB436CDB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC77989624;
	Thu,  6 Jun 2019 07:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7624D898E4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:48:57 +0000 (UTC)
X-UUID: 1821765d9ed045aebf01f57ddda453c0-20190605
X-UUID: 1821765d9ed045aebf01f57ddda453c0-20190605
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 985871829; Wed, 05 Jun 2019 19:43:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:42 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 07/27] drm/mediatek: add mutex mod register offset into ddp private
 data
Date: Wed, 5 Jun 2019 19:42:46 +0800
Message-ID: <1559734986-7379-8-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 48601DB269F65FAEFC1C49303F9239FAB7DC8461D5EECD2BC6C07EF2F365449E2000:8
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgptdXRleCBt
b2QgcmVnaXN0ZXIgb2Zmc2V0IHdpbGwgYmUgcHJpdmF0ZSBkYXRhIG9mIGRkcC4KClNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgMTQgKysrKysrKysrKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKaW5kZXggYWU5NGQ0NC4uOGJkZTJjZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKQEAgLTQxLDEwICs0MSwxMiBAQAog
I2RlZmluZSBESVNQX1JFR19DT05GSUdfRFNJX1NFTAkJCTB4MDUwCiAjZGVmaW5lIERJU1BfUkVH
X0NPTkZJR19EUElfU0VMCQkJMHgwNjQKIAorI2RlZmluZSBNVDI3MDFfRElTUF9NVVRFWDBfTU9E
MAkJCTB4MmMKKwogI2RlZmluZSBESVNQX1JFR19NVVRFWF9FTihuKQkJCSgweDIwICsgMHgyMCAq
IChuKSkKICNkZWZpbmUgRElTUF9SRUdfTVVURVgobikJCQkoMHgyNCArIDB4MjAgKiAobikpCiAj
ZGVmaW5lIERJU1BfUkVHX01VVEVYX1JTVChuKQkJCSgweDI4ICsgMHgyMCAqIChuKSkKLSNkZWZp
bmUgRElTUF9SRUdfTVVURVhfTU9EKG4pCQkJKDB4MmMgKyAweDIwICogKG4pKQorI2RlZmluZSBE
SVNQX1JFR19NVVRFWF9NT0QobXV0ZXhfbW9kX3JlZywgbikJKG11dGV4X21vZF9yZWcgKyAweDIw
ICogKG4pKQogI2RlZmluZSBESVNQX1JFR19NVVRFWF9TT0YobikJCQkoMHgzMCArIDB4MjAgKiAo
bikpCiAjZGVmaW5lIERJU1BfUkVHX01VVEVYX01PRDIobikJCQkoMHgzNCArIDB4MjAgKiAobikp
CiAKQEAgLTE0OSw2ICsxNTEsNyBAQCBzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggewogCiBzdHJ1Y3Qg
bXRrX2RkcF9kYXRhIHsKIAljb25zdCB1bnNpZ25lZCBpbnQgKm11dGV4X21vZDsKKwljb25zdCB1
bnNpZ25lZCBpbnQgbXV0ZXhfbW9kX3JlZzsKIH07CiAKIHN0cnVjdCBtdGtfZGRwIHsKQEAgLTIw
OCwxNCArMjExLDE3IEBAIHN0cnVjdCBtdGtfZGRwIHsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfZGRwX2RhdGEgbXQyNzAxX2RkcF9kcml2ZXJfZGF0YSA9IHsKIAkubXV0ZXhfbW9kID0gbXQy
NzAxX211dGV4X21vZCwKKwkubXV0ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9NT0Qw
LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2RhdGEgbXQyNzEyX2RkcF9kcml2
ZXJfZGF0YSA9IHsKIAkubXV0ZXhfbW9kID0gbXQyNzEyX211dGV4X21vZCwKKwkubXV0ZXhfbW9k
X3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9NT0QwLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBtdGtfZGRwX2RhdGEgbXQ4MTczX2RkcF9kcml2ZXJfZGF0YSA9IHsKIAkubXV0ZXhfbW9kID0g
bXQ4MTczX211dGV4X21vZCwKKwkubXV0ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9N
T0QwLAogfTsKIAogc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtf
ZGRwX2NvbXBfaWQgY3VyLApAQCAtNDgxLDcgKzQ4Nyw4IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhf
YWRkX2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAkJYnJlYWs7CiAJZGVmYXVs
dDoKIAkJaWYgKGRkcC0+ZGF0YS0+bXV0ZXhfbW9kW2lkXSA8IDMyKSB7Ci0JCQlvZmZzZXQgPSBE
SVNQX1JFR19NVVRFWF9NT0QobXV0ZXgtPmlkKTsKKwkJCW9mZnNldCA9IERJU1BfUkVHX01VVEVY
X01PRChkZHAtPmRhdGEtPm11dGV4X21vZF9yZWcsCisJCQkJCQkgICAgbXV0ZXgtPmlkKTsKIAkJ
CXJlZyA9IHJlYWRsX3JlbGF4ZWQoZGRwLT5yZWdzICsgb2Zmc2V0KTsKIAkJCXJlZyB8PSAxIDw8
IGRkcC0+ZGF0YS0+bXV0ZXhfbW9kW2lkXTsKIAkJCXdyaXRlbF9yZWxheGVkKHJlZywgZGRwLT5y
ZWdzICsgb2Zmc2V0KTsKQEAgLTUxOSw3ICs1MjYsOCBAQCB2b2lkIG10a19kaXNwX211dGV4X3Jl
bW92ZV9jb21wKHN0cnVjdCBtdGtfZGlzcF9tdXRleCAqbXV0ZXgsCiAJCWJyZWFrOwogCWRlZmF1
bHQ6CiAJCWlmIChkZHAtPmRhdGEtPm11dGV4X21vZFtpZF0gPCAzMikgewotCQkJb2Zmc2V0ID0g
RElTUF9SRUdfTVVURVhfTU9EKG11dGV4LT5pZCk7CisJCQlvZmZzZXQgPSBESVNQX1JFR19NVVRF
WF9NT0QoZGRwLT5kYXRhLT5tdXRleF9tb2RfcmVnLAorCQkJCQkJICAgIG11dGV4LT5pZCk7CiAJ
CQlyZWcgPSByZWFkbF9yZWxheGVkKGRkcC0+cmVncyArIG9mZnNldCk7CiAJCQlyZWcgJj0gfigx
IDw8IGRkcC0+ZGF0YS0+bXV0ZXhfbW9kW2lkXSk7CiAJCQl3cml0ZWxfcmVsYXhlZChyZWcsIGRk
cC0+cmVncyArIG9mZnNldCk7Ci0tIAoxLjguMS4xLmRpcnR5CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

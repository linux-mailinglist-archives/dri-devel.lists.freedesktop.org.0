Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E7A328B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55BF6E2F5;
	Fri, 30 Aug 2019 08:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A6506E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:15 +0000 (UTC)
X-UUID: 813655c447fa40b3a3d8bbc9181b1351-20190829
X-UUID: 813655c447fa40b3a3d8bbc9181b1351-20190829
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 901347666; Thu, 29 Aug 2019 22:51:10 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:13 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5,
 08/32] drm/mediatek: add mutex mod register offset into ddp private
 data
Date: Thu, 29 Aug 2019 22:50:30 +0800
Message-ID: <1567090254-15566-9-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgptdXRleCBt
b2QgcmVnaXN0ZXIgb2Zmc2V0IHdpbGwgYmUgcHJpdmF0ZSBkYXRhIG9mIGRkcC4KClNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgpSZXZpZXdl
ZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHAuYyB8IDI0ICsrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuYwppbmRleCBiNmNjM2Q4Li5hZTIyZTIxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwpAQCAtMzMsMTIgKzMzLDE0IEBACiAjZGVmaW5l
IERJU1BfUkVHX0NPTkZJR19EU0lfU0VMCQkJMHgwNTAKICNkZWZpbmUgRElTUF9SRUdfQ09ORklH
X0RQSV9TRUwJCQkweDA2NAogCi0jZGVmaW5lIERJU1BfUkVHX01VVEVYX0VOKG4pCSgweDIwICsg
MHgyMCAqIChuKSkKLSNkZWZpbmUgRElTUF9SRUdfTVVURVgobikJKDB4MjQgKyAweDIwICogKG4p
KQotI2RlZmluZSBESVNQX1JFR19NVVRFWF9SU1QobikJKDB4MjggKyAweDIwICogKG4pKQotI2Rl
ZmluZSBESVNQX1JFR19NVVRFWF9NT0QobikJKDB4MmMgKyAweDIwICogKG4pKQotI2RlZmluZSBE
SVNQX1JFR19NVVRFWF9TT0YobikJKDB4MzAgKyAweDIwICogKG4pKQotI2RlZmluZSBESVNQX1JF
R19NVVRFWF9NT0QyKG4pCSgweDM0ICsgMHgyMCAqIChuKSkKKyNkZWZpbmUgTVQyNzAxX0RJU1Bf
TVVURVgwX01PRDAJCQkweDJjCisKKyNkZWZpbmUgRElTUF9SRUdfTVVURVhfRU4obikJCQkoMHgy
MCArIDB4MjAgKiAobikpCisjZGVmaW5lIERJU1BfUkVHX01VVEVYKG4pCQkJKDB4MjQgKyAweDIw
ICogKG4pKQorI2RlZmluZSBESVNQX1JFR19NVVRFWF9SU1QobikJCQkoMHgyOCArIDB4MjAgKiAo
bikpCisjZGVmaW5lIERJU1BfUkVHX01VVEVYX01PRChtdXRleF9tb2RfcmVnLCBuKQkobXV0ZXhf
bW9kX3JlZyArIDB4MjAgKiAobikpCisjZGVmaW5lIERJU1BfUkVHX01VVEVYX1NPRihuKQkJCSgw
eDMwICsgMHgyMCAqIChuKSkKKyNkZWZpbmUgRElTUF9SRUdfTVVURVhfTU9EMihuKQkJCSgweDM0
ICsgMHgyMCAqIChuKSkKIAogI2RlZmluZSBJTlRfTVVURVgJCQkJQklUKDEpCiAKQEAgLTE0MSw2
ICsxNDMsNyBAQCBzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggewogCiBzdHJ1Y3QgbXRrX2RkcF9kYXRh
IHsKIAljb25zdCB1bnNpZ25lZCBpbnQgKm11dGV4X21vZDsKKwljb25zdCB1bnNpZ25lZCBpbnQg
bXV0ZXhfbW9kX3JlZzsKIH07CiAKIHN0cnVjdCBtdGtfZGRwIHsKQEAgLTIwMCwxNCArMjAzLDE3
IEBAIHN0cnVjdCBtdGtfZGRwIHsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2RhdGEg
bXQyNzAxX2RkcF9kcml2ZXJfZGF0YSA9IHsKIAkubXV0ZXhfbW9kID0gbXQyNzAxX211dGV4X21v
ZCwKKwkubXV0ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9NT0QwLAogfTsKIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2RhdGEgbXQyNzEyX2RkcF9kcml2ZXJfZGF0YSA9IHsK
IAkubXV0ZXhfbW9kID0gbXQyNzEyX211dGV4X21vZCwKKwkubXV0ZXhfbW9kX3JlZyA9IE1UMjcw
MV9ESVNQX01VVEVYMF9NT0QwLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2Rh
dGEgbXQ4MTczX2RkcF9kcml2ZXJfZGF0YSA9IHsKIAkubXV0ZXhfbW9kID0gbXQ4MTczX211dGV4
X21vZCwKKwkubXV0ZXhfbW9kX3JlZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9NT0QwLAogfTsKIAog
c3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQg
Y3VyLApAQCAtNDczLDcgKzQ3OSw4IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfYWRkX2NvbXAoc3Ry
dWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJaWYgKGRk
cC0+ZGF0YS0+bXV0ZXhfbW9kW2lkXSA8IDMyKSB7Ci0JCQlvZmZzZXQgPSBESVNQX1JFR19NVVRF
WF9NT0QobXV0ZXgtPmlkKTsKKwkJCW9mZnNldCA9IERJU1BfUkVHX01VVEVYX01PRChkZHAtPmRh
dGEtPm11dGV4X21vZF9yZWcsCisJCQkJCQkgICAgbXV0ZXgtPmlkKTsKIAkJCXJlZyA9IHJlYWRs
X3JlbGF4ZWQoZGRwLT5yZWdzICsgb2Zmc2V0KTsKIAkJCXJlZyB8PSAxIDw8IGRkcC0+ZGF0YS0+
bXV0ZXhfbW9kW2lkXTsKIAkJCXdyaXRlbF9yZWxheGVkKHJlZywgZGRwLT5yZWdzICsgb2Zmc2V0
KTsKQEAgLTUxMSw3ICs1MTgsOCBAQCB2b2lkIG10a19kaXNwX211dGV4X3JlbW92ZV9jb21wKHN0
cnVjdCBtdGtfZGlzcF9tdXRleCAqbXV0ZXgsCiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWlmIChk
ZHAtPmRhdGEtPm11dGV4X21vZFtpZF0gPCAzMikgewotCQkJb2Zmc2V0ID0gRElTUF9SRUdfTVVU
RVhfTU9EKG11dGV4LT5pZCk7CisJCQlvZmZzZXQgPSBESVNQX1JFR19NVVRFWF9NT0QoZGRwLT5k
YXRhLT5tdXRleF9tb2RfcmVnLAorCQkJCQkJICAgIG11dGV4LT5pZCk7CiAJCQlyZWcgPSByZWFk
bF9yZWxheGVkKGRkcC0+cmVncyArIG9mZnNldCk7CiAJCQlyZWcgJj0gfigxIDw8IGRkcC0+ZGF0
YS0+bXV0ZXhfbW9kW2lkXSk7CiAJCQl3cml0ZWxfcmVsYXhlZChyZWcsIGRkcC0+cmVncyArIG9m
ZnNldCk7Ci0tIAoxLjguMS4xLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

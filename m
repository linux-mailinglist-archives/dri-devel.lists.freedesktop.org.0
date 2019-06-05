Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8C36CE1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A6789709;
	Thu,  6 Jun 2019 07:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93DB898FD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:49:02 +0000 (UTC)
X-UUID: 9c66013344c54c2493c645a8995303be-20190605
X-UUID: 9c66013344c54c2493c645a8995303be-20190605
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 755208871; Wed, 05 Jun 2019 19:43:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:50 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 17/27] drm/mediatek: add gmc_bits for ovl private data
Date: Wed, 5 Jun 2019 19:42:56 +0800
Message-ID: <1559734986-7379-18-git-send-email-yongqiang.niu@mediatek.com>
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGlzIHBh
dGNoIGFkZCBnbWNfYml0cyBmb3Igb3ZsIHByaXZhdGUgZGF0YQpHTUMgcmVnaXN0ZXIgd2FzIHNl
dCBSRE1BIHVsdHJhIGFuZCBwcmUtdWx0cmEgdGhyZXNob2xkLgoxMGJpdCBHTUMgcmVnaXN0ZXIg
ZGVmaW5lIGlzIGRpZmZlcmVudCB3aXRoIG90aGVyIFNPQywgZ21jX3RocnNoZF9sIG5vdAp1c2Vk
LgoKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwppbmRl
eCAyOGQxOTExLi5hZmIzMTNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jCkBAIC0zOSw3ICszOSw5IEBACiAjZGVmaW5lIERJU1BfUkVHX09WTF9BRERSX01UODE3MwkJ
MHgwZjQwCiAjZGVmaW5lIERJU1BfUkVHX09WTF9BRERSKG92bCwgbikJCSgob3ZsKS0+ZGF0YS0+
YWRkciArIDB4MjAgKiAobikpCiAKLSNkZWZpbmUJT1ZMX1JETUFfTUVNX0dNQwkweDQwNDAyMDIw
CisjZGVmaW5lIEdNQ19USFJFU0hPTERfQklUUwkxNgorI2RlZmluZSBHTUNfVEhSRVNIT0xEX0hJ
R0gJKCgxIDw8IEdNQ19USFJFU0hPTERfQklUUykgLyA0KQorI2RlZmluZSBHTUNfVEhSRVNIT0xE
X0xPVwkoKDEgPDwgR01DX1RIUkVTSE9MRF9CSVRTKSAvIDgpCiAKICNkZWZpbmUgT1ZMX0NPTl9C
WVRFX1NXQVAJQklUKDI0KQogI2RlZmluZSBPVkxfQ09OX01UWF9ZVVZfVE9fUkdCCSg2IDw8IDE2
KQpAQCAtNTcsNiArNTksNyBAQAogCiBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgewogCXVuc2ln
bmVkIGludCBhZGRyOworCXVuc2lnbmVkIGludCBnbWNfYml0czsKIAlib29sIGZtdF9yZ2I1NjVf
aXNfMDsKIH07CiAKQEAgLTE0MCw5ICsxNDMsMjMgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtf
b3ZsX2xheWVyX25yKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCiBzdGF0aWMgdm9pZCBtdGtf
b3ZsX2xheWVyX29uKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBpZHgp
CiB7CiAJdW5zaWduZWQgaW50IHJlZzsKKwl1bnNpZ25lZCBpbnQgZ21jX3RocnNoZF9sOworCXVu
c2lnbmVkIGludCBnbWNfdGhyc2hkX2g7CisJdW5zaWduZWQgaW50IGdtY192YWx1ZTsKKwlzdHJ1
Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwgPSBjb21wX3RvX292bChjb21wKTsKIAogCXdyaXRlbCgweDEs
IGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfUkRNQV9DVFJMKGlkeCkpOwotCXdyaXRlbChPVkxf
UkRNQV9NRU1fR01DLCBjb21wLT5yZWdzICsgRElTUF9SRUdfT1ZMX1JETUFfR01DKGlkeCkpOwor
CisJZ21jX3RocnNoZF9sID0gR01DX1RIUkVTSE9MRF9MT1cgPj4KKwkJICAgICAgKEdNQ19USFJF
U0hPTERfQklUUyAtIG92bC0+ZGF0YS0+Z21jX2JpdHMpOworCWdtY190aHJzaGRfaCA9IEdNQ19U
SFJFU0hPTERfSElHSCA+PgorCQkgICAgICAoR01DX1RIUkVTSE9MRF9CSVRTIC0gb3ZsLT5kYXRh
LT5nbWNfYml0cyk7CisJaWYgKG92bC0+ZGF0YS0+Z21jX2JpdHMgPT0gMTApCisJCWdtY192YWx1
ZSA9IGdtY190aHJzaGRfaCB8IGdtY190aHJzaGRfaCA8PCAxNjsKKwllbHNlCisJCWdtY192YWx1
ZSA9IGdtY190aHJzaGRfbCB8IGdtY190aHJzaGRfbCA8PCA4IHwKKwkJCSAgICBnbWNfdGhyc2hk
X2ggPDwgMTYgfCBnbWNfdGhyc2hkX2ggPDwgMjQ7CisJd3JpdGVsKGdtY192YWx1ZSwgY29tcC0+
cmVncyArIERJU1BfUkVHX09WTF9SRE1BX0dNQyhpZHgpKTsKIAogCXJlZyA9IHJlYWRsKGNvbXAt
PnJlZ3MgKyBESVNQX1JFR19PVkxfU1JDX0NPTik7CiAJcmVnID0gcmVnIHwgQklUKGlkeCk7CkBA
IC0zMjQsMTEgKzM0MSwxMyBAQCBzdGF0aWMgaW50IG10a19kaXNwX292bF9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9v
dmxfZGF0YSBtdDI3MDFfb3ZsX2RyaXZlcl9kYXRhID0gewogCS5hZGRyID0gRElTUF9SRUdfT1ZM
X0FERFJfTVQyNzAxLAorCS5nbWNfYml0cyA9IDgsCiAJLmZtdF9yZ2I1NjVfaXNfMCA9IGZhbHNl
LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0YSBtdDgxNzNfb3Zs
X2RyaXZlcl9kYXRhID0gewogCS5hZGRyID0gRElTUF9SRUdfT1ZMX0FERFJfTVQ4MTczLAorCS5n
bWNfYml0cyA9IDgsCiAJLmZtdF9yZ2I1NjVfaXNfMCA9IHRydWUsCiB9OwogCi0tIAoxLjguMS4x
LmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

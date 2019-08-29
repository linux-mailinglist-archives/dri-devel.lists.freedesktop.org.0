Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A826FA327C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD286E2D1;
	Fri, 30 Aug 2019 08:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id D65B96E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:21 +0000 (UTC)
X-UUID: 0173c9cad35944a2ba9ccfe670b29e71-20190829
X-UUID: 0173c9cad35944a2ba9ccfe670b29e71-20190829
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2107189064; Thu, 29 Aug 2019 22:51:18 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:22 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 18/32] drm/mediatek: add gmc_bits for ovl private data
Date: Thu, 29 Aug 2019 22:50:40 +0800
Message-ID: <1567090254-15566-19-git-send-email-yongqiang.niu@mediatek.com>
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGlzIHBh
dGNoIGFkZCBnbWNfYml0cyBmb3Igb3ZsIHByaXZhdGUgZGF0YQpHTUMgcmVnaXN0ZXIgd2FzIHNl
dCBSRE1BIHVsdHJhIGFuZCBwcmUtdWx0cmEgdGhyZXNob2xkLgoxMGJpdCBHTUMgcmVnaXN0ZXIg
ZGVmaW5lIGlzIGRpZmZlcmVudCB3aXRoIG90aGVyIFNPQywgZ21jX3RocnNoZF9sIG5vdAp1c2Vk
LgoKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20+ClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDIzICsrKysrKysrKysrKysrKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKaW5kZXggYzRmMDdjMi4uODJlYWVm
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwpAQCAtMzEsNyArMzEs
OSBAQAogI2RlZmluZSBESVNQX1JFR19PVkxfQUREUl9NVDgxNzMJCTB4MGY0MAogI2RlZmluZSBE
SVNQX1JFR19PVkxfQUREUihvdmwsIG4pCQkoKG92bCktPmRhdGEtPmFkZHIgKyAweDIwICogKG4p
KQogCi0jZGVmaW5lCU9WTF9SRE1BX01FTV9HTUMJMHg0MDQwMjAyMAorI2RlZmluZSBHTUNfVEhS
RVNIT0xEX0JJVFMJMTYKKyNkZWZpbmUgR01DX1RIUkVTSE9MRF9ISUdICSgoMSA8PCBHTUNfVEhS
RVNIT0xEX0JJVFMpIC8gNCkKKyNkZWZpbmUgR01DX1RIUkVTSE9MRF9MT1cJKCgxIDw8IEdNQ19U
SFJFU0hPTERfQklUUykgLyA4KQogCiAjZGVmaW5lIE9WTF9DT05fQllURV9TV0FQCUJJVCgyNCkK
ICNkZWZpbmUgT1ZMX0NPTl9NVFhfWVVWX1RPX1JHQgkoNiA8PCAxNikKQEAgLTQ5LDYgKzUxLDcg
QEAKIAogc3RydWN0IG10a19kaXNwX292bF9kYXRhIHsKIAl1bnNpZ25lZCBpbnQgYWRkcjsKKwl1
bnNpZ25lZCBpbnQgZ21jX2JpdHM7CiAJYm9vbCBmbXRfcmdiNTY1X2lzXzA7CiB9OwogCkBAIC0x
MzIsOSArMTM1LDIzIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX292bF9sYXllcl9ucihzdHJ1
Y3QgbXRrX2RkcF9jb21wICpjb21wKQogc3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9vbihzdHJ1
Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgaWR4KQogewogCXVuc2lnbmVkIGlu
dCByZWc7CisJdW5zaWduZWQgaW50IGdtY190aHJzaGRfbDsKKwl1bnNpZ25lZCBpbnQgZ21jX3Ro
cnNoZF9oOworCXVuc2lnbmVkIGludCBnbWNfdmFsdWU7CisJc3RydWN0IG10a19kaXNwX292bCAq
b3ZsID0gY29tcF90b19vdmwoY29tcCk7CiAKIAl3cml0ZWwoMHgxLCBjb21wLT5yZWdzICsgRElT
UF9SRUdfT1ZMX1JETUFfQ1RSTChpZHgpKTsKLQl3cml0ZWwoT1ZMX1JETUFfTUVNX0dNQywgY29t
cC0+cmVncyArIERJU1BfUkVHX09WTF9SRE1BX0dNQyhpZHgpKTsKKworCWdtY190aHJzaGRfbCA9
IEdNQ19USFJFU0hPTERfTE9XID4+CisJCSAgICAgIChHTUNfVEhSRVNIT0xEX0JJVFMgLSBvdmwt
PmRhdGEtPmdtY19iaXRzKTsKKwlnbWNfdGhyc2hkX2ggPSBHTUNfVEhSRVNIT0xEX0hJR0ggPj4K
KwkJICAgICAgKEdNQ19USFJFU0hPTERfQklUUyAtIG92bC0+ZGF0YS0+Z21jX2JpdHMpOworCWlm
IChvdmwtPmRhdGEtPmdtY19iaXRzID09IDEwKQorCQlnbWNfdmFsdWUgPSBnbWNfdGhyc2hkX2gg
fCBnbWNfdGhyc2hkX2ggPDwgMTY7CisJZWxzZQorCQlnbWNfdmFsdWUgPSBnbWNfdGhyc2hkX2wg
fCBnbWNfdGhyc2hkX2wgPDwgOCB8CisJCQkgICAgZ21jX3RocnNoZF9oIDw8IDE2IHwgZ21jX3Ro
cnNoZF9oIDw8IDI0OworCXdyaXRlbChnbWNfdmFsdWUsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19P
VkxfUkRNQV9HTUMoaWR4KSk7CiAKIAlyZWcgPSByZWFkbChjb21wLT5yZWdzICsgRElTUF9SRUdf
T1ZMX1NSQ19DT04pOwogCXJlZyA9IHJlZyB8IEJJVChpZHgpOwpAQCAtMzE2LDExICszMzMsMTMg
QEAgc3RhdGljIGludCBtdGtfZGlzcF9vdmxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgbXQyNzAxX292
bF9kcml2ZXJfZGF0YSA9IHsKIAkuYWRkciA9IERJU1BfUkVHX09WTF9BRERSX01UMjcwMSwKKwku
Z21jX2JpdHMgPSA4LAogCS5mbXRfcmdiNTY1X2lzXzAgPSBmYWxzZSwKIH07CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgbXQ4MTczX292bF9kcml2ZXJfZGF0YSA9IHsK
IAkuYWRkciA9IERJU1BfUkVHX09WTF9BRERSX01UODE3MywKKwkuZ21jX2JpdHMgPSA4LAogCS5m
bXRfcmdiNTY1X2lzXzAgPSB0cnVlLAogfTsKIAotLSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE58836CC9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29858940F;
	Thu,  6 Jun 2019 07:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77620898CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:49:11 +0000 (UTC)
X-UUID: 0d9c16dd5943426783345f622b4e8f32-20190605
X-UUID: 0d9c16dd5943426783345f622b4e8f32-20190605
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1308283880; Wed, 05 Jun 2019 19:43:54 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:52 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 19/27] drm/mediatek: add function to background color input select
 for ovl/ovl_2l direct link
Date: Wed, 5 Jun 2019 19:42:58 +0800
Message-ID: <1559734986-7379-20-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBmdW5jdGlvbiB0byBiYWNrZ3JvdW5kIGNvbG9yIGlucHV0IHNlbGVjdCBmb3Igb3Zs
L292bF8ybCBkaXJlY3QgbGluawpmb3Igb3ZsL292bF8ybCBkaXJlY3QgbGluayB1c2VjYXNlLCB3
ZSBuZWVkIHNldCBiYWNrZ3JvdW5kIGNvbG9yCmlucHV0IHNlbGVjdCBmb3IgdGhlc2UgaGFyZHdh
cmUuCnRoaXMgaXMgcHJlcGFyYXRpb24gcGF0Y2ggZm9yIG92bC9vdmxfMmwgdXNlY2FzZQoKU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDE2ICsrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKaW5kZXggMTU4YzFlNS4uYWExZTE4
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCkBAIC05
Miw2ICs5Miw5IEBAIHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3MgewogCQkJICAgICBzdHJ1Y3Qg
bXRrX3BsYW5lX3N0YXRlICpzdGF0ZSk7CiAJdm9pZCAoKmdhbW1hX3NldCkoc3RydWN0IG10a19k
ZHBfY29tcCAqY29tcCwKIAkJCSAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSk7CisJdm9p
ZCAoKmJnY2xyX2luX29uKShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLAorCQkJICAgIGVudW0g
bXRrX2RkcF9jb21wX2lkIHByZXYpOworCXZvaWQgKCpiZ2Nscl9pbl9vZmYpKHN0cnVjdCBtdGtf
ZGRwX2NvbXAgKmNvbXApOwogfTsKIAogc3RydWN0IG10a19kZHBfY29tcCB7CkBAIC0xNzMsNiAr
MTc2LDE5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtdGtfZGRwX2dhbW1hX3NldChzdHJ1Y3QgbXRr
X2RkcF9jb21wICpjb21wLAogCQljb21wLT5mdW5jcy0+Z2FtbWFfc2V0KGNvbXAsIHN0YXRlKTsK
IH0KIAorc3RhdGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9iZ2Nscl9pbl9vbihzdHJ1Y3Qg
bXRrX2RkcF9jb21wICpjb21wLAorCQkJCQkgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgcHJldikK
K3sKKwlpZiAoY29tcC0+ZnVuY3MgJiYgY29tcC0+ZnVuY3MtPmJnY2xyX2luX29uKQorCQljb21w
LT5mdW5jcy0+YmdjbHJfaW5fb24oY29tcCwgcHJldik7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9p
ZCBtdGtfZGRwX2NvbXBfYmdjbHJfaW5fb2ZmKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCit7
CisJaWYgKGNvbXAtPmZ1bmNzICYmIGNvbXAtPmZ1bmNzLT5iZ2Nscl9pbl9vZmYpCisJCWNvbXAt
PmZ1bmNzLT5iZ2Nscl9pbl9vZmYoY29tcCk7Cit9CisKIGludCBtdGtfZGRwX2NvbXBfZ2V0X2lk
KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKIAkJCWVudW0gbXRrX2RkcF9jb21wX3R5cGUgY29t
cF90eXBlKTsKIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqY29tcF9ub2RlLAotLSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

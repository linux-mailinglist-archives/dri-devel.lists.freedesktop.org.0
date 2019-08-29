Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1981DA329C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FC36E31C;
	Fri, 30 Aug 2019 08:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id D668F6E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:27 +0000 (UTC)
X-UUID: b5357d302721483eb95155d1c616f07b-20190829
X-UUID: b5357d302721483eb95155d1c616f07b-20190829
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 891725687; Thu, 29 Aug 2019 22:51:23 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:27 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 23/32] drm/mediatek: distinguish ovl and ovl_2l by layer_nr
Date: Thu, 29 Aug 2019 22:50:45 +0800
Message-ID: <1567090254-15566-24-git-send-email-yongqiang.niu@mediatek.com>
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

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpkaXN0aW5n
dWlzaCBvdmwgYW5kIG92bF8ybCBieSBsYXllcl9uciB3aGVuIGdldCBjb21wCmlkCgpTaWduZWQt
b2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KUmV2aWV3
ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX292bC5jIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX292bC5jCmluZGV4IGViM2JmODUuLjUzZjM4ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3Bfb3ZsLmMKQEAgLTMxOCw3ICszMTgsMTIgQEAgc3RhdGljIGludCBtdGtfZGlz
cF9vdmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoaXJxIDwgMCkK
IAkJcmV0dXJuIGlycTsKIAotCWNvbXBfaWQgPSBtdGtfZGRwX2NvbXBfZ2V0X2lkKGRldi0+b2Zf
bm9kZSwgTVRLX0RJU1BfT1ZMKTsKKwlwcml2LT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKGRldik7CisKKwljb21wX2lkID0gbXRrX2RkcF9jb21wX2dldF9pZChkZXYtPm9mX25vZGUs
CisJCQkJICAgICAgcHJpdi0+ZGF0YS0+bGF5ZXJfbnIgPT0gNCA/CisJCQkJICAgICAgTVRLX0RJ
U1BfT1ZMIDoKKwkJCQkgICAgICBNVEtfRElTUF9PVkxfMkwpOwogCWlmIChjb21wX2lkIDwgMCkg
ewogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpZGVudGlmeSBieSBhbGlhczogJWRcbiIsIGNv
bXBfaWQpOwogCQlyZXR1cm4gY29tcF9pZDsKQEAgLTMzMSw4ICszMzYsNiBAQCBzdGF0aWMgaW50
IG10a19kaXNwX292bF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1
cm4gcmV0OwogCX0KIAotCXByaXYtPmRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2
KTsKLQogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHByaXYpOwogCiAJcmV0ID0gZGV2bV9y
ZXF1ZXN0X2lycShkZXYsIGlycSwgbXRrX2Rpc3Bfb3ZsX2lycV9oYW5kbGVyLAotLSAKMS44LjEu
MS5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

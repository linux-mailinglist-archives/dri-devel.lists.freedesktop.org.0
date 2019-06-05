Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B38536CE2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D97B8975F;
	Thu,  6 Jun 2019 07:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE9858991D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:49:04 +0000 (UTC)
X-UUID: ae3bf05384cf49a582a2984982586be8-20190605
X-UUID: ae3bf05384cf49a582a2984982586be8-20190605
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 751171304; Wed, 05 Jun 2019 19:43:59 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:57 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 25/27] drm/mediatek: add connection from RDMA1 to DSI0
Date: Wed, 5 Jun 2019 19:43:04 +0800
Message-ID: <1559734986-7379-26-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBjb25uZWN0aW9uIGZyb20gUkRNQTEgdG8gRFNJMAoKU2lnbmVkLW9mZi1ieTogWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKaW5kZXggYWRh
ZmE0MS4uOTk4NmM2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKQEAg
LTQ1Miw2ICs0NTIsOSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG10a19kZHBfc291dF9zZWwoY29u
c3Qgc3RydWN0IG10a19tbXN5c19yZWdfZGF0YSAqZGF0YSwKIAl9IGVsc2UgaWYgKGN1ciA9PSBE
RFBfQ09NUE9ORU5UX1JETUEwICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9DT0xPUjApIHsKIAkJ
KmFkZHIgPSBESVNQX1JFR19SRE1BMF9TT1VUX1NFTF9JTihkYXRhKTsKIAkJdmFsdWUgPSBESVNQ
X1JFR19SRE1BMF9TT1VUX0NPTE9SMChkYXRhKTsKKwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09N
UE9ORU5UX1JETUExICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EU0kwKSB7CisJCSphZGRyID0g
RElTUF9SRUdfUkRNQTFfU09VVF9TRUxfSU4oZGF0YSk7CisJCXZhbHVlID0gRElTUF9SRUdfUkRN
QTFfU09VVF9EU0kwKGRhdGEpOwogCX0gZWxzZSB7CiAJCXZhbHVlID0gMDsKIAl9Ci0tIAoxLjgu
MS4xLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

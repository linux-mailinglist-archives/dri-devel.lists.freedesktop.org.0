Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05F36CE6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8336896E7;
	Thu,  6 Jun 2019 07:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FBB898ED
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:48:56 +0000 (UTC)
X-UUID: 91ac2a3d7af34879a97a574f2cc5887a-20190605
X-UUID: 91ac2a3d7af34879a97a574f2cc5887a-20190605
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1481495413; Wed, 05 Jun 2019 19:43:50 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:49 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 15/27] drm/mediatek: add component OVL_2L1
Date: Wed, 5 Jun 2019 19:42:54 +0800
Message-ID: <1559734986-7379-16-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBjb21wb25lbnQgT1ZMXzJMMQoKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8
eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwppbmRleCA4MDk0OTI2
Li41YTBlYzBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMKQEAgLTI2OCw2ICsyNjgsNyBAQCBzdHJ1Y3QgbXRrX2RkcF9jb21wX21hdGNoIHsKIAlbRERQ
X0NPTVBPTkVOVF9PVkwwXQk9IHsgTVRLX0RJU1BfT1ZMLAkwLCBOVUxMIH0sCiAJW0REUF9DT01Q
T05FTlRfT1ZMMV0JPSB7IE1US19ESVNQX09WTCwJMSwgTlVMTCB9LAogCVtERFBfQ09NUE9ORU5U
X09WTF8yTDBdCT0geyBNVEtfRElTUF9PVkxfMkwsCTAsIE5VTEwgfSwKKwlbRERQX0NPTVBPTkVO
VF9PVkxfMkwxXQk9IHsgTVRLX0RJU1BfT1ZMXzJMLAkxLCBOVUxMIH0sCiAJW0REUF9DT01QT05F
TlRfUFdNMF0JPSB7IE1US19ESVNQX1BXTSwJMCwgTlVMTCB9LAogCVtERFBfQ09NUE9ORU5UX1BX
TTFdCT0geyBNVEtfRElTUF9QV00sCTEsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVOVF9QV00yXQk9
IHsgTVRLX0RJU1BfUFdNLAkyLCBOVUxMIH0sCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwX2NvbXAuaAppbmRleCBhODFjMzIyLi5kN2VmNDgwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKQEAgLTYwLDYgKzYwLDcgQEAgZW51bSBt
dGtfZGRwX2NvbXBfaWQgewogCUREUF9DT01QT05FTlRfT0QxLAogCUREUF9DT01QT05FTlRfT1ZM
MCwKIAlERFBfQ09NUE9ORU5UX09WTF8yTDAsCisJRERQX0NPTVBPTkVOVF9PVkxfMkwxLAogCURE
UF9DT01QT05FTlRfT1ZMMSwKIAlERFBfQ09NUE9ORU5UX1BXTTAsCiAJRERQX0NPTVBPTkVOVF9Q
V00xLAotLSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

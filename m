Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B73A3257
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192F26E28E;
	Fri, 30 Aug 2019 08:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B91A6E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:35 +0000 (UTC)
X-UUID: 44c749bcc5714e54be56a868be97e9d8-20190829
X-UUID: 44c749bcc5714e54be56a868be97e9d8-20190829
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1573109719; Thu, 29 Aug 2019 22:51:33 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:21 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 16/32] drm/mediatek: add component OVL_2L1
Date: Thu, 29 Aug 2019 22:50:38 +0800
Message-ID: <1567090254-15566-17-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95CB28BC8A4BF116A22F60F00B3B23575927A9989BC1E3F7916C9507B639A9882000:8
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
dGNoIGFkZCBjb21wb25lbnQgT1ZMXzJMMQoKU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8
eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVk
aWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAx
ICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKaW5kZXggNDIwMGY4OS4uYWY4ZTg3MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCkBAIC0yNjAsNiArMjYw
LDcgQEAgc3RydWN0IG10a19kZHBfY29tcF9tYXRjaCB7CiAJW0REUF9DT01QT05FTlRfT1ZMMF0J
PSB7IE1US19ESVNQX09WTCwJMCwgTlVMTCB9LAogCVtERFBfQ09NUE9ORU5UX09WTDFdCT0geyBN
VEtfRElTUF9PVkwsCTEsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVOVF9PVkxfMkwwXQk9IHsgTVRL
X0RJU1BfT1ZMXzJMLAkwLCBOVUxMIH0sCisJW0REUF9DT01QT05FTlRfT1ZMXzJMMV0JPSB7IE1U
S19ESVNQX09WTF8yTCwJMSwgTlVMTCB9LAogCVtERFBfQ09NUE9ORU5UX1BXTTBdCT0geyBNVEtf
RElTUF9QV00sCTAsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVOVF9QV00xXQk9IHsgTVRLX0RJU1Bf
UFdNLAkxLCBOVUxMIH0sCiAJW0REUF9DT01QT05FTlRfUFdNMl0JPSB7IE1US19ESVNQX1BXTSwJ
MiwgTlVMTCB9LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgK
aW5kZXggOWNhZWMyZC4uOTYyZDE0YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwX2NvbXAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oCkBAIC01Miw2ICs1Miw3IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsK
IAlERFBfQ09NUE9ORU5UX09EMSwKIAlERFBfQ09NUE9ORU5UX09WTDAsCiAJRERQX0NPTVBPTkVO
VF9PVkxfMkwwLAorCUREUF9DT01QT05FTlRfT1ZMXzJMMSwKIAlERFBfQ09NUE9ORU5UX09WTDEs
CiAJRERQX0NPTVBPTkVOVF9QV00wLAogCUREUF9DT01QT05FTlRfUFdNMSwKLS0gCjEuOC4xLjEu
ZGlydHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

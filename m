Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB136CE5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D617489791;
	Thu,  6 Jun 2019 07:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797DC898E4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:48:56 +0000 (UTC)
X-UUID: 35542e8c64f649158cd9cb35e84062b7-20190605
X-UUID: 35542e8c64f649158cd9cb35e84062b7-20190605
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2106281104; Wed, 05 Jun 2019 19:43:50 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:48 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 14/27] drm/mediatek: add commponent OVL_2L0
Date: Wed, 5 Jun 2019 19:42:53 +0800
Message-ID: <1559734986-7379-15-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBjb21tcG9uZW50IE9WTF8yTDAKClNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUg
PHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmMgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwppbmRleCAzMTBj
MGI5Li44MDk0OTI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMKQEAgLTIyNyw2ICsyMjcsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZ2FtbWFfc2V0KHN0cnVj
dCBtdGtfZGRwX2NvbXAgKmNvbXAsCiAKIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgbXRrX2Rk
cF9jb21wX3N0ZW1bTVRLX0REUF9DT01QX1RZUEVfTUFYXSA9IHsKIAlbTVRLX0RJU1BfT1ZMXSA9
ICJvdmwiLAorCVtNVEtfRElTUF9PVkxfMkxdID0gIm92bF8ybCIsCiAJW01US19ESVNQX1JETUFd
ID0gInJkbWEiLAogCVtNVEtfRElTUF9XRE1BXSA9ICJ3ZG1hIiwKIAlbTVRLX0RJU1BfQ09MT1Jd
ID0gImNvbG9yIiwKQEAgLTI2Niw2ICsyNjcsNyBAQCBzdHJ1Y3QgbXRrX2RkcF9jb21wX21hdGNo
IHsKIAlbRERQX0NPTVBPTkVOVF9PRDFdCT0geyBNVEtfRElTUF9PRCwJMSwgJmRkcF9vZCB9LAog
CVtERFBfQ09NUE9ORU5UX09WTDBdCT0geyBNVEtfRElTUF9PVkwsCTAsIE5VTEwgfSwKIAlbRERQ
X0NPTVBPTkVOVF9PVkwxXQk9IHsgTVRLX0RJU1BfT1ZMLAkxLCBOVUxMIH0sCisJW0REUF9DT01Q
T05FTlRfT1ZMXzJMMF0JPSB7IE1US19ESVNQX09WTF8yTCwJMCwgTlVMTCB9LAogCVtERFBfQ09N
UE9ORU5UX1BXTTBdCT0geyBNVEtfRElTUF9QV00sCTAsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVO
VF9QV00xXQk9IHsgTVRLX0RJU1BfUFdNLAkxLCBOVUxMIH0sCiAJW0REUF9DT01QT05FTlRfUFdN
Ml0JPSB7IE1US19ESVNQX1BXTSwJMiwgTlVMTCB9LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmgKaW5kZXggODdlZjI5MC4uYTgxYzMyMiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCkBAIC0yNSw2ICsyNSw3IEBACiAK
IGVudW0gbXRrX2RkcF9jb21wX3R5cGUgewogCU1US19ESVNQX09WTCwKKwlNVEtfRElTUF9PVkxf
MkwsCiAJTVRLX0RJU1BfUkRNQSwKIAlNVEtfRElTUF9XRE1BLAogCU1US19ESVNQX0NPTE9SLApA
QCAtNTgsNiArNTksNyBAQCBlbnVtIG10a19kZHBfY29tcF9pZCB7CiAJRERQX0NPTVBPTkVOVF9P
RDAsCiAJRERQX0NPTVBPTkVOVF9PRDEsCiAJRERQX0NPTVBPTkVOVF9PVkwwLAorCUREUF9DT01Q
T05FTlRfT1ZMXzJMMCwKIAlERFBfQ09NUE9ORU5UX09WTDEsCiAJRERQX0NPTVBPTkVOVF9QV00w
LAogCUREUF9DT01QT05FTlRfUFdNMSwKLS0gCjEuOC4xLjEuZGlydHkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

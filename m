Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC8A32A7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCAD6E345;
	Fri, 30 Aug 2019 08:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C6396E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:16 +0000 (UTC)
X-UUID: a0911236ab3a42ff9df3464780bc732c-20190829
X-UUID: a0911236ab3a42ff9df3464780bc732c-20190829
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1775298264; Thu, 29 Aug 2019 22:51:15 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:20 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 15/32] drm/mediatek: add commponent OVL_2L0
Date: Thu, 29 Aug 2019 22:50:37 +0800
Message-ID: <1567090254-15566-16-git-send-email-yongqiang.niu@mediatek.com>
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
dGNoIGFkZCBjb21tcG9uZW50IE9WTF8yTDAKClNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUg
PHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8
IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKaW5kZXggYjE4YmQ2Ni4uNDIwMGY4OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCkBAIC0yMTksNiAr
MjE5LDcgQEAgc3RhdGljIHZvaWQgbXRrX2dhbW1hX3NldChzdHJ1Y3QgbXRrX2RkcF9jb21wICpj
b21wLAogCiBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10a19kZHBfY29tcF9zdGVtW01US19E
RFBfQ09NUF9UWVBFX01BWF0gPSB7CiAJW01US19ESVNQX09WTF0gPSAib3ZsIiwKKwlbTVRLX0RJ
U1BfT1ZMXzJMXSA9ICJvdmxfMmwiLAogCVtNVEtfRElTUF9SRE1BXSA9ICJyZG1hIiwKIAlbTVRL
X0RJU1BfV0RNQV0gPSAid2RtYSIsCiAJW01US19ESVNQX0NPTE9SXSA9ICJjb2xvciIsCkBAIC0y
NTgsNiArMjU5LDcgQEAgc3RydWN0IG10a19kZHBfY29tcF9tYXRjaCB7CiAJW0REUF9DT01QT05F
TlRfT0QxXQk9IHsgTVRLX0RJU1BfT0QsCTEsICZkZHBfb2QgfSwKIAlbRERQX0NPTVBPTkVOVF9P
VkwwXQk9IHsgTVRLX0RJU1BfT1ZMLAkwLCBOVUxMIH0sCiAJW0REUF9DT01QT05FTlRfT1ZMMV0J
PSB7IE1US19ESVNQX09WTCwJMSwgTlVMTCB9LAorCVtERFBfQ09NUE9ORU5UX09WTF8yTDBdCT0g
eyBNVEtfRElTUF9PVkxfMkwsCTAsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVOVF9QV00wXQk9IHsg
TVRLX0RJU1BfUFdNLAkwLCBOVUxMIH0sCiAJW0REUF9DT01QT05FTlRfUFdNMV0JPSB7IE1US19E
SVNQX1BXTSwJMSwgTlVMTCB9LAogCVtERFBfQ09NUE9ORU5UX1BXTTJdCT0geyBNVEtfRElTUF9Q
V00sCTIsIE5VTEwgfSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5oCmluZGV4IDhkMjIwMjI0Li45Y2FlYzJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmgKQEAgLTE3LDYgKzE3LDcgQEAKIAogZW51bSBtdGtfZGRwX2Nv
bXBfdHlwZSB7CiAJTVRLX0RJU1BfT1ZMLAorCU1US19ESVNQX09WTF8yTCwKIAlNVEtfRElTUF9S
RE1BLAogCU1US19ESVNQX1dETUEsCiAJTVRLX0RJU1BfQ09MT1IsCkBAIC01MCw2ICs1MSw3IEBA
IGVudW0gbXRrX2RkcF9jb21wX2lkIHsKIAlERFBfQ09NUE9ORU5UX09EMCwKIAlERFBfQ09NUE9O
RU5UX09EMSwKIAlERFBfQ09NUE9ORU5UX09WTDAsCisJRERQX0NPTVBPTkVOVF9PVkxfMkwwLAog
CUREUF9DT01QT05FTlRfT1ZMMSwKIAlERFBfQ09NUE9ORU5UX1BXTTAsCiAJRERQX0NPTVBPTkVO
VF9QV00xLAotLSAKMS44LjEuMS5kaXJ0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB7963156
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80842897F6;
	Tue,  9 Jul 2019 07:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF06A89F6D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:37 +0000 (UTC)
X-UUID: fdeafbdf9c22410f886fbf0f04f424c0-20190709
X-UUID: fdeafbdf9c22410f886fbf0f04f424c0-20190709
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2038621960; Tue, 09 Jul 2019 06:34:35 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:34 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4, 16/33] drm/mediatek: add commponent OVL_2L0
Date: Tue, 9 Jul 2019 06:33:56 +0800
Message-ID: <1562625253-29254-17-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
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
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKaW5kZXggYjM1N2IyNC4uYmNiZjY3MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCkBAIC0yMjcsNiAr
MjI3LDcgQEAgc3RhdGljIHZvaWQgbXRrX2dhbW1hX3NldChzdHJ1Y3QgbXRrX2RkcF9jb21wICpj
b21wLAogCiBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10a19kZHBfY29tcF9zdGVtW01US19E
RFBfQ09NUF9UWVBFX01BWF0gPSB7CiAJW01US19ESVNQX09WTF0gPSAib3ZsIiwKKwlbTVRLX0RJ
U1BfT1ZMXzJMXSA9ICJvdmxfMmwiLAogCVtNVEtfRElTUF9SRE1BXSA9ICJyZG1hIiwKIAlbTVRL
X0RJU1BfV0RNQV0gPSAid2RtYSIsCiAJW01US19ESVNQX0NPTE9SXSA9ICJjb2xvciIsCkBAIC0y
NjYsNiArMjY3LDcgQEAgc3RydWN0IG10a19kZHBfY29tcF9tYXRjaCB7CiAJW0REUF9DT01QT05F
TlRfT0QxXQk9IHsgTVRLX0RJU1BfT0QsCTEsICZkZHBfb2QgfSwKIAlbRERQX0NPTVBPTkVOVF9P
VkwwXQk9IHsgTVRLX0RJU1BfT1ZMLAkwLCBOVUxMIH0sCiAJW0REUF9DT01QT05FTlRfT1ZMMV0J
PSB7IE1US19ESVNQX09WTCwJMSwgTlVMTCB9LAorCVtERFBfQ09NUE9ORU5UX09WTF8yTDBdCT0g
eyBNVEtfRElTUF9PVkxfMkwsCTAsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVOVF9QV00wXQk9IHsg
TVRLX0RJU1BfUFdNLAkwLCBOVUxMIH0sCiAJW0REUF9DT01QT05FTlRfUFdNMV0JPSB7IE1US19E
SVNQX1BXTSwJMSwgTlVMTCB9LAogCVtERFBfQ09NUE9ORU5UX1BXTTJdCT0geyBNVEtfRElTUF9Q
V00sCTIsIE5VTEwgfSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5oCmluZGV4IGJkNWZjYzkuLjhmNTg2ZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuaApAQCAtMjUsNiArMjUsNyBAQAogCiBlbnVtIG10a19kZHBfY29t
cF90eXBlIHsKIAlNVEtfRElTUF9PVkwsCisJTVRLX0RJU1BfT1ZMXzJMLAogCU1US19ESVNQX1JE
TUEsCiAJTVRLX0RJU1BfV0RNQSwKIAlNVEtfRElTUF9DT0xPUiwKQEAgLTU4LDYgKzU5LDcgQEAg
ZW51bSBtdGtfZGRwX2NvbXBfaWQgewogCUREUF9DT01QT05FTlRfT0QwLAogCUREUF9DT01QT05F
TlRfT0QxLAogCUREUF9DT01QT05FTlRfT1ZMMCwKKwlERFBfQ09NUE9ORU5UX09WTF8yTDAsCiAJ
RERQX0NPTVBPTkVOVF9PVkwxLAogCUREUF9DT01QT05FTlRfUFdNMCwKIAlERFBfQ09NUE9ORU5U
X1BXTTEsCi0tIAoxLjguMS4xLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

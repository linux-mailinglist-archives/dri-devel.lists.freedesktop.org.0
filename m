Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B460957CD7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74A76E5D6;
	Thu, 27 Jun 2019 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46E26E3A6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:08:30 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4BB7220098E;
 Wed, 26 Jun 2019 14:08:29 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 48569200991;
 Wed, 26 Jun 2019 14:08:29 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C397A205DB;
 Wed, 26 Jun 2019 14:08:28 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v6 1/2] dt-bindings: display: panel: Add support for Raydium
 RM67191 panel
Date: Wed, 26 Jun 2019 15:08:26 +0300
Message-Id: <1561550907-9733-2-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561550907-9733-1-git-send-email-robert.chiras@nxp.com>
References: <1561550907-9733-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
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
Cc: Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGR0LWJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIFJheWRpdW0gUk02NzE5MSBEU0kgcGFu
ZWwuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5
OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dCAgICAgfCA0MSArKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRp
dW0scm02NzE5MS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4xMDQyNDY5Ci0tLSAvZGV2L251bGwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1
bSxybTY3MTkxLnR4dApAQCAtMCwwICsxLDQxIEBACitSYXlkaXVtIFJNNjcxNzEgT0xFRCBMQ0Qg
cGFuZWwgd2l0aCBNSVBJLURTSSBwcm90b2NvbAorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBj
b21wYXRpYmxlOiAJCSJyYXlkaXVtLHJtNjcxOTEiCistIHJlZzoJCQl2aXJ0dWFsIGNoYW5uZWwg
Zm9yIE1JUEktRFNJIHByb3RvY29sCisJCQltdXN0IGJlIDwwPgorLSBkc2ktbGFuZXM6CQludW1i
ZXIgb2YgRFNJIGxhbmVzIHRvIGJlIHVzZWQKKwkJCW11c3QgYmUgPDM+IG9yIDw0PgorLSBwb3J0
OiAJCWlucHV0IHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRlZmluaXRpb24gYXMKKwkJCWRlZmlu
ZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dDsKKwkJCXRo
ZSBpbnB1dCBwb3J0IHNob3VsZCBiZSBjb25uZWN0ZWQgdG8gYSBNSVBJLURTSSBkZXZpY2UKKwkJ
CWRyaXZlcgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSByZXNldC1ncGlvczoJCWEgR1BJTyBz
cGVjIGZvciB0aGUgUlNUX0IgR1BJTyBwaW4KKy0gdjNwMy1zdXBwbHk6CQlwaGFuZGxlIHRvIDMu
M1YgcmVndWxhdG9yIHRoYXQgcG93ZXJzIHRoZSBWRERfM1YzIHBpbgorLSB2MXA4LXN1cHBseToJ
CXBoYW5kbGUgdG8gMS44ViByZWd1bGF0b3IgdGhhdCBwb3dlcnMgdGhlIFZERF8xVjggcGluCist
IHdpZHRoLW1tOgkJc2VlIHBhbmVsLWNvbW1vbi50eHQKKy0gaGVpZ2h0LW1tOgkJc2VlIHBhbmVs
LWNvbW1vbi50eHQKKy0gdmlkZW8tbW9kZToJCTAgLSBidXJzdC1tb2RlCisJCQkxIC0gbm9uLWJ1
cnN0IHdpdGggc3luYyBldmVudAorCQkJMiAtIG5vbi1idXJzdCB3aXRoIHN5bmMgcHVsc2UKKwor
RXhhbXBsZToKKworCXBhbmVsQDAgeworCQljb21wYXRpYmxlID0gInJheWRpdW0scm02NzE5MSI7
CisJCXJlZyA9IDwwPjsKKwkJcGluY3RybC0wID0gPCZwaW5jdHJsX21pcGlfZHNpXzBfMV9lbj47
CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCXJlc2V0LWdwaW9zID0gPCZncGlvMSA3
IEdQSU9fQUNUSVZFX0xPVz47CisJCWRzaS1sYW5lcyA9IDw0PjsKKwkJd2lkdGgtbW0gPSA8Njg+
OworCQloZWlnaHQtbW0gPSA8MTIxPjsKKworCQlwb3J0IHsKKwkJCXBhbmVsX2luOiBlbmRwb2lu
dCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX291dD47CisJCQl9OworCQl9OworCX07
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

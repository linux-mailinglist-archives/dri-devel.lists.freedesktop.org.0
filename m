Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD152496
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA3289FE3;
	Tue, 25 Jun 2019 07:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B4889DED
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:11:45 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C219E1A0F30;
 Tue, 25 Jun 2019 09:11:43 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BB8A11A0F67;
 Tue, 25 Jun 2019 09:11:43 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 45494205E5;
 Tue, 25 Jun 2019 09:11:43 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add support for Raydium
 RM67191 panel
Date: Tue, 25 Jun 2019 10:11:13 +0300
Message-Id: <1561446674-25084-2-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561446674-25084-1-git-send-email-robert.chiras@nxp.com>
References: <1561446674-25084-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dCAgICAgfCA0MSArKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3JheWRpdW0scm02NzE5MS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkx
LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4xMDQyNDY5Ci0tLSAvZGV2
L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcmF5ZGl1bSxybTY3MTkxLnR4dApAQCAtMCwwICsxLDQxIEBACitSYXlkaXVtIFJNNjcxNzEg
T0xFRCBMQ0QgcGFuZWwgd2l0aCBNSVBJLURTSSBwcm90b2NvbAorCitSZXF1aXJlZCBwcm9wZXJ0
aWVzOgorLSBjb21wYXRpYmxlOiAJCSJyYXlkaXVtLHJtNjcxOTEiCistIHJlZzoJCQl2aXJ0dWFs
IGNoYW5uZWwgZm9yIE1JUEktRFNJIHByb3RvY29sCisJCQltdXN0IGJlIDwwPgorLSBkc2ktbGFu
ZXM6CQludW1iZXIgb2YgRFNJIGxhbmVzIHRvIGJlIHVzZWQKKwkJCW11c3QgYmUgPDM+IG9yIDw0
PgorLSBwb3J0OiAJCWlucHV0IHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRlZmluaXRpb24gYXMK
KwkJCWRlZmluZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4
dDsKKwkJCXRoZSBpbnB1dCBwb3J0IHNob3VsZCBiZSBjb25uZWN0ZWQgdG8gYSBNSVBJLURTSSBk
ZXZpY2UKKwkJCWRyaXZlcgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSByZXNldC1ncGlvczoJ
CWEgR1BJTyBzcGVjIGZvciB0aGUgUlNUX0IgR1BJTyBwaW4KKy0gdjNwMy1zdXBwbHk6CQlwaGFu
ZGxlIHRvIDMuM1YgcmVndWxhdG9yIHRoYXQgcG93ZXJzIHRoZSBWRERfM1YzIHBpbgorLSB2MXA4
LXN1cHBseToJCXBoYW5kbGUgdG8gMS44ViByZWd1bGF0b3IgdGhhdCBwb3dlcnMgdGhlIFZERF8x
VjggcGluCistIHdpZHRoLW1tOgkJc2VlIHBhbmVsLWNvbW1vbi50eHQKKy0gaGVpZ2h0LW1tOgkJ
c2VlIHBhbmVsLWNvbW1vbi50eHQKKy0gdmlkZW8tbW9kZToJCTAgLSBidXJzdC1tb2RlCisJCQkx
IC0gbm9uLWJ1cnN0IHdpdGggc3luYyBldmVudAorCQkJMiAtIG5vbi1idXJzdCB3aXRoIHN5bmMg
cHVsc2UKKworRXhhbXBsZToKKworCXBhbmVsQDAgeworCQljb21wYXRpYmxlID0gInJheWRpdW0s
cm02NzE5MSI7CisJCXJlZyA9IDwwPjsKKwkJcGluY3RybC0wID0gPCZwaW5jdHJsX21pcGlfZHNp
XzBfMV9lbj47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCXJlc2V0LWdwaW9zID0g
PCZncGlvMSA3IEdQSU9fQUNUSVZFX0xPVz47CisJCWRzaS1sYW5lcyA9IDw0PjsKKwkJd2lkdGgt
bW0gPSA8Njg+OworCQloZWlnaHQtbW0gPSA8MTIxPjsKKworCQlwb3J0IHsKKwkJCXBhbmVsX2lu
OiBlbmRwb2ludCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX291dD47CisJCQl9Owor
CQl9OworCX07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

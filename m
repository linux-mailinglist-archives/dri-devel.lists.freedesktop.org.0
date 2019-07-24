Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B073319
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 17:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A616E5E6;
	Wed, 24 Jul 2019 15:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137176E5DC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 15:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 23793FB04;
 Wed, 24 Jul 2019 17:52:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peRBQktrt7Wu; Wed, 24 Jul 2019 17:52:29 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0958343419; Wed, 24 Jul 2019 17:52:26 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 2/3] dt-bindings: display/bridge: Add binding for IMX NWL mipi
 dsi host controller
Date: Wed, 24 Jul 2019 17:52:25 +0200
Message-Id: <70a5c6617936a4a095e7608b96e3f9fae5ddfbb1.1563983037.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1563983037.git.agx@sigxcpu.org>
References: <cover.1563983037.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE5vcnRod2VzdCBMb2dpYyBNSVBJIERTSSBJUCBjb3JlIGNhbiBiZSBmb3VuZCBpbiBOWFBz
IGkuTVg4IFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUu
b3JnPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pbXgtbndsLWRzaS50eHQgICB8
IDg5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2lteC1ud2wtZHNpLnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pbXgtbndsLWRzaS50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaW14LW53bC1kc2ku
dHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMjg4ZmRiNzI2ZDVh
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2lteC1ud2wtZHNpLnR4dApAQCAtMCwwICsxLDg5IEBACitOb3J0aHdlc3Qg
TG9naWMgTUlQSS1EU0kgb24gaW14IFNvQ3MKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KKworTldMIE1JUEktRFNJIGhvc3QgY29udHJvbGxlciBmb3VuZCBvbiBpLk1YOCBw
bGF0Zm9ybXMuIFRoaXMgaXMgYQorZHNpIGJyaWRnZSBmb3IgdGhlIGZvciB0aGUgTldMIE1JUEkt
RFNJIGhvc3QuCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6IAkJImZzbCw8
Y2hpcD4tbndsLWRzaSIKKwlUaGUgZm9sbG93aW5nIHN0cmluZ3MgYXJlIGV4cGVjdGVkOgorCQkJ
ImZzbCxpbXg4bXEtbndsLWRzaSIKKy0gcmVnOiAJCQl0aGUgcmVnaXN0ZXIgcmFuZ2Ugb2YgdGhl
IE1JUEktRFNJIGNvbnRyb2xsZXIKKy0gaW50ZXJydXB0czogCQl0aGUgaW50ZXJydXB0IG51bWJl
ciBmb3IgdGhpcyBtb2R1bGUKKy0gY2xvY2ssIGNsb2NrLW5hbWVzOiAJcGhhbmRsZXMgdG8gdGhl
IE1JUEktRFNJIGNsb2NrcworCVRoZSBmb2xsb3dpbmcgY2xvY2tzIGFyZSBleHBlY3RlZCBvbiBh
bGwgcGxhdGZvcm1zOgorCQkiY29yZSIgICAgLSBEU0kgY29yZSBjbG9jaworCQkidHhfZXNjIiAg
LSBUWF9FU0MgY2xvY2sgKHVzZWQgaW4gZXNjYXBlIG1vZGUpCisJCSJyeF9lc2MiICAtIFJYX0VT
QyBjbG9jayAodXNlZCBpbiBlc2NhcGUgbW9kZSkKKwkJInBoeV9yZWYiIC0gUEhZX1JFRiBjbG9j
ay4gQ2xvY2sgaXMgbWFuYWdlZCBieSB0aGUgcGh5LiBPbmx5CisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdXNlZCB0byByZWFkIHRoZSBjbG9jayByYXRlLgorLSBhc3NpZ25lZC1jbG9ja3M6
CXBoYW5kbGVzIHRvIGNsb2NrcyB0aGF0IHJlcXVpcmUgaW5pdGlhbCBjb25maWd1cmF0aW9uCist
IGFzc2lnbmVkLWNsb2NrLXJhdGVzOglyYXRlcyBvZiB0aGUgY2xvY2tzIHRoYXQgcmVxdWlyZSBp
bml0aWFsIGNvbmZpZ3VyYXRpb24KKwlUaGUgZm9sbG93aW5nIGNsb2NrcyBuZWVkIHRvIGhhdmUg
YW4gaW5pdGlhbCBjb25maWd1cmF0aW9uOgorCSJ0eF9lc2MiICgyMCBNSHopIGFuZCAicnhfZXNj
IiAoODAgTWh6KS4KKy0gcGh5czogCQlwaGFuZGxlIHRvIHRoZSBwaHkgbW9kdWxlIHJlcHJlc2Vu
dGluZyB0aGUgRFBIWQorCQkJaW5zaWRlIHRoZSBNSVBJLURTSSBJUCBibG9jaworLSBwaHktbmFt
ZXM6IAkJc2hvdWxkIGJlICJkcGh5IgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSBwb3dlci1k
b21haW5zIAlwaGFuZGxlIHRvIHRoZSBwb3dlciBkb21haW4KKy0gc3JjCQkJcGhhbmRsZSB0byB0
aGUgc3lzdGVtIHJlc2V0IGNvbnRyb2xsZXIgKHJlcXVpcmVkIG9uCisJCQlpLk1YOE1RKQorLSBt
dXgtc2VsCQlwaGFuZGxlIHRvIHRoZSBNVVggcmVnaXN0ZXIgc2V0IChyZXF1aXJlZCBvbiBpLk1Y
OE1RKQorLSBhc3NpZ25lZC1jbG9jay1wYXJlbnRzIHBoYW5kbGVzIHRvIHBhcmVudCBjbG9ja3Mg
dGhhdCBuZWVkcyB0byBiZSBhc3NpZ25lZCBhcworCQkJcGFyZW50cyB0byBjbG9ja3MgZGVmaW5l
ZCBpbiBhc3NpZ25lZC1jbG9ja3MKKworRXhhbXBsZToKKwltaXBpX2RzaTogbWlwaV9kc2lAMzBh
MDAwMDAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MD47CisJ
CWNvbXBhdGlibGUgPSAiZnNsLGlteDhtcS1ud2wtZHNpIjsKKwkJcmVnID0gPDB4MzBBMDAwMDAg
MHgzMDA+OworCQljbG9ja3MgPSA8JmNsayBJTVg4TVFfQ0xLX0RTSV9DT1JFPiwKKwkJCSA8JmNs
ayBJTVg4TVFfQ0xLX0RTSV9BSEI+LAorCQkJIDwmY2xrIElNWDhNUV9DTEtfRFNJX0lQR19ESVY+
LAorCQkJIDwmY2xrIElNWDhNUV9DTEtfRFNJX1BIWV9SRUY+OworCQljbG9jay1uYW1lcyA9ICJj
b3JlIiwgInJ4X2VzYyIsICJ0eF9lc2MiLCAicGh5X3JlZiI7CisJCWFzc2lnbmVkLWNsb2NrcyA9
IDwmY2xrIElNWDhNUV9DTEtfRFNJX0FIQj4sCisJCQkJICA8JmNsayBJTVg4TVFfQ0xLX0RTSV9D
T1JFPiwKKwkJCQkgIDwmY2xrIElNWDhNUV9DTEtfRFNJX0lQR19ESVY+OworCQlhc3NpZ25lZC1j
bG9jay1wYXJlbnRzID0gPCZjbGsgSU1YOE1RX1NZUzFfUExMXzgwTT4sCisJCQkJCSA8JmNsayBJ
TVg4TVFfU1lTMV9QTExfMjY2TT47CisJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDgwMDAwMDAw
PiwKKwkJCQkgICAgICAgPDI2NjAwMDAwMD4sCisJCQkJICAgICAgIDwyMDAwMDAwMD47CisJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJcG93ZXItZG9t
YWlucyA9IDwmcGdjX21pcGk+OworCQlzcmMgPSA8JnNyYz47CisJCW11eC1zZWwgPSA8JmlvbXV4
Y19ncHI+OworCQlwaHlzID0gPCZkcGh5PjsKKwkJcGh5LW5hbWVzID0gImRwaHkiOworCQlzdGF0
dXMgPSAib2theSI7CisKKwkJcGFuZWxAMCB7CisJCQljb21wYXRpYmxlID0gIi4uLiI7CisJCQlw
b3J0IHsKKwkJCSAgICAgcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQkgICAgICAgcmVtb3RlLWVu
ZHBvaW50ID0gPCZtaXBpX2RzaV9vdXQ+OworCQkJICAgICB9OworCQkJfTsKKwkJfTsKKworCQlw
b3J0cyB7CisJCSAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkgICAgICAjc2l6ZS1jZWxs
cyA9IDwwPjsKKworCQkgICAgICBwb3J0QDAgeworCQkJICAgICByZWcgPSA8MD47CisJCQkgICAg
IG1pcGlfZHNpX2luOiBlbmRwb2ludCB7CisJCQkJCSAgcmVtb3RlLWVuZHBvaW50ID0gPCZkY3Nz
X2Rpc3AwX21pcGlfZHNpPjsKKwkJCSAgICAgfTsKKwkJICAgICAgfTsKKwkJICAgICAgcG9ydEAx
IHsKKwkJCSAgICAgcmVnID0gPDE+OworCQkJICAgICBtaXBpX2RzaV9vdXQ6IGVuZHBvaW50IHsK
KwkJCQkJICAgcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47CisJCQkgICAgIH07CisJCSAg
ICAgIH07CisJCX07CisJfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

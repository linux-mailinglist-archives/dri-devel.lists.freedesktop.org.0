Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2B100826
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 16:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DAC6E578;
	Mon, 18 Nov 2019 15:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF26E570
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 15:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 9907428E105
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 4/4] dt-bindings: display: add IMX MIPI DSI host controller
 doc
Date: Mon, 18 Nov 2019 17:25:18 +0200
Message-Id: <20191118152518.3374263-5-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
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
Cc: Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogU2pvZXJkIFNpbW9ucyA8c2pvZXJkLnNpbW9uc0Bjb2xsYWJvcmEuY29t
PgpTaWduZWQtb2ZmLWJ5OiBNYXJ0eW4gV2VsY2ggPG1hcnR5bi53ZWxjaEBjb2xsYWJvcmEuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUmF0aXUgPGFkcmlhbi5yYXRpdUBjb2xsYWJvcmEuY29t
PgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2lteC9taXBpLWRzaS50eHQgICAgICAgICB8IDU2
ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvaW14L21pcGktZHNpLnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2lteC9taXBpLWRzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvbWlwaS1kc2kudHh0Cm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uM2YwNWMzMmVmOTYzCi0tLSAvZGV2L251bGwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW14L21pcGktZHNpLnR4
dApAQCAtMCwwICsxLDU2IEBACitGcmVlc2NhbGUgaS5NWDYgRFcgTUlQSSBEU0kgSG9zdCBDb250
cm9sbGVyCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisKK1Ro
ZSBEU0kgaG9zdCBjb250cm9sbGVyIGlzIGEgU3lub3BzeXMgRGVzaWduV2FyZSBNSVBJIERTSSB2
MS4wMSBJUAord2l0aCBhIGNvbXBhbmlvbiBQSFkgSVAuCisKK1RoZXNlIERUIGJpbmRpbmdzIGZv
bGxvdyB0aGUgU3lub3BzeXMgRFcgTUlQSSBEU0kgYmluZGluZ3MgZGVmaW5lZCBpbgorRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R3X21pcGlfZHNpLnR4
dCB3aXRoCit0aGUgZm9sbG93aW5nIGRldmljZS1zcGVjaWZpYyBwcm9wZXJ0aWVzLgorCitSZXF1
aXJlZCBwcm9wZXJ0aWVzOgorCistICNhZGRyZXNzLWNlbGxzOiBTaG91bGQgYmUgPDE+LgorLSAj
c2l6ZS1jZWxsczogU2hvdWxkIGJlIDwwPi4KKy0gY29tcGF0aWJsZTogImZzbCxpbXg2cS1taXBp
LWRzaSIsICJzbnBzLGR3LW1pcGktZHNpIi4KKy0gcmVnOiBTZWUgZHdfbWlwaV9kc2kudHh0Lgor
LSBpbnRlcnJ1cHRzOiBUaGUgY29udHJvbGxlcidzIENQVSBpbnRlcnJ1cHQuCistIGNsb2Nrcywg
Y2xvY2stbmFtZXM6IFBoYW5kbGVzIHRvIHRoZSBjb250cm9sbGVyJ3MgcGxsIHJlZmVyZW5jZQor
ICBjbG9jayhyZWYpIGFuZCBBUEIgY2xvY2socGNsayksIGFzIGRlc2NyaWJlZCBpbiBbMV0uCist
IHBvcnRzOiBhIHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRlZmluaXRpb25zIGFzIGRlZmluZWQg
aW4gWzJdLgorLSBncHI6IFNob3VsZCBiZSA8Jmdwcj4uCisgICAgICAgUGhhbmRsZSB0byB0aGUg
aW9tdXhjLWdwciByZWdpb24gY29udGFpbmluZyB0aGUgbXVsdGlwbGV4ZXIKKyAgICAgICBjb250
cm9sIHJlZ2lzdGVyLgorCitbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Ns
b2NrL2Nsb2NrLWJpbmRpbmdzLnR4dAorWzJdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAorCitFeGFtcGxlOgorCisJbWlwaV9kc2k6
IG1pcGlAMjFlMDAwMCB7CisJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9
IDwwPjsKKwkJY29tcGF0aWJsZSA9ICJmc2wsaW14NnEtbWlwaS1kc2kiLCAic25wcyxkdy1taXBp
LWRzaSI7CisJCXJlZyA9IDwweDAyMWUwMDAwIDB4NDAwMD47CisJCWludGVycnVwdHMgPSA8MCAx
MDIgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCWdwciA9IDwmZ3ByPjsKKwkJY2xvY2tzID0gPCZj
bGtzIElNWDZRRExfQ0xLX01JUElfQ09SRV9DRkc+LAorCQkJIDwmY2xrcyBJTVg2UURMX0NMS19N
SVBJX0lQRz47CisJCWNsb2NrLW5hbWVzID0gInJlZiIsICJwY2xrIjsKKwkJc3RhdHVzID0gIm9r
YXkiOworCisJCXBvcnRzIHsKKwkJCXBvcnRAMCB7CisJCQkJcmVnID0gPDA+OworCQkJCW1pcGlf
bXV4XzA6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZpcHUxX2RpMF9taXBp
PjsKKwkJCQl9OworCQkJfTsKKwkJCXBvcnRAMSB7CisJCQkJcmVnID0gPDE+OworCQkJCW1pcGlf
bXV4XzE6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZpcHUxX2RpMV9taXBp
PjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKyAgICAgICAgfTsKLS0gCjIuMjQuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D5CA132E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A211289FF9;
	Thu, 29 Aug 2019 08:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83AC3894DD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 18:37:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="25166330"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 03:37:01 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3472D4004953;
 Thu, 29 Aug 2019 03:36:57 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 2/8] dt-bindings: display: Add idk-2121wr binding
Date: Wed, 28 Aug 2019 19:36:36 +0100
Message-Id: <1567017402-5895-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpbmRpbmcgZm9yIHRoZSBpZGstMjEyMXdyIExWRFMgcGFuZWwgZnJvbSBBZHZhbnRlY2gu
CgpTb21lIHBhbmVsLXNwZWNpZmljIGRvY3VtZW50YXRpb24gY2FuIGJlIGZvdW5kIGhlcmU6Cmh0
dHBzOi8vYnV5LmFkdmFudGVjaC5ldS9EaXNwbGF5cy9FbWJlZGRlZC1MQ0QtS2l0cy1IaWdoLUJy
aWdodG5lc3MvbW9kZWwtSURLLTIxMjFXUi1LMkZIQTJFLmh0bQoKU2lnbmVkLW9mZi1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjItPnYz
OgoqIG5ldyBwYXRjaAotLS0KIC4uLi9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdy
LnlhbWwgICAgICAgIHwgOTAgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDkwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnlhbWwKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uYjJjY2RjOAotLS0gL2Rldi9udWxsCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxp
ZGstMjEyMXdyLnlhbWwKQEAgLTAsMCArMSw5MCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sIworJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBB
ZHZhbnRlY2ggSURLLTIxMjFXUiAyMS41IiBGdWxsLUhEIGR1YWwtTFZEUyBwYW5lbAorCittYWlu
dGFpbmVyczoKKyAgLSBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2Fz
LmNvbT4KKyAgLSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgorCitk
ZXNjcmlwdGlvbjogfAorICBUaGUgSURLLTIxMjFXUiBmcm9tIEFkdmFudGVjaCBpcyBhIEZ1bGwt
SEQgZHVhbC1MVkRTIHBhbmVsLgorCisgIFRoZSBwYW5lbHMgZXhwZWN0cyBvZGQgcGl4ZWxzIGZy
b20gdGhlIGZpcnN0IHBvcnQsIGFuZCBldmVuIHBpeGVscyBmcm9tCisgIHRoZSBzZWNvbmQgcG9y
dCwgdGhlcmVmb3JlIHRoZSBwb3J0cyBtdXN0IGJlIG1hcmtlZCBhY2NvcmRpbmdseS4KKworYWxs
T2Y6CisgIC0gJHJlZjogbHZkcy55YW1sIworICAtICRyZWY6IC4uL2J1cy10aW1pbmdzL2x2ZHMu
eWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBpdGVtczoKKyAgICAgIC0g
Y29uc3Q6IGFkdmFudGVjaCxpZGstMjEyMXdyCisgICAgICAtIHt9ICMgcGFuZWwtbHZkcywgYnV0
IG5vdCBsaXN0ZWQgaGVyZSB0byBhdm9pZCBmYWxzZSBzZWxlY3QKKworICBkYXRhLW1hcHBpbmc6
CisgICAgY29uc3Q6IHZlc2EtMjQKKworICB3aWR0aC1tbToKKyAgICBjb25zdDogNDc2CisKKyAg
aGVpZ2h0LW1tOgorICAgIGNvbnN0OiAyNjgKKworICBwYW5lbC10aW1pbmc6IHRydWUKKyAgcG9y
dHM6IHRydWUKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK3JlcXVpcmVkOgorICAt
IGNvbXBhdGlibGUKKworZXhhbXBsZXM6CisgIC0gfCsKKyAgICBwYW5lbC1sdmRzIHsKKyAgICAg
IGNvbXBhdGlibGUgPSAiYWR2YW50ZWNoLGlkay0yMTIxd3IiLCAicGFuZWwtbHZkcyI7CisKKyAg
ICAgIHdpZHRoLW1tID0gPDQ3Nj47CisgICAgICBoZWlnaHQtbW0gPSA8MjY4PjsKKworICAgICAg
ZGF0YS1tYXBwaW5nID0gInZlc2EtMjQiOworCisgICAgICBwYW5lbC10aW1pbmcgeworICAgICAg
ICBjbG9jay1mcmVxdWVuY3kgPSA8MTQ4NTAwMDAwPjsKKyAgICAgICAgaGFjdGl2ZSA9IDwxOTIw
PjsKKyAgICAgICAgdmFjdGl2ZSA9IDwxMDgwPjsKKyAgICAgICAgaHN5bmMtbGVuID0gPDQ0PjsK
KyAgICAgICAgaGZyb250LXBvcmNoID0gPDg4PjsKKyAgICAgICAgaGJhY2stcG9yY2ggPSA8MTQ4
PjsKKyAgICAgICAgdmZyb250LXBvcmNoID0gPDQ+OworICAgICAgICB2YmFjay1wb3JjaCA9IDwz
Nj47CisgICAgICAgIHZzeW5jLWxlbiA9IDw1PjsKKyAgICAgIH07CisKKyAgICAgIHBvcnRzIHsK
KyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+
OworCisgICAgICAgIHBvcnRAMCB7CisgICAgICAgICAgcmVnID0gPDA+OworICAgICAgICAgIGR1
YWwtbHZkcy1vZGQtcGl4ZWxzOworICAgICAgICAgIHBhbmVsX2luMDogZW5kcG9pbnQgeworICAg
ICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMF9vdXQ+OworICAgICAgICAgIH07Cisg
ICAgICAgIH07CisKKyAgICAgICAgcG9ydEAxIHsKKyAgICAgICAgICByZWcgPSA8MT47CisgICAg
ICAgICAgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzOworICAgICAgICAgIHBhbmVsX2luMTogZW5kcG9p
bnQgeworICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9vdXQ+OworICAgICAg
ICAgIH07CisgICAgICAgIH07CisgICAgICB9OworICAgIH07CisKKy4uLgotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

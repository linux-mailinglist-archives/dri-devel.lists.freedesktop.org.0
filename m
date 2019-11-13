Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9CFFC119
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12056E27A;
	Thu, 14 Nov 2019 08:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id D91836ED79
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31593914"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:01 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id DB6C2400E9F7;
 Thu, 14 Nov 2019 00:51:56 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 04/13] dt-bindings: display: bridge: lvds-transmitter:
 Document "ti, sn75lvds83"
Date: Wed, 13 Nov 2019 15:51:23 +0000
Message-Id: <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tcGF0aWJsZSBzdHJpbmcgInRpLHNuNzVsdmRzODMiIGlzIGJlaW5nIHVzZWQgYnkgZGV2aWNl
IHRyZWUKcmszMTg4LWJxZWRpc29uMnFjLmR0cywgYnV0IGl0J3Mgbm90IGRvY3VtZW50ZWQgYW55
d2hlcmUsIHRoZXJlZm9yZQpkb2N1bWVudCBpdCB3aXRoaW4gbHZkcy10cmFuc21pdHRlci55YW1s
LgoKU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVu
ZXNhcy5jb20+CgotLS0KdjMtPnY0OgoqIE5ldyBwYXRjaAotLS0KIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnlhbWwgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVy
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
bHZkcy10cmFuc21pdHRlci55YW1sCmluZGV4IGE4MzI2Y2UuLjI3ZGU2MTYgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRy
YW5zbWl0dGVyLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIueWFtbApAQCAtMzcsNiArMzcsNyBAQCBwcm9w
ZXJ0aWVzOgogICAgICAgLSBlbnVtOgogICAgICAgICAtIHRpLGRzOTBjMTg1ICAgICAgICMgRm9y
IHRoZSBUSSBEUzkwQzE4NSBGUEQtTGluayBTZXJpYWxpemVyCiAgICAgICAgIC0gdGksZHM5MGMx
ODcgICAgICAgIyBGb3IgdGhlIFRJIERTOTBDMTg3IEZQRC1MaW5rIFNlcmlhbGl6ZXIKKyAgICAg
ICAgLSB0aSxzbjc1bHZkczgzICAgICAjIEZvciB0aGUgVEkgU043NUxWRFM4MyBGbGF0TGluayB0
cmFuc21pdHRlcgogICAgICAgLSBjb25zdDogbHZkcy1lbmNvZGVyICMgR2VuZXJpYyBMVkRTIGVu
Y29kZXIgY29tcGF0aWJsZSBmYWxsYmFjawogCiAgIHBvcnRzOgotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

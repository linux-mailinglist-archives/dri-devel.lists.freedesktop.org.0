Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC23A1320
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ADD8940E;
	Thu, 29 Aug 2019 08:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0237A894DD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 18:36:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="25166325"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 03:36:56 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B3614004953;
 Thu, 29 Aug 2019 03:36:52 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS bus-timings
Date: Wed, 28 Aug 2019 19:36:35 +0100
Message-Id: <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHVhbC1MVkRTIGNvbm5lY3Rpb25zIG5lZWQgbWFya2VycyBpbiB0aGUgRFQsIHRoaXMgcGF0Y2gg
YWRkcwpzb21lIGNvbW1vbiBkb2N1bWVudGF0aW9uIHRvIGJlIHJlZmVyZW5jZWQgYnkgYm90aCBw
YW5lbHMgYW5kCmJyaWRnZXMuCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJp
emlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2Mi0+djM6CiogbmV3IHBhdGNoCi0tLQog
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvYnVzLXRpbWluZ3MvbHZkcy55YW1sICAgICAgICAgfCAzOCAr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5mMzViNTVhCi0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnVzLXRpbWlu
Z3MvbHZkcy55YW1sCkBAIC0wLDAgKzEsMzggQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2Rpc3BsYXkvYnVzLXRpbWluZ3MvbHZkcy55YW1sIworJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBDb21tb24gUHJvcGVy
dGllcyBmb3IgYnVzIHRpbWluZ3Mgb2YgTFZEUyBpbnRlcmZhY2VzCisKK21haW50YWluZXJzOgor
ICAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisgIC0gRmFicml6
aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CisKK2Rlc2NyaXB0aW9u
OiB8CisgIFRoaXMgZG9jdW1lbnQgZGVmaW5lcyBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIGNvbW1v
biB0byBMVkRTIGFuZCBkdWFsLUxWRFMKKyAgaW50ZXJmYWNlcywgd2hlcmUgYSBkdWFsLUxWRFMg
aW50ZXJmYWNlIGlzIGEgZHVhbC1saW5rIGNvbm5lY3Rpb24gd2l0aCBldmVuCisgIHBpeGVscyB0
cmF2ZWxpbmcgb24gb25lIGNvbm5lY3Rpb24sIGFuZCB3aXRoIG9kZCBwaXhlbHMgdHJhdmVsaW5n
IG9uIHRoZSBvdGhlcgorICBjb25uZWN0aW9uLgorICBUaGlzIGRvY3VtZW50IGRvZXNuJ3QgY29u
c3RpdHVlIGEgZGV2aWNlIHRyZWUgYmluZGluZyBzcGVjaWZpY2F0aW9uIGJ5IGl0c2VsZgorICBi
dXQgaXMgbWVhbnQgdG8gYmUgcmVmZXJlbmNlZCBieSBkZXZpY2UgdHJlZSBiaW5kaW5ncy4KKyAg
V2hlbiByZWZlcmVuY2VkIGZyb20gcGFuZWwgb3IgYnJpZGdlIGRldmljZSB0cmVlIGJpbmRpbmdz
LCB0aGUgcHJvcGVydGllcworICBkZWZpbmVkIGluIHRoaXMgZG9jdW1lbnQgYXJlIGRlZmluZWQg
YXMgZm9sbG93cy4gVGhlIHBhbmVsIGFuZCBicmlkZ2UgZGV2aWNlCisgIHRyZWUgYmluZGluZ3Mg
YXJlIHJlc3BvbnNpYmxlIGZvciBkZWZpbmluZyB3aGV0aGVyIGVhY2ggcHJvcGVydHkgaXMgcmVx
dWlyZWQKKyAgb3Igb3B0aW9uYWwuCisKK3Byb3BlcnRpZXM6CisgIGR1YWwtbHZkcy1ldmVuLXBp
eGVsczoKKyAgICB0eXBlOiBib29sZWFuCisgICAgZGVzY3JpcHRpb246CisgICAgICBUaGlzIHBy
b3BlcnR5IGlzIHNwZWNpZmljIHRvIGFuIGlucHV0IHBvcnQgb2YgYSBzaW5rIGRldmljZS4gV2hl
bgorICAgICAgc3BlY2lmaWVkLCBpdCBtYXJrcyB0aGUgcG9ydCBhcyByZWNpcGllbnQgb2YgZXZl
bi1waXhlbHMuCisKKyAgZHVhbC1sdmRzLW9kZC1waXhlbHM6CisgICAgdHlwZTogYm9vbGVhbgor
ICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBzcGVjaWZpYyB0byBhbiBp
bnB1dCBwb3J0IG9mIGEgc2luayBkZXZpY2UuIFdoZW4KKyAgICAgIHNwZWNpZmllZCwgaXQgbWFy
a3MgdGhlIHBvcnQgYXMgcmVjaXBpZW50IG9mIG9kZC1waXhlbHMuCisKKy4uLgotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

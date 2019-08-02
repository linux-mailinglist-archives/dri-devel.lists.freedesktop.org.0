Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E57EEE2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCAF6ED27;
	Fri,  2 Aug 2019 08:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 02 Aug 2019 07:39:33 UTC
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D7C66ECDA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:39:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="22931900"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2019 16:34:30 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id D292D4007528;
 Fri,  2 Aug 2019 16:34:25 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH/RFC 00/12] Add dual-LVDS panel support to EK874
Date: Fri,  2 Aug 2019 08:33:57 +0100
Message-Id: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
 ebiharaml@si-linux.co.jp, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBBbGwsCgp0aGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGR1YWwtTFZEUyBwYW5lbCBJ
REstMjEyMVdSCmZyb20gQWR2YW50ZWNoOgpodHRwczovL2J1eS5hZHZhbnRlY2guZXUvRGlzcGxh
eXMvRW1iZWRkZWQtTENELUtpdHMtSGlnaC1CcmlnaHRuZXNzL21vZGVsLUlESy0yMTIxV1ItSzJG
SEEyRS5odG0KRHVhbCBsaW5rIHN1cHBvcnQgaXMgdmVyeSByZWNlbnQgZm9yIFItQ2FyIEdlbjMs
IGFuZCBJIGNvdWxkbid0CmZpbmQgbXVjaCBvbiBkdWFsIGxpbmsgcGFuZWxzIGluIHRoZSBrZXJu
ZWwgZWl0aGVyLCB0aGVyZWZvcmUKY29tbWVudHMgYXJlIHZlcnkgd2VsY29tZSB0byBnZXQgdGhp
cyByaWdodC4KClRoZSBwYW5lbCBkb2Vzbid0IGNvbWUgd2l0aCB0aGUgRUs4NzQga2l0LCBidXQg
aXQncyBhZHZlcnRpc2VkIGFzCnN1cHBvcnRlZCwgdGhlcmVmb3JlIHRoaXMgc2VyaWVzIGFkZHMg
YSBuZXcgZHRzIGZpbGUgdG8gc3VwcG9ydAp0aGUgY29uZmlndXJhdGlvbiBvZiB0aGUgRUs4NzQg
KyBJREstMjEyMVdSLgoKRmluYWxseSwgdGhpcyBzZXJpZXMgZGVwZW5kcyBvbiBhIGZpeCB0aGF0
J3Mgc3RpbGwgcGVuZGluZzoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTA1
NDc1NS8KClRoYW5rcywKRmFiCgpGYWJyaXppbyBDYXN0cm8gKDEyKToKICBkdC1iaW5kaW5nczog
ZGlzcGxheTogcmVuZXNhczogbHZkczogUlovRzJFIG5lZWRzIHJlbmVzYXMsY29tcGFuaW9uCiAg
ICB0b28KICBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhczogbHZkczogRG9jdW1lbnQgcmVu
ZXNhcyxzd2FwLWRhdGEKICBkdC1iaW5kaW5nczogcGFuZWw6IGx2ZHM6IEFkZCBkdWFsLWxpbmsg
TFZEUyBkaXNwbGF5IHN1cHBvcnQKICBkdC1iaW5kaW5nczogZGlzcGxheTogQWRkIGJpbmRpbmdz
IGZvciBBZHZhbnRlY2ggSURLLTIxMjFXUgogIGRybTogcmNhci1kdTogbHZkczogQWRkIGRhdGEg
c3dhcCBzdXBwb3J0CiAgZHJtOiByY2FyLWR1OiBsdmRzOiBEbyBub3QgbG9vayBhdCBwb3J0cyBm
b3IgaWRlbnRpZnlpbmcgYnJpZGdlcwogIGRybTogcmNhci1kdTogbHZkczogQWRkIHN1cHBvcnQg
Zm9yIGR1YWwgbGluayBwYW5lbHMKICBkcm06IHJjYXItZHU6IGx2ZHM6IEZpeCBicmlkZ2VfdG9f
cmNhcl9sdmRzCiAgZHJtOiByY2FyLWR1OiBsdmRzOiBGaXggY29tcGFuaW9uJ3MgbW9kZQogIGFy
bTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3NGMwOiBQb2ludCBMVkRTMCB0byBpdHMgY29tcGFuaW9u
IExWRFMxCiAgYXJtNjQ6IGR0czogcmVuZXNhczogY2F0ODc0OiBBZGQgZGVmaW5pdGlvbiBmb3Ig
MTJWIHJlZ3VsYXRvcgogIGFybTY0OiBkdHM6IHJlbmVzYXM6IEFkZCBFSzg3NCBib2FyZCB3aXRo
IGlkay0yMTIxd3IgZGlzcGxheSBzdXBwb3J0CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3JlbmVzYXMsbHZkcy50eHQgICAgICAgfCAgMTEgKy0KIC4uLi9kaXNwbGF5L3BhbmVsL2FkdmFu
dGVjaCxpZGstMjEyMXdyLnR4dCAgICAgICAgIHwgIDYyICsrKysrKysrKysrKwogLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtbHZkcy50eHQgICAgICAgICAgfCAgOTEgKysrKysrKysr
KysrLS0tLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZSAgICAgICAgICAg
ICAgIHwgICAzICstCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAtY2F0ODc0
LmR0cyAgICB8ICAgOSArKwogLi4uL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAtZWs4NzQtaWRr
LTIxMjF3ci5kdHMgfCAxMTIgKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc0YzAuZHRzaSAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgICAgICB8ICA2NSArKysrKystLS0tLS0K
IDggZmlsZXMgY2hhbmdlZCwgMjkxIGluc2VydGlvbnMoKyksIDY0IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC1lazg3NC1pZGstMjEyMXdyLmR0cwoKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2911FC116
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B196E1B7;
	Thu, 14 Nov 2019 08:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDA616ED6B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31380879"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 14 Nov 2019 00:51:41 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id D48C1400ED49;
 Thu, 14 Nov 2019 00:51:36 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 00/13] Add LCD panel support to iwg20d
Date: Wed, 13 Nov 2019 15:51:19 +0000
Message-Id: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
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

VGhlIGlXLVJhaW5ib1ctRzIwRC1Rc2V2ZW4gUlovRzFNLEcxTiBRc2V2ZW4gRGV2ZWxvcG1lbnQg
UGxhdGZvcm0KY29tZXMgd2l0aCBhIDciIGNhcGFjaXRpdmUgZGlzcGxheSBraXQgZnJvbSBFbWVy
Z2luZyBEaXNwbGF5ClRlY2hub2xvZ2llcyBDb3Jwb3JhdGlvbiAoRURUKS4gVGhpcyBzZXJpZXMg
YWRkcyBhbGwgdGhhdCdzCm5lY2Vzc2FyeSBmb3Igc3VwcG9ydGluZyBpdC4KClRoYW5rcywKRmFi
Cgp2My0+djQ6CiogUmV3b3JrZWQgYWNjb3JkaW5nIHRvIExhdXJlbnQncyBhbmQgSmFjb3BvJ3Mg
Y29tbWVudHMKdjItPnYzOgoqIFNwbGl0IHRoZSBkdC1zY2hlbWEgcGF0Y2ggaW4gdHdvIHBhdGNo
ZXMgYXMgcGVyIFJvYidzIGNvbW1lbnQKKiBNYWRlIGZpeGVzIHRvIHRoZSBkdC1zY2hlbWEgYWNj
b3JkaW5nIHRvIFJvYidzIGNvbW1lbnQKKiBNYWRlIGZpeGVzIHRvIHRoZSBsdmRzLWNvZGVjIGRy
aXZlciBhY2NvcmRpbmcgdG8gSmFjb3BvJ3MgY29tbWVudHMKKiBBZGRlZCB0d28gbmV3IHBhdGNo
ZXM6CiAgKiBkcm06IERlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfUEFSQUxMRUwKICAqIGRybS9w
YW5lbDogcGFuZWwtc2ltcGxlOiBBZGQgY29ubmVjdG9yIHR5cGUgZm9yIGV0bTA3MDBnMGRoNgp2
MS0+djI6CiogQ29udmVydCBkdC1iaW5kaW5ncyB0byBkdC1zY2hlbWEKCkZhYnJpemlvIENhc3Ry
byAoMTMpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6IENvbnZlcnQgbHZkcy10cmFu
c21pdHRlciBiaW5kaW5nIHRvCiAgICBqc29uLXNjaGVtYQogIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBicmlkZ2U6IGx2ZHMtdHJhbnNtaXR0ZXI6IERvY3VtZW50CiAgICBwb3dlcmRvd24tZ3Bpb3MK
ICBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBsdmRzLXRyYW5zbWl0dGVyOiBBYnNvcmIg
dGksZHM5MGMxODUudHh0CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogbHZkcy10cmFu
c21pdHRlcjogRG9jdW1lbnQKICAgICJ0aSxzbjc1bHZkczgzIgogIGRybS9icmlkZ2U6IFJlcHVy
cG9zZSBsdmRzLWVuY29kZXIuYwogIGRybS9icmlkZ2U6IGx2ZHMtY29kZWM6IEFkZCAibHZkcy1k
ZWNvZGVyIiBzdXBwb3J0CiAgZHJtL2JyaWRnZTogbHZkcy1jb2RlYzogU2ltcGxpZnkgcGFuZWwg
RFQgbm9kZSBsb2NhbGlzYXRpb24KICBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBSZXB1
cnBvc2UgbHZkcy1lbmNvZGVyCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogbHZkcy1j
b2RlYzogRG9jdW1lbnQgdGksZHM5MGNmMzg0YQogIEFSTTogZHRzOiBpd2cyMGQtcTctY29tbW9u
OiBBZGQgTENEIHN1cHBvcnQKICBBUk06IHNobW9iaWxlX2RlZmNvbmZpZzogRW5hYmxlIHN1cHBv
cnQgZm9yIHBhbmVscyBmcm9tIEVEVAogIFtIQUNLXSBkcm0vYnJpZGdlOiBsdmRzLWNvZGVjOiBF
bmZvcmNlIGRldmljZSBzcGVjaWZpYyBjb21wYXRpYmxlCiAgICBzdHJpbmdzCiAgW0hBQ0tdIGR0
LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6IGx2ZHMtY29kZWM6IEFic29yYgogICAgdGhpbmUs
dGhjNjNsdmRtODNkLnR4dAoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVj
LnlhbWwgICAgICAgIHwgMTMxICsrKysrKysrKysrKysrKwogLi4uL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0ICAgfCAgNjYgLS0tLS0tLS0KIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZG04M2QudHh0IHwgIDUwIC0tLS0tLQogLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTBjMTg1LnR4dCAgICAgICAgfCAgNTUgLS0t
LS0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1vbi5kdHNpICAgICAgICAgICAg
fCAgODUgKysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRz
aSAgICAgICAgICAgfCAgIDEgLQogYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25maWcg
ICAgICAgICAgICAgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiAuLi4vZHJtL2JyaWRnZS97bHZkcy1lbmNv
ZGVyLmMgPT4gbHZkcy1jb2RlYy5jfSAgICB8IDE3OSArKysrKysrKysrKysrLS0tLS0tLS0KIDEw
IGZpbGVzIGNoYW5nZWQsIDMzMyBpbnNlcnRpb25zKCspLCAyNDcgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL2x2ZHMtY29kZWMueWFtbAogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAog
ZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZG04M2QudHh0CiBkZWxldGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTBjMTg1
LnR4dAogcmVuYW1lIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uve2x2ZHMtZW5jb2Rlci5jID0+IGx2
ZHMtY29kZWMuY30gKDI1JSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

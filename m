Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C40EE8CC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7408C6E84E;
	Mon,  4 Nov 2019 19:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67B676E621
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:58:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,267,1569250800"; d="scan'208";a="30581901"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 05 Nov 2019 01:58:12 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9DD464005E08;
 Tue,  5 Nov 2019 01:58:08 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 0/4] Add LCD panel support to iwg20d
Date: Mon,  4 Nov 2019 16:57:59 +0000
Message-Id: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:09 +0000
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
Cgp2MS0+djI6CiogQ29udmVydCBkdC1iaW5kaW5ncyB0byBkdC1zY2hlbWEKCkZhYnJpemlvIENh
c3RybyAoNCk6CiAgZHJtL2JyaWRnZTogUmVwdXJwb3NlIGx2ZHMtZW5jb2Rlci5jCiAgZHQtYmlu
ZGluZ3M6IGRpc3BsYXk6IGJyaWRnZTogUmVwdXJwb3NlIGx2ZHMtZW5jb2RlcgogIEFSTTogZHRz
OiBpd2cyMGQtcTctY29tbW9uOiBBZGQgTENEIHN1cHBvcnQKICBBUk06IHNobW9iaWxlX2RlZmNv
bmZpZzogRW5hYmxlIHN1cHBvcnQgZm9yIHBhbmVscyBmcm9tIEVEVAoKIC4uLi9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwgICAgICAgIHwgMTE3ICsrKysrKysrKysrKysr
CiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQgICB8ICA2
NiAtLS0tLS0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1vbi5kdHNpICAgICAg
ICAgICAgfCAgODUgKysrKysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNt
LWNhLmR0c2kgICAgICAgICAgIHwgICAxIC0KIGFyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVm
Y29uZmlnICAgICAgICAgICAgICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgIHwgICA4ICstCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9sdmRzLWNvZGVjLmMgICAgICAgICAgICAgICAgfCAxNjkgKysrKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rlci5jICAgICAgICAgICAgICB8
IDE1NSAtLS0tLS0tLS0tLS0tLS0tLS0tCiA5IGZpbGVzIGNoYW5nZWQsIDM3OSBpbnNlcnRpb25z
KCspLCAyMjcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbAogZGVsZXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9sdmRzLWVuY29kZXIuYwoKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

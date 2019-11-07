Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B9F41E2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907366F894;
	Fri,  8 Nov 2019 08:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCEA16F78F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:11:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; d="scan'208";a="30895643"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:11 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id ED01A4009F8D;
 Fri,  8 Nov 2019 05:11:06 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 0/7] Add LCD panel support to iwg20d
Date: Thu,  7 Nov 2019 20:10:56 +0000
Message-Id: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
Cgp2Mi0+djM6CiogU3BsaXQgdGhlIGR0LXNjaGVtYSBwYXRjaCBpbiB0d28gcGF0aGVzIGFzIHBl
ciBSb2IncyBjb21tZW50CiogTWFkZSBmaXhlcyB0byB0aGUgZHQtc2NoZW1hIGFjY29yZGluZyB0
byBSb2IncyBjb21tZW50CiogTWFkZSBmaXhlcyB0byB0aGUgbHZkcy1jb2RlYyBkcml2ZXIgYWNj
b3JkaW5nIHRvIEphY29wbydzIGNvbW1lbnRzCiogQWRkZWQgdHdvIG5ldyBwYXRjaGVzOgogICog
ZHJtOiBEZWZpbmUgRFJNX01PREVfQ09OTkVDVE9SX1BBUkFMTEVMCiAgKiBkcm0vcGFuZWw6IHBh
bmVsLXNpbXBsZTogQWRkIGNvbm5lY3RvciB0eXBlIGZvciBldG0wNzAwZzBkaDYKdjEtPnYyOgoq
IENvbnZlcnQgZHQtYmluZGluZ3MgdG8gZHQtc2NoZW1hCgpGYWJyaXppbyBDYXN0cm8gKDcpOgog
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6IENvbnZlcnQgbHZkcy10cmFuc21pdHRlciBi
aW5kaW5nIHRvCiAgICBqc29uLXNjaGVtYQogIGRybS9icmlkZ2U6IFJlcHVycG9zZSBsdmRzLWVu
Y29kZXIuYwogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6IFJlcHVycG9zZSBsdmRzLWVu
Y29kZXIKICBkcm06IERlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfUEFSQUxMRUwKICBkcm0vcGFu
ZWw6IHBhbmVsLXNpbXBsZTogQWRkIGNvbm5lY3RvciB0eXBlIGZvciBldG0wNzAwZzBkaDYKICBB
Uk06IGR0czogaXdnMjBkLXE3LWNvbW1vbjogQWRkIExDRCBzdXBwb3J0CiAgQVJNOiBzaG1vYmls
ZV9kZWZjb25maWc6IEVuYWJsZSBzdXBwb3J0IGZvciBwYW5lbHMgZnJvbSBFRFQKCiAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sICAgICAgICB8IDEyMCArKysrKysr
KysrKysrKysrCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50
eHQgICB8ICA2NiAtLS0tLS0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24u
ZHRzaSAgICAgICAgICAgIHwgIDg1ICsrKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9pd2cy
MGQtcTctZGJjbS1jYS5kdHNpICAgICAgICAgICB8ICAgMSAtCiBhcmNoL2FybS9jb25maWdzL3No
bW9iaWxlX2RlZmNvbmZpZyAgICAgICAgICAgICAgICB8ICAgMyArCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jICAgICAgICAgICAgICAgIHwgMTMxICsrKysrKysr
KysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rlci5jICAgICAgICAg
ICAgICB8IDE1NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29u
bmVjdG9yLmMgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICAgICAgIHwgICAxICsKIGluY2x1ZGUvdWFwaS9kcm0v
ZHJtX21vZGUuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIDEyIGZpbGVzIGNoYW5n
ZWQsIDM0NyBpbnNlcnRpb25zKCspLCAyMjcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMt
Y29kZWMueWFtbAogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1jb2RlYy5jCiBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWVuY29kZXIuYwoKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

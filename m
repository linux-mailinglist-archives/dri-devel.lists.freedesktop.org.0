Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C53FC13F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9286E2F3;
	Thu, 14 Nov 2019 08:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F15EE6ED6B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31380911"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:31 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id B7DA1400ED5C;
 Thu, 14 Nov 2019 00:52:26 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 10/13] ARM: dts: iwg20d-q7-common: Add LCD support
Date: Wed, 13 Nov 2019 15:51:29 +0000
Message-Id: <1573660292-10629-11-git-send-email-fabrizio.castro@bp.renesas.com>
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

VGhlIGl3ZzIwZCBjb21lcyB3aXRoIGEgNyIgY2FwYWNpdGl2ZSB0b3VjaCBzY3JlZW4sIHRoZXJl
Zm9yZQphZGQgc3VwcG9ydCBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2My0+djQ6CiogUmV3b3JrZWQg
Y29tcGF0aWJpbGl0eSBvZiBEVCBub2RlIGx2ZHMtcmVjZWl2ZXIKKiBzL3Bvd2VyZG93bi9wb3dl
cmRvd24tZ3Bpb3MvZyBpbiBsdmRzLXJlY2VpdmVyCiogUmV3b3JrZWQgY29tcGF0aWJpbGl0eSBv
ZiBEVCBub2RlIHBhbmVsCnYyLT52MzoKKiBObyBjaGFuZ2UKdjEtPnYyOgoqIE5vIGNoYW5nZQot
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaSAgfCA4NSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRi
Y20tY2EuZHRzaSB8ICAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21t
b24uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQppbmRleCBh
ZTc1YTFkYi4uYWI1YWU5MyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3
LWNvbW1vbi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRz
aQpAQCAtNDYsNiArNDYsNDkgQEAKIAkJY2xvY2stZnJlcXVlbmN5ID0gPDI2MDAwMDAwPjsKIAl9
OwogCisJbGNkX2JhY2tsaWdodDogYmFja2xpZ2h0IHsKKwkJY29tcGF0aWJsZSA9ICJwd20tYmFj
a2xpZ2h0IjsKKworCQlwd21zID0gPCZwd20zIDAgNTAwMDAwMCAwPjsKKwkJYnJpZ2h0bmVzcy1s
ZXZlbHMgPSA8MCA0IDggMTYgMzIgNjQgMTI4IDI1NT47CisJCWRlZmF1bHQtYnJpZ2h0bmVzcy1s
ZXZlbCA9IDw3PjsKKwkJZW5hYmxlLWdwaW9zID0gPCZncGlvNSAxNCBHUElPX0FDVElWRV9ISUdI
PjsKKwl9OworCisJbHZkcy1yZWNlaXZlciB7CisJCWNvbXBhdGlibGUgPSAidGksZHM5MGNmMzg0
YSIsICJsdmRzLWRlY29kZXIiOworCQlwb3dlcmRvd24tZ3Bpb3MgPSA8JmdwaW83IDI1IEdQSU9f
QUNUSVZFX0xPVz47CisKKwkJcG9ydHMgeworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkj
c2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJbHZk
c19yZWNlaXZlcl9pbjogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMw
X291dD47CisJCQkJfTsKKwkJCX07CisJCQlwb3J0QDEgeworCQkJCXJlZyA9IDwxPjsKKwkJCQls
dmRzX3JlY2VpdmVyX291dDogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBh
bmVsX2luPjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9OworCisJcGFuZWwgeworCQljb21wYXRp
YmxlID0gImVkdCxldG0wNzAwZzBkaDYiOworCQliYWNrbGlnaHQgPSA8JmxjZF9iYWNrbGlnaHQ+
OworCisJCXBvcnQgeworCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8Jmx2ZHNfcmVjZWl2ZXJfb3V0PjsKKwkJCX07CisJCX07CisJfTsKKwogCXJlZ18xcDV2
OiAxcDV2IHsKIAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0b3It
bmFtZSA9ICIxUDVWIjsKQEAgLTEyMCw2ICsxNjMsMTggQEAKIAlzdGF0dXMgPSAib2theSI7CiB9
OwogCismZHUgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZncGlvMiB7CisJdG91Y2gtaW50
ZXJydXB0IHsKKwkJZ3Bpby1ob2c7CisJCWdwaW9zID0gPDEyIEdQSU9fQUNUSVZFX0xPVz47CisJ
CWlucHV0OworCX07Cit9OworCiAmaHN1c2IgewogCXN0YXR1cyA9ICJva2F5IjsKIAlwaW5jdHJs
LTAgPSA8JnVzYjBfcGlucz47CkBAIC0xNDcsNiArMjAyLDI1IEBACiAJCVZERElPLXN1cHBseSA9
IDwmcmVnXzNwM3Y+OwogCQlWRERELXN1cHBseSA9IDwmcmVnXzFwNXY+OwogCX07CisKKwl0b3Vj
aDogdG91Y2hwYW5lbEAzOCB7CisJCWNvbXBhdGlibGUgPSAiZWR0LGVkdC1mdDU0MDYiOworCQly
ZWcgPSA8MHgzOD47CisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8yPjsKKwkJaW50ZXJydXB0
cyA9IDwxMiBJUlFfVFlQRV9FREdFX0ZBTExJTkc+OworCX07Cit9OworCismbHZkczAgeworCXN0
YXR1cyA9ICJva2F5IjsKKworCXBvcnRzIHsKKwkJcG9ydEAxIHsKKwkJCWx2ZHMwX291dDogZW5k
cG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc19yZWNlaXZlcl9pbj47CisJCQl9
OworCQl9OworCX07CiB9OwogCiAmcGNpMCB7CkBAIC0xODAsNiArMjU0LDExIEBACiAJCWZ1bmN0
aW9uID0gImkyYzIiOwogCX07CiAKKwlwd20zX3BpbnM6IHB3bTMgeworCQlncm91cHMgPSAicHdt
MyI7CisJCWZ1bmN0aW9uID0gInB3bTMiOworCX07CisKIAlzY2lmMF9waW5zOiBzY2lmMCB7CiAJ
CWdyb3VwcyA9ICJzY2lmMF9kYXRhX2QiOwogCQlmdW5jdGlvbiA9ICJzY2lmMCI7CkBAIC0yMTgs
NiArMjk3LDEyIEBACiAJfTsKIH07CiAKKyZwd20zIHsKKwlwaW5jdHJsLTAgPSA8JnB3bTNfcGlu
cz47CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlzdGF0dXMgPSAib2theSI7Cit9Owor
CiAmcmNhcl9zb3VuZCB7CiAJcGluY3RybC0wID0gPCZzb3VuZF9waW5zPjsKIAlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3
LWRiY20tY2EuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNtLWNhLmR0c2kK
aW5kZXggMGU5OWRmMi4uZWRlMmUwYyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdn
MjBkLXE3LWRiY20tY2EuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctZGJj
bS1jYS5kdHNpCkBAIC0zOSw3ICszOSw2IEBACiAmZHUgewogCXBpbmN0cmwtMCA9IDwmZHVfcGlu
cz47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKLQlzdGF0dXMgPSAib2theSI7CiAKIAlw
b3J0cyB7CiAJCXBvcnRAMCB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

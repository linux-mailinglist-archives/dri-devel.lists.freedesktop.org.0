Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC1F41D7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAC46F88C;
	Fri,  8 Nov 2019 08:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECFF56F790
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:11:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; d="scan'208";a="30895672"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:39 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 727E94009F8A;
 Fri,  8 Nov 2019 05:11:35 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 6/7] ARM: dts: iwg20d-q7-common: Add LCD support
Date: Thu,  7 Nov 2019 20:11:02 +0000
Message-Id: <1573157463-14070-7-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
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

VGhlIGl3ZzIwZCBjb21lcyB3aXRoIGEgNyIgY2FwYWNpdGl2ZSB0b3VjaCBzY3JlZW4sIHRoZXJl
Zm9yZQphZGQgc3VwcG9ydCBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2Mi0+djM6CiogTm8gY2hhbmdl
CnYxLT52MjoKKiBObyBjaGFuZ2UKLS0tCiBhcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctY29t
bW9uLmR0c2kgIHwgODUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvYXJt
L2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNtLWNhLmR0c2kgfCAgMSAtCiAyIGZpbGVzIGNoYW5nZWQs
IDg1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9pd2cyMGQtcTctY29tbW9uLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQt
cTctY29tbW9uLmR0c2kKaW5kZXggYWU3NWExZGIuLjM0MjhiOGQgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0
cy9pd2cyMGQtcTctY29tbW9uLmR0c2kKQEAgLTQ2LDYgKzQ2LDQ5IEBACiAJCWNsb2NrLWZyZXF1
ZW5jeSA9IDwyNjAwMDAwMD47CiAJfTsKIAorCWxjZF9iYWNrbGlnaHQ6IGJhY2tsaWdodCB7CisJ
CWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7CisKKwkJcHdtcyA9IDwmcHdtMyAwIDUwMDAw
MDAgMD47CisJCWJyaWdodG5lc3MtbGV2ZWxzID0gPDAgNCA4IDE2IDMyIDY0IDEyOCAyNTU+Owor
CQlkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwgPSA8Nz47CisJCWVuYWJsZS1ncGlvcyA9IDwmZ3Bp
bzUgMTQgR1BJT19BQ1RJVkVfSElHSD47CisJfTsKKworCWx2ZHMtcmVjZWl2ZXIgeworCQljb21w
YXRpYmxlID0gImx2ZHMtZGVjb2RlciI7CisJCXBvd2VyZG93biA9IDwmZ3BpbzcgMjUgR1BJT19B
Q1RJVkVfTE9XPjsKKworCQlwb3J0cyB7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNz
aXplLWNlbGxzID0gPDA+OworCisJCQlwb3J0QDAgeworCQkJCXJlZyA9IDwwPjsKKwkJCQlsdmRz
X3JlY2VpdmVyX2luOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczBf
b3V0PjsKKwkJCQl9OworCQkJfTsKKwkJCXBvcnRAMSB7CisJCQkJcmVnID0gPDE+OworCQkJCWx2
ZHNfcmVjZWl2ZXJfb3V0OiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFu
ZWxfaW4+OworCQkJCX07CisJCQl9OworCQl9OworCX07CisKKwlwYW5lbCB7CisJCWNvbXBhdGli
bGUgPSAiZWR0LGV0bTA3MDBnMGRoNiIsICJzaW1wbGUtcGFuZWwiOworCQliYWNrbGlnaHQgPSA8
JmxjZF9iYWNrbGlnaHQ+OworCisJCXBvcnQgeworCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJ
CQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfcmVjZWl2ZXJfb3V0PjsKKwkJCX07CisJCX07CisJ
fTsKKwogCXJlZ18xcDV2OiAxcDV2IHsKIAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQi
OwogCQlyZWd1bGF0b3ItbmFtZSA9ICIxUDVWIjsKQEAgLTEyMCw2ICsxNjMsMTggQEAKIAlzdGF0
dXMgPSAib2theSI7CiB9OwogCismZHUgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZncGlv
MiB7CisJdG91Y2gtaW50ZXJydXB0IHsKKwkJZ3Bpby1ob2c7CisJCWdwaW9zID0gPDEyIEdQSU9f
QUNUSVZFX0xPVz47CisJCWlucHV0OworCX07Cit9OworCiAmaHN1c2IgewogCXN0YXR1cyA9ICJv
a2F5IjsKIAlwaW5jdHJsLTAgPSA8JnVzYjBfcGlucz47CkBAIC0xNDcsNiArMjAyLDI1IEBACiAJ
CVZERElPLXN1cHBseSA9IDwmcmVnXzNwM3Y+OwogCQlWRERELXN1cHBseSA9IDwmcmVnXzFwNXY+
OwogCX07CisKKwl0b3VjaDogdG91Y2hwYW5lbEAzOCB7CisJCWNvbXBhdGlibGUgPSAiZWR0LGVk
dC1mdDU0MDYiOworCQlyZWcgPSA8MHgzOD47CisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8y
PjsKKwkJaW50ZXJydXB0cyA9IDwxMiBJUlFfVFlQRV9FREdFX0ZBTExJTkc+OworCX07Cit9Owor
CismbHZkczAgeworCXN0YXR1cyA9ICJva2F5IjsKKworCXBvcnRzIHsKKwkJcG9ydEAxIHsKKwkJ
CWx2ZHMwX291dDogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc19yZWNl
aXZlcl9pbj47CisJCQl9OworCQl9OworCX07CiB9OwogCiAmcGNpMCB7CkBAIC0xODAsNiArMjU0
LDExIEBACiAJCWZ1bmN0aW9uID0gImkyYzIiOwogCX07CiAKKwlwd20zX3BpbnM6IHB3bTMgewor
CQlncm91cHMgPSAicHdtMyI7CisJCWZ1bmN0aW9uID0gInB3bTMiOworCX07CisKIAlzY2lmMF9w
aW5zOiBzY2lmMCB7CiAJCWdyb3VwcyA9ICJzY2lmMF9kYXRhX2QiOwogCQlmdW5jdGlvbiA9ICJz
Y2lmMCI7CkBAIC0yMTgsNiArMjk3LDEyIEBACiAJfTsKIH07CiAKKyZwd20zIHsKKwlwaW5jdHJs
LTAgPSA8JnB3bTNfcGlucz47CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlzdGF0dXMg
PSAib2theSI7Cit9OworCiAmcmNhcl9zb3VuZCB7CiAJcGluY3RybC0wID0gPCZzb3VuZF9waW5z
PjsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1x
Ny1kYmNtLWNhLmR0c2kKaW5kZXggMGU5OWRmMi4uZWRlMmUwYyAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0
cy9pd2cyMGQtcTctZGJjbS1jYS5kdHNpCkBAIC0zOSw3ICszOSw2IEBACiAmZHUgewogCXBpbmN0
cmwtMCA9IDwmZHVfcGlucz47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKLQlzdGF0dXMg
PSAib2theSI7CiAKIAlwb3J0cyB7CiAJCXBvcnRAMCB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

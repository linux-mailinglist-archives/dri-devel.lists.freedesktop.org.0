Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7BBEAC24
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2F16EDCC;
	Thu, 31 Oct 2019 09:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFF2C6EA09
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:48:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,247,1569250800"; d="scan'208";a="30206768"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 30 Oct 2019 22:43:54 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id CD221400CA10;
 Wed, 30 Oct 2019 22:43:50 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/4] ARM: dts: iwg20d-q7-common: Add LCD support
Date: Wed, 30 Oct 2019 13:43:33 +0000
Message-Id: <1572443014-17335-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
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
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9p
d2cyMGQtcTctY29tbW9uLmR0c2kgIHwgODUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIGFyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNtLWNhLmR0c2kgfCAgMSAtCiAyIGZp
bGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctY29tbW9uLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9pd2cyMGQtcTctY29tbW9uLmR0c2kKaW5kZXggYWU3NWExZGIuLjM0MjhiOGQgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQorKysgYi9hcmNo
L2FybS9ib290L2R0cy9pd2cyMGQtcTctY29tbW9uLmR0c2kKQEAgLTQ2LDYgKzQ2LDQ5IEBACiAJ
CWNsb2NrLWZyZXF1ZW5jeSA9IDwyNjAwMDAwMD47CiAJfTsKIAorCWxjZF9iYWNrbGlnaHQ6IGJh
Y2tsaWdodCB7CisJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7CisKKwkJcHdtcyA9IDwm
cHdtMyAwIDUwMDAwMDAgMD47CisJCWJyaWdodG5lc3MtbGV2ZWxzID0gPDAgNCA4IDE2IDMyIDY0
IDEyOCAyNTU+OworCQlkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwgPSA8Nz47CisJCWVuYWJsZS1n
cGlvcyA9IDwmZ3BpbzUgMTQgR1BJT19BQ1RJVkVfSElHSD47CisJfTsKKworCWx2ZHMtcmVjZWl2
ZXIgeworCQljb21wYXRpYmxlID0gImx2ZHMtZGVjb2RlciI7CisJCXBvd2VyZG93biA9IDwmZ3Bp
bzcgMjUgR1BJT19BQ1RJVkVfTE9XPjsKKworCQlwb3J0cyB7CisJCQkjYWRkcmVzcy1jZWxscyA9
IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQlwb3J0QDAgeworCQkJCXJlZyA9IDww
PjsKKwkJCQlsdmRzX3JlY2VpdmVyX2luOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmbHZkczBfb3V0PjsKKwkJCQl9OworCQkJfTsKKwkJCXBvcnRAMSB7CisJCQkJcmVnID0g
PDE+OworCQkJCWx2ZHNfcmVjZWl2ZXJfb3V0OiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRw
b2ludCA9IDwmcGFuZWxfaW4+OworCQkJCX07CisJCQl9OworCQl9OworCX07CisKKwlwYW5lbCB7
CisJCWNvbXBhdGlibGUgPSAiZWR0LGV0bTA3MDBnMGRoNiIsICJzaW1wbGUtcGFuZWwiOworCQli
YWNrbGlnaHQgPSA8JmxjZF9iYWNrbGlnaHQ+OworCisJCXBvcnQgeworCQkJcGFuZWxfaW46IGVu
ZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfcmVjZWl2ZXJfb3V0PjsKKwkJ
CX07CisJCX07CisJfTsKKwogCXJlZ18xcDV2OiAxcDV2IHsKIAkJY29tcGF0aWJsZSA9ICJyZWd1
bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0b3ItbmFtZSA9ICIxUDVWIjsKQEAgLTEyMCw2ICsxNjMs
MTggQEAKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismZHUgeworCXN0YXR1cyA9ICJva2F5IjsK
K307CisKKyZncGlvMiB7CisJdG91Y2gtaW50ZXJydXB0IHsKKwkJZ3Bpby1ob2c7CisJCWdwaW9z
ID0gPDEyIEdQSU9fQUNUSVZFX0xPVz47CisJCWlucHV0OworCX07Cit9OworCiAmaHN1c2Igewog
CXN0YXR1cyA9ICJva2F5IjsKIAlwaW5jdHJsLTAgPSA8JnVzYjBfcGlucz47CkBAIC0xNDcsNiAr
MjAyLDI1IEBACiAJCVZERElPLXN1cHBseSA9IDwmcmVnXzNwM3Y+OwogCQlWRERELXN1cHBseSA9
IDwmcmVnXzFwNXY+OwogCX07CisKKwl0b3VjaDogdG91Y2hwYW5lbEAzOCB7CisJCWNvbXBhdGli
bGUgPSAiZWR0LGVkdC1mdDU0MDYiOworCQlyZWcgPSA8MHgzOD47CisJCWludGVycnVwdC1wYXJl
bnQgPSA8JmdwaW8yPjsKKwkJaW50ZXJydXB0cyA9IDwxMiBJUlFfVFlQRV9FREdFX0ZBTExJTkc+
OworCX07Cit9OworCismbHZkczAgeworCXN0YXR1cyA9ICJva2F5IjsKKworCXBvcnRzIHsKKwkJ
cG9ydEAxIHsKKwkJCWx2ZHMwX291dDogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9
IDwmbHZkc19yZWNlaXZlcl9pbj47CisJCQl9OworCQl9OworCX07CiB9OwogCiAmcGNpMCB7CkBA
IC0xODAsNiArMjU0LDExIEBACiAJCWZ1bmN0aW9uID0gImkyYzIiOwogCX07CiAKKwlwd20zX3Bp
bnM6IHB3bTMgeworCQlncm91cHMgPSAicHdtMyI7CisJCWZ1bmN0aW9uID0gInB3bTMiOworCX07
CisKIAlzY2lmMF9waW5zOiBzY2lmMCB7CiAJCWdyb3VwcyA9ICJzY2lmMF9kYXRhX2QiOwogCQlm
dW5jdGlvbiA9ICJzY2lmMCI7CkBAIC0yMTgsNiArMjk3LDEyIEBACiAJfTsKIH07CiAKKyZwd20z
IHsKKwlwaW5jdHJsLTAgPSA8JnB3bTNfcGlucz47CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmcmNhcl9zb3VuZCB7CiAJcGluY3RybC0wID0g
PCZzb3VuZF9waW5zPjsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2l3ZzIwZC1xNy1kYmNtLWNhLmR0c2kKaW5kZXggMGU5OWRmMi4uZWRlMmUwYyAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2EuZHRzaQorKysgYi9hcmNo
L2FybS9ib290L2R0cy9pd2cyMGQtcTctZGJjbS1jYS5kdHNpCkBAIC0zOSw3ICszOSw2IEBACiAm
ZHUgewogCXBpbmN0cmwtMCA9IDwmZHVfcGlucz47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKLQlzdGF0dXMgPSAib2theSI7CiAKIAlwb3J0cyB7CiAJCXBvcnRAMCB7Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

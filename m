Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78F5EE8C1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627E36E843;
	Mon,  4 Nov 2019 19:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 970316E626
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:58:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,267,1569250800"; d="scan'208";a="30581912"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 05 Nov 2019 01:58:27 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 08FE44005E08;
 Tue,  5 Nov 2019 01:58:22 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 3/4] ARM: dts: iwg20d-q7-common: Add LCD support
Date: Mon,  4 Nov 2019 16:58:02 +0000
Message-Id: <1572886683-4919-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1572886683-4919-1-git-send-email-fabrizio.castro@bp.renesas.com>
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

VGhlIGl3ZzIwZCBjb21lcyB3aXRoIGEgNyIgY2FwYWNpdGl2ZSB0b3VjaCBzY3JlZW4sIHRoZXJl
Zm9yZQphZGQgc3VwcG9ydCBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2MS0+djI6CiogTm8gY2hhbmdl
Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1vbi5kdHNpICB8IDg1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTct
ZGJjbS1jYS5kdHNpIHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNv
bW1vbi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1vbi5kdHNpCmluZGV4
IGFlNzVhMWRiLi4zNDI4YjhkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQt
cTctY29tbW9uLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWNvbW1vbi5k
dHNpCkBAIC00Niw2ICs0Niw0OSBAQAogCQljbG9jay1mcmVxdWVuY3kgPSA8MjYwMDAwMDA+Owog
CX07CiAKKwlsY2RfYmFja2xpZ2h0OiBiYWNrbGlnaHQgeworCQljb21wYXRpYmxlID0gInB3bS1i
YWNrbGlnaHQiOworCisJCXB3bXMgPSA8JnB3bTMgMCA1MDAwMDAwIDA+OworCQlicmlnaHRuZXNz
LWxldmVscyA9IDwwIDQgOCAxNiAzMiA2NCAxMjggMjU1PjsKKwkJZGVmYXVsdC1icmlnaHRuZXNz
LWxldmVsID0gPDc+OworCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW81IDE0IEdQSU9fQUNUSVZFX0hJ
R0g+OworCX07CisKKwlsdmRzLXJlY2VpdmVyIHsKKwkJY29tcGF0aWJsZSA9ICJsdmRzLWRlY29k
ZXIiOworCQlwb3dlcmRvd24gPSA8JmdwaW83IDI1IEdQSU9fQUNUSVZFX0xPVz47CisKKwkJcG9y
dHMgeworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwor
CQkJcG9ydEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJbHZkc19yZWNlaXZlcl9pbjogZW5kcG9p
bnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMwX291dD47CisJCQkJfTsKKwkJCX07
CisJCQlwb3J0QDEgeworCQkJCXJlZyA9IDwxPjsKKwkJCQlsdmRzX3JlY2VpdmVyX291dDogZW5k
cG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luPjsKKwkJCQl9OworCQkJ
fTsKKwkJfTsKKwl9OworCisJcGFuZWwgeworCQljb21wYXRpYmxlID0gImVkdCxldG0wNzAwZzBk
aDYiLCAic2ltcGxlLXBhbmVsIjsKKwkJYmFja2xpZ2h0ID0gPCZsY2RfYmFja2xpZ2h0PjsKKwor
CQlwb3J0IHsKKwkJCXBhbmVsX2luOiBlbmRwb2ludCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZsdmRzX3JlY2VpdmVyX291dD47CisJCQl9OworCQl9OworCX07CisKIAlyZWdfMXA1djogMXA1
diB7CiAJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKIAkJcmVndWxhdG9yLW5hbWUg
PSAiMVA1ViI7CkBAIC0xMjAsNiArMTYzLDE4IEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAor
JmR1IHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismZ3BpbzIgeworCXRvdWNoLWludGVycnVw
dCB7CisJCWdwaW8taG9nOworCQlncGlvcyA9IDwxMiBHUElPX0FDVElWRV9MT1c+OworCQlpbnB1
dDsKKwl9OworfTsKKwogJmhzdXNiIHsKIAlzdGF0dXMgPSAib2theSI7CiAJcGluY3RybC0wID0g
PCZ1c2IwX3BpbnM+OwpAQCAtMTQ3LDYgKzIwMiwyNSBAQAogCQlWRERJTy1zdXBwbHkgPSA8JnJl
Z18zcDN2PjsKIAkJVkRERC1zdXBwbHkgPSA8JnJlZ18xcDV2PjsKIAl9OworCisJdG91Y2g6IHRv
dWNocGFuZWxAMzggeworCQljb21wYXRpYmxlID0gImVkdCxlZHQtZnQ1NDA2IjsKKwkJcmVnID0g
PDB4Mzg+OworCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvMj47CisJCWludGVycnVwdHMgPSA8
MTIgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsKKwl9OworfTsKKworJmx2ZHMwIHsKKwlzdGF0dXMg
PSAib2theSI7CisKKwlwb3J0cyB7CisJCXBvcnRAMSB7CisJCQlsdmRzMF9vdXQ6IGVuZHBvaW50
IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfcmVjZWl2ZXJfaW4+OworCQkJfTsKKwkJ
fTsKKwl9OwogfTsKIAogJnBjaTAgewpAQCAtMTgwLDYgKzI1NCwxMSBAQAogCQlmdW5jdGlvbiA9
ICJpMmMyIjsKIAl9OwogCisJcHdtM19waW5zOiBwd20zIHsKKwkJZ3JvdXBzID0gInB3bTMiOwor
CQlmdW5jdGlvbiA9ICJwd20zIjsKKwl9OworCiAJc2NpZjBfcGluczogc2NpZjAgewogCQlncm91
cHMgPSAic2NpZjBfZGF0YV9kIjsKIAkJZnVuY3Rpb24gPSAic2NpZjAiOwpAQCAtMjE4LDYgKzI5
NywxMiBAQAogCX07CiB9OwogCismcHdtMyB7CisJcGluY3RybC0wID0gPCZwd20zX3BpbnM+Owor
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKwogJnJj
YXJfc291bmQgewogCXBpbmN0cmwtMCA9IDwmc291bmRfcGlucz47CiAJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1kYmNt
LWNhLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctZGJjbS1jYS5kdHNpCmluZGV4
IDBlOTlkZjIuLmVkZTJlMGMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1x
Ny1kYmNtLWNhLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaXdnMjBkLXE3LWRiY20tY2Eu
ZHRzaQpAQCAtMzksNyArMzksNiBAQAogJmR1IHsKIAlwaW5jdHJsLTAgPSA8JmR1X3BpbnM+Owog
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Ci0Jc3RhdHVzID0gIm9rYXkiOwogCiAJcG9ydHMg
ewogCQlwb3J0QDAgewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

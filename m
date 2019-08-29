Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C16A3254
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185236E282;
	Fri, 30 Aug 2019 08:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A48FF6E095
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:22:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="25025792"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 29 Aug 2019 19:22:05 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 250BF40B3513;
 Thu, 29 Aug 2019 19:22:00 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
Date: Thu, 29 Aug 2019 11:21:47 +0100
Message-Id: <1567074107-4899-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567074107-4899-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567074107-4899-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
 ebiharaml@si-linux.co.jp, xu_shunji@hoperun.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEhpSG9wZSBSWi9HMk0gaXMgYWR2ZXJ0aXNlZCBhcyBjb21wYXRpYmxlIHdpdGggcGFuZWwg
aWRrLTExMTB3cgpmcm9tIEFkdmFudGVjaCwgaG93ZXZlciB0aGUgcGFuZWwgaXNuJ3Qgc29sZCBh
bG9uZ3NpZGUgdGhlIGJvYXJkLgpBIG5ldyBkdHMsIGFkZGluZyBldmVyeXRoaW5nIHRoYXQncyBy
ZXF1aXJlZCB0byBnZXQgdGhlIHBhbmVsIHRvCndvcmsgdGhlIEhpSG9wZSBSWi9HMk0sIGlzIHRo
ZSBtb3N0IGNvbnZlbmllbnQgd2F5IHRvIHN1cHBvcnQgdGhlCkhpSG9wZSBSWi9HMk0gd2hlbiBp
dCdzIGNvbm5lY3RlZCB0byB0aGUgaWRrLTExMTB3ci4KClNpZ25lZC1vZmYtYnk6IEZhYnJpemlv
IENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgotLS0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDEgKwogLi4uL3I4YTc3
NGExLWhpaG9wZS1yemcybS1leC1pZGstMTExMHdyLmR0cyAgICAgICAgfCA4NiArKysrKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEtaGlob3BlLXJ6
ZzJtLWV4LWlkay0xMTEwd3IuZHRzCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlCmlu
ZGV4IDQyYjc0YzIuLjVkOTQzMDEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9NYWtlZmlsZQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUK
QEAgLTEsNiArMSw3IEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCiBkdGIt
JChDT05GSUdfQVJDSF9SOEE3NzRBMSkgKz0gcjhhNzc0YTEtaGlob3BlLXJ6ZzJtLmR0YgogZHRi
LSQoQ09ORklHX0FSQ0hfUjhBNzc0QTEpICs9IHI4YTc3NGExLWhpaG9wZS1yemcybS1leC5kdGIK
K2R0Yi0kKENPTkZJR19BUkNIX1I4QTc3NEExKSArPSByOGE3NzRhMS1oaWhvcGUtcnpnMm0tZXgt
aWRrLTExMTB3ci5kdGIKIGR0Yi0kKENPTkZJR19BUkNIX1I4QTc3NEMwKSArPSByOGE3NzRjMC1j
YXQ4NzQuZHRiIHI4YTc3NGMwLWVrODc0LmR0YgogZHRiLSQoQ09ORklHX0FSQ0hfUjhBNzc5NSkg
Kz0gcjhhNzc5NS1zYWx2YXRvci14LmR0YiByOGE3Nzk1LWgzdWxjYi5kdGIKIGR0Yi0kKENPTkZJ
R19BUkNIX1I4QTc3OTUpICs9IHI4YTc3OTUtaDN1bGNiLWtmLmR0YgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLWhpaG9wZS1yemcybS1leC1pZGstMTEx
MHdyLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS1oaWhvcGUtcnpn
Mm0tZXgtaWRrLTExMTB3ci5kdHMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4u
NjdmZTA0YwotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OGE3NzRhMS1oaWhvcGUtcnpnMm0tZXgtaWRrLTExMTB3ci5kdHMKQEAgLTAsMCArMSw4NiBAQAor
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKy8qCisgKiBEZXZpY2UgVHJlZSBT
b3VyY2UgZm9yIHRoZSBIaUhvcGUgUlovRzJNIHN1YiBib2FyZCBjb25uZWN0ZWQgdG8gYW4KKyAq
IEFkdmFudGVjaCBJREstMTExMFdSIDEwLjEiIExWRFMgcGFuZWwKKyAqCisgKiBDb3B5cmlnaHQg
KEMpIDIwMTkgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLgorICovCisKKyNpbmNsdWRlICJyOGE3
NzRhMS1oaWhvcGUtcnpnMm0tZXguZHRzIgorCisvIHsKKwliYWNrbGlnaHQgeworCQljb21wYXRp
YmxlID0gInB3bS1iYWNrbGlnaHQiOworCQlwd21zID0gPCZwd20wIDAgNTAwMDA+OworCisJCWJy
aWdodG5lc3MtbGV2ZWxzID0gPDAgMiA4IDE2IDMyIDY0IDEyOCAyNTU+OworCQlkZWZhdWx0LWJy
aWdodG5lc3MtbGV2ZWwgPSA8Nj47CisJfTsKKworCXBhbmVsLWx2ZHMgeworCQljb21wYXRpYmxl
ID0gImFkdmFudGVjaCxpZGstMTExMHdyIiwgInBhbmVsLWx2ZHMiOworCisJCXdpZHRoLW1tID0g
PDIyMz47CisJCWhlaWdodC1tbSA9IDwxMjU+OworCisJCWRhdGEtbWFwcGluZyA9ICJqZWlkYS0y
NCI7CisKKwkJcGFuZWwtdGltaW5nIHsKKwkJCS8qIDEwMjR4NjAwIEA2MEh6ICovCisJCQljbG9j
ay1mcmVxdWVuY3kgPSA8NTEyMDAwMDA+OworCQkJaGFjdGl2ZSA9IDwxMDI0PjsKKwkJCXZhY3Rp
dmUgPSA8NjAwPjsKKwkJCWhzeW5jLWxlbiA9IDwyNDA+OworCQkJaGZyb250LXBvcmNoID0gPDQw
PjsKKwkJCWhiYWNrLXBvcmNoID0gPDQwPjsKKwkJCXZmcm9udC1wb3JjaCA9IDwxNT47CisJCQl2
YmFjay1wb3JjaCA9IDwxMD47CisJCQl2c3luYy1sZW4gPSA8MTA+OworCQl9OworCisJCXBvcnQg
eworCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMw
X291dD47CisJCQl9OworCQl9OworCX07Cit9OworCismZ3BpbzEgeworCS8qCisJICogV2hlbiBH
UDFfMjAgaXMgTE9XIExWRFMwIGlzIGNvbm5lY3RlZCB0byB0aGUgTFZEUyBjb25uZWN0b3IKKwkg
KiBXaGVuIEdQMV8yMCBpcyBISUdIIExWRFMwIGlzIGNvbm5lY3RlZCB0byB0aGUgTFQ4OTE4TAor
CSAqLworCWx2ZHMtY29ubmVjdG9yLWVuLWdwaW97CisJCWdwaW8taG9nOworCQlncGlvcyA9IDwy
MCBHUElPX0FDVElWRV9ISUdIPjsKKwkJb3V0cHV0LWxvdzsKKwkJbGluZS1uYW1lID0gImx2ZHMt
Y29ubmVjdG9yLWVuLWdwaW8iOworCX07Cit9OworCismbHZkczAgeworCXN0YXR1cyA9ICJva2F5
IjsKKworCXBvcnRzIHsKKwkJcG9ydEAxIHsKKwkJCWx2ZHMwX291dDogZW5kcG9pbnQgeworCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW4+OworCQkJfTsKKwkJfTsKKwl9OworfTsKKwor
JnBmYyB7CisJcHdtMF9waW5zOiBwd20wIHsKKwkJZ3JvdXBzID0gInB3bTAiOworCQlmdW5jdGlv
biA9ICJwd20wIjsKKwl9OworfTsKKworJnB3bTAgeworCXBpbmN0cmwtMCA9IDwmcHdtMF9waW5z
PjsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCisJc3RhdHVzID0gIm9rYXkiOworfTsK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

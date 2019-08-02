Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE187EF0B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38C96ED49;
	Fri,  2 Aug 2019 08:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CDDB6ECE1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:39:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="23151155"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:34:53 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5C9F44007528;
 Fri,  2 Aug 2019 16:34:49 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH/RFC 04/12] dt-bindings: display: Add bindings for Advantech
 IDK-2121WR
Date: Fri,  2 Aug 2019 08:34:01 +0100
Message-Id: <1564731249-22671-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYW5lbCBpcyBoYW5kbGVkIHRocm91Z2ggdGhlIGdlbmVyaWMgbHZkcy1wYW5lbCBiaW5k
aW5ncywKc28gb25seSBuZWVkcyBpdHMgYWRkaXRpb25hbCBjb21wYXRpYmxlIHNwZWNpZmllZC4K
ClNvbWUgcGFuZWwgc3BlY2lmaWMgZG9jdW1lbnRhdGlvbiBjYW4gYmUgZm91bmQgaGVyZToKaHR0
cHM6Ly9idXkuYWR2YW50ZWNoLmV1L0Rpc3BsYXlzL0VtYmVkZGVkLUxDRC1LaXRzLUhpZ2gtQnJp
Z2h0bmVzcy9tb2RlbC1JREstMjEyMVdSLUsyRkhBMkUuaHRtCgpTaWduZWQtb2ZmLWJ5OiBGYWJy
aXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KLS0tCiAuLi4vZGlz
cGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQgICAgICAgICB8IDYyICsrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50
ZWNoLGlkay0yMTIxd3IudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjcw
YjE1YjYKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci50eHQKQEAgLTAsMCArMSw2MiBA
QAorQWR2YW50ZWNoIENvLiwgTHRkLiBJREstMjEyMVdSIDIxLjUiIExWRFMgcGFuZWwKKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisKK1JlcXVpcmVkIHBy
b3BlcnRpZXM6CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiYWR2YW50ZWNoLGlkay0yMTIxd3Ii
IGZvbGxvd2VkIGJ5ICJwYW5lbC1sdmRzIgorCitUaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3
aXRoIHRoZSBsdmRzLXBhbmVsIGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNpZmllZAoraW4gcGFuZWwt
bHZkcy50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCisKK0V4YW1wbGUKKy0tLS0tLS0KKworCXBhbmVs
IHsKKwkJY29tcGF0aWJsZSA9ICJhZHZhbnRlY2gsaWRrLTIxMjF3ciIsICJwYW5lbC1sdmRzIjsK
KworCQl3aWR0aC1tbSA9IDw0NzY+OworCQloZWlnaHQtbW0gPSA8MjY4PjsKKworCQlkYXRhLW1h
cHBpbmcgPSAidmVzYS0yNCI7CisKKwkJcGFuZWwtdGltaW5nIHsKKwkJCWNsb2NrLWZyZXF1ZW5j
eSA9IDwxNDg1MDAwMDA+OworCQkJaGFjdGl2ZSA9IDwxOTIwPjsKKwkJCXZhY3RpdmUgPSA8MTA4
MD47CisJCQloc3luYy1sZW4gPSA8NDQ+OworCQkJaGZyb250LXBvcmNoID0gPDg4PjsKKwkJCWhi
YWNrLXBvcmNoID0gPDE0OD47CisJCQl2ZnJvbnQtcG9yY2ggPSA8ND47CisJCQl2YmFjay1wb3Jj
aCA9IDwzNj47CisJCQl2c3luYy1sZW4gPSA8NT47CisJCX07CisKKwkJcG9ydHMgeworCQkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsK
KwkJCQlyZWcgPSA8MD47CisJCQkJbHZkczBfcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZsdmRzMF9vdXQ+OworCQkJCX07CisJCQl9OworCisJCQlwb3J0QDEg
eworCQkJCXJlZyA9IDwxPjsKKwkJCQlsdmRzMV9wYW5lbF9pbjogZW5kcG9pbnQgeworCQkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMxX291dD47CisJCQkJfTsKKwkJCX07CisJCX07CisJfTsK
KworCWJhY2tsaWdodDogYmFja2xpZ2h0IHsKKwkJY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0
IjsKKwkJcHdtcyA9IDwmcHdtNSAwIDUwMDAwPjsKKworCQlicmlnaHRuZXNzLWxldmVscyA9IDww
IDQgOCAxNiAzMiA2NCAxMjggMjU1PjsKKwkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDY+
OworCisJCXBvd2VyLXN1cHBseSA9IDwmcmVnXzEycDB2PjsKKwkJZW5hYmxlLWdwaW9zID0gPCZn
cGlvNiAxMiBHUElPX0FDVElWRV9ISUdIPjsKKwl9OwotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

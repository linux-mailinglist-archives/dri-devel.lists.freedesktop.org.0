Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8287EECB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6336ED05;
	Fri,  2 Aug 2019 08:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A05646ECDA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:39:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="23151144"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:34:47 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id C8BF140078B4;
 Fri,  2 Aug 2019 16:34:43 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH/RFC 03/12] dt-bindings: panel: lvds: Add dual-link LVDS
 display support
Date: Fri,  2 Aug 2019 08:34:00 +0100
Message-Id: <1564731249-22671-4-git-send-email-fabrizio.castro@bp.renesas.com>
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

RHVhbC1saW5rIExWRFMgZGlzcGxheXMgaGF2ZSB0d28gcG9ydHMsIHRoZXJlZm9yZSBkb2N1bWVu
dCB0aGlzCndpdGggdGhlIGJpbmRpbmdzLgoKU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJv
IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtbHZkcy50eHQgICAgICAgICAgfCA5MSArKysrKysrKysrKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcGFuZWwtbHZkcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9wYW5lbC1sdmRzLnR4dAppbmRleCAyNTA4NTBhLi4wNzc5NTQ0MSAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFu
ZWwtbHZkcy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtbHZkcy50eHQKQEAgLTQxLDcgKzQxLDggQEAgUmVxdWlyZWQgbm9kZXM6
CiAKIC0gcGFuZWwtdGltaW5nOiBTZWUgcGFuZWwtY29tbW9uLnR4dC4KIC0gcG9ydHM6IFNlZSBw
YW5lbC1jb21tb24udHh0LiBUaGVzZSBiaW5kaW5ncyByZXF1aXJlIGEgc2luZ2xlIHBvcnQgc3Vi
bm9kZQotICBjb3JyZXNwb25kaW5nIHRvIHRoZSBwYW5lbCBMVkRTIGlucHV0LgorICAoZm9yIGEg
c2luZ2xlIGxpbmsgZGlzcGxheSkgb3IgdHdvIHBvcnQgc3Vibm9kZXMgKGZvciBhIGR1YWwgbGlu
ayBkaXNwbGF5KQorICBjb3JyZXNwb25kaW5nIHRvIHRoZSBwYW5lbCBMVkRTIGlucHV0KHMpLgog
CiAKIExWRFMgZGF0YSBtYXBwaW5ncyBhcmUgZGVmaW5lZCBhcyBmb2xsb3dzLgpAQCAtOTIsMzAg
KzkzLDcyIEBAIENUTDM6IDAKIEV4YW1wbGUKIC0tLS0tLS0KIAotcGFuZWwgewotCWNvbXBhdGli
bGUgPSAibWl0c3ViaXNoaSxhYTEyMXRkMDEiLCAicGFuZWwtbHZkcyI7Ci0KLQl3aWR0aC1tbSA9
IDwyNjE+OwotCWhlaWdodC1tbSA9IDwxNjM+OwotCi0JZGF0YS1tYXBwaW5nID0gImplaWRhLTI0
IjsKLQotCXBhbmVsLXRpbWluZyB7Ci0JCS8qIDEyODB4ODAwIEA2MEh6ICovCi0JCWNsb2NrLWZy
ZXF1ZW5jeSA9IDw3MTAwMDAwMD47Ci0JCWhhY3RpdmUgPSA8MTI4MD47Ci0JCXZhY3RpdmUgPSA8
ODAwPjsKLQkJaHN5bmMtbGVuID0gPDcwPjsKLQkJaGZyb250LXBvcmNoID0gPDIwPjsKLQkJaGJh
Y2stcG9yY2ggPSA8NzA+OwotCQl2c3luYy1sZW4gPSA8NT47Ci0JCXZmcm9udC1wb3JjaCA9IDwz
PjsKLQkJdmJhY2stcG9yY2ggPSA8MTU+OworU2luZ2xlIHBvcnQ6CisJcGFuZWwgeworCQljb21w
YXRpYmxlID0gIm1pdHN1YmlzaGksYWExMjF0ZDAxIiwgInBhbmVsLWx2ZHMiOworCisJCXdpZHRo
LW1tID0gPDI2MT47CisJCWhlaWdodC1tbSA9IDwxNjM+OworCisJCWRhdGEtbWFwcGluZyA9ICJq
ZWlkYS0yNCI7CisKKwkJcGFuZWwtdGltaW5nIHsKKwkJCS8qIDEyODB4ODAwIEA2MEh6ICovCisJ
CQljbG9jay1mcmVxdWVuY3kgPSA8NzEwMDAwMDA+OworCQkJaGFjdGl2ZSA9IDwxMjgwPjsKKwkJ
CXZhY3RpdmUgPSA8ODAwPjsKKwkJCWhzeW5jLWxlbiA9IDw3MD47CisJCQloZnJvbnQtcG9yY2gg
PSA8MjA+OworCQkJaGJhY2stcG9yY2ggPSA8NzA+OworCQkJdnN5bmMtbGVuID0gPDU+OworCQkJ
dmZyb250LXBvcmNoID0gPDM+OworCQkJdmJhY2stcG9yY2ggPSA8MTU+OworCQl9OworCisJCXBv
cnQgeworCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2
ZHNfZW5jb2Rlcj47CisJCQl9OworCQl9OwogCX07CiAKLQlwb3J0IHsKLQkJcGFuZWxfaW46IGVu
ZHBvaW50IHsKLQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc19lbmNvZGVyPjsKK1R3byBwb3J0
czoKKwlwYW5lbCB7CisJCWNvbXBhdGlibGUgPSAiYWR2YW50ZWNoLGlkay0yMTIxd3IiLCAicGFu
ZWwtbHZkcyI7CisKKwkJd2lkdGgtbW0gPSA8NDc2PjsKKwkJaGVpZ2h0LW1tID0gPDI2OD47CisK
KwkJZGF0YS1tYXBwaW5nID0gInZlc2EtMjQiOworCisJCXBhbmVsLXRpbWluZyB7CisJCQljbG9j
ay1mcmVxdWVuY3kgPSA8MTQ4NTAwMDAwPjsKKwkJCWhhY3RpdmUgPSA8MTkyMD47CisJCQl2YWN0
aXZlID0gPDEwODA+OworCQkJaHN5bmMtbGVuID0gPDQ0PjsKKwkJCWhmcm9udC1wb3JjaCA9IDw4
OD47CisJCQloYmFjay1wb3JjaCA9IDwxNDg+OworCQkJdmZyb250LXBvcmNoID0gPDQ+OworCQkJ
dmJhY2stcG9yY2ggPSA8MzY+OworCQkJdnN5bmMtbGVuID0gPDU+OworCQl9OworCisJCXBvcnRz
IHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJ
CXBvcnRAMCB7CisJCQkJcmVnID0gPDA+OworCQkJCWx2ZHMwX3BhbmVsX2luOiBlbmRwb2ludCB7
CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczBfb3V0PjsKKwkJCQl9OworCQkJfTsKKwor
CQkJcG9ydEAxIHsKKwkJCQlyZWcgPSA8MT47CisJCQkJbHZkczFfcGFuZWxfaW46IGVuZHBvaW50
IHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzMV9vdXQ+OworCQkJCX07CisJCQl9Owog
CQl9OwogCX07Ci19OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

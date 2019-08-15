Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788491147
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22EA6E55C;
	Sat, 17 Aug 2019 15:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73B116E2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:04:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,389,1559487600"; d="scan'208";a="23867451"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 15 Aug 2019 20:04:52 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1016441773E8;
 Thu, 15 Aug 2019 20:04:46 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/9] dt-bindings: panel: lvds: Add dual-link LVDS display
 support
Date: Thu, 15 Aug 2019 12:04:25 +0100
Message-Id: <1565867073-24746-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHVhbC1saW5rIExWRFMgZGlzcGxheXMgaGF2ZSB0d28gcG9ydHMsIHRoZXJlZm9yZSBkb2N1bWVu
dCB0aGlzCndpdGggdGhlIGJpbmRpbmdzLgoKU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJv
IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjEtPnYyOgoqIFJld29ya2Vk
IHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgcG9ydHMgcHJvcGVydHkKKiBsdmRzMF9wYW5lbF9pbiBp
biB0aGUgZXhhbXBsZSBoYXMgYmVlbiByZW5hbWVkIHRvIHBhbmVsX2luMAoqIGx2ZHMxX3BhbmVs
X2luIGluIHRoZSBleGFtcGxlIGhhcyBiZWVuIHJlbmFtZWQgdG8gcGFuZWxfaW4xCgpMYXVyZW50
LAoKaW4gbGludXgtbmV4dCB0aGV5IGFyZSBub3cgd29ya2luZyB3aXRoOgpEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sdmRzLnlhbWwKCldoYXQgc2hvdWxk
IEkgZG8gaGVyZT8KClRoYW5rcywKRmFiCgoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Bh
bmVsLWx2ZHMudHh0ICAgICAgICAgIHwgOTUgKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWx2
ZHMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
cGFuZWwtbHZkcy50eHQKaW5kZXggMjUwODUwYS4uNTIzMTI0MyAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtbHZkcy50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFu
ZWwtbHZkcy50eHQKQEAgLTQxLDcgKzQxLDEyIEBAIFJlcXVpcmVkIG5vZGVzOgogCiAtIHBhbmVs
LXRpbWluZzogU2VlIHBhbmVsLWNvbW1vbi50eHQuCiAtIHBvcnRzOiBTZWUgcGFuZWwtY29tbW9u
LnR4dC4gVGhlc2UgYmluZGluZ3MgcmVxdWlyZSBhIHNpbmdsZSBwb3J0IHN1Ym5vZGUKLSAgY29y
cmVzcG9uZGluZyB0byB0aGUgcGFuZWwgTFZEUyBpbnB1dC4KKyAgKGZvciBhIHNpbmdsZSBsaW5r
IHBhbmVsKSBjb3JyZXNwb25kaW5nIHRvIHRoZSBwYW5lbCBMVkRTIGlucHV0LCBvciB0d28gcG9y
dAorICBzdWJub2RlcyAoZm9yIGEgZHVhbCBsaW5rIHBhbmVsKSBjb3JyZXNwb25kaW5nIHRvIHRo
ZSBwYW5lbCBMVkRTIGlucHV0cy4KKyAgRHVhbC1saW5rIExWRFMgcGFuZWxzIGV4cGVjdCBldmVu
IHBpeGVscyAoMCwgMiwgNCwgZXRjLikgYW5kIG9kZCBwaXhlbHMgKDEsIDMsCisgIDUsIGV0Yy4p
IG9uIGRpZmZlcmVudCBpbnB1dCBwb3J0cywgaXQncyB1cCB0byB0aGUgcGFuZWwtc3BlY2lmaWMg
YmluZGluZ3MgdG8KKyAgc3BlY2lmeSB3aGF0IHBvcnQgaXMgZXhwZWN0aW5nIGV2ZW4gcGl4ZWxz
LCBhbmQgd2hhdCBwb3J0IGlzIGV4cGVjdGluZyBvZGQKKyAgcGl4ZWxzLgogCiAKIExWRFMgZGF0
YSBtYXBwaW5ncyBhcmUgZGVmaW5lZCBhcyBmb2xsb3dzLgpAQCAtOTIsMzAgKzk3LDcyIEBAIENU
TDM6IDAKIEV4YW1wbGUKIC0tLS0tLS0KIAotcGFuZWwgewotCWNvbXBhdGlibGUgPSAibWl0c3Vi
aXNoaSxhYTEyMXRkMDEiLCAicGFuZWwtbHZkcyI7Ci0KLQl3aWR0aC1tbSA9IDwyNjE+OwotCWhl
aWdodC1tbSA9IDwxNjM+OwotCi0JZGF0YS1tYXBwaW5nID0gImplaWRhLTI0IjsKLQotCXBhbmVs
LXRpbWluZyB7Ci0JCS8qIDEyODB4ODAwIEA2MEh6ICovCi0JCWNsb2NrLWZyZXF1ZW5jeSA9IDw3
MTAwMDAwMD47Ci0JCWhhY3RpdmUgPSA8MTI4MD47Ci0JCXZhY3RpdmUgPSA8ODAwPjsKLQkJaHN5
bmMtbGVuID0gPDcwPjsKLQkJaGZyb250LXBvcmNoID0gPDIwPjsKLQkJaGJhY2stcG9yY2ggPSA8
NzA+OwotCQl2c3luYy1sZW4gPSA8NT47Ci0JCXZmcm9udC1wb3JjaCA9IDwzPjsKLQkJdmJhY2st
cG9yY2ggPSA8MTU+OworU2luZ2xlIHBvcnQ6CisJcGFuZWwgeworCQljb21wYXRpYmxlID0gIm1p
dHN1YmlzaGksYWExMjF0ZDAxIiwgInBhbmVsLWx2ZHMiOworCisJCXdpZHRoLW1tID0gPDI2MT47
CisJCWhlaWdodC1tbSA9IDwxNjM+OworCisJCWRhdGEtbWFwcGluZyA9ICJqZWlkYS0yNCI7CisK
KwkJcGFuZWwtdGltaW5nIHsKKwkJCS8qIDEyODB4ODAwIEA2MEh6ICovCisJCQljbG9jay1mcmVx
dWVuY3kgPSA8NzEwMDAwMDA+OworCQkJaGFjdGl2ZSA9IDwxMjgwPjsKKwkJCXZhY3RpdmUgPSA8
ODAwPjsKKwkJCWhzeW5jLWxlbiA9IDw3MD47CisJCQloZnJvbnQtcG9yY2ggPSA8MjA+OworCQkJ
aGJhY2stcG9yY2ggPSA8NzA+OworCQkJdnN5bmMtbGVuID0gPDU+OworCQkJdmZyb250LXBvcmNo
ID0gPDM+OworCQkJdmJhY2stcG9yY2ggPSA8MTU+OworCQl9OworCisJCXBvcnQgeworCQkJcGFu
ZWxfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHNfZW5jb2Rlcj47
CisJCQl9OworCQl9OwogCX07CiAKLQlwb3J0IHsKLQkJcGFuZWxfaW46IGVuZHBvaW50IHsKLQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc19lbmNvZGVyPjsKK1R3byBwb3J0czoKKwlwYW5lbCB7
CisJCWNvbXBhdGlibGUgPSAiYWR2YW50ZWNoLGlkay0yMTIxd3IiLCAicGFuZWwtbHZkcyI7CisK
KwkJd2lkdGgtbW0gPSA8NDc2PjsKKwkJaGVpZ2h0LW1tID0gPDI2OD47CisKKwkJZGF0YS1tYXBw
aW5nID0gInZlc2EtMjQiOworCisJCXBhbmVsLXRpbWluZyB7CisJCQljbG9jay1mcmVxdWVuY3kg
PSA8MTQ4NTAwMDAwPjsKKwkJCWhhY3RpdmUgPSA8MTkyMD47CisJCQl2YWN0aXZlID0gPDEwODA+
OworCQkJaHN5bmMtbGVuID0gPDQ0PjsKKwkJCWhmcm9udC1wb3JjaCA9IDw4OD47CisJCQloYmFj
ay1wb3JjaCA9IDwxNDg+OworCQkJdmZyb250LXBvcmNoID0gPDQ+OworCQkJdmJhY2stcG9yY2gg
PSA8MzY+OworCQkJdnN5bmMtbGVuID0gPDU+OworCQl9OworCisJCXBvcnRzIHsKKwkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJCXBvcnRAMCB7CisJ
CQkJcmVnID0gPDA+OworCQkJCXBhbmVsX2luMDogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5k
cG9pbnQgPSA8Jmx2ZHMwX291dD47CisJCQkJfTsKKwkJCX07CisKKwkJCXBvcnRAMSB7CisJCQkJ
cmVnID0gPDE+OworCQkJCXBhbmVsX2luMTogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8Jmx2ZHMxX291dD47CisJCQkJfTsKKwkJCX07CiAJCX07CiAJfTsKLX07Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

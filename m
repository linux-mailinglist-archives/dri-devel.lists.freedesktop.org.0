Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDEC9114B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15C36E544;
	Sat, 17 Aug 2019 15:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id E91626E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 11:04:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,388,1559487600"; d="scan'208";a="24088287"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2019 20:04:58 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id D6FE741773C3;
 Thu, 15 Aug 2019 20:04:52 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/9] dt-bindings: display: Add bindings for Advantech
 IDK-2121WR
Date: Thu, 15 Aug 2019 12:04:26 +0100
Message-Id: <1565867073-24746-3-git-send-email-fabrizio.castro@bp.renesas.com>
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

VGhpcyBwYW5lbCBpcyBoYW5kbGVkIHRocm91Z2ggdGhlIGdlbmVyaWMgbHZkcy1wYW5lbCBiaW5k
aW5ncywKc28gb25seSBuZWVkcyBpdHMgYWRkaXRpb25hbCBjb21wYXRpYmxlIHNwZWNpZmllZC4K
ClNvbWUgcGFuZWwtc3BlY2lmaWMgZG9jdW1lbnRhdGlvbiBjYW4gYmUgZm91bmQgaGVyZToKaHR0
cHM6Ly9idXkuYWR2YW50ZWNoLmV1L0Rpc3BsYXlzL0VtYmVkZGVkLUxDRC1LaXRzLUhpZ2gtQnJp
Z2h0bmVzcy9tb2RlbC1JREstMjEyMVdSLUsyRkhBMkUuaHRtCgpTaWduZWQtb2ZmLWJ5OiBGYWJy
aXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2MS0+djI6
CiogUmV3b3JrZWQgYWNjb3JkaW5nIHRvIExhdXJlbnQncyBmZWVkYmFjawoqIFJlbmFtZWQgbHZk
czBfcGFuZWxfaW4gdG8gcGFuZWxfaW4wCiogUmVuYW1lZCBsdmRzMV9wYW5lbF9pbiB0byBwYW5l
bF9pbjEKCkxhdXJlbnQsCgpTaG91bGQgdGhpcyBiZSBhIC55YW1sIGZpbGUgYWxyZWFkeT8KClRo
YW5rcywKRmFiCgogLi4uL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IudHh0ICAg
ICAgICAgfCA1NiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnR4dAoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFu
dGVjaCxpZGstMjEyMXdyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwLi42ZWUxZDFiCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3Iu
dHh0CkBAIC0wLDAgKzEsNTYgQEAKK0FkdmFudGVjaCBDby4sIEx0ZC4gSURLLTIxMjFXUiAyMS41
IiBMVkRTIHBhbmVsCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImFk
dmFudGVjaCxpZGstMjEyMXdyIiBmb2xsb3dlZCBieSAicGFuZWwtbHZkcyIKKworVGhpcyBiaW5k
aW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgbHZkcy1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBz
cGVjaWZpZWQKK2luIHBhbmVsLWx2ZHMudHh0IGluIHRoaXMgZGlyZWN0b3J5LgorVGhlIHBhbmVs
IG9wZXJhdGVzIGluIGR1YWwtbGluayBtb2RlIGFuZCB0aHVzIHJlcXVpcmVzIHR3byBwb3J0IG5v
ZGVzLAordGhlIGZpcnN0IHBvcnQgbm9kZSBleHBlY3RzIG9kZCBwaXhlbHMgKDEsIDMsIDUsIGV0
Yy4pIGFuZCB0aGUgc2Vjb25kIHBvcnQKK2V4cGVjdHMgZXZlbiBwaXhlbHMgKDAsIDIsIDQsIGV0
Yy4pLgorCitFeGFtcGxlCistLS0tLS0tCisKKwlwYW5lbCB7CisJCWNvbXBhdGlibGUgPSAiYWR2
YW50ZWNoLGlkay0yMTIxd3IiLCAicGFuZWwtbHZkcyI7CisKKwkJd2lkdGgtbW0gPSA8NDc2PjsK
KwkJaGVpZ2h0LW1tID0gPDI2OD47CisKKwkJZGF0YS1tYXBwaW5nID0gInZlc2EtMjQiOworCisJ
CXBhbmVsLXRpbWluZyB7CisJCQljbG9jay1mcmVxdWVuY3kgPSA8MTQ4NTAwMDAwPjsKKwkJCWhh
Y3RpdmUgPSA8MTkyMD47CisJCQl2YWN0aXZlID0gPDEwODA+OworCQkJaHN5bmMtbGVuID0gPDQ0
PjsKKwkJCWhmcm9udC1wb3JjaCA9IDw4OD47CisJCQloYmFjay1wb3JjaCA9IDwxNDg+OworCQkJ
dmZyb250LXBvcmNoID0gPDQ+OworCQkJdmJhY2stcG9yY2ggPSA8MzY+OworCQkJdnN5bmMtbGVu
ID0gPDU+OworCQl9OworCisJCXBvcnRzIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJ
I3NpemUtY2VsbHMgPSA8MD47CisKKwkJCXBvcnRAMCB7CisJCQkJLyogT2RkIHBpeGVscyAqLwor
CQkJCXJlZyA9IDwwPjsKKwkJCQlwYW5lbF9pbjA6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVu
ZHBvaW50ID0gPCZsdmRzMF9vdXQ+OworCQkJCX07CisJCQl9OworCisJCQlwb3J0QDEgeworCQkJ
CS8qIEV2ZW4gcGl4ZWxzICovCisJCQkJcmVnID0gPDE+OworCQkJCXBhbmVsX2luMTogZW5kcG9p
bnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmx2ZHMxX291dD47CisJCQkJfTsKKwkJCX07
CisJCX07CisJfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

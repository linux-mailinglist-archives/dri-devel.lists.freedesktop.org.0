Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF0A3266
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387126E2A3;
	Fri, 30 Aug 2019 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 70E466E095
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:22:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="25025781"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 29 Aug 2019 19:22:00 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 30BFC40B3513;
 Thu, 29 Aug 2019 19:21:55 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] dt-bindings: display: Add idk-1110wr binding
Date: Thu, 29 Aug 2019 11:21:46 +0100
Message-Id: <1567074107-4899-2-git-send-email-fabrizio.castro@bp.renesas.com>
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
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpbmRpbmcgZm9yIHRoZSBpZGstMTExMHdyIExWRFMgcGFuZWwgZnJvbSBBZHZhbnRlY2gu
CgpTb21lIHBhbmVsLXNwZWNpZmljIGRvY3VtZW50YXRpb24gY2FuIGJlIGZvdW5kIGhlcmU6Cmh0
dHBzOi8vYnV5LmFkdmFudGVjaC5ldS9EaXNwbGF5cy9FbWJlZGRlZC1MQ0QtS2l0cy1MQ0QtS2l0
LU1vZHVsZXMvbW9kZWwtSURLLTExMTBXUi01NVdTQTFFLmh0bQoKU2lnbmVkLW9mZi1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Ci0tLQogLi4uL2Rp
c3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0xMTEwd3IueWFtbCAgICAgICAgfCA2OSArKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL2FkdmFudGVjaCxpZGstMTExMHdyLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTExMTB3ci55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2
YW50ZWNoLGlkay0xMTEwd3IueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
Li5lNWZkYWEwCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0xMTEwd3IueWFtbApAQCAtMCwwICsx
LDY5IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0t
LQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2FkdmFu
dGVjaCxpZGstMTExMHdyLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEFkdmFudGVjaCBJREstMTExMFdSIDEwLjEi
IFdTVkdBIExWRFMgRGlzcGxheSBQYW5lbAorCittYWludGFpbmVyczoKKyAgLSBGYWJyaXppbyBD
YXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KKyAgLSBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgorCithbGxPZjoKKyAgLSAkcmVmOiBsdmRzLnlh
bWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgaXRlbXM6CisgICAgICAtIGNv
bnN0OiBhZHZhbnRlY2gsaWRrLTExMTB3cgorICAgICAgLSB7fSAjIHBhbmVsLWx2ZHMsIGJ1dCBu
b3QgbGlzdGVkIGhlcmUgdG8gYXZvaWQgZmFsc2Ugc2VsZWN0CisKKyAgZGF0YS1tYXBwaW5nOgor
ICAgIGNvbnN0OiBqZWlkYS0yNAorCisgIHdpZHRoLW1tOgorICAgIGNvbnN0OiAyMjMKKworICBo
ZWlnaHQtbW06CisgICAgY29uc3Q6IDEyNQorCisgIHBhbmVsLXRpbWluZzogdHJ1ZQorICBwb3J0
OiB0cnVlCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCityZXF1aXJlZDoKKyAgLSBj
b21wYXRpYmxlCisKK2V4YW1wbGVzOgorICAtIHwrCisgICAgcGFuZWwgeworICAgICAgY29tcGF0
aWJsZSA9ICJhZHZhbnRlY2gsaWRrLTExMTB3ciIsICJwYW5lbC1sdmRzIjsKKworICAgICAgd2lk
dGgtbW0gPSA8MjIzPjsKKyAgICAgIGhlaWdodC1tbSA9IDwxMjU+OworCisgICAgICBkYXRhLW1h
cHBpbmcgPSAiamVpZGEtMjQiOworCisgICAgICBwYW5lbC10aW1pbmcgeworICAgICAgICAvKiAx
MDI0eDYwMCBANjBIeiAqLworICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8NTEyMDAwMDA+Owor
ICAgICAgICBoYWN0aXZlID0gPDEwMjQ+OworICAgICAgICB2YWN0aXZlID0gPDYwMD47CisgICAg
ICAgIGhzeW5jLWxlbiA9IDwyNDA+OworICAgICAgICBoZnJvbnQtcG9yY2ggPSA8NDA+OworICAg
ICAgICBoYmFjay1wb3JjaCA9IDw0MD47CisgICAgICAgIHZzeW5jLWxlbiA9IDwxMD47CisgICAg
ICAgIHZmcm9udC1wb3JjaCA9IDwxNT47CisgICAgICAgIHZiYWNrLXBvcmNoID0gPDEwPjsKKyAg
ICAgIH07CisKKyAgICAgIHBvcnQgeworICAgICAgICBwYW5lbF9pbjogZW5kcG9pbnQgeworICAg
ICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc19lbmNvZGVyPjsKKyAgICAgICAgfTsKKyAg
ICAgIH07CisgICAgfTsKKworLi4uCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

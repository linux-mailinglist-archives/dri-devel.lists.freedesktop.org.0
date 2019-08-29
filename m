Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFFAA3255
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839A56E28C;
	Fri, 30 Aug 2019 08:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED7A56E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:38:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="25249618"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 20:38:45 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BD6B400C423;
 Thu, 29 Aug 2019 20:38:40 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/2] dt-bindings: display: Add idk-1110wr binding
Date: Thu, 29 Aug 2019 12:38:32 +0100
Message-Id: <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
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
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Ci0tLQp2MS0+djI6
Ciogbm8gY2hhbmdlCgogLi4uL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0xMTEwd3IueWFt
bCAgICAgICAgfCA2OSArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjkg
aW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMTExMHdyLnlhbWwKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9h
ZHZhbnRlY2gsaWRrLTExMTB3ci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0xMTEwd3IueWFtbApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwLi5lNWZkYWEwCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0x
MTEwd3IueWFtbApAQCAtMCwwICsxLDY5IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMTExMHdyLnlhbWwjCiskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEFkdmFu
dGVjaCBJREstMTExMFdSIDEwLjEiIFdTVkdBIExWRFMgRGlzcGxheSBQYW5lbAorCittYWludGFp
bmVyczoKKyAgLSBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNv
bT4KKyAgLSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgorCithbGxP
ZjoKKyAgLSAkcmVmOiBsdmRzLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6Cisg
ICAgaXRlbXM6CisgICAgICAtIGNvbnN0OiBhZHZhbnRlY2gsaWRrLTExMTB3cgorICAgICAgLSB7
fSAjIHBhbmVsLWx2ZHMsIGJ1dCBub3QgbGlzdGVkIGhlcmUgdG8gYXZvaWQgZmFsc2Ugc2VsZWN0
CisKKyAgZGF0YS1tYXBwaW5nOgorICAgIGNvbnN0OiBqZWlkYS0yNAorCisgIHdpZHRoLW1tOgor
ICAgIGNvbnN0OiAyMjMKKworICBoZWlnaHQtbW06CisgICAgY29uc3Q6IDEyNQorCisgIHBhbmVs
LXRpbWluZzogdHJ1ZQorICBwb3J0OiB0cnVlCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisKK2V4YW1wbGVzOgorICAtIHwrCisgICAg
cGFuZWwgeworICAgICAgY29tcGF0aWJsZSA9ICJhZHZhbnRlY2gsaWRrLTExMTB3ciIsICJwYW5l
bC1sdmRzIjsKKworICAgICAgd2lkdGgtbW0gPSA8MjIzPjsKKyAgICAgIGhlaWdodC1tbSA9IDwx
MjU+OworCisgICAgICBkYXRhLW1hcHBpbmcgPSAiamVpZGEtMjQiOworCisgICAgICBwYW5lbC10
aW1pbmcgeworICAgICAgICAvKiAxMDI0eDYwMCBANjBIeiAqLworICAgICAgICBjbG9jay1mcmVx
dWVuY3kgPSA8NTEyMDAwMDA+OworICAgICAgICBoYWN0aXZlID0gPDEwMjQ+OworICAgICAgICB2
YWN0aXZlID0gPDYwMD47CisgICAgICAgIGhzeW5jLWxlbiA9IDwyNDA+OworICAgICAgICBoZnJv
bnQtcG9yY2ggPSA8NDA+OworICAgICAgICBoYmFjay1wb3JjaCA9IDw0MD47CisgICAgICAgIHZz
eW5jLWxlbiA9IDwxMD47CisgICAgICAgIHZmcm9udC1wb3JjaCA9IDwxNT47CisgICAgICAgIHZi
YWNrLXBvcmNoID0gPDEwPjsKKyAgICAgIH07CisKKyAgICAgIHBvcnQgeworICAgICAgICBwYW5l
bF9pbjogZW5kcG9pbnQgeworICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc19lbmNv
ZGVyPjsKKyAgICAgICAgfTsKKyAgICAgIH07CisgICAgfTsKKworLi4uCi0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

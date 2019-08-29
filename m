Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA42A3259
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E166E28B;
	Fri, 30 Aug 2019 08:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id E384E6E095
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:21:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="25244310"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 19:21:55 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3F25F40B3513;
 Thu, 29 Aug 2019 19:21:51 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/2] Add LVDS panel support to HiHope RZ/G2M
Date: Thu, 29 Aug 2019 11:21:45 +0100
Message-Id: <1567074107-4899-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
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

RGVhciBBbGwsCgp0aGUgSGlIb3BlIFJaL0cyTSBpcyBhZHZlcnRpc2VkIGFzIHN1cHBvcnRpbmcg
cGFuZWwgaWRrLTExMTB3ciBmcm9tCkFkdmFudGVjaCwgYnV0IHRoZSBwYW5lbCBkb2Vzbid0IGNv
bWUgd2l0aCB0aGUgYm9hcmQsIGl0IGhhcyB0byBwdXJjaGFzZWQKc2VwYXJhdGV5LCB0aGVyZWZv
cmUgdGhpcyBzZXJpZXMgYWRkcyBwYW5lbCBzdXBwb3J0IHRvIGEgbmV3IERULgoKVGhhbmtzLApG
YWIKCkZhYnJpemlvIENhc3RybyAoMik6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IEFkZCBpZGst
MTExMHdyIGJpbmRpbmcKICBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgSGlIb3BlIFJaL0cyTSBi
b2FyZCB3aXRoIGlkay0xMTEwd3IgZGlzcGxheQoKIC4uLi9kaXNwbGF5L3BhbmVsL2FkdmFudGVj
aCxpZGstMTExMHdyLnlhbWwgICAgICAgIHwgNjkgKysrKysrKysrKysrKysrKysKIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDEgKwogLi4uL3I4
YTc3NGExLWhpaG9wZS1yemcybS1leC1pZGstMTExMHdyLmR0cyAgICAgICAgfCA4NiArKysrKysr
KysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE1NiBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvYWR2YW50ZWNoLGlkay0xMTEwd3IueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS1oaWhvcGUtcnpnMm0tZXgtaWRrLTExMTB3
ci5kdHMKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

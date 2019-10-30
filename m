Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF511EAC1F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7246EDC6;
	Thu, 31 Oct 2019 09:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 30 Oct 2019 13:48:45 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 370FF6E9F8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:48:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,247,1569250800"; d="scan'208";a="30421349"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 30 Oct 2019 22:43:41 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 17A84400CA10;
 Wed, 30 Oct 2019 22:43:36 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/4] Add LCD panel support to iwg20d
Date: Wed, 30 Oct 2019 13:43:30 +0000
Message-Id: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
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

VGhlIGlXLVJhaW5ib1ctRzIwRC1Rc2V2ZW4gUlovRzFNLEcxTiBRc2V2ZW4gRGV2ZWxvcG1lbnQg
UGxhdGZvcm0KY29tZXMgd2l0aCBhIDciIGNhcGFjaXRpdmUgZGlzcGxheSBraXQgZnJvbSBFbWVy
Z2luZyBEaXNwbGF5ClRlY2hub2xvZ2llcyBDb3Jwb3JhdGlvbiAoRURUKS4gVGhpcyBzZXJpZXMg
YWRkcyBhbGwgdGhhdCdzCm5lY2Vzc2FyeSBmb3Igc3VwcG9ydGluZyBpdC4KClRoYW5rcywKRmFi
CgpGYWJyaXppbyBDYXN0cm8gKDQpOgogIGRybS9icmlkZ2U6IFJlcHVycG9zZSBsdmRzLWVuY29k
ZXIuYwogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6IFJlcHVycG9zZSBsdmRzLWVuY29k
ZXIKICBBUk06IGR0czogaXdnMjBkLXE3LWNvbW1vbjogQWRkIExDRCBzdXBwb3J0CiAgQVJNOiBz
aG1vYmlsZV9kZWZjb25maWc6IEVuYWJsZSBzdXBwb3J0IGZvciBwYW5lbHMgZnJvbSBFRFQKCiAu
Li4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy50eHQgICAgICAgICB8IDEwMCAr
KysrKysrKysrKysKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVy
LnR4dCAgIHwgIDY2IC0tLS0tLS0tCiBhcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctY29tbW9u
LmR0c2kgICAgICAgICAgICB8ICA4NSArKysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvaXdn
MjBkLXE3LWRiY20tY2EuZHRzaSAgICAgICAgICAgfCAgIDEgLQogYXJjaC9hcm0vY29uZmlncy9z
aG1vYmlsZV9kZWZjb25maWcgICAgICAgICAgICAgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYyAgICAgICAgICAgICAgICB8IDE2OSArKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1lbmNvZGVyLmMgICAg
ICAgICAgICAgIHwgMTU1IC0tLS0tLS0tLS0tLS0tLS0tLS0KIDkgZmlsZXMgY2hhbmdlZCwgMzYy
IGluc2VydGlvbnMoKyksIDIyNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy50
eHQKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1lbmNvZGVyLmMKCi0tIAoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

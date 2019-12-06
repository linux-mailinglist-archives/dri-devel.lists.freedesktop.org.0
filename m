Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C4116A04
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD0E6E3A6;
	Mon,  9 Dec 2019 09:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id E24906FA55
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 16:33:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; d="scan'208";a="33693100"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:03 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id E6135400D4D7;
 Sat,  7 Dec 2019 01:32:57 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 0/7] Add dual-LVDS panel support to EK874
Date: Fri,  6 Dec 2019 16:32:47 +0000
Message-Id: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
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
 ebiharaml@si-linux.co.jp,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBBbGwsCgp0aGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGR1YWwtTFZEUyBwYW5lbCBJ
REstMjEyMVdSCmZyb20gQWR2YW50ZWNoOgpodHRwczovL2J1eS5hZHZhbnRlY2guZXUvRGlzcGxh
eXMvRW1iZWRkZWQtTENELUtpdHMtSGlnaC1CcmlnaHRuZXNzL21vZGVsLUlESy0yMTIxV1ItSzJG
SEEyRS5odG0KClY0IGluY29ycG9yYXRlcyBtb3N0IG9mIHRoZSBjb21tZW50cyByZWNlaXZlZCBm
cm9tIHYzLCBtYWtpbmcgaXQgc2lnbmlmaWNhbnRseQpkaWZmZXJlbnQgZnJvbSB2MzogcGF0Y2gg
ImRybTogcmNhci1kdTogbHZkczogQWRkIGR1YWwtTFZEUyBwYW5lbHMgc3VwcG9ydCIKaGFzIGJl
ZW4gc3BsaXQgaW4gNCBwYXRjaGVzLCBwYXRjaGVzCiJkdC1iaW5kaW5nczogZGlzcGxheTogQWRk
IGJpbmRpbmdzIGZvciBMVkRTIGJ1cy10aW1pbmdzIiBhbmQKImR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBBZGQgaWRrLTIxMjF3ciBiaW5kaW5nIiBoYXZlIGJlZW4gbWVyZ2VkIHRvZ2V0aGVyLAphbmQg
YSBmZXcgaXNzdWVzIGhhdmUgYmVlbiBmaXhlZC4KClRoYW5rcywKRmFiCgpGYWJyaXppbyBDYXN0
cm8gKDcpOgogIGRybTogb2Y6IEFkZCBkcm1fb2ZfbHZkc19nZXRfZHVhbF9saW5rX3BpeGVsX29y
ZGVyCiAgZHJtOiByY2FyLWR1OiBsdmRzOiBJbXByb3ZlIGlkZW50aWZpY2F0aW9uIG9mIHBhbmVs
cwogIGRybTogcmNhci1kdTogbHZkczogR2V0IGR1YWwgbGluayBjb25maWd1cmF0aW9uIGZyb20g
RFQKICBkcm06IHJjYXItZHU6IGx2ZHM6IEFsbG93IGZvciBldmVuIGFuZCBvZGQgcGl4ZWxzIHN3
YXAKICBkcm06IHJjYXItZHU6IGx2ZHM6IEZpeCBtb2RlIGZvciBjb21wYW5pb24gZW5jb2Rlcgog
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBBZGQgaWRrLTIxMjF3ciBiaW5kaW5nCiAgYXJtNjQ6IGR0
czogcmVuZXNhczogQWRkIEVLODc0IGJvYXJkIHdpdGggaWRrLTIxMjF3ciBkaXNwbGF5IHN1cHBv
cnQKCiAuLi4vZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sICAgICAgICB8
IDEyOCArKysrKysrKysrKysrKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtl
ZmlsZSAgICAgICAgICAgICAgIHwgICAzICstCiAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRj
MC1lazg3NC1pZGstMjEyMXdyLmR0cyB8IDExNiArKysrKysrKysrKysrKysrKwogZHJpdmVycy9n
cHUvZHJtL2RybV9vZi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMDQgKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgICAg
ICB8IDE0MyArKysrKysrKysrKysrKy0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9vZi5oICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIwICsrKwogNiBmaWxlcyBjaGFuZ2VkLCA0Njgg
aW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0y
MTIxd3IueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOGE3NzRjMC1lazg3NC1pZGstMjEyMXdyLmR0cwoKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

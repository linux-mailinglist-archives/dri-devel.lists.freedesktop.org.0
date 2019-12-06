Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A937B1169E7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740D16E33F;
	Mon,  9 Dec 2019 09:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A01256FA55
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 16:33:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; d="scan'208";a="33693121"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:32 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id AD1CF400D0EC;
 Sat,  7 Dec 2019 01:33:26 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 5/7] drm: rcar-du: lvds: Fix mode for companion encoder
Date: Fri,  6 Dec 2019 16:32:52 +0000
Message-Id: <1575649974-31472-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
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

UHJpbWFyeSBhbmQgY29tcGFuaW9uIGVuY29kZXJzIG5lZWQgdG8gc2V0IHRoZSBzYW1lIG1vZGUg
Zm9yCnRoaW5ncyB0byB3b3JrIHByb3Blcmx5LgoKcmNhcl9sdmRzX21vZGVfc2V0IGdldHMgY2Fs
bGVkIGludG8gZm9yIHRoZSBwcmltYXJ5IGVuY29kZXIgb25seSwKdGhlcmVmb3JlIGluaXRpYWxp
emUgdGhlIGNvbXBhbmlvbiBlbmNvZGVyIG1vZGUgd2hpbGUgc29ydGluZwp0aGUgcHJpbWFyeSBl
bmNvZGVyIG1vZGUgb3V0LgoKRml4ZXM6IGZhNDQwZDg3MDM1OCAoImRybTogcmNhci1kdTogbHZk
czogQWRkIHN1cHBvcnQgZm9yIGR1YWwtbGluayBtb2RlIikKU2lnbmVkLW9mZi1ieTogRmFicml6
aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjMtPnY0Ogoq
IE5ldyBwYXRjaCBleHRyYWN0ZWQgZnJvbSBwYXRjaDoKICAiZHJtOiByY2FyLWR1OiBsdmRzOiBB
ZGQgZHVhbC1MVkRTIHBhbmVscyBzdXBwb3J0IgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfbHZkcy5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5j
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKaW5kZXggY2IyMTQ3Yy4uZWVk
NTYxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKQEAgLTYxNCw2ICs2MTQsMTgg
QEAgc3RhdGljIHZvaWQgcmNhcl9sdmRzX21vZGVfc2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UsCiAJbHZkcy0+ZGlzcGxheV9tb2RlID0gKmFkanVzdGVkX21vZGU7CiAKIAlyY2FyX2x2ZHNf
Z2V0X2x2ZHNfbW9kZShsdmRzKTsKKwlpZiAobHZkcy0+Y29tcGFuaW9uKSB7CisJCXN0cnVjdCBy
Y2FyX2x2ZHMgKmNvbXBhbmlvbl9sdmRzID0gYnJpZGdlX3RvX3JjYXJfbHZkcygKKwkJCQkJCQls
dmRzLT5jb21wYW5pb24pOworCisJCS8qCisJCSAqIEZJWE1FOiBXZSBzaG91bGQgbm90IGJlIG1l
c3Npbmcgd2l0aCB0aGUgY29tcGFuaW9uIGVuY29kZXIKKwkJICogcHJpdmF0ZSBkYXRhIGZyb20g
dGhlIHByaW1hcnkgZW5jb2RlciwgYnV0IHNpbmNlCisJCSAqIHJjYXJfbHZkc19tb2RlX3NldCBn
ZXRzIGNhbGxlZCBpbnRvIGZvciB0aGUgcHJpbWFyeSBlbmNvZGVyCisJCSAqIG9ubHksIHdlIGRv
bid0IGhhdmUgbXVjaCBvZiBhIGNob2ljZSBmb3Igbm93LgorCQkgKi8KKwkJY29tcGFuaW9uX2x2
ZHMtPm1vZGUgPSBsdmRzLT5tb2RlOworCX0KIH0KIAogc3RhdGljIGludCByY2FyX2x2ZHNfYXR0
YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D8A1327
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBD889FDB;
	Thu, 29 Aug 2019 08:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50CF3894DD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 18:37:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; d="scan'208";a="24947702"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 29 Aug 2019 03:37:13 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4895B4004953;
 Thu, 29 Aug 2019 03:37:09 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH v3 5/8] drm: bridge: thc63: Do not report input bus mode
 through bridge timings
Date: Wed, 28 Aug 2019 19:36:39 +0100
Message-Id: <1567017402-5895-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCB0byByZXBvcnQgdGhlIGlucHV0IGJ1cyBtb2RlIHRocm91Z2ggYnJpZGdlIHRpbWlu
Z3MKYW55bW9yZSwgdGhhdCdzIG5vdyBkb25lIHRocm91Z2ggdGhlIERULCBhcyBzcGVjaWZpZWQg
YnkgdGhlCmR0LWJpbmRpbmdzLgoKU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJy
aXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjItPnYzOgoqIG5ldyBwYXRjaAotLS0K
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMgfCA5ICsrKystLS0tLQogaW5j
bHVkZS9kcm0vZHJtX2JyaWRnZS5oICAgICAgICAgICAgICB8IDggLS0tLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZkMTAyNC5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aGM2M2x2ZDEwMjQuYwppbmRleCAzZDc0MTI5Yi4uNzMwZjY4MiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RoYzYzbHZkMTAyNC5jCkBAIC0zNCw3ICszNCw3IEBAIHN0cnVjdCB0aGM2M19k
ZXYgewogCXN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsKIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqbmV4
dDsKIAotCXN0cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgdGltaW5nczsKKwlib29sIGR1YWxfbGlu
azsKIH07CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHRoYzYzX2RldiAqdG9fdGhjNjMoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSkKQEAgLTYyLDcgKzYyLDcgQEAgc3RhdGljIGVudW0gZHJtX21v
ZGVfc3RhdHVzIHRoYzYzX21vZGVfdmFsaWQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAkg
KiBpc24ndCBzdXBwb3J0ZWQgYnkgdGhlIGRyaXZlciB5ZXQsIHNpbXBseSBkZXJpdmUgdGhlIGxp
bWl0cyBmcm9tIHRoZQogCSAqIGlucHV0IG1vZGUuCiAJICovCi0JaWYgKHRoYzYzLT50aW1pbmdz
LmR1YWxfbGluaykgeworCWlmICh0aGM2My0+ZHVhbF9saW5rKSB7CiAJCW1pbl9mcmVxID0gNDAw
MDA7CiAJCW1heF9mcmVxID0gMTUwMDAwOwogCX0gZWxzZSB7CkBAIC0xNTcsMTMgKzE1NywxMyBA
QCBzdGF0aWMgaW50IHRoYzYzX3BhcnNlX2R0KHN0cnVjdCB0aGM2M19kZXYgKnRoYzYzKQogCiAJ
CWlmIChyZW1vdGUpIHsKIAkJCWlmIChvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKHJlbW90ZSkpCi0J
CQkJdGhjNjMtPnRpbWluZ3MuZHVhbF9saW5rID0gdHJ1ZTsKKwkJCQl0aGM2My0+ZHVhbF9saW5r
ID0gdHJ1ZTsKIAkJCW9mX25vZGVfcHV0KHJlbW90ZSk7CiAJCX0KIAl9CiAKIAlkZXZfZGJnKHRo
YzYzLT5kZXYsICJvcGVyYXRpbmcgaW4gJXMtbGluayBtb2RlXG4iLAotCQl0aGM2My0+dGltaW5n
cy5kdWFsX2xpbmsgPyAiZHVhbCIgOiAic2luZ2xlIik7CisJCXRoYzYzLT5kdWFsX2xpbmsgPyAi
ZHVhbCIgOiAic2luZ2xlIik7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTIyMSw3ICsyMjEsNiBAQCBz
dGF0aWMgaW50IHRoYzYzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJdGhj
NjMtPmJyaWRnZS5kcml2ZXJfcHJpdmF0ZSA9IHRoYzYzOwogCXRoYzYzLT5icmlkZ2Uub2Zfbm9k
ZSA9IHBkZXYtPmRldi5vZl9ub2RlOwogCXRoYzYzLT5icmlkZ2UuZnVuY3MgPSAmdGhjNjNfYnJp
ZGdlX2Z1bmM7Ci0JdGhjNjMtPmJyaWRnZS50aW1pbmdzID0gJnRoYzYzLT50aW1pbmdzOwogCiAJ
ZHJtX2JyaWRnZV9hZGQoJnRoYzYzLT5icmlkZ2UpOwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fYnJpZGdlLmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKaW5kZXggNzYxNmY2NS4u
MzIyODAxOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCisrKyBiL2luY2x1
ZGUvZHJtL2RybV9icmlkZ2UuaApAQCAtMzYyLDE0ICszNjIsNiBAQCBzdHJ1Y3QgZHJtX2JyaWRn
ZV90aW1pbmdzIHsKIAkgKiBpbnB1dCBzaWduYWwgYWZ0ZXIgdGhlIGNsb2NrIGVkZ2UuCiAJICov
CiAJdTMyIGhvbGRfdGltZV9wczsKLQkvKioKLQkgKiBAZHVhbF9saW5rOgotCSAqCi0JICogVHJ1
ZSBpZiB0aGUgYnVzIG9wZXJhdGVzIGluIGR1YWwtbGluayBtb2RlLiBUaGUgZXhhY3QgbWVhbmlu
ZyBpcwotCSAqIGRlcGVuZGVudCBvbiB0aGUgYnVzIHR5cGUuIEZvciBMVkRTIGJ1c2VzLCB0aGlz
IGluZGljYXRlcyB0aGF0IGV2ZW4tCi0JICogYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgYXJlIHJl
Y2VpdmVkIG9uIHNlcGFyYXRlIGxpbmtzLgotCSAqLwotCWJvb2wgZHVhbF9saW5rOwogfTsKIAog
LyoqCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs

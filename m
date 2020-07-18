Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0F4224D87
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 20:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019756E223;
	Sat, 18 Jul 2020 18:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DA86E21D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 18:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id EBD7DFB02;
 Sat, 18 Jul 2020 20:26:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwWmmJmkO0cp; Sat, 18 Jul 2020 20:26:38 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8C3D342574; Sat, 18 Jul 2020 20:26:37 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 1/1] drm/bridge: nwl-dsi: Drop
 DRM_BRIDGE_ATTACH_NO_CONNECTOR check.
Date: Sat, 18 Jul 2020 20:26:37 +0200
Message-Id: <8b6545b991afce6add0a24f5f5d116778b0cb763.1595096667.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1595096667.git.agx@sigxcpu.org>
References: <cover.1595096667.git.agx@sigxcpu.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgZG9uJ3QgY3JlYXRlIGEgY29ubmVjdG9yIGJ1dCBsZXQgcGFuZWxfYnJpZGdlIGhhbmRsZSB0
aGF0IHNvIHRoZXJlJ3MKbm8gcG9pbnQgaW4gcmVqZWN0aW5nIERSTV9CUklER0VfQVRUQUNIX05P
X0NPTk5FQ1RPUi4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ud2wtZHNpLmMgfCA1IC0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL253bC1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jCmluZGV4
IDc3YTc5YWY3MDkxNC4uY2U5NGY3OTdkMDkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL253bC1kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYwpA
QCAtOTE4LDExICs5MTgsNiBAQCBzdGF0aWMgaW50IG53bF9kc2lfYnJpZGdlX2F0dGFjaChzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCXN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsOwogCWludCBy
ZXQ7CiAKLQlpZiAoZmxhZ3MgJiBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IpIHsKLQkJ
RFJNX0VSUk9SKCJGaXggYnJpZGdlIGRyaXZlciB0byBtYWtlIGNvbm5lY3RvciBvcHRpb25hbCEi
KTsKLQkJcmV0dXJuIC1FSU5WQUw7Ci0JfQotCiAJcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3Jf
YnJpZGdlKGRzaS0+ZGV2LT5vZl9ub2RlLCAxLCAwLCAmcGFuZWwsCiAJCQkJCSAgJnBhbmVsX2Jy
aWRnZSk7CiAJaWYgKHJldCkKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

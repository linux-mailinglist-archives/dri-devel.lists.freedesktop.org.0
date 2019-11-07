Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631C4F41AD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051A36F85E;
	Fri,  8 Nov 2019 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id BDA0C6F790
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:11:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; d="scan'208";a="31108944"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:30 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id E18844008C62;
 Fri,  8 Nov 2019 05:11:25 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 4/7] drm: Define DRM_MODE_CONNECTOR_PARALLEL
Date: Thu,  7 Nov 2019 20:11:00 +0000
Message-Id: <1573157463-14070-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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

VGhlIGV4aXN0aW5nIERSTV9NT0RFX0NPTk5FQ1RPUl8gZGVmaW5pdGlvbnMgZG9uJ3Qgc2VlbSB0
bwpkZXNjcmliZSB0aGUgY29ubmVjdG9yIGZvciBSR0IvUGFyYWxsZWwgZW1iZWRkZWQgZGlzcGxh
eXMsCmhlbmNlIGFkZCBEUk1fTU9ERV9DT05ORUNUT1JfUEFSQUxMRUwuCgpTaWduZWQtb2ZmLWJ5
OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2
Mi0+djM6CiogTmV3IHBhdGNoCi0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyB8
IDEgKwogaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oICAgICB8IDEgKwogMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nv
bm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCAyMTY2MDAw
Li5iMjMzMDI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKQEAgLTkzLDYgKzkzLDcgQEAgc3Rh
dGljIHN0cnVjdCBkcm1fY29ubl9wcm9wX2VudW1fbGlzdCBkcm1fY29ubmVjdG9yX2VudW1fbGlz
dFtdID0gewogCXsgRFJNX01PREVfQ09OTkVDVE9SX0RQSSwgIkRQSSIgfSwKIAl7IERSTV9NT0RF
X0NPTk5FQ1RPUl9XUklURUJBQ0ssICJXcml0ZWJhY2siIH0sCiAJeyBEUk1fTU9ERV9DT05ORUNU
T1JfU1BJLCAiU1BJIiB9LAorCXsgRFJNX01PREVfQ09OTkVDVE9SX1BBUkFMTEVMLCAiUGFyYWxs
ZWwiIH0sCiB9OwogCiB2b2lkIGRybV9jb25uZWN0b3JfaWRhX2luaXQodm9pZCkKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21v
ZGUuaAppbmRleCA3MzVjOGNmLi41ODUyZjQ3IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJt
L2RybV9tb2RlLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCkBAIC0zNjIsNiAr
MzYyLDcgQEAgZW51bSBkcm1fbW9kZV9zdWJjb25uZWN0b3IgewogI2RlZmluZSBEUk1fTU9ERV9D
T05ORUNUT1JfRFBJCQkxNwogI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfV1JJVEVCQUNLCTE4
CiAjZGVmaW5lIERSTV9NT0RFX0NPTk5FQ1RPUl9TUEkJCTE5CisjZGVmaW5lIERSTV9NT0RFX0NP
Tk5FQ1RPUl9QQVJBTExFTAkyMAogCiBzdHJ1Y3QgZHJtX21vZGVfZ2V0X2Nvbm5lY3RvciB7CiAK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

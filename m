Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B5AF41DA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF506F88A;
	Fri,  8 Nov 2019 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A16226F790
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:11:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; d="scan'208";a="30895668"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:35 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 939F64008C62;
 Fri,  8 Nov 2019 05:11:30 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 5/7] drm/panel: panel-simple: Add connector type for
 etm0700g0dh6
Date: Thu,  7 Nov 2019 20:11:01 +0000
Message-Id: <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
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

QWRkIGNvbm5lY3RvciB0eXBlIGZvciB0aGUgZXRtMDcwMGcwZGg2IGZyb20gRW1lcmdpbmcgRGlz
cGxheQpUZWNobm9sb2dpZXMgKEVEVCkuCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2Mi0+djM6CiogTmV3IHBhdGNo
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMK
aW5kZXggNWQ0ODc2OC4uODIwNjVmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
YwpAQCAtMTM0Miw2ICsxMzQyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGVk
dF9ldG0wNzAwZzBkaDYgPSB7CiAJfSwKIAkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdC
NjY2XzFYMTgsCiAJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19G
TEFHX1BJWERBVEFfRFJJVkVfTkVHRURHRSwKKwkuY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9D
T05ORUNUT1JfUEFSQUxMRUwsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mg
ZWR0X2V0bTA3MDBnMGJkaDYgPSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

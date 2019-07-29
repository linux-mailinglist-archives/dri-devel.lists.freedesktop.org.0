Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C27A29B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1C86E440;
	Tue, 30 Jul 2019 07:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3601 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jul 2019 15:32:14 UTC
Received: from 8.mo2.mail-out.ovh.net (8.mo2.mail-out.ovh.net [188.165.52.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01E289FD7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 15:32:14 +0000 (UTC)
Received: from player789.ha.ovh.net (unknown [10.109.160.23])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 98AAE1A702E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 16:14:06 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr
 [90.126.248.179])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 9862F85F2C77;
 Mon, 29 Jul 2019 14:13:51 +0000 (UTC)
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/1] drm: mxsfb: add i.MX6UL in Kconfig
Date: Mon, 29 Jul 2019 16:13:49 +0200
Message-Id: <20190729141349.28465-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 18387634328820536422
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrledugdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Julien BOIBESSOT <julien.boibessot@armadeus.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb250cm9sbGVyIGlzIGFsc28gZm91bmQgb24gaS5NWDZVTCBhbmQgaS5NWDZVTEwgc28g
dXBkYXRlIEtjb25maWcKYWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6
eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL214c2ZiL0tjb25maWcgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2Zi
L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvS2NvbmZpZwppbmRleCAwZGNhOGYyNzE2
OWUuLjQ1NzFkNDk5MGU2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL0tjb25m
aWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL0tjb25maWcKQEAgLTUsNyArNSw3IEBAIGNv
bmZpZyBEUk1fTVhTCiAJICBDaG9vc2UgdGhpcyBvcHRpb24gdG8gc2VsZWN0IGRyaXZlcnMgZm9y
IE1YUyBGQiBkZXZpY2VzCiAKIGNvbmZpZyBEUk1fTVhTRkIKLQl0cmlzdGF0ZSAiaS5NWDIzL2ku
TVgyOC9pLk1YNlNYIE1YU0ZCIExDRCBjb250cm9sbGVyIgorCXRyaXN0YXRlICJpLk1YMjMvaS5N
WDI4L2kuTVg2U1gvaS5NWDZVTCBNWFNGQiBMQ0QgY29udHJvbGxlciIKIAlkZXBlbmRzIG9uIERS
TSAmJiBPRgogCWRlcGVuZHMgb24gQ09NTU9OX0NMSwogCXNlbGVjdCBEUk1fTVhTCkBAIC0xNCw3
ICsxNCw3IEBAIGNvbmZpZyBEUk1fTVhTRkIKIAlzZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSCiAJ
c2VsZWN0IERSTV9QQU5FTAogCWhlbHAKLQkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2
ZSBhbiBpLk1YMjMvaS5NWDI4L2kuTVg2U1ggTVhTRkIKKwkgIENob29zZSB0aGlzIG9wdGlvbiBp
ZiB5b3UgaGF2ZSBhbiBpLk1YMjMvaS5NWDI4L2kuTVg2U1gvaS5NWDZVTCBNWFNGQgogCSAgTENE
IGNvbnRyb2xsZXIuCiAKIAkgIElmIE0gaXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNh
bGxlZCBteHNmYi4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

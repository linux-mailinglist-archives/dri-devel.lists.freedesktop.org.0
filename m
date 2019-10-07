Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC789CEA24
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2385B6E148;
	Mon,  7 Oct 2019 17:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D046E148
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:08:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18AA9B2E;
 Mon,  7 Oct 2019 19:08:09 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/panel: lg-lb035q02: Fix SPI alias
Date: Mon,  7 Oct 2019 20:07:57 +0300
Message-Id: <20191007170801.27647-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570468091;
 bh=8qIKk1eew0c4jGZQgmEeECkNYKpgTWKyG09QpbsGa4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ukdzvodvOXZGSHWy0Xscsx3JfIMaitgZO0QJEGwjHi9TXZQgELZseuIAz/6c5by4r
 9I78xY+g25FZ++lafpRI8j+hOGD68iMcYD05WaIWfV30tl134sRiQP6EahnGqot+zb
 G3wr/sueXGhRpL0ZxYxMUb5pskEMY2OXWjzF9pTM=
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 letux-kernel@openphoenux.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhbmVsLWxnLWxiMDM1cTAyIGRyaXZlciBpbmNvcnJlY3RseSBpbmNsdWRlcyB0aGUgT0Yg
dmVuZG9yIHByZWZpeAppbiBpdHMgU1BJIGFsaWFzLiBGaXggaXQsIGFuZCBtb3ZlIHRoZSBtYW51
YWwgYWxpYXMgdG8gYW4gU1BJIG1vZHVsZQpkZXZpY2UgdGFibGUuCgpGaXhlczogZjViMGM2NTQy
NDc2ICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgTEcgUGhpbGlwcyBMQjAzNVEwMiBw
YW5lbCIpClJlcG9ydGVkLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5j
b20+ClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbGctbGIwMzVx
MDIuYyB8IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWxnLWxi
MDM1cTAyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbGctbGIwMzVxMDIuYwppbmRl
eCBmYzgyYTUyNWIwNzEuLmVlNDM3OTcyOWE1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLWxnLWxiMDM1cTAyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLWxnLWxiMDM1cTAyLmMKQEAgLTIyMCw5ICsyMjAsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgbGIwMzVxMDJfb2ZfbWF0Y2hbXSA9IHsKIAogTU9EVUxFX0RFVklDRV9U
QUJMRShvZiwgbGIwMzVxMDJfb2ZfbWF0Y2gpOwogCitzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9k
ZXZpY2VfaWQgbGIwMzVxMDJfaWRzW10gPSB7CisJeyAibGIwMzVxMDIiLCAwIH0sCisJeyAvKiBz
ZW50aW5lbCAqLyB9Cit9OworCitNT0RVTEVfREVWSUNFX1RBQkxFKHNwaSwgbGIwMzVxMDJfaWRz
KTsKKwogc3RhdGljIHN0cnVjdCBzcGlfZHJpdmVyIGxiMDM1cTAyX2RyaXZlciA9IHsKIAkucHJv
YmUJCT0gbGIwMzVxMDJfcHJvYmUsCiAJLnJlbW92ZQkJPSBsYjAzNXEwMl9yZW1vdmUsCisJLmlk
X3RhYmxlCT0gbGIwMzVxMDJfaWRzLAogCS5kcml2ZXIJCT0gewogCQkubmFtZQk9ICJwYW5lbC1s
Zy1sYjAzNXEwMiIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IGxiMDM1cTAyX29mX21hdGNoLApAQCAt
MjMxLDcgKzIzOSw2IEBAIHN0YXRpYyBzdHJ1Y3Qgc3BpX2RyaXZlciBsYjAzNXEwMl9kcml2ZXIg
PSB7CiAKIG1vZHVsZV9zcGlfZHJpdmVyKGxiMDM1cTAyX2RyaXZlcik7CiAKLU1PRFVMRV9BTElB
Uygic3BpOmxncGhpbGlwcyxsYjAzNXEwMiIpOwogTU9EVUxFX0FVVEhPUigiVG9taSBWYWxrZWlu
ZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4iKTsKIE1PRFVMRV9ERVNDUklQVElPTigiTEcuUGhp
bGlwcyBMQjAzNVEwMiBMQ0QgUGFuZWwgZHJpdmVyIik7CiBNT0RVTEVfTElDRU5TRSgiR1BMIik7
Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

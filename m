Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF68D6F8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 17:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909526E62D;
	Wed, 14 Aug 2019 15:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12566E62C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 15:11:10 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hxuvb-0000oE-Q3; Wed, 14 Aug 2019 17:11:07 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] gpu: ipu-v3: image-convert: enable V4L2_PIX_FMT_BGRX32
 and _RGBX32
Date: Wed, 14 Aug 2019 17:10:59 +0200
Message-Id: <20190814151059.8846-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814151059.8846-1-p.zabel@pengutronix.de>
References: <20190814151059.8846-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIGltYWdlIGNvbnZlcnRlciBzdXBwb3J0IGZvciBWNEwyX1BJWF9GTVRfQkdSWDMyIGFu
ZApWNEwyX1BJWF9GTVRfUkdCWDMyIHBpeGVsIGZvcm1hdHMuCgpTaWduZWQtb2ZmLWJ5OiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2lwdS12
My9pcHUtaW1hZ2UtY29udmVydC5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZl
cnQuYyBiL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCmluZGV4IGM0OGJm
NzRmMjEwNi4uZWVjYTUwZDlhMWVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1
LWltYWdlLWNvbnZlcnQuYworKysgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZl
cnQuYwpAQCAtMjUxLDYgKzI1MSwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlwdV9pbWFnZV9w
aXhmbXQgaW1hZ2VfY29udmVydF9mb3JtYXRzW10gPSB7CiAJfSwgewogCQkuZm91cmNjCT0gVjRM
Ml9QSVhfRk1UX1hCR1IzMiwKIAkJLmJwcCAgICA9IDMyLAorCX0sIHsKKwkJLmZvdXJjYwk9IFY0
TDJfUElYX0ZNVF9CR1JYMzIsCisJCS5icHAgICAgPSAzMiwKKwl9LCB7CisJCS5mb3VyY2MJPSBW
NEwyX1BJWF9GTVRfUkdCWDMyLAorCQkuYnBwICAgID0gMzIsCiAJfSwgewogCQkuZm91cmNjCT0g
VjRMMl9QSVhfRk1UX1lVWVYsCiAJCS5icHAgICAgPSAxNiwKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

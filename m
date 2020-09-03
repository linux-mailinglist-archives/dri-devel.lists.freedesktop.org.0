Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5B25D204
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3825A6EAD6;
	Fri,  4 Sep 2020 07:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AE16E45D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8DF64C29;
 Thu,  3 Sep 2020 04:02:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=db2jBVTWoHDV0
 0vsFylp8A+aW0ecy47yGxsXtzrBhE0=; b=Am74Qbll5QRdgbw0BCS8YfCWLCsCc
 u2XW/NxS+ca2p5uyhhtyfd0Q75dMW/jzOaxoS3KCX+sSzLZj50PfhPlBi0WAHhV4
 77Rcshupy9warDAg1oSIFWK+qSKUp9ZBn7opG2Zb1GayQ/fa3J8PAjK7E+mBuEGl
 Q444KaVbwGlVIqZFbVKnmrZtEFB0i4eToiXW1HWoAhvV0k0RKqRn1jwrG5IB5NWF
 WB5isXMYUK8llszHEEaDSTtUGb7RJN0gF8ZCDEb15nZoaiTQnAdKcO/Q6Q2llnls
 AGDU3wXDQBoScXK0zlFH7bSFmSE1Ir3EdOw2LnW6EqipUNSm484p2+DLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=db2jBVTWoHDV00vsFylp8A+aW0ecy47yGxsXtzrBhE0=; b=Rzue5WUn
 jXTLVU3cUYejpxxZuJsI3lVxDkg8kTodNuNmSfG+GEr6hX6qfpTOXWrJ2nSOcong
 49t5qUtLqkT8xn8YE4QQfksNhEZYdN76l16NJGA3RvNYq/izMWN5yerbnvrhtbAW
 7smAmgktgUD1LgGItRjsxRxS+xObIP5edjvT6rcXOmUzwhIOs9zp9UVF8GQKSvA+
 C1L/AXGuY5SAYY94e13cnu40kZdUycHt6O4U94ncQgbylaketcJ6tJOjj7MttRKs
 CmhNKn0OWGB/Or/n1naOnv7VcRKfAZvyyHAlGjQlfzsRMddn+OJhOk7si5n5pu9U
 gha7Ej6aqbYqNA==
X-ME-Sender: <xms:FaNQXxcIgDNzxPmLwafKKyuWrmXTMADNwuLaN6_uLylOoWA-SkuLyw>
 <xme:FaNQX_M38qNPdW6_cyE1ULsw9R8SN5K1Aye9c8sd2yaG6dlR4KPu8HoNe9grIITsF
 42tJQSxqml6V4zqT7E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvfe
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FaNQX6h8yrGsOXU8Q61jVOeM374Kn9prX7tUyhYZ7Et3cOi1N3vG_Q>
 <xmx:FaNQX69v-X65xHTP-Y1nTx428vmXn1tTiruwzRN-4SfnLBsSr3qUuQ>
 <xmx:FaNQX9uLIx5GjeZoaeBb6roNnHa3cGG0xcRGhMUIW2kEAhbfYxTIUw>
 <xmx:FaNQX5HDrZJtjhpntZZwkfyRWXX9HjBG2R-S0-SvH7hPZSbS-Ng169N2zzM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BCD433060060;
 Thu,  3 Sep 2020 04:02:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 25/80] drm/vc4: crtc: Remove mode_set_nofb
Date: Thu,  3 Sep 2020 10:00:57 +0200
Message-Id: <f86c7a6946f98262f1cf59a461596a796d4bcc5f.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On BCM2711 to avoid stale pixels getting stuck in intermediate FIFOs, the
pixelvalve needs to be setup each time there's a mode change or enable /
disable sequence.

Therefore, we can't really use mode_set_nofb anymore to configure it, but
we need to move it to atomic_enable.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 284a85b9d7d4..2eda2e6429ec 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -376,11 +376,6 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	}
 }
 
-static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
-{
-	vc4_crtc_config_pv(crtc);
-}
-
 static void require_hvs_enabled(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -433,6 +428,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	require_hvs_enabled(dev);
 
 	vc4_crtc_pixelvalve_reset(crtc);
+	vc4_crtc_config_pv(crtc);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
@@ -791,7 +787,6 @@ static const struct drm_crtc_funcs vc4_crtc_funcs = {
 };
 
 static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
-	.mode_set_nofb = vc4_crtc_mode_set_nofb,
 	.mode_valid = vc4_crtc_mode_valid,
 	.atomic_check = vc4_crtc_atomic_check,
 	.atomic_flush = vc4_hvs_atomic_flush,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045155FFFA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67CC14A60A;
	Wed, 29 Jun 2022 12:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCE414A606
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6EA923200951;
 Wed, 29 Jun 2022 08:36:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506174; x=1656592574; bh=aH
 zPfQfX5BqWZr2j+nfwq2qj1BQQ1jXBkXnbgkk+c6A=; b=T698XYIxZlMZHNdVBH
 P2Uw9MfbwHCIKtGIgUSoy+ATrjFKHuLGvSx1447UjcwyZYwuSUe8bCHIVT1OY6tE
 jjEybUnHPgyB2t9Lh/g8xpB8p/O12mqx1yYnkWwPQotxi0QJU/MxdCRrJerjNNNY
 BK3PlVHbxUlQhHm/R1Z58S0s4dzRs2drFxvBkNSnXf8dZNSq6s+DpgBQKNWIyS4a
 ASEGH88pGY+ZR23UO2/KYpKMdoAPvUvFpv3BZcppVXAwCcCu+fKMvPJVVsZxemzt
 ynX1xr3RXlUhDvkOiqvg4/4n8v4p7UU/qLUy8RDduowWpB8ZUMcK23gEYQddD66g
 /0Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506174; x=1656592574; bh=aHzPfQfX5BqWZ
 r2j+nfwq2qj1BQQ1jXBkXnbgkk+c6A=; b=XgC7S+wDpzejDnARCWfvQlPtLOeHU
 dbb9VHZ1shyzPw4RqPIIePr+Nu0atmVyN92V8wlZKsEeTMTN68VHFLmWU3ESuCBl
 9k5NzC9OeD0BlLxI6s49xy5LWYTw+5azG11U/KoVmM0JIEVNy9yiWca+Ir3nzLfV
 uTBWyyujYdwMEU5R+zbq+wB9M1Kx4aNhcrDoWzQFzXTU46+sUs0tDMVRmqoMNwLX
 nui5/1ulw2JTHqplNjmtNzfDEBIibGxX5BFSzlNRmr8GJP6wuvUu/xFI/gnmSZGE
 mU55DXfaNGgzQbtN5f31xPNOOFK81trKO+cP1Q4CRQBfVP+tNk31LGKHQ==
X-ME-Sender: <xms:Pke8YvNVHbTd3bMA-faM-GhM0YzoTG2BekQcpqnmSeVpGNdjoEwCxw>
 <xme:Pke8Yp8GsEkkl8H50hOrp7EFYnqKSE52eJlim06uzNdn_IS5S1XFEybnxfgGo3jc5
 srErTy2MwyZNyZ3pho>
X-ME-Received: <xmr:Pke8YuQD2nk4WBtVVTtjudlGJHwPrFwUIHZblkcUG89Os79SyvDl5Ap4l35juM4Mu_fBpXzU2sJ4x8d4dbJiv76ZE5w2OHtLMNovY2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Pke8YjvsZVSpOGQrwEJA-mmxcQ6-Yb_DR8LzvlXYiXH588rvTSF1Ig>
 <xmx:Pke8YndbSq6CwlwHWGtGEE1Gpw5cXo4WMwMl7ZKYvnS7pfzG3gOXfw>
 <xmx:Pke8Yv13cAgrPuOJAKLNVuEUWiYBC48v8F29umCeCQhChmxVbj-M0w>
 <xmx:Pke8YoGY8YUiUd_L0SPtkLEEyYkmYhwDt_8YJFjBYSthMKPIUuJrtw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 20/71] drm/vc4: crtc: Move debugfs_name to crtc_data
Date: Wed, 29 Jun 2022 14:34:19 +0200
Message-Id: <20220629123510.1915022-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the CRTCs, including the TXP, have a debugfs file and name so we can
consolidate it into vc4_crtc_data.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 18 +++++++++---------
 drivers/gpu/drm/vc4/vc4_drv.h  |  4 ++--
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 +
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d7cc006b22c9..bcce61879d53 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1084,10 +1084,10 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 
 static const struct vc4_pv_data bcm2835_pv0_data = {
 	.base = {
+		.debugfs_name = "crtc0_regs",
 		.hvs_available_channels = BIT(0),
 		.hvs_output = 0,
 	},
-	.debugfs_name = "crtc0_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1098,10 +1098,10 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
 
 static const struct vc4_pv_data bcm2835_pv1_data = {
 	.base = {
+		.debugfs_name = "crtc1_regs",
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
-	.debugfs_name = "crtc1_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1112,10 +1112,10 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
 
 static const struct vc4_pv_data bcm2835_pv2_data = {
 	.base = {
+		.debugfs_name = "crtc2_regs",
 		.hvs_available_channels = BIT(1),
 		.hvs_output = 1,
 	},
-	.debugfs_name = "crtc2_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1126,10 +1126,10 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 
 static const struct vc4_pv_data bcm2711_pv0_data = {
 	.base = {
+		.debugfs_name = "crtc0_regs",
 		.hvs_available_channels = BIT(0),
 		.hvs_output = 0,
 	},
-	.debugfs_name = "crtc0_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1140,10 +1140,10 @@ static const struct vc4_pv_data bcm2711_pv0_data = {
 
 static const struct vc4_pv_data bcm2711_pv1_data = {
 	.base = {
+		.debugfs_name = "crtc1_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 3,
 	},
-	.debugfs_name = "crtc1_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1154,10 +1154,10 @@ static const struct vc4_pv_data bcm2711_pv1_data = {
 
 static const struct vc4_pv_data bcm2711_pv2_data = {
 	.base = {
+		.debugfs_name = "crtc2_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 4,
 	},
-	.debugfs_name = "crtc2_regs",
 	.fifo_depth = 256,
 	.pixels_per_clock = 2,
 	.encoder_types = {
@@ -1167,10 +1167,10 @@ static const struct vc4_pv_data bcm2711_pv2_data = {
 
 static const struct vc4_pv_data bcm2711_pv3_data = {
 	.base = {
+		.debugfs_name = "crtc3_regs",
 		.hvs_available_channels = BIT(1),
 		.hvs_output = 1,
 	},
-	.debugfs_name = "crtc3_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
@@ -1180,10 +1180,10 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
 
 static const struct vc4_pv_data bcm2711_pv4_data = {
 	.base = {
+		.debugfs_name = "crtc4_regs",
 		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
 		.hvs_output = 5,
 	},
-	.debugfs_name = "crtc4_regs",
 	.fifo_depth = 64,
 	.pixels_per_clock = 2,
 	.encoder_types = {
@@ -1320,7 +1320,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
-	vc4_debugfs_add_regset32(drm, pv_data->debugfs_name,
+	vc4_debugfs_add_regset32(drm, pv_data->base.debugfs_name,
 				 &vc4_crtc->regset);
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 91983fbd4d83..df4ff6747eeb 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -458,6 +458,8 @@ to_vc4_encoder(struct drm_encoder *encoder)
 }
 
 struct vc4_crtc_data {
+	const char *debugfs_name;
+
 	/* Bitmask of channels (FIFOs) of the HVS that the output can source from */
 	unsigned int hvs_available_channels;
 
@@ -475,8 +477,6 @@ struct vc4_pv_data {
 	u8 pixels_per_clock;
 
 	enum vc4_encoder_type encoder_types[4];
-	const char *debugfs_name;
-
 };
 
 struct vc4_crtc {
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index d20b0bc51a18..20e08e31aa1b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -461,6 +461,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 }
 
 static const struct vc4_crtc_data vc4_txp_crtc_data = {
+	.debugfs_name = "txp_regs",
 	.hvs_available_channels = BIT(2),
 	.hvs_output = 2,
 };
-- 
2.36.1


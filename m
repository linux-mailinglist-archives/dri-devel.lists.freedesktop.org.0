Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBF5570912
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A7E902F0;
	Mon, 11 Jul 2022 17:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC87902F0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CA6B85C0152;
 Mon, 11 Jul 2022 13:40:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561217; x=1657647617; bh=/v
 F9zfnycxjK1S1Pqhlug+oosh/ChTm2+6271ft9Ul0=; b=dxKwg9LLW/ifoRApBI
 e1/Zf0lIStCwhboK9IZsQQeEtLsAyrrPnmgt0penV/V4tjdQU0HlmRobFgedoFez
 LovRsdtf2yPxDPeWJpnhzTN1i78hBwC/lEffNjtTWrS69SLkGWqIA3AtXsFenwJr
 tjoCoUTPcB4vw4UMvubXkKsgHfDxqdx7xlDFoYzpPjiCA5LFNNIdlnu4FwLTjXEQ
 nqPmkG5wOPHOMAVYsrlDj+w3VlouHCz3FmvVx7Gfcq/BLtqMaB5Gm75lPsK3Ukw2
 9nhllM8Fxohnw31Z2zW/zOm0KBTnmhefcsWVuPXHGACEXRNNO26BtxIV5FhWWUqK
 nlSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561217; x=1657647617; bh=/vF9zfnycxjK1
 S1Pqhlug+oosh/ChTm2+6271ft9Ul0=; b=Eu/stYlVarxlQ+XNTogwvz2QREJlj
 qjy+n4tHw8wIw87yxhdLejrcuBTHkpETiW+KxdJ8ulGSQUbpBQEYQ+XckRNrKN0U
 8rNigsJv2UmzgoFvIYthd+rv7zqll2lhIBee9iZer6gOXkFQnaR5GjzHbci9sl4q
 DBVOwfhH6QY+QeLc7YfgxF2xzkjh+auDmbjbL7iFr7SKSfZ5uASUq3h53feY9B7o
 Wnd+SUcO+IbGJ9ICNFRW4NL7lkwZUGQNJXg/M+dTaoAWHK+41sJSq9K+MhLbjQkg
 id+1RCyIRTw2qOkqJZEXGBCpJ0X3baZudvXyxPfT2BaqxdwiXsr+jpHiQ==
X-ME-Sender: <xms:gWDMYl-ygX-7USqCy8hgrVsbQaQUNPYcGUtpBm91yuEfDsUupcgmXg>
 <xme:gWDMYptoBOqw4iuXVHHe3q_PRCelTb_58g3bm7Oc9VIgOn4ocDMjyRPOhajNT8hSK
 E1TmWNjUElxoaalGek>
X-ME-Received: <xmr:gWDMYjAkIGrTKcXuMVg1JD_stMum-G3rPdwhVxspSDSwTRjLWSd-Rc0tqcLQmkwenGySeJdutaEfs3avIFOjFbjDRJkvRgn8Y6xpoPs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gWDMYpf0VVFY2wcPVtFWksKbz3MPP7cYBM1wJXIOXpFEY8TAXx-aww>
 <xmx:gWDMYqOS0IQifzlylQVG93wKKxL4agMuj6n1gmusB0tG60FzfADGKQ>
 <xmx:gWDMYrl9t_mcRXcgNHONUJetCRa6NQtxz4Y-Yt6MoO1jumuyE4PrmQ>
 <xmx:gWDMYh3yzerPZcxdgV1_3-rt3bHlPN4ho5v0WlGzXvB8nZDrK_mL6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 20/69] drm/vc4: crtc: Move debugfs_name to crtc_data
Date: Mon, 11 Jul 2022 19:38:50 +0200
Message-Id: <20220711173939.1132294-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index d935aa3e4409..443894e1715d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -459,6 +459,8 @@ to_vc4_encoder(struct drm_encoder *encoder)
 }
 
 struct vc4_crtc_data {
+	const char *debugfs_name;
+
 	/* Bitmask of channels (FIFOs) of the HVS that the output can source from */
 	unsigned int hvs_available_channels;
 
@@ -476,8 +478,6 @@ struct vc4_pv_data {
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


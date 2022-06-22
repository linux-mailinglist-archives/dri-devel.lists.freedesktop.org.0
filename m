Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED816554D2B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E74112C18;
	Wed, 22 Jun 2022 14:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6445E112C74
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 257183200094;
 Wed, 22 Jun 2022 10:33:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908393; x=1655994793; bh=R3
 Z73rO5pMSjQsobfeKKC4o7Y0NtI+LSwZ3iYjjLFTI=; b=3V8JZmIHc2FGnGIyqC
 TFSDisLILqnUx5otOuE4Ck4u+eUd3gp2JbNyAyReB/951UHfj53XBZMHsGbQ35F6
 NAZizo3s6cmk3tXAt2EqcDXkXnl9gTI2mkKcSkXXi7Y5o6sBqtgBYT094c3B5Jzb
 fE5NrQBIsrDpjlI4gwp7RAX+vvkWqlx3qdg/7EUVyTeSHSgUbWimFE1Rvu4rcHZX
 NQxZ9tXdK1RuMCjkWgvffyRlN2xh2JTbVYjZyDPj3xF9VOIPzWDZZC1nHU6JXVtU
 q0U0nzaDZPtLGYrgtAYf0kSy/Oau6olTXUa6ZPsGViTUDLDioZRaZJO+kbCr+08W
 dCXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908393; x=1655994793; bh=R3Z73rO5pMSjQ
 sobfeKKC4o7Y0NtI+LSwZ3iYjjLFTI=; b=gv4n1oxc4sPv5ElU1sPrVJWoCQCvc
 OuIAw4JnEdFGA2Rh4sMOFWs01RR52VDW44enhiRZmY0MTo9zlSLfgJAgjbxZbSUf
 YrHSr6vqy0R2eWIOleaIK0asMjkUkw+9CCpInKd4+t/8LE5Ee5UgKdyqXUWGmXAz
 NsaNT37nQ85Gimwbd7GVQ442OHvHup3XT5C2C05lYwrUAVCUzTIoeinRTFlmMemZ
 giIb0m5elngrqeyNJarm0vvyyDuzJQwOkjcKZmdmYy4Hot/caePKUZZLgOr6Hc/B
 qA+PqcgGD5XFxAFcUfCs5DPVjcsHOpvDNLAKT+ZhpNMLCFU/ZYr111zOQ==
X-ME-Sender: <xms:KSizYoyWHlstpGYhlqno1bkKoKuRtCB1UX2QEhA8mBWRi9iUewYGSA>
 <xme:KSizYsT9TcD-HAfcJeucBWTkU03F3_6YxxzHWVsLDZ3FE7K471Tl1S6P1KdQ9KKdL
 I6ZEF3otIownouJ4Jg>
X-ME-Received: <xmr:KSizYqV8Q9NfZz4hKQbIp_IrElpnAbrrDHufWXxpNlnzIAC5gdIEJDzCUCkFFTd8nb9674eWrsABUMRLUt2juNjcO2dHBb7_a7MBdXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KSizYmi8t9j5ZKQ_UURC0PqV1iKvvxBk9kIjjpMuhghngsSwuoZ31A>
 <xmx:KSizYqBspHW0ENB2epTH-G4PUqC_Rg-4mlYhXzPIxMmJEdvbWdyZRw>
 <xmx:KSizYnKcADV5ATAS-eXJe0oUC768x0jUe2LS30ncS9qlNNl8iidHtQ>
 <xmx:KSizYh4Bl7RWVr9TSwH_e1d1kHl3MqXHbV8a9HwusDlmiNy98TuRDQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 19/68] drm/vc4: crtc: Move debugfs_name to crtc_data
Date: Wed, 22 Jun 2022 16:31:20 +0200
Message-Id: <20220622143209.600298-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
index 84fd25e71c41..188cf25125f0 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1079,10 +1079,10 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 
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
@@ -1093,10 +1093,10 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
 
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
@@ -1107,10 +1107,10 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
 
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
@@ -1121,10 +1121,10 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 
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
@@ -1135,10 +1135,10 @@ static const struct vc4_pv_data bcm2711_pv0_data = {
 
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
@@ -1149,10 +1149,10 @@ static const struct vc4_pv_data bcm2711_pv1_data = {
 
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
@@ -1162,10 +1162,10 @@ static const struct vc4_pv_data bcm2711_pv2_data = {
 
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
@@ -1175,10 +1175,10 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
 
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
@@ -1315,7 +1315,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 
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
index 3579d487402e..4c2f0862fc88 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -460,6 +460,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 }
 
 static const struct vc4_crtc_data vc4_txp_crtc_data = {
+	.debugfs_name = "txp_regs",
 	.hvs_available_channels = BIT(2),
 	.hvs_output = 2,
 };
-- 
2.36.1


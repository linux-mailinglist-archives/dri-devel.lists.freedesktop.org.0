Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADD54622E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8680211B237;
	Fri, 10 Jun 2022 09:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BFD113FC8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D5EA75C01B2;
 Fri, 10 Jun 2022 05:29:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 10 Jun 2022 05:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853398; x=1654939798; bh=uL
 5V7Zmaoxrcf5HsZVtc8fiusyIy7sdKatN/JhP6Tik=; b=TSr53mDIbk7WxTX1T5
 49Wvbm+UbFufhfu13eYKXrjW+/F7TEKjx0/VYvAYT0pnZCfZFIWr0Pdsj/fsnmih
 Tivh8WCNTc3UVJWo9MlyC/VrYsQQ7xO0fc++UKWG7GJqres+ASShXwP8PhuO3V7H
 /hRwUqRCaxQuOZHDPA7nnlzmmd9zzFU9LK8Ezt2RPb/A/KwNNKqAsEHg9kHtHD1R
 Kt7M++2jq0Z48THfqIw3CyizxWvQIej2Mw0chxaDQOLYzA3YeiVebCH1GXt4cXLM
 0QY6wccKsyjWBTiFBbhQ8SYoEO864LJJxlvHrhQc8dr5gbA1pBZMTtU3evRDmn/1
 xOsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853398; x=1654939798; bh=uL5V7Zmaoxrcf
 5HsZVtc8fiusyIy7sdKatN/JhP6Tik=; b=Hd312BKtb3cnzDJb8XvQk9a74RB1R
 fkTwsFqeKDhv98+svTmXGrAhIJAvoLn6MIRboziNMUIP1JTqDbAY1dZqYpoPQkPU
 njE+jgGC07BnvIDnwyv4EG1bGb7Kisj+3M9tvnZLEDnoc3+zAadPOQ2Yr4rP5PHr
 C283rz4EUB2zFqsZlixa4jNDhis8C3z1QwK6LO99OLWBC7HMWj9hoAuXTS7ueD7Y
 Pj1Zav3+rWT+EdJe7hrdKv48hjJNXCCaOyt4oO3NP38bsJ4cP2oPNjy3T2Xb0GRs
 pWup5ZuQfehjNc3cv0xszdZLDN5zHdNajyWSVy1pItgj19I16jDyAIkAQ==
X-ME-Sender: <xms:Fg-jYteShIT2zUmky8Cs9U5LwdAn0Ntl3H7Ihoh8_FCU3MoPSyARxA>
 <xme:Fg-jYrPLiaD90wZ7x3sp49He_CsNbOynLH-3PJT09r1wXlWxjeUjaaVyjaffusTnf
 8nuIBDjP-28QkbOfsA>
X-ME-Received: <xmr:Fg-jYmjlEiIPyyJxsb4m_W5LR7KqL-c8yRrtlfgVcar6onhp9muhw-5S6HlI1M7M7KBrz0mVWHB4ASiHAQMGhE_UFCCA54vLVhX68Qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Fg-jYm-J6mzBJvbNBLCWZKEog2oZ4h0QXVU2A7HZxdrQ02D1I_Uoyg>
 <xmx:Fg-jYpsC7kfDorf3k2iV9lQpRoj5rIOe9yoavvZfoN9D73rqD9v5rA>
 <xmx:Fg-jYlH6eMg2vbyoPklUozLg8dEyjPCFkuSMeQ7K9_ontThSJoMU_A>
 <xmx:Fg-jYjLYxKahpxzBHKwzAFvJeu6tobs3syPse6E7TtEBwwnEnZCZTA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 17/64] drm/vc4: crtc: Move debugfs_name to crtc_data
Date: Fri, 10 Jun 2022 11:28:37 +0200
Message-Id: <20220610092924.754942-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the CRTCs, including the TXP, have a debugfs file and name so we can
consolidate it into vc4_crtc_data.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 18 +++++++++---------
 drivers/gpu/drm/vc4/vc4_drv.h  |  4 ++--
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 +
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 7163f924b48b..1f7e987e68aa 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -978,10 +978,10 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 
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
@@ -992,10 +992,10 @@ static const struct vc4_pv_data bcm2835_pv0_data = {
 
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
@@ -1006,10 +1006,10 @@ static const struct vc4_pv_data bcm2835_pv1_data = {
 
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
@@ -1020,10 +1020,10 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 
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
@@ -1034,10 +1034,10 @@ static const struct vc4_pv_data bcm2711_pv0_data = {
 
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
@@ -1048,10 +1048,10 @@ static const struct vc4_pv_data bcm2711_pv1_data = {
 
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
@@ -1061,10 +1061,10 @@ static const struct vc4_pv_data bcm2711_pv2_data = {
 
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
@@ -1074,10 +1074,10 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
 
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
@@ -1214,7 +1214,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, vc4_crtc);
 
-	vc4_debugfs_add_regset32(drm, pv_data->debugfs_name,
+	vc4_debugfs_add_regset32(drm, pv_data->base.debugfs_name,
 				 &vc4_crtc->regset);
 
 	return 0;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 5125ca1a8158..9a53ace85d95 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -457,6 +457,8 @@ to_vc4_encoder(struct drm_encoder *encoder)
 }
 
 struct vc4_crtc_data {
+	const char *debugfs_name;
+
 	/* Bitmask of channels (FIFOs) of the HVS that the output can source from */
 	unsigned int hvs_available_channels;
 
@@ -474,8 +476,6 @@ struct vc4_pv_data {
 	u8 pixels_per_clock;
 
 	enum vc4_encoder_type encoder_types[4];
-	const char *debugfs_name;
-
 };
 
 struct vc4_crtc {
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 82beb8c159f2..e983ff7c5e13 100644
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


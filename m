Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4A16A2C5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE5F6E3AC;
	Mon, 24 Feb 2020 09:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA916E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 54D6064A;
 Mon, 24 Feb 2020 04:10:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bhFt34+iCjdly
 GoD1lLG2OFFHfo9f7oDO5zfZpp28I0=; b=F1S9LFxvjDHcFvroaPQ7k6fqg37qR
 YMxpyPdcwNWXGdn2MR/TtYJSPSYh9h+g+qIQJruvFcGYqSfQfGK+l5vl0mVVmmHP
 nvCGxkKUWaW5PFslsGHaYPGUiGU3tpPMtL+/M6TJ3D8MaL8YdF/VmJJ7ozH0FXUN
 pJaGGLCBaRX7AIkEeCEIPPyzH4eRMbN4cQE9f0jForJSeQjImKHyI5iTldUOLjBc
 dnGEHsj4WI+OnH6sqhX7ZCeGQuHcarHS/+rl7kQ15iRr+4q4K6rUOgB1Rfe7X45W
 rdhkCj94EflJDb7GKZivJPa09AdPbp7KoKhnDqvX52NXOzXLJR0L1OQqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bhFt34+iCjdlyGoD1lLG2OFFHfo9f7oDO5zfZpp28I0=; b=CLaSUUqd
 NdYk+SuOfiDeY3hO2IOJW5wBN7yl1ljGt9D61MS7I7UznDxFWie6dLupGmVcfXQv
 bdY6eJZ8sIrsr1f91GQ6ESu1bg4krVpMhm8AoZbjCdeB01NRWzjQKnlGP3Y/7CgT
 dvy4VTREYX9RSVTmMq/4J0o2sYX4bDw1VoKd+aOpf2DxtoiMKjqnGOG4ivVnVmlQ
 br0EqEHnQO5X/T9rovn8SmFQnkKHVct4BqIJP4IloKi3483MeMu+JFh0OFdtS4a1
 htebbcikJDVuNnLxi/lMQXZFVVapnvyk8Yd3jWQ4VqdK7ePwddULWOKtHO5jeAbA
 O0YUNC2Mzw+EaQ==
X-ME-Sender: <xms:95JTXkVgAVVEY7hQ-Gcg9-Ofc_w21FUIR35cwqMaE13SECbTr_f3kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgephedvnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:95JTXkZm4cA4Lw2rtEMRSgS6jhCB1ATfMDPMgBaMtZdBDg_qRE2rlw>
 <xmx:95JTXjyptGbJHi5uZv16BGj7Hk3hY3tmBBlprKavhpJRQhyPEyjAig>
 <xmx:95JTXs0z9kjPwszdSqaf4oKcPSjCLPYuSxaG_VKNsBR2RL9nCeDk7g>
 <xmx:95JTXr7O_5YOVEWB9BDpyRTWdyC0k7S1z5BLpzkjMp3qOrmX2hw6X7BviWc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94088328005A;
 Mon, 24 Feb 2020 04:10:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 60/89] drm/vc4: crtc: Add BCM2711 pixelvalves
Date: Mon, 24 Feb 2020 10:07:02 +0100
Message-Id: <0369f1cccd28e89dd64869e73dab5bbcbaf5e793.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 has 5 pixelvalves, so now that our driver is ready, let's add
support for them.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 82 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_regs.h |  6 +++-
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index b10b267f56fe..82ae787fca58 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -273,6 +273,13 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 	case PV_CONTROL_FORMAT_24:
 	case PV_CONTROL_FORMAT_DSIV_24:
 	default:
+		/*
+		 * For some reason, the pixelvalve4 doesn't work with
+		 * the usual formula and will only work with 32.
+		 */
+		if (vc4_crtc->data->hvs_output == 5)
+			return 32;
+
 		return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX;
 	}
 }
@@ -281,8 +288,14 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
 					     u32 format)
 {
 	u32 level = vc4_get_fifo_full_level(vc4_crtc, format);
-	return VC4_SET_FIELD(level & 0x3f,
-			     PV_CONTROL_FIFO_LEVEL);
+	u32 ret = 0;
+
+	if (level > 0x3f)
+		ret |= VC4_SET_FIELD((level >> 6) & 0x3,
+				     PV5_CONTROL_FIFO_LEVEL_HIGH);
+
+	return ret | VC4_SET_FIELD(level & 0x3f,
+				   PV_CONTROL_FIFO_LEVEL);
 }
 
 /*
@@ -328,6 +341,9 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	CRTC_WRITE(PV_CONTROL, PV_CONTROL_FIFO_CLR | PV_CONTROL_EN);
 	CRTC_WRITE(PV_CONTROL, 0);
 
+	CRTC_WRITE(PV_MUX_CFG,
+		   VC4_SET_FIELD(8, PV_MUX_CFG_RGB_PIXEL_MUX_MODE));
+
 	CRTC_WRITE(PV_HORZA,
 		   VC4_SET_FIELD((mode->htotal - mode->hsync_end) * pixel_rep / ppc,
 				 PV_HORZA_HBP) |
@@ -1114,10 +1130,72 @@ static const struct vc4_crtc_data bcm2835_pv2_data = {
 	},
 };
 
+static const struct vc4_crtc_data bcm2711_pv0_data = {
+	.debugfs_name = "crtc0_regs",
+	.hvs_available_channels = BIT(0),
+	.hvs_output = 0,
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_DSI0,
+		[1] = VC4_ENCODER_TYPE_DPI,
+	},
+};
+
+static const struct vc4_crtc_data bcm2711_pv1_data = {
+	.debugfs_name = "crtc1_regs",
+	.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
+	.hvs_output = 3,
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_DSI1,
+		[1] = VC4_ENCODER_TYPE_SMI,
+	},
+};
+
+static const struct vc4_crtc_data bcm2711_pv2_data = {
+	.debugfs_name = "crtc2_regs",
+	.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
+	.hvs_output = 4,
+	.fifo_depth = 256,
+	.pixels_per_clock = 2,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_HDMI0,
+	},
+};
+
+static const struct vc4_crtc_data bcm2711_pv3_data = {
+	.debugfs_name = "crtc3_regs",
+	.hvs_available_channels = BIT(1),
+	.hvs_output = 1,
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_VEC,
+	},
+};
+
+static const struct vc4_crtc_data bcm2711_pv4_data = {
+	.debugfs_name = "crtc4_regs",
+	.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
+	.hvs_output = 5,
+	.fifo_depth = 64,
+	.pixels_per_clock = 2,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_HDMI1,
+	},
+};
+
 static const struct of_device_id vc4_crtc_dt_match[] = {
 	{ .compatible = "brcm,bcm2835-pixelvalve0", .data = &bcm2835_pv0_data },
 	{ .compatible = "brcm,bcm2835-pixelvalve1", .data = &bcm2835_pv1_data },
 	{ .compatible = "brcm,bcm2835-pixelvalve2", .data = &bcm2835_pv2_data },
+	{ .compatible = "brcm,bcm2711-pixelvalve0", .data = &bcm2711_pv0_data },
+	{ .compatible = "brcm,bcm2711-pixelvalve1", .data = &bcm2711_pv1_data },
+	{ .compatible = "brcm,bcm2711-pixelvalve2", .data = &bcm2711_pv2_data },
+	{ .compatible = "brcm,bcm2711-pixelvalve3", .data = &bcm2711_pv3_data },
+	{ .compatible = "brcm,bcm2711-pixelvalve4", .data = &bcm2711_pv4_data },
 	{}
 };
 
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index b96ebbb1354b..35279b118d41 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -130,6 +130,8 @@
 #define V3D_ERRSTAT  0x00f20
 
 #define PV_CONTROL				0x00
+# define PV5_CONTROL_FIFO_LEVEL_HIGH_MASK	VC4_MASK(26, 25)
+# define PV5_CONTROL_FIFO_LEVEL_HIGH_SHIFT	25
 # define PV_CONTROL_FORMAT_MASK			VC4_MASK(23, 21)
 # define PV_CONTROL_FORMAT_SHIFT		21
 # define PV_CONTROL_FORMAT_24			0
@@ -209,6 +211,10 @@
 
 #define PV_HACT_ACT				0x30
 
+#define PV_MUX_CFG				0x34
+# define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_MASK	VC4_MASK(5, 2)
+# define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_SHIFT	2
+
 #define SCALER_CHANNELS_COUNT			3
 
 #define SCALER_DISPCTRL                         0x00000000
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B111219928
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746276E9DC;
	Thu,  9 Jul 2020 07:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C885189267
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D2A77109A;
 Wed,  8 Jul 2020 13:43:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=FRK1ghnZ/A34m
 +fO1TWrTG3gwS4qPkDUufypdd78rhw=; b=L2gYQS6wFkzeKlyqWPFdqlaGI9e36
 YGXhTN9taVRNyJrlU4LJlVDiUzgOxOwffUzuRAIfIoG57GB9o92rY9DyFg4+B5ea
 n3uGdsx6xkF6lhkKJGJ1r7poC0nniBB13mY+a9wdTHw4XwWi0QnTwLollryNcUuP
 JD+35o4UG6+Cf5YEQ6aPuljyp+38w1QUSj//UPmREQB3+7D8FPCPh0J+q5HRXHiA
 1MbwPruP0QIsipTfqSfBlj8ibXRXp/ugBhLpfYMh8jeSdil/6Mh3gpVc8GDGcF1B
 XugKfDDZe4Tgj4nk0LImc7kxxRMsfF4wSXNOeeWiBk3Pp4JLsFECXJuLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FRK1ghnZ/A34m+fO1TWrTG3gwS4qPkDUufypdd78rhw=; b=ECISMku+
 phk22sBhqHhnTTgAzGxQ4lApyjy5uWXgzltMm/AdhcrqtJZgp3eGHCQ8aMvam+/8
 xuOXF0Ga2lbfi5U5OiOCMResMxuhEBMXBmnx4Sify+S3Lae3IWol6V3Kkk91H7hE
 8J6QGN5YwCJaIi+2dde7CLqdv0fwS2gUNjmKzF/blwwIrbSbOqk1SeP6p6BemBz7
 JYEU+qq/+6157KCXZmP7O3/xNUh/V48crP/qxF5BvBxmLzq3RG4m3gowY2iz3k62
 vuAx0ypJp5E0wkBJJokqMzHVUWt27gyeIQi6LW0BNEPXhmlUQvFsRgoO9g2AnuL2
 2/0ufoUPfq+W9g==
X-ME-Sender: <xms:vAUGXxBkAn_TWA1Nnd_4xgBKvmTUUF288KM9um4KqlfXXYu9Awr_9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vAUGX_gWoaBeG6Cw9OiCFqBiAPMLHiTCoOuYjdxA2YwGd31_L7RClw>
 <xmx:vAUGX8nvOVPW89_v6LmIMX-awxcMoRgBlP24gQeLAH3R8Hgf9Z1QmQ>
 <xmx:vAUGX7waSR00OY442nymTEz8QGTkq1uFo7r5lfjvwtW3Fl0jgx55cQ>
 <xmx:vAUGXzRP3mWeH-_FaL3cJFE7DDCVZ5l3_5O9Zii4ZO_eUnS2sT1SNfQf7Kc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2A0E630600B1;
 Wed,  8 Jul 2020 13:43:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 37/78] drm/vc4: crtc: Add BCM2711 pixelvalves
Date: Wed,  8 Jul 2020 19:41:45 +0200
Message-Id: <f45d5249575d28a5ace6fd7cef1f856fa8d703ac.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 95 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_regs.h |  7 +++-
 2 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index a8bc3b26a0fb..c19687eabaf6 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -208,6 +208,7 @@ void vc4_crtc_destroy(struct drm_crtc *crtc)
 
 static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 {
+	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
 	u32 fifo_len_bytes = pv_data->fifo_depth;
 
@@ -230,6 +231,13 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 	case PV_CONTROL_FORMAT_24:
 	case PV_CONTROL_FORMAT_DSIV_24:
 	default:
+		/*
+		 * For some reason, the pixelvalve4 doesn't work with
+		 * the usual formula and will only work with 32.
+		 */
+		if (crtc_data->hvs_output == 5)
+			return 32;
+
 		return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX;
 	}
 }
@@ -238,9 +246,13 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
 					     u32 format)
 {
 	u32 level = vc4_get_fifo_full_level(vc4_crtc, format);
+	u32 ret = 0;
+
+	ret |= VC4_SET_FIELD((level >> 6),
+			     PV5_CONTROL_FIFO_LEVEL_HIGH);
 
-	return VC4_SET_FIELD(level & 0x3f,
-			     PV_CONTROL_FIFO_LEVEL);
+	return ret | VC4_SET_FIELD(level & 0x3f,
+				   PV_CONTROL_FIFO_LEVEL);
 }
 
 /*
@@ -278,6 +290,8 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 
 static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -358,6 +372,11 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	if (is_dsi)
 		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 
+	if (vc4->hvs->hvs5)
+		CRTC_WRITE(PV_MUX_CFG,
+			   VC4_SET_FIELD(PV_MUX_CFG_RGB_PIXEL_MUX_MODE_NO_SWAP,
+					 PV_MUX_CFG_RGB_PIXEL_MUX_MODE));
+
 	CRTC_WRITE(PV_CONTROL, PV_CONTROL_FIFO_CLR |
 		   vc4_crtc_get_fifo_full_level_bits(vc4_crtc, format) |
 		   VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
@@ -891,10 +910,82 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
 	},
 };
 
+static const struct vc4_pv_data bcm2711_pv0_data = {
+	.base = {
+		.hvs_available_channels = BIT(0),
+		.hvs_output = 0,
+	},
+	.debugfs_name = "crtc0_regs",
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_DSI0,
+		[1] = VC4_ENCODER_TYPE_DPI,
+	},
+};
+
+static const struct vc4_pv_data bcm2711_pv1_data = {
+	.base = {
+		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
+		.hvs_output = 3,
+	},
+	.debugfs_name = "crtc1_regs",
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_DSI1,
+		[1] = VC4_ENCODER_TYPE_SMI,
+	},
+};
+
+static const struct vc4_pv_data bcm2711_pv2_data = {
+	.base = {
+		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
+		.hvs_output = 4,
+	},
+	.debugfs_name = "crtc2_regs",
+	.fifo_depth = 256,
+	.pixels_per_clock = 2,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_HDMI0,
+	},
+};
+
+static const struct vc4_pv_data bcm2711_pv3_data = {
+	.base = {
+		.hvs_available_channels = BIT(1),
+		.hvs_output = 1,
+	},
+	.debugfs_name = "crtc3_regs",
+	.fifo_depth = 64,
+	.pixels_per_clock = 1,
+	.encoder_types = {
+		[0] = VC4_ENCODER_TYPE_VEC,
+	},
+};
+
+static const struct vc4_pv_data bcm2711_pv4_data = {
+	.base = {
+		.hvs_available_channels = BIT(0) | BIT(1) | BIT(2),
+		.hvs_output = 5,
+	},
+	.debugfs_name = "crtc4_regs",
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
index 7fbac68b6fe1..c0031ab19689 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -129,6 +129,8 @@
 #define V3D_ERRSTAT  0x00f20
 
 #define PV_CONTROL				0x00
+# define PV5_CONTROL_FIFO_LEVEL_HIGH_MASK	VC4_MASK(26, 25)
+# define PV5_CONTROL_FIFO_LEVEL_HIGH_SHIFT	25
 # define PV_CONTROL_FORMAT_MASK			VC4_MASK(23, 21)
 # define PV_CONTROL_FORMAT_SHIFT		21
 # define PV_CONTROL_FORMAT_24			0
@@ -208,6 +210,11 @@
 
 #define PV_HACT_ACT				0x30
 
+#define PV_MUX_CFG				0x34
+# define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_MASK	VC4_MASK(5, 2)
+# define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_SHIFT	2
+# define PV_MUX_CFG_RGB_PIXEL_MUX_MODE_NO_SWAP	8
+
 #define SCALER_CHANNELS_COUNT			3
 
 #define SCALER_DISPCTRL                         0x00000000
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

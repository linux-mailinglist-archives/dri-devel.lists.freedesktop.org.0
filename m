Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D725D200
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AC06EAC8;
	Fri,  4 Sep 2020 07:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3226E581
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 36F3AB19;
 Thu,  3 Sep 2020 04:02:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2sv6uQU0wC4GF
 RuTG5bPvOFLJbxdN3V3lHFUxyUM0Z8=; b=jg6gjvSCqqAylKH2CrHMqQYew48zt
 t6aN36ueZ2fEBayIMXZMShZ6z98crJZaOP15LRxPx0IhmKFW8VAuv1Q+rsZI3yCM
 9J6RiOr2LS08eMgnKuX7KjUuyZvyu1kd1szneo/kwS/eOw6DFnpUNrto35X7VsOY
 aLhhhorBT2DIVx9b2/jBF9/azsgzIbnP0iwZIaPqRdzpTd7eXzZr/lNciYU7m2nl
 aq7Ud8jw7Yt9Pm+uz4Ywd4N5KqQsv1hZDzQa3oPz7Ch6cRQbUZ3gS7u3sfU9TRyo
 R4eRq1PciHZ8V1kcE2OXIvq8d1nR6nlV2WsELj5spxcwz6GPE18IYFW4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2sv6uQU0wC4GFRuTG5bPvOFLJbxdN3V3lHFUxyUM0Z8=; b=pYZV82cu
 aSDg6i3i60R9Hq/72xEBmAf1gkHJL3kG/9o7c7AHLWjMFJbl5xqIN+smLPcbYM7F
 FHiRjomGAi92GMDZQKJfTXvVNNDGAwcAdphdltIYUI1m0/0AZmLr/z6m/OGeaCiI
 64qch9VyYfqlfg2y70Ijv8B4F8SfRLyPhKaroP31lTChWYUnsyuNiS1vABkYCVUz
 HZyzQS6QIWby5+41tLTj7Mepkc5FccDYajfJ5/1Tqn9Kh1wRk6MvdiSKI60Qc69o
 HPOh/J4goKy8eAuDIoMA7mN+w4VXnj4KyV0hb6uOwnWOdvGFHUqxID+X0vOazRMf
 O2AuBIsMEcK2ag==
X-ME-Sender: <xms:JaNQX8S-6-yleoF2zCefW2ngWVZLLgs1pNJcmODi2X5hUqAPglZskw>
 <xme:JaNQX5xtasou2Vkdmv-KLLFpJSj3eznaCEWWMki2SQebPEd3hiDpd-pXUICKY7i5c
 NDz5wf2esDKsLTfL30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefie
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JaNQX50r-xh1YH4e8EW_GwXSqeWTGKWgKeolUZf2GTCbU0iJoJB_mg>
 <xmx:JaNQXwAMwOsmU9r9vJ2Atu-UUP2L8F_wodotCtmyNQ5DyaFnJNHbAg>
 <xmx:JaNQX1jg0DeVtiAFEFfnn2cI6eAhs1CytjI3EYRlbWFpkWuT0cSc8g>
 <xmx:JaNQXwpLU4kFWpv5dYYD6UToTuJQZU334kka0HMSjw7bH35yNUqyhdbmMZk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B957306005B;
 Thu,  3 Sep 2020 04:02:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 37/80] drm/vc4: crtc: Add BCM2711 pixelvalves
Date: Thu,  3 Sep 2020 10:01:09 +0200
Message-Id: <2553ec9ece0d8a0e5299ff74ed932a38703c5db9.1599120059.git-series.maxime@cerno.tech>
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

The BCM2711 has 5 pixelvalves, so now that our driver is ready, let's add
support for them.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 95 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_regs.h |  7 +++-
 2 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index dfac304fe2b0..a393f93390a2 100644
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
@@ -907,10 +926,82 @@ static const struct vc4_pv_data bcm2835_pv2_data = {
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

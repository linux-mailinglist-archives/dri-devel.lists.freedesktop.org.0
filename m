Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399F5900184
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F86A10EBDC;
	Fri,  7 Jun 2024 11:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="EjL5HNBK";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="UWQShfvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfhigh3-smtp.messagingengine.com
 (wfhigh3-smtp.messagingengine.com [64.147.123.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C708210EBDC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:03:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.west.internal (Postfix) with ESMTP id E77D4180014B;
 Fri,  7 Jun 2024 07:03:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 07 Jun 2024 07:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1717758228; x=
 1717844628; bh=T6w3santYjQtmqpXHrFQ9df4u6xN2IhGzEJMMb5K/dY=; b=E
 jL5HNBKPTMdnrrKnU2zuX5bqWWg5o4esbZhad3GVkjpEUhf9n7RCHGQu0CvqmFOQ
 0rCp6FXh/5pnDVoF/KcrSkdcSx4J7Gx01NNTBg1DeXh7cX9uN+Seid/Eg/1o0SgV
 35tG5WO7NYVZnGmc7sg2xFFZT1U6TwZMOi3WlyWkgBaZoyIVKY5aFVH/YWeYPLiz
 alWz73aIlN6jZO2+yHKSxJfrPpwHj3cD9Tw9W+niVwTPJFVByeCFtgcEmaoNV6N7
 zkNmobC0ZlFcGPyooru4vBvkVgja9NEJ2EIAPSZy+6xZAEQK1jFAjqbXZOfwggAj
 TmuzK3OsyADUakyhntp1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717758228; x=
 1717844628; bh=T6w3santYjQtmqpXHrFQ9df4u6xN2IhGzEJMMb5K/dY=; b=U
 WQShfvZZPnCFFak21OzmnaNZ9+KVS7GynG1i9/9lw9zCRya3gI0Ya/NeKu0fn+7k
 rr/63YwRhTqnGY8NeHRVa9i71mc60ZYnJOkjUfMivWqmd4XHUKlPepvAzlKGl6e8
 N18jw2Z0bAnazv9tCDN2JQzBy+j9zuaRKuUF/5JBfaJx6b5wv+uv1uqyhKPkl/uN
 2Ae62mW+Att0sXPcYusmepsORW7BJKwcg+oljGafIvZD+VgxUSxC7KPzKsUp8oMA
 3M+ENcYGbQaHUH+HTfplZzEpImxMYk308aoAAyFBwf6t3Fy05kqgviQEguvOJkwh
 nYJf4ipMsFlF/gpS7HUsQ==
X-ME-Sender: <xms:FOliZse614_BFz2qvj5LbCcIlpVrMHFxSYT2ifY-GkmWDtLpUugkJA>
 <xme:FOliZuNsExouyXIljodF5d_XdmEuMDqweCBq23PSsklIbsRndUU6TfHj8N9KmZ9HC
 ec1p-xyRIiyE2QQfg>
X-ME-Received: <xmr:FOliZtimvcAD_GlK8abAxoj9VB4jKsr_yCX1ONthYzLvD4V0gQL28__sJU4NTscNX6lcCyE12BqrpRt5GiHAOG6qQULJKZiICFSD3SZY_PM27aOO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:FOliZh-GqdjA2blPY94tSOw7SPMtdQX2LwFZhbCFytgxr7AuU5Bhgw>
 <xmx:FOliZou5hVGrkS43To1M0UZ0Nx3A57I9AA_VLrX3dwsi-rp0hwhWbg>
 <xmx:FOliZoF-rfGe70-m43Qa5HkDIEzTl_A6KhE1vgFAm-qM8mR48lTHeg>
 <xmx:FOliZnNUELZQ23x3RsUEe2TDzNwMkQA_oB0SjKP2wlkPKS_n62ybWw>
 <xmx:FOliZofEfNI7X--LGZFrT24Lhk56X9r2TXgV7OnuAs5uluuGoFjKvVBp>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:03:42 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH RFC 6/8] drm/sun4i: de3: Add support for YUV420 output
Date: Fri,  7 Jun 2024 23:00:02 +1200
Message-ID: <20240607110227.49848-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607110227.49848-1-ryan@testtoast.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |   7 +
 drivers/gpu/drm/sun4i/Makefile            |   3 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c        |  26 +++-
 drivers/gpu/drm/sun4i/sun50i_fmt.c        |  74 ++++++++++
 drivers/gpu/drm/sun4i/sun50i_fmt.h        |  30 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c         | 172 +++++++++++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_mixer.c       |  52 ++++++-
 drivers/gpu/drm/sun4i/sun8i_mixer.h       |   2 +
 drivers/gpu/drm/sun4i/sunxi_engine.h      |  34 +++++
 9 files changed, 384 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb10953..57e2c4e788303 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -430,7 +430,14 @@ void
 __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
 					  struct drm_connector *connector)
 {
+	struct drm_property *prop;
+
 	conn_state->connector = connector;
+	prop = connector->max_bpc_property;
+	if (prop) {
+		conn_state->max_bpc = prop->values[1];
+		conn_state->max_requested_bpc = prop->values[1];
+	}
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_state_reset);
 
diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11e..3f516329f51ee 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -16,7 +16,8 @@ sun8i-drm-hdmi-y		+= sun8i_hdmi_phy_clk.o
 
 sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_layer.o sun8i_ui_scaler.o \
-				   sun8i_vi_scaler.o sun8i_csc.o
+				   sun8i_vi_scaler.o sun8i_csc.o \
+				   sun50i_fmt.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
 sun4i-tcon-y			+= sun4i_tcon_dclk.o
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index a1a2c845ade0c..e39926e9f0b5d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -598,14 +598,26 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 				 const struct drm_display_mode *mode)
 {
-	unsigned int bp, hsync, vsync, vtotal;
+	unsigned int bp, hsync, vsync, vtotal, div;
+	struct sun4i_crtc *scrtc = tcon->crtc;
+	struct sunxi_engine *engine = scrtc->engine;
 	u8 clk_delay;
 	u32 val;
 
 	WARN_ON(!tcon->quirks->has_channel_1);
 
+	switch (engine->format) {
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		div = 2;
+		break;
+	default:
+		div = 1;
+		break;
+	}
+
 	/* Configure the dot clock */
-	clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000);
+	clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000 / div);
 
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 1);
@@ -624,17 +636,17 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 
 	/* Set the input resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC0_REG,
-		     SUN4I_TCON1_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC0_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set the upscaling resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC1_REG,
-		     SUN4I_TCON1_BASIC1_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC1_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC1_Y(mode->crtc_vdisplay));
 
 	/* Set the output resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC2_REG,
-		     SUN4I_TCON1_BASIC2_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC2_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC2_Y(mode->crtc_vdisplay));
 
 	/* Set horizontal display timings */
@@ -642,8 +654,8 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 	DRM_DEBUG_DRIVER("Setting horizontal total %d, backporch %d\n",
 			 mode->htotal, bp);
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC3_REG,
-		     SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal) |
-		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp));
+		     SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal / div) |
+		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp / div));
 
 	bp = mode->crtc_vtotal - mode->crtc_vsync_start;
 	DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
new file mode 100644
index 0000000000000..18a8d5032ddce
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#include <uapi/linux/media-bus-format.h>
+
+#include "sun50i_fmt.h"
+
+static bool sun50i_fmt_is_10bit(u32 format)
+{
+	switch (format) {
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static u32 sun50i_fmt_get_colorspace(u32 format)
+{
+	switch (format) {
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		return SUN50I_FMT_CS_YUV420;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		return SUN50I_FMT_CS_YUV422;
+	default:
+		return SUN50I_FMT_CS_YUV444RGB;
+	}
+}
+
+void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
+		      u16 height, u32 format)
+{
+	u32 colorspace, limit[3];
+	bool bit10;
+
+	colorspace = sun50i_fmt_get_colorspace(format);
+	bit10 = sun50i_fmt_is_10bit(format);
+
+	regmap_write(mixer->engine.regs, SUN50I_FMT_CTRL, 0);
+
+	regmap_write(mixer->engine.regs, SUN50I_FMT_SIZE,
+		     SUN8I_MIXER_SIZE(width, height));
+	regmap_write(mixer->engine.regs, SUN50I_FMT_SWAP, 0);
+	regmap_write(mixer->engine.regs, SUN50I_FMT_DEPTH, bit10);
+	regmap_write(mixer->engine.regs, SUN50I_FMT_FORMAT, colorspace);
+	regmap_write(mixer->engine.regs, SUN50I_FMT_COEF, 0);
+
+	if (colorspace != SUN50I_FMT_CS_YUV444RGB) {
+		limit[0] = SUN50I_FMT_LIMIT(64, 940);
+		limit[1] = SUN50I_FMT_LIMIT(64, 960);
+		limit[2] = SUN50I_FMT_LIMIT(64, 960);
+	} else if (bit10) {
+		limit[0] = SUN50I_FMT_LIMIT(0, 1023);
+		limit[1] = SUN50I_FMT_LIMIT(0, 1023);
+		limit[2] = SUN50I_FMT_LIMIT(0, 1023);
+	} else {
+		limit[0] = SUN50I_FMT_LIMIT(0, 1021);
+		limit[1] = SUN50I_FMT_LIMIT(0, 1021);
+		limit[2] = SUN50I_FMT_LIMIT(0, 1021);
+	}
+
+	regmap_write(mixer->engine.regs, SUN50I_FMT_LMT_Y, limit[0]);
+	regmap_write(mixer->engine.regs, SUN50I_FMT_LMT_C0, limit[1]);
+	regmap_write(mixer->engine.regs, SUN50I_FMT_LMT_C1, limit[2]);
+
+	regmap_write(mixer->engine.regs, SUN50I_FMT_CTRL, 1);
+}
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
new file mode 100644
index 0000000000000..0fa1d2d22e592
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#ifndef _SUN50I_FMT_H_
+#define _SUN50I_FMT_H_
+
+#include "sun8i_mixer.h"
+
+#define SUN50I_FMT_CTRL   0xa8000
+#define SUN50I_FMT_SIZE   0xa8004
+#define SUN50I_FMT_SWAP   0xa8008
+#define SUN50I_FMT_DEPTH  0xa800c
+#define SUN50I_FMT_FORMAT 0xa8010
+#define SUN50I_FMT_COEF   0xa8014
+#define SUN50I_FMT_LMT_Y  0xa8020
+#define SUN50I_FMT_LMT_C0 0xa8024
+#define SUN50I_FMT_LMT_C1 0xa8028
+
+#define SUN50I_FMT_LIMIT(low, high) (((high) << 16) | (low))
+
+#define SUN50I_FMT_CS_YUV444RGB 0
+#define SUN50I_FMT_CS_YUV422    1
+#define SUN50I_FMT_CS_YUV420    2
+
+void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
+		      u16 height, u32 format);
+
+#endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 68d955c63b05b..3b022bfb85adc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -5,6 +5,8 @@
 
 #include <drm/drm_print.h>
 
+#include <uapi/linux/media-bus-format.h>
+
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 
@@ -107,12 +109,141 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 	},
 };
 
+/* always convert to limited mode */
+static const u32 rgb2yuv_de3[3][12] = {
+	[DRM_COLOR_YCBCR_BT601] = {
+		0x0000837A, 0x0001021D, 0x00003221, 0x00000040,
+		0xFFFFB41C, 0xFFFF6B03, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF43B1, 0xFFFFDB6E, 0x00000200,
+	},
+	[DRM_COLOR_YCBCR_BT709] = {
+		0x00005D7C, 0x00013A7C, 0x00001FBF, 0x00000040,
+		0xFFFFCC78, 0xFFFF52A7, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF33BE, 0xFFFFEB61, 0x00000200,
+	},
+	[DRM_COLOR_YCBCR_BT2020] = {
+		0x00007384, 0x00012A21, 0x00001A13, 0x00000040,
+		0xFFFFC133, 0xFFFF5DEC, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF3135, 0xFFFFEDEA, 0x00000200,
+	},
+};
+
+/* always convert to limited mode */
+static const u32 yuv2yuv_de3[2][3][3][12] = {
+	[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+		[DRM_COLOR_YCBCR_BT601] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0xFFFFC4D7, 0xFFFF9589, 0xFFC00040,
+				0x00000000, 0x0002098B, 0x00003AAF, 0xFE000200,
+				0x00000000, 0x0000266D, 0x00020CF8, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0xFFFFBFCE, 0xFFFFC5FF, 0xFFC00040,
+				0x00000000, 0x00020521, 0x00001F89, 0xFE000200,
+				0x00000000, 0x00002C87, 0x00020F07, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT709] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x000032D9, 0x00006226, 0xFFC00040,
+				0x00000000, 0x0001FACE, 0xFFFFC759, 0xFE000200,
+				0x00000000, 0xFFFFDAE7, 0x0001F780, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0xFFFFF782, 0x00003036, 0xFFC00040,
+				0x00000000, 0x0001FD99, 0xFFFFE5CA, 0xFE000200,
+				0x00000000, 0x000005E4, 0x0002015A, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT2020] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x00003B03, 0x000034D2, 0xFFC00040,
+				0x00000000, 0x0001FD8C, 0xFFFFE183, 0xFE000200,
+				0x00000000, 0xFFFFD4F3, 0x0001F3FA, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0x00000916, 0xFFFFD061, 0xFFC00040,
+				0x00000000, 0x0002021C, 0x00001A40, 0xFE000200,
+				0x00000000, 0xFFFFFA19, 0x0001FE5A, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+		},
+	},
+	[DRM_COLOR_YCBCR_FULL_RANGE] = {
+		[DRM_COLOR_YCBCR_BT601] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0xFFFFCC08, 0xFFFFA27B, 0x00000040,
+				0x00000000, 0x0001CA24, 0x0000338D, 0xFE000200,
+				0x00000000, 0x000021C1, 0x0001CD26, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0xFFFFC79C, 0xFFFFCD0C, 0x00000040,
+				0x00000000, 0x0001C643, 0x00001BB4, 0xFE000200,
+				0x00000000, 0x0000271D, 0x0001CEF5, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT709] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x00002CAB, 0x00005638, 0x00000040,
+				0x00000000, 0x0001BD32, 0xFFFFCE3C, 0xFE000200,
+				0x00000000, 0xFFFFDF6A, 0x0001BA4A, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0xFFFFF88A, 0x00002A5A, 0x00000040,
+				0x00000000, 0x0001BFA5, 0xFFFFE8FA, 0xFE000200,
+				0x00000000, 0x0000052D, 0x0001C2F1, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT2020] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x000033D6, 0x00002E66, 0x00000040,
+				0x00000000, 0x0001BF9A, 0xFFFFE538, 0xFE000200,
+				0x00000000, 0xFFFFDA2F, 0x0001B732, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0x000007FB, 0xFFFFD62B, 0x00000040,
+				0x00000000, 0x0001C39D, 0x0000170F, 0xFE000200,
+				0x00000000, 0xFFFFFAD1, 0x0001C04F, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+		},
+	},
+};
+
 static void sun8i_csc_setup(struct regmap *map, u32 base,
 			    enum format_type fmt_type,
 			    enum drm_color_encoding encoding,
 			    enum drm_color_range range)
 {
-	u32 base_reg, val;
+	u32 base_reg, val = 0;
 	const u32 *table;
 	int i;
 
@@ -148,28 +279,59 @@ static void sun8i_csc_setup(struct regmap *map, u32 base,
 	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+static const u32 *sun8i_csc_get_de3_yuv_table(enum drm_color_encoding in_enc,
+					      enum drm_color_range in_range,
+					      u32 out_format,
+					      enum drm_color_encoding out_enc)
+{
+	if (out_format == MEDIA_BUS_FMT_RGB888_1X24)
+		return yuv2rgb_de3[in_range][in_enc];
+
+	/* check for identity transformation */
+	if (in_range == DRM_COLOR_YCBCR_LIMITED_RANGE && out_enc == in_enc)
+		return NULL;
+
+	return yuv2yuv_de3[in_range][in_enc][out_enc];
+}
+
+static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 				 enum format_type fmt_type,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
-	u32 addr, val, mask;
+	u32 addr, val = 0, mask;
+	struct regmap *map;
 	const u32 *table;
 	int i;
 
 	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
+	map = engine->regs;
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
-		val = 0;
+		if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
+			break;
+		val = mask;
+		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
+		regmap_bulk_write(map, addr, rgb2yuv_de3[engine->encoding], 12);
 		break;
 	case FORMAT_TYPE_YUV:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			break;
 		val = mask;
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
 	case FORMAT_TYPE_YVU:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			table = yuv2yuv_de3[range][encoding][encoding];
 		val = mask;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
@@ -204,7 +366,7 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+		sun8i_de3_ccsc_setup(&mixer->engine, layer,
 				     fmt_type, encoding, range);
 		return;
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 01382860aaeea..b1525906a25d8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -22,7 +22,10 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include <uapi/linux/media-bus-format.h>
+
 #include "sun4i_drv.h"
+#include "sun50i_fmt.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
@@ -326,12 +329,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
 			 interlaced ? "on" : "off");
+
+	if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
+		val = SUN8I_MIXER_BLEND_COLOR_BLACK;
+	else
+		val = 0xff108080;
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
+
+	if (mixer->cfg->has_formatter)
+		sun50i_fmt_setup(mixer, mode->hdisplay,
+				 mode->vdisplay, mixer->engine.format);
+}
+
+static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, u32 *num)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	u32 *formats, count;
+
+	count = 0;
+
+	formats = kcalloc(5, sizeof(*formats), GFP_KERNEL);
+	if (!formats)
+		return NULL;
+
+	if (mixer->cfg->has_formatter) {
+		formats[count++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		formats[count++] = MEDIA_BUS_FMT_YUV8_1X24;
+		formats[count++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		formats[count++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+	}
+
+	formats[count++] = MEDIA_BUS_FMT_RGB888_1X24;
+
+	*num = count;
+
+	return formats;
 }
 
 static const struct sunxi_engine_ops sun8i_engine_ops = {
-	.commit		= sun8i_mixer_commit,
-	.layers_init	= sun8i_layers_init,
-	.mode_set	= sun8i_mixer_mode_set,
+	.commit			= sun8i_mixer_commit,
+	.layers_init		= sun8i_layers_init,
+	.mode_set		= sun8i_mixer_mode_set,
+	.get_supported_fmts	= sun8i_mixer_get_supported_fmts,
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
@@ -392,6 +435,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	dev_set_drvdata(dev, mixer);
 	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
+	/* default output format, supported by all mixers */
+	mixer->engine.format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	if (of_property_present(dev->of_node, "iommus")) {
 		/*
@@ -653,6 +698,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.is_de3		= true,
+	.has_formatter	= 1,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 85c94884fb9a4..13401643c7bfc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -162,6 +162,7 @@ enum {
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
  * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
+ * @has_formatter: true, if mixer has formatter core, for 10-bit and YUV handling
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  */
 struct sun8i_mixer_cfg {
@@ -171,6 +172,7 @@ struct sun8i_mixer_cfg {
 	int		ccsc;
 	unsigned long	mod_rate;
 	unsigned int	is_de3 : 1;
+	unsigned int    has_formatter : 1;
 	unsigned int	scanline_yuv;
 };
 
diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index ec8cf9b2bda41..608a26c3f9911 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -6,6 +6,8 @@
 #ifndef _SUNXI_ENGINE_H_
 #define _SUNXI_ENGINE_H_
 
+#include <drm/drm_color_mgmt.h>
+
 struct drm_plane;
 struct drm_device;
 struct drm_crtc_state;
@@ -120,6 +122,17 @@ struct sunxi_engine_ops {
 	 */
 	void (*mode_set)(struct sunxi_engine *engine,
 			 const struct drm_display_mode *mode);
+
+	/**
+	 * @get_supported_fmts
+	 *
+	 * This callback is used to enumerate all supported output
+	 * formats by the engine. They are used for bridge format
+	 * negotiation.
+	 *
+	 * This function is optional.
+	 */
+	u32 *(*get_supported_fmts)(struct sunxi_engine *engine, u32 *num);
 };
 
 /**
@@ -137,6 +150,9 @@ struct sunxi_engine {
 
 	int id;
 
+	u32				format;
+	enum drm_color_encoding		encoding;
+
 	/* Engine list management */
 	struct list_head		list;
 };
@@ -208,4 +224,22 @@ sunxi_engine_mode_set(struct sunxi_engine *engine,
 	if (engine->ops && engine->ops->mode_set)
 		engine->ops->mode_set(engine, mode);
 }
+
+/**
+ * sunxi_engine_get_supported_formats - Provide array of supported formats
+ * @engine:	pointer to the engine
+ * @num:	pointer to variable, which will hold number of formats
+ *
+ * This list can be used for format negotiation by bridge.
+ */
+static inline u32 *
+sunxi_engine_get_supported_formats(struct sunxi_engine *engine, u32 *num)
+{
+	if (engine->ops && engine->ops->get_supported_fmts)
+		return engine->ops->get_supported_fmts(engine, num);
+
+	*num = 0;
+
+	return NULL;
+}
 #endif /* _SUNXI_ENGINE_H_ */
-- 
2.45.2


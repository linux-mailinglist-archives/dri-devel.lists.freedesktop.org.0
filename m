Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645DC33F41F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81D36E822;
	Wed, 17 Mar 2021 15:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837836E821
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:22 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E736A580E69;
 Wed, 17 Mar 2021 11:44:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 17 Mar 2021 11:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=furTH81woGCQe
 0z2ZJY2VMr4gkfvPHQj6f+NQ3/nB+A=; b=IeQ8q7qFkoa6OOMRPIfq9mkoEaJR/
 N/s1i01ENdiKjssAAAiDfOxkF/sZTnPUT4V8qIH1IB3SWs9BbvAuo+HMN+gIjq+t
 jFqESAz1ZMnDFSiU7oXvRSI8lITLwmZsygJnEkTVpb2SCScnGuVtsEfwsYUIaCCz
 HSoDhszn7w2n81s6RcAzvhmdgtk+YqM/Qro+t34wxgZzhFcWXbaToRTVhHZ63VTG
 56frIanYqSvc19/lcQml/JXBB+H6LABNCFCyAxgb7JmQLz52a6rroOUc/JIgn8Kc
 ztZRtRBSwmELUTjdByW73utmKTqX6Dxi5fwDRBUQYk8wiBeESAGmH8sFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=furTH81woGCQe0z2ZJY2VMr4gkfvPHQj6f+NQ3/nB+A=; b=beWdItwz
 Y7k7dyIxFP7vMN5fE0J+uG0bWkPIqWvZuZqYM0qRg5y0R4t8rNqnoogx2ve+98F5
 E7gO9R5JkwG8I4Nif2T+wSA8TaNALFedmeeVNk5VOlpKr7YfOK44hdpkS2wOYR30
 KWFqEAycuqxgEtXQZs4FUYEzSyVe8gmYWAiesQjC/PiJd3xBOvNkg7A2ceEzI6dx
 oyqnWsC9RO/3S0Dn7UG5jT6eqzYbSA2nSes9J0oKnrsrVERTyJogYtITrXpliZFS
 Ynzy/LuFfHc//Z+wRFLJ95VseBPVLJMbKkvf2yFQJhyTgDHnU2f/J13O8lq4e69A
 leYH7Vij3VSy0A==
X-ME-Sender: <xms:1SNSYKex23abk6s7Ss5E-oGuabPtRa0DDGjbsyNKP16y4N_3H4tzhw>
 <xme:1SNSYEPKEN0wLYFieTGMo2QE6952WIFh7B6QKg4Rv7hd0YMpuokpH4h3H9K5ueU2g
 jIj8c6nHRRuJRslNqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1SNSYLioAr35Oa5qIUlRAGdGRnyNjHPKlBzFCWzhYV5oSyGYzLXk0g>
 <xmx:1SNSYH-SOjydxMqZFf6JgDL2wwwsp23UjN3d_eztyl6m-xqaAa5Fpg>
 <xmx:1SNSYGs-5q-PNRF2jxbwv4DJUWRwEpGkf_Pi34PpRizkVJj6drZ-jw>
 <xmx:1SNSYLPUN9sLO9_SKSEtSs89f5EHSWbCp2Upam8TcXcWq2GBE7C-_Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74C56240067;
 Wed, 17 Mar 2021 11:44:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 16/18] drm/vc4: hdmi: Support HDMI YUV output
Date: Wed, 17 Mar 2021 16:43:50 +0100
Message-Id: <20210317154352.732095-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI controllers in the BCM2711 support YUV444 and YUV420 outputs,
let's add support for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 73 +++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  6 +++
 drivers/gpu/drm/vc4/vc4_regs.h      | 16 +++++++
 3 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 83e44cf44d65..407b468dab67 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -33,6 +33,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_hdmi.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
@@ -388,6 +389,8 @@ static void vc4_hdmi_set_avi_infoframe(struct vc4_hdmi *vc4_hdmi,
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate =
 		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_bridge_state *bstate =
+		drm_atomic_get_new_bridge_state(state, &vc4_hdmi->bridge.base);
 	struct drm_crtc *crtc = encoder->crtc;
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	union hdmi_infoframe frame;
@@ -407,6 +410,7 @@ static void vc4_hdmi_set_avi_infoframe(struct vc4_hdmi *vc4_hdmi,
 					   HDMI_QUANTIZATION_RANGE_LIMITED);
 
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
+	drm_hdmi_avi_infoframe_output_colorspace(&frame.avi, &bstate->output_bus_cfg);
 
 	vc4_hdmi_write_infoframe(vc4_hdmi, &frame);
 }
@@ -558,6 +562,38 @@ static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
 	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
 };
 
+/*
+ * Conversion between Full Range RGB and Full Range YUV422 using the
+ * BT.709 Colorspace
+ *
+ * [  0.212639  0.715169  0.072192  0   ]
+ * [ -0.117208 -0.394207  0.511416  128 ]
+ * [  0.511416 -0.464524 -0.046891  128 ]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv422_bt709[3][4] = {
+	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
+	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
+	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
+};
+
+/*
+ * Conversion between Full Range RGB and Full Range YUV444 using the
+ * BT.709 Colorspace
+ *
+ * [ -0.117208 -0.394207  0.511416  128 ]
+ * [  0.511416 -0.464524 -0.046891  128 ]
+ * [  0.212639  0.715169  0.072192  0   ]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv444_bt709[3][4] = {
+	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
+	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
+	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
+};
+
 static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
 				    const u16 coeffs[3][4])
 {
@@ -573,16 +609,42 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_atomic_state *state,
 			       const struct drm_display_mode *mode)
 {
+	struct drm_bridge *bridge = &vc4_hdmi->bridge.base;
+	struct drm_bridge_state *bridge_state =
+		drm_atomic_get_new_bridge_state(state, bridge);
+	u32 if_cfg = 0;
+	u32 if_xbar = 0x543210;
+	u32 csc_chan_ctl = 0;
 	u32 csc_ctl = VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
 							       VC5_MT_CP_CSC_CTL_MODE);
 
-	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
+	if (drm_hdmi_bus_fmt_is_yuv422(bridge_state->output_bus_cfg.format)) {
+		csc_ctl |= VC4_SET_FIELD(VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD,
+					 VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422) |
+			VC5_MT_CP_CSC_CTL_USE_444_TO_422 |
+			VC5_MT_CP_CSC_CTL_USE_RNG_SUPPRESSION;
 
-	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, &vc5_hdmi_csc_full_rgb_unity);
-	else
-		vc5_hdmi_set_csc_coeffs(vc4_hdmi, &vc5_hdmi_csc_full_rgb_to_limited_rgb);
+		csc_chan_ctl |= VC4_SET_FIELD(VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_LEGACY_STYLE,
+					      VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP);
 
+		if_cfg |= VC4_SET_FIELD(VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY,
+					VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422);
+
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_full_yuv422_bt709);
+	} else if (drm_hdmi_bus_fmt_is_yuv444(bridge_state->output_bus_cfg.format)) {
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_full_yuv444_bt709);
+	} else if (drm_hdmi_bus_fmt_is_rgb(bridge_state->output_bus_cfg.format)) {
+		if_xbar = 0x354021;
+
+		if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
+			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_unity);
+		else
+			vc5_hdmi_set_csc_coeffs(vc4_hdmi, vc5_hdmi_csc_full_rgb_to_limited_rgb);
+	}
+
+	HDMI_WRITE(HDMI_VEC_INTERFACE_CFG, if_cfg);
+	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, if_xbar);
+	HDMI_WRITE(HDMI_CSC_CHANNEL_CTL, csc_chan_ctl);
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 }
 
@@ -1012,6 +1074,7 @@ static const struct drm_bridge_funcs vc4_hdmi_bridge_funcs = {
 	.atomic_check =	vc4_hdmi_bridge_atomic_check,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_get_output_bus_fmts = drm_atomic_helper_bridge_hdmi_get_output_bus_fmts,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.mode_valid =	vc4_hdmi_bridge_mode_valid,
 };
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index e1b58eac766f..d03b9ad72412 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -52,6 +52,7 @@ enum vc4_hdmi_field {
 	HDMI_CSC_24_23,
 	HDMI_CSC_32_31,
 	HDMI_CSC_34_33,
+	HDMI_CSC_CHANNEL_CTL,
 	HDMI_CSC_CTL,
 
 	/*
@@ -116,6 +117,7 @@ enum vc4_hdmi_field {
 	HDMI_TX_PHY_POWERDOWN_CTL,
 	HDMI_TX_PHY_RESET_CTL,
 	HDMI_TX_PHY_TMDS_CLK_WORD_SEL,
+	HDMI_VEC_INTERFACE_CFG,
 	HDMI_VEC_INTERFACE_XBAR,
 	HDMI_VERTA0,
 	HDMI_VERTA1,
@@ -240,6 +242,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
+	VC5_DVP_REG(HDMI_VEC_INTERFACE_CFG, 0x0ec),
 	VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
 
 	VC5_PHY_REG(HDMI_TX_PHY_RESET_CTL, 0x000),
@@ -285,6 +288,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC5_CSC_REG(HDMI_CSC_24_23, 0x010),
 	VC5_CSC_REG(HDMI_CSC_32_31, 0x014),
 	VC5_CSC_REG(HDMI_CSC_34_33, 0x018),
+	VC5_CSC_REG(HDMI_CSC_CHANNEL_CTL, 0x02c),
 };
 
 static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
@@ -319,6 +323,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
+	VC5_DVP_REG(HDMI_VEC_INTERFACE_CFG, 0x0ec),
 	VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
 
 	VC5_PHY_REG(HDMI_TX_PHY_RESET_CTL, 0x000),
@@ -364,6 +369,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC5_CSC_REG(HDMI_CSC_24_23, 0x010),
 	VC5_CSC_REG(HDMI_CSC_32_31, 0x014),
 	VC5_CSC_REG(HDMI_CSC_34_33, 0x018),
+	VC5_CSC_REG(HDMI_CSC_CHANNEL_CTL, 0x02c),
 };
 
 static inline
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 9d7c034c8b4f..ff5c5faa019e 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -744,11 +744,27 @@
 # define VC4_HD_CSC_CTL_RGB2YCC			BIT(1)
 # define VC4_HD_CSC_CTL_ENABLE			BIT(0)
 
+# define VC5_MT_CP_CSC_CTL_USE_444_TO_422	BIT(6)
+# define VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_MASK \
+						VC4_MASK(5, 4)
+# define VC5_MT_CP_CSC_CTL_FILTER_MODE_444_TO_422_STANDARD \
+						3
+# define VC5_MT_CP_CSC_CTL_USE_RNG_SUPPRESSION	BIT(3)
 # define VC5_MT_CP_CSC_CTL_ENABLE		BIT(2)
 # define VC5_MT_CP_CSC_CTL_MODE_MASK		VC4_MASK(1, 0)
 
+# define VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_MASK \
+						VC4_MASK(7, 6)
+# define VC5_MT_CP_CHANNEL_CTL_OUTPUT_REMAP_LEGACY_STYLE \
+						2
+
 # define VC4_DVP_HT_CLOCK_STOP_PIXEL		BIT(1)
 
+# define VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_MASK \
+						VC4_MASK(3, 2)
+# define VC5_DVP_HT_VEC_INTERFACE_CFG_SEL_422_FORMAT_422_LEGACY \
+						2
+
 /* HVS display list information. */
 #define HVS_BOOTLOADER_DLIST_END                32
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

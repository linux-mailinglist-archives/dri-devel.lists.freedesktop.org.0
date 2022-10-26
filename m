Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB560E4D9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0710E559;
	Wed, 26 Oct 2022 15:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA6E10E543;
 Wed, 26 Oct 2022 15:34:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C058358034E;
 Wed, 26 Oct 2022 11:34:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Oct 2022 11:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798456; x=
 1666805656; bh=LzTPAa92BhQMzOTXJn8qXdt5AoqxQNWwjIipeEayeg8=; b=S
 I8wnwDx5kD31zoPF47dWJp6IGw5uZ8FvH5bxyZBt6ORtRrgWmnIMwWNS7l3Zbl25
 jY3WgSqKYsAOxR7+mf2Ir2nsq3PosXmhEX6407tBFOKUhkI+nj3iJ8C5VXAyWUgV
 U7J8inJqYQYN1jW3pBDMK2iDaqnUGYhe3HoEyxB3WPqKmU8hr3rWg1eLzotVQkaa
 iLrLpdGODSbW+a5H4hBCkalSz10+//KG2s2hrU1vQzwSYKirgSAx8kPCGXF+fusJ
 kvYzJvKmc+MzarZjwFgCWypWjzM9Lrlb0lBDd3ERNflddX/HnhoT/xcP76aKbuUO
 8KIbsyFaJC+FR8tQrcVaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798456; x=
 1666805656; bh=LzTPAa92BhQMzOTXJn8qXdt5AoqxQNWwjIipeEayeg8=; b=F
 lCxJ96xPnFyhOHGQQRmLQE792CaizBsC4A1dU79IIrvG+EK9Ics8jDI3a4Ez7/J2
 hLXS2BpbKrQhcYT4pl50N00xM1TPXw1M6uba7EKjnP+uXCt31i2TFA2qixZLYzLL
 +xpuL0r3dYuh3P3V7fp8y9alyBMR5Kq+0l7E8fSHSq9lNCMbfO38by6ExfczNbnJ
 VX/PhxjbT0M4V1lJecdY/lZwxETjMmbcnJSb5fWqyTYXrqqbGkeAw7SpBh+GTYE4
 VvMJzDLntGZTUJOiYT4rsK0/3GkMgeR04tlxv+mHQVOzoPPUeUhWJZWAQNbfmhem
 TmVIqmzh/PrxW8KU8iUiA==
X-ME-Sender: <xms:eFNZY1U_sgOjwkDu7-MX8UI5VbjTc7p6L-wyrEI7PZg7TYUWJ0ih9g>
 <xme:eFNZY1lxHRgoewitfzwhSq2gWwtYdDr7o4XUyzK_dycMYohhTbSPAFksl0_fo5Xgq
 mxDYCV_8i9XXTi0Rnw>
X-ME-Received: <xmr:eFNZYxaRy1vyXe9Awr1vnbqrSpiGX_ZBQYOfLzYRi6IfrkR_WLCH4FOFA5QGHAkVr1uBbmiokoEFIeQESBuSGY6IHeBfAr1IPfTzWFoHuAVj0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeltdekveelgfelveelfe
 duheelvdegudffgefhudehgeevjefhhefhhefgvdeuvdenucevlhhushhtvghrufhiiigv
 pedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:eFNZY4X2MROvGvWkXu5mFBb96EJ6RM9CxwQWVaY81oGS6UbPyFL5-Q>
 <xmx:eFNZY_k4oeQ4GS4r44RTvtZfW6sbVgGHtTK4p65vKwpj7JSWJ_CG8A>
 <xmx:eFNZY1eURyaMmC89Xp0ojS5blmRfFdLghb05saL5ZSMdoR-enS0eBA>
 <xmx:eFNZYzzqqZB1sxtnh4CMhOzK-AEHPYrzeyGwCKuz46pm9kVhI4-NWA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:34:16 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:41 +0200
Subject: [PATCH v6 22/23] drm/vc4: vec: Add support for more analog TV
 standards
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v6-22-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=8856; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wziPM3IaAF1FVTo4f54fr6Jfyy5eRta4gkEGakfYOhk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwe7v3FztUk6cWWbLZ8Z8/MSuzw+Xl79gyd7h1JAx9ZOh
 1oprHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIdgnDP/PgtxFy61n+vZW92Hs/tO
 4Vj5OGfGDcAw979VVT/epKtjIy/D51ZeeeC/YWO97+Wr156/w6823/F255+/5P8FytrJi4K0wA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

Add support for the following composite output modes (all of them are
somewhat more obscure than the previously defined ones):

- NTSC_443 - NTSC-style signal with the chroma subcarrier shifted to
  4.43361875 MHz (the PAL subcarrier frequency). Never used for
  broadcasting, but sometimes used as a hack to play NTSC content in PAL
  regions (e.g. on VCRs).
- PAL_N - PAL with alternative chroma subcarrier frequency,
  3.58205625 MHz. Used as a broadcast standard in Argentina, Paraguay
  and Uruguay to fit 576i50 with colour in 6 MHz channel raster.
- PAL60 - 480i60 signal with PAL-style color at normal European PAL
  frequency. Another non-standard, non-broadcast mode, used in similar
  contexts as NTSC_443. Some displays support one but not the other.
- SECAM - French frequency-modulated analog color standard; also have
  been broadcast in Eastern Europe and various parts of Africa and Asia.
  Uses the same 576i50 timings as PAL.

Also added some comments explaining color subcarrier frequency
registers.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v6:
- Support PAL60 again
---
 drivers/gpu/drm/vc4/vc4_vec.c | 111 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 107 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 1dda451c8def..d82aef168075 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -46,6 +46,7 @@
 #define VEC_CONFIG0_YDEL(x)		((x) << 26)
 #define VEC_CONFIG0_CDEL_MASK		GENMASK(25, 24)
 #define VEC_CONFIG0_CDEL(x)		((x) << 24)
+#define VEC_CONFIG0_SECAM_STD		BIT(21)
 #define VEC_CONFIG0_PBPR_FIL		BIT(18)
 #define VEC_CONFIG0_CHROMA_GAIN_MASK	GENMASK(17, 16)
 #define VEC_CONFIG0_CHROMA_GAIN_UNITY	(0 << 16)
@@ -76,6 +77,27 @@
 #define VEC_SOFT_RESET			0x10c
 #define VEC_CLMP0_START			0x144
 #define VEC_CLMP0_END			0x148
+
+/*
+ * These set the color subcarrier frequency
+ * if VEC_CONFIG1_CUSTOM_FREQ is enabled.
+ *
+ * VEC_FREQ1_0 contains the most significant 16-bit half-word,
+ * VEC_FREQ3_2 contains the least significant 16-bit half-word.
+ * 0x80000000 seems to be equivalent to the pixel clock
+ * (which itself is the VEC clock divided by 8).
+ *
+ * Reference values (with the default pixel clock of 13.5 MHz):
+ *
+ * NTSC  (3579545.[45] Hz)     - 0x21F07C1F
+ * PAL   (4433618.75 Hz)       - 0x2A098ACB
+ * PAL-M (3575611.[888111] Hz) - 0x21E6EFE3
+ * PAL-N (3582056.25 Hz)       - 0x21F69446
+ *
+ * NOTE: For SECAM, it is used as the Dr center frequency,
+ * regardless of whether VEC_CONFIG1_CUSTOM_FREQ is enabled or not;
+ * that is specified as 4406250 Hz, which corresponds to 0x29C71C72.
+ */
 #define VEC_FREQ3_2			0x180
 #define VEC_FREQ1_0			0x184
 
@@ -118,6 +140,14 @@
 
 #define VEC_INTERRUPT_CONTROL		0x190
 #define VEC_INTERRUPT_STATUS		0x194
+
+/*
+ * Db center frequency for SECAM; the clock for this is the same as for
+ * VEC_FREQ3_2/VEC_FREQ1_0, which is used for Dr center frequency.
+ *
+ * This is specified as 4250000 Hz, which corresponds to 0x284BDA13.
+ * That is also the default value, so no need to set it explicitly.
+ */
 #define VEC_FCW_SECAM_B			0x198
 #define VEC_SECAM_GAIN_VAL		0x19c
 
@@ -197,10 +227,15 @@ enum vc4_vec_tv_mode_id {
 	VC4_VEC_TV_MODE_NTSC_J,
 	VC4_VEC_TV_MODE_PAL,
 	VC4_VEC_TV_MODE_PAL_M,
+	VC4_VEC_TV_MODE_NTSC_443,
+	VC4_VEC_TV_MODE_PAL_60,
+	VC4_VEC_TV_MODE_PAL_N,
+	VC4_VEC_TV_MODE_SECAM,
 };
 
 struct vc4_vec_tv_mode {
 	unsigned int mode;
+	u16 expected_htotal;
 	u32 config0;
 	u32 config1;
 	u32 custom_freq;
@@ -236,35 +271,68 @@ static const struct debugfs_reg32 vec_regs[] = {
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		.mode = DRM_MODE_TV_MODE_NTSC_443,
+		.expected_htotal = 858,
+		.config0 = VEC_CONFIG0_NTSC_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x2a098acb,
+	},
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC_J,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL,
+		.expected_htotal = 864,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		/* PAL-60 */
+		.mode = DRM_MODE_TV_MODE_PAL,
+		.expected_htotal = 858,
+		.config0 = VEC_CONFIG0_PAL_M_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x2a098acb,
+	},
 	{
 		.mode = DRM_MODE_TV_MODE_PAL_M,
+		.expected_htotal = 858,
 		.config0 = VEC_CONFIG0_PAL_M_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		.mode = DRM_MODE_TV_MODE_PAL_N,
+		.expected_htotal = 864,
+		.config0 = VEC_CONFIG0_PAL_N_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+	},
+	{
+		.mode = DRM_MODE_TV_MODE_SECAM,
+		.expected_htotal = 864,
+		.config0 = VEC_CONFIG0_SECAM_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+		.custom_freq = 0x29c71c72,
+	},
 };
 
 static inline const struct vc4_vec_tv_mode *
-vc4_vec_tv_mode_lookup(unsigned int mode)
+vc4_vec_tv_mode_lookup(unsigned int mode, u16 htotal)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
 		const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
 
-		if (tv_mode->mode == mode)
+		if (tv_mode->mode == mode &&
+		    tv_mode->expected_htotal == htotal)
 			return tv_mode;
 	}
 
@@ -273,9 +341,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
 
 static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
 	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
+	{ VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
 	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
 	{ VC4_VEC_TV_MODE_PAL, "PAL", },
+	{ VC4_VEC_TV_MODE_PAL_60, "PAL-60", },
 	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
+	{ VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
+	{ VC4_VEC_TV_MODE_SECAM, "SECAM", },
 };
 
 static enum drm_connector_status
@@ -306,11 +378,16 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		state->tv.mode = DRM_MODE_TV_MODE_NTSC;
 		break;
 
+	case VC4_VEC_TV_MODE_NTSC_443:
+		state->tv.mode = DRM_MODE_TV_MODE_NTSC_443;
+		break;
+
 	case VC4_VEC_TV_MODE_NTSC_J:
 		state->tv.mode = DRM_MODE_TV_MODE_NTSC_J;
 		break;
 
 	case VC4_VEC_TV_MODE_PAL:
+	case VC4_VEC_TV_MODE_PAL_60:
 		state->tv.mode = DRM_MODE_TV_MODE_PAL;
 		break;
 
@@ -318,6 +395,14 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		state->tv.mode = DRM_MODE_TV_MODE_PAL_M;
 		break;
 
+	case VC4_VEC_TV_MODE_PAL_N:
+		state->tv.mode = DRM_MODE_TV_MODE_PAL_N;
+		break;
+
+	case VC4_VEC_TV_MODE_SECAM:
+		state->tv.mode = DRM_MODE_TV_MODE_SECAM;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -341,6 +426,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		*val = VC4_VEC_TV_MODE_NTSC;
 		break;
 
+	case DRM_MODE_TV_MODE_NTSC_443:
+		*val = VC4_VEC_TV_MODE_NTSC_443;
+		break;
+
 	case DRM_MODE_TV_MODE_NTSC_J:
 		*val = VC4_VEC_TV_MODE_NTSC_J;
 		break;
@@ -353,6 +442,14 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		*val = VC4_VEC_TV_MODE_PAL_M;
 		break;
 
+	case DRM_MODE_TV_MODE_PAL_N:
+		*val = VC4_VEC_TV_MODE_PAL_N;
+		break;
+
+	case DRM_MODE_TV_MODE_SECAM:
+		*val = VC4_VEC_TV_MODE_SECAM;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -448,13 +545,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
 	struct drm_connector *connector = &vec->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_display_mode *adjusted_mode =
+		&encoder->crtc->state->adjusted_mode;
 	const struct vc4_vec_tv_mode *tv_mode;
 	int idx, ret;
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode);
+	tv_mode = vc4_vec_tv_mode_lookup(conn_state->tv.mode,
+					 adjusted_mode->htotal);
 	if (!tv_mode)
 		goto err_dev_exit;
 
@@ -643,9 +743,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	ret = drm_mode_create_tv_properties(drm,
 					    BIT(DRM_MODE_TV_MODE_NTSC) |
+					    BIT(DRM_MODE_TV_MODE_NTSC_443) |
 					    BIT(DRM_MODE_TV_MODE_NTSC_J) |
 					    BIT(DRM_MODE_TV_MODE_PAL) |
-					    BIT(DRM_MODE_TV_MODE_PAL_M));
+					    BIT(DRM_MODE_TV_MODE_PAL_M) |
+					    BIT(DRM_MODE_TV_MODE_PAL_N) |
+					    BIT(DRM_MODE_TV_MODE_SECAM));
 	if (ret)
 		return ret;
 

-- 
b4 0.11.0-dev-99e3a

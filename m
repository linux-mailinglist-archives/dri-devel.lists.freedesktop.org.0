Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C957628023
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE7810E2E6;
	Mon, 14 Nov 2022 13:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F8910E2BC;
 Mon, 14 Nov 2022 13:01:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B13FD58023E;
 Mon, 14 Nov 2022 08:01:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 14 Nov 2022 08:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430892; x=
 1668438092; bh=slrAssegWWvNkWVPiVAuVYXZvtw+Bj21hZjqLTF8ly0=; b=e
 l1biRSYIslHYU3nn8yEZQtA/8URPc7hEtVuvZEM38LuHvkTFQ938nCJQh2KbbN8k
 yWORFny5kJ/rWPpUVWTYWpgIlKDXhhknGdk6WZ915UQly2Pr3ti601Lxo8SwDFC8
 sU/h8h8gBmPHmfi6EvZDZVLdgrNmHJvxZ7v8pKsbycJf4QuNSs4jjTsksg3RBct5
 tFh2cdUgo4GC8n+j3tcWGYwOJOraIq+MTkCJPUWYh8RKI39cPW1QbdIx+0/WSS9r
 NrBWoV+EhsF7h0XXmfo19gHMdkEeJCw+yQDut8bnK8dh2aHROjm802d+t46HdYWZ
 AYiejOt6yx46QVFk/4C+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430892; x=
 1668438092; bh=slrAssegWWvNkWVPiVAuVYXZvtw+Bj21hZjqLTF8ly0=; b=K
 oLzbimFCBbYKXrEtyl/Un8jgyXP3LB8mibSdmkK+ZLdlICsCRrWLLI3lZoGljkFq
 JZf20f0Hyt6yS3wrhjvShtiPbKA1V4YbXsFQWEzJTzXOGIu1UfENhh3+kCwnxaYB
 yXRLTuKjfOh9EvZiYRIJ4fhMsvVYJFMfm7RJTbPabdC7q5bcGCswx5twZ2htyTO/
 GkXsN5PKN3hfo+0OHo6N75FTG7C6TG1ar0NtnhKG5JJKovsymge0hO+8dtszaI48
 bmfbdMjvjO6091pOxOD/qkYj2PLbOK7jvXlPwNb2+v3j5efibGOyBZ3AdPhawZ2X
 razU6uaBi1opTYkA5U2qQ==
X-ME-Sender: <xms:JjxyYwOYudmFqLMHDf2t4cUD66LJpHZ4tu6SJfiHPPQtDufLwBRpyw>
 <xme:JjxyY2-HUneFkFo15NF7UJNm_mwiVrUBdtrmk7D3YyUwPB2bRI0fEB_rX0-7yXm5A
 rgBan7WBHyhAYzistE>
X-ME-Received: <xmr:JjxyY3S8hQdBTtTUCzqA9c5kqomgsXgYzz4UsehIqjXttZMHfkfeyFyXFV9OBFpBEc0IXFd3iC8jQEHYfS4Q71vLTCb7Rpfq9SfNLdTN_d4dDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JzxyY4vhFPM4VCeWNZ3RkD0DSYk9chq8144uM3J-XFYzV3dTqjXz3A>
 <xmx:JzxyY4eu7vQPUvX2Gv0jHxOwtnV4IDQo735cIwvI19L2D3cVSkCbnQ>
 <xmx:JzxyY801yDF_6oJIa8nvW5wLhMMcjihjTLwpygw5OpZrRPXtgdfymA>
 <xmx:LDxyY3okT-7iJ09Cuh6k_9-b5tNihJ1gsbdY4KNZcZ1HP_yT_BQGPg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:43 +0100
Subject: [PATCH v9 24/25] drm/vc4: vec: Add support for more analog TV
 standards
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-24-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=8918; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=aRPN8CYzoFe/tgF+2WkH1Xr9rVMVlBuzTrPCF7ffhso=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m+W+u/Of7lzjqORqrRF1ORwMR7RPoEXE3e0B+ea6W2Q
 nGbZUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlk7Wb4p+1g1/rM8bHfZjaTn0ezZz
 /q9nU688lW/MuUo+kn1n13YmVkuHfv/h4foaNp3QbrcoWsDFZ2/n0V6rON9+DR01bex6PDuAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v6:
- Support PAL60 again
---
 drivers/gpu/drm/vc4/vc4_vec.c | 111 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 107 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a828fc6fb776..d23dbad3cbf6 100644
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
 
@@ -648,9 +748,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
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

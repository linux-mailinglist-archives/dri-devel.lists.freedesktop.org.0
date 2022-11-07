Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB961F5AB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E079310E334;
	Mon,  7 Nov 2022 14:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39D310E335;
 Mon,  7 Nov 2022 14:18:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 1EDF72B0670D;
 Mon,  7 Nov 2022 09:18:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 09:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830702; x=
 1667837902; bh=W/AoZ7okpyAKSoyvVTIS4Mb2HAz9vXqMyE6i6B6cjxE=; b=J
 ybOfXt80pKff9CziBy80hvyzHjLEMwgJyiDeZesr+y2vEQPb6Hose9XqIYD/adHL
 TTcnQQy8m7Ip6/pocTkYAu0WEL78yRoN4FamFNHcQBNIDCmiVZcaqCybB0rp+6Xg
 K/xJL9ZDGEIBn01wl3tAdfjaPap25zUSZ+/+GEQQ3Tet77xuBDl4duWDK2aUQ2KT
 g8AOCifbk4tZKFqkJZjiZ+9Z1JMcw+SX+K5KuDzM9Re5EK4m9SNqe1/SA3uKKOUd
 94Xk3CfW2NxtQu4L+wR3IsuQ0N5ktbiiKqxQdnzM6RP3/vrLrEQ+ziKJW1r1k37x
 bSFwWW7KoRwqMnE4iCQ0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830702; x=
 1667837902; bh=W/AoZ7okpyAKSoyvVTIS4Mb2HAz9vXqMyE6i6B6cjxE=; b=u
 Otzz4ZMCrXy5zhL3I7IpMLYSQ0x7kKXXMV4HxqKu93Zlx6xcZREfReTStDWYYEqA
 iRHnVLJjYn1HqHiwyMBkOBkC2fs/lxIaUMkaKY/d0CVQWAjCbYByOq8xbftulx21
 k6G5TQvtheOH7Qs69AnopVhLE002ln4M1EqJosiXW+am/uvLSg/pwW7Cq81bJ5GW
 k15cYum7ZoEylTsPvonEmxnrLdQ1VNHHm1zQ5OdVwTIl9+KaNE656miYokLfUSAz
 p0BzLODpLQlp0AgyxkDLZ43vTLXqr4ob8RZQWEcKG5/+AUKONrBJn5tTyyVYM8q9
 66JA9r+Q0RTl9yyfrYPwA==
X-ME-Sender: <xms:rhNpY0948ephEk6kW1vpfbN6Bgr08ISJTeGk3KZw-vNFjW-f2mytLQ>
 <xme:rhNpY8tPsa2Vr9AJB_Ysxes87WfzH5jXN8sqrxsIHRQq5e7WF-plwYlMONlgGF9H9
 KUTDGDv1ATnRnQeotg>
X-ME-Received: <xmr:rhNpY6Czs9LfB9q4ZImdCRxW8W13PlwkWxHVKuwU9eEUeKwtrMT5yNbaTaffSk1pW3p9BwOtIRgkSv3CQwCgtX3C-qGM-roXwdoBmfPrYMtCkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rhNpY0enSMbXI_NQIeZczm_J97cNruoGfCtG8G915ltF4l36WHjG0Q>
 <xmx:rhNpY5PH8LZ78q5v2uD32sGFHkkl1Xc9rqwR19PHq-ZZrc6Bxg-aBg>
 <xmx:rhNpY-mnPS7Gcoc8-YL3Hj4ulklL7cdWEYXUPulNMzmA1HOO5XZyrw>
 <xmx:rhNpY2ZIV2hXABtDg8rna33azY1_IvJI3a-S_wXTYGuaOWY1is4RhtchP9A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:18:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:48 +0100
Subject: [PATCH v7 22/23] drm/vc4: vec: Add support for more analog TV
 standards
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=8856; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=EbPftq4g1jNeDPRGyXzRSPi6xpr+fZRv0lqx7FHi7lE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg58G948DmjqYNXd8ea597q1N6JcX/7ad1ct95+X+6Lv
 ijIMHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjI1GhGhq+aG9g8Enar1dYuSdtxQo
 RH6TezOoOyeN7jfzI7Zs923MDIMNmYIzJU/Gi69es5R6ba5NR1C/oqikk4ePOXrX9Ty7uEDwA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

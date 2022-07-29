Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258E95853D5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0A110F00F;
	Fri, 29 Jul 2022 16:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E6B10F737
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 556EF580985;
 Fri, 29 Jul 2022 12:36:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 29 Jul 2022 12:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112614; x=
 1659119814; bh=whvPVVthKbSxDiFpQbK45mdHTwISFKL9gD5bt0ROd6s=; b=l
 7BGo0DX0o++A2nHPIJ6mVTn0MG/UTvhptFXCphq0bNiBXZ03Uc1/KVdSOk7b+fUL
 R9Sr586o2zHw7l4SG/WxpCJjay4qhQnyhprZ5q1z8Sv5BFnNi7DtZtvdgYw2N2Bx
 jY8sN3cnEEzePB9kNCOcP4tqdQg177i44qUhtkyl+g391yIFjCLECnhhaJ1G5AfL
 sCQXVSrXopfxOacx2cpfSkp8LcAuhn+Z9dhXbOKGmbNb6qoDApNzm/fgixb26N+/
 VD1pU3uZqj//4ei4TZPjV+DID9rMrSAAENnGpxoeinynv197osgAnryKDjekBWGA
 7E5cuzkT/OSI3SP7PukIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112614; x=
 1659119814; bh=whvPVVthKbSxDiFpQbK45mdHTwISFKL9gD5bt0ROd6s=; b=v
 ihTe8DtYIgMO52PCo4aeX2+O7x4VMLeUtM7KJyx8x+Nh6JZVEIyRbJGzrBkE5NLL
 iEj8iEUDKrj0O7RQ6ySrlAaAretM0j/5fq+wJFy8eelWCpFIkO4FvTQhSoV3rwOq
 Q4bC2yUd2IUctlEX5HdaYoCNOHie/QUnhp9Bjwr8m3DdhZbsvbUGPT/7XDGxP/+L
 yCsamTiCEb7y6MFv+YH3kPgP/dXdsV3aoxfqi1mMjRmsSq7+YxXhkFx3YWDo/Fio
 tzxN4OrLJ+EKeuMB7NkeV2C2jdwgQta8VMbFEh2EXvk7QqWR5+YqFSalB9Q738m1
 is1N8zAr3W41LPwPlYfsg==
X-ME-Sender: <xms:pgzkYjRvgcJu7Ygd3JbDfmu8m0mNhOG9U2fWRst9oiwj-xYY47vFQg>
 <xme:pgzkYkwt6_5PXCKW2ksNE8qBbpJoFuTz6XtFsBiw6XuZcxCWoUoKSFVOjC8Lx_k3H
 xZVNIcnopN7U7ZtApU>
X-ME-Received: <xmr:pgzkYo3pRHYxpFslrc2UEPfy81tsNNNZAtwCPq0YV8-6a-fQ4ooIiXzDibeLOoYbQ8UEyEOa1LoRHMSs4Hs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pgzkYjCLCx6RytANBVNWbxh-MMqa7G6ZPOuB7l3h2ZtrF3AnfE8kWA>
 <xmx:pgzkYsgne1ZvMSRR2QOD6pvKHviiJa12DGbEyOFzit61-M_VG0cDPw>
 <xmx:pgzkYno8dBUbxakaFUmRVJorY1kPvMzx8JQzXVrM77lYP_-SHEM3Dw>
 <xmx:pgzkYjSWaLxAAPO2oVeqHoOgeZ7H10Jt9v-Fx8D98MtNBfFkslJfEw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 24/35] drm/vc4: vec: Add support for more analog TV
 standards
Date: Fri, 29 Jul 2022 18:35:07 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-24-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=7705; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dxW9mrioJsNatHiIFNrFz1iMtdbhBmkn433xG3w6uHA=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHinWuzo+rGjBWZUyX1NGS3aVc8KWed33ar9crhF2t5
 Be02d5SyMAhzMMiKKbJcF3xrxxcW5RbB82EzzBxWJpAhDFycAjCRVF2G/0kRc6JeSKg3+88ty3qvUS
 Hi5HDJUurWEc6LBx53/V3FVMPwT11riVGToXS0d02vlEmc6JIH385KNqY3XmBt//Za7Wd2DgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index e40b55de1b3c..91d343238b0f 100644
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
 
@@ -194,9 +224,13 @@ connector_to_vc4_vec(struct drm_connector *connector)
 
 enum vc4_vec_tv_mode_id {
 	VC4_VEC_TV_MODE_NTSC,
+	VC4_VEC_TV_MODE_NTSC_443,
 	VC4_VEC_TV_MODE_NTSC_J,
 	VC4_VEC_TV_MODE_PAL,
+	VC4_VEC_TV_MODE_PAL_60,
 	VC4_VEC_TV_MODE_PAL_M,
+	VC4_VEC_TV_MODE_PAL_N,
+	VC4_VEC_TV_MODE_SECAM,
 };
 
 struct vc4_vec_tv_mode {
@@ -234,6 +268,12 @@ static const struct debugfs_reg32 vec_regs[] = {
 };
 
 static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
+	{
+		.mode = DRM_MODE_TV_NORM_NTSC_443,
+		.config0 = VEC_CONFIG0_NTSC_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x2a098acb,
+	},
 	{
 		.mode = DRM_MODE_TV_NORM_NTSC_M,
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
@@ -244,6 +284,12 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config0 = VEC_CONFIG0_NTSC_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		.mode = DRM_MODE_TV_NORM_PAL_60,
+		.config0 = VEC_CONFIG0_PAL_M_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x2a098acb,
+	},
 	{
 		.mode = DRM_MODE_TV_NORM_PAL_B,
 		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
@@ -254,6 +300,17 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config0 = VEC_CONFIG0_PAL_M_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		.mode = DRM_MODE_TV_NORM_PAL_N,
+		.config0 = VEC_CONFIG0_PAL_N_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+	},
+	{
+		.mode = DRM_MODE_TV_NORM_SECAM_B,
+		.config0 = VEC_CONFIG0_SECAM_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+		.custom_freq = 0x29c71c72,
+	},
 };
 
 static inline const struct vc4_vec_tv_mode *
@@ -273,9 +330,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
 
 static const struct drm_prop_enum_list tv_mode_names[] = {
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
@@ -329,6 +390,10 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		state->tv.norm = DRM_MODE_TV_NORM_NTSC_M;
 		break;
 
+	case VC4_VEC_TV_MODE_NTSC_443:
+		state->tv.norm = DRM_MODE_TV_NORM_NTSC_443;
+		break;
+
 	case VC4_VEC_TV_MODE_NTSC_J:
 		state->tv.norm = DRM_MODE_TV_NORM_NTSC_J;
 		break;
@@ -337,10 +402,22 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		state->tv.norm = DRM_MODE_TV_NORM_PAL_B;
 		break;
 
+	case VC4_VEC_TV_MODE_PAL_60:
+		state->tv.norm = DRM_MODE_TV_NORM_PAL_60;
+		break;
+
 	case VC4_VEC_TV_MODE_PAL_M:
 		state->tv.norm = DRM_MODE_TV_NORM_PAL_M;
 		break;
 
+	case VC4_VEC_TV_MODE_PAL_N:
+		state->tv.norm = DRM_MODE_TV_NORM_PAL_N;
+		break;
+
+	case VC4_VEC_TV_MODE_SECAM:
+		state->tv.norm = DRM_MODE_TV_NORM_SECAM_B;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -360,6 +437,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		return -EINVAL;
 
 	switch (state->tv.norm) {
+	case DRM_MODE_TV_NORM_NTSC_443:
+		*val = VC4_VEC_TV_MODE_NTSC_443;
+		break;
+
 	case DRM_MODE_TV_NORM_NTSC_J:
 		*val = VC4_VEC_TV_MODE_NTSC_J;
 		break;
@@ -368,6 +449,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		*val = VC4_VEC_TV_MODE_NTSC;
 		break;
 
+	case DRM_MODE_TV_NORM_PAL_60:
+		*val = VC4_VEC_TV_MODE_PAL_60;
+		break;
+
 	case DRM_MODE_TV_NORM_PAL_B:
 		*val = VC4_VEC_TV_MODE_PAL;
 		break;
@@ -376,6 +461,14 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		*val = VC4_VEC_TV_MODE_PAL_M;
 		break;
 
+	case DRM_MODE_TV_NORM_PAL_N:
+		*val = VC4_VEC_TV_MODE_PAL_N;
+		break;
+
+	case DRM_MODE_TV_NORM_SECAM_B:
+		*val = VC4_VEC_TV_MODE_SECAM;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -605,10 +698,13 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ret = drm_mode_create_tv_properties(drm,
+					    DRM_MODE_TV_NORM_NTSC_443 |
 					    DRM_MODE_TV_NORM_NTSC_J |
 					    DRM_MODE_TV_NORM_NTSC_M |
 					    DRM_MODE_TV_NORM_PAL_B |
-					    DRM_MODE_TV_NORM_PAL_M,
+					    DRM_MODE_TV_NORM_PAL_M |
+					    DRM_MODE_TV_NORM_PAL_N |
+					    DRM_MODE_TV_NORM_SECAM_B,
 					    0, NULL);
 	if (ret)
 		return ret;

-- 
b4 0.10.0-dev-49460

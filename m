Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039A5EFAF0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38B410EB34;
	Thu, 29 Sep 2022 16:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6857510EAFD;
 Thu, 29 Sep 2022 16:32:18 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id C6527580807;
 Thu, 29 Sep 2022 12:32:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 29 Sep 2022 12:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469137; x=
 1664476337; bh=EYCtbKpuvjjLCC1qBA8o+tpUH/WDA4qWX6nARImzmaw=; b=f
 LEEwcpXHIzEyxS5XBU0+n/aNcTKWrgZBahBso+J7E5xxkYDD/KChSYkk1Y2j+eBx
 tH/v1d0NPT5MbyDUuJdHrFxtYpkD4POtL1VBVrE+OkrW9FXxrhTKWf+zlMQNDKel
 XA4S/rH3ior2Sd25H7ZD2pxNOzSB1qXM76p/nUt0L1Twjq+mr2qnsjDH6W4gUrbT
 pZYkIfMndi8/iACHV3hYm1jiCw1a/42rs9zhlbdQZxqfIn9HIizjjpNxBJ0bzzbq
 5bCuhWI6HtL8Bu+EEwr9vnpTTNqxSoJSUQ458Qj//VX7dAoK5d+xPdi5uHnZeJ+3
 /HYKtywFJ41d/umkRdptQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469137; x=
 1664476337; bh=EYCtbKpuvjjLCC1qBA8o+tpUH/WDA4qWX6nARImzmaw=; b=v
 MMMxKTT4xnfTtvzJklblIN25PbrjGQJdwCIr1tEYr07GLjeUp6FKW74KKDVAxYMG
 6zOqlhChXGQXHwbINDPjiYvu4KS71IEFfSAVR+w7w3YH2OadWI+w16/FFGLxDkg3
 ZM4LZNmKSfy6hVAx+KwuQFf3PsER70+nPGjMExFOVsQosx/L3xVehYaWlmsjO7Am
 Fv/K+b0N3NypoOcD36tyox2Cl6velqW884WRLi3YojTvKUuRtuSSse0OptC1fJlQ
 ArmjMeud3CTEZR34pW4toMzV/j/4lAa0vlqBuDXvwoMDDbL6Wn9ZXpIVEPrrYgTP
 70qVcxVpo4YuRniB4eWnQ==
X-ME-Sender: <xms:kcg1Y19SP0kJQLngwk8qMcf3pMuV4jtfUvNRqRXYgbAKmnn-LNZc_w>
 <xme:kcg1Y5uIga1Aqm9WynrHSdqbqOCYLcdginr742z-6e5FTXWnwg-cFKNB_AtM3Gp1J
 q0U2X-4iPHBqo6Nnfc>
X-ME-Received: <xmr:kcg1YzDEJpHPCBFNpQbEfPRiZvE-46HTRUZ6m4AmzM9uQzL-KV_GE0is8NP6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffg
 tedtleelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kcg1Y5cU6GLGtdeABC3xaPWBWRwG7Rkw3-JlS9ePlBZ6jhEqeXfvRw>
 <xmx:kcg1Y6MyyMjmpwWiEOzdJ9LARb8vAbpBfAh8cpu018Wy1mItaG_YEw>
 <xmx:kcg1Y7md5uPtV49CTggwSW5ow7sMe5Cd4Er4uBu9sIrQU6ThY166Mg>
 <xmx:kcg1Y_bZtAfIJ1rqx3WBpMuwW8jOMUWezZDykYEc1XwkhO2zqoTczA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:32:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:23 +0200
Subject: [PATCH v4 29/30] drm/vc4: vec: Add support for more analog TV
 standards
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v4-29-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=6916; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wP84AdCzkoI1RDMSbNe0Fx/nLdPMd0LKH5QXvUqUkNk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJzzmiN+Y8qrlW3p0v/bx2+Ef+oKv3JyV78ny677bj/vt
 lyeqd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi3qEM/9TyWwzjHabtf/869vHsE9
 r3wjlU45WjM/656nI4pUTJ9TAyHONb2LoiJpq9jNNgtauNgkr2avW9Ft4xz/lZVBb87pFkBAA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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
 drivers/gpu/drm/vc4/vc4_vec.c | 84 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index b342dc9cf69c..8d37d7ba9b2a 100644
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
 
@@ -197,6 +227,10 @@ enum vc4_vec_tv_mode_id {
 	VC4_VEC_TV_MODE_NTSC_J,
 	VC4_VEC_TV_MODE_PAL,
 	VC4_VEC_TV_MODE_PAL_M,
+	VC4_VEC_TV_MODE_NTSC_443,
+	VC4_VEC_TV_MODE_PAL_60,
+	VC4_VEC_TV_MODE_PAL_N,
+	VC4_VEC_TV_MODE_SECAM,
 };
 
 struct vc4_vec_tv_mode {
@@ -239,6 +273,12 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		.mode = DRM_MODE_TV_MODE_NTSC_443,
+		.config0 = VEC_CONFIG0_NTSC_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
+		.custom_freq = 0x2a098acb,
+	},
 	{
 		.mode = DRM_MODE_TV_MODE_NTSC_J,
 		.config0 = VEC_CONFIG0_NTSC_STD,
@@ -254,6 +294,17 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
 		.config0 = VEC_CONFIG0_PAL_M_STD,
 		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
 	},
+	{
+		.mode = DRM_MODE_TV_MODE_PAL_N,
+		.config0 = VEC_CONFIG0_PAL_N_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+	},
+	{
+		.mode = DRM_MODE_TV_MODE_SECAM,
+		.config0 = VEC_CONFIG0_SECAM_STD,
+		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
+		.custom_freq = 0x29c71c72,
+	},
 };
 
 static inline const struct vc4_vec_tv_mode *
@@ -273,9 +324,13 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
 
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
@@ -330,6 +385,10 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		state->tv.mode = DRM_MODE_TV_MODE_NTSC;
 		break;
 
+	case VC4_VEC_TV_MODE_NTSC_443:
+		state->tv.mode = DRM_MODE_TV_MODE_NTSC_443;
+		break;
+
 	case VC4_VEC_TV_MODE_NTSC_J:
 		state->tv.mode = DRM_MODE_TV_MODE_NTSC_J;
 		break;
@@ -342,6 +401,14 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
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
@@ -365,6 +432,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		*val = VC4_VEC_TV_MODE_NTSC;
 		break;
 
+	case DRM_MODE_TV_MODE_NTSC_443:
+		*val = VC4_VEC_TV_MODE_NTSC_443;
+		break;
+
 	case DRM_MODE_TV_MODE_NTSC_J:
 		*val = VC4_VEC_TV_MODE_NTSC_J;
 		break;
@@ -377,6 +448,14 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
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
@@ -664,9 +743,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
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
b4 0.11.0-dev-7da52

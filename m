Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46EA5E6590
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C6910EBCF;
	Thu, 22 Sep 2022 14:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9B10EBC7;
 Thu, 22 Sep 2022 14:29:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 1AEC02B05B4A;
 Thu, 22 Sep 2022 10:29:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856965; x=
 1663864165; bh=oDjaofL94i8g8M1QB7L4+qraxJGhG+O3nCmHho8B0JU=; b=A
 yShVECO/u0SKCfF1pW/h+ruzWWxRFcyDkhHEI+qwbdKG60NMrejxlMGNgEbZ9SRs
 nPFiIpaNLVa6cn+B8KlWEa37H5rmk/wv2L6kQS2RxsKLHIHc7I4nnKBN9ypjG4Dr
 8zXLMTC6zivZjh99dTIh39DMrofblX/nFMeqtnWvgaYbtxaV9KD2KXAqai3JNRDE
 utivThpMixJKtfIokXMpXGbwFAc52EKLZHFXZ50TtS5qsdLUbL6A1E8mbuEEEooP
 bhRHAXcc+XocyDstT29GrntLkH/B/PCgs+AOv6UnvvxZSIcf5V1Ji2d031aHmn/T
 77NGqvJW3UHwY868oL3ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856965; x=
 1663864165; bh=oDjaofL94i8g8M1QB7L4+qraxJGhG+O3nCmHho8B0JU=; b=L
 8npyZeu7Yy4xeajl2LCJvNosUIBIPO+qVBsdrb4F1UxYey036NJMmwl2Lg1K5LrG
 uFPI14RtH/Esjmfx8iZ9gkyajv2Xwws/3oN4pUR6o7Zf+TA4VdpZ2hmPduu3qO42
 RS05rKk0/Uy4bdvc4Desh5o5F5xqvRjQOkbcKvRgoIDc3nH0AbSIgddUiqfk3yVo
 3bzehy60rBr/pppmcDDWUgZgcOCM6TaU5F5MnQPUxF9QNTlUjscDHrDjCJXMrbTu
 qrVaJzm1ePwhjS9HMG/SAUiVSjQxB/+3gePtchBY6haJwPDshJQb//A3WI2pA/GF
 8ZRMX7H7aN4FY4nyMzXSA==
X-ME-Sender: <xms:RXEsY642u1xrMF9a3eybyE3ugbq_ZmN2z0G5N8vZ6tD3YeKxO4IMPg>
 <xme:RXEsYz64NEOjVTemVhPH_eYJ4vBYoFd2JGELPJu563OGC6eW4kcsMCH6mr1xsvBz5
 II4-8kvoQt7xSs_Sig>
X-ME-Received: <xmr:RXEsY5d-go8JocGW4s464_s-cqmazIR4rA-iPBIlMl1j_pvRhyytZO3kBVE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RXEsY3L8YkKziQYxyeBT5gLF33SIlRm2MBNEHSJPXKZR2IB309Bvwg>
 <xmx:RXEsY-KsTwS9_cwBMkJQCVW1c3yy_JgOtYPP7cyvOK2nz3cepzroxA>
 <xmx:RXEsY4xEfki8cfbV083drwtAA4FFnQEZ_Ba6MI6suaOWcCl17RK0vg>
 <xmx:RXEsY00ricaWBQgWG0yP_Y6a4ZD0HO3LgQTHwQZ1J51RNapN2RhoKR5ri_I>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:29:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:49 +0200
Subject: [PATCH v2 32/33] drm/vc4: vec: Add support for more analog TV
 standards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-32-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6722; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=p/8ZEc2hToewfWpbizBsuyavKEakKIkKnI2WdrETWBI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BUH/2ppc+nTOOp2aFeQgHu85g4lP9UHPg7qbqQ9furem
 S8/pKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwET8pzP8zxVSWDnvwGce5qvWj3m0+B
 yFdgr7Fq+wrea6wJ0TrGU+kZHhl0F+cfGx5wlz1iiqTpj8pka79UXrfYuQo5e6VosvcHfkAAA=
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

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a9463364015b..0862462aa9e3 100644
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
@@ -333,6 +388,10 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
 		state->tv.mode = DRM_MODE_TV_MODE_NTSC;
 		break;
 
+	case VC4_VEC_TV_MODE_NTSC_443:
+		state->tv.mode = DRM_MODE_TV_MODE_NTSC_443;
+		break;
+
 	case VC4_VEC_TV_MODE_NTSC_J:
 		state->tv.mode = DRM_MODE_TV_MODE_NTSC_J;
 		break;
@@ -345,6 +404,14 @@ vc4_vec_connector_set_property(struct drm_connector *connector,
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
@@ -368,6 +435,10 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
 		*val = VC4_VEC_TV_MODE_NTSC;
 		break;
 
+	case DRM_MODE_TV_MODE_NTSC_443:
+		*val = VC4_VEC_TV_MODE_NTSC_443;
+		break;
+
 	case DRM_MODE_TV_MODE_NTSC_J:
 		*val = VC4_VEC_TV_MODE_NTSC_J;
 		break;
@@ -380,6 +451,14 @@ vc4_vec_connector_get_property(struct drm_connector *connector,
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
@@ -667,9 +746,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
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
b4 0.10.0

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7459102AA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 13:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D698A10E92A;
	Thu, 20 Jun 2024 11:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="bDRuvEBX";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="H3fbQeiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D4310E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 11:32:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 2E482114026F;
 Thu, 20 Jun 2024 07:32:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Jun 2024 07:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1718883174; x=
 1718969574; bh=cux+34nh+ulo2PN/kYT7VG5ILDPHNeEI/xcJjfx83Is=; b=b
 DRuvEBXRZ/wSrxasmhOHX0qtLdzaIYBynBMlPMnZxBlOJWrvLKpKSa5eRhjYhiZ4
 kaQ8b43442D2Yz3s8nKfaTLnFXI6nbUJ2uhBeuymRLXZDT2dQHCU7QEcSCHgwGxN
 gYPij4l780w2QxVekuMZrYMCoCzjZJzNnDhtghNPiAOIuEmD0sMnMwtGauytZenm
 pY6nQuoXbEb9zdRDIRf1ZB2eAUJ6X+U7To1RaaoXqMUDZM2P5dYiSaJEw2IzaRha
 CA+eOEiWYeKiPU06JadahyG+0aI82wTmndz7RW19DFWOL4aYr5IQrCeGCe2RNHCK
 Ik3N4mXtpZTEer9VbcbxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883174; x=
 1718969574; bh=cux+34nh+ulo2PN/kYT7VG5ILDPHNeEI/xcJjfx83Is=; b=H
 3fbQeiJon6tzAdGkxSIdLwd+o4deAa2r4SCptYfLaNUMK4Lb/aIJDqaG74/zgpAS
 w5CbJDJhRwqTaPy/h/saK4SuguhYtFYmPb0m7JrgFBPiiIUwiqgPfQjBH90sJiw1
 llGv6nT6V1PM+RRdFrnEJs3SEYk4rgkcEAOYbOhhHzXVPfo3qUz5ESeORbOsBFA/
 AdX652FUqtLPFRZ2uoeCgVlpdc9X57lY8r9AIs0H7/JcnhKnBKduJk8kWktAfL6r
 QtTHQOFu44N1zR4kz68c/WmM+if4dWrotaqo9tmlsZA8hlq4XBOFTDVVcCidvFN/
 AFsb+tXnyubkodUL8aESw==
X-ME-Sender: <xms:ZRN0ZgU4DgmsDJVfcBz33NbADeY5b0GH1_Ef92AqwUPwwZvquhfkJw>
 <xme:ZRN0Zkl09ONf3syOmug8qgwd8u4F2UvsJpvPqaJbBICb3U9LMGLDzKrQjjLEEjHfe
 iw70UUbTDezLDpgFg>
X-ME-Received: <xmr:ZRN0ZkZxOyjdwLSDb0JNzm-72menb86hGUvS0IEFaVMaCiD27yWhRwmgk37h_JBi1-8a9Tm12Z_Ftm2xdjr8rV6Z4mRMYOjN-gQ0HKt8O8EOWv3Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:ZRN0ZvWKf-7ta2nK1rlGBbTH65yfWwf_Qt3KCzKBFpH9yTfrnjzDbg>
 <xmx:ZRN0ZqkMRu_O0z3r_Xb2S958pNqtoS3JVdS0meJG2t6nq22cNX8QBw>
 <xmx:ZRN0ZkfW5YrLMNprafQJSowI3-2T0m-7KAbeEXiqcs28JYDdqhV_HQ>
 <xmx:ZRN0ZsGXcTDs6Xdzmw_mmU5VAtcb4J7pEXiyKiebFdWculUMHp390w>
 <xmx:ZhN0ZsW4IAeNfX6SsVziScl3392IrWjBJKxksF4RCO1G4tt-wEv0HYtl>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:32:48 -0400 (EDT)
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
Subject: [PATCH 08/23] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Thu, 20 Jun 2024 23:29:46 +1200
Message-ID: <20240620113150.83466-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The mixer in the DE3 display engine supports YUV 8 and 10 bit
formats in addition to 8-bit RGB. Add the required register
configuration and format enumeration callback functions to the mixer,
and store the in-use output format (defaulting to RGB) and color
encoding in engine variables.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c  | 55 ++++++++++++++++++++++++++--
 drivers/gpu/drm/sun4i/sunxi_engine.h |  5 +++
 2 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 0738ee6446330..ef8067b2cbc8c 100644
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
@@ -392,7 +435,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	dev_set_drvdata(dev, mixer);
 	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
-
+	/* default output format, supported by all mixers */
+	mixer->engine.format = MEDIA_BUS_FMT_RGB888_1X24;
+	/* default color encoding, ignored with RGB I/O */
+	mixer->engine.encoding = DRM_COLOR_YCBCR_BT601;
+	
 	if (of_property_present(dev->of_node, "iommus")) {
 		/*
 		 * This assume we have the same DMA constraints for
diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index 98a78990fa870..608a26c3f9911 100644
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
@@ -148,6 +150,9 @@ struct sunxi_engine {
 
 	int id;
 
+	u32				format;
+	enum drm_color_encoding		encoding;
+
 	/* Engine list management */
 	struct list_head		list;
 };
-- 
2.45.2


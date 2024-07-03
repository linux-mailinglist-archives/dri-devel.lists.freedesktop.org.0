Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E957925A46
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CA010E7A1;
	Wed,  3 Jul 2024 10:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="vRIKjcFj";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZGEGGczL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11D10E7A1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:56:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id CEF561140381;
 Wed,  3 Jul 2024 06:56:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 03 Jul 2024 06:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004164; x=
 1720090564; bh=cux+34nh+ulo2PN/kYT7VG5ILDPHNeEI/xcJjfx83Is=; b=v
 RIKjcFj6pxPZYCcnS0puy4NFUnVCK+Hxb+N2NZYCb2boX9nlPeDuYIOzENCKyRuT
 A5Fx7CZucAwIob+x7vsagd6bXdz+ZSSJjaX6VSx7U4htyuA19h0Y1M/TUR4KFGW7
 E7wrspa1cOP43pYQGUwOtNaC1EIyPMV+0RI0J6s+O2PdoSCQNEeUpydr0Wja8DqR
 Qw520dUbU5jttk+X9LWj1cdGg36Rz+yvvt4mvC8lkgItFyGRUxWLOox5T4gdCnDF
 feq9QDxJjUDFDsY4ll9YvIWdcIiblzDOtqMK762R6fm41Id3RYKRZKIDSj51P7mR
 yoO69NHaNrQ/QpuQfVkTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004164; x=
 1720090564; bh=cux+34nh+ulo2PN/kYT7VG5ILDPHNeEI/xcJjfx83Is=; b=Z
 GEGGczLATVdbUjMRNtimGh0Ie0fHQg1gjI4QXuSKsmIlk/BUg/F9n8yKBoHfuJ8g
 qaLmqU9lyJY3PTdTGHGGtN2qOm5oGDfnrzruJpE1SAXXy3tlvn8nXF5NzPZodPa+
 xYuAK7RW2i631zCZIyj0Qljx5lGExb+joHKFoGxtjelYz9r4dR6xjdOMOBh1UUNX
 dGyt8RUmMHnUF11dXWfLrKFZo5As+OUW06r1crTvh/mE1rkakt4MICbGTyiKED5d
 mqmT7k5j0pDcZqNP53Lw4l1om7R5Fw5BRFr8TJ3wp94/+jrEElE2J7IkUcf0KLMZ
 y6j3qC7H1q8cORdjH5fLQ==
X-ME-Sender: <xms:RC6FZuUm-MxrUMY-od7BCrYfhk6rpyICY1yBjI-kP3ccR-Urot67Mw>
 <xme:RC6FZqlprPFVQLa88RfYcJxkKpojZQ0v19UuSW26ThlFF-woOtIKUaOilJ6mbf_1P
 _ijjCQH-HYmR8wW-Q>
X-ME-Received: <xmr:RC6FZiYrg7qXpSBhHV6OsASMwuy0EdzSKy4UU1OSldPNQgIXK9x_7_Y2y9EE_v30uTbYPo6aLzP1wjx1pwt8rniEiqVupGXd4DUSP43Mr7tiEXk->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:RC6FZlXviELQ6eSYcc-Pg620RVHn0XVXJg5pD5hh_PRn7QXFv9xdWg>
 <xmx:RC6FZokJ9O9zZFGyNLBHU_svJRfvhk_Vr9ThfzFBV4IyL5G1m3u_Jw>
 <xmx:RC6FZqfBq4Sn2g9XkEtIwFkYNGp0-j_15PAEh-gB0kmVhkOe0W4Z_g>
 <xmx:RC6FZqEPr5dPf-vpd1WWm6edNB0Q49hwESjSw-9pMb92-jSnM3uAtA>
 <xmx:RC6FZqWXC-yYXCQE624XFQhN7vqY1BB71WjUclwg4faCeImZ_ehLcYkz>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:58 -0400 (EDT)
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
Subject: [PATCH v2 08/23] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Wed,  3 Jul 2024 22:50:58 +1200
Message-ID: <20240703105454.41254-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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


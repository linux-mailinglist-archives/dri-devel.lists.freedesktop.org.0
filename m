Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259398940D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 11:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FF410E248;
	Sun, 29 Sep 2024 09:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="38VLnHTA";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="OOPwpX74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142A310E248
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 09:11:34 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 7525013802BE;
 Sun, 29 Sep 2024 05:11:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sun, 29 Sep 2024 05:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1727601093; x=
 1727687493; bh=8EPuPZU1esPvnRrvnyjMVZEuRv4nNZQffcu6cFWSCD4=; b=3
 8VLnHTARHEkw0JZGXK+SQtSAldj8DZ8EofgxCNrqpkBwKaWrZm1ZxbXztvqsuhZP
 rWH+wudEPX4glxYe0nwDyrNjo7vBd7gBsWcxgQj7rU+3FTsUZPNp7vJXoihltIPK
 igDJzTwEfsUgFQyI7Vm13Zd5TMqU82HCa02FZBI9Bgb1S5SYjVUKlHMUTbZiQaj1
 8RR7SWIjSnNjCSiSEuzxl8gT5J+KhqJaGJmJI5bhSomcPo9TB2u6YEZmGJw+790E
 VeAjDr9rJ0I7GY9uUGP6csuaJKBUFX0vM5eK9sTD1UPFQ+HdR54x9ieiX7vkLMza
 doSCLF687oNabWc1DSL8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601093; x=
 1727687493; bh=8EPuPZU1esPvnRrvnyjMVZEuRv4nNZQffcu6cFWSCD4=; b=O
 OPwpX74jwvWYHbywWoFKCi6aWYD/C9NEczG2L2tFZRW68hKN7rASt/k8XARKKMXS
 6hvRsyev6aFMNsULcEjw4BOv3crHDVulqnz43sdeqngIMxisEFIPKh/FaFWObfGW
 sNU6ksmrGUp9SMMZsZEwjigw+GEU0R9kzt+WCPlGlbYij2w7YpAHM2zTZ7yQPYdH
 X8bo/rT9juiaaDc3FcFcHj/UaCFjhg9CL95rKJgBTp5yoiVIVOMu2/bQkyraIpl1
 cFZAIAjfgXLG3UZM9vHzwCWxOUS2LW2upa7ERyyMGYjVuk5v0AaWGN09vwKIVNar
 JmVLr5TRbBAgovFDfIzxw==
X-ME-Sender: <xms:xRn5Zo3oqMtEdMIlUE18iVY-ri0WaWg5z5pFby8fMY99HZwHAOzJBg>
 <xme:xRn5ZjHOy2ch48Mf7tJ0MK2TIah0YqHnn_jxDqu-ds3n6YFxp0ivHEPp4Xm3186m0
 5vdGvNOqJ2chiztrA>
X-ME-Received: <xmr:xRn5Zg4pk9e3RKtfwRIyxV-NyJPFi0I1bHTZ6_OLA48vt3PPN3LqCgfqW0cdkhLAsx9hZr0MSC_fRVX4thTgWIUAk4jxttqlbSw4kUvesVkOtluQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xRn5Zh17VkKrWnRdtXRNsZOPma023GQmFsYMTRoHzABIaaMp0e02fg>
 <xmx:xRn5ZrE9btIJLz3HQMK-e-QhqohiTahpA5Ju0_2VqGWrStDxkOQa4g>
 <xmx:xRn5Zq_mb4I3pT9GjVneJm1zr0bpGuo3sBRnjMmxEDRB4gN59bHWtg>
 <xmx:xRn5ZgkE2PAjC0GAx9Rt71tnq2oXhIK3iZ_0yRC8yWBa5zM6ESs2fA>
 <xmx:xRn5ZjMbQsqcOqge-yPYliH5IYXgBm9BOLaJJCGwMCpr5bLJxIySBc7G>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:11:27 -0400 (EDT)
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
 Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v5 01/26] drm: sun4i: de2/de3: Change CSC argument
Date: Sun, 29 Sep 2024 22:04:33 +1300
Message-ID: <20240929091107.838023-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240929091107.838023-1-ryan@testtoast.com>
References: <20240929091107.838023-1-ryan@testtoast.com>
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

Currently, CSC module takes care only for converting YUV to RGB.
However, DE3 is more suited to work in YUV color space. Change CSC mode
argument to format type to be more neutral. New argument only tells
layer format type and doesn't imply output type.

This commit doesn't make any functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 22 +++++++++++-----------
 drivers/gpu/drm/sun4i/sun8i_csc.h      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 58480d8e4f704..6ebd1c3aa3ab5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -108,7 +108,7 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 };
 
 static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
-				       enum sun8i_csc_mode mode,
+				       enum format_type fmt_type,
 				       enum drm_color_encoding encoding,
 				       enum drm_color_range range)
 {
@@ -118,12 +118,12 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 
 	table = yuv2rgb[range][encoding];
 
-	switch (mode) {
-	case SUN8I_CSC_MODE_YUV2RGB:
+	switch (fmt_type) {
+	case FORMAT_TYPE_YUV:
 		base_reg = SUN8I_CSC_COEFF(base, 0);
 		regmap_bulk_write(map, base_reg, table, 12);
 		break;
-	case SUN8I_CSC_MODE_YVU2RGB:
+	case FORMAT_TYPE_YVU:
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				base_reg = SUN8I_CSC_COEFF(base, i + 1);
@@ -141,7 +141,7 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 }
 
 static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
-					    enum sun8i_csc_mode mode,
+					    enum format_type fmt_type,
 					    enum drm_color_encoding encoding,
 					    enum drm_color_range range)
 {
@@ -151,12 +151,12 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 
 	table = yuv2rgb_de3[range][encoding];
 
-	switch (mode) {
-	case SUN8I_CSC_MODE_YUV2RGB:
+	switch (fmt_type) {
+	case FORMAT_TYPE_YUV:
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
-	case SUN8I_CSC_MODE_YVU2RGB:
+	case FORMAT_TYPE_YVU:
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
@@ -206,7 +206,7 @@ static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
 }
 
 void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
+				     enum format_type fmt_type,
 				     enum drm_color_encoding encoding,
 				     enum drm_color_range range)
 {
@@ -214,14 +214,14 @@ void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
 
 	if (mixer->cfg->is_de3) {
 		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
-						mode, encoding, range);
+						fmt_type, encoding, range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
 	sun8i_csc_set_coefficients(mixer->engine.regs, base,
-				   mode, encoding, range);
+				   fmt_type, encoding, range);
 }
 
 void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 828b86fd0cabb..7322770f39f03 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -22,14 +22,14 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-enum sun8i_csc_mode {
-	SUN8I_CSC_MODE_OFF,
-	SUN8I_CSC_MODE_YUV2RGB,
-	SUN8I_CSC_MODE_YVU2RGB,
+enum format_type {
+	FORMAT_TYPE_RGB,
+	FORMAT_TYPE_YUV,
+	FORMAT_TYPE_YVU,
 };
 
 void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
+				     enum format_type fmt_type,
 				     enum drm_color_encoding encoding,
 				     enum drm_color_range range);
 void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 9c09d9c08496d..8a80934e928fe 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -193,19 +193,19 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	return 0;
 }
 
-static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
+static u32 sun8i_vi_layer_get_format_type(const struct drm_format_info *format)
 {
 	if (!format->is_yuv)
-		return SUN8I_CSC_MODE_OFF;
+		return FORMAT_TYPE_RGB;
 
 	switch (format->format) {
 	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YVU444:
-		return SUN8I_CSC_MODE_YVU2RGB;
+		return FORMAT_TYPE_YVU;
 	default:
-		return SUN8I_CSC_MODE_YUV2RGB;
+		return FORMAT_TYPE_YUV;
 	}
 }
 
@@ -213,7 +213,7 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	u32 val, ch_base, csc_mode, hw_fmt;
+	u32 val, ch_base, fmt_type, hw_fmt;
 	const struct drm_format_info *fmt;
 	int ret;
 
@@ -231,9 +231,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
 
-	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
-	if (csc_mode != SUN8I_CSC_MODE_OFF) {
-		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
+	fmt_type = sun8i_vi_layer_get_format_type(fmt);
+	if (fmt_type != FORMAT_TYPE_RGB) {
+		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
 						state->color_encoding,
 						state->color_range);
 		sun8i_csc_enable_ccsc(mixer, channel, true);
-- 
2.46.1


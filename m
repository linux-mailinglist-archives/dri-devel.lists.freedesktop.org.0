Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B777CA58F6A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8612610E3C4;
	Mon, 10 Mar 2025 09:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="clL3hMp4";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="c+HHzDIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6A710E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:24:15 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id EDCF71382CF1;
 Mon, 10 Mar 2025 05:24:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Mon, 10 Mar 2025 05:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1741598654; x=
 1741685054; bh=OS7FgJF/KGjCDOFkxXdH/YW4FIfSzxBbXW/BszfER4k=; b=c
 lL3hMp4eeB5xuEbkFbwpqa+xHwiP5K6IBlJb+3SShCoA3CyAk+ibJaG5peOPzg1k
 DEOsWkn4zG+7lnwHnyu5PZ/du0HyAB0b/trvjD69MSMIC2tmQAiZGqZ0xFi//+4s
 1rDIjPlH5Iazpk3TKI44goWZ701VU0jEU6HH11o7yGkGPUGdlt1k5rbuNNujNktp
 fdK3XxZVG5e+sKpp0ayMs1dQFsJslQtY+ChqwscaBJcF3NwUE1Fz/6+ZWU137tSW
 KHKGxgkObuqtFuJb/M5++6rGkgoRE2WApJ7zBj/xsPDHko9nbdKAP3BFdICJ2AfI
 hpdcb6wtS9MNskRiL2apw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1741598654; x=1741685054; bh=O
 S7FgJF/KGjCDOFkxXdH/YW4FIfSzxBbXW/BszfER4k=; b=c+HHzDIyzJUvIYxs4
 9xHoL4YLXrMqL3DhkEIRt8Re07zI1X8Bqe9UIsnDDpd+anxWnb5YLjleCFdbtErJ
 wIDV1VcJxfJM2QCwfPtCQ/6Q9/suDNrcKAmMgKhKZ4PCmkAF1Cgm/ZV1QJd/xtWp
 k2LUjqCsuqntljZp99w1ig2WVQnynrEPEPj+sXUA6hZGMVEGOECBbVOI0rWlkyGB
 6bn2qonklbk95VU5Ss/NaynN+z6lrB7ZI5oLgWx8aHKb56CVNuMyEsHh17uZ3L4F
 FZ2GVEmlQP7LCXFjPfZqZAZtAsENPlYUdU6M/PcaAVZuFGU5LivNBBkYMBEFpnnU
 yyDPg==
X-ME-Sender: <xms:vq_OZzLcC2gypNK4P8R5xk_Y4pPjqaM9quOpWuMmupXYgD6d4tF29g>
 <xme:vq_OZ3LJ75ZDd7PbwaPDlwYsbmay_JYdZiEDj7rAPs7Ceort0ec6_RtQ9jTHrtKEi
 nSoY4N4izpm0uh1nQ>
X-ME-Received: <xmr:vq_OZ7uJjTuLtjqfM9UltH88Y22PryCjxQ4wxMCYDudLcI5vsOmm_SYzEQE8hFYZF3VbBTE3sNGRU5bEWTjbVWI5lfwQAhYU-V-k32YJlHCq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
 htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
 keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
 tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
 gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
 tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
 drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
 thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
 esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
 gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vq_OZ8YSSexWoTxW9SAds8QyH7ROUyyiJeV8PSpdIyMA4PPWVlYEgQ>
 <xmx:vq_OZ6amxoD5d97BhOEVLBG7TH_xC1MnEpH29DT9DEgbTNps-xVREA>
 <xmx:vq_OZwC1PGQ-LEwPLZ40inRZVJhKjzZ7-ACOoURDZGRyOQ-qGvLIHA>
 <xmx:vq_OZ4aiFIeRW8BKBqq9ZAWXEk6mbvhFtzGwdmJHZuMN5P4OPZX-Pw>
 <xmx:vq_OZ2LlGmlHiATpUIbY4m_uKOGA_IPX51C-iZDASkjy5ow9jrSZ7iWU>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:08 -0400 (EDT)
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
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v8 01/11] drm: sun4i: de2/de3: add mixer version enum
Date: Mon, 10 Mar 2025 22:09:47 +1300
Message-ID: <20250310092345.31708-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
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

The Allwinner DE2 and DE3 display engine mixers are currently identified
by a simple boolean flag. This will not scale to support additional DE
variants.

Convert the boolean flag to an enum.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

--
Changelog v5..v6:
- Update struct comment regarding change from is_de3 flag to de_type
---
 drivers/gpu/drm/sun4i/sun8i_csc.c       |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 14 ++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  8 ++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 ++--
 6 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 58480d8e4f70..6f4a2e9c6fca 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -212,7 +212,7 @@ void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
 {
 	u32 base;
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
 						mode, encoding, range);
 		return;
@@ -228,7 +228,7 @@ void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
 {
 	u32 base;
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
 		return;
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa30..2252bef19597 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -537,7 +537,7 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	base = sun8i_blender_base(mixer);
 
 	/* Reset registers and disable unused sub-engines */
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type == sun8i_mixer_de3) {
 		for (i = 0; i < DE3_MIXER_UNIT_SIZE; i += 4)
 			regmap_write(mixer->engine.regs, i, 0);
 
@@ -628,6 +628,7 @@ static void sun8i_mixer_remove(struct platform_device *pdev)
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
 	.ui_num		= 3,
@@ -636,6 +637,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
 	.ui_num		= 1,
@@ -644,6 +646,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
@@ -653,6 +656,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
@@ -662,6 +666,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -670,6 +675,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
+	.de_type = sun8i_mixer_de2,
 	.vi_num = 2,
 	.ui_num = 1,
 	.scaler_mask = 0x3,
@@ -680,6 +686,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -689,6 +696,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
@@ -698,6 +706,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
@@ -707,6 +716,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.de_type	= sun8i_mixer_de2,
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
@@ -716,7 +726,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
-	.is_de3		= true,
+	.de_type	= sun8i_mixer_de3,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d7898c9c9cc0..7fe5ce20082a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -162,7 +162,7 @@ enum {
  * @ccsc: select set of CCSC base addresses from the enumeration above.
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
- * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
+ * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  */
 struct sun8i_mixer_cfg {
@@ -214,7 +214,7 @@ engine_to_sun8i_mixer(struct sunxi_engine *engine)
 static inline u32
 sun8i_blender_base(struct sun8i_mixer *mixer)
 {
-	return mixer->cfg->is_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
+	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
 static inline u32
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index ae0806bccac7..504ffa0971a4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -93,7 +93,7 @@ static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	int vi_num = mixer->cfg->vi_num;
 
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * vi_num +
 		       DE3_UI_SCALER_UNIT_SIZE * (channel - vi_num);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 9c09d9c08496..a7a3a75ffd63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -25,7 +25,7 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
 		       SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK;
 		val = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
@@ -483,7 +483,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
@@ -507,7 +507,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 
-	if (mixer->cfg->vi_num == 1 || mixer->cfg->is_de3) {
+	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= sun8i_mixer_de3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
@@ -524,7 +524,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
 			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type >= sun8i_mixer_de3)
 		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
 	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 7ba75011adf9..ad87ab395803 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,7 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->is_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
@@ -956,7 +956,7 @@ void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
 		cvphase = vphase;
 	}
 
-	if (mixer->cfg->is_de3) {
+	if (mixer->cfg->de_type >= sun8i_mixer_de3) {
 		u32 val;
 
 		if (format->hsub == 1 && format->vsub == 1)
-- 
2.48.1


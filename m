Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A04989459
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 11:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D8810E29E;
	Sun, 29 Sep 2024 09:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="UKPk283V";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="o8HeqjYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796DD10E1C1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 09:13:53 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id D9B0B13802B6;
 Sun, 29 Sep 2024 05:13:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sun, 29 Sep 2024 05:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1727601232; x=
 1727687632; bh=stM6cnmzNQV+JvWi2wmG6oMDUlFbNmlfb0DYGgwFxjc=; b=U
 KPk283VG6adw5ejRqJmI2bgxh4v90FLk5+Y6tf31lk9BEApwXoLcSrIqPf8YS2rM
 WzXQROhrOXzJnyciG06K4LWCtz4ZR30aL+52mAXyfvCUQ0f+H057mf7UxKoMHT8n
 8bmdCvX+qrk/ZZH0VejGOHtMMajmW0kvfPKzB688BOwQodhuPyGzg7E7sxMX0zqE
 gWuHIamHws/XWSXGx3HGuqmLRJtdM0tRt+/U/7Km/ujO9rGppzM3fKNOK8GkjWQK
 N99TOCksmc4Vo12PQUHqGEM1mW96JjU+L8xAIhrHWbGa2mkMsri8o/dc1cw5Thhe
 njDIyqL8y96r+VbJ9E9Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727601232; x=
 1727687632; bh=stM6cnmzNQV+JvWi2wmG6oMDUlFbNmlfb0DYGgwFxjc=; b=o
 8HeqjYHMVG0FGGI0ULQ+JdS0rkU7kqCrZfFH4lfhbVikfM7dfozyv8ouunRosO/Q
 4VmIMq/RdgxZjXbbSs6z6O4dmy5hTLqcwwiDZdaDp9kl7TWw9go8xlQvg8xxzLDh
 exM1ub+qhrRRCXmiY24ggnkDgrmgpMUoth/YhnkepLI01tILoEEL0AwR7S6TPUH/
 88CZtG0CCB2/3yQtdtO0mdKx9EnZv/fBreqwAf/HIPLJtV9bD1CQhyXW+lHPGYCY
 9HtaclLGIrtN8Pb35qzkDt9T4ZyuUXbRewIYggIHQ/46xBCl7rS1Nz6bdLKU3Qfp
 ZAgChtf8TtKhxZ2r7z3AA==
X-ME-Sender: <xms:UBr5Zi0Q8r_LtEUrKVhP9adsvb7qp5VphlG-dOsgPWkX-gVYADFnjQ>
 <xme:UBr5ZlFtC2zb1jh7EQYKfbr-uEzHoqua8IpLC2RGlp4gOmHihydGajiyVmh7zQONn
 wc68x-a3TrnHgL8oA>
X-ME-Received: <xmr:UBr5Zq6pIEEHpUlpsnVpPuLv7etF3QwbI4Xhs_-cJiAjKN2RVJXSLAbpjVQE1BgcBNY2SBHccy_KP9imaDbyHb4KyEKogYkBSEAz-oWQNNiDHjla>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UBr5Zj3_pahymVg8snFzruQ5qJ3OHzf5Ao9UeFD6HfISI6O8stLXeQ>
 <xmx:UBr5ZlE_fmCEN9PGwbS2Sk6BCp6UxmC3iDym3x68wCCqzBU9hxPFEw>
 <xmx:UBr5Zs9XNqAlO9RL1_O4WkLcM1EUMd2-0aDzpuE9U_scnS_xtEpcoA>
 <xmx:UBr5ZqnuePElXxO2dSpK5WR1MKd9N9DqIjHZcmeSdzYhZUOjxYOQwg>
 <xmx:UBr5ZlMte4E6k0ZwELoCRw_7fzAc4L2Lm53byn7T9Uzh0-esH9Rn7DsO>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:13:46 -0400 (EDT)
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
Subject: [PATCH v5 23/26] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
Date: Sun, 29 Sep 2024 22:04:55 +1300
Message-ID: <20240929091107.838023-24-ryan@testtoast.com>
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

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

Notable features (from the H616 datasheet and implemented):
- 4096 x 2048 (4K) output support
- AFBC ARM Frame Buffer Compression support
- YUV420 input support

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group, and adds a top register map.

Extend the mixer to support the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

---
Changelog v4..v5:
- Whitespace fixes
- Correct strict mode warnings from checkpatch.pl
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 109 ++++++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  16 +++-
 2 files changed, 108 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 600084286b39d..204fc8055b32a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -321,8 +321,12 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
-		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_DBUFF,
+			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+	else
+		regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
+			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
 }
 
 static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
@@ -371,25 +375,33 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	struct regmap *bld_regs, *disp_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
 	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
 			 mode->hdisplay, mode->vdisplay);
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_SIZE, size);
-	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		disp_regs = mixer->disp_regs;
+		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_SIZE, size);
+	} else {
+		disp_regs = mixer->engine.regs;
+		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
+	}
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -400,10 +412,8 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		val = 0xff108080;
 
-	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
-	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
 
 	if (mixer->cfg->has_formatter)
 		sun50i_fmt_setup(mixer, mode->hdisplay,
@@ -443,12 +453,29 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
+	.name		= "layers",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= 0xffffc, /* guessed */
 };
 
+static const struct regmap_config sun8i_top_regmap_config = {
+	.name		= "top",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x3c,
+};
+
+static const struct regmap_config sun8i_disp_regmap_config = {
+	.name		= "display",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x20000,
+};
+
 static int sun8i_mixer_of_get_id(struct device_node *node)
 {
 	struct device_node *ep, *remote;
@@ -471,33 +498,45 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
+	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
 	int plane_cnt, i;
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		top_regs = mixer->top_regs;
+		disp_regs = mixer->disp_regs;
+	} else {
+		top_regs = mixer->engine.regs;
+		disp_regs = mixer->engine.regs;
+	}
+
 	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
 		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
+
 	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
+		regmap_write(disp_regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -573,6 +612,30 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		return PTR_ERR(mixer->engine.regs);
 	}
 
+	if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		regs = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->top_regs = devm_regmap_init_mmio(dev, regs,
+							&sun8i_top_regmap_config);
+		if (IS_ERR(mixer->top_regs)) {
+			dev_err(dev, "Couldn't create the top regmap\n");
+			return PTR_ERR(mixer->top_regs);
+		}
+
+		regs = devm_platform_ioremap_resource(pdev, 2);
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
+							 &sun8i_disp_regmap_config);
+		if (IS_ERR(mixer->disp_regs)) {
+			dev_err(dev, "Couldn't create the disp regmap\n");
+			return PTR_ERR(mixer->disp_regs);
+		}
+	}
+
 	mixer->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(mixer->reset)) {
 		dev_err(dev, "Couldn't get our reset line\n");
@@ -787,6 +850,18 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de33,
+	.has_formatter	= 1,
+	.mod_rate	= 600000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 4096,
+	.ui_num		= 3,
+	.vi_num		= 1,
+	.map		= {0, 6, 7, 8},
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -832,6 +907,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-mixer-0",
+		.data = &sun50i_h616_mixer0_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 75facc7d1fa66..26b001164647c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -21,6 +21,10 @@
 #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
 #define SUN8I_MIXER_GLOBAL_SIZE			0xc
 
+#define SUN50I_MIXER_GLOBAL_SIZE		0x8
+#define SUN50I_MIXER_GLOBAL_CLK			0xc
+#define SUN50I_MIXER_GLOBAL_DBUFF		0x10
+
 #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
 
 #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
@@ -154,6 +158,7 @@ enum {
 enum sun8i_mixer_type {
 	sun8i_mixer_de2,
 	sun8i_mixer_de3,
+	sun8i_mixer_de33,
 };
 
 /**
@@ -180,6 +185,7 @@ struct sun8i_mixer_cfg {
 	unsigned int	de_type;
 	unsigned int    has_formatter : 1;
 	unsigned int	scanline_yuv;
+	unsigned int	map[6];
 };
 
 struct sun8i_mixer {
@@ -191,6 +197,9 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	struct regmap			*top_regs;
+	struct regmap			*disp_regs;
 };
 
 enum {
@@ -227,13 +236,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 static inline struct regmap *
 sun8i_blender_regmap(struct sun8i_mixer *mixer)
 {
-	return mixer->engine.regs;
+	return mixer->cfg->de_type == sun8i_mixer_de33 ?
+		mixer->disp_regs : mixer->engine.regs;
 }
 
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == sun8i_mixer_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
 		return DE2_CH_BASE + channel * DE2_CH_SIZE;
-- 
2.46.1


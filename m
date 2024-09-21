Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8E97DC7C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 11:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0534610E16B;
	Sat, 21 Sep 2024 09:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="tSWKrry9";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="NJFAcZXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31D810E16B
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 09:52:36 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 510241380302;
 Sat, 21 Sep 2024 05:52:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sat, 21 Sep 2024 05:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1726912356; x=
 1726998756; bh=txXpEzfBA4xFxC8kyohRkVUkxCg0r+HkhJCRkjADZZQ=; b=t
 SWKrry9MiyYL8OEugNHnUgcgJvxIAvAeRyvPOockwtG1xy0WcDiZ4Apj3Wr/Xn2+
 /a4BpZKZWQ5FkFqSjglBr10izUcSwvKjQr/M8jCwCQ2jSO0AoiLQH7eH03lznxUp
 la2yyPBz6HzYQX+mBE0muIAcW/JObtr0zaL6IQvzRc1XzQ+1+Y8tYsDK+MRwgf78
 7ONsgz6m7lvI8po6CuKh7lnTDZwjx04+MRIw1klJ5/MtJDMPYyuIRLKZQIRNInDp
 o00YxQkJGxlNajJDXKPnbyzca4a3nM6hNyx3A5lH3acgWTF90vOuH/txU3etPkuT
 L7IhwJJYEK3eQOCK2LlLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912356; x=
 1726998756; bh=txXpEzfBA4xFxC8kyohRkVUkxCg0r+HkhJCRkjADZZQ=; b=N
 JFAcZXlit+oZybXL0XJOHEbq405uC3+IczZR7GK6FQkB3MTEcutXoYypHh9IHhqu
 9Sf8aaf2ldgkZdRV6C7Pg4mvwHoPDOglvabMlMhAdONZdG92MhaedfHKk10Njdla
 HMBy3p8zm4NzSDNKnkwSKcb9B9NX3U2cX+OAXdPO//qbD30wzZkpFQtc/QXr36u3
 WBQ6l1j1+i97ItnHa/+eAjaStPtFhh987xqukaTnYeV4HFOCT/iPgnygTlSpFU45
 2754c9FbYk5df+vtKHgbwzKNwk8g8+ZnQg51+q1kpLrV9qVxSP0bnCxczyPeKRcM
 oPnuv4CWaHZd9A1lLxq6g==
X-ME-Sender: <xms:Y5fuZtK-7l-dfA93yiWBmarGw2rg_tRR06Ddm6Gx99zR23WMDhAlNA>
 <xme:Y5fuZpIHpqVzhRsfvieXzfev3nWawfkSlKqNXGVLrttfeIT9qc2Bbnw9onYHpuCL5
 x7qAqw4lL4hRYNoLA>
X-ME-Received: <xmr:Y5fuZlu9dkCq7EYH7UcnXdMVadZcNvS3ru2E39YphBtNm_aeYAiKkWgycXAze5AwexQwldKvHJLwJKbtsLCdrm-a1a3hiYr_m2WN5Jesii0MGX6f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Y5fuZubNdd9WSdZHql0W59rAWclU3Hxl5THyzY8Ogm5y7BeDcTLiyA>
 <xmx:Y5fuZkYTcXyP5LOtAUmSoesM20_sgk3ntiBGX9ggykl-yBFFS8k15A>
 <xmx:Y5fuZiC15IzU0WXdieuD3YzC6FrYCKEsnKjRVVdzHQ0GJqOos9VHZA>
 <xmx:Y5fuZiZwOaTOCv9B0_VUDHG-Wqt64mrxIjnyN52_Cg_d5yTbVxOcIw>
 <xmx:ZJfuZhKqleaQP0io3ZKgOkRDLpvtuWgCGHpbcNMBtcP7IlM-XZOjGjbt>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:52:30 -0400 (EDT)
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
Subject: [PATCH v4 02/26] drm: sun4i: de2/de3: Merge CSC functions into one
Date: Sat, 21 Sep 2024 21:45:51 +1200
Message-ID: <20240921095153.213568-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
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

At the moment the colour space conversion is handled by two functions:
one to setup the conversion parameters, and another one to enable the
conversion. Merging both into one gives more flexibility for upcoming
extensions to support whole YUV pipelines, in the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 89 ++++++++++----------------
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  9 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 11 +---
 3 files changed, 40 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 6ebd1c3aa3ab5..0dcbc0866ae82 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -107,23 +107,28 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 	},
 };
 
-static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
-				       enum format_type fmt_type,
-				       enum drm_color_encoding encoding,
-				       enum drm_color_range range)
+static void sun8i_csc_setup(struct regmap *map, u32 base,
+			    enum format_type fmt_type,
+			    enum drm_color_encoding encoding,
+			    enum drm_color_range range)
 {
+	u32 base_reg, val;
 	const u32 *table;
-	u32 base_reg;
 	int i;
 
 	table = yuv2rgb[range][encoding];
 
 	switch (fmt_type) {
+	case FORMAT_TYPE_RGB:
+		val = 0;
+		break;
 	case FORMAT_TYPE_YUV:
+		val = SUN8I_CSC_CTRL_EN;
 		base_reg = SUN8I_CSC_COEFF(base, 0);
 		regmap_bulk_write(map, base_reg, table, 12);
 		break;
 	case FORMAT_TYPE_YVU:
+		val = SUN8I_CSC_CTRL_EN;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				base_reg = SUN8I_CSC_COEFF(base, i + 1);
@@ -135,28 +140,37 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 		}
 		break;
 	default:
+		val = 0;
 		DRM_WARN("Wrong CSC mode specified.\n");
 		return;
 	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
-					    enum format_type fmt_type,
-					    enum drm_color_encoding encoding,
-					    enum drm_color_range range)
+static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+				 enum format_type fmt_type,
+				 enum drm_color_encoding encoding,
+				 enum drm_color_range range)
 {
+	u32 addr, val, mask;
 	const u32 *table;
-	u32 addr;
 	int i;
 
+	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
 
 	switch (fmt_type) {
+	case FORMAT_TYPE_RGB:
+		val = 0;
+		break;
 	case FORMAT_TYPE_YUV:
+		val = mask;
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
 	case FORMAT_TYPE_YVU:
+		val = mask;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
@@ -173,67 +187,30 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 		}
 		break;
 	default:
+		val = 0;
 		DRM_WARN("Wrong CSC mode specified.\n");
 		return;
 	}
-}
-
-static void sun8i_csc_enable(struct regmap *map, u32 base, bool enable)
-{
-	u32 val;
-
-	if (enable)
-		val = SUN8I_CSC_CTRL_EN;
-	else
-		val = 0;
-
-	regmap_update_bits(map, SUN8I_CSC_CTRL(base), SUN8I_CSC_CTRL_EN, val);
-}
-
-static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
-{
-	u32 val, mask;
-
-	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
-
-	if (enable)
-		val = mask;
-	else
-		val = 0;
 
 	regmap_update_bits(map, SUN50I_MIXER_BLEND_CSC_CTL(DE3_BLD_BASE),
 			   mask, val);
 }
 
-void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum format_type fmt_type,
-				     enum drm_color_encoding encoding,
-				     enum drm_color_range range)
-{
-	u32 base;
-
-	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
-						fmt_type, encoding, range);
-		return;
-	}
-
-	base = ccsc_base[mixer->cfg->ccsc][layer];
-
-	sun8i_csc_set_coefficients(mixer->engine.regs, base,
-				   fmt_type, encoding, range);
-}
-
-void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
+			enum format_type fmt_type,
+			enum drm_color_encoding encoding,
+			enum drm_color_range range)
 {
 	u32 base;
 
 	if (mixer->cfg->is_de3) {
-		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
+		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+				     fmt_type, encoding, range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
-	sun8i_csc_enable(mixer->engine.regs, base, enable);
+	sun8i_csc_setup(mixer->engine.regs, base,
+			fmt_type, encoding, range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 7322770f39f03..b7546e06e315c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -28,10 +28,9 @@ enum format_type {
 	FORMAT_TYPE_YVU,
 };
 
-void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum format_type fmt_type,
-				     enum drm_color_encoding encoding,
-				     enum drm_color_range range);
-void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
+void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
+			enum format_type fmt_type,
+			enum drm_color_encoding encoding,
+			enum drm_color_range range);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 8a80934e928fe..f3a5329351caa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -232,14 +232,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
 
 	fmt_type = sun8i_vi_layer_get_format_type(fmt);
-	if (fmt_type != FORMAT_TYPE_RGB) {
-		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
-						state->color_encoding,
-						state->color_range);
-		sun8i_csc_enable_ccsc(mixer, channel, true);
-	} else {
-		sun8i_csc_enable_ccsc(mixer, channel, false);
-	}
+	sun8i_csc_set_ccsc(mixer, channel, fmt_type,
+			   state->color_encoding,
+			   state->color_range);
 
 	if (!fmt->is_yuv)
 		val = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
-- 
2.46.1


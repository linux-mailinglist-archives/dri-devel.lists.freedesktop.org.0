Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDD290017A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 13:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CE910EBDA;
	Fri,  7 Jun 2024 11:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Ou5oTqkO";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="kaBG1h5x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wfhigh3-smtp.messagingengine.com
 (wfhigh3-smtp.messagingengine.com [64.147.123.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2933410EBDA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 11:03:25 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.west.internal (Postfix) with ESMTP id 1113C180012B;
 Fri,  7 Jun 2024 07:03:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 07 Jun 2024 07:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1717758202; x=
 1717844602; bh=XaQ6cuWms6R8TH2vG68+KYXLzo+BS017qbjak5d9aoY=; b=O
 u5oTqkOuUcrJEv6SqnBZB88Umq/ikzqu4H8fzxGaxilde5mHXIf0oP3m8h8lj3+b
 ki+wVOyYH6oxtIicg9B86YZW1evCuZLAHfF48rnDfn5fcCxchKJfmUo9PgHyaEb9
 VScMC+6DZf8EdBZoc1s1DQvT1CqgTuFou7rQlaoCA82koxrmj2MlTK/59ur3ri9J
 Iaq3EjDChzWv7yFL6PiiKkYPgYJSEvUTL8J3EVK5WQAc1/KD7clFyY8vkeDbmoJu
 nQgHw2aM+2EKYqNFzrn02O5VJm81Re/qsaTyfD+B83Nj7wc+K1JgMDCpySDUQfEu
 bTySwce3Z5OXMpn/a20NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717758202; x=
 1717844602; bh=XaQ6cuWms6R8TH2vG68+KYXLzo+BS017qbjak5d9aoY=; b=k
 aBG1h5xNPp8sHDT3osiZ8YbvAx3ud0jMFBI3IgCDQ924t+DY2Of0ouiHsIdRTAVC
 nRfgczJ1xj1X9th4NUI3f6F+pwEy2gB1UopkZbzyMeMcTNMX+JfDxpvhZMkeyM34
 eShI0X2PLOm4+NgXTMEu6QCT39AqdmlCyPi/+VfZy/R7Ixaj7QX0YRH+DNT9frNq
 Se5JAJPtc8gfdhB4BL29scZ7L9D6vnOzau2gWKgb7cfGV8KupnJRB4OMRgRjEP1s
 HZJRT3p9P3V+R/yz43W7mOoSxno+YsiKkkOYm8yHDbdSM+W1g04um8XkjfBqLC0k
 Nu39cczqTZUIhYTT/ZYiA==
X-ME-Sender: <xms:-ehiZqakhSIWIojZA0pb-JEQ_ZNBvow1brUkaLtEGMMZ1YcEBP-Y1Q>
 <xme:-ehiZtZa0slPWH88oC8XmpSnHcNlOxpfB7K8JwNLSi_FiE9jWtys0XzJtElG04qmL
 gEm-BwN4IjtL9X43w>
X-ME-Received: <xmr:-ehiZk9J1TSV-CKx0GUzHtAEYiW_sZ_B0UkNGctZOp_KMf0MaOgeoI8xglPVzcvPukEd0lsDL39oFCqhyhGpme87mA6yY-jGlvSQg07oYaGfo7i7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
 ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
 ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:-ehiZsqcZHqLXWnlwyn99P4G2dk3EeMefUe0HcLyiz9R7B95_eRLdA>
 <xmx:-ehiZloCMHT_XLlwVT62jWHmqL2z-tX07JcVYe0_JtLr4xiT0c_q9w>
 <xmx:-ehiZqR4bFIhj7jX46UuCwlDWuz3qaiXP6-39U5fpcv4oJzJ4EHRmg>
 <xmx:-ehiZlpHYG7eTaHZXK6M9bpDDpyAH7e8auwztW9h0i0IGuEMv06LcQ>
 <xmx:-uhiZs5t-xpV4fdkNW0buTxhkIKpNPbouDdqaCkQHp1aXoQEWYIpgOFp>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:03:15 -0400 (EDT)
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
 linux-clk@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH RFC 3/8] drm/sun4i: de2/de3: Merge CSC functions into one
Date: Fri,  7 Jun 2024 22:59:59 +1200
Message-ID: <20240607110227.49848-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607110227.49848-1-ryan@testtoast.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

Merging both function into one lets this one decide on it's own if CSC
should be enabled or not. Currently heuristics for that is pretty simple
- enable it for YUV formats and disable for RGB. However, DE3 can have
whole pipeline in RGB or YUV format. YUV pipeline will be supported in
later commits.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
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
index 76e2d3ec0a78c..6ee3790a2a812 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -281,14 +281,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
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
2.45.2


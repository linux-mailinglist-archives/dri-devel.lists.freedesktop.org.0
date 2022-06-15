Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78B54C0EA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 06:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F34A10FDC5;
	Wed, 15 Jun 2022 04:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D534110FF00
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 04:56:01 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 42ABF3200929;
 Wed, 15 Jun 2022 00:56:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 15 Jun 2022 00:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1655268959; x=1655355359; bh=4f
 hmPRCR/z2ZYZI3PkonKC6pcED+Dt3lsyKP/K9frn0=; b=OcUu0q9/i56Icdnjne
 Pc4fAcTFf/LmRVujJwq8utAKX15IL1CLcpCtAcvbMf0ye87eF+LhCtGQBnkIrqGJ
 Tmm0zopRyr8aRYlCLLcWv7m7q8g7kKyqTnBiGBIib+zqUXwHDJwXxF8U+tLSyPHC
 iGiZieMPbBP7a0Ol0ypp6wpX6dMTu5/8NPHc9+QV18s4i4nXNQSViiP5fOuyXjfc
 yMaCQCkb7RovIu0vJoeIENh96XC9pIi0OkP+r9zvFY5qyRiTj6or04tdr0f9trm9
 UkLFChb+hy1VidppOD2Z2A3i4ckSuQy51Wf2IUgxOqkSaZFE+ctRgRXckDTExW0g
 BG6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655268959; x=1655355359; bh=4fhmPRCR/z2ZY
 ZI3PkonKC6pcED+Dt3lsyKP/K9frn0=; b=At+ARN8Y90WnPyRbz/ER4oRzGXM4H
 ZXv4EhYH4BYWyFmd1RokVg49QkXrINXFmEI+BKS2JmKVYBMLbD3PiYYRwCOcj8LC
 rEtzdx7p4mf2YmFyj7B8tsyArPJfpq5CrshQuQsOd3H9u4WqN6VKWuAeHwpZKg7g
 ZXqYhc0aicab5bxwk28tlz4YoTOpAwydX5lPXRlyTjdfJKKRZ2M6ReaFYWQZlm3V
 c9hMsb002uxzWz5LScR8Vb0J9qEWdq3MDx2cb+GVvRVeMU4wKpv53j+afsIwPfSs
 PCCnYup9p2F0BDXvojJw6VYb6YnaBrPwMN3m17TTirc/S3PfIfcQzPJbg==
X-ME-Sender: <xms:X2apYkhQYe-t2RcehFoU-qyF7c4Bi0N_XvYqP19L9fBSvAmqMotqLg>
 <xme:X2apYtD65RRLjmJ4YTLAwt6HQNfXCOEQNp-1ppMFZj0W4B5o_jmzwUP53WjsLy6Qi
 w2aPBiaI5sxr475yQ>
X-ME-Received: <xmr:X2apYsECYxTfLOQrx0ImC-zP-WMaLuvr6ew6JBZw4Xa6VyVASz8kRJPxGHGSqOeVsXVZu1uapCKVcmJPA0jQYwWFOehYscc530ar8PlkZj4q6fmxQCgUxHDzNbNwWdMFDGLgxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvtddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:X2apYlT-cM9mlkZLpxQAswLZNhB9dcmM14Hs25xUNYdFXwSz2Boxjw>
 <xmx:X2apYhyGT2HhFKkQChR2dh5H11BMSVN47DtmIJefWAhwl6k-H9OoqQ>
 <xmx:X2apYj7eD0wApMjbP2b_zRSy8xNF4qSOTYCq2Nbj70u6j7RUNIIHTg>
 <xmx:X2apYhdc0mjKdFrIYNkJAWCabWpJcAqNVAw2Q3xtDOqpfsQlBpp1TA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 00:55:59 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 5/6] drm/sun4i: sun8i-hdmi-phy: Separate A83T and H3 PHY ops
Date: Tue, 14 Jun 2022 23:55:42 -0500
Message-Id: <20220615045543.62813-6-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615045543.62813-1-samuel@sholland.org>
References: <20220615045543.62813-1-samuel@sholland.org>
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the driver already needs to support multiple sets of ops, we can
drop the mid-layer used by the A83T and H3 PHYs. They share only a small
amount of code; factor this out as sun8i_hdmi_phy_set_polarity.

For clarity, this commit keeps the existing function order.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  5 --
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 89 +++++++++++++-------------
 2 files changed, 46 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index f0b1aaad27d9..f082b8ecfe2c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -156,11 +156,6 @@ struct sun8i_hdmi_phy_variant {
 	const struct dw_hdmi_phy_config *phy_cfg;
 	const struct dw_hdmi_phy_ops *phy_ops;
 	void (*phy_init)(struct sun8i_hdmi_phy *phy);
-	void (*phy_disable)(struct dw_hdmi *hdmi,
-			    struct sun8i_hdmi_phy *phy);
-	int  (*phy_config)(struct dw_hdmi *hdmi,
-			   struct sun8i_hdmi_phy *phy,
-			   unsigned int clk_rate);
 };
 
 struct sun8i_hdmi_phy {
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index e6d25bbe3d2f..f94c1ddddbad 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -123,10 +123,18 @@ static const struct dw_hdmi_phy_config sun50i_h6_phy_config[] = {
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
 
-static int sun8i_hdmi_phy_config_a83t(struct dw_hdmi *hdmi,
-				      struct sun8i_hdmi_phy *phy,
-				      unsigned int clk_rate)
+static void sun8i_hdmi_phy_set_polarity(struct sun8i_hdmi_phy *phy,
+					const struct drm_display_mode *mode);
+
+static int sun8i_a83t_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
+				      const struct drm_display_info *display,
+				      const struct drm_display_mode *mode)
 {
+	unsigned int clk_rate = mode->crtc_clock * 1000;
+	struct sun8i_hdmi_phy *phy = data;
+
+	sun8i_hdmi_phy_set_polarity(phy, mode);
+
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_REXT_CTRL_REG,
 			   SUN8I_HDMI_PHY_REXT_CTRL_REXT_EN,
 			   SUN8I_HDMI_PHY_REXT_CTRL_REXT_EN);
@@ -185,10 +193,12 @@ static int sun8i_hdmi_phy_config_a83t(struct dw_hdmi *hdmi,
 	return 0;
 }
 
-static int sun8i_hdmi_phy_config_h3(struct dw_hdmi *hdmi,
-				    struct sun8i_hdmi_phy *phy,
-				    unsigned int clk_rate)
+static int sun8i_h3_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
+				    const struct drm_display_info *display,
+				    const struct drm_display_mode *mode)
 {
+	unsigned int clk_rate = mode->crtc_clock * 1000;
+	struct sun8i_hdmi_phy *phy = data;
 	u32 pll_cfg1_init;
 	u32 pll_cfg2_init;
 	u32 ana_cfg1_end;
@@ -197,6 +207,11 @@ static int sun8i_hdmi_phy_config_h3(struct dw_hdmi *hdmi,
 	u32 b_offset = 0;
 	u32 val;
 
+	if (phy->variant->has_phy_clk)
+		clk_set_rate(phy->clk_phy, clk_rate);
+
+	sun8i_hdmi_phy_set_polarity(phy, mode);
+
 	/* bandwidth / frequency independent settings */
 
 	pll_cfg1_init = SUN8I_HDMI_PHY_PLL_CFG1_LDO2_EN |
@@ -333,11 +348,9 @@ static int sun8i_hdmi_phy_config_h3(struct dw_hdmi *hdmi,
 	return 0;
 }
 
-static int sun8i_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
-				 const struct drm_display_info *display,
-				 const struct drm_display_mode *mode)
+static void sun8i_hdmi_phy_set_polarity(struct sun8i_hdmi_phy *phy,
+					const struct drm_display_mode *mode)
 {
-	struct sun8i_hdmi_phy *phy = (struct sun8i_hdmi_phy *)data;
 	u32 val = 0;
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -348,16 +361,12 @@ static int sun8i_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
 
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
 			   SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK, val);
-
-	if (phy->variant->has_phy_clk)
-		clk_set_rate(phy->clk_phy, mode->crtc_clock * 1000);
-
-	return phy->variant->phy_config(hdmi, phy, mode->crtc_clock * 1000);
 };
 
-static void sun8i_hdmi_phy_disable_a83t(struct dw_hdmi *hdmi,
-					struct sun8i_hdmi_phy *phy)
+static void sun8i_a83t_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
 {
+	struct sun8i_hdmi_phy *phy = data;
+
 	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
 	dw_hdmi_phy_gen2_pddq(hdmi, 1);
 
@@ -365,9 +374,10 @@ static void sun8i_hdmi_phy_disable_a83t(struct dw_hdmi *hdmi,
 			   SUN8I_HDMI_PHY_REXT_CTRL_REXT_EN, 0);
 }
 
-static void sun8i_hdmi_phy_disable_h3(struct dw_hdmi *hdmi,
-				      struct sun8i_hdmi_phy *phy)
+static void sun8i_h3_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
 {
+	struct sun8i_hdmi_phy *phy = data;
+
 	regmap_write(phy->regs, SUN8I_HDMI_PHY_ANA_CFG1_REG,
 		     SUN8I_HDMI_PHY_ANA_CFG1_LDOEN |
 		     SUN8I_HDMI_PHY_ANA_CFG1_ENVBS |
@@ -375,19 +385,20 @@ static void sun8i_hdmi_phy_disable_h3(struct dw_hdmi *hdmi,
 	regmap_write(phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG, 0);
 }
 
-static void sun8i_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
-{
-	struct sun8i_hdmi_phy *phy = (struct sun8i_hdmi_phy *)data;
-
-	phy->variant->phy_disable(hdmi, phy);
-}
+static const struct dw_hdmi_phy_ops sun8i_a83t_hdmi_phy_ops = {
+	.init		= sun8i_a83t_hdmi_phy_config,
+	.disable	= sun8i_a83t_hdmi_phy_disable,
+	.read_hpd	= dw_hdmi_phy_read_hpd,
+	.update_hpd	= dw_hdmi_phy_update_hpd,
+	.setup_hpd	= dw_hdmi_phy_setup_hpd,
+};
 
-static const struct dw_hdmi_phy_ops sun8i_hdmi_phy_ops = {
-	.init = &sun8i_hdmi_phy_config,
-	.disable = &sun8i_hdmi_phy_disable,
-	.read_hpd = &dw_hdmi_phy_read_hpd,
-	.update_hpd = &dw_hdmi_phy_update_hpd,
-	.setup_hpd = &dw_hdmi_phy_setup_hpd,
+static const struct dw_hdmi_phy_ops sun8i_h3_hdmi_phy_ops = {
+	.init		= sun8i_h3_hdmi_phy_config,
+	.disable	= sun8i_h3_hdmi_phy_disable,
+	.read_hpd	= dw_hdmi_phy_read_hpd,
+	.update_hpd	= dw_hdmi_phy_update_hpd,
+	.setup_hpd	= dw_hdmi_phy_setup_hpd,
 };
 
 static void sun8i_hdmi_phy_unlock(struct sun8i_hdmi_phy *phy)
@@ -587,35 +598,27 @@ static const struct regmap_config sun8i_hdmi_phy_regmap_config = {
 };
 
 static const struct sun8i_hdmi_phy_variant sun8i_a83t_hdmi_phy = {
-	.phy_ops = &sun8i_hdmi_phy_ops,
+	.phy_ops = &sun8i_a83t_hdmi_phy_ops,
 	.phy_init = &sun8i_hdmi_phy_init_a83t,
-	.phy_disable = &sun8i_hdmi_phy_disable_a83t,
-	.phy_config = &sun8i_hdmi_phy_config_a83t,
 };
 
 static const struct sun8i_hdmi_phy_variant sun8i_h3_hdmi_phy = {
 	.has_phy_clk = true,
-	.phy_ops = &sun8i_hdmi_phy_ops,
+	.phy_ops = &sun8i_h3_hdmi_phy_ops,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
-	.phy_disable = &sun8i_hdmi_phy_disable_h3,
-	.phy_config = &sun8i_hdmi_phy_config_h3,
 };
 
 static const struct sun8i_hdmi_phy_variant sun8i_r40_hdmi_phy = {
 	.has_phy_clk = true,
 	.has_second_pll = true,
-	.phy_ops = &sun8i_hdmi_phy_ops,
+	.phy_ops = &sun8i_h3_hdmi_phy_ops,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
-	.phy_disable = &sun8i_hdmi_phy_disable_h3,
-	.phy_config = &sun8i_hdmi_phy_config_h3,
 };
 
 static const struct sun8i_hdmi_phy_variant sun50i_a64_hdmi_phy = {
 	.has_phy_clk = true,
-	.phy_ops = &sun8i_hdmi_phy_ops,
+	.phy_ops = &sun8i_h3_hdmi_phy_ops,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
-	.phy_disable = &sun8i_hdmi_phy_disable_h3,
-	.phy_config = &sun8i_hdmi_phy_config_h3,
 };
 
 static const struct sun8i_hdmi_phy_variant sun50i_h6_hdmi_phy = {
-- 
2.35.1


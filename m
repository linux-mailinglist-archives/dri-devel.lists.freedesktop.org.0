Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EFB4FCE0D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E000F10EE27;
	Tue, 12 Apr 2022 04:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2965410EE0C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:35:33 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D4ADD3201DB9;
 Tue, 12 Apr 2022 00:35:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 12 Apr 2022 00:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649738131; x=1649824531; bh=j2
 yW0eTYN39FoRNg3xRIIdalcdn+niCGjVHB1KPQkdI=; b=Z3K48eDbEhvHKX44+l
 Nj5wW+1tWiDJLGMbIf9etwqJAK6VruqMnLwRXi3a1+KJnZeX/tVB86Gxtaz4grod
 ZLoZkAd8n2agfwuN3EwqjPNZu4jTobrRRTMclEvpI7bdJJyJIO/pcZqZFIZVASmJ
 GW2PFvODvK/m4QS/le+eKrqtzZy7fZeJMU9Rm8XD3QahHCYbOwLy+U50QG8GLWlO
 +XpoMvtTibn2SUMr6tU5NocdTldsRM7hIY7QT3KxplVr1pmYiRAHgf7QE9lWIK23
 dJf6f5WwhPgkNBhvWklh3wwcKMdpAMS2AGa1RKmemjYa4r8HhOv/52H2yjVdTbOV
 KyPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649738131; x=1649824531; bh=j2yW0eTYN39FoRNg3xRIIdalcdn+niCGjVH
 B1KPQkdI=; b=hmbWur0HkklfHy7n4+zIKMf954bdryark5G9WcOn+bfws5oBVIB
 k1yHHGoKn4AZuLKYuu67a6KqhVDr6rl4riF01QJ9z3+cG3/mfUcpoa6iR60DvSUR
 5Z+6IQ/pz7W/uZ0GRY23ZOqDdi7WnPKotyAsoc1A3ALwSKjg4K+UxrkAWKXPTKY5
 QtQuaYL43ihBNl51VNM9xaZpPzK7E3vQ7djWGMUYFglWzrDYgQCdosNh2Ueu14hi
 o8OxZd0nt3roXongHX4iw81jn/+rEfwm/U6icya/xW66pWLbxBqlrM3E++zB7+Je
 gRAHkEANi69WOtaW60nrH5h1DXiso4oV41g==
X-ME-Sender: <xms:kwFVYmea1_dG5v8dwLUWr_RtQxLHU8ImgnE28UyvEPt5m52NICN9eQ>
 <xme:kwFVYgNkbyyABc5qJuENTpyx3Pjz-IxFdYMZyotKjWHlElFgJCplzp6UYWj2-PDbw
 B0C1EwLl4I8Dhsb5w>
X-ME-Received: <xmr:kwFVYnifbMP4pV_OqgSAY-QKdKJVtC42b-ZLOgxNxlvsoNfOGrtfyYub3DaplNoiuqEuOz9WC3riXibuIqiiG2kNyp5F6xgvPIIVO2EARECC5qORxMbO6wmuGRplWnHWQXTrww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:kwFVYj8iCSS1DTUt1ftpmnps0v71IqckcAAzzbLPKtlMKRnRapD7Rg>
 <xmx:kwFVYivz__xnPVQnhJiUjTEE8bIkoy_f3jhkITHG_6WfqGGtPMK58g>
 <xmx:kwFVYqHH_aOjS6Hr5CYoKf5eqCiUOrqk337VOXaO8I_qUp38UAEINQ>
 <xmx:kwFVYsJQN3ot4tiWJQcWkRBUgoH9ijtFTDzS1f_bDEfblbPMo7u5dg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:35:30 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 6/6] drm/sun4i: sun8i-hdmi-phy: Group PHY ops functions by
 generation
Date: Mon, 11 Apr 2022 23:35:11 -0500
Message-Id: <20220412043512.49364-7-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412043512.49364-1-samuel@sholland.org>
References: <20220412043512.49364-1-samuel@sholland.org>
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

Now that the PHY ops are separated, sort them topologically, with the
common sun8i_hdmi_phy_set_polarity helper at the top. No function
contents are changed in this commit.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 67 ++++++++++++--------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 5be5c360ca7d..cc239106ba49 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -124,7 +124,19 @@ static const struct dw_hdmi_phy_config sun50i_h6_phy_config[] = {
 };
 
 static void sun8i_hdmi_phy_set_polarity(struct sun8i_hdmi_phy *phy,
-					const struct drm_display_mode *mode);
+					const struct drm_display_mode *mode)
+{
+	u32 val = 0;
+
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		val |= SUN8I_HDMI_PHY_DBG_CTRL_POL_NHSYNC;
+
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		val |= SUN8I_HDMI_PHY_DBG_CTRL_POL_NVSYNC;
+
+	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
+			   SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK, val);
+};
 
 static int sun8i_a83t_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
 				      const struct drm_display_info *display,
@@ -193,6 +205,25 @@ static int sun8i_a83t_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
 	return 0;
 }
 
+static void sun8i_a83t_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
+{
+	struct sun8i_hdmi_phy *phy = data;
+
+	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
+	dw_hdmi_phy_gen2_pddq(hdmi, 1);
+
+	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_REXT_CTRL_REG,
+			   SUN8I_HDMI_PHY_REXT_CTRL_REXT_EN, 0);
+}
+
+static const struct dw_hdmi_phy_ops sun8i_a83t_hdmi_phy_ops = {
+	.init		= sun8i_a83t_hdmi_phy_config,
+	.disable	= sun8i_a83t_hdmi_phy_disable,
+	.read_hpd	= dw_hdmi_phy_read_hpd,
+	.update_hpd	= dw_hdmi_phy_update_hpd,
+	.setup_hpd	= dw_hdmi_phy_setup_hpd,
+};
+
 static int sun8i_h3_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
 				    const struct drm_display_info *display,
 				    const struct drm_display_mode *mode)
@@ -348,32 +379,6 @@ static int sun8i_h3_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
 	return 0;
 }
 
-static void sun8i_hdmi_phy_set_polarity(struct sun8i_hdmi_phy *phy,
-					const struct drm_display_mode *mode)
-{
-	u32 val = 0;
-
-	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
-		val |= SUN8I_HDMI_PHY_DBG_CTRL_POL_NHSYNC;
-
-	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
-		val |= SUN8I_HDMI_PHY_DBG_CTRL_POL_NVSYNC;
-
-	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
-			   SUN8I_HDMI_PHY_DBG_CTRL_POL_MASK, val);
-};
-
-static void sun8i_a83t_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
-{
-	struct sun8i_hdmi_phy *phy = data;
-
-	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
-	dw_hdmi_phy_gen2_pddq(hdmi, 1);
-
-	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_REXT_CTRL_REG,
-			   SUN8I_HDMI_PHY_REXT_CTRL_REXT_EN, 0);
-}
-
 static void sun8i_h3_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
 {
 	struct sun8i_hdmi_phy *phy = data;
@@ -385,14 +390,6 @@ static void sun8i_h3_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
 	regmap_write(phy->regs, SUN8I_HDMI_PHY_PLL_CFG1_REG, 0);
 }
 
-static const struct dw_hdmi_phy_ops sun8i_a83t_hdmi_phy_ops = {
-	.init		= sun8i_a83t_hdmi_phy_config,
-	.disable	= sun8i_a83t_hdmi_phy_disable,
-	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
-	.setup_hpd	= dw_hdmi_phy_setup_hpd,
-};
-
 static const struct dw_hdmi_phy_ops sun8i_h3_hdmi_phy_ops = {
 	.init		= sun8i_h3_hdmi_phy_config,
 	.disable	= sun8i_h3_hdmi_phy_disable,
-- 
2.35.1


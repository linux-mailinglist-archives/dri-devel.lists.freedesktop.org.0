Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C335E4FCE0B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6076A10EE22;
	Tue, 12 Apr 2022 04:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9C010EE27
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:35:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 34E1E320187F;
 Tue, 12 Apr 2022 00:35:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 12 Apr 2022 00:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649738125; x=1649824525; bh=po
 1u18MMNswH4cvKo16gtsd+jdi6t7nk240OGXF6/mc=; b=VTO/cBA0IyWJoApth6
 DjTKgtmbAgh9LJ6C/bVvZ3Rj0gnFVEiZHKDt1R5I8qd2Gz+7KM580jeAL/d1zeYw
 BX0JztCYOOs6CvgDj2AYXcrO7DrEgHm8SQukDoy1LOcWxSUoD7uSboEMLUAAVebj
 jcCnAd6jrEHVV76QbJrvOjpvqmr6VE3OZW2q/mubPPP5Kazdfykj7DeTFR7w3cRi
 FJYptEUG2bSspvbzUJluII1mrGV9PuIG8EVFgv0rbkrgsiWoKtgGFRss0mikYxB6
 Mvv2gOCNNogLD2M6vq63VJsfFdIRRXmaCYrjVVWSl6ipTWeOHwFSsQgSq3PmemfE
 TsFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649738125; x=1649824525; bh=po1u18MMNswH4cvKo16gtsd+jdi6t7nk240
 OGXF6/mc=; b=Ce3k0/N+s9Stu6mPKa+3tEDbO9TW1KX286BYWz7ur3G3f/21oqr
 0IVGXy5v6acIQzgD6ghdh3wk5+byRDhmv8rMk31j08xUT237M311IF9ZDTU9hmvz
 6mfgNCG/u0bH7lFLE/YU2M604ZFB/jRA55RxDVM6wB2pRPUCfmVU7YpsToIwtjOW
 GW1eC7vop7Ay4E2hOnWMYskqugWJPs9ME6cqaCvBct6vhDqbgAHmfsI32NQ31ICE
 TI9EISmsffMgB8yhkdwX/kA1EGqp2BWZbev73srfsSiKfNJZyVh3rsbEw1hMW7N1
 6/41TaVT9OkVU2/InBo/OCCVab1dj/pkurg==
X-ME-Sender: <xms:jQFVYuq_Ixpl0S-OcxEs_vaG7Tam7f-4oJvr4lz697HGd0Mvk9YqEA>
 <xme:jQFVYsoOU1_mFeyhz2EFzXM9HJBEPb8iLK1NLqcnM4yDylqro6mAafKyz8YUE6UlF
 9r2GI3vWeHRoV1zyg>
X-ME-Received: <xmr:jQFVYjMgP_skeMPVurX1GQ3_DJcht6QUxRFmuCwTn9SVD0cIXUtN968-5AnnRhc7rSx5-aEDDzPec_XwX_qYWezXXcnO2YFtvK3j2xPhbrNvnR11qP58Ykl5PZJ-htHqciD46A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:jQFVYt7ztd77EaYOZGeLm8DuijWiT4CMa9sUM8g3xRNxqoyPf7ksWA>
 <xmx:jQFVYt4Nft1vlYZdkOVQkyOsc9t6OqBvHCvGQgkrtY2FtfuDxAFzaA>
 <xmx:jQFVYtj3r1z9En4gyrB4o-0b_nEDj2DsckQisfz6_6mX9QsNJZDY1w>
 <xmx:jQFVYiHIx9WUPKCqNZ194QRpVBfd9wqcPXcAnEDl0AUsuDqODSSeBw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:35:25 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 4/6] drm/sun4i: sun8i-hdmi-phy: Support multiple custom PHY ops
Date: Mon, 11 Apr 2022 23:35:09 -0500
Message-Id: <20220412043512.49364-5-samuel@sholland.org>
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

The D1 SoC comes with a new custom HDMI PHY, which does not share any
registers with the existing custom PHY. So it needs a new set of ops.
Instead of providing a flag in the variant structure, provide the ops
themselves.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 0adbfac6eb31..f0b1aaad27d9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -151,10 +151,10 @@ struct sun8i_hdmi_phy;
 struct sun8i_hdmi_phy_variant {
 	bool has_phy_clk;
 	bool has_second_pll;
-	unsigned int is_custom_phy : 1;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_phy_config *phy_cfg;
+	const struct dw_hdmi_phy_ops *phy_ops;
 	void (*phy_init)(struct sun8i_hdmi_phy *phy);
 	void (*phy_disable)(struct dw_hdmi *hdmi,
 			    struct sun8i_hdmi_phy *phy);
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 1351e633d485..71062e4e8666 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -567,8 +567,8 @@ void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
 {
 	const struct sun8i_hdmi_phy_variant *variant = phy->variant;
 
-	if (variant->is_custom_phy) {
-		plat_data->phy_ops = &sun8i_hdmi_phy_ops;
+	if (variant->phy_ops) {
+		plat_data->phy_ops = variant->phy_ops;
 		plat_data->phy_name = "sun8i_dw_hdmi_phy";
 		plat_data->phy_data = phy;
 	} else {
@@ -587,7 +587,7 @@ static const struct regmap_config sun8i_hdmi_phy_regmap_config = {
 };
 
 static const struct sun8i_hdmi_phy_variant sun8i_a83t_hdmi_phy = {
-	.is_custom_phy = true,
+	.phy_ops = &sun8i_hdmi_phy_ops,
 	.phy_init = &sun8i_hdmi_phy_init_a83t,
 	.phy_disable = &sun8i_hdmi_phy_disable_a83t,
 	.phy_config = &sun8i_hdmi_phy_config_a83t,
@@ -595,7 +595,7 @@ static const struct sun8i_hdmi_phy_variant sun8i_a83t_hdmi_phy = {
 
 static const struct sun8i_hdmi_phy_variant sun8i_h3_hdmi_phy = {
 	.has_phy_clk = true,
-	.is_custom_phy = true,
+	.phy_ops = &sun8i_hdmi_phy_ops,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
 	.phy_disable = &sun8i_hdmi_phy_disable_h3,
 	.phy_config = &sun8i_hdmi_phy_config_h3,
@@ -604,7 +604,7 @@ static const struct sun8i_hdmi_phy_variant sun8i_h3_hdmi_phy = {
 static const struct sun8i_hdmi_phy_variant sun8i_r40_hdmi_phy = {
 	.has_phy_clk = true,
 	.has_second_pll = true,
-	.is_custom_phy = true,
+	.phy_ops = &sun8i_hdmi_phy_ops,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
 	.phy_disable = &sun8i_hdmi_phy_disable_h3,
 	.phy_config = &sun8i_hdmi_phy_config_h3,
@@ -612,7 +612,7 @@ static const struct sun8i_hdmi_phy_variant sun8i_r40_hdmi_phy = {
 
 static const struct sun8i_hdmi_phy_variant sun50i_a64_hdmi_phy = {
 	.has_phy_clk = true,
-	.is_custom_phy = true,
+	.phy_ops = &sun8i_hdmi_phy_ops,
 	.phy_init = &sun8i_hdmi_phy_init_h3,
 	.phy_disable = &sun8i_hdmi_phy_disable_h3,
 	.phy_config = &sun8i_hdmi_phy_config_h3,
-- 
2.35.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D61444FCE08
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB6110EDEA;
	Tue, 12 Apr 2022 04:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0FC10EDEA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:35:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A220F3201F1D;
 Tue, 12 Apr 2022 00:35:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 12 Apr 2022 00:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649738117; x=1649824517; bh=1I
 qQYnRka1Fn2JNjNzWi/7Wa2m9c8upmD64g6JA+rj4=; b=tHSEbpYszKFAdbvQ+C
 X3IUFwhjNvr+nGM/B08iwfWNRk+CoDNpjHcxBA4yPiIMi60bgA62HlZrpPqOhOJH
 3hggWmelLXYbyp4iibiLgsQG0AGyAN4q03YA1Gx5lpaLZxiGKgDF3Te8kTBc7O8H
 n0TC7sw9P5ECBKc/tL8V101tyfxrWybnF1yw6xtL9oo2C76BhSQkWORYtHrKi3In
 FBe3P8jfpxB2RdQ24f7xN1y7q418UGuSnmxQ3t5o+hLT0EzF777Tz8r1/oPwd6v2
 IQyvaA756ocWM+nK+0N7Hqk45G8+gMnfsQ0Ge1RH8wcyKgKie/bjOTnI/45M7ykQ
 0U+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649738117; x=1649824517; bh=1IqQYnRka1Fn2JNjNzWi/7Wa2m9c8upmD64
 g6JA+rj4=; b=SmOp4SrM0CtJFG07PVzxpCQWkRdBIu9HxlTUXxGbaiZ3fqE/CJy
 qFZ8zvW5wp3vfaD+YjZe9kQ+rT4cNncB4TGtvSvn7V669KUtB7Yn2gqD5YU9WsLp
 gcZYEByB9Fj0Fpo9b72wQs4VwDfpfsDedl1y+Fo/TV4zy6Jkc/Kzvh2S/GoBCExc
 2bHVTy2ca4MFnlyiPdz1rQqvNiLZEQo7X+JYO8BCvxXV4qcwuv7oRsQDoni8KAyh
 GijDYlY+skkJkfp00ZIy2Nv82MUm3JcfXt038vY7pTG3v776JTBHtGYvV16MmN+D
 Kc8XDP1jZJaOj+i9rq650VCDKw4r3HDFcBQ==
X-ME-Sender: <xms:hQFVYvh0wmUKifSiE31SPlelqruADGVVOusLTCK4c03oXerYMJemog>
 <xme:hQFVYsC5eDXWNAKpfCm31wuUPy6S-nsqMP49eHuRHT2bIIQTRf5zyzDFJJ2y6PORc
 -qdJPiAWPS0P9_suw>
X-ME-Received: <xmr:hQFVYvHuqe9BOdCCqKA0gbSNb32hZZ1VbaF5unAd50Hpn50XGgaksNAO-gwFk_oWyaEuFPeiCMbgOu31Ywsiu2eRm_oNNrVkqOX1zIq8WjCwXxX74fTmufg1BJCHQHiUpq39-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:hQFVYsSuFkEkkqtIQCLkYyOsg21Xu0o6XePNql3lzc5sYcakFV18UA>
 <xmx:hQFVYsxFoGhU-XqtwRMDE6ePFBmo3DYUA9dPE3vpUbNPWqAXmg7eHA>
 <xmx:hQFVYi6c6UuA8SaLODKsJWCNaMiNWF0eCOkrh5uXGq7I4L8CXhJg6g>
 <xmx:hQFVYocIBYLiHwbzV5qj1jpVoyffd1WOBPkgPbGvXYnIkc5yT7bb3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:35:16 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/6] drm/sun4i: sun8i-hdmi-phy: Use of_device_get_match_data
Date: Mon, 11 Apr 2022 23:35:06 -0500
Message-Id: <20220412043512.49364-2-samuel@sholland.org>
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

Now that the HDMI PHY is using a platform driver, we can use the usual
helper function for getting the variant structure.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index bffe1b9cd3dc..0adbfac6eb31 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -173,7 +173,7 @@ struct sun8i_hdmi_phy {
 	unsigned int			rcal;
 	struct regmap			*regs;
 	struct reset_control		*rst_phy;
-	struct sun8i_hdmi_phy_variant	*variant;
+	const struct sun8i_hdmi_phy_variant *variant;
 };
 
 struct sun8i_dw_hdmi_quirks {
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 5e2b0175df36..7b901aef789a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -565,7 +565,7 @@ void sun8i_hdmi_phy_deinit(struct sun8i_hdmi_phy *phy)
 void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
 			    struct dw_hdmi_plat_data *plat_data)
 {
-	struct sun8i_hdmi_phy_variant *variant = phy->variant;
+	const struct sun8i_hdmi_phy_variant *variant = phy->variant;
 
 	if (variant->is_custom_phy) {
 		plat_data->phy_ops = &sun8i_hdmi_phy_ops;
@@ -672,7 +672,6 @@ int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
 
 static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct sun8i_hdmi_phy *phy;
@@ -680,17 +679,11 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	void __iomem *regs;
 	int ret;
 
-	match = of_match_node(sun8i_hdmi_phy_of_table, node);
-	if (!match) {
-		dev_err(dev, "Incompatible HDMI PHY\n");
-		return -EINVAL;
-	}
-
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return -ENOMEM;
 
-	phy->variant = (struct sun8i_hdmi_phy_variant *)match->data;
+	phy->variant = of_device_get_match_data(dev);
 	phy->dev = dev;
 
 	ret = of_address_to_resource(node, 0, &res);
-- 
2.35.1


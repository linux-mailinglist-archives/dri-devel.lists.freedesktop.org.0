Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71BF4FCE09
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B84710EDEE;
	Tue, 12 Apr 2022 04:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C594710EDEE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:35:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7A387320187F;
 Tue, 12 Apr 2022 00:35:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Apr 2022 00:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649738120; x=1649824520; bh=nm
 KRP/ABfQcqmBycE/L70lVGYqQcz1ma/r1ejzxPxFk=; b=BYQzVtuZ/yZ6tZvfZv
 shuOdxt9Hl7tqebK/azOKm0dPdUnMNJbi4qjYDY2e7H7rUR7xR0BqoFqr+7oXLPh
 ELXW81sNHoLsXMR2POkSe7gcK4wKSVD0MGKg5yVU31bz5cDhpHchLDTf4z8N5aVU
 3kw4QSHotf8TV3HOhkvijmeGjluWctz6eNOu1qdIKPPS8Aa1kHMWZrTqUiQjVmYL
 /TN6uYZ8pVtDHAiUfQC2wMhqR87fJ2CoA3PPx7PTOTGTFAOBZNtEPI5zi7g/hJ7i
 fU34jP764fsWrfjqqHJHU8NHestJbMr0apj/7HiYIyODFJFEi98lpBF1DzfAQiAl
 hJxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649738120; x=1649824520; bh=nmKRP/ABfQcqmBycE/L70lVGYqQcz1ma/r1
 ejzxPxFk=; b=GXkXgMvujAqVu9e0v4TEt22iTDNW+TdLkDsNq4Wx1YovbftmwOX
 l4UtwWBpQiAiADpU4wOMPHYdJx421/DTPB6S8MgszZdrCCrWlI5Xi1jAD0md08Ej
 rji/57y0DiuY8d+gjMthPpJPUlqrx2S5Jb4tSPcsRbh8b1+5MERdof2c3ZMb/Akz
 buA87E6Z0Ailrf689Dkdca9WM4QKhbXwkhO1qAD8Dp2utyQvSs2dj/Ur4snQQW3Z
 Ny5X2eGV62A4K2IIs/Gb/9BWFdPANgb2UCJKbRdR0cpPZY4xlNvNPbEM86Rb8ZoW
 9A8LYbXDFhY/W7PJPdPJQJxEiNosqR0giGA==
X-ME-Sender: <xms:hwFVYmgEfW2h3AAcLg8Qid1I8BVvChcW4SQD-_Ncxbq7HKLRSnYMYw>
 <xme:hwFVYnBsBng5-v6GJp1k5x_xZIycGq0R3OKKPhTXt6pAY0aLRkgI-z3nB6Be5OkLf
 Yup6E_MB7JMOJZSFQ>
X-ME-Received: <xmr:hwFVYuEjye447cgcu0ibCAJuxBjUsVkAg8xJrfv2AkQSflA4DgwKGO5lFL3AHUoXigWYQVTbTV_vUr2LA0Mh9WIDUHFr0OqaitymejrcV77XQ_ttsVmlseZa3pchieDQ9Dm_BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:iAFVYvTYL9jIQ7FHjrJLlJ64u70T-bySOboi5myiVeS4Lwtz9-NNIg>
 <xmx:iAFVYjxcft4fL-CZNfD16vOAbSCySs1rUUbn2Ow2cvxvunaymKSbvA>
 <xmx:iAFVYt7J4dKa49vXgglHZ-vmjak2uX9_VBQreKgwMcl3lILevtyLFg>
 <xmx:iAFVYrcefS-904kF0U9OdKmEK3shv8Rf_u2yeobFCUObJr2TQhpIoA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:35:19 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/6] drm/sun4i: sun8i-hdmi-phy: Use
 devm_platform_ioremap_resource
Date: Mon, 11 Apr 2022 23:35:07 -0500
Message-Id: <20220412043512.49364-3-samuel@sholland.org>
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

The struct resource is not used for anything else, so we can simplify
the code a bit by using the helper function.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 7b901aef789a..1effa30bfe62 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -675,7 +675,6 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct sun8i_hdmi_phy *phy;
-	struct resource res;
 	void __iomem *regs;
 	int ret;
 
@@ -686,13 +685,7 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	phy->variant = of_device_get_match_data(dev);
 	phy->dev = dev;
 
-	ret = of_address_to_resource(node, 0, &res);
-	if (ret) {
-		dev_err(dev, "phy: Couldn't get our resources\n");
-		return ret;
-	}
-
-	regs = devm_ioremap_resource(dev, &res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		dev_err(dev, "Couldn't map the HDMI PHY registers\n");
 		return PTR_ERR(regs);
-- 
2.35.1


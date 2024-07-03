Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83815925A6D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB69210E7B3;
	Wed,  3 Jul 2024 10:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="GUEiBgWk";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="YNAclgI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAED10E7B0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:58:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 23B9B13805F2;
 Wed,  3 Jul 2024 06:57:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 03 Jul 2024 06:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720004234; x=
 1720090634; bh=zAFJQHsCA6T/KnG6k6AwcsnCn0bPOeW7iUnBKgovQvA=; b=G
 UEiBgWkjnvAvwSmUWP88axLoByoRZB+/vytFegH//hgljLctqyJt76+m89yC5G+0
 ZlqoSOsoYzi1zZmdKQhpLBfemyHaQMNZDsYG024mlFML8YNRqOLbcsg4J8/eYraP
 x678AxhnEL1YQMias67bA1HI0ulC0vO3gZcpwE+KZisseJy2ZdtBmrYsJEA51x2i
 ZgDFv5cyAcckBwlpjKaR/D0pTjtyDETZYDdIATYA3ozcxFDbsUWeaXRr1cOB9Zry
 i9cbAd0LWZTh9G2YxjBrCOkIz+EJ/HakVs1Q2S1rVQ2B0mST0pLqtOlWd27JL6BH
 aaIb/TpcKxFVWzerktIyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004234; x=
 1720090634; bh=zAFJQHsCA6T/KnG6k6AwcsnCn0bPOeW7iUnBKgovQvA=; b=Y
 NAclgI5al3GHk/emTiDos2PblfjUiLBDkNKCGSiIJ65XQI8U+X/WM/HXVkm0VZ4R
 4pTleDAOJK1qTavLfsrN53efw9aeZR2UTk2yvlCeO3ZWO+Qnqpe2xBMXAEOAb90T
 /fR/q60rK5ZVtRUA2a30A1qZZMG49z7bCMB6dCYtPMrT7+diSkwIUVJkQN+pYw4M
 3hBkcsE/mWwJtE54SkGIuSRDAHemP6RNsRFTWC/aQZPBULv9HLnR78WbTuHK91Nk
 Klc00gJRCtwhnWCX7qrh3yVpQD6uCyB2oXBoRvIBW7nsyYwJ80ULhEvaoUqOP7sd
 px1ddd/CJHct0a6y0VuBw==
X-ME-Sender: <xms:ii6FZkBjbqhdML-nQrFoKqGcZkJDrEIdwdx2UhzP2hRWPJTuDCTTAg>
 <xme:ii6FZmjeISsKI64NLRQvxyICpMgii78wV7RFBk-yAtTJhV7kbuvEKydx7udrKrz_j
 E1_kHSjhPZ82Z_6OA>
X-ME-Received: <xmr:ii6FZnl6ffoy9nvhpYiJN-F5vNZJCiWxtounLdSJ7FQs25BqjIEsqM-ePQQownmvHfdhL9-wGTyKBAbAVZPkF1JbcsH4XghTB3M2I65MFmY_YbDD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
 heetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprh
 ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:ii6FZqxH5X39UI_zSDA3uuJmG9zz6TO9KyXMfETdNKYjd__6lquOsw>
 <xmx:ii6FZpTQ1w-14jbDbJmV7H-Gfia8oEGKc4aa-xOpl4QKLdgNKWE84w>
 <xmx:ii6FZlZjn8VXcCS9buyWxfwFzZLC1ss53ABvXRvBxa-yf3AzRUyUeg>
 <xmx:ii6FZiQhAvJKDCLYipeGOjYQEyYrwuG9Y4jOctseRXeeE9oeMEPWgg>
 <xmx:ii6FZoAdlm1xRmRmRCMsQnpiWOmBeZKUIbn2nKxcr4gMWDxmYJ05wMBg>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:57:08 -0400 (EDT)
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
Subject: [PATCH v2 19/23] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33)
 support
Date: Wed,  3 Jul 2024 22:51:09 +1200
Message-ID: <20240703105454.41254-20-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
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

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

The DE33 in the H616 has mixer0, mixer1 and writeback units. The clocks
and resets required are identical to the H3 and H5 respectively, so use
those existing structs for the H616 description.

There are two additional 32-bit registers (at offsets 0x24 and 0x28)
which require clearing and setting respectively to bring up the
hardware. The function of these registers is currently unknown, and the
values are taken from the out-of-tree driver.

Add the required clock description struct and compatible string to the
DE2 driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index b0b8dba239aec..36b9eadb80bb5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -239,6 +240,16 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
+	.ccu_clks	= sun8i_de2_ccu_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
+
+	.hw_clks	= &sun8i_h3_de2_hw_clks,
+
+	.resets		= sun50i_h5_de2_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -290,6 +301,16 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 			"Couldn't deassert reset control: %d\n", ret);
 		goto err_disable_mod_clk;
 	}
+ 
+	/*
+	 * The DE33 requires these additional (unknown) registers set
+	 * during initialisation.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun50i-h616-de33-clk")) {
+		writel(0, reg + 0x24);
+		writel(0x0000A980, reg + 0x28);
+	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
 	if (ret)
@@ -335,6 +356,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.compatible = "allwinner,sun50i-h6-de3-clk",
 		.data = &sun50i_h5_de2_clk_desc,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-clk",
+		.data = &sun50i_h616_de33_clk_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_de2_clk_ids);
-- 
2.45.2


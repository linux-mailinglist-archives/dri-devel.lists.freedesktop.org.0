Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7E6955A53
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 01:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29E410E140;
	Sat, 17 Aug 2024 23:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="VJgN3yQG";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="tZUF6yPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAB610E13E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 23:16:13 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal
 [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 2B305114F0B3;
 Sat, 17 Aug 2024 19:08:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Sat, 17 Aug 2024 19:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1723936100; x=
 1724022500; bh=eL8Ja0cm2QWAzdppofmq58tCJs0JjlEo2wlkPX2ndkE=; b=V
 JgN3yQGG0E/V7SE9Zqcl1AcaEnVMPcFjAlJ4G5HRJlzbQDmrGXL38B/G/rnIpHj1
 eS5qok2QcimBNLNltZR/J2xo2atnPxbAPz9U2TEnCrO3FWT7m/3S2Vz5MzRawIxv
 XoVYMlqNT7Y8i4nL/fjbFijCj1WLnX2LTvLVo+E+MX/yUA4WL8Z1t8gnF/4AwNW4
 y8XyVcnBI5U26o8jJToILzcQrh6iESjy3Dj7A6u6KdevtibRc01x8LXRE1V1yIA6
 Q3sR1AIY31HS2eQH6Jzf43hSc7tQzcGgl8GvNNEPhHMBV1ZqscUtqDBzRyxHe7Ki
 rEyaDMCEtKWEN0kqH3oPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936100; x=
 1724022500; bh=eL8Ja0cm2QWAzdppofmq58tCJs0JjlEo2wlkPX2ndkE=; b=t
 ZUF6yPEQkfwH5KstpTXKfAbbkRfDICBCT6sQpnGjliMCsLTzH1hfilyc2Ry9E7W3
 dEsXBDmRysQ0hsNmgk8ZPjaLLmQQd8n3rYWfA97OM3VRU4vsVmnrSjtpL2pTv6mt
 j2XRyDSkye9xYkSrOrf45MzZL16+4wLSJIcy4tm4qYaLHZStjcLIbu/L//GdQ04x
 mJwvjTczgyS0+xmiVy+I5JQ9noNpRuyPvqzYuTwqaDYcbl4AC+q9qoArr0BKV+G0
 c0cz1Wl1RElHY+gMlqu0xtH2/5Av6AmZiwHExb/YDNfVXDw8+Vi+C0VqEWcKPEJ4
 pD6IwIQSEnkdDsEcseqZA==
X-ME-Sender: <xms:ZC3BZnpAEuk_3UMFv_0K8MPp9w0X1iicYdcvy-fy9f3Nay74PMwIOQ>
 <xme:ZC3BZhosISc9x9zfTw99eQXI_mKS56RVUgfI3CcT0sQitnk_Z8Il0OTcYizLfmDuV
 -_5EAREIGdLfUdrSA>
X-ME-Received: <xmr:ZC3BZkN7F6KTXKIphUfJpcUpiRh-Hmg_FKfRG57Gj4_YiAY3PBjTv7uEXO3TDobf6pK3dTTBe4toRi029jKNkzwR1qlYRSCZ7l-IwQ9o21zCDHP5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZC3BZq4ZZR25rHLjgtE9JmMYOexMrobCDV-CQCp9uf4ElHsrDmOJCA>
 <xmx:ZC3BZm4HyiUi-yjQYyayhRqnhsCK62-Oc85oZeWbl1bmDUvwXjUoVA>
 <xmx:ZC3BZiiaAFijNa5HvScsfi8q1v6o_-cii5Doa2ex135yEuQmwnGLNA>
 <xmx:ZC3BZo4kP0K0yv-TOxHp_r0WOuvhAoySJ7hoZi8g54fedFXqdm5EPw>
 <xmx:ZC3BZrofI2DJ6S9SQQnIO5LyQYOFYvaEg3x88ihBvRKpFQQOWcLEg_Tl>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:08:13 -0400 (EDT)
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
Subject: [PATCH v3 22/26] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33)
 support
Date: Sun, 18 Aug 2024 10:46:09 +1200
Message-ID: <20240817230503.158889-23-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817230503.158889-1-ryan@testtoast.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
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

The DE33 in the H616 has mixer0 and writeback units. The clocks
and resets required are identical to the H3 and H5 respectively, so use
those existing structs for the H616 description.

There are two additional 32-bit registers (at offsets 0x24 and 0x28)
which require clearing and setting respectively to bring up the
hardware. The function of these registers is currently unknown, and the
values are taken from the out-of-tree driver.

Add the required clock description struct and compatible string to the
DE2 driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v2..v3:
- Lowercase hex value
- Correct #include for writel()
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 7683ea08d8e30..e0fdf9bda10b1 100644
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
+		writel(0x0000a980, reg + 0x28);
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
2.46.0


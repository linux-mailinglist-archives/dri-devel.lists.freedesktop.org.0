Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220CE49503D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F44710E3E3;
	Thu, 20 Jan 2022 14:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE9010E38E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:34:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 684B73200F72;
 Thu, 20 Jan 2022 09:34:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 20 Jan 2022 09:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=3NIs/tzIV0NOQ9iZjEwEqg6LGzZ32g
 EIyDHw6z78KDk=; b=ToCYfh8JvVN+YwgnSJyI3UY+19VQK7/2Wcq4f/MoRnRflo
 ESNQ113qOXPS6is/nK4tbI45JIwRv8yT09cXObg9ltBJXlhmaJrF60uJ6JV/oKjX
 pXCYLtpdHlOiurcCwi1gDN+eL89wPBKCcXfzKSl7mAAFwGEaerf0CXB6Zc3mViLZ
 +Kh8B1VuogCgxQJqssGg+BW0wLDss/XZkG9abGVe9xTMSJz/96YPDSea5nI+MigR
 yeCHAeRkc0rMYoKcsvi/d4MrMJm/rIbBqTj7hf8R41Fh7MNtyJGPx3ye52ySE7xE
 MaXYg1S0Mx+5PTYXRa/CFL/lo1Z9NbJyuIeYK1Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3NIs/t
 zIV0NOQ9iZjEwEqg6LGzZ32gEIyDHw6z78KDk=; b=j4t4zugEMTma8DbHvFuBye
 pMzL7bG4URAhZIBpPcvWe/PEynl7HWHC7y3XjAEmehdcpyzi3rq8GICEGZlh0WqI
 BQgPI/gpICacrPTQ770ac1A1u5ppVx/XsVeTSrgywKixi2NMxiBBwKcV/CIN6yR+
 7punB1ZZ1+bVx4X4QQ0TSV63tjwUpzydP20+2Ve6qtWB2CIQMdXAKhM9D2ZzvFPh
 CFb4aTZqqQ6PBF6HGC/p/+5CkYKUYEp6msNz8kinuJmJIeBD0V0MA9KjBAZGvkXh
 mQ+qAttQjDpAghR1RUNGpj/cE5ALHgvGeR0HErgXMIGJamhjv+GaZFsXH7XYCHRA
 ==
X-ME-Sender: <xms:BHPpYY3UvaCbhNFdQRJwVho_d7MXQCzNw2yVC3QQD19r_v2wsTSIUw>
 <xme:BHPpYTFKvH03oLhnGhq2p4jSrc0Rs_0V57DBPSPLTKP8MttOe6gj7YSX-uda2ZuCB
 v2sDLO8dp40CgZpH3k>
X-ME-Received: <xmr:BHPpYQ71X47tIowHwfnKPfgbltijsnxH9JYmh6JfEgRtIWP7AO-0cftZfS8kZ7lyjJwPvyPG6vmeFjBKyKxuaMs9STps8sfWlzBsgaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BHPpYR1X0SZjAJDT32lWSwciSse9XIQD_gY1ftqMyrQisYGovoH09w>
 <xmx:BHPpYbHpZUwBuNJXYfjvhWsx9qzlDSzMOwVvQTz2BnlH6VYbMbUNjQ>
 <xmx:BHPpYa8ibIX1hjcfiZpgH8Rr7d6u6u27HgNMRIF7aPBF7qDiz7mhng>
 <xmx:BHPpYa3CAFZWMgqvnTk2nmwHEI3kkbq5A3C5VKzmdykQggiuXUNBlQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 07/10] clk: bcm: rpi: Set a default minimum rate
Date: Thu, 20 Jan 2022 15:34:14 +0100
Message-Id: <20220120143417.543744-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120143417.543744-1-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The M2MC clock provides the state machine clock for both HDMI
controllers.

However, if no HDMI monitor is plugged in at boot, its clock rate will
be left at 0 by the firmware and will make any register access end up in
a CPU stall, even though the clock was enabled.

We had some code in the HDMI controller to deal with this before, but it
makes more sense to have it in the clock driver. Move it there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index f7185d421085..c879f2e9a4a7 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -76,6 +76,7 @@ struct raspberrypi_clk_data {
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
+	unsigned long	min_rate;
 };
 
 static struct raspberrypi_clk_variant
@@ -89,6 +90,18 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
+
+		/*
+		 * If we boot without any cable connected to any of the
+		 * HDMI connector, the firmware will skip the HSM
+		 * initialization and leave it with a rate of 0,
+		 * resulting in a bus lockup when we're accessing the
+		 * registers even if it's enabled.
+		 *
+		 * Let's put a sensible default so that we don't end up
+		 * in this situation.
+		 */
+		.min_rate = 120000000,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -267,6 +280,19 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
+	if (variant->min_rate) {
+		unsigned long rate;
+
+		clk_hw_set_rate_range(&data->hw, variant->min_rate, max_rate);
+
+		rate = raspberrypi_fw_get_rate(&data->hw, 0);
+		if (rate < variant->min_rate) {
+			ret = raspberrypi_fw_set_rate(&data->hw, variant->min_rate, 0);
+			if (ret)
+				return ERR_PTR(ret);
+		}
+	}
+
 	return &data->hw;
 }
 
-- 
2.34.1


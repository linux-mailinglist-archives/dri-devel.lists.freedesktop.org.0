Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4EC49B5DC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F6010E55B;
	Tue, 25 Jan 2022 14:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F120610E55B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:16:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E7975C0136;
 Tue, 25 Jan 2022 09:16:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 Jan 2022 09:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=3NIs/tzIV0NOQ9iZjEwEqg6LGzZ32g
 EIyDHw6z78KDk=; b=Uy7u64E94GMbPe4slBfyJkaed3hwLNrb6Wgp8zfjhnO5kV
 oSupAxLGipH32rLkQCPxXJPQom0sDzSLRLphf4Fmb7mWYVGQgzE/pkZwBNNe4paf
 9Bz1siSNoKVn8JLiX91VLwVJlQwiPKASP6qYXG1wbO5+0NA1y8gGZJJjZ7o0rgm3
 KCDPhySzLWU1sVy+ymglgst9NETBHDL6tqVdI5eIbkqmjfulg/ZVZIBzBUL644Ow
 xkfIDKrh7aw54C1v9LoPWnywwxeMb88V04KEh6cYmblo1gzhv5258DObFjLBIYI1
 uG9wEn1P29GmdTIUc5e/tn9PHS1rkY0M0wi04pOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3NIs/t
 zIV0NOQ9iZjEwEqg6LGzZ32gEIyDHw6z78KDk=; b=Imt56R6058I2HyBGEoudAd
 eUXehFc4bmFtOqQHm2QvlK9Mmg8SadSkXhaP62irk4h2vYI6EA32jSp361MrnnMU
 8biD9H0xDPIB12meQJKvjSMOl1knJRZizoDh/xhet+hUu1frvYqo7+VSgEVh4UeB
 dIloDAsVB9dPaJgTvXopeSA0UH8059vqd3ty1jHYezcQXg0hH3z3bMglGomjh7Ti
 q1EVsbGv7A32pn2FoxZ9TRrDUsxuzjxR7mRK6iXhD0v0yr47V3VIn4Pj2cQ7vbWj
 ftUq6g2vp131PrsNEuGbbaL9rf0/X8gz+DSkjTdaR83zbLWnoN1ekd5r9Ykk5Tsw
 ==
X-ME-Sender: <xms:KAbwYR_ooGzJPLwW5hLEjgJEwlahcDYb-XDNfAQcfKwRhj37JHX3xQ>
 <xme:KAbwYVvLmPc_XYRyh7QIo3TPvMpwcnpX_WoAZzbbuWmirMfVSNuJPSnwEFpv7AMU6
 dODZaih5U9470wBJBs>
X-ME-Received: <xmr:KAbwYfCvBgy9X5NC_G4nvE8dxSrKBoRelRA0sFxepRd7HPxyJcRPn9W_qcdKpIXhpxDu8GQXWCdTXmRaTNtXY_xxhtYj2wB6IjbYQMs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KAbwYVf1DbeiOlHhOzW-N87MIEK_JzEpTWAdTWpNfMQ_HB0L2oFRhg>
 <xmx:KAbwYWNk1VXOoczVVoh10Pz19frEJojtbNUjbZUf7DJOjbkZlGv4AQ>
 <xmx:KAbwYXlMNyo19cQ-rgClflB2uhNXFGIV3eSbqWMp8kb59NnHYfEejg>
 <xmx:KAbwYVfiB0dhCU__8fsVDiKB1UMttNgGedYMBgUsT2HWI3TvLAu1EQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:16:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 07/10] clk: bcm: rpi: Set a default minimum rate
Date: Tue, 25 Jan 2022 15:15:46 +0100
Message-Id: <20220125141549.747889-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125141549.747889-1-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A286D49B5DD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150C610E609;
	Tue, 25 Jan 2022 14:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DFD10E500
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:16:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 536115C011C;
 Tue, 25 Jan 2022 09:16:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Jan 2022 09:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=wkyNpQaqe/5yqepEtzW1vHU0+7nQsE
 z2kObpQxckMxk=; b=OPiAbWEHEEuQZcvJ3cMKeWIJz9MEvoOsekJRy31/2TrIAO
 myFc+RFM6FqP7bVvv6jh/DTcLvhvPxR1gXWkPexyOAM8lw8Riu2iLtt/cuPJExSD
 fCqjYVsJDMlAUoiI4tm/NlfGEZ/DkNJgBDPB6GdtpugRnB7WMrvNWwuNeRiQZ0YQ
 I5xxS1WvZfwTUHI5yIjGDTRr7XgBIZr7lWqddrv+Gq1KTyhgHFXRewXaQO/6PoJS
 P7z0fwv1PUmGX0vMCdAd5Z+5o99Cw9OjKcNrW/JQfLtL//Hls5xhiqHf2H0SfmUO
 r21hHRNxgh6k/xEZ3P64GERGbTHqFy9AGI8bj2Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wkyNpQ
 aqe/5yqepEtzW1vHU0+7nQsEz2kObpQxckMxk=; b=TTs9K+69Lh8MoEwc75VF+I
 UXk1rPeqdQdVOaPxYZPwoaTj5+3mm1Dlbea0Tn0jW4bIWB5Rd/jdYesdyXUZOADY
 VliCM86hFx+pcS5CqfozRbjYwOewKNgKYNeTjmf8ttr+QoF8MwtFEAd97oGbYWUY
 wtxbXAlYEQ9DRv7Bfzze/sbzuyR5eGES8oUSmiapfWY9Y7IjqBADZhcpmM7cF+LD
 x0iN/L5FdpSUX2pb1UCrlPtljCG6FRWOAIZhFS0rDrNT2ONtZEDysHETpcg6w3U9
 fPK3up0fFXgPFSpdfz3xm6TqEXsx9i+49pRoxZRzVWGaU5wUTQPGhaChx+tKaHzA
 ==
X-ME-Sender: <xms:KgbwYelGVAvbG9QkEkbqW08HfsaEs2P3BahQZ_qUq8dt2nN6LJ04wg>
 <xme:KgbwYV2jWT9Sm6SHDM_Pqcsw6tuRHfi4AM-29AWT5jAma7sb7_zhVPYdGqmR_VbnO
 YtOP03NSpm0FCW5Zvs>
X-ME-Received: <xmr:KgbwYcp0DLmyVKHLdAeRp7UPrvHpHtrdvZFyvzcHaHNpUUv4ndamI8d5LqLQvayCzvoVSBd67NtbBkzwYQMfWYlfVXe02JF5A1SiM4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KgbwYSmiVhZWxzwnbKce35bQDtu8jyP40DisIhUC45QQeIdl9xTycQ>
 <xmx:KgbwYc2lo6CrwwMSyjwEqm4f9t6ghnxE-0XZrrONTqOqKNFzqqJ6EQ>
 <xmx:KgbwYZtihoy0YJMafSja7vSxK_oVe6hOemzHY2yw0ZKbJrPZ6-2YDA>
 <xmx:KgbwYdm-lqEX4fIRpSJh2QJbFOoHqKodj5ocvM566zQkqOCU4i9S-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:16:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 08/10] clk: bcm: rpi: Run some clocks at the minimum rate
 allowed
Date: Tue, 25 Jan 2022 15:15:47 +0100
Message-Id: <20220125141549.747889-9-maxime@cerno.tech>
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

The core clock and M2MC clocks are shared between some devices (Unicam
controllers and the HVS, and the HDMI controllers, respectively) that
will have various, varying, requirements depending on their current work
load.

Since those loads can require a fairly high clock rate in extreme
conditions (up to ~600MHz), we can end up running those clocks at their
maximum frequency even though we no longer require such a high rate.

Fortunately, those devices don't require an exact rate but a minimum
rate, and all the drivers are using clk_set_min_rate. Thus, we can just
rely on the fact that the clk_request minimum (which is the aggregated
minimum of all the clock users) is what we want at all times.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index c879f2e9a4a7..9d09621549b9 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -77,6 +77,7 @@ struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
 	unsigned long	min_rate;
+	bool		minimize;
 };
 
 static struct raspberrypi_clk_variant
@@ -87,6 +88,18 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_CORE_CLK_ID] = {
 		.export = true,
+
+		/*
+		 * The clock is shared between the HVS and the CSI
+		 * controllers, on the BCM2711 and will change depending
+		 * on the pixels composited on the HVS and the capture
+		 * resolution on Unicam.
+		 *
+		 * Since the rate can get quite large, and we need to
+		 * coordinate between both driver instances, let's
+		 * always use the minimum the drivers will let us.
+		 */
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
@@ -102,6 +115,16 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * in this situation.
 		 */
 		.min_rate = 120000000,
+
+		/*
+		 * The clock is shared between the two HDMI controllers
+		 * on the BCM2711 and will change depending on the
+		 * resolution output on each. Since the rate can get
+		 * quite large, and we need to coordinate between both
+		 * driver instances, let's always use the minimum the
+		 * drivers will let us.
+		 */
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -206,12 +229,26 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
+	struct raspberrypi_clk_data *data =
+		container_of(hw, struct raspberrypi_clk_data, hw);
+	struct raspberrypi_clk_variant *variant = data->variant;
+
 	/*
 	 * The firmware will do the rounding but that isn't part of
 	 * the interface with the firmware, so we just do our best
 	 * here.
 	 */
+
 	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+
+	/*
+	 * We want to aggressively reduce the clock rate here, so let's
+	 * just ignore the requested rate and return the bare minimum
+	 * rate we can get away with.
+	 */
+	if (variant->minimize && req->min_rate > 0)
+		req->rate = req->min_rate;
+
 	return 0;
 }
 
-- 
2.34.1


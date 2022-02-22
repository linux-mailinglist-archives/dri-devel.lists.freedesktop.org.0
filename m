Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9B4BF91E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADD410E64B;
	Tue, 22 Feb 2022 13:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E2C10E53F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:19:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B51A15C02A6;
 Tue, 22 Feb 2022 08:19:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 22 Feb 2022 08:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=xZ5tDfJaUnDK2zdKkFq1Tltv4rLSsG
 LP6zUbM5VRt6k=; b=dDQXLfPH5SoEnWceMwbk/aalFBge4vSs+fO6rBsUdfXpeV
 bKuiZgyDM0GkNucfj4ePQMHnp8l1q+MxIAxoJJInEcZGawhrTZAdhhUvaf+XHOvW
 ju5igPysEnK4Nz7kMUuX0h6cTJ1fwfCXUMG5N4iLiKguD/ds5yoer8qhnrh/v8cl
 yxblDrbtQpktGZWnR+mozfb8cRMDmMWtQW8kWoeTN19wAndgi5FOGZtRlzCKosyH
 M/UJZDQhkwVj4m1RYIuOTEX8h0RfBkiFFlipVvaHcIOPqiV4L28xJ0e53mx4GzRi
 FFlScsKiLQNNTQPySR3qTdBqMtoE5/vqEeWJLP5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xZ5tDf
 JaUnDK2zdKkFq1Tltv4rLSsGLP6zUbM5VRt6k=; b=EQmDsyP+xeLMSvR0jK1+LK
 /QIcQzeaJsCxC7jw7D1pObzPJnzPySa+Kd6MIMiIB5FZ9wvbZdcWluxP7hhVfoc7
 JDeGGg4EpAXw4UltTcJlQ+xLdUG7X9hAbeE6ZeaZGeXyHyIV6Dhncu3RcHpml5Oi
 zQC8TTpbb8P5kLp/ZYsh2smzVJlbqJ3vwyWWmzQJw2XzU2XY//BBEW+s0bAABsOY
 nYtL1IdEjnc/atxawDN6/v0NHhw9VXHezUGLr2b/lJFoL4qYM4nTfKw9ApPRrAD3
 Um+r9xc9nwTZYBiDrWLfPkk9A68DyiUu0IjkbGN6VAKm+is5xCIWT+Gr5gKtxcYQ
 ==
X-ME-Sender: <xms:1OIUYm-5Yu6vNgO6NRTWhK8zjJJhxnykxbc9GmJ5YyygRPo0q5_4Ng>
 <xme:1OIUYmvK7K5ipcR7Pxh-Pwvi5U5e9keZg3MFeUmqqjvbxvjPTmILr8zdBWERg2Ktf
 zUKqTV5GVehSyD8yiE>
X-ME-Received: <xmr:1OIUYsCpspSsZU6_v01NAA3Z3xqpu3AtGSNP6MWtcDZIEeBzKb5n6g830fpFOhxfi9iH_b5-XERAuMxsNRDKFPpBmBZw3X3BOKXsP5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1OIUYucyeBaukzQ5wlZyVKbGiZRotTzMk5VCL8-jmTMxUpoVbSugGw>
 <xmx:1OIUYrP6IAqi2-vCNoJwltY3Jl_8Kv83RK9XalnGVFhDPjNCTgeNcA>
 <xmx:1OIUYoksMslk7P9FORSEGw4nFRR4vqQeAts6JoGNIu4mWpI8hlJGew>
 <xmx:1OIUYmfFmQ7vexdWTjdzgRwrmz7xR5jxq5Q-Z88Baf_qoKZ6MFnbWw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 09/11] clk: bcm: rpi: Run some clocks at the minimum rate
 allowed
Date: Tue, 22 Feb 2022 14:18:51 +0100
Message-Id: <20220222131853.198625-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
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
2.35.1


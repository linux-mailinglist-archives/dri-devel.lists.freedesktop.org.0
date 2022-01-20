Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C41495038
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408E310E3D5;
	Thu, 20 Jan 2022 14:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6868210E3D5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:34:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4F7A23200F72;
 Thu, 20 Jan 2022 09:34:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Jan 2022 09:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=jewBEbVMs+FRXBCM//Wi630XwFIj/W
 oYZSZn8axj9xQ=; b=VYpmJdPG4EoTUthImk74zoiGORtn08bsL3E6ITbHu58oEO
 Ydr6OueN4+KBdLLrHK5YLz6VQ6LL6OnSry0WB/0Pqd2abkxnPCyeBDu70gzpmmew
 E9lrXDpbIrGayMTX9sK/eiUZ7GXh21RrlMDYIm4HW86IgpdhbZGe7EEguEGt1hXA
 TNFVeVk+jbjxbDCDU+OhP5VEyjKD/vOXavbjcEnwDQ8mr1HGnPwamEhroSTTbTDK
 sfi67TY+BSe5EkWWmkItYlhBqfMqPJItwQaAIJoJ5HQiZz+G+Arc69NTCmNMeyDN
 2Bu4L8TRmHO35G8LBKu3HUdmQYb5cYsEub70wn+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jewBEb
 VMs+FRXBCM//Wi630XwFIj/WoYZSZn8axj9xQ=; b=YFLAPhEv8Rua2HYtGfeuM4
 a5fGKSbzrZSY96bLUoNddaFRgmDRve8Rk9MPjVli9RP6LVHInnfosY2yFRh0rXZf
 4WisBTwZeT0lk6KfAa2penxPCVRbzBCajN/+pZ9Dk+NnrtO8Cr/1GVhQgsICMfHK
 i6bekcXoN+qiRLw93VHDX2yCDYORXUdZLMYLmaP/F5V4teZw0eaT8mHpp205mXR4
 qEYxjQaGplmLad+e7/6tZ+juA+4cp21jwWEJ+zZm35tP5Nuj5MOlvfx9inxNPFQD
 xvkgioTd95pJpsxfKlImPSX/aY5oxPhgenum6RSrLe06VtRGPXqJq89QCbKiatWg
 ==
X-ME-Sender: <xms:83LpYV6bAR4JjJDWthDVRFihcZJydjFZSUtFu4D0SNDQiG5ishLptg>
 <xme:83LpYS634z5GL2RCk8-FPcgA3y8n1h2dXLN9ENYkwfbvxgRV2Udy-0b39mfeO9MDC
 e0cwwrmkEuo0_5zlkI>
X-ME-Received: <xmr:83LpYceqUBef1ZgrKUgNKcR4H1FPiV2tN3CbERxS4g0uShJRg6GqBhv2NDj_prQ5n-1RhNXQD6NI2UB3wX7CkfC43bjd_1PO_OSHtD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:83LpYeLsHq3ALphxVrm1e7odw4ESZZQlHckxEYZTVp9a7bEOhpKnqw>
 <xmx:83LpYZKsmRcXJ9FJUOLb8K8gXOeDZFdE-cU9AOGNT08P_aRWcp0TcQ>
 <xmx:83LpYXxC-FDNpHYTSXtEzONi-0JqT0G8wdVfUOCms38ZeqkqE921gg>
 <xmx:83LpYepogfKyCugBm1PxsGsmzLinqJHsT7X-2XmFJH_4-YR55I-Cbg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 02/10] clk: Always clamp the rounded rate
Date: Thu, 20 Jan 2022 15:34:09 +0100
Message-Id: <20220120143417.543744-3-maxime@cerno.tech>
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

The current core while setting the min and max rate properly in the
clk_request structure will not make sure that the requested rate is
within these boundaries, leaving it to each and every driver to make
sure it is.

Add a clamp call to make sure it's always done, and add a few unit tests
to make sure we don't have any regression there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-rate-test.c | 46 +++++++++++++++++++++++++++++++++++++
 drivers/clk/clk.c           |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/clk/clk-rate-test.c b/drivers/clk/clk-rate-test.c
index f2d3df791b5a..a13b02702d20 100644
--- a/drivers/clk/clk-rate-test.c
+++ b/drivers/clk/clk-rate-test.c
@@ -198,6 +198,50 @@ static void clk_rate_range_test_set_range_invalid(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, ret, -EINVAL);
 }
 
+/*
+ * Test that if our clock has some boundaries and we try to round a rate
+ * lower than the minimum, the returned rate will be within range.
+ */
+static void clk_rate_range_test_set_range_round_rate_lower(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	long rate;
+	int ret;
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_FALSE(test, rate < 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+}
+
+/*
+ * Test that if our clock has some boundaries and we try to round a rate
+ * higher than the maximum, the returned rate will be within range.
+ */
+static void clk_rate_range_test_set_range_round_rate_higher(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	long rate;
+	int ret;
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_ASSERT_FALSE(test, rate < 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
 /*
  * Test that if our clock has a rate lower than the minimum set by a
  * call to clk_set_rate_range(), the rate will be raised to match the
@@ -259,6 +303,8 @@ static void clk_rate_range_test_set_range_get_rate_lowered(struct kunit *test)
 static struct kunit_case clk_rate_range_test_cases[] = {
 	KUNIT_CASE(clk_rate_range_test_set_range),
 	KUNIT_CASE(clk_rate_range_test_set_range_invalid),
+	KUNIT_CASE(clk_rate_range_test_set_range_round_rate_lower),
+	KUNIT_CASE(clk_rate_range_test_set_range_round_rate_higher),
 	KUNIT_CASE(clk_rate_range_test_set_range_get_rate_raised),
 	KUNIT_CASE(clk_rate_range_test_set_range_get_rate_lowered),
 	{}
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8de6a22498e7..7bb5ae0fb688 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1330,6 +1330,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
+	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+
 	/*
 	 * At this point, core protection will be disabled
 	 * - if the provider is not protected at all
-- 
2.34.1


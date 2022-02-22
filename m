Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D6F4BF90E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4003F10E369;
	Tue, 22 Feb 2022 13:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F2710E644
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:18:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C5BC5C0284;
 Tue, 22 Feb 2022 08:18:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 22 Feb 2022 08:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=dSw3tDqHTjbKpOyLTMxTi9GBoJiS5t
 VfKvUkUEBmyuk=; b=rpO0PoA5pNdi7+UCUXhyJkFF3wrA3bpykZTpQpOC4P6zcU
 SsnlD2OnSG80T9RlCS1G+sJvnozOTq6D7n+m4DRoGZ8L79Kggji9eoM6kqscpA8+
 79VTOyxt9J0gkozahaXZagma9u20Gps25M5BizcP9rNCKVLQ1/FHNgHxdAsolFSf
 hTyTf+fKfg0FyrV9hpr8oRL57Y3uzXU11H10AttvlNcB4gKVZBRuoeO3FeD5iC8t
 +oaKflcLonqvOUyuVpvGfmLU0GJZBiRPVTpc1bsm4761bxaGgAbWw67L7FtOmkyI
 KqKJ/N+sucyPMpx1jwE/u8VvkMCrUyK69kc/bJ6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dSw3tD
 qHTjbKpOyLTMxTi9GBoJiS5tVfKvUkUEBmyuk=; b=PBqszhXfjnvWtbT1g8SQsV
 JRobmkZdfXesz3+KGXzlSskIoY52ZsyqQs6auH+24PFmr6m89OCQFWLJG0rNcaD9
 /Rbpsqkglhmbr1Bpcrn2em6+RkVB0bDdD3sz5IcCm+eX4dKeqUWBoccIK9Lrg/rZ
 rvWOXHpGO/2mgSiKTBF/PRedyVhafrBLFhuf0P6PNedl7C6Zgr36xchhNW4jUOe4
 Xzlu6vBirGhNvq3HIDwwfm6sfM6OvuMNQwlSriIlRGCCISMyo1/ruRcy/VIlXlci
 EJfaoGf+UMt4nOTwWbrns8Eel3WbU1dD5TZa4me4sPEXcyaYecY6QOYhJQVoRhaw
 ==
X-ME-Sender: <xms:wuIUYnB2gOiKQ0nZafYC9kwLvFi6pDgywS0S5oMVW3jbCJwb85NfKA>
 <xme:wuIUYtgpUQCkPpRNjm6TWMNR53GeRYeAXdao1ASGaBiMpS9U6rhPPSWL4V3wspP1k
 meO-DoxCRLXMTsoV_Y>
X-ME-Received: <xmr:wuIUYik5p-iAloLN8VmhIdfq3Ni04iH-2npUe5lPZd-URfT7VTxu0OKmuBtSwxmdkIQZndoscTaLfqGUh-oosAdvCqr1P9BoQHlHVgE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wuIUYpyYPdE0WbUfdSRDJ1cbPfsyGOtos-JYpH7rvAgN2II9W_XXww>
 <xmx:wuIUYsTmaaLLFbbx9mIb-V4Q2DRzEQu2ZzbF9UXes8u8o2a6R7JOVQ>
 <xmx:wuIUYsb1AYKPFW9dg8c10GWPkDS8BCd1hKurk_lhG4txkA5WH5SONQ>
 <xmx:w-IUYvG9Kt_HwyOKZ9mUGQ1FrT1GEmdH_KJGh_7cBT6R6qZqY41d_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:18:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 01/11] clk: Introduce Kunit Tests for the framework
Date: Tue, 22 Feb 2022 14:18:43 +0100
Message-Id: <20220222131853.198625-2-maxime@cerno.tech>
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
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's test various parts of the rate-related clock API with the kunit
testing framework.

Cc: kunit-dev@googlegroups.com
Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/.kunitconfig |   1 +
 drivers/clk/Kconfig      |   7 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk_test.c   | 786 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 795 insertions(+)
 create mode 100644 drivers/clk/clk_test.c

diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
index 3754fdb9485a..cdbc7d7deba9 100644
--- a/drivers/clk/.kunitconfig
+++ b/drivers/clk/.kunitconfig
@@ -1,3 +1,4 @@
 CONFIG_KUNIT=y
 CONFIG_COMMON_CLK=y
+CONFIG_CLK_KUNIT_TEST=y
 CONFIG_CLK_GATE_KUNIT_TEST=y
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3cdf33470a75..2ef6eca297ff 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -429,6 +429,13 @@ source "drivers/clk/xilinx/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
 
 # Kunit test cases
+config CLK_KUNIT_TEST
+	tristate "Basic Clock Framework Kunit Tests" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Kunit tests for the common clock framework.
+
 config CLK_GATE_KUNIT_TEST
 	tristate "Basic gate type Kunit test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 6a98291350b6..8f9b1daba411 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -2,6 +2,7 @@
 # common clock types
 obj-$(CONFIG_HAVE_CLK)		+= clk-devres.o clk-bulk.o clkdev.o
 obj-$(CONFIG_COMMON_CLK)	+= clk.o
+obj-$(CONFIG_CLK_KUNIT_TEST)	+= clk_test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
new file mode 100644
index 000000000000..8ddfd3b195e1
--- /dev/null
+++ b/drivers/clk/clk_test.c
@@ -0,0 +1,786 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for clk rate management
+ */
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/slab.h>
+
+/* Needed for clk_hw_create_clk() */
+#include "clk.h"
+
+#include <kunit/test.h>
+
+#define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+
+struct clk_dummy_context {
+	struct clk_hw hw;
+	unsigned long rate;
+};
+
+static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	return ctx->rate;
+}
+
+static int clk_dummy_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	/* Just return the same rate without modifying it */
+	return 0;
+}
+
+static int clk_dummy_maximize_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	/*
+	 * If there's a maximum set, always run the clock at the maximum
+	 * allowed.
+	 */
+	if (req->max_rate < ULONG_MAX)
+		req->rate = req->max_rate;
+
+	return 0;
+}
+
+static int clk_dummy_minimize_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	/*
+	 * If there's a minimum set, always run the clock at the minimum
+	 * allowed.
+	 */
+	if (req->min_rate > 0)
+		req->rate = req->min_rate;
+
+	return 0;
+}
+
+static int clk_dummy_set_rate(struct clk_hw *hw,
+			      unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	ctx->rate = rate;
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_rate_ops = {
+	.recalc_rate = clk_dummy_recalc_rate,
+	.determine_rate = clk_dummy_determine_rate,
+	.set_rate = clk_dummy_set_rate,
+};
+
+static const struct clk_ops clk_dummy_maximize_rate_ops = {
+	.recalc_rate = clk_dummy_recalc_rate,
+	.determine_rate = clk_dummy_maximize_rate,
+	.set_rate = clk_dummy_set_rate,
+};
+
+static const struct clk_ops clk_dummy_minimize_rate_ops = {
+	.recalc_rate = clk_dummy_recalc_rate,
+	.determine_rate = clk_dummy_minimize_rate,
+	.set_rate = clk_dummy_set_rate,
+};
+
+static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
+{
+	struct clk_dummy_context *ctx;
+	struct clk_init_data init = { };
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	ctx->rate = DUMMY_CLOCK_INIT_RATE;
+	test->priv = ctx;
+
+	init.name = "test_dummy_rate";
+	init.ops = ops;
+	ctx->hw.init = &init;
+
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int clk_test_init(struct kunit *test)
+{
+	return clk_test_init_with_ops(test, &clk_dummy_rate_ops);
+}
+
+static int clk_maximize_test_init(struct kunit *test)
+{
+	return clk_test_init_with_ops(test, &clk_dummy_maximize_rate_ops);
+}
+
+static int clk_minimize_test_init(struct kunit *test)
+{
+	return clk_test_init_with_ops(test, &clk_dummy_minimize_rate_ops);
+}
+
+static void clk_test_exit(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+}
+
+/*
+ * Test that the actual rate matches what is returned by clk_get_rate()
+ */
+static void clk_test_get_rate(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_EXPECT_EQ(test, rate, ctx->rate);
+}
+
+/*
+ * Test that, after a call to clk_set_rate(), the rate returned by
+ * clk_get_rate() matches.
+ *
+ * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
+ * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ */
+static void clk_test_set_get_rate(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_1),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+}
+
+/*
+ * Test that, after several calls to clk_set_rate(), the rate returned
+ * by clk_get_rate() matches the last one.
+ *
+ * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
+ * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ */
+static void clk_test_set_set_get_rate(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_1),
+			0);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
+/*
+ * Test that clk_round_rate and clk_set_rate are consitent and will
+ * return the same frequency.
+ */
+static void clk_test_round_set_get_rate(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rounded_rate, set_rate;
+
+	rounded_rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1);
+	KUNIT_ASSERT_GT(test, rounded_rate, 0);
+	KUNIT_EXPECT_EQ(test, rounded_rate, DUMMY_CLOCK_RATE_1);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_1),
+			0);
+
+	set_rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, set_rate, 0);
+	KUNIT_EXPECT_EQ(test, rounded_rate, set_rate);
+}
+
+static struct kunit_case clk_test_cases[] = {
+	KUNIT_CASE(clk_test_get_rate),
+	KUNIT_CASE(clk_test_set_get_rate),
+	KUNIT_CASE(clk_test_set_set_get_rate),
+	KUNIT_CASE(clk_test_round_set_get_rate),
+	{}
+};
+
+static struct kunit_suite clk_test_suite = {
+	.name = "clk-test",
+	.init = clk_test_init,
+	.exit = clk_test_exit,
+	.test_cases = clk_test_cases,
+};
+
+/*
+ * Test that clk_set_rate_range won't return an error for a valid range.
+ */
+static void clk_range_test_set_range(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
+/*
+ * Test that calling clk_set_rate_range with a minimum rate higher than
+ * the maximum rate returns an error.
+ */
+static void clk_range_test_set_range_invalid(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+
+	KUNIT_EXPECT_LT(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1 + 1000,
+					   DUMMY_CLOCK_RATE_1),
+			0);
+}
+
+/*
+ * Test that users can't set multiple, disjoints, range that would be
+ * impossible to meet.
+ */
+static void clk_range_test_multiple_disjoints_range(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *user1, *user2;
+
+	user1 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user1, 1000, 2000),
+			0);
+
+	KUNIT_EXPECT_LT(test,
+			clk_set_rate_range(user2, 3000, 4000),
+			0);
+
+	clk_put(user2);
+	clk_put(user1);
+}
+
+/*
+ * Test that if our clock has some boundaries and we try to round a rate
+ * lower than the minimum, the returned rate won't be affected by the
+ * boundaries.
+ */
+static void clk_range_test_set_range_round_rate_lower(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 - 1000);
+}
+
+/*
+ * Test that if our clock has some boundaries and we try to set a rate
+ * lower than the minimum, we'll get an error.
+ */
+static void clk_range_test_set_range_set_rate_lower(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	KUNIT_ASSERT_LT(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000),
+			0);
+}
+
+/*
+ * Test that if our clock has some boundaries and we try to round and
+ * set a rate lower than the minimum, the values won't be consistent
+ * between clk_round_rate() and clk_set_rate().
+ */
+static void clk_range_test_set_range_set_round_rate_consistent_lower(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	long rounded;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rounded = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_GT(test, rounded, 0);
+
+	KUNIT_EXPECT_LT(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000),
+			0);
+
+	KUNIT_EXPECT_NE(test, rounded, clk_get_rate(clk));
+}
+
+/*
+ * Test that if our clock has some boundaries and we try to round a rate
+ * higher than the maximum, the returned rate won't be affected by the
+ * boundaries.
+ */
+static void clk_range_test_set_range_round_rate_higher(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2 + 1000);
+}
+
+/*
+ * Test that if our clock has some boundaries and we try to set a rate
+ * lower than the maximum, we'll get an error.
+ */
+static void clk_range_test_set_range_set_rate_higher(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	KUNIT_ASSERT_LT(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
+			0);
+}
+
+/*
+ * Test that if our clock has some boundaries and we try to round and
+ * set a rate higher than the maximum, the values won't be consistent
+ * between clk_round_rate() and clk_set_rate().
+ */
+static void clk_range_test_set_range_set_round_rate_consistent_higher(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	long rounded;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rounded = clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_ASSERT_GT(test, rounded, 0);
+
+	KUNIT_EXPECT_LT(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
+			0);
+
+	KUNIT_EXPECT_NE(test, rounded, clk_get_rate(clk));
+}
+
+/*
+ * Test that if our clock has a rate lower than the minimum set by a
+ * call to clk_set_rate_range(), the rate will be raised to match the
+ * new minimum.
+ *
+ * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
+ * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ */
+static void clk_range_test_set_range_get_rate_raised(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000),
+			0);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+}
+
+/*
+ * Test that if our clock has a rate higher than the maximum set by a
+ * call to clk_set_rate_range(), the rate will be lowered to match the
+ * new maximum.
+ *
+ * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
+ * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ */
+static void clk_range_test_set_range_get_rate_lowered(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
+			0);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
+static struct kunit_case clk_range_test_cases[] = {
+	KUNIT_CASE(clk_range_test_set_range),
+	KUNIT_CASE(clk_range_test_set_range_invalid),
+	KUNIT_CASE(clk_range_test_multiple_disjoints_range),
+	KUNIT_CASE(clk_range_test_set_range_round_rate_lower),
+	KUNIT_CASE(clk_range_test_set_range_set_rate_lower),
+	KUNIT_CASE(clk_range_test_set_range_set_round_rate_consistent_lower),
+	KUNIT_CASE(clk_range_test_set_range_round_rate_higher),
+	KUNIT_CASE(clk_range_test_set_range_set_rate_higher),
+	KUNIT_CASE(clk_range_test_set_range_set_round_rate_consistent_higher),
+	KUNIT_CASE(clk_range_test_set_range_get_rate_raised),
+	KUNIT_CASE(clk_range_test_set_range_get_rate_lowered),
+	{}
+};
+
+static struct kunit_suite clk_range_test_suite = {
+	.name = "clk-range-test",
+	.init = clk_test_init,
+	.exit = clk_test_exit,
+	.test_cases = clk_range_test_cases,
+};
+
+/*
+ * Test that if:
+ * - we have several subsequent calls to clk_set_rate_range();
+ * - and we have a round_rate ops that always return the maximum
+ *   frequency allowed;
+ *
+ * The clock will run at the minimum of all maximum boundaries
+ * requested, even if those boundaries aren't there anymore.
+ */
+static void clk_range_test_set_range_rate_maximized(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
+			0);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2 - 1000),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
+/*
+ * Test that if:
+ * - we have several subsequent calls to clk_set_rate_range(), across
+ *   multiple users;
+ * - and we have a round_rate ops that always return the maximum
+ *   frequency allowed;
+ *
+ * The clock will run at the minimum of all maximum boundaries
+ * requested, even if those boundaries aren't there anymore.
+ */
+static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *user1, *user2;
+	unsigned long rate;
+
+	user1 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
+			0);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user1,
+					   0,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user2,
+					   0,
+					   DUMMY_CLOCK_RATE_1),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user2, 0, ULONG_MAX),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(user2);
+	clk_put(user1);
+}
+
+static struct kunit_case clk_range_maximize_test_cases[] = {
+	KUNIT_CASE(clk_range_test_set_range_rate_maximized),
+	KUNIT_CASE(clk_range_test_multiple_set_range_rate_maximized),
+	{}
+};
+
+static struct kunit_suite clk_range_maximize_test_suite = {
+	.name = "clk-range-maximize-test",
+	.init = clk_maximize_test_init,
+	.exit = clk_test_exit,
+	.test_cases = clk_range_maximize_test_cases,
+};
+
+/*
+ * Test that if:
+ * - we have several subsequent calls to clk_set_rate_range()
+ * - and we have a round_rate ops that always return the minimum
+ *   frequency allowed;
+ *
+ * The clock will run at the maximum of all minimum boundaries
+ * requested, even if those boundaries aren't there anymore.
+*/
+static void clk_range_test_set_range_rate_minimized(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000),
+			0);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1 + 1000,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+}
+
+/*
+ * Test that if:
+ * - we have several subsequent calls to clk_set_rate_range(), across
+ *   multiple users;
+ * - and we have a round_rate ops that always return the minimum
+ *   frequency allowed;
+ *
+ * The clock will run at the maximum of all minimum boundaries
+ * requested, even if those boundaries aren't there anymore.
+*/
+static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *user1, *user2;
+	unsigned long rate;
+
+	user1 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user1,
+					   DUMMY_CLOCK_RATE_1,
+					   ULONG_MAX),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user2,
+					   DUMMY_CLOCK_RATE_2,
+					   ULONG_MAX),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user2, 0, ULONG_MAX),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(user2);
+	clk_put(user1);
+}
+
+static struct kunit_case clk_range_minimize_test_cases[] = {
+	KUNIT_CASE(clk_range_test_set_range_rate_minimized),
+	KUNIT_CASE(clk_range_test_multiple_set_range_rate_minimized),
+	{}
+};
+
+static struct kunit_suite clk_range_minimize_test_suite = {
+	.name = "clk-range-minimize-test",
+	.init = clk_minimize_test_init,
+	.exit = clk_test_exit,
+	.test_cases = clk_range_minimize_test_cases,
+};
+
+kunit_test_suites(
+	&clk_test_suite,
+	&clk_range_test_suite,
+	&clk_range_maximize_test_suite,
+	&clk_range_minimize_test_suite
+);
+MODULE_LICENSE("GPL v2");
-- 
2.35.1


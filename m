Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A749B5D6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6374510E1E3;
	Tue, 25 Jan 2022 14:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7370F10E1AA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:15:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D128E5C00DC;
 Tue, 25 Jan 2022 09:15:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 25 Jan 2022 09:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=nREIhqoZleDeGagSe7XkSIBunQrqkQ
 PRNewSgQFCnok=; b=XTw2oXIhKnyKGZYDbA+Ta7uqmAXh4fko/hmHKdLEn/EdWe
 AGaLpMwGlaCLEAPiVFiOkexe+I1W/jh4eU6RBVh9iOT3lEewAEdNghAtkFQuoIM1
 wFdboE+zSPgcOl1uZd5xugpLiQhv43l98aC8CtY990NOG60LQeeH1gXjrOmKp614
 sVXuYwEkBsBHl+e62CqM2c3xdO2+WYwj23r/FVnKhHeCz+phcIE7ZFQxwgyNHwrV
 ynvq3Ui6xkSlQOKNo58ZizBFPPUQPcNTUMuAcPssALiHuzAkmqBnSyxwIvZfiylR
 VDG5UYvd8sUiy+LMuIi0IvPkPcO2XM0zTLvgXdWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nREIhq
 oZleDeGagSe7XkSIBunQrqkQPRNewSgQFCnok=; b=RXulAvu98C4oB52VB0Yty4
 2oG/QK+9G+eknGdTA971qg6sXM1p4FaoqcZVllcIkF+3CBrVQ7l6pqoYYy4SVWJB
 Y8IuAA4ei+xwJJnaqMiiKkXKB/qUbhjk6pMq0AVxkmh6eDT6Uy5uQPiVgxHUayFZ
 0vxhZ5hpEAYnkgVZ+Vz0zkiGnkis3yrcUtUkvkuW69+NKXsyWIXzh94swQti9WA3
 ldjHff3Tq+7rgT2vzWnzinYEH+agh2fiWRt0+82kX+MiBODiPTT+FIx5ExuMHYf4
 nZuV9Ui3U+nD23bUUQ/4y8Svf5T1cFW7MeP6z2hd54oisXLhWkmRrPuXJWa7k+dw
 ==
X-ME-Sender: <xms:GwbwYTMdDyjkFbD7qaVI2B7PQV-0GMBul4vuxCnSe2rQBeCOy9JMKQ>
 <xme:GwbwYd9cpQ9eUdporV6OJ6DVcxK4uG9Z3SIS8zlbbap5GFl07LYuWQfsXVL5SKniV
 4lhiKKuwju4QhoO4Tg>
X-ME-Received: <xmr:GwbwYSQ9zTGc_8YBlc5Q3njPHDcdBEOJ5pYYxfRaq-OADKZ8XxiI7T9pdRIPDcLWbh9a6fbjj3q14wEYFm2A23O6fFhoYq8gqRedG2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GwbwYXvMZHPQwhXWGaI3avocGfbW3uPrPJQfwnS8lFLUtAKErXYbuQ>
 <xmx:GwbwYbdWSRmky2X2l8LjuqRXc2NVtMY4mfBI9lf22d1mrbiArwc_WQ>
 <xmx:GwbwYT3yvMto2G_wPuWUCKROyHDm692SrZlI20QHFIgvBAN8wOgS4w>
 <xmx:GwbwYay2lavabZmNSs3A7vIDfhMRZI1ElwC_idOwmQdql-v1nKLmYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:15:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 01/10] clk: Introduce Kunit Tests for the framework
Date: Tue, 25 Jan 2022 15:15:40 +0100
Message-Id: <20220125141549.747889-2-maxime@cerno.tech>
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
 drivers/clk/clk-test.c   | 285 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 294 insertions(+)
 create mode 100644 drivers/clk/clk-test.c

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
index 6a98291350b6..2664aaab8068 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -2,6 +2,7 @@
 # common clock types
 obj-$(CONFIG_HAVE_CLK)		+= clk-devres.o clk-bulk.o clkdev.o
 obj-$(CONFIG_COMMON_CLK)	+= clk.o
+obj-$(CONFIG_CLK_KUNIT_TEST)	+= clk-test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
diff --git a/drivers/clk/clk-test.c b/drivers/clk/clk-test.c
new file mode 100644
index 000000000000..47a600d590c1
--- /dev/null
+++ b/drivers/clk/clk-test.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for clk rate management
+ */
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/slab.h>
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
+static const struct clk_ops clk_dummy_ops = {
+	.recalc_rate = clk_dummy_recalc_rate,
+	.determine_rate = clk_dummy_determine_rate,
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
+	return clk_test_init_with_ops(test, &clk_dummy_ops);
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
+static struct kunit_case clk_test_cases[] = {
+	KUNIT_CASE(clk_test_get_rate),
+	KUNIT_CASE(clk_test_set_get_rate),
+	KUNIT_CASE(clk_test_set_set_get_rate),
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
+kunit_test_suites(
+	&clk_test_suite,
+	&clk_range_test_suite,
+);
+MODULE_LICENSE("GPL v2");
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90D4C10C3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 11:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D5F10E69F;
	Wed, 23 Feb 2022 10:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5771F10E650
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:56:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B4B045C00D1;
 Wed, 23 Feb 2022 05:56:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 23 Feb 2022 05:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=MADXpNEmcgM825sWUH2zcZ+W4Mq81Z
 xLyIMcoQ/aV/M=; b=DZuW4FK+eRXEdpsTRqIk2Z+6N/52dMwTnRpjUk62HfCWW+
 GpxvTyzWH4mE4O9CnFidV71EcSpftMswQPV4akbvT+vwAyXrKgbM7SHgzQzau0Lp
 Vn7+ZLk3QW0mVt4J3Z5XCkChk+aUlvOtGG7UK5VOSDOefKCaRDiQjIQIdyA7c8E+
 +21gvVd/0YdDCiCTWxOGSuX6VJ0uuNulr518z3iByria3zkEMi1T3mcXUr/FBC7m
 H4qE3Qv77xBgHusezubwfGmDGAwJFZ2w+JaCielEt4t3EuZ9eqqLLXNomns9FctJ
 yIEYmrASTRmKhQ2SLQtjGcdQMZ8QWAhLVoV40tuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MADXpN
 EmcgM825sWUH2zcZ+W4Mq81ZxLyIMcoQ/aV/M=; b=FsqqovZ99lpHH2Jq11bXTc
 w1pIKFnlji+0/KKFT3D7QNWq28LF/opXHYoqljMbBF7W0T3KYczYCW0aoIvJt8Tm
 SgaNmOU8VujUh5GdJEOVppHjC/Ei/2kFheWDQHZ6uBO6C1THXF0Q+hFXuwA+sPAq
 l4/x6BaS5bzwplrVrquLSUNzhEqmFykmIDqW+eT7b0V4bdrHcWML/7NDzKKhfpd5
 zTxo3x8/v0QLREceBeq/RcNCeOJ3BcapaaVkV9E5oBM95Zp0QDHBzubBRmi9Ffv1
 QmxNp+R/Z5gn6wwL7u5C6xvF4dtNMxudvZn5hQgLUkCfsiunwzqVlpSqBPUlQ5oQ
 ==
X-ME-Sender: <xms:yRIWYtmBSCYEgZi3lf4ZeUmHipSjW1YzsUWzMXxGH_wD_l-Ib5uBlA>
 <xme:yRIWYo1biptfngSUhwDKSecgLINptNH2g2581NEIMTueMToY2urf6r2GQB9gPIaRP
 eGcgq40MF7x2QZqlQ4>
X-ME-Received: <xmr:yRIWYjoBhisdM0VHS_no3WGYIK4JEd4Zjr2bBn9EoR9nxlCCQgd10cvjRXwyUUpHCOb3YQWhGzrlQ7rCd9BfowfTnaBnVnNTFfQ1eAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yRIWYtkNhJ_FOZQ0gMdYinLR39z_8PyuV6OJoEtAI_dGsFbeRryNow>
 <xmx:yRIWYr2f-r0fNV_XQQt8BUnx-OzMnQcqyvbhENixtJB43X9_cN-Zcw>
 <xmx:yRIWYsttXLjtTZf7eFBRplgyAMOiHy9trgEdv0EcrrqzBNkHH-Fupw>
 <xmx:yRIWYkKs_57ZfrRXrv2-JuTWSm0ioV1HVL-0LYLD6XgM_Hjydx1Qjg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:08 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
Date: Wed, 23 Feb 2022 11:55:50 +0100
Message-Id: <20220223105600.1132593-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
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
index 000000000000..0ca6cd391c8e
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
+/* Needed for clk_hw_get_clk() */
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
+	user1 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_get_clk(hw, NULL);
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
+	user1 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_get_clk(hw, NULL);
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
+	user1 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_get_clk(hw, NULL);
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


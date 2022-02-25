Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD134C479D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E4710E613;
	Fri, 25 Feb 2022 14:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBF110E5EC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:35:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AAAFA5800EA;
 Fri, 25 Feb 2022 09:35:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 25 Feb 2022 09:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=TjWBLp44/a74ZYAPKL0uGoVhOb4wPh
 BcemNhAOwg1jg=; b=Qof48OsRUJs2oZNax0ykhhM18EPF7pnCak8NgEiEUkkIfr
 b6neREdeBbkFL2ZyJW0RtnnGkaz9QrEC7PVhw0IoTgxNwoKyZEGoRXIpzrY5/HOr
 zGV/x4x3rPTK/YINsauT39SWIzNN2riIMrzUC+xKZZ9MaAD6v2YENu3Ra2s4zJwI
 I25SfOMj/8No4hcthK3tEM5iU09O8QzntK3DKvTrRByxVApFBneyNpIk8R5HuVjm
 /SKC5HFWEBZhb1O57JAdHqEhIYpgYRu2u8M3G/WCjwHjEFeoaneqgl0WhTL3vm+e
 JC4XrJeUmTXkPZBGmXsqElOEIY+GgvFpNyptgsRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TjWBLp
 44/a74ZYAPKL0uGoVhOb4wPhBcemNhAOwg1jg=; b=GzGIcCQ988+mVQYRdkB8hE
 1RnRc/jQNtMkOPgAjAb34K76ZwsoQgxCEc/jXNgu3ynKNYcGte5EaUlxrCjnelE9
 ixpSbXQbXv8BjEuUalXAh8qyMmpCV9FtRbYee5IzM+/t3ojPTD+/we3t4dMrWv7A
 VBW9WBLcU71oLU5OXfwGSW1IIY9AcrcnhbOt5fr+7whzgwG/yCYZbwTtdaRquQUz
 U8mIeUA0FYqP0wVqAeq/sTtYsaGKF7TLCy3xubTCNul0ikug3XTxyB3L5nIuejDp
 LLoGUvHyokpfa1xL7V6G8mkFD5bTn4rgUtdoQu+sehOFL6/26ZFesJjSrZinfy5A
 ==
X-ME-Sender: <xms:POkYYhhTfg2kC_2ZeqUcDK_YMV-NI706iKYGNHKgoNCp2t8AtBKm3A>
 <xme:POkYYmANh--opcKMzqgk-wLD_v1BqylgD7_j9y_IX5IhIlwQAVy7V56w0-59hJPub
 p3P5fX-1f9MH0Drc9U>
X-ME-Received: <xmr:POkYYhFKZd50X5EyXaHquNf9xCyAvRgkdeQytpyUjovvrLffFkbnSUv5sya_9zWQ5mPR4fiY9AfvK2__LEsHlnw4UbeZfi0DX4l3bLM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:POkYYmQ7O_xutYdMhZVmAlX4wk3bdM8EXWn_xgvTyulBbmJPjyxYeQ>
 <xmx:POkYYuzlB1Fl3vpSrv65KRMRMYQ2mx9avuRrw4Knhr0UybGIHpNmQg>
 <xmx:POkYYs6JZbeMsiPLRdwT3uxIM3yk2yLJkUbyPoOHLQQA8edopWVy6Q>
 <xmx:POkYYif95QcQNYHppY3O1jHIcRpdaAd8cRQqiFlDKWSD0QpgeTBTUQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:39 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 02/12] clk: Introduce Kunit Tests for the framework
Date: Fri, 25 Feb 2022 15:35:24 +0100
Message-Id: <20220225143534.405820-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
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
 Daniel Latypov <dlatypov@google.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Maxime Ripard <maxime@cerno.tech>,
 linux-clk@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's test various parts of the rate-related clock API with the kunit
testing framework.

Cc: kunit-dev@googlegroups.com
Tested-by: Daniel Latypov <dlatypov@google.com>
Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/.kunitconfig |   1 +
 drivers/clk/Kconfig      |   7 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk_test.c   | 787 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 796 insertions(+)
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
index 000000000000..a8d7eba01de7
--- /dev/null
+++ b/drivers/clk/clk_test.c
@@ -0,0 +1,787 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for clk rate management
+ */
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
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
+				    struct clk_rate_request *req)
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
+	KUNIT_ASSERT_GT(test, rate, 0);
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
+ * Test that clk_set_rate_range won't return an error for a valid range
+ * and that it will make sure the rate of the clock is within the
+ * boundaries.
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


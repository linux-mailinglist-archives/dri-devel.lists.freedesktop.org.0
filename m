Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A66495037
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430BE10E3BD;
	Thu, 20 Jan 2022 14:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DC310E38E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:34:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 99B2E3200F72;
 Thu, 20 Jan 2022 09:34:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 20 Jan 2022 09:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=sWAv3eZY6aQ/LPuuw58EKtB9eHnmjM
 eITOS3f7DDHKM=; b=k6x13/EpdINDSIks61eyXAGKDPj9e1qFDA97KO8gCh+5y8
 ijxj+5k9mccgfh4RwGk7TtjKuUNcl/4CbAIauxRYSmjBT30fZ0O4D5zo4NEtabvc
 QAtP055DMCg0CpL14kCzPqWe5GANvD1/whTWcrL919z/ZjpFEOAaiN/ZWl1mvZLj
 2hI7l5myCt9dWueaEDcFuLu9zTiAmjJfHtdVDKf6ikaWbWp11E0sGXb2SHLETCeO
 cenSH5OAYO4WmQrNHApAhT14mTsPL0xLOjpqot1Ynr2k0PiACmgsR50RhpyHAT3o
 N4T/HJc/mzSE0ElCjIVTJVn+BT4nN9qOFMtgazHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sWAv3e
 ZY6aQ/LPuuw58EKtB9eHnmjMeITOS3f7DDHKM=; b=VM7bCc/1+daohl1lqkBa5D
 OxHy8ecIqPHFQOWSAEUszzoe11betpFZxplH1A6ULgaSbwBFvUJUz69I8WBm+giS
 qqWscZoaC+PO3l7zNNpkvEchVQJnuUKROGkwcKPtEJ074RttiD4C+InbBQYiKjFO
 vXlQ+kKQ0LELHKXt4ggNiJSlDBHRwcCx+iMgXXYEmX5/Wef44whMHZoCGo3Py7Xm
 oZaqNrXH8e1Ny2uz2Q3gZuLOrzDZFO0cgIV9FCLU+qc5SaWI3bNTsb0Td3Lz+vp5
 mNn7Zgt5CirH1/nvEJdPrkZ6mdC7+5zdgfQZktaeeI6fWoDkp9C8fYW1h2QD1arA
 ==
X-ME-Sender: <xms:73LpYZaLu3hd8z6dLZqVYF_y1T4HZZRXVSTSoAiKG6zU0pwXryPsvA>
 <xme:73LpYQZPgfHoKLbI0redV_vPCxUFSELdwuxZ9GrJeAtB1han4nFEhTXEVS-ra94YW
 Ip1YLfOVudfhWwlwAY>
X-ME-Received: <xmr:73LpYb9h9gUuRd87dusUpQp1s17VfZ7duGQ1KaX81HxvJp8UZSs6i9XzVtwIHZnRwoRxfvogwrK56EtHg9DdSSzY7RL5tCbiBvdln18>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:73LpYXqksOhawK9vSoOkNyUHdBDKWU5LmC2tF6e7AwnDjnTe_91djQ>
 <xmx:73LpYUpot2_dI6cu5IqQI9ngb1By6OSQR3tXKI9ahKDipBWU2ppgVQ>
 <xmx:73LpYdR_6Cl17M1cX05Vrlhwp9S2ccgWnNdkQSNivde5k_l7MdNIyg>
 <xmx:8HLpYQc4jZJPcm2_t7OiQpOjcZHzqNNZXoAnjuge2H9EyKhQLqTANg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 01/10] clk: Add Kunit tests for rate
Date: Thu, 20 Jan 2022 15:34:08 +0100
Message-Id: <20220120143417.543744-2-maxime@cerno.tech>
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
 drivers/clk/Kconfig         |   7 +
 drivers/clk/Makefile        |   1 +
 drivers/clk/clk-rate-test.c | 278 ++++++++++++++++++++++++++++++++++++
 3 files changed, 286 insertions(+)
 create mode 100644 drivers/clk/clk-rate-test.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index f5807d190ba2..7ae48a91f738 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -436,4 +436,11 @@ config CLK_GATE_TEST
 	help
 	  Kunit test for the basic clk gate type.
 
+config CLK_RATE_TEST
+	tristate "Basic Core Rate Kunit Tests"
+	depends on KUNIT
+	default KUNIT
+	help
+	  Kunit test for the basic clock rate management.
+
 endif
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b940c6d35922..0238a595167a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -2,6 +2,7 @@
 # common clock types
 obj-$(CONFIG_HAVE_CLK)		+= clk-devres.o clk-bulk.o clkdev.o
 obj-$(CONFIG_COMMON_CLK)	+= clk.o
+obj-$(CONFIG_CLK_RATE_TEST)	+= clk-rate-test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
diff --git a/drivers/clk/clk-rate-test.c b/drivers/clk/clk-rate-test.c
new file mode 100644
index 000000000000..f2d3df791b5a
--- /dev/null
+++ b/drivers/clk/clk-rate-test.c
@@ -0,0 +1,278 @@
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
+struct clk_dummy_rate_context {
+	struct clk_hw hw;
+	unsigned long rate;
+};
+
+static unsigned long clk_dummy_rate_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_dummy_rate_context *ctx =
+		container_of(hw, struct clk_dummy_rate_context, hw);
+
+	return ctx->rate;
+}
+
+static int clk_dummy_rate_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	/* Just return the same rate without modifying it */
+	return 0;
+}
+
+static int clk_dummy_rate_set_rate(struct clk_hw *hw,
+				   unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct clk_dummy_rate_context *ctx =
+		container_of(hw, struct clk_dummy_rate_context, hw);
+
+	ctx->rate = rate;
+	return 0;
+}
+
+const static struct clk_ops clk_dummy_rate_ops = {
+	.recalc_rate = clk_dummy_rate_recalc_rate,
+	.determine_rate = clk_dummy_rate_determine_rate,
+	.set_rate = clk_dummy_rate_set_rate,
+};
+
+static int clk_rate_test_init_with_ops(struct kunit *test,
+				       const struct clk_ops *ops)
+{
+	struct clk_dummy_rate_context *ctx;
+	struct clk_init_data init = { };
+	int ret;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
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
+static int clk_rate_test_init(struct kunit *test)
+{
+	return clk_rate_test_init_with_ops(test, &clk_dummy_rate_ops);
+}
+
+static void clk_rate_test_exit(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	kfree(ctx);
+}
+
+/*
+ * Test that the actual rate matches what is returned by clk_get_rate()
+ */
+static void clk_rate_test_get_rate(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, ctx->rate);
+}
+
+/*
+ * Test that, after a call to clk_set_rate(), the rate returned by
+ * clk_get_rate() matches.
+ *
+ * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
+ * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ */
+static void clk_rate_test_set_get_rate(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+	int ret;
+
+	ret = clk_set_rate(clk, DUMMY_CLOCK_RATE_1);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+}
+
+/*
+ * Test that, after several calls to clk_set_rate(), the rate returned
+ * by clk_get_rate() matches the last one.
+ *
+ * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
+ * modify the requested rate, which is our case in clk_dummy_rate_ops.
+ */
+static void clk_rate_test_set_set_get_rate(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+	int ret;
+
+	ret = clk_set_rate(clk, DUMMY_CLOCK_RATE_1);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(clk, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
+static struct kunit_case clk_rate_test_cases[] = {
+	KUNIT_CASE(clk_rate_test_get_rate),
+	KUNIT_CASE(clk_rate_test_set_get_rate),
+	KUNIT_CASE(clk_rate_test_set_set_get_rate),
+	{}
+};
+
+static struct kunit_suite clk_rate_test_suite = {
+	.name = "clk-rate-test",
+	.init = clk_rate_test_init,
+	.exit = clk_rate_test_exit,
+	.test_cases = clk_rate_test_cases,
+};
+
+/*
+ * Test that clk_set_rate_range won't return an error for a valid range.
+ */
+static void clk_rate_range_test_set_range(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	int ret;
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+}
+
+/*
+ * Test that calling clk_set_rate_range with a minimum rate higher than
+ * the maximum rate returns an error.
+ */
+static void clk_rate_range_test_set_range_invalid(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	int ret;
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1 + 1000,
+				 DUMMY_CLOCK_RATE_1);
+	KUNIT_ASSERT_EQ(test, ret, -EINVAL);
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
+static void clk_rate_range_test_set_range_get_rate_raised(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+	int ret;
+
+	ret = clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
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
+static void clk_rate_range_test_set_range_get_rate_lowered(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+	int ret;
+
+	ret = clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
+static struct kunit_case clk_rate_range_test_cases[] = {
+	KUNIT_CASE(clk_rate_range_test_set_range),
+	KUNIT_CASE(clk_rate_range_test_set_range_invalid),
+	KUNIT_CASE(clk_rate_range_test_set_range_get_rate_raised),
+	KUNIT_CASE(clk_rate_range_test_set_range_get_rate_lowered),
+	{}
+};
+
+static struct kunit_suite clk_rate_range_test_suite = {
+	.name = "clk-rate-range-test",
+	.init = clk_rate_test_init,
+	.exit = clk_rate_test_exit,
+	.test_cases = clk_rate_range_test_cases,
+};
+
+kunit_test_suites(
+	&clk_rate_test_suite,
+	&clk_rate_range_test_suite
+);
+MODULE_LICENSE("GPL v2");
-- 
2.34.1


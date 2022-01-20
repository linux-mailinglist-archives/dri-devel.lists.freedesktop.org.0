Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F39495039
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5363C89A5D;
	Thu, 20 Jan 2022 14:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848F688AC2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:34:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7120E3200F72;
 Thu, 20 Jan 2022 09:34:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 20 Jan 2022 09:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=W8hr1nFlSh9LJQw20ykgM5B1LPkQ/l
 gQ3muUlO5rzKM=; b=cYXBNXgp532PtfIx+524Tw47gHwQ3fv3n93+4qMMd8An2O
 x+Cc38iGRTVclAUn5TQzheadfGaKBXSSrvWaAWH3h9gxuSEKHnhCPipyNYldfChh
 7KHcSz0Le/JLLvRVCMkhTu07muSw9+zlc1uU7UxddzkgqMe3TZR50Q9SEXVZ2QTq
 mC+2coaINwsR8IreUiLlCoxi1FWELVO/QdQds8dD+OAc1MjIPaI5tcJGbT6qQrAO
 XnFw4lWS0nTmbIqTJtoiOf/O0OpX2Qf0AqsvltNHAtWVJvGi8j+D8TQXMSzsuqrG
 ncO6hDwfLEGiNwS1mPRZzO7ypfZsOY5MnY2WxJOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=W8hr1n
 FlSh9LJQw20ykgM5B1LPkQ/lgQ3muUlO5rzKM=; b=f27Yc1HepVZw1I/U62Y9MH
 Ko257sCX2KufwgPR3I5YqHL2ly9o6q7IyBPfBWc7gBE25pkrsYWexCl5ubxb82RK
 1zSQjsWK/0SeRSYp9Y6VKM/lVgJ0/9SMv8sfZuf+l8faHBbuWyPs+dodLbPRaa6K
 RZNpXB1HuSn02/2kofAnHxiexKMP0R8SaFoINjCO3e4idNFslRsb6MOU5gMduM3g
 16qM/a9+x2eb1EDbrUpVyse7T2ISn4FODmTEznAiMamIdu2zVI8Gd3tlXM4McsmV
 ndS7Z5FmZRhEkgmY82Q9x0oRYyk4qsqcnQ6efKtQByd4WQbY+wXQt51+PAPYmtJA
 ==
X-ME-Sender: <xms:-nLpYcDHKrzBRpegxGuJeit-uoAH1Pqan3GSu_nyVAa6tI9Vnm5VZw>
 <xme:-nLpYeioo3rFKx7GazdKH7rzscE461ns5voJzYTuF4B3xP7o87BDPIvw7UcJjC275
 4nNE_Y9bxnX6K_3lfE>
X-ME-Received: <xmr:-nLpYfmyrx5bLdaiH5eNg9xZOs8tsGSUN6CRqTYzRQFlvvnPeMC2FfSY3GSNxb-INVBrqgNFNU9ocSoymuMwOcOFRChyVaSK52Ag9aA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-nLpYSxWChylBd6MajuUZ7DgJ-wBvviceGnuoOurKqmJHzm896dZ7Q>
 <xmx:-nLpYRT9pQ41xEuav1necwW7kt-QImpvJWomCQllWtxInw8999Q9-Q>
 <xmx:-nLpYdZVY4XNXpKtlfVdlk7ccdKEnqbcITNR_oGWTZTqfejeO55K4g>
 <xmx:-3LpYSQ9aeYqZ6tybcO_Z0B0b1BgnnWK8MwhL7PJQgZPLexBm5xgsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 04/10] clk: Always set the rate on clk_set_range_rate
Date: Thu, 20 Jan 2022 15:34:11 +0100
Message-Id: <20220120143417.543744-5-maxime@cerno.tech>
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

When we change a clock minimum or maximum using clk_set_rate_range(),
clk_set_min_rate() or clk_set_max_rate(), the current code will only
trigger a new rate change if the rate is outside of the new boundaries.

However, a clock driver might want to always keep the clock rate to
one of its boundary, for example the minimum to keep the power
consumption as low as possible.

Since they don't always get called though, clock providers don't have the
opportunity to implement this behaviour.

Let's trigger a clk_set_rate() on the previous requested rate every time
clk_set_rate_range() is called. That way, providers that care about the
new boundaries have a chance to adjust the rate, while providers that
don't care about those new boundaries will return the same rate than
before, which will be ignored by clk_set_rate() and won't result in a
new rate change.

Also add a few new test cases to make sure that behaviour is not broken
in the future.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-rate-test.c | 281 +++++++++++++++++++++++++++++++++++-
 drivers/clk/clk.c           |  45 +++---
 2 files changed, 303 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/clk-rate-test.c b/drivers/clk/clk-rate-test.c
index a13b02702d20..baf0ea315322 100644
--- a/drivers/clk/clk-rate-test.c
+++ b/drivers/clk/clk-rate-test.c
@@ -6,6 +6,9 @@
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 
+/* Needed for clk_hw_create_clk() */
+#include "clk.h"
+
 #include <kunit/test.h>
 
 #define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
@@ -33,6 +36,32 @@ static int clk_dummy_rate_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_dummy_rate_maximize_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
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
+static int clk_dummy_rate_minimize_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
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
 static int clk_dummy_rate_set_rate(struct clk_hw *hw,
 				   unsigned long rate,
 				   unsigned long parent_rate)
@@ -50,6 +79,18 @@ const static struct clk_ops clk_dummy_rate_ops = {
 	.set_rate = clk_dummy_rate_set_rate,
 };
 
+const static struct clk_ops clk_dummy_maximize_rate_ops = {
+	.recalc_rate = clk_dummy_rate_recalc_rate,
+	.determine_rate = clk_dummy_rate_maximize_rate,
+	.set_rate = clk_dummy_rate_set_rate,
+};
+
+const static struct clk_ops clk_dummy_minimize_rate_ops = {
+	.recalc_rate = clk_dummy_rate_recalc_rate,
+	.determine_rate = clk_dummy_rate_minimize_rate,
+	.set_rate = clk_dummy_rate_set_rate,
+};
+
 static int clk_rate_test_init_with_ops(struct kunit *test,
 				       const struct clk_ops *ops)
 {
@@ -79,6 +120,16 @@ static int clk_rate_test_init(struct kunit *test)
 	return clk_rate_test_init_with_ops(test, &clk_dummy_rate_ops);
 }
 
+static int clk_rate_maximize_test_init(struct kunit *test)
+{
+	return clk_rate_test_init_with_ops(test, &clk_dummy_maximize_rate_ops);
+}
+
+static int clk_rate_minimize_test_init(struct kunit *test)
+{
+	return clk_rate_test_init_with_ops(test, &clk_dummy_minimize_rate_ops);
+}
+
 static void clk_rate_test_exit(struct kunit *test)
 {
 	struct clk_dummy_rate_context *ctx = test->priv;
@@ -317,8 +368,236 @@ static struct kunit_suite clk_rate_range_test_suite = {
 	.test_cases = clk_rate_range_test_cases,
 };
 
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), the core will reevaluate whether a new rate is
+ * needed each and every time.
+ *
+ * With clk_dummy_maximize_rate_ops, this means that the the rate will
+ * trail along the maximum as it evolves.
+ */
+static void clk_rate_range_test_set_range_rate_maximized(struct kunit *test)
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
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1,
+				 DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
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
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed each and every time.
+ *
+ * With clk_dummy_maximize_rate_ops, this means that the the rate will
+ * trail along the maximum as it evolves.
+ */
+static void clk_rate_range_test_multiple_set_range_rate_maximized(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *user1, *user2;
+	unsigned long rate;
+	int ret;
+
+	user1 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(user1));
+
+	user2 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(user2));
+
+	ret = clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(user1,
+				 0,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	ret = clk_set_rate_range(user2,
+				 0,
+				 DUMMY_CLOCK_RATE_1);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	ret = clk_set_rate_range(user2, 0, ULONG_MAX);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(user2);
+	clk_put(user1);
+}
+
+static struct kunit_case clk_rate_range_maximize_test_cases[] = {
+	KUNIT_CASE(clk_rate_range_test_set_range_rate_maximized),
+	KUNIT_CASE(clk_rate_range_test_multiple_set_range_rate_maximized),
+	{}
+};
+
+static struct kunit_suite clk_rate_range_maximize_test_suite = {
+	.name = "clk-rate-range-maximize-test",
+	.init = clk_rate_maximize_test_init,
+	.exit = clk_rate_test_exit,
+	.test_cases = clk_rate_range_maximize_test_cases,
+};
+
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), the core will reevaluate whether a new rate is
+ * needed each and every time.
+ *
+ * With clk_dummy_minimize_rate_ops, this means that the the rate will
+ * trail along the minimum as it evolves.
+ */
+static void clk_rate_range_test_set_range_rate_minimized(struct kunit *test)
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
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1 + 1000,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
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
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed each and every time.
+ *
+ * With clk_dummy_minimize_rate_ops, this means that the the rate will
+ * trail along the minimum as it evolves.
+ */
+static void clk_rate_range_test_multiple_set_range_rate_minimized(struct kunit *test)
+{
+	struct clk_dummy_rate_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *user1, *user2;
+	unsigned long rate;
+	int ret;
+
+	user1 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(user1));
+
+	user2 = clk_hw_create_clk(NULL, hw, NULL, NULL);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(user2));
+
+	ret = clk_set_rate_range(user1,
+				 DUMMY_CLOCK_RATE_1,
+				 ULONG_MAX);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	ret = clk_set_rate_range(user2,
+				 DUMMY_CLOCK_RATE_2,
+				 ULONG_MAX);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	ret = clk_set_rate_range(user2, 0, ULONG_MAX);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_TRUE(test, rate > 0);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(user2);
+	clk_put(user1);
+}
+
+static struct kunit_case clk_rate_range_minimize_test_cases[] = {
+	KUNIT_CASE(clk_rate_range_test_set_range_rate_minimized),
+	KUNIT_CASE(clk_rate_range_test_multiple_set_range_rate_minimized),
+	{}
+};
+
+static struct kunit_suite clk_rate_range_minimize_test_suite = {
+	.name = "clk-rate-range-minimize-test",
+	.init = clk_rate_minimize_test_init,
+	.exit = clk_rate_test_exit,
+	.test_cases = clk_rate_range_minimize_test_cases,
+};
+
 kunit_test_suites(
 	&clk_rate_test_suite,
-	&clk_rate_range_test_suite
+	&clk_rate_range_test_suite,
+	&clk_rate_range_maximize_test_suite,
+	&clk_rate_range_minimize_test_suite
 );
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 150d1bc0985b..718cab23f706 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2350,28 +2350,29 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 	clk->min_rate = min;
 	clk->max_rate = max;
 
-	rate = clk_core_get_rate_nolock(clk->core);
-	if (rate < min || rate > max) {
-		/*
-		 * FIXME:
-		 * We are in bit of trouble here, current rate is outside the
-		 * the requested range. We are going try to request appropriate
-		 * range boundary but there is a catch. It may fail for the
-		 * usual reason (clock broken, clock protected, etc) but also
-		 * because:
-		 * - round_rate() was not favorable and fell on the wrong
-		 *   side of the boundary
-		 * - the determine_rate() callback does not really check for
-		 *   this corner case when determining the rate
-		 */
-
-		rate = clamp(clk->core->req_rate, min, max);
-		ret = clk_core_set_rate_nolock(clk->core, rate);
-		if (ret) {
-			/* rollback the changes */
-			clk->min_rate = old_min;
-			clk->max_rate = old_max;
-		}
+	/*
+	 * Since the boundaries have been changed, let's give the
+	 * opportunity to the provider to adjust the clock rate based on
+	 * the new boundaries.
+	 *
+	 * We also need to handle the case where the clock is currently
+	 * outside of the boundaries. Clamping the last requested rate
+	 * to the current minimum and maximum will also handle this.
+	 *
+	 * FIXME:
+	 * There is a catch. It may fail for the usual reason (clock
+	 * broken, clock protected, etc) but also because:
+	 * - round_rate() was not favorable and fell on the wrong
+	 *   side of the boundary
+	 * - the determine_rate() callback does not really check for
+	 *   this corner case when determining the rate
+	 */
+	rate = clamp(clk->core->req_rate, min, max);
+	ret = clk_core_set_rate_nolock(clk->core, rate);
+	if (ret) {
+		/* rollback the changes */
+		clk->min_rate = old_min;
+		clk->max_rate = old_max;
 	}
 
 	if (clk->exclusive_count)
-- 
2.34.1


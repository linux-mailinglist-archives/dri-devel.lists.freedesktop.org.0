Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB649B5D8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE4D10E44F;
	Tue, 25 Jan 2022 14:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E99C10E431
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:16:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EBE805C0110;
 Tue, 25 Jan 2022 09:16:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Jan 2022 09:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=+kAQe0LLMOBmS7FPWGQVPl8TfMLESz
 AQ0rHAHCLKLBs=; b=P+ShhI9s7Mw5Hnn7Qu0pyol/EAv9bqA3kYA6pB4iZS6DSY
 lX3L3mKPHWTHvUBB7zL9MlF0bZ1RJoH3iOO2MZEafP454SwlYXfHfp7cXkm6mfDG
 Nv1/wThu3scMn8BOBoQdIE1WYqW0MzAY7Nb7TtSrSf8UcocQ63M9tEzk+jHrFzKw
 qrsrpJQAvQEQjnipUdpF5aLktXOCpRxa/jP7staki05BE0orQKqOYYxNIbMDqQFo
 obA9jMcSJIJQR8dNkG3Aee6jOnHjXfZKj7oh9DD2VqZBQlHMtcHyEKmzF1+DuNgG
 bpDO79PoPkycNUJQ3/5nLh2Rf1NBycRK9LESI7Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+kAQe0
 LLMOBmS7FPWGQVPl8TfMLESzAQ0rHAHCLKLBs=; b=GcuRKBF1d37s40ZeLs+tmw
 u2Gu7lE8NYoJFYPbWI7dx9xN4zK3MPjWm+BFikj/5A+VOVX9scsQFYgIuCjtDerZ
 4dkV2N1QvVIbl938kS+/Dxm3L/V26bJb/df46d7uuSW3um8MIp3y+QP3/lli8YEr
 suQmkApIINLWi0OtRbDJ86/ld5wtXaztTrhOwoKQzTQkXfyYFDeuoIhyOrCLBIom
 7JoPGijlBQTGPxZ6iPFBlu4yz6CsoITwRXJ7iUcHsbQRahNG4Vn7ZEP1gcRKYXHB
 I6A2Gs1wVoGaDM4oajv8XeeD17AGJqyK6U5yfIQkH15h7JaPKArreVhYE78wJZIg
 ==
X-ME-Sender: <xms:IQbwYenUW8XPz7MCc6Tmprqc3vwLI9yB3EQVeHpAKXMSyRd0InQCfA>
 <xme:IQbwYV0ZJSaENA6FP5k3nlJO8vqJCHLVBizLXr6K4JHgZkt9AbnaEBBAruB-C-8gV
 qglraKQN5ZxBB_-E08>
X-ME-Received: <xmr:IQbwYcqysZEk7qX8RTHQgBuwhKrqtKIdt8k5_acDLkbTAppAMpRS2yjJXTErBZ6r3ZuUUUmHjkfpJTkApXIXPtKZ9yJZwwOXhZKgXMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IQbwYSkIZvLrThlXsKUyLDiF_bgSvDdErjna691P5Uw9hI-diGpsAw>
 <xmx:IQbwYc0T1jBjqUwfiHhpLZgyWttixSyvNApN82cEIEqodJfuJOLyTg>
 <xmx:IQbwYZs406glsW2_Xb3q30juZjPptSUt0I7si96iN3gxIEa5GItDvQ>
 <xmx:IQbwYdm0K0rIYFpSiVrAWZiSnGsvR1ukxv9PYTQp6h5GroEsn4RfPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:16:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 04/10] clk: Always set the rate on clk_set_range_rate
Date: Tue, 25 Jan 2022 15:15:43 +0100
Message-Id: <20220125141549.747889-5-maxime@cerno.tech>
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
 drivers/clk/clk-test.c | 290 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk.c      |  45 +++----
 2 files changed, 313 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-test.c b/drivers/clk/clk-test.c
index 28c718ab82e1..cb749515837b 100644
--- a/drivers/clk/clk-test.c
+++ b/drivers/clk/clk-test.c
@@ -6,6 +6,9 @@
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 
+/* Needed for clk_hw_create_clk() */
+#include "clk.h"
+
 #include <kunit/test.h>
 
 #define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
@@ -33,6 +36,32 @@ static int clk_dummy_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
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
 static int clk_dummy_set_rate(struct clk_hw *hw,
 			      unsigned long rate,
 			      unsigned long parent_rate)
@@ -50,6 +79,18 @@ static const struct clk_ops clk_dummy_ops = {
 	.set_rate = clk_dummy_set_rate,
 };
 
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
 static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
 {
 	struct clk_dummy_context *ctx;
@@ -78,6 +119,16 @@ static int clk_test_init(struct kunit *test)
 	return clk_test_init_with_ops(test, &clk_dummy_ops);
 }
 
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
 static void clk_test_exit(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
@@ -324,8 +375,247 @@ static struct kunit_suite clk_range_test_suite = {
 	.test_cases = clk_range_test_cases,
 };
 
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), the core will reevaluate whether a new rate is
+ * needed each and every time.
+ *
+ * With clk_dummy_maximize_rate_ops, this means that the the rate will
+ * trail along the maximum as it evolves.
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
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+}
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed each and every time.
+ *
+ * With clk_dummy_maximize_rate_ops, this means that the the rate will
+ * trail along the maximum as it evolves.
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
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
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
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), the core will reevaluate whether a new rate is
+ * needed each and every time.
+ *
+ * With clk_dummy_minimize_rate_ops, this means that the the rate will
+ * trail along the minimum as it evolves.
+ */
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
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
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
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
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
 kunit_test_suites(
 	&clk_test_suite,
 	&clk_range_test_suite,
+	&clk_range_maximize_test_suite,
+	&clk_range_minimize_test_suite
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


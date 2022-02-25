Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C084C47A0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CFF10E5C4;
	Fri, 25 Feb 2022 14:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB3310E3E7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:35:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8CFD55C0167;
 Fri, 25 Feb 2022 09:35:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 09:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=/Pux1x/j+FdD9SocQt+NA8O1F6+Czi
 T6i6SEuoESi+0=; b=D8Wi5vonLFtHhaifjZADWajfBaJuSoNHyrtzCZHxtggZ0+
 3KDL3Xrx0Pcv9CL2mj71wETpUI19/qRcmxdZ7b+lfmeBan3sX4rZSv9Po+ETO4nW
 FPTrS86G8gTbq1OcGpKrHQdwx2OvZh2zBg6oQO9d5Ns39FxBSz7mfemhZNyjjR25
 A2rovVzMr/nkfoyZUFDqSvXZxDcM/ialTulp9LIwZvUJaqtQ8++jrfbmWILl7rLp
 9xvJMxTQIFmTexdwhPCiIt+l5Mlr4jo9gDAx7FxMF1oxgh7aVMaqVxpGscy8duPO
 khsqYQGAq883gL4SsRrLclSwQo1wW3VWL5sMKpvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/Pux1x
 /j+FdD9SocQt+NA8O1F6+CziT6i6SEuoESi+0=; b=TmXD/jfJSU2uFbC8ux/F0A
 6W1I4Pku4Wh9oM7kttpd1kGyCUgF/+HoaD/i4UuRqCX3ilRvC/zsNUqZCqnxDe5j
 FVbjJ6tYHz605JBenf8R3mqx3nXaOqlOn5cHknt5MHDiqs8fV6d/BV++Dy4fMtwU
 F3uV96dIcL25o61CiFizDZZdOMyqMvsvAIO++bbC6q2toFNLsPtEF2ulrmppDa77
 HmKSQNZ/VbCBCRSKl3s6ovgQPrbKhH4ekbMpYAWGrjNotIk4y/0cHfDihirPz4nv
 v0qNxBQYzIxkZ99kz4OLBZFl14t0EekQPI9QZcAdxeEjxLvaSOEgl85foQsBHPEA
 ==
X-ME-Sender: <xms:QOkYYsRwhc4RirMjfUFkZCXP6Hr5jUQSkPCdGPtxCXYE6Vx9K0z4Dg>
 <xme:QOkYYpw3xwaeyOoG3XUy7DZxMUTZwiLAHXxUl2vXLn3fupkPKAKTN_bvYuDVE5C-k
 bOsLjbquurxjh6sbR0>
X-ME-Received: <xmr:QOkYYp0t-WGRfOM8nLVUC7wkj3ml56n0CqoqQFcSddKyY3LkzUJ7AqhQnBNzlWR4W1k1GeE1byem6aPbCNRZUgYiSJ7QZO-guSXijgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QOkYYgDmsg2WBvlrPecIA7ZGQecZ7CUidnK_D2JOAhB-W0b25_Hsuw>
 <xmx:QOkYYliyE9T0fNSN93zhy5wyCExo4pCAv4ot3hImCWUyQ5uAIw_EwQ>
 <xmx:QOkYYsqbpDieJHpTu2R-OkkCgD-SLAFTTkeRits5xNdRpjGnkU7tlA>
 <xmx:QOkYYtjgHewnZzAdfDIBreiT67PvOlLzMW0sqOI8gqxKXbsd0gU-7w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 04/12] clk: Always clamp the rounded rate
Date: Fri, 25 Feb 2022 15:35:26 +0100
Message-Id: <20220225143534.405820-5-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Maxime Ripard <maxime@cerno.tech>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current core while setting the min and max rate properly in the
clk_request structure will not make sure that the requested rate is
within these boundaries, leaving it to each and every driver to make
sure it is.

It's not clear if this was on purpose or not, but this introduces some
inconsistencies within the API.

For example, a user setting a range and then calling clk_round_rate()
with a value outside of that range will get the same value back
(ignoring any driver adjustements), effectively ignoring the range that
was just set.

Another one, arguably worse, is that it also makes clk_round_rate() and
clk_set_rate() behave differently if there's a range and the rate being
used for both is outside that range. As we have seen, the rate will be
returned unchanged by clk_round_rate(), but clk_set_rate() will error
out returning -EINVAL.

Let's make sure the framework will always clamp the rate to the current
range found on the clock, which will fix both these inconsistencies.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  2 ++
 drivers/clk/clk_test.c | 50 +++++++++++++++++++++++++++---------------
 2 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 112911138a7b..6c4e10209568 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1348,6 +1348,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
+	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+
 	/*
 	 * At this point, core protection will be disabled
 	 * - if the provider is not protected at all
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a8d7eba01de7..2279be699001 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -310,8 +310,7 @@ static void clk_range_test_multiple_disjoints_range(struct kunit *test)
 
 /*
  * Test that if our clock has some boundaries and we try to round a rate
- * lower than the minimum, the returned rate won't be affected by the
- * boundaries.
+ * lower than the minimum, the returned rate will be within range.
  */
 static void clk_range_test_set_range_round_rate_lower(struct kunit *test)
 {
@@ -328,18 +327,20 @@ static void clk_range_test_set_range_round_rate_lower(struct kunit *test)
 
 	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
 }
 
 /*
  * Test that if our clock has some boundaries and we try to set a rate
- * lower than the minimum, we'll get an error.
+ * higher than the maximum, the new rate will be within range.
  */
 static void clk_range_test_set_range_set_rate_lower(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
 	struct clk *clk = hw->clk;
+	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
 			clk_set_rate_range(clk,
@@ -347,15 +348,21 @@ static void clk_range_test_set_range_set_rate_lower(struct kunit *test)
 					   DUMMY_CLOCK_RATE_2),
 			0);
 
-	KUNIT_ASSERT_LT(test,
+	KUNIT_ASSERT_EQ(test,
 			clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000),
 			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
 }
 
 /*
  * Test that if our clock has some boundaries and we try to round and
- * set a rate lower than the minimum, the values won't be consistent
- * between clk_round_rate() and clk_set_rate().
+ * set a rate lower than the minimum, the rate returned by
+ * clk_round_rate() will be consistent with the new rate set by
+ * clk_set_rate().
  */
 static void clk_range_test_set_range_set_round_rate_consistent_lower(struct kunit *test)
 {
@@ -373,17 +380,16 @@ static void clk_range_test_set_range_set_round_rate_consistent_lower(struct kuni
 	rounded = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
 	KUNIT_ASSERT_GT(test, rounded, 0);
 
-	KUNIT_EXPECT_LT(test,
+	KUNIT_ASSERT_EQ(test,
 			clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000),
 			0);
 
-	KUNIT_EXPECT_NE(test, rounded, clk_get_rate(clk));
+	KUNIT_EXPECT_EQ(test, rounded, clk_get_rate(clk));
 }
 
 /*
  * Test that if our clock has some boundaries and we try to round a rate
- * higher than the maximum, the returned rate won't be affected by the
- * boundaries.
+ * higher than the maximum, the returned rate will be within range.
  */
 static void clk_range_test_set_range_round_rate_higher(struct kunit *test)
 {
@@ -400,18 +406,20 @@ static void clk_range_test_set_range_round_rate_higher(struct kunit *test)
 
 	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
 }
 
 /*
  * Test that if our clock has some boundaries and we try to set a rate
- * lower than the maximum, we'll get an error.
+ * higher than the maximum, the new rate will be within range.
  */
 static void clk_range_test_set_range_set_rate_higher(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
 	struct clk *clk = hw->clk;
+	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
 			clk_set_rate_range(clk,
@@ -419,15 +427,21 @@ static void clk_range_test_set_range_set_rate_higher(struct kunit *test)
 					   DUMMY_CLOCK_RATE_2),
 			0);
 
-	KUNIT_ASSERT_LT(test,
+	KUNIT_ASSERT_EQ(test,
 			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
 			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
 }
 
 /*
  * Test that if our clock has some boundaries and we try to round and
- * set a rate higher than the maximum, the values won't be consistent
- * between clk_round_rate() and clk_set_rate().
+ * set a rate higher than the maximum, the rate returned by
+ * clk_round_rate() will be consistent with the new rate set by
+ * clk_set_rate().
  */
 static void clk_range_test_set_range_set_round_rate_consistent_higher(struct kunit *test)
 {
@@ -445,11 +459,11 @@ static void clk_range_test_set_range_set_round_rate_consistent_higher(struct kun
 	rounded = clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
 	KUNIT_ASSERT_GT(test, rounded, 0);
 
-	KUNIT_EXPECT_LT(test,
+	KUNIT_ASSERT_EQ(test,
 			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
 			0);
 
-	KUNIT_EXPECT_NE(test, rounded, clk_get_rate(clk));
+	KUNIT_EXPECT_EQ(test, rounded, clk_get_rate(clk));
 }
 
 /*
-- 
2.35.1


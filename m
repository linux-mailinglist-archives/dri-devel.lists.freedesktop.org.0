Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A284BF912
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1B810E4FD;
	Tue, 22 Feb 2022 13:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261F910E43D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:19:04 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C8265C02A4;
 Tue, 22 Feb 2022 08:19:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 22 Feb 2022 08:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=h1/jZs4y1Yj5jcfNXQZsy2tkehVWUJ
 ytEczqtL7GTaM=; b=BILpcw21UgwPwq366FH1DUkHkmx3sxTv9fa5NhMPp16vsR
 GB46H7/6qdldk0iunN2nud1X+g0XhHFskX0HRPq/+t1L6vzV7h8daACkml4iUxic
 d/MeYk2O77HOHcmHT4Q8nGCxjaSR3mjhuduy0Qkl9uPfRMFFi6FWhV8wsixZ0ZUB
 u8koxrjkSn4V82mWUK9iOf27CS+m0sYldEKBlLD7C9MHqMPN/pKcwR+IhBA1M061
 Zd5eHMrYyUvSLNK7MOuljBHCAIW83jMl7j5Abx+LM3iGBJ7+RlYud04MSQyhUlB8
 5iYjryweU8cUDsEuUyVJR4jKe3x15ej1xCGyxhSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=h1/jZs
 4y1Yj5jcfNXQZsy2tkehVWUJytEczqtL7GTaM=; b=MSWm5/ZB+UkVY/l0/Mc1/+
 Mtq8YMKeipSGKDnxnYQD33OR/qnPfhQZn3YZl9rkrEvJfA+i1ERO7n+T/uge+Z3w
 IrTiDTplOTXnM28JnNumZi/IfjL+SnGyTyX5S1ZLvuGLEhWWSpGjR8FKkj6IsIRI
 wfnf0iAu6+v/ogyrqbbjOf4MHRzz3Q7RQ4Obkmnf6TfbYoxa6M10xA2zH+TOiFvd
 6FoF0k8nYrs36ALHM8I22+GyQmqXkwKliFoud8Q1j72g9aEuM7N9s3k0teG3Ctrs
 vqhEulx6LkiYG5FWTILHzAyzbKtrQhK12fOcdlY+fxRYbPqTz/At2YuO6DfGLEKA
 ==
X-ME-Sender: <xms:x-IUYkqvZwjIYpru4zV_08gGlzGiNspbrPo_uWqfz5to7nRNsDC5Yg>
 <xme:x-IUYqo60Metv0KGU5GT7upqEq5q7RZTHjsn7Uo0hZHPBVLtotBjEUvdL7dSbN3kD
 vPXBZg6ZaRvX6uIApg>
X-ME-Received: <xmr:x-IUYpMOdqA_7dxNar9L1kQ-ByMDNo24Hc7xxHAO998pwX51vHv19V13Df5yW51babU1Q0h-6Jx9ms9XBf-6CJ-UizJ69ydu1KI6FaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:x-IUYr6yw5GS6dM_JPTK85iTItO8kMDdUtt6GEf5B2AXg1XoXkov-A>
 <xmx:x-IUYj6TVarLtmr1ACjd9QIUBFOPeALiL9QBP3BUym9bf_0FlmJnGg>
 <xmx:x-IUYrgByGp2oq_Sq0v0UDPmWOSAfmU7LpgDXHP9xOhOZTQGC7YJJg>
 <xmx:x-IUYmbDxaPlyKycUrZZjMp41j1Rwd59AJSf-Mmturs82JNNjtDIFg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:02 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 03/11] clk: Always clamp the rounded rate
Date: Tue, 22 Feb 2022 14:18:45 +0100
Message-Id: <20220222131853.198625-4-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 46 +++++++++++++++++++++++++-----------------
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 276188a6bc2a..9725bdc996b3 100644
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
index 8ddfd3b195e1..2b906c594328 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -309,8 +309,7 @@ static void clk_range_test_multiple_disjoints_range(struct kunit *test)
 
 /*
  * Test that if our clock has some boundaries and we try to round a rate
- * lower than the minimum, the returned rate won't be affected by the
- * boundaries.
+ * lower than the minimum, the returned rate will be within range.
  */
 static void clk_range_test_set_range_round_rate_lower(struct kunit *test)
 {
@@ -327,18 +326,19 @@ static void clk_range_test_set_range_round_rate_lower(struct kunit *test)
 
 	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_EXPECT_TRUE(test, rate >= DUMMY_CLOCK_RATE_1 && rate <= DUMMY_CLOCK_RATE_2);
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
@@ -346,15 +346,20 @@ static void clk_range_test_set_range_set_rate_lower(struct kunit *test)
 					   DUMMY_CLOCK_RATE_2),
 			0);
 
-	KUNIT_ASSERT_LT(test,
+	KUNIT_ASSERT_EQ(test,
 			clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000),
 			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_TRUE(test, rate >= DUMMY_CLOCK_RATE_1 && rate <= DUMMY_CLOCK_RATE_2);
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
@@ -372,17 +377,16 @@ static void clk_range_test_set_range_set_round_rate_consistent_lower(struct kuni
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
@@ -399,18 +403,19 @@ static void clk_range_test_set_range_round_rate_higher(struct kunit *test)
 
 	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_EXPECT_TRUE(test, rate >= DUMMY_CLOCK_RATE_1 && rate <= DUMMY_CLOCK_RATE_2);
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
@@ -418,15 +423,20 @@ static void clk_range_test_set_range_set_rate_higher(struct kunit *test)
 					   DUMMY_CLOCK_RATE_2),
 			0);
 
-	KUNIT_ASSERT_LT(test,
+	KUNIT_ASSERT_EQ(test,
 			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
 			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_TRUE(test, rate >= DUMMY_CLOCK_RATE_1 && rate <= DUMMY_CLOCK_RATE_2);
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
@@ -444,11 +454,11 @@ static void clk_range_test_set_range_set_round_rate_consistent_higher(struct kun
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


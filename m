Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA74C10CC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 11:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FE910E665;
	Wed, 23 Feb 2022 10:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC1E10E653
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:56:14 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D72245C0214;
 Wed, 23 Feb 2022 05:56:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Feb 2022 05:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=R6vhlpcotbP/tqG2pKpe3tU0V86Zos
 gs/5+/CGHIE9Y=; b=BH6WV7IrabAZV3el1fTVy2Q0Rva8l21pI7m1gEHLuhqH7K
 /bOTqeN/5h3yo1keaAusJ2KDRoYDuMyqTvzugdL7GqKhWMQ8fPLU5ODe4hT2B0pZ
 Qvluhh07fk3upWJx/DoUNGQruZIXdI/uPsRMlO8aoqVN839GJCG3r4ukAwI3mIrJ
 2XLom7uAHs4OFezvOdG8cxHtxfu7yUNRNmpEKj0Qt41NDn5gyIc8FptHsMWYfPyE
 RWSXCdvT0puxp/taa/u+vGEIGFlm/XPWKVMlAWgJnByHVLyO2MOlYnqATgPWkH5l
 1YBdYhX1h8y6dmcTljiD2Em666tekLq5UrJfLCwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=R6vhlp
 cotbP/tqG2pKpe3tU0V86Zosgs/5+/CGHIE9Y=; b=Y7fTTGa1vdPOPLzj30LGCI
 DSshjGjaY1oMkZy7cvI7fsyOeOy+Zir8xovfB20RoGbsWlebJ3a/jAQV0lNIQ0FG
 pLrvCPl6j74jBTCG8kv3p3qT1EWP1Szmrtsj3udFGeYSl6vZdAeyoZkaaS+Gq4YZ
 Olg6aRqKFWWVxHt7DgV1IsVVO8u6SnlRaITuX45yOiqGCmQDq3xMRErU927FQyOW
 vCaRab7gaVPfrm4ZtTN/W/nX3xKhPGGG35Mf8l0ZDRa9kySt+fS5ryrppjWoohCb
 gMllyLk6B0mHta1stCPV1yA4dkiTYD+Ef74H4UKGOG3K9rc8KEyousvvA47CUFqQ
 ==
X-ME-Sender: <xms:zRIWYqBU9ZgYykurqPbJfpmaMXsuoQKYq5lR8lZ7uXInKu5n0JsyRw>
 <xme:zRIWYkjk8pVA-2BzxHv6-yNDYtsN0QaPUN-oESUjhu0ikFZG-kwHnGWArqWLraKEX
 H7b4Mm7XCyANKO-m28>
X-ME-Received: <xmr:zRIWYtk6ROtoFShgx50WFhwnhA2PyI1E7FOOKgRHP5mvXQ3n0z-ZHYSwjvMaOe45Sg2LFkO6bcFBoYi_TzYd1qk8vCyL6iSQjD1dQNY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zRIWYoxw2yuMzUWpvlVG2qCFY8RGUWHGmQXBghVurifIbrK88vbUzA>
 <xmx:zRIWYvR34Dh_BKrxSMLIqBydn6hMAfaNXwpwh4JSnm2f1l7-ZKbSmA>
 <xmx:zRIWYjbnLpHmhq7UXPyGKIEzsaG443v5xMx-DBA_FE5iL6VNsQuJJA>
 <xmx:zRIWYoQQflvmoTVOzRht6SqTnhlTFJDoYkkrAJ1eaGkxlNoxi9rb4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v6 04/12] clk: Always clamp the rounded rate
Date: Wed, 23 Feb 2022 11:55:52 +0100
Message-Id: <20220223105600.1132593-5-maxime@cerno.tech>
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
index 0ca6cd391c8e..5a740f301f67 100644
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


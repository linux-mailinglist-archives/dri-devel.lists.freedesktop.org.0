Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8844649B5D7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C4E10E431;
	Tue, 25 Jan 2022 14:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F3210E431
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:15:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D2E545C00F4;
 Tue, 25 Jan 2022 09:15:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 25 Jan 2022 09:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=OCxCF+7zxy6gv+dXC+EN8VhqtBtxZI
 fAENy0N1hdS8M=; b=U5CX4CTPaOZLWjNh4p7bcpOegg2B/1NvzzVl8Yz0Bke1IN
 bGYVCL1rqqo4BshkFHsrIyAbeSs/H2xeoMTRj7Me59zkmx9PurZSt4wAI3t/YWPt
 KFBF8D31xunEadVqlh3nU4JXu1bIzTbt3Gs42GKgyRfQYpRbVA6B+sOC4fxHnfa6
 85C4IxeQeH4Bz5IFwXKqRm1liGDRxT4W+DETCUx9yiHgFfGhlCO9ixp62h71gqqh
 fHm3K58xmhkZK4WWzlZyq2U6CUxgFtvUHUkoplWKSt0us0Egrbt1F9+pRiLf07kl
 PvecszM/VdIJz6i/qnB57HGFS1KfzJ2XX334cB7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OCxCF+
 7zxy6gv+dXC+EN8VhqtBtxZIfAENy0N1hdS8M=; b=IHl3pGc1IImn6goqL5f5ZF
 t2blYgqCtWYpdF3xXkPr8rsL6P7sCuSCD9FxBQQqgMKcmGe0B3sGpFkqwzqQRHhv
 SeLO1KbL9qC98Wew9PR7wnMkNOJHBvuJhRSGwYroctQY5YlGrAHgJb42kOAAWIMh
 0zDyKTV3rBD0n5eMJDKi5/iGMG4be2Fj4T6bJ79ed8vwV2cZTuki8Ooi7oBmvHIR
 zCc3VqnR/Pdil77AsMDSUK0L0f/WWkEBd8bh9LbXECOeswGGxtRxkxwA1wgkgWUX
 MvWPLuWKb8budeJbrrLa9VtFb7TXiVdla/7KvM79tlcRPPSmdQnCSmnf2CTA1eug
 ==
X-ME-Sender: <xms:HQbwYQuQz6EFGHnjI5J9dCY4JcDoD9RLQWVrc5vAWiJ0M-WIXvq5Rw>
 <xme:HQbwYddS5PzS3OSN0mpmGQcMVFCIitChf-CTtvGp9MD5hCOdum19Dgu3GOrGi5jLB
 AuRP1YYYZ45buaB_k4>
X-ME-Received: <xmr:HQbwYbzHOJdF2yaxeUEIqnvtVWEUR77oksJq-xleB_2kVuMJJ9Bgzk5gapoLlN4WHTKLwOqZtwbi49L7Zzs50bAJuGDou6bXQWYtV9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HQbwYTNf09Qb50rA2HMH9ThmN57zkbFylzrsSvHr6KJu5gZbipFBug>
 <xmx:HQbwYQ8fz765sRsDQQXCehJGq5YXksJncqeeoNo4IWtNzYBk4XV20w>
 <xmx:HQbwYbVP0njaFkUwWlCJ89q6a0oVhWMkShvpiKW9i-Ate5rtyQWUWQ>
 <xmx:HQbwYdNAdBpuhPkNfeFDZb5rTqCEzMmcicUHbP_d56pB1lbz-HE4BQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:15:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 02/10] clk: Always clamp the rounded rate
Date: Tue, 25 Jan 2022 15:15:41 +0100
Message-Id: <20220125141549.747889-3-maxime@cerno.tech>
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

The current core while setting the min and max rate properly in the
clk_request structure will not make sure that the requested rate is
within these boundaries, leaving it to each and every driver to make
sure it is.

Add a clamp call to make sure it's always done, and add a few unit tests
to make sure we don't have any regression there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-test.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk.c      |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/clk/clk-test.c b/drivers/clk/clk-test.c
index 47a600d590c1..28c718ab82e1 100644
--- a/drivers/clk/clk-test.c
+++ b/drivers/clk/clk-test.c
@@ -203,6 +203,50 @@ static void clk_range_test_set_range_invalid(struct kunit *test)
 			0);
 }
 
+/*
+ * Test that if our clock has some boundaries and we try to round a rate
+ * lower than the minimum, the returned rate will be within range.
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
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+}
+
+/*
+ * Test that if our clock has some boundaries and we try to round a rate
+ * higher than the maximum, the returned rate will be within range.
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
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
 /*
  * Test that if our clock has a rate lower than the minimum set by a
  * call to clk_set_rate_range(), the rate will be raised to match the
@@ -266,6 +310,8 @@ static void clk_range_test_set_range_get_rate_lowered(struct kunit *test)
 static struct kunit_case clk_range_test_cases[] = {
 	KUNIT_CASE(clk_range_test_set_range),
 	KUNIT_CASE(clk_range_test_set_range_invalid),
+	KUNIT_CASE(clk_range_test_set_range_round_rate_lower),
+	KUNIT_CASE(clk_range_test_set_range_round_rate_higher),
 	KUNIT_CASE(clk_range_test_set_range_get_rate_raised),
 	KUNIT_CASE(clk_range_test_set_range_get_rate_lowered),
 	{}
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8de6a22498e7..7bb5ae0fb688 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1330,6 +1330,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
+	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+
 	/*
 	 * At this point, core protection will be disabled
 	 * - if the provider is not protected at all
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4B4C47A4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073C010E68A;
	Fri, 25 Feb 2022 14:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01C810E5FB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:35:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4AE285C0138;
 Fri, 25 Feb 2022 09:35:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 09:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=51gGaDVGGj6fUeWdNNnt3yc05Mm3Vg
 2wbHZzZUo3Xvk=; b=o9HIDNGq+g+K5dri+oQClK/r9+dS7/UOeMCU59K87UExQZ
 D1F7Za8+SKC0FDl59LW9S9VifQbOae2FnQWQJ5JydGtl6k2JgRXYJHm5OK5JjQYy
 n2AWAbBG2lI1ClzdCnvw7fLCgWpbegXgEW8HzAgyXQPnauqj9/SjszVadKR+GiDH
 hpJZ52ZpSLHedUMssslExmI9Rf0AFK/Ewob1oPkgzzVFbx7k2GJTWhfDJoSrW4id
 t3l0Y6QORp4hkqADTIAne5btuFrE5yCTgETBYbWT/fY0lEionrf1HtgBzpiM+7EB
 lAncaWHdW82LUsLCmUWQdzx0b40T8vlXkjB9cNDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=51gGaD
 VGGj6fUeWdNNnt3yc05Mm3Vg2wbHZzZUo3Xvk=; b=d78Ec4sSRlFSNAWneAwtaR
 D5+mrR74S6oe3fCT+qS/gEDpW3qngJPxvnK9sFcyJNgMypqhyAUmI0JxkUhM8dRm
 mG8g5fkPYlX3wDbQfgwqs029T+38CxbG7pOJLpOnf6z9px6TCSgj7r81ntLwjpwA
 wccxIQSMX6rLUwa1M47FCAUJDoXlIscTO57YUV+Kl4j6cxms3kUuVNZzShGnT8EX
 3d5XnHRwt4oTy08hnetkXy+bhuFhG1WRTwJzI5u3UgRFVSE/2NOU2nk34PdOQQ9o
 uWs9hgx75a0e3ygOWzK6IQ/HowWCMfz4nnxZu5hV8UYk8nJKULOEDA73qkErHJIw
 ==
X-ME-Sender: <xms:RukYYt11d_OwB0FxAyVvAEw0LWwZo3kxAsqBxH86ulEKpBFdX_WBbQ>
 <xme:RukYYkHZc5NwhTWnpWKxf4eA4Fj81q-4MfXZFIPq3vAsVnF_g1gBUYueuce02-fvA
 r86bXRamheXoJ07QEI>
X-ME-Received: <xmr:RukYYt4-0HqpPK44BPNfwvv1SY7wjQuLxCMajnaRBrnlMJTX8FC1JCl2lKQyA3kI17oy5BzzD9M9ZFbsKTukfvRfY6uJYw_NHM9MJ3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RukYYq2ksSBlW2YfrsCibkuvB8gDXPJFn_cyM4uWpFbvtlflJSVIIA>
 <xmx:RukYYgFQVpeTh_3g4KSU_2VRB8YXehlxAXNjaDCsruUaVWuPfyzjaA>
 <xmx:RukYYr-ScxtYdd7yWuRTWnP4K3NiYdtj9indM03wQTbYE7MKwfWEJQ>
 <xmx:RukYYr01-htI7ggEeDFEy80z9UYBXXHsPnupqlekqVzJJUZ9EA1Tng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 07/12] clk: Add clk_drop_range
Date: Fri, 25 Feb 2022 15:35:29 +0100
Message-Id: <20220225143534.405820-8-maxime@cerno.tech>
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

In order to reset the range on a clock, we need to call
clk_set_rate_range with a minimum of 0 and a maximum of ULONG_MAX. Since
it's fairly inconvenient, let's introduce a clk_drop_range() function
that will do just this.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c |  4 ++--
 include/linux/clk.h    | 11 +++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 2c5d30a9372e..a92600311506 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -645,7 +645,7 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
 
 	KUNIT_ASSERT_EQ(test,
-			clk_set_rate_range(user2, 0, ULONG_MAX),
+			clk_drop_range(user2),
 			0);
 
 	rate = clk_get_rate(clk);
@@ -762,7 +762,7 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
 
 	KUNIT_ASSERT_EQ(test,
-			clk_set_rate_range(user2, 0, ULONG_MAX),
+			clk_drop_range(user2),
 			0);
 
 	rate = clk_get_rate(clk);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..39faa54efe88 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -986,6 +986,17 @@ static inline void clk_bulk_disable_unprepare(int num_clks,
 	clk_bulk_unprepare(num_clks, clks);
 }
 
+/**
+ * clk_drop_range - Reset any range set on that clock
+ * @clk: clock source
+ *
+ * Returns success (0) or negative errno.
+ */
+static inline int clk_drop_range(struct clk *clk)
+{
+	return clk_set_rate_range(clk, 0, ULONG_MAX);
+}
+
 /**
  * clk_get_optional - lookup and obtain a reference to an optional clock
  *		      producer.
-- 
2.35.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05449B5D9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C282B10E4BB;
	Tue, 25 Jan 2022 14:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926D810E431
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:16:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EF05B5C00E6;
 Tue, 25 Jan 2022 09:15:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 25 Jan 2022 09:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=14u3x6rDB7hRy6nMQzlAJuztS+b0Xn
 uFuIFqX2ftyq8=; b=UPG2nzuI4UcUGERaRAy8cjjRuEabWNwpY131Bitd575Xfx
 hRdZSm728JPEIift8DQy84YbSqUM4aYXpxwAZqgNsXd56dfbXTihUrehoJHW/V7L
 BOySL5+1LkCJR9l54hZqBA4OBPW+Z800B4qSZ+iwNJX5jW3yqBOCn78a7YkWK39K
 Q3gNb5EHVBUnos5W+mbSsL+6otq1J1hC2k/GDTv0oQmf3Q/zOLq+yhThp5xqNI21
 wEoGTh2lrE58dp651IPFJdhOd95IpiPbTx3XXxH37uwhWtpbc/YXTRA3A5wnteSB
 F4+AjxTFNUqy5R7ollW1Gcw9Wc+s7RF6bHHPs9Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=14u3x6
 rDB7hRy6nMQzlAJuztS+b0XnuFuIFqX2ftyq8=; b=Zq7x7sMnASaSTrMesHN96+
 YCMHm7rpW+CBqBiuUAtAYcepHrfEJV4XiTNwqvUg7J3OyHvQeLpmpSJuqB18ljrA
 l/AidV1vJTWep1lq4Ih9t1p/yZ/FCfmBCCafc4YlsnLfq8OauYlv8zH6PQve9op8
 fMAsW+c371JbtR0WydQxd81ItdKHpFiXTfjqg2Ya+5sdtt0ctdnX4DpplvCZ9QX5
 ksC48WMO+tGkYUt8Q1JhPOYmVD89+pakxjFtyKbXM+gYLycYXA+74esTXvKvW0ax
 6qVHyIhC9+xYbO2upUIHvNNSSg1PN59FrVi8GImFqt8WGXgonAfykzjRvxASoYNw
 ==
X-ME-Sender: <xms:HwbwYfqAeNuZ2WbGP2TS-c1yixgZii1x1rlo2TMjHB7ukuTn4e8MeQ>
 <xme:HwbwYZqinbD5htJsKhkUDJQmHfhv9CdlnGhwmpBxU1H1zfUcnKU8i9fj51hDrbsjC
 XlFAKnFp3IiJp-EWzI>
X-ME-Received: <xmr:HwbwYcPvjDwgqXKhaRhK8Utvc0iv_82L2jecHzVKeS_MTG1waSWrV_Yw0f1qj2Y56ZkPwU_HNBgVBogKXP54iN82z5FJhIlbu_ERZek>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HwbwYS60Es789JIqaRMODI5eTj4X5r-3ez70hOIIwCGiwV1RCtBxWw>
 <xmx:HwbwYe7Pg8YdBSappKGstLpDSYOTz86MB6F3W6RFI148_OV-7P4yYw>
 <xmx:HwbwYaj4PYc9KTjvO4QdO0XtQho5sGoPDy-T3iBPbV9tQwD8kF2bNQ>
 <xmx:HwbwYVYHfXMYj8PauDLJnFUTO9V9JnSgjZ_u8iL6pKzVuMJqwySGkQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:15:59 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 03/10] clk: Use clamp instead of open-coding our own
Date: Tue, 25 Jan 2022 15:15:42 +0100
Message-Id: <20220125141549.747889-4-maxime@cerno.tech>
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

The code in clk_set_rate_range() will, if the current rate is outside of
the new range, will force it to the minimum or maximum. This is
equivalent to using clamp, while being less readable. Let's switch to
using clamp instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7bb5ae0fb688..150d1bc0985b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2365,11 +2365,7 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		 *   this corner case when determining the rate
 		 */
 
-		if (rate < min)
-			rate = min;
-		else
-			rate = max;
-
+		rate = clamp(clk->core->req_rate, min, max);
 		ret = clk_core_set_rate_nolock(clk->core, rate);
 		if (ret) {
 			/* rollback the changes */
-- 
2.34.1


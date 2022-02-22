Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8073E4BF914
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D4310E4BF;
	Tue, 22 Feb 2022 13:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FBC10E3CA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:19:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 77DD45C0289;
 Tue, 22 Feb 2022 08:19:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 22 Feb 2022 08:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=fQmCcvxeAaYP+ZnyF0Ud1U+novQIOt
 1eKHIY8c9QOUQ=; b=IXp8WG6zo14o9hP1m2NjgtrDmawWqU8xIjROldVHCGZpek
 rJZEUk/0FHWIRcmT67Gkr7ID0opX1RV8IpR1PwqVmLfZ803wMbYtXKs7f3a7RIu+
 AcgbXJhMKaRJtvIAPnCJ33B83Wrh2O6yr9SFX6cFei6gaOeLG3CgQ8t8wMiMVzak
 1r1l5VI8w1iBDcqIxEU/nX+8iTk/ZOtbQ0QU0Jzod9t2fs93jlfntbhL2+04Aowz
 CPuf2Y7dYnsjB3xAwjpAj01v7ENkAJ2TBYquCE0BaaPMl8ZaNEzdSfAs1Z1dP2WU
 /Fzd3v2/DTEGcQr8TAjfyAH0/g+SeHg8HueUnC1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fQmCcv
 xeAaYP+ZnyF0Ud1U+novQIOt1eKHIY8c9QOUQ=; b=XzeoVSIWKwHAUXsLZee4mR
 reQTU25ZIVJ5QPCzOTzM9/IAtN6/Q9yz74c5zSLNyKPYlf40qofkCzg4Ynpmtm8P
 wBGvJs9rILCXhkABcgcoAYg68lOpZ0zhvQyrzpXg0s4ba1NsJN9H4Pqj1ctUe/fP
 NXTUxbkyGRrJQJCvHb7ZHB6Z5ieCpkp+7mkMfXs6imLOKLG6LsoOCuf22GIcLmgO
 r38jcriTyxPjHsElr8oxhJtXinPp+voyXFdAgm+YvQQg3m0T3Ok72VncjiRvTbLL
 WsHApICMge1P1EzE4hHT7rt3PViwB5FWdgQjF3OpLjw0PrAtPIh5ng7oJ6KP+ykg
 ==
X-ME-Sender: <xms:yuIUYmSkSr6EOwd7fkPcJErbPaL9_bTtNbZnSuhxBfVQUhNEXpEW7A>
 <xme:yuIUYrzyn6HNk3azcwdKrhymPfjNDT3rZKjj_yZP8bpbZpuBW516FPapl2nU7slx5
 gxa4AgJN7ZTo7cs6Bk>
X-ME-Received: <xmr:yuIUYj2a30lojxv-maogovvipSM-w810eZWRwsjzNqA10jHjO_ulUpmb9GNZqTy2-YP5UaozkJaglj3BFtbPavBfYC0QvYASRL2LW9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yuIUYiDm5rOKousfGy72VkbLKwkl-oHQZx2NRd2QcU1i-i3TFOM96w>
 <xmx:yuIUYvh_1C2dj2WF1_ISniCzH-Az_JAyAsNNgRqa5xbBx4SJkjCqOQ>
 <xmx:yuIUYuro-fdinHg2ZjZoL7t6R9X1vIUpKFCaTk5yNWO_CXqGfw0O1w>
 <xmx:yuIUYvijG7noK7gWcxjfuM-xKle4UAIqWJKgdb4ORyfAOLWH98hhew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:05 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v5 04/11] clk: Use clamp instead of open-coding our own
Date: Tue, 22 Feb 2022 14:18:46 +0100
Message-Id: <20220222131853.198625-5-maxime@cerno.tech>
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

The code in clk_set_rate_range() will, if the current rate is outside of
the new range, will force it to the minimum or maximum.

Since it's running under the condition that the rate is either lower
than the minimum, or higher than the maximum, this is equivalent to
using clamp, while being less readable. Let's switch to using clamp
instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9725bdc996b3..fd3daa11bfa4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2388,11 +2388,7 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
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
2.35.1


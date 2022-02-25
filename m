Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF004C479E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE0510E3E7;
	Fri, 25 Feb 2022 14:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F76C10E3E7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:35:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7ECD25C0167;
 Fri, 25 Feb 2022 09:35:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 09:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=ArpZV1OOJaCiX1V4IJEQ5ZTlCh+REK
 6Z3BMj9kfNFS0=; b=piipEcu2V4rTYNwwR1tZk+VAARRLDApZINvAo/gw5DBQ6S
 kerwDg8RXM2qL2r3YHiOuJJHKo9hnSLZY0+kYifY2C9L0NyeMxgICqCPbVwpuM73
 KDmJ49xyQAjSNq99x/n51cqxL54egAACFJ6r+BfuXNeluX1WGVrkrcY/ySwn5sUK
 9hzPOxSXwSa6y/P64NcTnRtEeeLFNbggIlWMlCHX08bIbIr8tVqZCseZTbqzbz/d
 8RqBU4N7on4O8wDAlqyYqGTmqLuEPWsY6HyKmOMySKHWAIGMTcfAf0gM5fohPguA
 EmpILUVBYkt0fHnW0D6pAAg7VMhWrHAoKehGim1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ArpZV1
 OOJaCiX1V4IJEQ5ZTlCh+REK6Z3BMj9kfNFS0=; b=BKgX1xtBrltLwYNoI7OLCI
 WFRNM5UjTq/b2Vpn84L9tkh8y+TB2UNlReHn98KHEkhS2DQCzPKQN7D5+iQeHG7T
 kg28mNE1MJka6yMhnQDRe9g1k2eWTEk0x1oWnQ0hJav7YdSQ5V54BlVwM2Wzc01o
 LLckHNO8BPPYf+fZ1WByXhGqwKHS5L5QQUFuCMU77fhiFBHN4ghN+uISQFJCb8ed
 jGjJVBRsb/PwwSlfjWccVurNRgFAqcl/Fd09xbj2ETZpO07hVO4WZlsUIHWtRARq
 VOEtzvlbDmQetPw0tNDs2tOFZao01fYwbkLmnX7HyP32UwJLgIIXXehvv7yGsCJw
 ==
X-ME-Sender: <xms:QukYYqzHUZutNJyU_EVs-OCRahSLSCKTabPNgx2eVH1ceSceFbG5cA>
 <xme:QukYYmSovB1SsGLbTWWKBMaCMTU7uZxJ2RF5xVAIGjslxysUL8O9PF7RKo6_b_kS_
 OpUbxADHK9PEUnVJK0>
X-ME-Received: <xmr:QukYYsXiLRThfH0BsvqKx7RZvW1lwFXE5MSff-i9wjCWzZ_O3agSGsoUoLvzAqXUKRgmGwawRDupk2o7By09Sm0WhZNQ_78o9Up3rnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QukYYgj4xfkSwrlXvIaV5aROlZy9k_6luKePdMxhudUnDFld2d9M8Q>
 <xmx:QukYYsCPxQmaQ7vWLcVQqbHr59U5Yuy4nl0eTmOUed6SA2IMTif4Uw>
 <xmx:QukYYhJRKy6fMsjO715FlLB6knWoI59KnF9teA5cyM-Rg_ZoFEPMLg>
 <xmx:QukYYqAT8cX763ciIkv3wP8cYLZB5QJwH4FWEltd5DyGlu9Tm5NQpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:45 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 05/12] clk: Use clamp instead of open-coding our own
Date: Fri, 25 Feb 2022 15:35:27 +0100
Message-Id: <20220225143534.405820-6-maxime@cerno.tech>
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

The code in clk_set_rate_range() will, if the current rate is outside of
the new range, force it to the minimum or maximum.

Since it's running under the condition that the rate is either lower
than the minimum, or higher than the maximum, this is equivalent to
using clamp, while being less readable. Let's switch to using clamp
instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6c4e10209568..c15ee5070f52 100644
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


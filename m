Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC24C479F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332610E5EE;
	Fri, 25 Feb 2022 14:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF1010E5CA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:35:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9853C5C015A;
 Fri, 25 Feb 2022 09:35:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 09:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=IW+mV/sYomA7p2iMVLnrfnt2OPuKxa
 e7vUhcazyHY+o=; b=q0ZbhSXNILTPh3z05nrc34B2RwcsqerXKoKUHBj6v/zl6o
 Atgi+GN8xKGqkLBvaLn836t/5hm6jpT/poqftFOe6BDa9jGxGeV8/A+cJ6KmDqnT
 fwdHJQv3usYrLkwhw561KSmmeLiat44WIyqnTtEskuzKToLu5w9BcCghq/Vq2JlS
 R55NAYjrQbEr1D1G/OqSSPR2gq3oF28JTD3dvoJkvSjMjS6CfepSmsYlquIMeh5n
 nRE6wtoaxWNwd8TzWfQVK1Pc0VqBPVxZMr+Ib7eOC3BRvOCExgJPMNrcEnijCuaD
 OTLMKiVsacSVuWTFi8yLbw4A7C8KoXxLJaBficcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IW+mV/
 sYomA7p2iMVLnrfnt2OPuKxae7vUhcazyHY+o=; b=EpLJPGEWas9RS9JuCyDjMx
 o2FT3PTNl+lIGmAY8d+WBqxDhAHXzOVAVKFS8YBSjdaFTuH764ZPxX3jnqbm3vJx
 fdRhTHOlXRg4RlGW/Ilt5epFEuD2+Nlh2AjBUJcu4oDyIdsqzIM2/q3cywjF3Izs
 4Gv0cJDehPXvyKgAFPU1Lp8TQ0T2mm3qedPoo14cnJuPSlrHEib9SI/9Amb2yKl+
 p0MXGu6EevlxD4dQSjMmtmGDnLdPE64/kMS0K52OjoqMYvQIFuLnF2IjBk0MD8/M
 kgF1wEqJG1EkFnNrYt2hNHL1Aa38Rcw8M51uIkqBSapLPRhdZZRM7z0YJXNUdJAQ
 ==
X-ME-Sender: <xms:PukYYkNKJ8Ly3TZXJ7ZGAVW3GS0xKoG1CrG9sOBYNzrYEHra0Y4qGg>
 <xme:PukYYq_sLM8-NVboNFekSeYPYmrSJtbcrGFBCvuv9UKKoSLLYf55fxYwkbT7yAevl
 2_hHVkCOv7vHBzl19A>
X-ME-Received: <xmr:PukYYrRYen3fKLuFtpxoNndhmkZ7MS1wWmzvDXlKfqQyDmhkoVJ18Ki_XR3foHAtbidnPwJaTpaDSB7H79c8B9hWNcEUvNDwu9QELpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PukYYsvonHuIDrqooahFq8_usnwhyfRog2KPEOV7k95XVCMk4rt5Mw>
 <xmx:PukYYsdEXXzDzOblD9CJcTz5-mTq2AkVblFsQMQqXongRnjs94UMgQ>
 <xmx:PukYYg2v2zlcOTOIAjpH_EAEVMS6V_Avtuz1oTiBWJCeNVnFc1j_uA>
 <xmx:PukYYqsA98Xr2UCLoOlOpOuNa6gCv6TZguw8Sxhx5yfHVu02Xdnq8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 03/12] clk: Enforce that disjoints limits are invalid
Date: Fri, 25 Feb 2022 15:35:25 +0100
Message-Id: <20220225143534.405820-4-maxime@cerno.tech>
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

If we were to have two users of the same clock, doing something like:

clk_set_rate_range(user1, 1000, 2000);
clk_set_rate_range(user2, 3000, 4000);

The second call would fail with -EINVAL, preventing from getting in a
situation where we end up with impossible limits.

However, this is never explicitly checked against and enforced, and
works by relying on an undocumented behaviour of clk_set_rate().

Indeed, on the first clk_set_rate_range will make sure the current clock
rate is within the new range, so it will be between 1000 and 2000Hz. On
the second clk_set_rate_range(), it will consider (rightfully), that our
current clock is outside of the 3000-4000Hz range, and will call
clk_core_set_rate_nolock() to set it to 3000Hz.

clk_core_set_rate_nolock() will then call clk_calc_new_rates() that will
eventually check that our rate 3000Hz rate is outside the min 3000Hz max
2000Hz range, will bail out, the error will propagate and we'll
eventually return -EINVAL.

This solely relies on the fact that clk_calc_new_rates(), and in
particular clk_core_determine_round_nolock(), won't modify the new rate
allowing the error to be reported. That assumption won't be true for all
drivers, and most importantly we'll break that assumption in a later
patch.

It can also be argued that we shouldn't even reach the point where we're
calling clk_core_set_rate_nolock().

Let's make an explicit check for disjoints range before we're doing
anything.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fff5edb89d6d..112911138a7b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -632,6 +632,24 @@ static void clk_core_get_boundaries(struct clk_core *core,
 		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
+static bool clk_core_check_boundaries(struct clk_core *core,
+				      unsigned long min_rate,
+				      unsigned long max_rate)
+{
+	struct clk *user;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (min_rate > core->max_rate || max_rate < core->min_rate)
+		return false;
+
+	hlist_for_each_entry(user, &core->clks, clks_node)
+		if (min_rate > user->max_rate || max_rate < user->min_rate)
+			return false;
+
+	return true;
+}
+
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate)
 {
@@ -2348,6 +2366,11 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 	clk->min_rate = min;
 	clk->max_rate = max;
 
+	if (!clk_core_check_boundaries(clk->core, min, max)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	rate = clk_core_get_rate_nolock(clk->core);
 	if (rate < min || rate > max) {
 		/*
@@ -2376,6 +2399,7 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		}
 	}
 
+out:
 	if (clk->exclusive_count)
 		clk_core_rate_protect(clk->core);
 
-- 
2.35.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD8495040
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFD410E38E;
	Thu, 20 Jan 2022 14:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878710E537
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:34:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F106F3201F4E;
 Thu, 20 Jan 2022 09:34:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 09:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=wBu9J7wxuK4z+ljHUb05tznQulJ5zH
 VjzKdqXqasOyQ=; b=Xa3sTsKAk+TBDKa/QK2yzcaU34qpFxkV0wkwR395SckcVJ
 Hp2Nkm1AgqlET6F04brUHop6lo4tlF6RtBu2JEJbNi+jk5DO7SEMhgqbG3XidfNd
 oONOPeCNGK3lK2lVfZUaek8nbhgKoxjUutRlrr3ga2yJO/C9MALj8uFTmHYLg/lR
 LUL/pMqRTb1hMeku7eUFjaXgcwi958hL+ZAPpunh2FI2XbPrfhpSZ2P/pZZuc/NZ
 IMtPU+2SzZ6pLsaQc5/+PwMaKjQ8L/s9EwiWRzJARKyGJFnqWo2S7K/ljXcg7R2l
 WR07p0+OUkedoNRjF4fCz8Zx2DfV88QIIgPnqIHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wBu9J7
 wxuK4z+ljHUb05tznQulJ5zHVjzKdqXqasOyQ=; b=Ey1rXe0cynh5c95c8SsAYh
 sktDMNYziMOr5SQ0dZm0C+4EubbgL8whUo5huHqAR0zzKGiGnhyg5BoDAM9ivXvs
 1A2uErbeQdgL9R07GJeT+1n1r1uON4MF6IQEnGSqVbjok2uyM4ZZW6F5gdUT/jGx
 rBV4VSMkm1Gr+ktlEEJLHweCPrnH35BNfdyJKvQnGVzX5vErVjXB4lYprYJmPXeq
 N4HFkbDHpfkE+iZhFnhiVEn39jlFDakdoOH+c5f9+dzcOkcZ44jTRmsWishDiHrW
 ynJaJduHUT3oBCbMzxj9/HII2Hdi4fA/6dQiHGHNf6v8vUBNozHpsur7kOVIUdAQ
 ==
X-ME-Sender: <xms:DnPpYfZrM-NRmtVk2UOT9CWM5KCSox15U9iwsqumOHnhufuxsvEtww>
 <xme:DnPpYeYXohLMwyBnhlwEhoYuw_MXVsV6Zhu-pV9zHIbjCXDTPJWIMa3ZIBRw4wGHU
 kjbntUNwh9XeXGQP5E>
X-ME-Received: <xmr:DnPpYR8p5QO7w0YiQBVmym3JrnhPxvk4y6etfK8a0sVOHSR2uxSf8UfC6EPkmIbgxqDHkm9ybis903fueOJXBPl3M7Gstv7n5Mh7wAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DnPpYVrI-5pkbv4J7qfOVQGysAQD1jHevr52zEE1HhEAnmo7COvsRg>
 <xmx:DnPpYarucC4IhV-w1LXcIRLl9jC3F1NSdJRjz1f9Xijp4n0LcKZivw>
 <xmx:DnPpYbT2IC46MJ5Bf-VYavW1MkSW8ZL8HJzI_mwc--ZlrNCMw9MJtQ>
 <xmx:DnPpYaJn-QXCDZkMh2V7iAQ5sk-FLKz7OXeGGaoOYlFmfXdB9HLQwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 10/10] drm/vc4: hdmi: Remove clock rate initialization
Date: Thu, 20 Jan 2022 15:34:17 +0100
Message-Id: <20220120143417.543744-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120143417.543744-1-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
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

Now that the clock driver makes sure we never end up with a rate of 0,
the HDMI driver doesn't need to care anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 053fbaf765ca..43aced269082 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2543,19 +2543,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
-	/*
-	 * If we boot without any cable connected to the HDMI connector,
-	 * the firmware will skip the HSM initialization and leave it
-	 * with a rate of 0, resulting in a bus lockup when we're
-	 * accessing the registers even if it's enabled.
-	 *
-	 * Let's put a sensible default at runtime_resume so that we
-	 * don't end up in this situation.
-	 */
-	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
-	if (ret)
-		goto err_put_ddc;
-
 	/*
 	 * We need to have the device powered up at this point to call
 	 * our reset hook and for the CEC init.
-- 
2.34.1


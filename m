Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A800A49B5DE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 15:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D510E637;
	Tue, 25 Jan 2022 14:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED42610E609
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 14:16:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 559635C0148;
 Tue, 25 Jan 2022 09:16:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Jan 2022 09:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=wBu9J7wxuK4z+ljHUb05tznQulJ5zH
 VjzKdqXqasOyQ=; b=RECGqAH/bQcrKWwcfgTnGSfnDmsCzGXPg0FCX5GG7TD2VP
 +ZdBqsohxHbGtflZaJx+5X92ChrBtjexFTVffnKIu2aasSykq77/We5Cxa2QAUVx
 4mufyT5mCBymLOVBmWE+FpoUMjA//WTUzXYvOlVIiikfFTpxfh18VIaCCY/4Ex0i
 3Vn0QrB09x1heBOa3JFQCH8mY6I4Qjh258zalG4klkKisHIZ5Brk4tVUNE8+pfJq
 AxSlRilpkVw183XN53RbYPbGjq8+JlPCeTKeXGc136OT9EDq/AvIRvmyr1GugtTx
 JKrXXNHpIe2pTIFb9Jv4DyvFjbvanM4wBdN4NFwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wBu9J7
 wxuK4z+ljHUb05tznQulJ5zHVjzKdqXqasOyQ=; b=OeQasaToZRC86lNpmNRFoM
 gC+EhVLluAR/DmFnz5YcGLMrJPO2pjrXSfAsYke4ZJEmtDd/9+cD0qLk6R3CenDH
 acmjKOKqi8goUiUKM/eWuf7gYNnGQh5LRKFRJpKFbqC22CZc9gt00w2ci6EVe3Gr
 ciiwb78NaROqCvgm5XxkepNQPsjq5zn79g5CNa4uvMIxuOorIIT/WuhC2fgHquyA
 NSqfiEZl6FyuLds+FpkwREgXubY9ySVhX/XE5CygDs3YpeQEvcK5OM9oy8JSBL/h
 dN0SK0plaU2j714BnZiAjYDhYcqQAkgy45hYm3fu8YUVdqyK0JcWupEF8JJaR2pA
 ==
X-ME-Sender: <xms:LgbwYS2UEWkND4Wxi5Zscp_am7TL1f1SLA2DVpNQ2DrkH6bCzwPEhg>
 <xme:LgbwYVGhDm_ST4DxuQdgqUpUZGDiaRkBy1gxF-kInMALlfFHEivCNuXWyTXZq2jnQ
 4NkS48L7t7DM8VKs4Y>
X-ME-Received: <xmr:LgbwYa7NNVqFpy_LQJ73lQWS04BbCgvs3gfdKD7M8X3Pg914InR8YcCQF-wOX9-26H9PaPUHgnukaFH_L5APkKIZfydaO6JUqIYNZ14>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LgbwYT1T_oSvlSbNzOBM4Avw63WHd6pQqkNp4BlrB087WUGAx29Jxg>
 <xmx:LgbwYVEDkv0vM35D-9SyC3gJvumEgHU4uEkW2NYfiKUbG-NE797p5A>
 <xmx:LgbwYc_LuPOXVr2paazQTaJm17LAJLD1fkQOtsX9Pg8pQygUJnH1uA>
 <xmx:LgbwYc0hF7sFjq3chHcmcGSJ3tkcQnP4qAXSfj9Sg-Eiahraosxh6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:16:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 10/10] drm/vc4: hdmi: Remove clock rate initialization
Date: Tue, 25 Jan 2022 15:15:49 +0100
Message-Id: <20220125141549.747889-11-maxime@cerno.tech>
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


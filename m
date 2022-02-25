Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB14C47A3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B9B10E673;
	Fri, 25 Feb 2022 14:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC08A10E5CA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:35:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 480C25C015A;
 Fri, 25 Feb 2022 09:35:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 09:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=DD5Ix+IEk47ry3gfmjU/T7/9gYnF9Y
 y1lDEaoDCp7LE=; b=qXsmSUP2pA+nXJK+5gkI4Z/DS81CsPExlPFmX7BDro373y
 6iOIaMZpqUzdoCij5pjRyk54Pk50lQRfIYHiGrvD/OpSWymLYxZW6gJlJ6/M73g/
 7f/Nn1HtfdduA504RijpbuL8dxD6VVLk2krqBnNzAndJjoVqtKlZ6SQH0dO+iwpD
 qimFMr3nlk15mPMfidgkwp6GMlAxplwbsXjtPFLpwnVXUtlDpyUw9i2mHBIZh3Nx
 yKQOpNp/2xdiPkiAFqwYDfH9cz3D5kAUjo1B8ZPWv8rE1wHyXGWZhPOcKPQIuxPV
 krq89gsHnpCc20DOeMYok6JpCkY2gRQTT3eKITTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DD5Ix+
 IEk47ry3gfmjU/T7/9gYnF9Yy1lDEaoDCp7LE=; b=lD7ED90xdTYYNlrDLHTd+S
 uX9fQMveZCGXiZR06fX8BT17sejSiaK+AmKPBCMv6VsxEfza2HOieMJFoYs8dQ69
 1PdDKxvhgtdUm+GK+vvznBO0iJzHvPgbi9o87q3YzRhD0Ww5gnp1rc3olJ4znL9n
 SdBRZVLkrKy5C3rDLBDAI8d/+xvIeUo/rgddx24Eg7CL0kVtaHzKbk/+j6ymmvAf
 VmFT6f2GIQhCDVnfSpaxxEcV7Dw7AbgTJICSAtETO5+1d8gmgfc2Nw7hmHTZvuag
 yO1F4AHekEqto/jlbw9/wzzUQv4V33gw3nLFQFn9G1hNIVFwktidng2cY05Q+pJQ
 ==
X-ME-Sender: <xms:OukYYsDVPi3Yxm7lUAU1yD1pbYiFP7A5RNi7M9cgNXjFh4DJqUhJ4A>
 <xme:OukYYuiewYyf-nzy1WAyti99clJSh1UuA7uE6yGk0qG2oGW-kSPNHdMJPRuZ_wdus
 SXYmVjs-dve0FyW0pU>
X-ME-Received: <xmr:OukYYvlwdYikDNo_pSXHFsO0og0SWC3Stz5L1JxBJztM4SFjr_mIBOXoruj6x9Ro2cfoO5MbgVBwbjJKZkkCQT2o8Nzk1UqMmBsNEj8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OukYYiw88PW1LQwMhhmp_Hhoc7a_Omn0ZlwyTmu3qGvB_AcKN09fbA>
 <xmx:OukYYhTrLGoCIvupspplCxVTXTZ5f-EgWgvCrMovQEZ-5b8QuXNa3g>
 <xmx:OukYYtarqh8rHQFfjrlEOpy_EWljXb6VVeA4d-m0kC3FnUqXDqCFZw>
 <xmx:OukYYiSz8DNrpjWcA0YRKEo0p-mvYgu0zkf-IcWEqGlp3NJAMl_Vug>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 01/12] clk: Fix clk_hw_get_clk() when dev is NULL
Date: Fri, 25 Feb 2022 15:35:23 +0100
Message-Id: <20220225143534.405820-2-maxime@cerno.tech>
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

Any registered clk_core structure can have a NULL pointer in its dev
field. While never actually documented, this is evidenced by the wide
usage of clk_register and clk_hw_register with a NULL device pointer,
and the fact that the core of_clk_hw_register() function also passes a
NULL device pointer.

A call to clk_hw_get_clk() on a clk_hw struct whose clk_core is in that
case will result in a NULL pointer derefence when it calls dev_name() on
that NULL device pointer.

Add a test for this case and use NULL as the dev_id if the device
pointer is NULL.

Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8de6a22498e7..fff5edb89d6d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3773,8 +3773,9 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
 {
 	struct device *dev = hw->core->dev;
+	const char *name = dev ? dev_name(dev) : NULL;
 
-	return clk_hw_create_clk(dev, hw, dev_name(dev), con_id);
+	return clk_hw_create_clk(dev, hw, name, con_id);
 }
 EXPORT_SYMBOL(clk_hw_get_clk);
 
-- 
2.35.1


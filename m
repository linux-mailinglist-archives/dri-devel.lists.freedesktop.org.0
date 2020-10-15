Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAFD2913FB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784C6E23D;
	Sat, 17 Oct 2020 19:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE20C6EC4B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 09:36:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8A6CCF42;
 Thu, 15 Oct 2020 05:36:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 15 Oct 2020 05:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=xk2BTXoTxTn4zzEw65FP3d0gnu
 RDO6T9SchgL9SbCHs=; b=tnEvQi4xGKgURoOpu3WtRH0dTIHGKXnwLHxpI4G3o/
 1ESGtlyn0OYj2LNoxRitsua/cwNpv0Jv+qPYp/UFHTxpQxURHI+6I/8jdS7/KPVS
 mwLMhpXwrZp0mfqNluRzrv6yJs/qw/RlhvsLUNF6Vnc4ApN9fCRsFctA6s7jaxZQ
 Dobjd5X4ZNNMGsbm5mSS3OJHZwF2cvLKwDnedt3nN68qnFv/3/yjztO0pOKRfSAX
 0sEb5gb/j1eNsJFXEQy1MXo1NU7jmpw7TZ0tZEEJRE1mpA3u8MEcMQCH4ilb8Hgv
 JWmzpArLSW3hu86SxMEGxH1vmhy14eHUV1C7UFXPKQ7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xk2BTXoTxTn4zzEw6
 5FP3d0gnuRDO6T9SchgL9SbCHs=; b=Zg9tz59MdwRZXntQ42JHAm6BBtjox72AX
 wlwtvQJeEeH4PatQLRToz7Je28VUC9/8IxplMDG/ZreVDBCEbjmupSlZIXqIaleE
 bIxjFXDcmn6q793GtTKkMQxMYTNpBn8E5G36bYzs8ANh7OBQ+Mj4t5E8ONz/2blV
 zmsPxxrRTLxT6o7gRSD5X+iel+ruwU7rA7rvXDNgOO0bWnu90SUGX6/VtM+5m7Rg
 wRSJ/rKU9eSFhu0KVG+8GwOZGhqrTl7C2YpzG0nJ7K9FRdVw0GFGKworn0qRRKSl
 hpqUsByMo25lJ0xsI4yecMCvcXSrV+85vPhxSdMDM/TGaOqaPHlnA==
X-ME-Sender: <xms:LRiIXyql9EZjPAsRWz3CPmEUngBI0aK7ByJsGir8ALf5-7L-pVClQA>
 <xme:LRiIXworPPmZQV-ZhUrheDfZJ62Ffgw-lOSINFcpNPUC8AKVgQk-wl_g4T_hpeHOH
 LPyIR9zZGBAGhgUL44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieefgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LRiIX3On4X0UJj_CmlwN3GnBBCrntC-0bEKDFUfsqQd3SXlbMkkUug>
 <xmx:LRiIXx4KbbLo56lYF2-TzmOlxw0sYgo-dw4diSMgOgB2y3e5Ufrryg>
 <xmx:LRiIXx4HcINpLPs5Iyo-rOI3S2stK1uMN6dX6Pyd6MIjYbBuA6-7mA>
 <xmx:LhiIX-uo3S-E4NC5MjSrNEQM7nn4OZzYqWpNEVWRNGlWXhmuhPsLXA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2DFBC3064610;
 Thu, 15 Oct 2020 05:36:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] drm/sun4i: frontend: Rework a bit the phase data
Date: Thu, 15 Oct 2020 11:36:40 +0200
Message-Id: <20201015093642.261440-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: Taras Galchenko <tpgalchenko@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The scaler filter phase setup in the allwinner kernel has two different
cases for setting up the scaler filter, the first one using different phase
parameters for the two channels, and the second one reusing the first
channel parameters on the second channel.

The allwinner kernel has a third option where the horizontal phase of the
second channel will be set to a different value than the vertical one (and
seems like it's the same value than one used on the first channel).
However, that code path seems to never be taken, so we can ignore it for
now, and it's essentially what we're doing so far as well.

Since we will have always the same values across each components of the
filter setup for a given channel, we can simplify a bit our frontend
structure by only storing the phase value we want to apply to a given
channel.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_frontend.c | 34 ++++++--------------------
 drivers/gpu/drm/sun4i/sun4i_frontend.h |  6 +----
 2 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index ec2a032e07b9..7462801b1fa8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -443,17 +443,17 @@ int sun4i_frontend_update_formats(struct sun4i_frontend *frontend,
 	 * related to the scaler FIR filter phase parameters.
 	 */
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH0_HORZPHASE_REG,
-		     frontend->data->ch_phase[0].horzphase);
+		     frontend->data->ch_phase[0]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH1_HORZPHASE_REG,
-		     frontend->data->ch_phase[1].horzphase);
+		     frontend->data->ch_phase[1]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH0_VERTPHASE0_REG,
-		     frontend->data->ch_phase[0].vertphase[0]);
+		     frontend->data->ch_phase[0]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH1_VERTPHASE0_REG,
-		     frontend->data->ch_phase[1].vertphase[0]);
+		     frontend->data->ch_phase[1]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH0_VERTPHASE1_REG,
-		     frontend->data->ch_phase[0].vertphase[1]);
+		     frontend->data->ch_phase[0]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH1_VERTPHASE1_REG,
-		     frontend->data->ch_phase[1].vertphase[1]);
+		     frontend->data->ch_phase[1]);
 
 	/*
 	 * Checking the input format is sufficient since we currently only
@@ -687,30 +687,12 @@ static const struct dev_pm_ops sun4i_frontend_pm_ops = {
 };
 
 static const struct sun4i_frontend_data sun4i_a10_frontend = {
-	.ch_phase		= {
-		{
-			.horzphase = 0,
-			.vertphase = { 0, 0 },
-		},
-		{
-			.horzphase = 0xfc000,
-			.vertphase = { 0xfc000, 0xfc000 },
-		},
-	},
+	.ch_phase		= { 0x000, 0xfc000 },
 	.has_coef_rdy		= true,
 };
 
 static const struct sun4i_frontend_data sun8i_a33_frontend = {
-	.ch_phase		= {
-		{
-			.horzphase = 0x400,
-			.vertphase = { 0x400, 0x400 },
-		},
-		{
-			.horzphase = 0x400,
-			.vertphase = { 0x400, 0x400 },
-		},
-	},
+	.ch_phase		= { 0x400, 0x400 },
 	.has_coef_access_ctrl	= true,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.h b/drivers/gpu/drm/sun4i/sun4i_frontend.h
index 0c382c1ddb0f..2e7b76e50c2b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.h
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.h
@@ -115,11 +115,7 @@ struct reset_control;
 struct sun4i_frontend_data {
 	bool	has_coef_access_ctrl;
 	bool	has_coef_rdy;
-
-	struct {
-		u32	horzphase;
-		u32	vertphase[2];
-	} ch_phase[2];
+	u32	ch_phase[2];
 };
 
 struct sun4i_frontend {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

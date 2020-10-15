Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1962B2913F9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556C96E22F;
	Sat, 17 Oct 2020 19:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE88A6EC4F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 09:36:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BFC1CC29;
 Thu, 15 Oct 2020 05:36:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 15 Oct 2020 05:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qAsJeD+LNPA8w
 Tn40pa+uw1QwTkvzNCGa4JCbB4Syms=; b=gPN/7pFfTw+9ZEumZnkVe6xFSy2Ae
 cUB4yFGprCI7E5JznqIHU3debtm1J1RJF7EM2ExKI6CY9WyI90ZacG49kW8Ucl1/
 rNO4ME8rWG619nCJv9Xqcriozp15wAQNJHsXseec/Ub1B2lQu//++Yv3FGWL6jP6
 3W7QNUoD4Oxg0/toxARwYK6wRKjkvM5kDDZ1XW+AETbAOvP5W1x+e9EDgP8UrEDB
 /1rp8lcXqYWf1Qhp75ulXmOOAOlwf7S5VfnjmPQH/Ekv5e5nFit62IDQhz50W6e/
 JiyL5j8LY4HjfbE9jl/jjYApZAghXuQKOn1sQ2hmR+sGdZs0XKV0c7I8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qAsJeD+LNPA8wTn40pa+uw1QwTkvzNCGa4JCbB4Syms=; b=GeH3EDfP
 Nq8WVLdXniuGatIv6LWI/z7qmhGAGLGUj7VMi1noo0v3WPMCwrWuxyvCxx3wMY/K
 mMetFvBU2+b9cZNmP1yGhpAl6lPX1z5X62U3j3L3xeHLaxym7LBaaJ8E4Q4Pzwlu
 4OHwhqzi/Ftfh0ezxw5Ok7XYby8TnEVqggswEJa0s1/va1Oz/PAIRQyIVRO+xLGt
 PNtxK4aemeF56PmrYAt3a1Xjzv5VzsSZ2mjdxMPqxEHdS3szKtz8OYdLasSrHQ9u
 uLnXuPHWe0wyMgVsw/MCNCGdMcnOvoj+pUPSRGIJkK7PR+IpGvyuq/Q2h8FVxZFq
 iEC6O6fzLCNmpQ==
X-ME-Sender: <xms:MBiIX8Av7wIeMzGXS190fzqyEUmWiVZBcEMKdz6oUoz7Mct9qunanQ>
 <xme:MBiIX-jws_Gb0AgKYH8uPTSO6VWu_z5lfDPZN8GXNPc8kJxFvD-sjYUvST9sSFfX5
 3_XHi_v_6_LmCJSDiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieefgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MBiIX_laTtESizIY28ZU_1DYkUxBn84vUA4J4s300liVanfq32UVlw>
 <xmx:MBiIXyzeh5RZypvwYNXVvfDXdKvBOllaJ5FAaXfEMkljyAZCnPQTLA>
 <xmx:MBiIXxTlSIRGt4ugrYlVkavIFCgZlPNk3NkDkPU7br5Jd1W85_uXyw>
 <xmx:MBiIXwEFiOsF_YtZOOsJmEj6bSMbHvTyQrArtXE20isecowslMXpbA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D42D23064610;
 Thu, 15 Oct 2020 05:36:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] drm/sun4i: frontend: Fix the scaler phase on A33
Date: Thu, 15 Oct 2020 11:36:42 +0200
Message-Id: <20201015093642.261440-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201015093642.261440-1-maxime@cerno.tech>
References: <20201015093642.261440-1-maxime@cerno.tech>
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

The A33 has a different phase parameter in the Allwinner BSP on the
channel1 than the one currently applied. Fix this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_frontend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index d32b12cbbb60..ff4187eab519 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -694,7 +694,7 @@ static const struct sun4i_frontend_data sun4i_a10_frontend = {
 };
 
 static const struct sun4i_frontend_data sun8i_a33_frontend = {
-	.ch_phase		= { 0x400, 0x400 },
+	.ch_phase		= { 0x400, 0xfc400 },
 	.has_coef_access_ctrl	= true,
 };
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

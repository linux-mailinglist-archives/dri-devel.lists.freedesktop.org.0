Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A193921532F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9F36E353;
	Mon,  6 Jul 2020 07:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDEE6E02A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 13:38:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 75DB05C00BF;
 Sat,  4 Jul 2020 09:38:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 04 Jul 2020 09:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=awwlzHSud02pzpUia/C+VkZ8dj
 FnBAxJFReM6NFKbSY=; b=hj8UUCwpWlqb4Z0Pmt3wd0TpS4QVMgKFJ0S3VzAP++
 BFEfaScj+DzYOMgAM1gCh1SaeD5BwHpxFoYJ4YaOICTYGYuOfJHrW286PhMO0rZ1
 rt+ZMeBMm/Zo+jqnqJLu3NOh9HT60WVvbwyLsbfa3XAN+OYibQ6C0b4Jpvxjt237
 PWhZEv8X4EgAD4wOaUHMsYc/SqycunJCVXeB6KpZSFJePel+YvMrb/Z8LTXgA5Z+
 XBTrfIC9yq9lM/TVC5/IjRzLSHnjemHrxQ1hTWwCjbvQbGhNQXTp5Ln5wvhFjKko
 lJMCJvTgv+3yZUtTTdcGQNULgWOwlHnVBJK3Z0c4ia2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=awwlzHSud02pzpUia
 /C+VkZ8djFnBAxJFReM6NFKbSY=; b=PtRC86pLPUimBOcnypAwOvQcALrPIZf6x
 jH+xOnMtkcbxwgeP5rGQws8NtLBkdk4uhYudbXsC99D6NBAYDi8zu/bLKjqi7T4t
 upVo5zI7q2zglxC8dpmgXMZ6ngqD7+E31v+6/3BxUJYVME3cPRlvxxAwNPk3TM/8
 zX4DxpkG7PlOWszOkFXCz7JdGI0vxwFSOwRBTJbTlqRj7blSVfMTNgNFTmsApTSv
 nb7zkAOolUwQpZVtUbG29MbMoClE4ORDSEnsgH/DAR9jQziMRD2e0fpQ4R5+KSAb
 NoNQIDmiqf9giWG5IUlLpJxAFKR6zyaGXGO0uBHEstOclsU1J1pOg==
X-ME-Sender: <xms:PoYAXyTd7HBurx8JXnxcxcO42J_DSBV8iLpOAmu50LlQxMxTkq2xTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdekgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhho
 rdhtvggthheqnecuggftrfgrthhtvghrnhepjeffheduvddvvdelhfegleelfffgieejvd
 ehgfeijedtieeuteejteefueekjeegnecukfhppeeltddrkeelrdeikedrjeeinecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvse
 gtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PoYAX3ycrkA_DORdgwfqJ1DzO3uSr9u2U72N-cWqnwkm5IR0PBqx9A>
 <xmx:PoYAX_1goCwrXH2VjRUSsUBRMpxW6jBkg69ZDfktjnQUxeyxH__gng>
 <xmx:PoYAX-AFjCu6BK3qgIZjX9_N4eX7ZBQmebJyOOmW8A4xw2EqA1IX5Q>
 <xmx:QYYAXzbtaal898n8dPTYT10mg0-Apirotg8ieoDPAnpBpZ6oexFmkQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 005F43280064;
 Sat,  4 Jul 2020 09:38:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/sun4i: lvds: Invert the LVDS polarity
Date: Sat,  4 Jul 2020 15:38:03 +0200
Message-Id: <20200704133803.37330-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LVDS controller can invert the polarity / lanes of the LVDS output.
The default polarity causes some issues on some panels.

However, U-Boot has always used the opposite polarity without any reported
issue, and the only currently supported LVDS panel in-tree (the TBS A711)
seems to be able to work with both settings.

Let's just use the same polarity than U-Boot to be more consistent and
hopefully support all the panels.

Cc: Ondrej Jirman <megous@megous.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 359b56e43b83..e44635ebd510 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -474,9 +474,7 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 		     SUN4I_TCON0_BASIC2_V_TOTAL(mode->crtc_vtotal * 2) |
 		     SUN4I_TCON0_BASIC2_V_BACKPORCH(bp));
 
-	reg = SUN4I_TCON0_LVDS_IF_CLK_SEL_TCON0 |
-		SUN4I_TCON0_LVDS_IF_DATA_POL_NORMAL |
-		SUN4I_TCON0_LVDS_IF_CLK_POL_NORMAL;
+	reg = SUN4I_TCON0_LVDS_IF_CLK_SEL_TCON0;
 	if (sun4i_tcon_get_pixel_depth(encoder) == 24)
 		reg |= SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS;
 	else
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC07D2FFE86
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EDA6E9C3;
	Fri, 22 Jan 2021 08:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934456E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 10:58:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D46B5C010E;
 Thu, 21 Jan 2021 05:58:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 21 Jan 2021 05:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=bCttatL+/9UPxzkN/HTHwa5z7a
 1198krHiS9aMjLURw=; b=fFxdQC5Xlx2PiDSEciS/WrlUjhG7jl/5VOV5WtsYMI
 fiplSLm+MXdRFeJkay0sbHveSqr/SVwsBTyYdhhULLipdRIBGIPjayw47hpA6sOc
 WqGjj/0C1KzRjksEO2OClKWPw/MZNh6HCzWtgNymGPrnakdfpbYpmJ4kaQjUd33A
 NX6Boev9iZ/mMY0RGtCG4angNZ/Vtiere+afx74YdyOCXgXUHkMn0WX1VSmwTx5k
 1PbKQ/jDzIFe82b/OGLcZAP8OK5llJdrYgguEncw3sejB8Hww84+5kKRmNTsXZUd
 2/3ZOtzDBEHuPzKA5gHkxa/xkxVQk2cNNmraFQRhDmqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bCttatL+/9UPxzkN/
 HTHwa5z7a1198krHiS9aMjLURw=; b=kRDAa3W2z301DKveDjnYTBqV/tPK/8iko
 9nEgcBvjfAqtniFoTmgDjVl/Iw258ck5luo/cr0pEbvzutd+N+iTesPVahID6bg6
 MiABT9MTKvS2AxdFEjdEX4IZ9JtpBkBvkbVMzcLPRqbdF6G0EfUUzj3iy3Qu3d3q
 W4rTXNaHJsIenQeu2hm8BNKwLJqfMzosbwhWwivR/jjchoXUEchh9CKy7EEiSkiC
 W2I3RFQ6wT0mBGUtTyEF6ZBCOO1LLmbQhUFhd+tSOKug/xYoqBLu1Bz+3wnkEeTT
 6plr9yhwESvTpW9dm4SX3TvbXpGW2/5+lvfte785ED7qlwzGMJJqw==
X-ME-Sender: <xms:PF4JYOJTwJBh1ZC-gYfcbmu-zaDffKeyt5GfS7OznBYsbRSnOMgfNQ>
 <xme:PF4JYGFEDia8MAw-lZzTmvwOMgfSUnAQcAQVovdiDgW0gf24P8u_Nk-n2vBEdceCG
 mwf_ROGcOEXgmbnSCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PF4JYLk4E872nEFIE8yUOuzyTuFgDdXsM4Wi6NYCP9kSOiklUG-Cyw>
 <xmx:PF4JYLJJXH0DRBdE85C5OsdcUmmnpGoJNZE_1VUp_wN07Gqbz08qNw>
 <xmx:PF4JYEZWmKWyQhHwr0LR7z06F7WIsEn4sUzpAjv6LsMOFnZb39rX_w>
 <xmx:PV4JYMWakpiYaD62ZF3OL5z8QJn0VuLver7tppN6PAsYr0XnxYHUgA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C3CD1080064;
 Thu, 21 Jan 2021 05:58:04 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/vc4: Correct lbm size and calculation
Date: Thu, 21 Jan 2021 11:57:58 +0100
Message-Id: <20210121105759.1262699-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Dom Cobley <popcornmix@gmail.com>,
 Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>,
 Lucas Nussbaum <lucas@debian.org>, Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

LBM base address is measured in units of pixels per cycle.
That is 4 for 2711 (hvs5) and 2 for 2708.

We are wasting 75% of lbm by indexing without the scaling.
But we were also using too high a size for the lbm resulting
in partial corruption (right hand side) of vertically
scaled images, usually at 4K or lower resolutions with more layers.

The physical RAM of LBM on 2711 is 8 * 1920 * 16 * 12-bit
(pixels are stored 12-bits per component regardless of format).

The LBM adress indexes work in units of pixels per clock,
so for 4 pixels per clock that means we have 32 * 1920 = 60K

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c   | 8 ++++----
 drivers/gpu/drm/vc4/vc4_plane.c | 7 ++++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2b3a597fa65f..c239045e05d6 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -622,11 +622,11 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	 * for now we just allocate globally.
 	 */
 	if (!hvs->hvs5)
-		/* 96kB */
-		drm_mm_init(&hvs->lbm_mm, 0, 96 * 1024);
+		/* 48k words of 2x12-bit pixels */
+		drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
 	else
-		/* 70k words */
-		drm_mm_init(&hvs->lbm_mm, 0, 70 * 2 * 1024);
+		/* 60k words of 4x12-bit pixels */
+		drm_mm_init(&hvs->lbm_mm, 0, 60 * 1024);
 
 	/* Upload filter kernels.  We only have the one for now, so we
 	 * keep it around for the lifetime of the driver.
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 6bd8260aa9f2..b98eabb52920 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -437,6 +437,7 @@ static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 static u32 vc4_lbm_size(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
 	u32 pix_per_line;
 	u32 lbm;
 
@@ -472,7 +473,11 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
 		lbm = pix_per_line * 16;
 	}
 
-	lbm = roundup(lbm, 32);
+	/* Align it to 64 or 128 (hvs5) bytes */
+	lbm = roundup(lbm, vc4->hvs->hvs5 ? 128 : 64);
+
+	/* Each "word" of the LBM memory contains 2 or 4 (hvs5) pixels */
+	lbm /= vc4->hvs->hvs5 ? 4 : 2;
 
 	return lbm;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

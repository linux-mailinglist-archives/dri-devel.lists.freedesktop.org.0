Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 243CC25D1F0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2D36EABF;
	Fri,  4 Sep 2020 07:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B86C6E199
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 10D9B773;
 Thu,  3 Sep 2020 04:02:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=qWv3080+04I3x
 tFsr6akNZMKAgFUHWpEILEWQrHaXl4=; b=WqelfLXDNznqEKCHPkckhvq7jCWQ9
 aFfbvgK0FoOttrA1Gd1aXg4t7jDq7CMR+VUeUudWSUGY2Hkum0uRc5CL46tBUb3Q
 nAfuyWw+JOKMcirSnQGtnell5By+WN1XRZ9u2dy8vsYOh2RYXOtOq0PKlVZdxpx/
 kfAxmJNGOzJNlPD+zfhiuid/iCpjYfSepUovmuEVoNDwdfSxuiGkxhquqrKcUH0H
 w4Cl2i9+I458cH/Hlez3TGxca4jUbHY7t5NGCthU808abNF5mEFUWCbZEzoTxbOC
 WrWSx9FGekKBufkx6ALn9nSadY1k8y4VnZVlPk7wX4LySEYsTSKaIpIbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=qWv3080+04I3xtFsr6akNZMKAgFUHWpEILEWQrHaXl4=; b=YWjVwqtQ
 jWrFviJNnYB7RuJv+GS869qPgEPq2nexSQ3FXIfYhby8YQ2ee2jUJ/VMMADjHnS8
 nzJ0SqvYNIu0qVbJcTe/8Yo429xCFt7yXWCmgm6RJqoO/gXca3UEpwAwRt9Yttm5
 wlv80BoXaxVeVtleyJL5mWD85Jo7eS6DIxl8vBaZq89ywd2H6hFzLfuFAt02ZBMi
 H9isCtKYtGHC0EIp8/M2wdCbEKvmFSuu8pYteUBlJ05Q2op6ki/1V4UWTZ8CNM7E
 RsJWCBYGRDEXoqe29GU1q44ZOPN3WcrtwyBOuzhoFQ5nxJjLU93jUMtPvqJqYFbM
 BLX6jrzVUFVd3w==
X-ME-Sender: <xms:-aJQX0YCJLx8shUnfY7K33mAhLWwqp8D8n_V4Hewd1YGl2c7C8PE0g>
 <xme:-aJQX_b33Yn9v4HNpK-BoMALOUL7MHmKPj78UTU56Ku0dRXR9mPL6iMmv54skGooF
 mgfTWn5CwGxPa4CJsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-aJQX-_vcQK4bgcq87i_xch7_5RMrmKjmnnFM3SZEyyPT3b-PRXlQw>
 <xmx:-aJQX-pOSx-weiKZGYZYtduejF5PrSK0LAej8J77JfNRe-CYDCpD2w>
 <xmx:-aJQX_qZ8uPxg264JBPY_KSpHYn3AZZKfO1lCgoUHB8x-_0eJ5apTw>
 <xmx:-aJQX4RTKIm3kTM0yEmA0zx947TpIDsDhDoJLXWifKhy9i1rZVC2_WBuIMo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B9D3306005B;
 Thu,  3 Sep 2020 04:02:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 05/80] drm/vc4: plane: Optimize the LBM allocation size
Date: Thu,  3 Sep 2020 10:00:37 +0200
Message-Id: <b9e091883a4f7395c5b6a4f7c6070225934293db.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The current code is using the maximum of the source line size and the
destination line size to compute the size of the LBM to allocate.

While this is simpler, it starts to be an issue with modes such as 4k with
a quite long that will consume all the available memory, so we no longer
have that luxury.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index d0771ebd5f75..23916814b4e3 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -437,10 +437,7 @@ static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 static u32 vc4_lbm_size(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
-	/* This is the worst case number.  One of the two sizes will
-	 * be used depending on the scaling configuration.
-	 */
-	u32 pix_per_line = max(vc4_state->src_w[0], (u32)vc4_state->crtc_w);
+	u32 pix_per_line;
 	u32 lbm;
 
 	/* LBM is not needed when there's no vertical scaling. */
@@ -448,6 +445,18 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
 	    vc4_state->y_scaling[1] == VC4_SCALING_NONE)
 		return 0;
 
+	/*
+	 * This can be further optimized in the RGB/YUV444 case if the PPF
+	 * decimation factor is between 0.5 and 1.0 by using crtc_w.
+	 *
+	 * It's not an issue though, since in that case since src_w[0] is going
+	 * to be greater than or equal to crtc_w.
+	 */
+	if (vc4_state->x_scaling[0] == VC4_SCALING_TPZ)
+		pix_per_line = vc4_state->crtc_w;
+	else
+		pix_per_line = vc4_state->src_w[0];
+
 	if (!vc4_state->is_yuv) {
 		if (vc4_state->y_scaling[0] == VC4_SCALING_TPZ)
 			lbm = pix_per_line * 8;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

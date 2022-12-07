Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00CF645972
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B6610E39D;
	Wed,  7 Dec 2022 11:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC9410E399
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D64665C01EE;
 Wed,  7 Dec 2022 06:55:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 07 Dec 2022 06:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414128; x=
 1670500528; bh=8JXNhnLEO28YrVpxQj1wOWrxTedcnvz7vhR6KkgQoco=; b=R
 LmKnjjXZBm6rBghyUwCjAT9o/I/63f95yIyiAFZzYdCE9yrjv7mUtlipTewOb9eN
 wwafVTRbR4v/cMIdILFVBh4tTioq22RL4UoQMMG9Z9sEEoCO816NyJ/Qu5ab5LbW
 OxjdrT7QBHpuB1DHcfGbvF08MhJoq4n+hJB+CkLJRRw0Ks+HiWhIZ95n4oXSt3Be
 k5qCr4OTpDiq1Wr8xaaKNoUZF0Gfz2uJri5U80QcHlqv2xsFrpxPnAJpebP9b2Cj
 uNkfGN0V3VjtzWgpRemDiwN1+BkF9WAOh4PontCJBYGEIUZrIbfqm27M02r+Nvkv
 5RZsuleR4K22SW0Y/rxqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414128; x=
 1670500528; bh=8JXNhnLEO28YrVpxQj1wOWrxTedcnvz7vhR6KkgQoco=; b=p
 Ft34ah9Fu13Yv7AllVsSCvN7m6JJvCKcAEa1SZoUh9WYB3PoqnvmJMAWNRxVCSiz
 hzHdS8iTSLCOxxeXL1OkLu+lFfwFX7puwMsSe2Ts1meus9Xpda+Fpg9P0AKRZ2ep
 t6ymLvKYz54w3ViQ8qYJEeINM5rFRdaHjvHEfE5yFTxb53dNqCvluTz/eOyGIFID
 Q/54PsDKnrvFr1etXD8b4qbWOv6XzpGCDvMooazvEL8f4wG7jEOLVIIDhsvweoRD
 zuIzGdt4/J+1ih+eI4VAuNghWEWv29H/Z0LrTnDqC+HJxAqQWn8sRXiU+zQr+DNp
 caIeYf25VY49y3q02IQBg==
X-ME-Sender: <xms:MH-QY7iUtB36Mx6S3PvqkQflLGUAe-ps5Jagiaq4g2spx4VAMN2X6w>
 <xme:MH-QY4C-FtWUceCdBzt7Cmc5Rq2ZDqcW0kpzLAYioZKFUXSJ1Mys4534vWutETdb7
 c35b28axoQfGH7SOfI>
X-ME-Received: <xmr:MH-QY7F0Nr_WQjCTbLOO6Hny1qFCf7aT9L6z9pv3UswKQZ0kq9UCXe0VIsNL1cr0RxSGAotWaS-f4a-aTH3j_9nJ74-od1zsrGF0R--4IvVSaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MH-QY4QhFq2ypmMkLHzgrdbgj_CKWdQi3rvxC2gf19T0weSCJFUWng>
 <xmx:MH-QY4yhfC50z522s0pLDPvJU0EKbtEQTVdW1SUV0PZKa6B3SdV00Q>
 <xmx:MH-QY-4sK5rG0qXsXdoZ7g-elQtri6o0DsGIDw-Kd1RGNN0UVIY9sA>
 <xmx:MH-QY5rhdN09WAag6wFeRv-mT1bnm2JJXPpika02dIaR36-y6FDgjA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:20 +0100
Subject: [PATCH 09/15] drm/vc4: plane: Allow using 0 as a pixel order value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-9-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=D88ulcoenFvBXOL7I0IQHsqV5VXn1HkB+dnvXbQe7Wg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lZ+5nstOE3Avry7+Leqn7ulwv2rVWoH/igtP9EcmTVL
 50NJRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACayTpyR4UdEs8CS2R6suke1ntu4P/
 vFMWPWxdhTC6dtT2mwbU/0L2P4n6acL/dvQr5lS7GhQN9KqfCCfkmROO0bh59FBnb0SlWxAQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

vc4_plane_mode_set for HVS5 was using pixel_order unless pixel_order_hvs5
was non-zero, except 0 is a valid value for the pixel_order.

Specify pixel_order_hvs5 for all formats and remove the conditional.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index eb0ac2167937..8b4805c937f0 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -65,11 +65,13 @@ static const struct hvs_format {
 		.drm = DRM_FORMAT_RGB565,
 		.hvs = HVS_PIXEL_FORMAT_RGB565,
 		.pixel_order = HVS_PIXEL_ORDER_XRGB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XRGB,
 	},
 	{
 		.drm = DRM_FORMAT_BGR565,
 		.hvs = HVS_PIXEL_FORMAT_RGB565,
 		.pixel_order = HVS_PIXEL_ORDER_XBGR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XBGR,
 	},
 	{
 		.drm = DRM_FORMAT_ARGB1555,
@@ -87,56 +89,67 @@ static const struct hvs_format {
 		.drm = DRM_FORMAT_RGB888,
 		.hvs = HVS_PIXEL_FORMAT_RGB888,
 		.pixel_order = HVS_PIXEL_ORDER_XRGB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XRGB,
 	},
 	{
 		.drm = DRM_FORMAT_BGR888,
 		.hvs = HVS_PIXEL_FORMAT_RGB888,
 		.pixel_order = HVS_PIXEL_ORDER_XBGR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XBGR,
 	},
 	{
 		.drm = DRM_FORMAT_YUV422,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV422_3PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
 	},
 	{
 		.drm = DRM_FORMAT_YVU422,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV422_3PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCRCB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCRCB,
 	},
 	{
 		.drm = DRM_FORMAT_YUV420,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_3PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
 	},
 	{
 		.drm = DRM_FORMAT_YVU420,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_3PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCRCB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCRCB,
 	},
 	{
 		.drm = DRM_FORMAT_NV12,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_2PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
 	},
 	{
 		.drm = DRM_FORMAT_NV21,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV420_2PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCRCB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCRCB,
 	},
 	{
 		.drm = DRM_FORMAT_NV16,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV422_2PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
 	},
 	{
 		.drm = DRM_FORMAT_NV61,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_YUV422_2PLANE,
 		.pixel_order = HVS_PIXEL_ORDER_XYCRCB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCRCB,
 	},
 	{
 		.drm = DRM_FORMAT_P030,
 		.hvs = HVS_PIXEL_FORMAT_YCBCR_10BIT,
 		.pixel_order = HVS_PIXEL_ORDER_XYCBCR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_XYCBCR,
 		.hvs5_only = true,
 	},
 	{
@@ -1031,15 +1044,10 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
 
 	} else {
-		u32 hvs_pixel_order = format->pixel_order;
-
-		if (format->pixel_order_hvs5)
-			hvs_pixel_order = format->pixel_order_hvs5;
-
 		/* Control word */
 		vc4_dlist_write(vc4_state,
 				SCALER_CTL0_VALID |
-				(hvs_pixel_order << SCALER_CTL0_ORDER_SHIFT) |
+				(format->pixel_order_hvs5 << SCALER_CTL0_ORDER_SHIFT) |
 				(hvs_format << SCALER_CTL0_PIXEL_FORMAT_SHIFT) |
 				VC4_SET_FIELD(tiling, SCALER_CTL0_TILING) |
 				(vc4_state->is_unity ?

-- 
2.38.1

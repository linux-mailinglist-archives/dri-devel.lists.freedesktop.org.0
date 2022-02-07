Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38274AC5D4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B94010F995;
	Mon,  7 Feb 2022 16:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7F10F8BB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:06 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id BA0B02B0014F;
 Mon,  7 Feb 2022 11:36:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Feb 2022 11:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=Bov04kP2JGAYrnk1OzmvJ0etTOODRy
 OvL+eaYVZaOxc=; b=R2cyBwwSds0EdygXTR/rfpDNIEhmV7aKk911zu/5ZX1MXJ
 OwySGUF+miyylbWW1MVs04krASsyaEBmA3tI8faCaYoiBkoRmxarBcYn/fJDPe2t
 PKGdxTjjBIJrYF30PF/QMYGeTWOGzQJKuc3OhlRhU7Ci/elBWYX255mkjMk0IGYT
 +UTtzbrdkClTspDs+Ris7WlH8xOSwFRZXP1FHCizWsww/nQl6rS1F8mySgzqpbg6
 JUkQ5a4M3fGoF8KPgzBi31DKss8eJK0zddsD0aUL1+vKcnSj0kxXiTvAx0dO39g5
 bzs4faFJgFPJM86iKgpUwLfYqcaohSZU4lJVvpDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Bov04k
 P2JGAYrnk1OzmvJ0etTOODRyOvL+eaYVZaOxc=; b=iyJXnOVu4VyEX0ij/yTENt
 KXnSHmYsVEht+Jb5JrOnLGSQACwl6/FpYNVdKGkk8EjmpZnH15Lb9SyB+BAEfUEX
 FwA2PGqljIRE4nu2Pk1Xl3qvZBjnMxINvXko/cRmHOIQoL623pP2pH/L5kgxKeM9
 6YxGWyhnl1y6T8kdSmUUWY6F527JyDJT2DEy8bskP2VH36xQIj2AhAye9iDweCBo
 ow5EGREnzk3YbxkKOfTNB7Ax0fRZ2v8aGuFwEZI/sPKbvsmHzpqsNEDIV4fZ74gK
 sBUmCMQjG08Z9nZ3dimHjmEcRtIwzTez+NHSzNyXYOCIK3BqPGA6k5OPBZQijnqA
 ==
X-ME-Sender: <xms:dEoBYrF4C7DFVQDxOnuS3OYOB6OES3AwMT68NBgjQ_wV-zN45VIZBA>
 <xme:dEoBYoWFc0zFomVjgJ9T1jWvKGX99XSD427ux-qNqJx3xCU_RoXIuYvGJvhZw5dtL
 ywPuuTB9s48H-QALcM>
X-ME-Received: <xmr:dEoBYtKvIbuaT19FxFU_16oRASOluDOPmdPE6stGnl1wNPUoQSBEXwdFxcDwL0mNZkpspdh5UiMvkUUQnz9_PyrfYPssBvnDrmve-60>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dEoBYpH0yWdF8a8rFvp33UYsznS_pC7GmuyQ6tBiqYFr9rF5Qm1pFA>
 <xmx:dEoBYhUspxLWlg6VgYKfPQp6yLuF9D_PBEW6dsFtaiNfogzvL1LwTA>
 <xmx:dEoBYkM_C32Z6lbmGI4c0iuAgFltKh2p1_dM1tl1x_sDPy5INm-Tiw>
 <xmx:dEoBYpRb-TyYQemDBn5toAF3ZoApohVLqI5zEOPksGDYsNvCZMoNWVQClfg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 15/23] drm/omap: plane: Remove redundant zpos initialisation
Date: Mon,  7 Feb 2022 17:35:07 +0100
Message-Id: <20220207163515.1038648-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The omap KMS driver will call drm_plane_create_zpos_property() with an
init value of the plane index and the plane type.

Since the initial value wasn't carried over in the state, the driver had
to set it again in omap_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: Tomi Valkeinen <tomba@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index e67baf9a942c..d96bc929072a 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -414,13 +414,6 @@ static void omap_plane_reset(struct drm_plane *plane)
 		return;
 
 	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
-
-	/*
-	 * Set the zpos default depending on whether we are a primary or overlay
-	 * plane.
-	 */
-	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
-			   ? 0 : omap_plane->id;
 	plane->state->color_encoding = DRM_COLOR_YCBCR_BT601;
 	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
-- 
2.34.1


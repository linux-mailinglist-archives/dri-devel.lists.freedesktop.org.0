Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0518E4AC5DC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACB410FB09;
	Mon,  7 Feb 2022 16:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2133310FB09
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id DB60C2B00154;
 Mon,  7 Feb 2022 11:36:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Feb 2022 11:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=uCJFJDWarZsHnFlN/AOqdk1VZm4dbf
 pI6Jkbiavo2Rs=; b=az1WL3Gg+qjOM+d2vsrAUVb7KmFKgHXtrdmIpgf6mm+fYk
 daWBQVhgUki5vuOHW2CavS9IkngbKkg3AYVtXV5n5W9+5RVHlCT6UrTIjkaiNW2J
 aT0qyWpxty3cF57/MoFufr0klxG9xikgr4DjGzFnFoiBnxTa0R6LLAVtGdmHAT6x
 HLMUcBDH+MnZKGuVxuW/NFQkKsWMykYQTKhobgFJsDrDXniTSBHM0OcNDsGK6Puh
 fi6JNhG2aZuvEWFL+WFVADiY5kWiQZpXA531Cfzp6c5lAa3DGKGc3k87vj87yqdU
 npe2a2sVfu0Adgn0YiYQEk8ZKaPQA4XFNKwrbI6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uCJFJD
 WarZsHnFlN/AOqdk1VZm4dbfpI6Jkbiavo2Rs=; b=oKXf/gPrA1YAR7CItR+cCw
 12hxh0WGce2SPx1HOUN+x5t48DIJW1WLQYhA04LFSDXpCRM2lKtH11NAyt3wU/HP
 +Oukk/mMMJesa/33Rb045JacYqD+bOB+/aQH2cPnzS4UmECkkYyXB8rq0LajvW8e
 qQG5svlJ6Fz1Tw7ECA3mMrcKt40KSgyZZb66AyC59A/FjEOo2KScuA40BTygIzDR
 8JofTgq7rwSYrr4UA1XUvVfpGqzNkw4XToLrGuc3/envwQrL/J7javqepHf0A5Jp
 9qc8iPwDv2hi10of05FwbzCeTPv2lTOnwvei5q2HOWguLEbCbxEbmt3vxzlLzCdQ
 ==
X-ME-Sender: <xms:j0oBYr-WOiVLnWLhMFJKHtMOA84xNCc7RnQLoBAZL3oI92dRNpnAPQ>
 <xme:j0oBYnvla19ozKLvsVdslV4SN9RTtXGwusHe0wmWjEzYyplXCyoSm9NPJRfkOF_3u
 dyqXOSK4oLdt_zgjKE>
X-ME-Received: <xmr:j0oBYpCP4b-7UaJ6pMPlSyPnu2g0Ox1lEJbk6GzFluriqRnv9PCqXJoCaYemRFk8YFWxIrdSS3JE4gurpDkFOisqSv5J4w4HAf6RmXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:j0oBYnfsqNe9A04O4jeGvWviumcpueo1JXB9-kh5PM0Et16QP4Vicg>
 <xmx:j0oBYgNdVwMI5PAIfdY9dewIKfFw3maDyMs6QQOtkvAuWqv693Yvuw>
 <xmx:j0oBYpnobcOdXo_0Nno8ikG57X7cmYCSO0QfkwhAmFrfapKOD8ODAg>
 <xmx:j0oBYvoYvvYf7rELyEWWa6YbJnBpMNQivtCvLBGTQhkMaqaqPHuQ2pL8wo8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 23/23] drm/omap: plane: Remove redundant color encoding and
 range initialisation
Date: Mon,  7 Feb 2022 17:35:15 +0100
Message-Id: <20220207163515.1038648-24-maxime@cerno.tech>
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

The omap KMS driver will call drm_plane_create_color_properties() with
a default encoding and range values of BT601 and Full Range,
respectively.

Since the initial value wasn't carried over in the state, the driver had
to set it again in omap_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: Tomi Valkeinen <tomba@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index d96bc929072a..b83d91ec030a 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -403,7 +403,6 @@ void omap_plane_install_properties(struct drm_plane *plane,
 
 static void omap_plane_reset(struct drm_plane *plane)
 {
-	struct omap_plane *omap_plane = to_omap_plane(plane);
 	struct omap_plane_state *omap_state;
 
 	if (plane->state)
@@ -414,8 +413,6 @@ static void omap_plane_reset(struct drm_plane *plane)
 		return;
 
 	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
-	plane->state->color_encoding = DRM_COLOR_YCBCR_BT601;
-	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
 
 static struct drm_plane_state *
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF244AC5D6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C275310F9A4;
	Mon,  7 Feb 2022 16:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DD310F9B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 7D31D2B00154;
 Mon,  7 Feb 2022 11:36:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Feb 2022 11:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=ds8C44g9S8DeJrCcwJWHJ6tYKI+pgm
 ZAmJQ8q2lrAoo=; b=e2eKjo7zdzpcqTNIH7psGB6XJ4x9HYoB7Ak1fhWrpYdqTy
 B9lP/QIDweVl5AV+PFAEr841VjRoBfli6wSe/gJwh/DAssS0Dv0MnRsq0cMzKKu9
 2bTYzvQcy9CemsH1JJZW8RChhoqaH03/IBqTBCAI/3PpM4X3vlCON3vpd02BZAR4
 shtlyUuLRFmezAihDoR/xWq61O5mfz2zKfajBapN0UlWxOt4DUkuHUe3+gx5Lzqw
 piZS3uUN6qtLACadaA92FT7tGieGLYE5Y13IEuh0QNqYL2l5GFJ35JBY7g78QvUr
 IhD/nh44QeCHCFUkhm+Vxm2IkACBQYtWnidqtTdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ds8C44
 g9S8DeJrCcwJWHJ6tYKI+pgmZAmJQ8q2lrAoo=; b=JEn8yTvRwidcBP+8iCjHBP
 Kr9RcxD2esL+j1N8tyjl9x4uCygooazBfdjyJzWQd1jsAq0s8ljG3tNQX/nU8+F2
 jziK06YTIkw+EpIrk3lB0SSJWNbgeCc2aFaiAoTdFDPmeCT9KM0VIW4gSNZPCcUV
 2HB1fZbwCurbKcibULzBzSVe762oUBOxemBeYxb4LnRxX3PuGF+Y4q3LUYR4ri50
 iZzJ0hZmGAxUnblOk1l31wSAYm7R9DUIZCb0N/7x1jqsfou/m5073mm5FXCGd0J6
 8BvFbPbZRfc2QXKSDyiH3oqfK5gytYXMEp2gKDtD6tbnmMOIyJup1uAu6W+VVlGQ
 ==
X-ME-Sender: <xms:e0oBYkUdpBuz1w_Y6dNNdPEmTyQK6hUjXc7jfiC_ph8UF0S5-3kKqw>
 <xme:e0oBYomQvlB4vjASC_xm0k0OT231FEkxnuCAVKkP5KzOF5aHpJlsnDZL1_Gx3lVgl
 6pH6nEZc5zKlQpB7VM>
X-ME-Received: <xmr:e0oBYob4qprynsV8GYua218lQqvzMZ6tDtrFzHsg3VgYoGOkqdHB1naoPKm28axmoxEoR0rwPnotm4FkHjDD5bHQCncRfi5HvL6AbYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:e0oBYjWhfwrUHW39Pm1BeSFVKHfSkwNTstGp0nho4CzlYLOa37NR1A>
 <xmx:e0oBYukFTfKXJC_zvD7bEDo8c0X3vpJ0-RxpTVfKbLobj8_yxqiJKg>
 <xmx:e0oBYod2zV-KUU6FiToUY4Ip8kXaH8qM2EAlaZ0OL3pr37PdeLUxeQ>
 <xmx:fEoBYjh5w7JkZkliiBIXW3Lg5SeSghon6kRPn07Sbuf85P3X_xbvP_1igAk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 17/23] drm/sti: plane: Remove redundant zpos initialisation
Date: Mon,  7 Feb 2022 17:35:09 +0100
Message-Id: <20220207163515.1038648-18-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alain Volmat <alain.volmat@foss.st.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sti KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane type.

Since the initial value wasn't carried over in the state, the driver had
to set it again in sti_plane_reset() and rcar_du_vsp_plane_reset().
However, the helpers have been adjusted to set it properly at reset, so
this is not needed anymore.

Cc: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sti/sti_cursor.c | 2 +-
 drivers/gpu/drm/sti/sti_gdp.c    | 2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c  | 2 +-
 drivers/gpu/drm/sti/sti_plane.c  | 6 ------
 drivers/gpu/drm/sti/sti_plane.h  | 1 -
 5 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index 1d6051b4f6fe..414c9973aa6d 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -351,7 +351,7 @@ static const struct drm_plane_funcs sti_cursor_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = sti_plane_reset,
+	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_cursor_late_register,
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index d1a35d97bc45..3db3768a3241 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -905,7 +905,7 @@ static const struct drm_plane_funcs sti_gdp_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = sti_plane_reset,
+	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_gdp_late_register,
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 3c61ba8b43e0..2201a50353eb 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1283,7 +1283,7 @@ static const struct drm_plane_funcs sti_hqvdp_plane_helpers_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = sti_plane_reset,
+	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.late_register = sti_hqvdp_late_register,
diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index 3da4a46df2f2..173409cdb99e 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -112,12 +112,6 @@ static int sti_plane_get_default_zpos(enum drm_plane_type type)
 	return 0;
 }
 
-void sti_plane_reset(struct drm_plane *plane)
-{
-	drm_atomic_helper_plane_reset(plane);
-	plane->state->zpos = sti_plane_get_default_zpos(plane->type);
-}
-
 static void sti_plane_attach_zorder_property(struct drm_plane *drm_plane,
 					     enum drm_plane_type type)
 {
diff --git a/drivers/gpu/drm/sti/sti_plane.h b/drivers/gpu/drm/sti/sti_plane.h
index 065ffffbfb4a..8e33e629d9b0 100644
--- a/drivers/gpu/drm/sti/sti_plane.h
+++ b/drivers/gpu/drm/sti/sti_plane.h
@@ -81,5 +81,4 @@ void sti_plane_update_fps(struct sti_plane *plane,
 
 void sti_plane_init_property(struct sti_plane *plane,
 			     enum drm_plane_type type);
-void sti_plane_reset(struct drm_plane *plane);
 #endif
-- 
2.34.1


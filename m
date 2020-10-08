Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62E28838E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BE66EC5B;
	Fri,  9 Oct 2020 07:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4D76EA47
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 12:44:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 074CAA91;
 Thu,  8 Oct 2020 08:44:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 08:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=f2F0ThPE302gl
 CHasuSrENmEAtMo9aqWnrYX3qQaWFI=; b=rDV4HC7SuyPqVO8FFlrHQ+V0PXzpF
 UfXbjV4Yhi+HUyRjX6nTtHerJPAA55aBX1u0cvKP5IAXH0GnvXcbYU6vFofIqBtY
 zzH+J1vjdL3kEY5KiFtrcNOSPtEbBY2EZdIkLQRc4IY1zmiupyciJikRlYA0jDPN
 sNj4V93ZIfobYbk4XT3c4aucx9YLoPLTLlkvjU+FyI8NIEU+SGNWXO4J6N0Xrjci
 ASRAeyLUiBNiEhIoIsjp0VvZriwLgzZ5KJc4w8pHjCqRqmTtLU40ZaTxCNQ5V9zC
 JH0QH/YZVkp3Mi/n3Eiv5yPXL9TKSNyUJjst9HWwWBJAibq9JTsmrBSAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=f2F0ThPE302glCHasuSrENmEAtMo9aqWnrYX3qQaWFI=; b=DUosasef
 DjQIw3d0Dy3ObpOx6FS2xXDyR20KKH5S0qHb9B/zHFvrxxCl7fQmZqH6d7fyew2D
 YlBcyCfVm1CG8U/WYXR6zlljXd+ypt7xlq4b8J3El5bE1OV8RntR9DmMEPF0XuE3
 pskdHugZesdMstTul1xMd8FLn9WUPz2UF9RfOlfRNr5H+ikhRHE4VL+j0fjbAp+7
 AOCYcNiDyfvgXsJDX0bXroFh3zA3/qpAIfd35vg9nEXzfTXpFX2UkaRNtipOl3EK
 V+7ZaBSmf4UKoGivYcM9p8Q5f0kXaIKbNvbhZVx9L+sgf50NmBob1hRAFweNhXc0
 H/Hn35317LQMHw==
X-ME-Sender: <xms:sAl_X4OAuvvhlPYkmEfBFLYqwhYrkwzXFWu-bMxNwMkvi3dxIhgnHg>
 <xme:sAl_X--FmBjh0gQzHAB7aWq8Q9_MAK4j69Yrg5Z2m34uo4lXsam9zWUHGpLPuNxXe
 bATHY46HE-JH2p39f0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sAl_X_QY-jKIBNeN5t9cxmIwp6-7OzxmjxoSrx-YTZaW8rbtLbo7rw>
 <xmx:sAl_XwtEu0QUnoiJ6NJ8rAp7xlr0wbUC_XV-Wr_TM-RXOgfXvaVqZA>
 <xmx:sAl_XwefRQOZTHEn8LGTxAzcfZHEhomqlk5IyE7DwoW06gG8ZulvNA>
 <xmx:sAl_XxUBfp89XQ4lxRXf8z61k2XnlTtoRQtw_BLouOcN3JEAgsibqOaee4k>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 149863280063;
 Thu,  8 Oct 2020 08:44:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 2/6] drm/vc4: hvs: Align the HVS atomic hooks to the new API
Date: Thu,  8 Oct 2020 14:44:09 +0200
Message-Id: <3f91540ff3dcae2fb261d20eb7b8fd9a40d196a0.1602161031.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.647a5105d069cdcf8545555d1c381c233675a289.1602161031.git-series.maxime@cerno.tech>
References: <cover.647a5105d069cdcf8545555d1c381c233675a289.1602161031.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the CRTC setup in vc4 is split between the PixelValves/TXP and the
HVS, only the PV/TXP atomic hooks were updated in the previous commits, but
it makes sense to update the HVS ones too.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 +---
 drivers/gpu/drm/vc4/vc4_drv.h  | 4 ++--
 drivers/gpu/drm/vc4/vc4_hvs.c  | 8 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c  | 8 ++------
 4 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 97b1f1f7aa18..b5deacfe16cd 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -503,8 +503,6 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-								         crtc);
 	struct drm_device *dev = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
@@ -517,7 +515,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	 */
 	drm_crtc_vblank_on(crtc);
 
-	vc4_hvs_atomic_enable(crtc, old_state);
+	vc4_hvs_atomic_enable(crtc, state);
 
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index a22478a35199..92996c99600d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -912,8 +912,8 @@ extern struct platform_driver vc4_hvs_driver;
 void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int output);
 int vc4_hvs_get_fifo_from_output(struct drm_device *dev, unsigned int output);
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state);
-void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
-void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
+void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state);
+void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state);
 void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_state *state);
 void vc4_hvs_dump_state(struct drm_device *dev);
 void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4d0a833366ce..22403ab2a430 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -391,11 +391,12 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 }
 
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
-			   struct drm_crtc_state *old_state)
+			   struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(new_crtc_state);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	bool oneshot = vc4_state->feed_txp;
 
@@ -404,9 +405,10 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 }
 
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
-			    struct drm_crtc_state *old_state)
+			    struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
 	unsigned int chan = vc4_state->assigned_channel;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index e0e0b72ea65c..9fc8328f505c 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -404,23 +404,19 @@ static int vc4_txp_atomic_check(struct drm_crtc *crtc,
 static void vc4_txp_atomic_enable(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-									 crtc);
 	drm_crtc_vblank_on(crtc);
-	vc4_hvs_atomic_enable(crtc, old_state);
+	vc4_hvs_atomic_enable(crtc, state);
 }
 
 static void vc4_txp_atomic_disable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
-									 crtc);
 	struct drm_device *dev = crtc->dev;
 
 	/* Disable vblank irq handling before crtc is disabled. */
 	drm_crtc_vblank_off(crtc);
 
-	vc4_hvs_atomic_disable(crtc, old_state);
+	vc4_hvs_atomic_disable(crtc, state);
 
 	/*
 	 * Make sure we issue a vblank event after disabling the CRTC if
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

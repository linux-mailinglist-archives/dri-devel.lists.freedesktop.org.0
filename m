Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FC3278139
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583236EC18;
	Fri, 25 Sep 2020 07:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812C46EB3C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 15:31:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BB530D68;
 Thu, 24 Sep 2020 11:31:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 24 Sep 2020 11:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=G+o1HA15BsmZJ
 rdUZ3I+g+jd3M4kdS/onjKe1szOZBs=; b=m4uGpqVR7lIMGA/E81Qo0UzWAxoHh
 93akB8Z6nGWV2pL4RFc9wtpWwc+FYURsxYJmioGhe/6QBOV5MxRfozE3emIer6Qh
 qR+Yxd7Nkn0ZWrbQ+n8V/SaPP4i/PRJGlq2jzK/bGuzUVWOVwLfxVJpJxq8ZS/rV
 dts7g7vwgfHRf4GpFPA3TI82LZz3YB/c/haVkelelqyM7PhRhamhmD8G9lUg69Nt
 hGYoHoRs7Evy6zGE2h0sAShHtHugt/6jjpttFVhbq72Jem8mNAbqsB2MT5uoCPTt
 NghgRLzRl0jwm26Grzm/RPOFwfkW4L74p7RpWW2bq5e/JixA5bUXA4q7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=G+o1HA15BsmZJrdUZ3I+g+jd3M4kdS/onjKe1szOZBs=; b=QP9WJxG4
 ldBc6aZ+JLVZyeIzANU9aAgTxiN51U2X8dwZbeVbsLotlLHUwNIbss5+5CineXOW
 lWsSPSbL5OwQhV98pv6XZtqMnU/wNuSgsNhTHPsQwQqlJpHmZrZGZWkUtM4sutdR
 mJS5+22wlhQQXHQleOteiSpRx+blQyfaVNrb7dZd9fcKk8Onamdtxmu2TwdiiAe7
 PlywQj30swYXg96A67kLBEdHlbzdOSei51CuE7pH94jHAAAYcgS7EzlesKP8qoLA
 NRTgGShsujxyMyB1WqxGPC6RqiNUrh9Um3aHwXWOfCloj4jg2tHW0SQN2ShTU4Xe
 kOAsqQqi6SObbg==
X-ME-Sender: <xms:u7tsX2HjWT9uXTNRMgdmK0m0qnQY64JIMTbm_2jCGbCWohMyIqfJNg>
 <xme:u7tsX3US8b5TMGdnHytfkF9Q4ypBbW3XypsaWun1-2FFb9C1bPaC_a7HrGmwjWIvt
 zg8BAH0eY4O6EF-1A0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:u7tsXwJSdlQsyQLlepvdqrVQ8DcYnCsOwA1cBl_DrUmkUVutuyJWXg>
 <xmx:u7tsXwEjyt5EYJ5Fz99QP7zXwTR7Q1fz917HwI9tnTugO5Whhyp41w>
 <xmx:u7tsX8WRs9Yho_A8xQDjxMlq3OGIN5JJ53J0zoQSoAUWKuwr7casIw>
 <xmx:u7tsX1MfZmiV5TWqmPk4S1f3SQ9b9ZgfVdKAo7qqZGKAEQwt_p2IOCNpav8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E35E03280064;
 Thu, 24 Sep 2020 11:31:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/6] drm/vc4: hvs: Align the HVS atomic hooks to the new API
Date: Thu, 24 Sep 2020 17:30:57 +0200
Message-Id: <2202fea2c11266870f1e8399b308f3b0cf316c43.1600961400.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
References: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
index 2e6fc2f28946..878718b8836e 100644
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
index 90b911fd2a7f..232da0f50aa1 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -915,8 +915,8 @@ extern struct platform_driver vc4_hvs_driver;
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
index c127bca0f246..8692b101797e 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -403,23 +403,19 @@ static int vc4_txp_atomic_check(struct drm_crtc *crtc,
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

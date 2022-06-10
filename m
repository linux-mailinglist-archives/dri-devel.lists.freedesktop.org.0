Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC9546234
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120C111B288;
	Fri, 10 Jun 2022 09:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6899811B0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6CDA35C01B5;
 Fri, 10 Jun 2022 05:30:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853402; x=1654939802; bh=ZA
 1ZABDHPOxrJAUkU7pzNOG0xTW1W0z464X/pTaziM0=; b=CaMibSVLiWxAnXCP9u
 mvW92KmWaIz/kM/1UOQWMMaNiF7291eLjvD9T0nmHW0uK6BMDuTHt6/cfxA7N8EI
 naCerijlvglv2AKtR7nOjQlDpZWBAvXsc6sZ3TmrOdUwx0iw3bF9/grAVFz680f9
 bwRP5kJbqBlBD/CMaS6A6qmiOe8dwd5ymC7QJHAGXq2binlQyzp5Lwo5jp532AJ8
 NLZ3B9qbVbqumHXv3c2wOurdzxi6/oZUp4mY2cF2VfdO3M5LIf6dnBJ8yblI8McZ
 wae06x+yIhuCcf+YgByIcRGEiWzqK2u6nzQRFOVLq2IKpF+kaxtR7DHz5Yx9f33J
 /RHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853402; x=1654939802; bh=ZA1ZABDHPOxrJ
 AUkU7pzNOG0xTW1W0z464X/pTaziM0=; b=lg7uza/JD4qqAQ8AJEjVcmPlI1nEn
 ozjG84zvRZY3Dq4s+qUZowmZ0g2ubr2TrNndRDZgDC03bAVT1RZegOf2eAmfLrhb
 BTKTMECzrMvOMhNljOq1bTFbgoP1WUW1wJyCHqnicEpZFIYCGWhgdUQ4UBnILlMK
 z1jU/FLmglvmfHvn1WzIPFxl49TW6QDFN40w3hXkOi/dZ6RYnTE/hB1ETb5FyyWm
 UpvKNBQIvjnYYu+6qjvWPBGsXhpkabA9foGMBCnlT8EmxFVGxK96zS31uYJsrPx9
 3UAvJT9MHNldg2W3CAEbWSa1Je8kWHUT7NiFeez00uPznzrDTj+lh9uOg==
X-ME-Sender: <xms:Gg-jYm4aNKyI3DUwndnnIOQErpO5_q1d-uDkubWoXUn85nfbK3ArSw>
 <xme:Gg-jYv4wTCu2xG6XRxDGSJo_VG8sMOBEl57qtK3JqB0yd7tmh7zriOdR0t6hDJ9B6
 mLLms5wEeILWgAHHKg>
X-ME-Received: <xmr:Gg-jYldo_Uhfi51ECxg3lwrJY74FFuop0EoE9jtJpCJFX-rDxnefssVfm4-wpKeQ0nfZEjjoRnldVtG0JCv-zfpLAEhX18v2cahvZl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Gg-jYjIDu6YBlbmI4RR33FUFzVLVlj4IvNcDaTjL-_ZopBmSnT77yA>
 <xmx:Gg-jYqIM24yVBP309i1lYmqJ8xHsC1zlxhznEdL92-hBUg9BkLf67g>
 <xmx:Gg-jYkyJ3GiskxCD9OK_J6JCn0Qo6ts_bJMfQ-CGloyT2b5UCm9m7g>
 <xmx:Gg-jYvEXUpAZFmXzacpyuk_sisdjylU3Co9vKSprNxLIB0425AWnjQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 19/64] drm/vc4: crtc: Switch to DRM-managed CRTC initialization
Date: Fri, 10 Jun 2022 11:28:39 +0200
Message-Id: <20220610092924.754942-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_crtc_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that CRTC, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 18 +++++++-----------
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 -
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 -
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index c74fa3d07561..24de4706b61a 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -205,11 +205,6 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	return ret;
 }
 
-void vc4_crtc_destroy(struct drm_crtc *crtc)
-{
-	drm_crtc_cleanup(crtc);
-}
-
 static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 {
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
@@ -953,7 +948,6 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs vc4_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = vc4_crtc_destroy,
 	.page_flip = vc4_page_flip,
 	.set_property = NULL,
 	.cursor_set = NULL, /* handled by drm_mode_cursor_universal */
@@ -1131,6 +1125,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct drm_plane *primary_plane;
 	unsigned int i;
+	int ret;
 
 	/* For now, we create just the primary and the legacy cursor
 	 * planes.  We should be able to stack more planes on easily,
@@ -1144,10 +1139,13 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		return PTR_ERR(primary_plane);
 	}
 
-	spin_lock_init(&vc4_crtc->irq_lock);
-	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
-				  crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+					 crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
+	spin_lock_init(&vc4_crtc->irq_lock);
 
 	if (!vc4->hvs->hvs5) {
 		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
@@ -1226,8 +1224,6 @@ static void vc4_crtc_unbind(struct device *dev, struct device *master,
 	struct platform_device *pdev = to_platform_device(dev);
 	struct vc4_crtc *vc4_crtc = dev_get_drvdata(dev);
 
-	vc4_crtc_destroy(&vc4_crtc->base);
-
 	CRTC_WRITE(PV_INTEN, 0);
 
 	platform_set_drvdata(pdev, NULL);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 9a53ace85d95..fff3772be2d4 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -845,7 +845,6 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc);
 int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		  const struct drm_crtc_funcs *crtc_funcs,
 		  const struct drm_crtc_helper_funcs *crtc_helper_funcs);
-void vc4_crtc_destroy(struct drm_crtc *crtc);
 int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_framebuffer *fb,
 		  struct drm_pending_vblank_event *event,
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index e983ff7c5e13..f306e05ac5b2 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -383,7 +383,6 @@ static void vc4_txp_disable_vblank(struct drm_crtc *crtc) {}
 
 static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
-	.destroy		= vc4_crtc_destroy,
 	.page_flip		= vc4_page_flip,
 	.reset			= vc4_crtc_reset,
 	.atomic_duplicate_state	= vc4_crtc_duplicate_state,
-- 
2.36.1


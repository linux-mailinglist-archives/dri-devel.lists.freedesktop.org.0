Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8355FFFC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E601E14A607;
	Wed, 29 Jun 2022 12:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9C114A60B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4715C320094C;
 Wed, 29 Jun 2022 08:36:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506180; x=1656592580; bh=h3
 HD3xeaPAePCTBWgLUtwf6lcu/e89DuZJyvI+Q/zdg=; b=v/jPMwnGY6ZUi6Mhxs
 2z/rGRNGkH8r2I9sEaCUDGAWuWcSIDQma1+cz0brHYEMLI+34S7u1VWbMgX+4uwN
 bfJyLV3+xA5UqyPrSWCd1TqU02FHx+HA4KAzcaIb40hz6GYeJ1AqcVxgztj1TDQv
 /ktfNYiEPIiRVGc6uWr+742folHYxwDKSSMkh1ev8f6MGcr9two60UWu78ereBb7
 50q2zHCLfDSVAYjWAeqnPGesew8j1TlT1o9MDyDHosUBQSI0XM55Hc9FnRpaCwpu
 pxuiQzfM2iStpmCDDeRjlrcHmrlQPBYCbwUOt8anyjj3uoM4l/YGooDHl0rCthLl
 3Gdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506180; x=1656592580; bh=h3HD3xeaPAePC
 TBWgLUtwf6lcu/e89DuZJyvI+Q/zdg=; b=NxPWI3NoGVAIIGAaLOKpHU1mjgXAT
 63QC9sDccW+Smg0UiFanDQWxkCv9kCspLYkRDgMRTfo2ik6CBQePP5EEezwtNFb8
 YKPpIocC02iQCUmpGD1555WzdzMvYSnnkpYa7FXSc73zazoZ0Lh0gDLbnaFMiCeO
 /gTFCWpfDFRzuTrxPE+uKflIqgqnffGnFbhEzJX6lqIlQAJocqkgU3OfUcneA6N5
 3VgmWphlFJzDFmB2O/my/mLZvHCqhRPa4IjoDXFGcjZQRFlMPhcY5dDxnsefhPYU
 GTTFvbTx3Sio6EP6pep2coGBTY6IxpBnKw0kmXdT6xPl/bLAi1vUSHLGg==
X-ME-Sender: <xms:REe8YkIAKggCw3pUmnhnbjK5yhabXQm2vL0YaIhmshB7zHrdPPOsxw>
 <xme:REe8YkKE6_aB6-D9qnVl6HNLFe6YGgWpzxNOb_dIy6aQ8mTRlfFFo9vbpO-E0Ou65
 xrffn9TR95qX0-vsv8>
X-ME-Received: <xmr:REe8Ykv0Utv4-3PouJfvCNL7LwjHd_mEBi6SipouH7zCvrhO12HwY_NMovflX5BgopADT0q0hbV_hNimK3ho4QiSm_Wux16-aphJP-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:REe8YhbS1G3bawk7dNgj0yP_rrVYUFQAKHEOJRebUmcMe1wLoFVHFA>
 <xmx:REe8Yrb76PTXfb_zfTqOmYHt3Axt8gfjLc-TekiTDlUXffIAAFcbeQ>
 <xmx:REe8YtBMB_oo6_ybuPylLPyUhy7UfqP4OaIqaX2MIMwWgGhqb-vbFA>
 <xmx:REe8YmyH1a70_tvwX0ZHb1v4qicsbrPWl3gjj6DWNnV_7YX3tabK5w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 22/71] drm/vc4: crtc: Switch to DRM-managed CRTC
 initialization
Date: Wed, 29 Jun 2022 14:34:21 +0200
Message-Id: <20220629123510.1915022-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_crtc_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that CRTC, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 16 ++++++----------
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 -
 drivers/gpu/drm/vc4/vc4_txp.c  |  1 -
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d5158a6c0f21..3768a2a57ca9 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -206,11 +206,6 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
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
@@ -1059,7 +1054,6 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs vc4_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = vc4_crtc_destroy,
 	.page_flip = vc4_page_flip,
 	.set_property = NULL,
 	.cursor_set = NULL, /* handled by drm_mode_cursor_universal */
@@ -1237,6 +1231,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct drm_plane *primary_plane;
 	unsigned int i;
+	int ret;
 
 	/* For now, we create just the primary and the legacy cursor
 	 * planes.  We should be able to stack more planes on easily,
@@ -1251,8 +1246,11 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	}
 
 	spin_lock_init(&vc4_crtc->irq_lock);
-	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
-				  crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+					 crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
 
 	if (!vc4->is_vc5) {
@@ -1332,8 +1330,6 @@ static void vc4_crtc_unbind(struct device *dev, struct device *master,
 	struct platform_device *pdev = to_platform_device(dev);
 	struct vc4_crtc *vc4_crtc = dev_get_drvdata(dev);
 
-	vc4_crtc_destroy(&vc4_crtc->base);
-
 	CRTC_WRITE(PV_INTEN, 0);
 
 	platform_set_drvdata(pdev, NULL);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index df4ff6747eeb..6afa873f0def 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -850,7 +850,6 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc);
 int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		  const struct drm_crtc_funcs *crtc_funcs,
 		  const struct drm_crtc_helper_funcs *crtc_helper_funcs);
-void vc4_crtc_destroy(struct drm_crtc *crtc);
 int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_framebuffer *fb,
 		  struct drm_pending_vblank_event *event,
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 20e08e31aa1b..448d48e7e99f 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -384,7 +384,6 @@ static void vc4_txp_disable_vblank(struct drm_crtc *crtc) {}
 
 static const struct drm_crtc_funcs vc4_txp_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
-	.destroy		= vc4_crtc_destroy,
 	.page_flip		= vc4_page_flip,
 	.reset			= vc4_crtc_reset,
 	.atomic_duplicate_state	= vc4_crtc_duplicate_state,
-- 
2.36.1


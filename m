Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D15256B650
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7A3113865;
	Fri,  8 Jul 2022 09:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D049113862
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3E15F320031A;
 Fri,  8 Jul 2022 05:58:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274295; x=1657360695; bh=fq
 3MZMFLZ8SBgJSgNTTjFjuOARe/IF38cAx1IApCvp0=; b=AMwUy+12n1wqphYuLQ
 NsDcRaMKDOSBnKWMV3vV+dgaR8sOQ22eC+bwcnF4+/27tTbv/NQiVI864p+i5qkb
 CrHcF4OcY3U4h+reSJFptMkFKy+QGS8lK+CVlgYQY2mHrQcuxSJl6DwznJ5h41X9
 4tzi/Yc3cXF1QKPovVLe+DOva3twrsNqkvWaAnzn2Xlv0QqHW4xka/b6VqL6WunX
 1pwcpeTYCC6YPtiClawvK18Gux857yfKGOlH4hK8QcNkmpWSvTQOZuMvxUDnQAPW
 WYvFt/RC9/pDxaODlRlhCfxAGSAQwyXZJAqp8TVyTJJR4eGNnKz5jOSecYwlHwoz
 rAyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274295; x=1657360695; bh=fq3MZMFLZ8SBg
 JSgNTTjFjuOARe/IF38cAx1IApCvp0=; b=VG97ARumtCp5lUkfuplST0x/BHenq
 Y/DvMN8V95kMjZlNo0Y2eSxYafVR/a5hNn3izCar8gjpDl/IxnYWL/5dU3paa6JE
 uOxApsG8y6JaHSuWHjAWGVDVnUqf9uhcEur39fe3POTWtDm9ioth+okKs1YPSugr
 DvJ56zcUqyMcunTcyDv8YNLIy8flbJ2HUMB2Z2y3t4uAU5i4L94m4b6Ml95IeII9
 L929liCt8SJSOnHdf+dvtU3Sv7ksUk6d5FizuT+bT6MaN0o8MlnpSNq+XUQOk4r/
 ruQAcX4mhUsiBhIRnbZ/fO7gaPlJRIgkxGkuB5T0x1LxBB5RlEYUE5lqA==
X-ME-Sender: <xms:t__HYtgMlB3Bq7e_17HpwHDtwxC-mMm2AjGe9YVmY6BDBQPUvVvpiQ>
 <xme:t__HYiCkqQqzNQwFT8gv3dQZMiwHKdO5nJicdLGd-_Lmxz6lrjRCnu2aQjW-kgAMa
 lGdRXTA9YGKrDB76pg>
X-ME-Received: <xmr:t__HYtH5j_iNAT2LylQ6ln8GSD5NdsL8CXllGO-CxJEQcNqYTvSkx47FyI2TRlA55wDhTvhOsxOCWfrEW7wMnBYtLPxe7JD3YQ2iNOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:t__HYiSQTv8IGAwDQTaxs43-1kmsLQA2NANY7jpwNZFc94QmhZ0w-Q>
 <xmx:t__HYqx7Z59adYnNTzq2XN5kzvVmqD-8BVZ2ahPDIDiVXMJiExATpw>
 <xmx:t__HYo7MooNwX3Cv5gbRh37rpz1gcvJrLF9V3Izy_Rb5BVsvWtH09A>
 <xmx:t__HYhpInhT9KSRi_oby8vK2O2pojvRqSFqwUIBTrJoOTlh8PXU-ew>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 22/69] drm/vc4: crtc: Switch to DRM-managed CRTC
 initialization
Date: Fri,  8 Jul 2022 11:56:20 +0200
Message-Id: <20220708095707.257937-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index 443894e1715d..116e54fc1363 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -851,7 +851,6 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc);
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


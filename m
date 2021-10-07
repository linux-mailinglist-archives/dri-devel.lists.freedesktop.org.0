Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FEC425C36
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A329C6F4E7;
	Thu,  7 Oct 2021 19:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF836F4E3;
 Thu,  7 Oct 2021 19:39:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A63AC2B009FD;
 Thu,  7 Oct 2021 15:39:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 07 Oct 2021 15:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/243izJfdBfCx
 xS8dW6rDyb++C/dKdNlrRpQoNqLOqA=; b=VDzwGlZUj9E0/kUffXLcn+b1Dz31b
 WWII+RBaYfFFYujWIBUlex+FvIm2zHu0+YbQe0shxYLXGmHM6mX3pQI7TBk2yb8j
 8fwHjT7TqLXVr7MJT2glgzzoQneqQzrHjYAkEY59UwfQficn1RouSwzdS5FPkRcQ
 ppiW2UuGDpTlTH+EKsWrA2hKbFRcXPjoxkbuqIcv0cvFO52Plg3y4cwZFSkvdbM4
 BtrAd29lf6JZAf2SuFpSRWrHKVxnM4efCs/vCW68ArP4ftAk9WwskhCpIwUrvss8
 4xJ1JdEhCjY977qASaP5n3OMcsamoGHWd8bmaYJ7yiidtth2cxoGrvHHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/243izJfdBfCxxS8dW6rDyb++C/dKdNlrRpQoNqLOqA=; b=ZInB0Zcw
 bUlSBgkrGOyiCxagNgUBVe1I1NVChJIrf3nhz3FDeZLkxf/Ad38bkl916fk3u6js
 dIFPzyj21gY+Hiu8tkDerctNXEvQs/KblK6AOr6HTSJ8EYAGZturqUpoMDItrRxZ
 srKNOOQd2fKBOoxbpuxJi907xPolBuDvrIJKO2canFM/I8WllQinTils9aoX6DcC
 HHNYCYE6b7hzzxSvlhiMoabBeVCegrQZHsXSrfJuzqZg6egscYXRCI1uYO9aEBcI
 i3DUQWUmslxdY51RA++RlRWT1YSDcgZbg50444kAHQYJlTOGroJZrgthPJou/m8R
 Alku8tvCr0VHJQ==
X-ME-Sender: <xms:3kxfYUr1KksbtYcSJ6zGbWkjo_wkHr8zZENpaLeFfivMOEpCw4bBKg>
 <xme:3kxfYaoI2S3Vqr5fxMX5Oc-apbCl2HRDJeThxGqy_aBtS8y78j6_2TwJ2QKZVQDNr
 QlA_QBhyBTj2L3bQQ>
X-ME-Received: <xmr:3kxfYZPESeMQnVnVzZ98MUfpJ4Uxa6gIjUdoiz1BDswN87C5J3hQf_kZVIVefcDyTgrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeegnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:3kxfYb4wbAM33Y_9kTqgmc9meZ69nmq1_WhylfrlGTbKjugeoaFelA>
 <xmx:3kxfYT45R5hLFTni94fFaABEZKaglW-YvWC4bbF1lK1SXkaGNKyCHg>
 <xmx:3kxfYbivz90zCKnlgE3-ZLD6kbp-kZq7_dpf1cVPQ3PWJT9xE8ttjw>
 <xmx:3kxfYQH9BirBplk_jm5QO6DP2Ec3VYXWAJcEQfUiOW5H9lxodPwMe6hDrHA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:39:07 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 16/20] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:51 +0200
Message-Id: <20211007193755.29579-17-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index dc50c05f23fc..0ea7bdbc8482 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -40,6 +40,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 static void amdgpu_display_flip_callback(struct dma_fence *f,
 					 struct dma_fence_cb *cb)
@@ -1574,16 +1575,21 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
-	int r;
+	struct drm_modeset_acquire_ctx ctx;
+	int r, ret;
 
 	/* turn off display hw */
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	drm_connector_list_iter_begin(dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
 		drm_helper_connector_dpms(connector,
 					  DRM_MODE_DPMS_OFF);
 	drm_connector_list_iter_end(&iter);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	if (ret)
+		return ret;
+
 	/* unpin the front buffers and cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
@@ -1621,7 +1627,8 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	struct drm_crtc *crtc;
-	int r;
+	struct drm_modeset_acquire_ctx ctx;
+	int r, ret;
 
 	/* pin cursors */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
@@ -1643,7 +1650,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 	drm_helper_resume_force_mode(dev);
 
 	/* turn on display hw */
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	drm_connector_list_iter_begin(dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
@@ -1651,8 +1658,8 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
 					  DRM_MODE_DPMS_ON);
 	drm_connector_list_iter_end(&iter);
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
-- 
2.33.0


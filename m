Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E97542CBE2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665F6EB50;
	Wed, 13 Oct 2021 20:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8866EB3C;
 Wed, 13 Oct 2021 20:49:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8ED99581177;
 Wed, 13 Oct 2021 16:49:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 13 Oct 2021 16:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/243izJfdBfCx
 xS8dW6rDyb++C/dKdNlrRpQoNqLOqA=; b=YJuKD0QuJx3Lq5JCg9E04s6U7jzmO
 Ox6P4Zz54+85sPqYMiYr/kvnYCwQkvadIQ30rrxsZIHZI4u5vXVum8j7QgTJPrd5
 fqEaDcZ9EP3T4ER1IREbXedSek/4LcHsM8qVzG490P5ReBZau6Gczh2cnsROISWc
 gcE4P5eLeZzZxfk2TV4kWcdnQeHWwHc2aLqhKcig2jogG5ZLRD/SzgGbyibRIO6q
 i1YDOI3YMradn6pLIv+hdu365DCuFetuFIN8miSGVPpvUV+/W7pckGeXW+PwbddB
 U8AK0texfGwZvLIqAHGN2FzG83f70jJaeiykgDkEfdO+Pe1Ow0/1XMKvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/243izJfdBfCxxS8dW6rDyb++C/dKdNlrRpQoNqLOqA=; b=ids1+tQK
 xiSfrTHhRF96kOPVi5Is7ldJ3UcMOwoDfwbf6eHUbqY5ZHW3oTaPz0RhtYrYmzB3
 +LZrFyH4CEBkllo/Tsbf3ltwVqDr+QF2SUAFuMM5WTUFH7JifGx+GUbc8T74cJVE
 2z8x2r8m/vJxokz2H4Eyss5/Ly6Htz3JDsUSZiovNAZwhz4LevZuz5jKHwFky2L6
 PMZ23ifH/5MDuWXOXnL52lw1DeADokF55qLfhjXRdleXLsPn0eNj8gzGh7JxLUGC
 M2RtY5cSjjNXcQziWS+tDL89ZWwfAGF9v5HKEX5WzMo88lI55XDZ1grbh0ikkoVY
 ouDiZC/li0vIBQ==
X-ME-Sender: <xms:ZEZnYbeFmzeNmeHcOoowM5jGVBhJpGiGtI2hXoIuQnMMF0mYKe7_cg>
 <xme:ZEZnYRN1BKZxnTp1ypbVsj3-lK3fcYDKgyf_6A6EGBGeCVOZw2V7fd_JPVB4uO7Hy
 dvN8pw4OnFIa0rlEg>
X-ME-Received: <xmr:ZEZnYUhD-Q81geOuwQq_k0Vs0UnXOZxt_icbu86Zf19R4c23pCPjAb9i62i88-_8-k-p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:ZEZnYc_B13rfYC9dhATYkIMrlM66mhuwsnz7P7Z5GxBj1z5LmqekGA>
 <xmx:ZEZnYXtDFY8CwJ6QETytq7o5G2E2XZDkFdDPlef-OzGvL0e7cSxHgA>
 <xmx:ZEZnYbHZ-Gam6O2brtzCbzfOHCKV01xZ2LCSgx5wsaV0n9FDDhE7Ew>
 <xmx:ZEZnYVL0LG-a9htqdLV2c6emNN5CfZq1MWPICeO_gdb0u10rXeZmlA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:37 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 16/20] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:42 +0200
Message-Id: <20211013204846.90026-17-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B442CBC8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F876EB2C;
	Wed, 13 Oct 2021 20:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C886EB2C;
 Wed, 13 Oct 2021 20:49:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 73255581178;
 Wed, 13 Oct 2021 16:49:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 13 Oct 2021 16:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=42TrVQEBS+T0u
 aTdbmpol3CTMIgV752tP7jigQFe0eQ=; b=jAC6WEzKPYI2fHJxTKU/Td9YDZjFe
 r0Q/9jMycLZpTV1Ox14zOEDKFVeMJJL7oSPd0DBJ7iiB8gpTyiNtl4kSxQ91rMjs
 R+i/aPykdwx3HY13SzkvNn77ZvZd6JOqu5H9HOrXBHRdhX5Gxin/nCSVO+1C/hh/
 zSdbNlWq0Es7NqFzYRws9wNFiu4qjIXyWEIimClDzbgtF2cSxgdITgBgZxChwOu1
 IonVoIE5JgGCZSJXjBDP4WaC4EuZplptFOHdIkY6asGSfL9E0O/ZJSrA6gB6xOOs
 hxZk/A3NjuVoQ+bnTSzIKm1kb5aoemb9l0IZK64P1ipP213eHQ9K+CNgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=42TrVQEBS+T0uaTdbmpol3CTMIgV752tP7jigQFe0eQ=; b=Dn59sFJa
 OxLushapHvJBvI1kxZwJ5W3QkRaQvAmcz01oURoF27ww1AaanLrxC3uKlpJ2Pz5h
 uRgkz5sEM6YLgpf8fNV5fd+PtGu/5ajWmYbqId9y+Zsyc8v6vSwNxy0a+nZHa7s+
 njBwvzRKmQS6iI7Gpb22Zkebvsx8yf67PLXik2u6rwALbsNX5911L/0x4THjWYZk
 P8o/mDvmJ8jZA7FWr2kPEBJ0UYS+Sh4u4xjD53ZqaN0x8K1ukiv95pHh/HCXQUeS
 v56VqgJG2eFILsl3OIOaXuqiriiWLXjhWzi1QxrJkVvEUOrQzm6km3befezDfdBC
 5wYCrvgV+ZO5BQ==
X-ME-Sender: <xms:T0ZnYU6zLVTQTD26Oeb6ueLHaEwWVqmS3rx7Ny5ffjNUc4wM0jU0Kw>
 <xme:T0ZnYV6Iax4V7wYhDA1o7XiL_uek_VMvIjH9oSQDsZJD6QtMCDYEGxsm7klcssu6y
 zdwvRJImsWxgRUe3w>
X-ME-Received: <xmr:T0ZnYTfcVcI_Hzm8WTIvlfZG4kkV9J_HOQndtKSkwWUEML12uxEsdEkPxLSfH3mLiLbk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeefnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:T0ZnYZKZ_9sj_WdSvvb1-FXmmJJjtTVk6DHP-W4E36FwTbG1l0TKxg>
 <xmx:T0ZnYYJTqbr01lCp-LctzgSeH4Uonar40WuELQ4LSBOyz56CyxRlnA>
 <xmx:T0ZnYaz23dNISKLnwe_jWfxs8KuqVdqxPPn5ogb0WSBguKu3xOVRGQ>
 <xmx:T0ZnYdVCVk5zd1wU3rt7ZUIaa-Xv5eAOs25JvJzsIOH-HDQuB-5fIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:16 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 09/20] drm/omapdrm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:35 +0200
Message-Id: <20211013204846.90026-10-greenfoo@u92.eu>
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
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/omapdrm/omap_fb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 190afc564914..fa7636c13c19 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -9,6 +9,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_drv.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
@@ -62,15 +63,17 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
 				  unsigned num_clips)
 {
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(fb->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
 
 	drm_for_each_crtc(crtc, fb->dev)
 		omap_crtc_flush(crtc);
 
-	drm_modeset_unlock_all(fb->dev);
+	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static const struct drm_framebuffer_funcs omap_framebuffer_funcs = {
-- 
2.33.0


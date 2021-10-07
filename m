Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC84425BFD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD0E6F4CE;
	Thu,  7 Oct 2021 19:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC396F405;
 Thu,  7 Oct 2021 19:38:42 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C81612B009FD;
 Thu,  7 Oct 2021 15:38:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 07 Oct 2021 15:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=42TrVQEBS+T0u
 aTdbmpol3CTMIgV752tP7jigQFe0eQ=; b=UMtQrdfzrRx1xNnDdeigfKIqi7r1V
 7cUI1n5JrsEi/mhf5T37CtjDOartcKg5t27iPAIJ3/agsDtiiHP4UUIAwsRgo+Fy
 kK+RtH0pkkbiRAKTfELzXnH/YDnDXqjUJMj2baNkRPyCdnRmqAz2xL+ertdYqvEP
 dln1p+FFJNxbNyZdAZSYHZtV2nOrfBTia2kYdQ7LIjNG2/zLvnFZACz9MYCx9OwN
 YqKU4+NtbnlrBqlUonrf3wMNC1Mn7Oe0WK7Ma31mksAvlFFldIQcPY9KzNY6CyUG
 ir8BEji7E1R4pdh3BRQPID/3lSsQJPGUhG3UcLjbeZvVSxIweY0GuWEAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=42TrVQEBS+T0uaTdbmpol3CTMIgV752tP7jigQFe0eQ=; b=QyXr7J0u
 geUgLj+DM0smWh835sfDo2aMXg5RPh/YecAuZ4amP/rAZPirZKdoFBhycurf9/FE
 SBuRxpKp7kM1PK4FFUjVnHqq0kyz9tJtukZerxMGus/xcePoHi6dvpUVDx3dnHj1
 e48vYyVP4zl6TysmPoaOgvNAA93R2eRsqLhyP0LTUUNKFl0ToLhcadk6Nm3GAcfR
 0AXvElWwMXi/j+CgBhiLzTlHV9nySXpNlph9hgaD3mjeLfdMWnLHMzXNUYquOfTI
 z3PfCZCU4VAmLhwmrtlZ1eT20sTxem8V8cN7zkPPTt87wGnisOAmy3Yc/wIgx43G
 fhCeYvAc2vmwyA==
X-ME-Sender: <xms:wUxfYfZPM9nK0K6YBawANWHasS-s7jSER6AjCc9z6Grkr94brfpb2w>
 <xme:wUxfYeYrbufFbE7LL_svVgTSA8BhUagKjWH4NwanjXVihuCTDYRIrvX_g3FChmiqk
 VLZn1EpkWpWtuAQLg>
X-ME-Received: <xmr:wUxfYR-twWgVZJLthgwXUXvTet7XuH2Jbp40gl3A1WbuOeKYiVN34FnvJjVrSqgoAJsF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:wUxfYVr8d1tObqzROC8fmoF-WL75sKj1arettgLEKJh-8TzN0-rR1w>
 <xmx:wUxfYaoSC6poWHTK3C2lEXo7eAl8QGQNh0CXbzz6zkuYDYy1v2pktA>
 <xmx:wUxfYbRKGnsdWbu4Bm8oGw_JQ7P0IlqHRfjJbf3kK_XfYFrSZxdB9Q>
 <xmx:wUxfYZ3nTF-YbTTHKj1ZdwJ5esLXlX5cwJf7mm4LpYXkLeW47Jgk3K2Zih8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:38 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 09/20] drm/omapdrm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:44 +0200
Message-Id: <20211007193755.29579-10-greenfoo@u92.eu>
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


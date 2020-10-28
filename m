Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD929E60E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE266E8A3;
	Thu, 29 Oct 2020 08:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7576E51C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:37:58 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 55D7F5C002F;
 Wed, 28 Oct 2020 08:37:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 28 Oct 2020 08:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=PqnIlhH/f0j1EhBgwXkK6FWW/3
 sUfpw+eXwfvNOVjic=; b=o9RBBcbgENsYwPlU858/va2EkL2GhOB8ldMPwOTmPI
 ibvdpESGQEqcfHsu7SHidR/gwkqi3g34wgyX6FhlJBWf6KtUHSwQMYkbLwRrCMAA
 5llt4q+bDitB95ReTgr+LE71zFxXF9fr7hV4FpxeBoA6S3Fiw2fnsOymGPcjF2xA
 QVZBdtQ0dQ0XtfQgso5hVtNKSnRoFvJKKOUsgV+DkPpNdLocyIWyw/SYl3u4owoM
 PiBDZ4o44rijG57PXf14jY3x4pF26F2kUoSJYWTrivQTWI5Vrn5d345BBZoGXzlx
 KP89f4SjI8uZ5a5YkQ6PyIDfnw4zQWG4dKIhlR1lBxhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PqnIlhH/f0j1EhBgw
 XkK6FWW/3sUfpw+eXwfvNOVjic=; b=hJctulc9/gu5orT94JiISzjSXOXhmQ3MV
 kvTgtvpiGSRrHtQ0Ms5VV9AjVb3uNBdqTTu0WSIaO/nV2DKtsovnEcg+FF7nTv3N
 Gyi1vIOQd7eT1h7/7XAtfw5yMJSYenKB+AplxeAS6llGepJ+sLdDt7DpKjlEs92Z
 2U6su7920dyTYzjF5Y0SlBA24H0oPNBXKCUiplRqfpeqKTsHv70IRZM/UoVgPdPx
 uwWqadHTkiw+mDOsGGCZKoPiXqqX9AyQe2oNg9NlOKWQRHI3iNrgLsfAiX9dgHeO
 jVklgjIwyfqfxFI5uKW+c+/CYJJhQUr0gfANvhXrpWC4aPwdgQztg==
X-ME-Sender: <xms:JGaZX7P51WcMrDL43tg_zYGBF10N5ePvGumh1JgsTe16FJGnLzUQgg>
 <xme:JGaZX18_bCc6huDumHbO0brz4kM04tQiWywDc2KzFopcTD76lM0LVkt6ySYB-qXLa
 BKQNfFGhdFJ-XEwptc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledugdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JGaZX6St-s6kcmwTcr6LQF8SrZNW_K9-7hQcGEqK4-4W5gO-OIAp7g>
 <xmx:JGaZX_uy0OgHDypI1XJikHCbsTBoKsgzh0CxXur2xPVo4cKZqeQNEQ>
 <xmx:JGaZXzd7UYfh6pEYtudigqSnc4kXb16IROSAVBLnjSYrSlcA2PJyfQ>
 <xmx:JmaZX0Gj3SnA1-ySPN2qhtrlD6ZbU6jFsxmlChLOvLh9h3wV9o1L1Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0671B328005D;
 Wed, 28 Oct 2020 08:37:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH] drm/vc4: Rework the structure convertion functions
Date: Wed, 28 Oct 2020 13:37:52 +0100
Message-Id: <20201028123752.1733242-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the helpers to retrieve vc4 structures from the DRM base structures
rely on the fact that the first member of the vc4 structure is the DRM one
and just cast the pointers between them.

However, this is pretty fragile especially since there's no check to make
sure that the DRM structure is indeed at the offset 0 in the structure, so
let's use container_of to make it more robust.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 236dde0bb9a1..836fdca5e643 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -287,7 +287,7 @@ struct vc4_bo {
 static inline struct vc4_bo *
 to_vc4_bo(struct drm_gem_object *bo)
 {
-	return (struct vc4_bo *)bo;
+	return container_of(to_drm_gem_cma_obj(bo), struct vc4_bo, base);
 }
 
 struct vc4_fence {
@@ -300,7 +300,7 @@ struct vc4_fence {
 static inline struct vc4_fence *
 to_vc4_fence(struct dma_fence *fence)
 {
-	return (struct vc4_fence *)fence;
+	return container_of(fence, struct vc4_fence, base);
 }
 
 struct vc4_seqno_cb {
@@ -347,7 +347,7 @@ struct vc4_plane {
 static inline struct vc4_plane *
 to_vc4_plane(struct drm_plane *plane)
 {
-	return (struct vc4_plane *)plane;
+	return container_of(plane, struct vc4_plane, base);
 }
 
 enum vc4_scaling_mode {
@@ -423,7 +423,7 @@ struct vc4_plane_state {
 static inline struct vc4_plane_state *
 to_vc4_plane_state(struct drm_plane_state *state)
 {
-	return (struct vc4_plane_state *)state;
+	return container_of(state, struct vc4_plane_state, base);
 }
 
 enum vc4_encoder_type {
@@ -499,7 +499,7 @@ struct vc4_crtc {
 static inline struct vc4_crtc *
 to_vc4_crtc(struct drm_crtc *crtc)
 {
-	return (struct vc4_crtc *)crtc;
+	return container_of(crtc, struct vc4_crtc, base);
 }
 
 static inline const struct vc4_crtc_data *
@@ -537,7 +537,7 @@ struct vc4_crtc_state {
 static inline struct vc4_crtc_state *
 to_vc4_crtc_state(struct drm_crtc_state *crtc_state)
 {
-	return (struct vc4_crtc_state *)crtc_state;
+	return container_of(crtc_state, struct vc4_crtc_state, base);
 }
 
 #define V3D_READ(offset) readl(vc4->v3d->regs + offset)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

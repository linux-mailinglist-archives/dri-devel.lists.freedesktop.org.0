Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF9A5685E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453F610E2FF;
	Fri,  7 Mar 2025 12:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RlP0VCYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17E710E2BC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 12:58:47 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2a9ef75a20dso2227715fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 04:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741352327; x=1741957127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3m2SvCSA8B5rJxL7Pb39MmGslVwVxIgPTqU/+a1LL60=;
 b=RlP0VCYMYUhZyu8hAwJXXia5GznC79wEXT/kIZm5fxHTeJjNVv1EVGjQZVj+1NaDln
 h15D30urusUapGpRSrEsOtSIma/PXO1kTXy6/fIl9pnlLutAiS72ewjxe7NTsoUUl/Kw
 D3U6ebfgjYzF4gqsG8PL9bsNQXQ36r08s5Fbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741352327; x=1741957127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3m2SvCSA8B5rJxL7Pb39MmGslVwVxIgPTqU/+a1LL60=;
 b=OUJqhA/bAFvdJNwN2ZRhGqHL2f37i0+2IbysbSs8nBEukfxLf1Lq9Dfr37AKLlBMKb
 u38Mvf7r7Iwzli/exuKVLPqDKGdUSNOnvPsU46QW1A5EiFO4Hyi/7CSgY1GfX2D7eYqT
 3FjvHt0tMDnDsvDFlZfYpw++r8mEzwL/xgCnwo95XBBYJyJvHDWC8PJOoMPQlFhsCVUw
 cmaiJRMkwLpvgVJLZJt++ZYiO7Qzt65Nj2pxxbhwMWq4fWIQOJrycJ5lrNqZB327uRwH
 c7k/8QU0Tf6DZ/tmq2V01YeUeGM/m8Qg9+CT/MjizRRe2430eXHxc7jCaHw/MrHB1NVk
 Kjwg==
X-Gm-Message-State: AOJu0YwgtC3QYfvNI6HZdFjcoaN7pYhp7zvTHO1V+PohZvQfuGLqkC0S
 b3dacnrUYJQb0jYV/uI16sMvJXG4//cB+Op7QZankHh8QDRhEuQLcncBmS5CEVC3KgiBQcsSfTE
 WRjHQEQc0zAX8wFPKhYX2lB3R13RGIp40Z7yXjQxNvMA5XCliTTEpchtrXI7v4frUZYg7pAFoGD
 KrO3fGhKTg+amAxUi78rKzCQXFguLB7/SEfpMiOqk4iT52o0g3Sg==
X-Gm-Gg: ASbGncuL8a9VynHEbq3Qk+yuRBlTQL8JMf3Z7bjVfjbAKaIIIz0kkQhaqY2lcislPjt
 Ch8tLlCGAkIg6mnQnY93g6Wc8LZ4iiKwOHBluiWF+37RRTWbWZoxQLCWCCnWuS290w/EKUt6fgI
 evyX0wMN/O9oj4TnfzgQc10YL/q/j4C/j+8jJaxNwYXhD5faL0IU8TkQWBjAuD3wyXGfEow7VJp
 0ZLtuIJphzR9HTcw2ttP6cgl9cxcMcwP7zbb5hamgfehMKU4HSyb8GGRZGkZbqyDqtuwdwiGCxA
 GH8yMIhzdoKrt6Rc9VktPcsz1Wk8xUgK4TmADPjBhCFdhUylhlagwBe67sPOpYg/Fx5fUJkI+gP
 js7aUK2iFTQV5mjy609vrYHrck4I9JheoBSy7
X-Google-Smtp-Source: AGHT+IEnjdtO1Wed3vm7H1vHH5RBtzTHtk4bzmZefuYxCVoHpZ+Q00NTVjFV8jyw0/4wy//p+VR1Qw==
X-Received: by 2002:a05:6870:7048:b0:2c2:68dd:f632 with SMTP id
 586e51a60fabf-2c268ddfd35mr630675fac.7.1741352325846; 
 Fri, 07 Mar 2025 04:58:45 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2c2488b1882sm664860fac.13.2025.03.07.04.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 04:58:45 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 1/2] drm/vmwgfx: Refactor cursor handling
Date: Fri,  7 Mar 2025 07:57:38 -0500
Message-ID: <20250307125836.3877138-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250307125836.3877138-1-zack.rusin@broadcom.com>
References: <20250307125836.3877138-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Refactor cursor handling to make the code maintainable again. Over the
last 12 years the svga device improved support for virtualized cursors
and at the same time the drm interfaces evolved quite a bit from
pre-atomic to current atomic ones. vmwgfx only added new code over
the years, instead of adjusting/refactoring the paths.

Export the cursor plane handling to its own file. Remove special
handling of the legacy cursor support to make it fit within the global
cursor plane mechanism.

Finally redo dirty tracking because memcmp never worked correctly
resulting in the cursor not being properly updated in the guest.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/Makefile              |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |   6 +
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 844 ++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  81 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          |  32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |  26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          | 874 +------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h          |  71 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   |  63 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c         |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c         |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c      |  47 +-
 15 files changed, 1042 insertions(+), 1064 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h

diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index 46a4ab688a7f..b168fd7fe9b3 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -10,6 +10,6 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
 	    vmwgfx_simple_resource.o vmwgfx_va.o vmwgfx_blit.o \
 	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
 	    vmwgfx_devcaps.o ttm_object.o vmwgfx_system_manager.o \
-	    vmwgfx_gem.o vmwgfx_vkms.o
+	    vmwgfx_gem.o vmwgfx_vkms.o vmwgfx_cursor_plane.o
 
 obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9b5b8c1f063b..b7766421d2f5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -887,3 +887,9 @@ struct vmw_surface *vmw_bo_surface(struct vmw_bo *vbo)
 		surf = vmw_res_to_srf(res);
 	return surf;
 }
+
+s32 vmw_bo_mobid(struct vmw_bo *vbo)
+{
+	WARN_ON(vbo->tbo.resource->mem_type != VMW_PL_MOB);
+	return (s32)vbo->tbo.resource->start;
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 11e330c7c7f5..e97cae2365c8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -233,4 +233,6 @@ static inline struct vmw_bo *to_vmw_bo(struct drm_gem_object *gobj)
 	return container_of((gobj), struct vmw_bo, tbo.base);
 }
 
+s32 vmw_bo_mobid(struct vmw_bo *vbo);
+
 #endif // VMWGFX_BO_H
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
new file mode 100644
index 000000000000..718832b08d96
--- /dev/null
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
@@ -0,0 +1,844 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/**************************************************************************
+ *
+ * Copyright (c) 2024-2025 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ **************************************************************************/
+#include "vmwgfx_cursor_plane.h"
+
+#include "vmwgfx_bo.h"
+#include "vmwgfx_drv.h"
+#include "vmwgfx_kms.h"
+#include "vmwgfx_resource_priv.h"
+#include "vmw_surface_cache.h"
+
+#include "drm/drm_atomic.h"
+#include "drm/drm_atomic_helper.h"
+#include "drm/drm_plane.h"
+#include <asm/page.h>
+
+#define VMW_CURSOR_SNOOP_FORMAT SVGA3D_A8R8G8B8
+#define VMW_CURSOR_SNOOP_WIDTH 64
+#define VMW_CURSOR_SNOOP_HEIGHT 64
+
+struct vmw_svga_fifo_cmd_define_cursor {
+	u32 cmd;
+	SVGAFifoCmdDefineAlphaCursor cursor;
+};
+
+/**
+ * vmw_send_define_cursor_cmd - queue a define cursor command
+ * @dev_priv: the private driver struct
+ * @image: buffer which holds the cursor image
+ * @width: width of the mouse cursor image
+ * @height: height of the mouse cursor image
+ * @hotspotX: the horizontal position of mouse hotspot
+ * @hotspotY: the vertical position of mouse hotspot
+ */
+static void vmw_send_define_cursor_cmd(struct vmw_private *dev_priv,
+				       u32 *image, u32 width, u32 height,
+				       u32 hotspotX, u32 hotspotY)
+{
+	struct vmw_svga_fifo_cmd_define_cursor *cmd;
+	const u32 image_size = width * height * sizeof(*image);
+	const u32 cmd_size = sizeof(*cmd) + image_size;
+
+	/*
+	 * Try to reserve fifocmd space and swallow any failures;
+	 * such reservations cannot be left unconsumed for long
+	 * under the risk of clogging other fifocmd users, so
+	 * we treat reservations separtely from the way we treat
+	 * other fallible KMS-atomic resources at prepare_fb
+	 */
+	cmd = VMW_CMD_RESERVE(dev_priv, cmd_size);
+
+	if (unlikely(!cmd))
+		return;
+
+	memset(cmd, 0, sizeof(*cmd));
+
+	memcpy(&cmd[1], image, image_size);
+
+	cmd->cmd = SVGA_CMD_DEFINE_ALPHA_CURSOR;
+	cmd->cursor.id = 0;
+	cmd->cursor.width = width;
+	cmd->cursor.height = height;
+	cmd->cursor.hotspotX = hotspotX;
+	cmd->cursor.hotspotY = hotspotY;
+
+	vmw_cmd_commit_flush(dev_priv, cmd_size);
+}
+
+static void
+vmw_cursor_plane_update_legacy(struct vmw_private *vmw,
+			       struct vmw_plane_state *vps)
+{
+	struct vmw_surface *surface = vmw_user_object_surface(&vps->uo);
+	s32 hotspot_x = vps->cursor.legacy.hotspot_x + vps->base.hotspot_x;
+	s32 hotspot_y = vps->cursor.legacy.hotspot_y + vps->base.hotspot_y;
+
+	if (WARN_ON(!surface || !surface->snooper.image))
+		return;
+
+	if (vps->cursor.legacy.id != surface->snooper.id) {
+		vmw_send_define_cursor_cmd(vmw, surface->snooper.image,
+					   vps->base.crtc_w, vps->base.crtc_h,
+					   hotspot_x, hotspot_y);
+		vps->cursor.legacy.id = surface->snooper.id;
+	}
+}
+
+static enum vmw_cursor_update_type
+vmw_cursor_update_type(struct vmw_private *vmw, struct vmw_plane_state *vps)
+{
+	struct vmw_surface *surface = vmw_user_object_surface(&vps->uo);
+
+	if (surface && surface->snooper.image)
+		return VMW_CURSOR_UPDATE_LEGACY;
+
+	if (vmw->has_mob) {
+		if ((vmw->capabilities2 & SVGA_CAP2_CURSOR_MOB) != 0)
+			return VMW_CURSOR_UPDATE_MOB;
+	}
+
+	return VMW_CURSOR_UPDATE_NONE;
+}
+
+static void vmw_cursor_update_mob(struct vmw_private *vmw,
+				  struct vmw_plane_state *vps)
+{
+	SVGAGBCursorHeader *header;
+	SVGAGBAlphaCursorHeader *alpha_header;
+	struct vmw_bo *bo = vmw_user_object_buffer(&vps->uo);
+	u32 *image = vmw_bo_map_and_cache(bo);
+	const u32 image_size = vps->base.crtc_w * vps->base.crtc_h * sizeof(*image);
+
+	header = vmw_bo_map_and_cache(vps->cursor.mob);
+	alpha_header = &header->header.alphaHeader;
+
+	memset(header, 0, sizeof(*header));
+
+	header->type = SVGA_ALPHA_CURSOR;
+	header->sizeInBytes = image_size;
+
+	alpha_header->hotspotX = vps->cursor.legacy.hotspot_x + vps->base.hotspot_x;
+	alpha_header->hotspotY = vps->cursor.legacy.hotspot_y + vps->base.hotspot_y;
+	alpha_header->width = vps->base.crtc_w;
+	alpha_header->height = vps->base.crtc_h;
+
+	memcpy(header + 1, image, image_size);
+	vmw_write(vmw, SVGA_REG_CURSOR_MOBID, vmw_bo_mobid(vps->cursor.mob));
+
+	vmw_bo_unmap(bo);
+	vmw_bo_unmap(vps->cursor.mob);
+}
+
+static u32 vmw_cursor_mob_size(enum vmw_cursor_update_type update_type,
+			       u32 w, u32 h)
+{
+	switch (update_type) {
+	case VMW_CURSOR_UPDATE_LEGACY:
+	case VMW_CURSOR_UPDATE_NONE:
+		return 0;
+	case VMW_CURSOR_UPDATE_MOB:
+		return w * h * sizeof(u32) + sizeof(SVGAGBCursorHeader);
+	}
+	return 0;
+}
+
+static void vmw_cursor_mob_destroy(struct vmw_bo **vbo)
+{
+	if (!(*vbo))
+		return;
+
+	ttm_bo_unpin(&(*vbo)->tbo);
+	vmw_bo_unreference(vbo);
+}
+
+/**
+ * vmw_cursor_mob_unmap - Unmaps the cursor mobs.
+ *
+ * @vps: state of the cursor plane
+ *
+ * Returns 0 on success
+ */
+
+static int
+vmw_cursor_mob_unmap(struct vmw_plane_state *vps)
+{
+	int ret = 0;
+	struct vmw_bo *vbo = vps->cursor.mob;
+
+	if (!vbo || !vbo->map.virtual)
+		return 0;
+
+	ret = ttm_bo_reserve(&vbo->tbo, true, false, NULL);
+	if (likely(ret == 0)) {
+		vmw_bo_unmap(vbo);
+		ttm_bo_unreserve(&vbo->tbo);
+	}
+
+	return ret;
+}
+
+static void vmw_cursor_mob_put(struct vmw_cursor_plane *vcp,
+			       struct vmw_plane_state *vps)
+{
+	u32 i;
+
+	if (!vps->cursor.mob)
+		return;
+
+	vmw_cursor_mob_unmap(vps);
+
+	/* Look for a free slot to return this mob to the cache. */
+	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
+		if (!vcp->cursor_mobs[i]) {
+			vcp->cursor_mobs[i] = vps->cursor.mob;
+			vps->cursor.mob = NULL;
+			return;
+		}
+	}
+
+	/* Cache is full: See if this mob is bigger than an existing mob. */
+	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
+		if (vcp->cursor_mobs[i]->tbo.base.size <
+		    vps->cursor.mob->tbo.base.size) {
+			vmw_cursor_mob_destroy(&vcp->cursor_mobs[i]);
+			vcp->cursor_mobs[i] = vps->cursor.mob;
+			vps->cursor.mob = NULL;
+			return;
+		}
+	}
+
+	/* Destroy it if it's not worth caching. */
+	vmw_cursor_mob_destroy(&vps->cursor.mob);
+}
+
+static int vmw_cursor_mob_get(struct vmw_cursor_plane *vcp,
+			      struct vmw_plane_state *vps)
+{
+	struct vmw_private *dev_priv = vmw_priv(vcp->base.dev);
+	u32 size = vmw_cursor_mob_size(vps->cursor.update_type,
+				       vps->base.crtc_w, vps->base.crtc_h);
+	u32 i;
+	u32 cursor_max_dim, mob_max_size;
+	struct vmw_fence_obj *fence = NULL;
+	int ret;
+
+	if (!dev_priv->has_mob ||
+	    (dev_priv->capabilities2 & SVGA_CAP2_CURSOR_MOB) == 0)
+		return -EINVAL;
+
+	mob_max_size = vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
+	cursor_max_dim = vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSION);
+
+	if (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
+	    vps->base.crtc_h > cursor_max_dim)
+		return -EINVAL;
+
+	if (vps->cursor.mob) {
+		if (vps->cursor.mob->tbo.base.size >= size)
+			return 0;
+		vmw_cursor_mob_put(vcp, vps);
+	}
+
+	/* Look for an unused mob in the cache. */
+	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
+		if (vcp->cursor_mobs[i] &&
+		    vcp->cursor_mobs[i]->tbo.base.size >= size) {
+			vps->cursor.mob = vcp->cursor_mobs[i];
+			vcp->cursor_mobs[i] = NULL;
+			return 0;
+		}
+	}
+	/* Create a new mob if we can't find an existing one. */
+	ret = vmw_bo_create_and_populate(dev_priv, size, VMW_BO_DOMAIN_MOB,
+					 &vps->cursor.mob);
+
+	if (ret != 0)
+		return ret;
+
+	/* Fence the mob creation so we are guarateed to have the mob */
+	ret = ttm_bo_reserve(&vps->cursor.mob->tbo, false, false, NULL);
+	if (ret != 0)
+		goto teardown;
+
+	ret = vmw_execbuf_fence_commands(NULL, dev_priv, &fence, NULL);
+	if (ret != 0) {
+		ttm_bo_unreserve(&vps->cursor.mob->tbo);
+		goto teardown;
+	}
+
+	dma_fence_wait(&fence->base, false);
+	dma_fence_put(&fence->base);
+
+	ttm_bo_unreserve(&vps->cursor.mob->tbo);
+
+	return 0;
+
+teardown:
+	vmw_cursor_mob_destroy(&vps->cursor.mob);
+	return ret;
+}
+
+static void vmw_cursor_update_position(struct vmw_private *dev_priv,
+				       bool show, int x, int y)
+{
+	const u32 svga_cursor_on = show ? SVGA_CURSOR_ON_SHOW
+				   : SVGA_CURSOR_ON_HIDE;
+	u32 count;
+
+	spin_lock(&dev_priv->cursor_lock);
+	if (dev_priv->capabilities2 & SVGA_CAP2_EXTRA_REGS) {
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_X, x);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_Y, y);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_SCREEN_ID, SVGA3D_INVALID_ID);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_ON, svga_cursor_on);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, 1);
+	} else if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, svga_cursor_on);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_Y, y);
+		count = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CURSOR_COUNT);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_COUNT, ++count);
+	} else {
+		vmw_write(dev_priv, SVGA_REG_CURSOR_X, x);
+		vmw_write(dev_priv, SVGA_REG_CURSOR_Y, y);
+		vmw_write(dev_priv, SVGA_REG_CURSOR_ON, svga_cursor_on);
+	}
+	spin_unlock(&dev_priv->cursor_lock);
+}
+
+void vmw_kms_cursor_snoop(struct vmw_surface *srf,
+			  struct ttm_object_file *tfile,
+			  struct ttm_buffer_object *bo,
+			  SVGA3dCmdHeader *header)
+{
+	struct ttm_bo_kmap_obj map;
+	unsigned long kmap_offset;
+	unsigned long kmap_num;
+	SVGA3dCopyBox *box;
+	u32 box_count;
+	void *virtual;
+	bool is_iomem;
+	struct vmw_dma_cmd {
+		SVGA3dCmdHeader header;
+		SVGA3dCmdSurfaceDMA dma;
+	} *cmd;
+	int i, ret;
+	const struct SVGA3dSurfaceDesc *desc =
+		vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
+	const u32 image_pitch = VMW_CURSOR_SNOOP_WIDTH * desc->pitchBytesPerBlock;
+
+	cmd = container_of(header, struct vmw_dma_cmd, header);
+
+	/* No snooper installed, nothing to copy */
+	if (!srf->snooper.image)
+		return;
+
+	if (cmd->dma.host.face != 0 || cmd->dma.host.mipmap != 0) {
+		DRM_ERROR("face and mipmap for cursors should never != 0\n");
+		return;
+	}
+
+	if (cmd->header.size < 64) {
+		DRM_ERROR("at least one full copy box must be given\n");
+		return;
+	}
+
+	box = (SVGA3dCopyBox *)&cmd[1];
+	box_count = (cmd->header.size - sizeof(SVGA3dCmdSurfaceDMA)) /
+			sizeof(SVGA3dCopyBox);
+
+	if (cmd->dma.guest.ptr.offset % PAGE_SIZE ||
+	    box->x != 0    || box->y != 0    || box->z != 0    ||
+	    box->srcx != 0 || box->srcy != 0 || box->srcz != 0 ||
+	    box->d != 1    || box_count != 1 ||
+	    box->w > VMW_CURSOR_SNOOP_WIDTH || box->h > VMW_CURSOR_SNOOP_HEIGHT) {
+		/* TODO handle none page aligned offsets */
+		/* TODO handle more dst & src != 0 */
+		/* TODO handle more then one copy */
+		DRM_ERROR("Can't snoop dma request for cursor!\n");
+		DRM_ERROR("(%u, %u, %u) (%u, %u, %u) (%ux%ux%u) %u %u\n",
+			  box->srcx, box->srcy, box->srcz,
+			  box->x, box->y, box->z,
+			  box->w, box->h, box->d, box_count,
+			  cmd->dma.guest.ptr.offset);
+		return;
+	}
+
+	kmap_offset = cmd->dma.guest.ptr.offset >> PAGE_SHIFT;
+	kmap_num = (VMW_CURSOR_SNOOP_HEIGHT * image_pitch) >> PAGE_SHIFT;
+
+	ret = ttm_bo_reserve(bo, true, false, NULL);
+	if (unlikely(ret != 0)) {
+		DRM_ERROR("reserve failed\n");
+		return;
+	}
+
+	ret = ttm_bo_kmap(bo, kmap_offset, kmap_num, &map);
+	if (unlikely(ret != 0))
+		goto err_unreserve;
+
+	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
+
+	if (box->w == VMW_CURSOR_SNOOP_WIDTH && cmd->dma.guest.pitch == image_pitch) {
+		memcpy(srf->snooper.image, virtual,
+		       VMW_CURSOR_SNOOP_HEIGHT * image_pitch);
+	} else {
+		/* Image is unsigned pointer. */
+		for (i = 0; i < box->h; i++)
+			memcpy(srf->snooper.image + i * image_pitch,
+			       virtual + i * cmd->dma.guest.pitch,
+			       box->w * desc->pitchBytesPerBlock);
+	}
+	srf->snooper.id++;
+
+	ttm_bo_kunmap(&map);
+err_unreserve:
+	ttm_bo_unreserve(bo);
+}
+
+void vmw_cursor_plane_destroy(struct drm_plane *plane)
+{
+	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
+	u32 i;
+
+	vmw_cursor_update_position(vmw_priv(plane->dev), false, 0, 0);
+
+	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++)
+		vmw_cursor_mob_destroy(&vcp->cursor_mobs[i]);
+
+	drm_plane_cleanup(plane);
+}
+
+/**
+ * vmw_cursor_mob_map - Maps the cursor mobs.
+ *
+ * @vps: plane_state
+ *
+ * Returns 0 on success
+ */
+
+static int
+vmw_cursor_mob_map(struct vmw_plane_state *vps)
+{
+	int ret;
+	u32 size = vmw_cursor_mob_size(vps->cursor.update_type,
+				       vps->base.crtc_w, vps->base.crtc_h);
+	struct vmw_bo *vbo = vps->cursor.mob;
+
+	if (!vbo)
+		return -EINVAL;
+
+	if (vbo->tbo.base.size < size)
+		return -EINVAL;
+
+	if (vbo->map.virtual)
+		return 0;
+
+	ret = ttm_bo_reserve(&vbo->tbo, false, false, NULL);
+	if (unlikely(ret != 0))
+		return -ENOMEM;
+
+	vmw_bo_map_and_cache(vbo);
+
+	ttm_bo_unreserve(&vbo->tbo);
+
+	return 0;
+}
+
+/**
+ * vmw_cursor_plane_cleanup_fb - Unpins the plane surface
+ *
+ * @plane: cursor plane
+ * @old_state: contains the state to clean up
+ *
+ * Unmaps all cursor bo mappings and unpins the cursor surface
+ *
+ * Returns 0 on success
+ */
+void
+vmw_cursor_plane_cleanup_fb(struct drm_plane *plane,
+			    struct drm_plane_state *old_state)
+{
+	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
+	struct vmw_plane_state *vps = vmw_plane_state_to_vps(old_state);
+
+	if (!vmw_user_object_is_null(&vps->uo))
+		vmw_user_object_unmap(&vps->uo);
+
+	vmw_cursor_mob_unmap(vps);
+	vmw_cursor_mob_put(vcp, vps);
+
+	vmw_du_plane_unpin_surf(vps);
+	vmw_user_object_unref(&vps->uo);
+}
+
+static bool
+vmw_cursor_buffer_changed(struct vmw_plane_state *new_vps,
+			  struct vmw_plane_state *old_vps)
+{
+	struct vmw_bo *new_bo = vmw_user_object_buffer(&new_vps->uo);
+	struct vmw_bo *old_bo = vmw_user_object_buffer(&old_vps->uo);
+	struct vmw_surface *surf;
+	bool dirty = false;
+	int ret;
+
+	if (new_bo != old_bo)
+		return true;
+
+	if (new_bo) {
+		if (!old_bo) {
+			return true;
+		} else if (new_bo->dirty) {
+			vmw_bo_dirty_scan(new_bo);
+			dirty = vmw_bo_is_dirty(new_bo);
+			if (dirty) {
+				surf = vmw_user_object_surface(&new_vps->uo);
+				if (surf)
+					vmw_bo_dirty_transfer_to_res(&surf->res);
+				else
+					vmw_bo_dirty_clear(new_bo);
+			}
+			return dirty;
+		} else if (new_bo != old_bo) {
+			/*
+			 * Currently unused because the top exits right away.
+			 * In most cases buffer being different will mean
+			 * that the contents is different. For the few percent
+			 * of cases where that's not true the cost of doing
+			 * the memcmp on all other seems to outweight the
+			 * benefits. Leave the conditional to be able to
+			 * trivially validate it by removing the initial
+			 * if (new_bo != old_bo) at the start.
+			 */
+			void *old_image;
+			void *new_image;
+			bool changed = false;
+			struct ww_acquire_ctx ctx;
+			const u32 size = new_vps->base.crtc_w *
+					 new_vps->base.crtc_h * sizeof(u32);
+
+			ww_acquire_init(&ctx, &reservation_ww_class);
+
+			ret = ttm_bo_reserve(&old_bo->tbo, false, false, &ctx);
+			if (ret != 0) {
+				ww_acquire_fini(&ctx);
+				return true;
+			}
+
+			ret = ttm_bo_reserve(&new_bo->tbo, false, false, &ctx);
+			if (ret != 0) {
+				ttm_bo_unreserve(&old_bo->tbo);
+				ww_acquire_fini(&ctx);
+				return true;
+			}
+
+			old_image = vmw_bo_map_and_cache(old_bo);
+			new_image = vmw_bo_map_and_cache(new_bo);
+
+			if (old_image && new_image && old_image != new_image)
+				changed = memcmp(old_image, new_image, size) !=
+					  0;
+
+			ttm_bo_unreserve(&new_bo->tbo);
+			ttm_bo_unreserve(&old_bo->tbo);
+
+			ww_acquire_fini(&ctx);
+
+			return changed;
+		}
+		return false;
+	}
+
+	return false;
+}
+
+static bool
+vmw_cursor_plane_changed(struct vmw_plane_state *new_vps,
+			 struct vmw_plane_state *old_vps)
+{
+	if (old_vps->base.crtc_w != new_vps->base.crtc_w ||
+	    old_vps->base.crtc_h != new_vps->base.crtc_h)
+		return true;
+
+	if (old_vps->base.hotspot_x != new_vps->base.hotspot_x ||
+	    old_vps->base.hotspot_y != new_vps->base.hotspot_y)
+		return true;
+
+	if (old_vps->cursor.legacy.hotspot_x !=
+		    new_vps->cursor.legacy.hotspot_x ||
+	    old_vps->cursor.legacy.hotspot_y !=
+		    new_vps->cursor.legacy.hotspot_y)
+		return true;
+
+	if (old_vps->base.fb != new_vps->base.fb)
+		return true;
+
+	return false;
+}
+
+/**
+ * vmw_cursor_plane_prepare_fb - Readies the cursor by referencing it
+ *
+ * @plane:  display plane
+ * @new_state: info on the new plane state, including the FB
+ *
+ * Returns 0 on success
+ */
+int vmw_cursor_plane_prepare_fb(struct drm_plane *plane,
+				struct drm_plane_state *new_state)
+{
+	struct drm_framebuffer *fb = new_state->fb;
+	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
+	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
+	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(plane->state);
+	struct vmw_private *vmw = vmw_priv(plane->dev);
+	struct vmw_bo *bo = NULL;
+	struct vmw_surface *surface;
+	int ret = 0;
+
+	if (!vmw_user_object_is_null(&vps->uo)) {
+		vmw_user_object_unmap(&vps->uo);
+		vmw_user_object_unref(&vps->uo);
+	}
+
+	if (fb) {
+		if (vmw_framebuffer_to_vfb(fb)->bo) {
+			vps->uo.buffer = vmw_framebuffer_to_vfbd(fb)->buffer;
+			vps->uo.surface = NULL;
+		} else {
+			memcpy(&vps->uo, &vmw_framebuffer_to_vfbs(fb)->uo, sizeof(vps->uo));
+		}
+		vmw_user_object_ref(&vps->uo);
+	}
+
+	vps->cursor.update_type = vmw_cursor_update_type(vmw, vps);
+	switch (vps->cursor.update_type) {
+	case VMW_CURSOR_UPDATE_LEGACY:
+		surface = vmw_user_object_surface(&vps->uo);
+		if (!surface || vps->cursor.legacy.id == surface->snooper.id)
+			vps->cursor.update_type = VMW_CURSOR_UPDATE_NONE;
+		break;
+	case VMW_CURSOR_UPDATE_MOB: {
+		bo = vmw_user_object_buffer(&vps->uo);
+		if (bo) {
+			struct ttm_operation_ctx ctx = { false, false };
+
+			ret = ttm_bo_reserve(&bo->tbo, true, false, NULL);
+			if (ret != 0)
+				return -ENOMEM;
+
+			ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+			if (ret != 0)
+				return -ENOMEM;
+
+			/*
+			 * vmw_bo_pin_reserved also validates, so to skip
+			 * the extra validation use ttm_bo_pin directly
+			 */
+			if (!bo->tbo.pin_count)
+				ttm_bo_pin(&bo->tbo);
+
+			if (vmw_framebuffer_to_vfb(fb)->bo) {
+				const u32 size = new_state->crtc_w *
+						 new_state->crtc_h *
+						 sizeof(u32);
+
+				(void)vmw_bo_map_and_cache_size(bo, size);
+			} else {
+				vmw_bo_map_and_cache(bo);
+			}
+			ttm_bo_unreserve(&bo->tbo);
+		}
+		if (!vmw_user_object_is_null(&vps->uo)) {
+			if (!vmw_cursor_plane_changed(vps, old_vps) &&
+			    !vmw_cursor_buffer_changed(vps, old_vps)) {
+				vps->cursor.update_type =
+					VMW_CURSOR_UPDATE_NONE;
+			} else {
+				vmw_cursor_mob_get(vcp, vps);
+				vmw_cursor_mob_map(vps);
+			}
+		}
+	}
+		break;
+	case VMW_CURSOR_UPDATE_NONE:
+		/* do nothing */
+		break;
+	}
+
+	return 0;
+}
+
+/**
+ * vmw_cursor_plane_atomic_check - check if the new state is okay
+ *
+ * @plane: cursor plane
+ * @state: info on the new plane state
+ *
+ * This is a chance to fail if the new cursor state does not fit
+ * our requirements.
+ *
+ * Returns 0 on success
+ */
+int vmw_cursor_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	struct vmw_private *vmw = vmw_priv(plane->dev);
+	int ret = 0;
+	struct drm_crtc_state *crtc_state = NULL;
+	struct vmw_surface *surface = NULL;
+	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
+	enum vmw_cursor_update_type update_type;
+	struct drm_framebuffer *fb = new_state->fb;
+
+	if (new_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
+							   new_state->crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING, true,
+						  true);
+	if (ret)
+		return ret;
+
+	/* Turning off */
+	if (!fb)
+		return 0;
+
+	update_type = vmw_cursor_update_type(vmw, vps);
+	if (update_type == VMW_CURSOR_UPDATE_LEGACY) {
+		if (new_state->crtc_w != VMW_CURSOR_SNOOP_WIDTH ||
+		    new_state->crtc_h != VMW_CURSOR_SNOOP_HEIGHT) {
+			drm_warn(&vmw->drm,
+				 "Invalid cursor dimensions (%d, %d)\n",
+				 new_state->crtc_w, new_state->crtc_h);
+			return -EINVAL;
+		}
+		surface = vmw_user_object_surface(&vps->uo);
+		if (!surface || !surface->snooper.image) {
+			drm_warn(&vmw->drm,
+				 "surface not suitable for cursor\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+void
+vmw_cursor_plane_atomic_update(struct drm_plane *plane,
+			       struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_state =
+		drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
+	struct vmw_private *dev_priv = vmw_priv(plane->dev);
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
+	s32 hotspot_x, hotspot_y, cursor_x, cursor_y;
+
+	/*
+	 * Hide the cursor if the new bo is null
+	 */
+	if (vmw_user_object_is_null(&vps->uo)) {
+		vmw_cursor_update_position(dev_priv, false, 0, 0);
+		return;
+	}
+
+	switch (vps->cursor.update_type) {
+	case VMW_CURSOR_UPDATE_LEGACY:
+		vmw_cursor_plane_update_legacy(dev_priv, vps);
+		break;
+	case VMW_CURSOR_UPDATE_MOB:
+		vmw_cursor_update_mob(dev_priv, vps);
+		break;
+	case VMW_CURSOR_UPDATE_NONE:
+		/* do nothing */
+		break;
+	}
+
+	/*
+	 * For all update types update the cursor position
+	 */
+	cursor_x = new_state->crtc_x + du->set_gui_x;
+	cursor_y = new_state->crtc_y + du->set_gui_y;
+
+	hotspot_x = vps->cursor.legacy.hotspot_x + new_state->hotspot_x;
+	hotspot_y = vps->cursor.legacy.hotspot_y + new_state->hotspot_y;
+
+	vmw_cursor_update_position(dev_priv, true, cursor_x + hotspot_x,
+				   cursor_y + hotspot_y);
+}
+
+int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv)
+{
+	struct drm_vmw_cursor_bypass_arg *arg = data;
+	struct vmw_display_unit *du;
+	struct vmw_plane_state *vps;
+	struct drm_crtc *crtc;
+	int ret = 0;
+
+	mutex_lock(&dev->mode_config.mutex);
+	if (arg->flags & DRM_VMW_CURSOR_BYPASS_ALL) {
+		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
+			du = vmw_crtc_to_du(crtc);
+			vps = vmw_plane_state_to_vps(du->cursor.base.state);
+			vps->cursor.legacy.hotspot_x = arg->xhot;
+			vps->cursor.legacy.hotspot_y = arg->yhot;
+		}
+
+		mutex_unlock(&dev->mode_config.mutex);
+		return 0;
+	}
+
+	crtc = drm_crtc_find(dev, file_priv, arg->crtc_id);
+	if (!crtc) {
+		ret = -ENOENT;
+		goto out;
+	}
+
+	du = vmw_crtc_to_du(crtc);
+	vps = vmw_plane_state_to_vps(du->cursor.base.state);
+	vps->cursor.legacy.hotspot_x = arg->xhot;
+	vps->cursor.legacy.hotspot_y = arg->yhot;
+
+out:
+	mutex_unlock(&dev->mode_config.mutex);
+
+	return ret;
+}
+
+void *vmw_cursor_snooper_create(struct drm_file *file_priv,
+				struct vmw_surface_metadata *metadata)
+{
+	if (!file_priv->atomic && metadata->scanout &&
+	    metadata->num_sizes == 1 &&
+	    metadata->sizes[0].width == VMW_CURSOR_SNOOP_WIDTH &&
+	    metadata->sizes[0].height == VMW_CURSOR_SNOOP_HEIGHT &&
+	    metadata->format == VMW_CURSOR_SNOOP_FORMAT) {
+		const struct SVGA3dSurfaceDesc *desc =
+			vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
+		const u32 cursor_size_bytes = VMW_CURSOR_SNOOP_WIDTH *
+					      VMW_CURSOR_SNOOP_HEIGHT *
+					      desc->pitchBytesPerBlock;
+		void *image = kzalloc(cursor_size_bytes, GFP_KERNEL);
+
+		if (!image) {
+			DRM_ERROR("Failed to allocate cursor_image\n");
+			return ERR_PTR(-ENOMEM);
+		}
+		return image;
+	}
+	return NULL;
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
new file mode 100644
index 000000000000..40694925a70e
--- /dev/null
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/**************************************************************************
+ *
+ * Copyright (c) 2024-2025 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ **************************************************************************/
+
+#ifndef VMWGFX_CURSOR_PLANE_H
+#define VMWGFX_CURSOR_PLANE_H
+
+#include "device_include/svga3d_cmd.h"
+#include "drm/drm_file.h"
+#include "drm/drm_fourcc.h"
+#include "drm/drm_plane.h"
+
+#include <linux/types.h>
+
+struct SVGA3dCmdHeader;
+struct ttm_buffer_object;
+struct vmw_bo;
+struct vmw_cursor;
+struct vmw_private;
+struct vmw_surface;
+struct vmw_user_object;
+
+#define vmw_plane_to_vcp(x) container_of(x, struct vmw_cursor_plane, base)
+
+static const u32 __maybe_unused vmw_cursor_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+};
+
+enum vmw_cursor_update_type {
+	VMW_CURSOR_UPDATE_NONE = 0,
+	VMW_CURSOR_UPDATE_LEGACY,
+	VMW_CURSOR_UPDATE_MOB,
+};
+
+struct vmw_cursor_plane_state {
+	enum vmw_cursor_update_type update_type;
+	bool changed;
+	bool surface_changed;
+	struct vmw_bo *mob;
+	struct {
+		s32 hotspot_x;
+		s32 hotspot_y;
+		u32 id;
+	} legacy;
+};
+
+/**
+ * Derived class for cursor plane object
+ *
+ * @base DRM plane object
+ * @cursor.cursor_mobs Cursor mobs available for re-use
+ */
+struct vmw_cursor_plane {
+	struct drm_plane base;
+
+	struct vmw_bo *cursor_mobs[3];
+};
+
+struct vmw_surface_metadata;
+void *vmw_cursor_snooper_create(struct drm_file *file_priv,
+				struct vmw_surface_metadata *metadata);
+void vmw_cursor_cmd_dma_snoop(SVGA3dCmdHeader *header,
+			      struct vmw_surface *srf,
+			      struct ttm_buffer_object *bo);
+
+void vmw_cursor_plane_destroy(struct drm_plane *plane);
+
+int vmw_cursor_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_atomic_state *state);
+void vmw_cursor_plane_atomic_update(struct drm_plane *plane,
+				    struct drm_atomic_state *state);
+int vmw_cursor_plane_prepare_fb(struct drm_plane *plane,
+				struct drm_plane_state *new_state);
+void vmw_cursor_plane_cleanup_fb(struct drm_plane *plane,
+				 struct drm_plane_state *old_state);
+
+#endif /* VMWGFX_CURSOR_H */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0f32471c8533..0695a342b1ef 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1,31 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009-2023 VMware, Inc., Palo Alto, CA., USA
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ * Copyright (c) 2009-2025 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
  **************************************************************************/
 
-
 #include "vmwgfx_drv.h"
 
 #include "vmwgfx_bo.h"
@@ -1324,9 +1304,6 @@ static void vmw_master_set(struct drm_device *dev,
 static void vmw_master_drop(struct drm_device *dev,
 			    struct drm_file *file_priv)
 {
-	struct vmw_private *dev_priv = vmw_priv(dev);
-
-	vmw_kms_legacy_hotspot_clear(dev_priv);
 }
 
 bool vmwgfx_supported(struct vmw_private *vmw)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 5275ef632d4b..6fc810632c98 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1,29 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**************************************************************************
  *
- * Copyright (c) 2009-2024 Broadcom. All Rights Reserved. The term
+ * Copyright (c) 2009-2025 Broadcom. All Rights Reserved. The term
  * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
  **************************************************************************/
 
 #ifndef _VMWGFX_DRV_H_
@@ -100,10 +80,6 @@
 #define VMW_RES_SHADER ttm_driver_type4
 #define VMW_RES_HT_ORDER 12
 
-#define VMW_CURSOR_SNOOP_FORMAT SVGA3D_A8R8G8B8
-#define VMW_CURSOR_SNOOP_WIDTH 64
-#define VMW_CURSOR_SNOOP_HEIGHT 64
-
 #define MKSSTAT_CAPACITY_LOG2 5U
 #define MKSSTAT_CAPACITY (1U << MKSSTAT_CAPACITY_LOG2)
 
@@ -201,7 +177,7 @@ enum vmw_cmdbuf_res_type {
 struct vmw_cmdbuf_res_manager;
 
 struct vmw_cursor_snooper {
-	size_t age;
+	size_t id;
 	uint32_t *image;
 };
 
@@ -1050,7 +1026,6 @@ int vmw_kms_init(struct vmw_private *dev_priv);
 int vmw_kms_close(struct vmw_private *dev_priv);
 int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_priv);
-void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv);
 void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 			  struct ttm_object_file *tfile,
 			  struct ttm_buffer_object *bo,
@@ -1067,7 +1042,6 @@ int vmw_kms_present(struct vmw_private *dev_priv,
 		    uint32_t num_clips);
 int vmw_kms_update_layout_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file_priv);
-void vmw_kms_legacy_hotspot_clear(struct vmw_private *dev_priv);
 int vmw_kms_suspend(struct drm_device *dev);
 int vmw_kms_resume(struct drm_device *dev);
 void vmw_kms_lost_device(struct drm_device *dev);
@@ -1393,8 +1367,10 @@ int vmw_mksstat_remove_all(struct vmw_private *dev_priv);
 	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
 
 /* Resource dirtying - vmwgfx_page_dirty.c */
+bool vmw_bo_is_dirty(struct vmw_bo *vbo);
 void vmw_bo_dirty_scan(struct vmw_bo *vbo);
 int vmw_bo_dirty_add(struct vmw_bo *vbo);
+void vmw_bo_dirty_clear(struct vmw_bo *vbo);
 void vmw_bo_dirty_transfer_to_res(struct vmw_resource *res);
 void vmw_bo_dirty_clear_res(struct vmw_resource *res);
 void vmw_bo_dirty_release(struct vmw_bo *vbo);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 2e52d73eba48..f8325905388a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1,29 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2009 - 2023 VMware, Inc., Palo Alto, CA., USA
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ * Copyright (c) 2009-2025 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
  **************************************************************************/
+
 #include "vmwgfx_binding.h"
 #include "vmwgfx_bo.h"
 #include "vmwgfx_drv.h"
@@ -4512,8 +4494,6 @@ int vmw_execbuf_ioctl(struct drm_device *dev, void *data,
 	if (unlikely(ret != 0))
 		goto out;
 
-	vmw_kms_cursor_post_execbuf(dev_priv);
-
 out:
 	if (in_fence)
 		dma_fence_put(in_fence);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 1912ac1cde6d..05b1c54a070c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1,33 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright (c) 2009-2024 Broadcom. All Rights Reserved. The term
+ * Copyright (c) 2009-2025 Broadcom. All Rights Reserved. The term
  * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
  **************************************************************************/
+
 #include "vmwgfx_kms.h"
 
 #include "vmwgfx_bo.h"
+#include "vmwgfx_resource_priv.h"
 #include "vmwgfx_vkms.h"
 #include "vmw_surface_cache.h"
 
@@ -59,474 +41,6 @@ void vmw_du_cleanup(struct vmw_display_unit *du)
 	drm_connector_cleanup(&du->connector);
 }
 
-/*
- * Display Unit Cursor functions
- */
-
-static int vmw_du_cursor_plane_unmap_cm(struct vmw_plane_state *vps);
-static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
-				  struct vmw_plane_state *vps,
-				  u32 *image, u32 width, u32 height,
-				  u32 hotspotX, u32 hotspotY);
-
-struct vmw_svga_fifo_cmd_define_cursor {
-	u32 cmd;
-	SVGAFifoCmdDefineAlphaCursor cursor;
-};
-
-/**
- * vmw_send_define_cursor_cmd - queue a define cursor command
- * @dev_priv: the private driver struct
- * @image: buffer which holds the cursor image
- * @width: width of the mouse cursor image
- * @height: height of the mouse cursor image
- * @hotspotX: the horizontal position of mouse hotspot
- * @hotspotY: the vertical position of mouse hotspot
- */
-static void vmw_send_define_cursor_cmd(struct vmw_private *dev_priv,
-				       u32 *image, u32 width, u32 height,
-				       u32 hotspotX, u32 hotspotY)
-{
-	struct vmw_svga_fifo_cmd_define_cursor *cmd;
-	const u32 image_size = width * height * sizeof(*image);
-	const u32 cmd_size = sizeof(*cmd) + image_size;
-
-	/* Try to reserve fifocmd space and swallow any failures;
-	   such reservations cannot be left unconsumed for long
-	   under the risk of clogging other fifocmd users, so
-	   we treat reservations separtely from the way we treat
-	   other fallible KMS-atomic resources at prepare_fb */
-	cmd = VMW_CMD_RESERVE(dev_priv, cmd_size);
-
-	if (unlikely(!cmd))
-		return;
-
-	memset(cmd, 0, sizeof(*cmd));
-
-	memcpy(&cmd[1], image, image_size);
-
-	cmd->cmd = SVGA_CMD_DEFINE_ALPHA_CURSOR;
-	cmd->cursor.id = 0;
-	cmd->cursor.width = width;
-	cmd->cursor.height = height;
-	cmd->cursor.hotspotX = hotspotX;
-	cmd->cursor.hotspotY = hotspotY;
-
-	vmw_cmd_commit_flush(dev_priv, cmd_size);
-}
-
-/**
- * vmw_cursor_update_image - update the cursor image on the provided plane
- * @dev_priv: the private driver struct
- * @vps: the plane state of the cursor plane
- * @image: buffer which holds the cursor image
- * @width: width of the mouse cursor image
- * @height: height of the mouse cursor image
- * @hotspotX: the horizontal position of mouse hotspot
- * @hotspotY: the vertical position of mouse hotspot
- */
-static void vmw_cursor_update_image(struct vmw_private *dev_priv,
-				    struct vmw_plane_state *vps,
-				    u32 *image, u32 width, u32 height,
-				    u32 hotspotX, u32 hotspotY)
-{
-	if (vps->cursor.bo)
-		vmw_cursor_update_mob(dev_priv, vps, image,
-				      vps->base.crtc_w, vps->base.crtc_h,
-				      hotspotX, hotspotY);
-
-	else
-		vmw_send_define_cursor_cmd(dev_priv, image, width, height,
-					   hotspotX, hotspotY);
-}
-
-
-/**
- * vmw_cursor_update_mob - Update cursor vis CursorMob mechanism
- *
- * Called from inside vmw_du_cursor_plane_atomic_update to actually
- * make the cursor-image live.
- *
- * @dev_priv: device to work with
- * @vps: the plane state of the cursor plane
- * @image: cursor source data to fill the MOB with
- * @width: source data width
- * @height: source data height
- * @hotspotX: cursor hotspot x
- * @hotspotY: cursor hotspot Y
- */
-static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
-				  struct vmw_plane_state *vps,
-				  u32 *image, u32 width, u32 height,
-				  u32 hotspotX, u32 hotspotY)
-{
-	SVGAGBCursorHeader *header;
-	SVGAGBAlphaCursorHeader *alpha_header;
-	const u32 image_size = width * height * sizeof(*image);
-
-	header = vmw_bo_map_and_cache(vps->cursor.bo);
-	alpha_header = &header->header.alphaHeader;
-
-	memset(header, 0, sizeof(*header));
-
-	header->type = SVGA_ALPHA_CURSOR;
-	header->sizeInBytes = image_size;
-
-	alpha_header->hotspotX = hotspotX;
-	alpha_header->hotspotY = hotspotY;
-	alpha_header->width = width;
-	alpha_header->height = height;
-
-	memcpy(header + 1, image, image_size);
-	vmw_write(dev_priv, SVGA_REG_CURSOR_MOBID,
-		  vps->cursor.bo->tbo.resource->start);
-}
-
-
-static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
-{
-	return w * h * sizeof(u32) + sizeof(SVGAGBCursorHeader);
-}
-
-/**
- * vmw_du_cursor_plane_acquire_image -- Acquire the image data
- * @vps: cursor plane state
- */
-static u32 *vmw_du_cursor_plane_acquire_image(struct vmw_plane_state *vps)
-{
-	struct vmw_surface *surf;
-
-	if (vmw_user_object_is_null(&vps->uo))
-		return NULL;
-
-	surf = vmw_user_object_surface(&vps->uo);
-	if (surf && !vmw_user_object_is_mapped(&vps->uo))
-		return surf->snooper.image;
-
-	return vmw_user_object_map(&vps->uo);
-}
-
-static bool vmw_du_cursor_plane_has_changed(struct vmw_plane_state *old_vps,
-					    struct vmw_plane_state *new_vps)
-{
-	void *old_image;
-	void *new_image;
-	u32 size;
-	bool changed;
-
-	if (old_vps->base.crtc_w != new_vps->base.crtc_w ||
-	    old_vps->base.crtc_h != new_vps->base.crtc_h)
-	    return true;
-
-	if (old_vps->cursor.hotspot_x != new_vps->cursor.hotspot_x ||
-	    old_vps->cursor.hotspot_y != new_vps->cursor.hotspot_y)
-	    return true;
-
-	size = new_vps->base.crtc_w * new_vps->base.crtc_h * sizeof(u32);
-
-	old_image = vmw_du_cursor_plane_acquire_image(old_vps);
-	new_image = vmw_du_cursor_plane_acquire_image(new_vps);
-
-	changed = false;
-	if (old_image && new_image && old_image != new_image)
-		changed = memcmp(old_image, new_image, size) != 0;
-
-	return changed;
-}
-
-static void vmw_du_destroy_cursor_mob(struct vmw_bo **vbo)
-{
-	if (!(*vbo))
-		return;
-
-	ttm_bo_unpin(&(*vbo)->tbo);
-	vmw_bo_unreference(vbo);
-}
-
-static void vmw_du_put_cursor_mob(struct vmw_cursor_plane *vcp,
-				  struct vmw_plane_state *vps)
-{
-	u32 i;
-
-	if (!vps->cursor.bo)
-		return;
-
-	vmw_du_cursor_plane_unmap_cm(vps);
-
-	/* Look for a free slot to return this mob to the cache. */
-	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
-		if (!vcp->cursor_mobs[i]) {
-			vcp->cursor_mobs[i] = vps->cursor.bo;
-			vps->cursor.bo = NULL;
-			return;
-		}
-	}
-
-	/* Cache is full: See if this mob is bigger than an existing mob. */
-	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
-		if (vcp->cursor_mobs[i]->tbo.base.size <
-		    vps->cursor.bo->tbo.base.size) {
-			vmw_du_destroy_cursor_mob(&vcp->cursor_mobs[i]);
-			vcp->cursor_mobs[i] = vps->cursor.bo;
-			vps->cursor.bo = NULL;
-			return;
-		}
-	}
-
-	/* Destroy it if it's not worth caching. */
-	vmw_du_destroy_cursor_mob(&vps->cursor.bo);
-}
-
-static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
-				 struct vmw_plane_state *vps)
-{
-	struct vmw_private *dev_priv = vmw_priv(vcp->base.dev);
-	u32 size = vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.crtc_h);
-	u32 i;
-	u32 cursor_max_dim, mob_max_size;
-	struct vmw_fence_obj *fence = NULL;
-	int ret;
-
-	if (!dev_priv->has_mob ||
-	    (dev_priv->capabilities2 & SVGA_CAP2_CURSOR_MOB) == 0)
-		return -EINVAL;
-
-	mob_max_size = vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
-	cursor_max_dim = vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSION);
-
-	if (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
-	    vps->base.crtc_h > cursor_max_dim)
-		return -EINVAL;
-
-	if (vps->cursor.bo) {
-		if (vps->cursor.bo->tbo.base.size >= size)
-			return 0;
-		vmw_du_put_cursor_mob(vcp, vps);
-	}
-
-	/* Look for an unused mob in the cache. */
-	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
-		if (vcp->cursor_mobs[i] &&
-		    vcp->cursor_mobs[i]->tbo.base.size >= size) {
-			vps->cursor.bo = vcp->cursor_mobs[i];
-			vcp->cursor_mobs[i] = NULL;
-			return 0;
-		}
-	}
-	/* Create a new mob if we can't find an existing one. */
-	ret = vmw_bo_create_and_populate(dev_priv, size,
-					 VMW_BO_DOMAIN_MOB,
-					 &vps->cursor.bo);
-
-	if (ret != 0)
-		return ret;
-
-	/* Fence the mob creation so we are guarateed to have the mob */
-	ret = ttm_bo_reserve(&vps->cursor.bo->tbo, false, false, NULL);
-	if (ret != 0)
-		goto teardown;
-
-	ret = vmw_execbuf_fence_commands(NULL, dev_priv, &fence, NULL);
-	if (ret != 0) {
-		ttm_bo_unreserve(&vps->cursor.bo->tbo);
-		goto teardown;
-	}
-
-	dma_fence_wait(&fence->base, false);
-	dma_fence_put(&fence->base);
-
-	ttm_bo_unreserve(&vps->cursor.bo->tbo);
-	return 0;
-
-teardown:
-	vmw_du_destroy_cursor_mob(&vps->cursor.bo);
-	return ret;
-}
-
-
-static void vmw_cursor_update_position(struct vmw_private *dev_priv,
-				       bool show, int x, int y)
-{
-	const uint32_t svga_cursor_on = show ? SVGA_CURSOR_ON_SHOW
-					     : SVGA_CURSOR_ON_HIDE;
-	uint32_t count;
-
-	spin_lock(&dev_priv->cursor_lock);
-	if (dev_priv->capabilities2 & SVGA_CAP2_EXTRA_REGS) {
-		vmw_write(dev_priv, SVGA_REG_CURSOR4_X, x);
-		vmw_write(dev_priv, SVGA_REG_CURSOR4_Y, y);
-		vmw_write(dev_priv, SVGA_REG_CURSOR4_SCREEN_ID, SVGA3D_INVALID_ID);
-		vmw_write(dev_priv, SVGA_REG_CURSOR4_ON, svga_cursor_on);
-		vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, 1);
-	} else if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
-		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, svga_cursor_on);
-		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
-		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_Y, y);
-		count = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CURSOR_COUNT);
-		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_COUNT, ++count);
-	} else {
-		vmw_write(dev_priv, SVGA_REG_CURSOR_X, x);
-		vmw_write(dev_priv, SVGA_REG_CURSOR_Y, y);
-		vmw_write(dev_priv, SVGA_REG_CURSOR_ON, svga_cursor_on);
-	}
-	spin_unlock(&dev_priv->cursor_lock);
-}
-
-void vmw_kms_cursor_snoop(struct vmw_surface *srf,
-			  struct ttm_object_file *tfile,
-			  struct ttm_buffer_object *bo,
-			  SVGA3dCmdHeader *header)
-{
-	struct ttm_bo_kmap_obj map;
-	unsigned long kmap_offset;
-	unsigned long kmap_num;
-	SVGA3dCopyBox *box;
-	unsigned box_count;
-	void *virtual;
-	bool is_iomem;
-	struct vmw_dma_cmd {
-		SVGA3dCmdHeader header;
-		SVGA3dCmdSurfaceDMA dma;
-	} *cmd;
-	int i, ret;
-	const struct SVGA3dSurfaceDesc *desc =
-		vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
-	const u32 image_pitch = VMW_CURSOR_SNOOP_WIDTH * desc->pitchBytesPerBlock;
-
-	cmd = container_of(header, struct vmw_dma_cmd, header);
-
-	/* No snooper installed, nothing to copy */
-	if (!srf->snooper.image)
-		return;
-
-	if (cmd->dma.host.face != 0 || cmd->dma.host.mipmap != 0) {
-		DRM_ERROR("face and mipmap for cursors should never != 0\n");
-		return;
-	}
-
-	if (cmd->header.size < 64) {
-		DRM_ERROR("at least one full copy box must be given\n");
-		return;
-	}
-
-	box = (SVGA3dCopyBox *)&cmd[1];
-	box_count = (cmd->header.size - sizeof(SVGA3dCmdSurfaceDMA)) /
-			sizeof(SVGA3dCopyBox);
-
-	if (cmd->dma.guest.ptr.offset % PAGE_SIZE ||
-	    box->x != 0    || box->y != 0    || box->z != 0    ||
-	    box->srcx != 0 || box->srcy != 0 || box->srcz != 0 ||
-	    box->d != 1    || box_count != 1 ||
-	    box->w > VMW_CURSOR_SNOOP_WIDTH || box->h > VMW_CURSOR_SNOOP_HEIGHT) {
-		/* TODO handle none page aligned offsets */
-		/* TODO handle more dst & src != 0 */
-		/* TODO handle more then one copy */
-		DRM_ERROR("Can't snoop dma request for cursor!\n");
-		DRM_ERROR("(%u, %u, %u) (%u, %u, %u) (%ux%ux%u) %u %u\n",
-			  box->srcx, box->srcy, box->srcz,
-			  box->x, box->y, box->z,
-			  box->w, box->h, box->d, box_count,
-			  cmd->dma.guest.ptr.offset);
-		return;
-	}
-
-	kmap_offset = cmd->dma.guest.ptr.offset >> PAGE_SHIFT;
-	kmap_num = (VMW_CURSOR_SNOOP_HEIGHT*image_pitch) >> PAGE_SHIFT;
-
-	ret = ttm_bo_reserve(bo, true, false, NULL);
-	if (unlikely(ret != 0)) {
-		DRM_ERROR("reserve failed\n");
-		return;
-	}
-
-	ret = ttm_bo_kmap(bo, kmap_offset, kmap_num, &map);
-	if (unlikely(ret != 0))
-		goto err_unreserve;
-
-	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
-
-	if (box->w == VMW_CURSOR_SNOOP_WIDTH && cmd->dma.guest.pitch == image_pitch) {
-		memcpy(srf->snooper.image, virtual,
-		       VMW_CURSOR_SNOOP_HEIGHT*image_pitch);
-	} else {
-		/* Image is unsigned pointer. */
-		for (i = 0; i < box->h; i++)
-			memcpy(srf->snooper.image + i * image_pitch,
-			       virtual + i * cmd->dma.guest.pitch,
-			       box->w * desc->pitchBytesPerBlock);
-	}
-
-	srf->snooper.age++;
-
-	ttm_bo_kunmap(&map);
-err_unreserve:
-	ttm_bo_unreserve(bo);
-}
-
-/**
- * vmw_kms_legacy_hotspot_clear - Clear legacy hotspots
- *
- * @dev_priv: Pointer to the device private struct.
- *
- * Clears all legacy hotspots.
- */
-void vmw_kms_legacy_hotspot_clear(struct vmw_private *dev_priv)
-{
-	struct drm_device *dev = &dev_priv->drm;
-	struct vmw_display_unit *du;
-	struct drm_crtc *crtc;
-
-	drm_modeset_lock_all(dev);
-	drm_for_each_crtc(crtc, dev) {
-		du = vmw_crtc_to_du(crtc);
-
-		du->hotspot_x = 0;
-		du->hotspot_y = 0;
-	}
-	drm_modeset_unlock_all(dev);
-}
-
-void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv)
-{
-	struct drm_device *dev = &dev_priv->drm;
-	struct vmw_display_unit *du;
-	struct drm_crtc *crtc;
-
-	mutex_lock(&dev->mode_config.mutex);
-
-	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-		du = vmw_crtc_to_du(crtc);
-		if (!du->cursor_surface ||
-		    du->cursor_age == du->cursor_surface->snooper.age ||
-		    !du->cursor_surface->snooper.image)
-			continue;
-
-		du->cursor_age = du->cursor_surface->snooper.age;
-		vmw_send_define_cursor_cmd(dev_priv,
-					   du->cursor_surface->snooper.image,
-					   VMW_CURSOR_SNOOP_WIDTH,
-					   VMW_CURSOR_SNOOP_HEIGHT,
-					   du->hotspot_x + du->core_hotspot_x,
-					   du->hotspot_y + du->core_hotspot_y);
-	}
-
-	mutex_unlock(&dev->mode_config.mutex);
-}
-
-
-void vmw_du_cursor_plane_destroy(struct drm_plane *plane)
-{
-	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
-	u32 i;
-
-	vmw_cursor_update_position(vmw_priv(plane->dev), false, 0, 0);
-
-	for (i = 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++)
-		vmw_du_destroy_cursor_mob(&vcp->cursor_mobs[i]);
-
-	drm_plane_cleanup(plane);
-}
-
 
 void vmw_du_primary_plane_destroy(struct drm_plane *plane)
 {
@@ -574,262 +88,6 @@ vmw_du_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 
-/**
- * vmw_du_cursor_plane_map_cm - Maps the cursor mobs.
- *
- * @vps: plane_state
- *
- * Returns 0 on success
- */
-
-static int
-vmw_du_cursor_plane_map_cm(struct vmw_plane_state *vps)
-{
-	int ret;
-	u32 size = vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.crtc_h);
-	struct ttm_buffer_object *bo;
-
-	if (!vps->cursor.bo)
-		return -EINVAL;
-
-	bo = &vps->cursor.bo->tbo;
-
-	if (bo->base.size < size)
-		return -EINVAL;
-
-	if (vps->cursor.bo->map.virtual)
-		return 0;
-
-	ret = ttm_bo_reserve(bo, false, false, NULL);
-	if (unlikely(ret != 0))
-		return -ENOMEM;
-
-	vmw_bo_map_and_cache(vps->cursor.bo);
-
-	ttm_bo_unreserve(bo);
-
-	if (unlikely(ret != 0))
-		return -ENOMEM;
-
-	return 0;
-}
-
-
-/**
- * vmw_du_cursor_plane_unmap_cm - Unmaps the cursor mobs.
- *
- * @vps: state of the cursor plane
- *
- * Returns 0 on success
- */
-
-static int
-vmw_du_cursor_plane_unmap_cm(struct vmw_plane_state *vps)
-{
-	int ret = 0;
-	struct vmw_bo *vbo = vps->cursor.bo;
-
-	if (!vbo || !vbo->map.virtual)
-		return 0;
-
-	ret = ttm_bo_reserve(&vbo->tbo, true, false, NULL);
-	if (likely(ret == 0)) {
-		vmw_bo_unmap(vbo);
-		ttm_bo_unreserve(&vbo->tbo);
-	}
-
-	return ret;
-}
-
-
-/**
- * vmw_du_cursor_plane_cleanup_fb - Unpins the plane surface
- *
- * @plane: cursor plane
- * @old_state: contains the state to clean up
- *
- * Unmaps all cursor bo mappings and unpins the cursor surface
- *
- * Returns 0 on success
- */
-void
-vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
-			       struct drm_plane_state *old_state)
-{
-	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
-	struct vmw_plane_state *vps = vmw_plane_state_to_vps(old_state);
-
-	if (!vmw_user_object_is_null(&vps->uo))
-		vmw_user_object_unmap(&vps->uo);
-
-	vmw_du_cursor_plane_unmap_cm(vps);
-	vmw_du_put_cursor_mob(vcp, vps);
-
-	vmw_du_plane_unpin_surf(vps);
-	vmw_user_object_unref(&vps->uo);
-}
-
-
-/**
- * vmw_du_cursor_plane_prepare_fb - Readies the cursor by referencing it
- *
- * @plane:  display plane
- * @new_state: info on the new plane state, including the FB
- *
- * Returns 0 on success
- */
-int
-vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
-			       struct drm_plane_state *new_state)
-{
-	struct drm_framebuffer *fb = new_state->fb;
-	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
-	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
-	struct vmw_bo *bo = NULL;
-	int ret = 0;
-
-	if (!vmw_user_object_is_null(&vps->uo)) {
-		vmw_user_object_unmap(&vps->uo);
-		vmw_user_object_unref(&vps->uo);
-	}
-
-	if (fb) {
-		if (vmw_framebuffer_to_vfb(fb)->bo) {
-			vps->uo.buffer = vmw_framebuffer_to_vfbd(fb)->buffer;
-			vps->uo.surface = NULL;
-		} else {
-			memcpy(&vps->uo, &vmw_framebuffer_to_vfbs(fb)->uo, sizeof(vps->uo));
-		}
-		vmw_user_object_ref(&vps->uo);
-	}
-
-	bo = vmw_user_object_buffer(&vps->uo);
-	if (bo) {
-		struct ttm_operation_ctx ctx = {false, false};
-
-		ret = ttm_bo_reserve(&bo->tbo, true, false, NULL);
-		if (ret != 0)
-			return -ENOMEM;
-
-		ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-		if (ret != 0)
-			return -ENOMEM;
-
-		vmw_bo_pin_reserved(bo, true);
-		if (vmw_framebuffer_to_vfb(fb)->bo) {
-			const u32 size = new_state->crtc_w * new_state->crtc_h * sizeof(u32);
-
-			(void)vmw_bo_map_and_cache_size(bo, size);
-		} else {
-			vmw_bo_map_and_cache(bo);
-		}
-		ttm_bo_unreserve(&bo->tbo);
-	}
-
-	if (!vmw_user_object_is_null(&vps->uo)) {
-		vmw_du_get_cursor_mob(vcp, vps);
-		vmw_du_cursor_plane_map_cm(vps);
-	}
-
-	return 0;
-}
-
-
-void
-vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
-				  struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
-	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
-	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
-	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
-	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
-	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
-	struct vmw_bo *old_bo = NULL;
-	struct vmw_bo *new_bo = NULL;
-	struct ww_acquire_ctx ctx;
-	s32 hotspot_x, hotspot_y;
-	int ret;
-
-	hotspot_x = du->hotspot_x + new_state->hotspot_x;
-	hotspot_y = du->hotspot_y + new_state->hotspot_y;
-
-	du->cursor_surface = vmw_user_object_surface(&vps->uo);
-
-	if (vmw_user_object_is_null(&vps->uo)) {
-		vmw_cursor_update_position(dev_priv, false, 0, 0);
-		return;
-	}
-
-	vps->cursor.hotspot_x = hotspot_x;
-	vps->cursor.hotspot_y = hotspot_y;
-
-	if (du->cursor_surface)
-		du->cursor_age = du->cursor_surface->snooper.age;
-
-	ww_acquire_init(&ctx, &reservation_ww_class);
-
-	if (!vmw_user_object_is_null(&old_vps->uo)) {
-		old_bo = vmw_user_object_buffer(&old_vps->uo);
-		ret = ttm_bo_reserve(&old_bo->tbo, false, false, &ctx);
-		if (ret != 0)
-			return;
-	}
-
-	if (!vmw_user_object_is_null(&vps->uo)) {
-		new_bo = vmw_user_object_buffer(&vps->uo);
-		if (old_bo != new_bo) {
-			ret = ttm_bo_reserve(&new_bo->tbo, false, false, &ctx);
-			if (ret != 0) {
-				if (old_bo) {
-					ttm_bo_unreserve(&old_bo->tbo);
-					ww_acquire_fini(&ctx);
-				}
-				return;
-			}
-		} else {
-			new_bo = NULL;
-		}
-	}
-	if (!vmw_du_cursor_plane_has_changed(old_vps, vps)) {
-		/*
-		 * If it hasn't changed, avoid making the device do extra
-		 * work by keeping the old cursor active.
-		 */
-		struct vmw_cursor_plane_state tmp = old_vps->cursor;
-		old_vps->cursor = vps->cursor;
-		vps->cursor = tmp;
-	} else {
-		void *image = vmw_du_cursor_plane_acquire_image(vps);
-		if (image)
-			vmw_cursor_update_image(dev_priv, vps, image,
-						new_state->crtc_w,
-						new_state->crtc_h,
-						hotspot_x, hotspot_y);
-	}
-
-	if (new_bo)
-		ttm_bo_unreserve(&new_bo->tbo);
-	if (old_bo)
-		ttm_bo_unreserve(&old_bo->tbo);
-
-	ww_acquire_fini(&ctx);
-
-	du->cursor_x = new_state->crtc_x + du->set_gui_x;
-	du->cursor_y = new_state->crtc_y + du->set_gui_y;
-
-	vmw_cursor_update_position(dev_priv, true,
-				   du->cursor_x + hotspot_x,
-				   du->cursor_y + hotspot_y);
-
-	du->core_hotspot_x = hotspot_x - du->hotspot_x;
-	du->core_hotspot_y = hotspot_y - du->hotspot_y;
-}
-
-
 /**
  * vmw_du_primary_plane_atomic_check - check if the new state is okay
  *
@@ -873,66 +131,6 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
 	return ret;
 }
 
-
-/**
- * vmw_du_cursor_plane_atomic_check - check if the new state is okay
- *
- * @plane: cursor plane
- * @state: info on the new plane state
- *
- * This is a chance to fail if the new cursor state does not fit
- * our requirements.
- *
- * Returns 0 on success
- */
-int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
-				     struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
-	int ret = 0;
-	struct drm_crtc_state *crtc_state = NULL;
-	struct vmw_surface *surface = NULL;
-	struct drm_framebuffer *fb = new_state->fb;
-
-	if (new_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
-							   new_state->crtc);
-
-	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  true, true);
-	if (ret)
-		return ret;
-
-	/* Turning off */
-	if (!fb)
-		return 0;
-
-	/* A lot of the code assumes this */
-	if (new_state->crtc_w != 64 || new_state->crtc_h != 64) {
-		DRM_ERROR("Invalid cursor dimensions (%d, %d)\n",
-			  new_state->crtc_w, new_state->crtc_h);
-		return -EINVAL;
-	}
-
-	if (!vmw_framebuffer_to_vfb(fb)->bo) {
-		surface = vmw_user_object_surface(&vmw_framebuffer_to_vfbs(fb)->uo);
-
-		WARN_ON(!surface);
-
-		if (!surface ||
-		    (!surface->snooper.image && !surface->res.guest_memory_bo)) {
-			DRM_ERROR("surface not suitable for cursor\n");
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
-
 int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state)
 {
@@ -1076,7 +274,7 @@ vmw_du_plane_duplicate_state(struct drm_plane *plane)
 	vps->pinned = 0;
 	vps->cpp = 0;
 
-	memset(&vps->cursor, 0, sizeof(vps->cursor));
+	vps->cursor.mob = NULL;
 
 	/* Each ref counted resource needs to be acquired again */
 	vmw_user_object_ref(&vps->uo);
@@ -1221,7 +419,20 @@ static void vmw_framebuffer_surface_destroy(struct drm_framebuffer *framebuffer)
 {
 	struct vmw_framebuffer_surface *vfbs =
 		vmw_framebuffer_to_vfbs(framebuffer);
+	struct vmw_bo *bo = vmw_user_object_buffer(&vfbs->uo);
+	struct vmw_surface *surf = vmw_user_object_surface(&vfbs->uo);
 
+	if (bo) {
+		vmw_bo_dirty_release(bo);
+		/*
+		 * bo->dirty is reference counted so it being NULL
+		 * means that the surface wasn't coherent to begin
+		 * with and so we have to free the dirty tracker
+		 * in the vmw_resource
+		 */
+		if (!bo->dirty && surf && surf->res.dirty)
+			surf->res.func->dirty_free(&surf->res);
+	}
 	drm_framebuffer_cleanup(framebuffer);
 	vmw_user_object_unref(&vfbs->uo);
 
@@ -1375,6 +586,7 @@ static void vmw_framebuffer_bo_destroy(struct drm_framebuffer *framebuffer)
 	struct vmw_framebuffer_bo *vfbd =
 		vmw_framebuffer_to_vfbd(framebuffer);
 
+	vmw_bo_dirty_release(vfbd->buffer);
 	drm_framebuffer_cleanup(framebuffer);
 	vmw_bo_unreference(&vfbd->buffer);
 
@@ -1505,6 +717,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct vmw_framebuffer *vfb = NULL;
 	struct vmw_user_object uo = {0};
+	struct vmw_bo *bo;
+	struct vmw_surface *surface;
 	int ret;
 
 	/* returns either a bo or surface */
@@ -1534,6 +748,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 	}
 
 err_out:
+	bo = vmw_user_object_buffer(&uo);
+	surface = vmw_user_object_surface(&uo);
 	/* vmw_user_object_lookup takes one ref so does new_fb */
 	vmw_user_object_unref(&uo);
 
@@ -1542,6 +758,14 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
+	ttm_bo_reserve(&bo->tbo, false, false, NULL);
+	ret = vmw_bo_dirty_add(bo);
+	if (!ret && surface && surface->res.func->dirty_alloc) {
+		surface->res.coherent = true;
+		ret = surface->res.func->dirty_alloc(&surface->res);
+	}
+	ttm_bo_unreserve(&bo->tbo);
+
 	return &vfb->base;
 }
 
@@ -1974,44 +1198,6 @@ int vmw_kms_close(struct vmw_private *dev_priv)
 	return ret;
 }
 
-int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
-				struct drm_file *file_priv)
-{
-	struct drm_vmw_cursor_bypass_arg *arg = data;
-	struct vmw_display_unit *du;
-	struct drm_crtc *crtc;
-	int ret = 0;
-
-	mutex_lock(&dev->mode_config.mutex);
-	if (arg->flags & DRM_VMW_CURSOR_BYPASS_ALL) {
-
-		list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
-			du = vmw_crtc_to_du(crtc);
-			du->hotspot_x = arg->xhot;
-			du->hotspot_y = arg->yhot;
-		}
-
-		mutex_unlock(&dev->mode_config.mutex);
-		return 0;
-	}
-
-	crtc = drm_crtc_find(dev, file_priv, arg->crtc_id);
-	if (!crtc) {
-		ret = -ENOENT;
-		goto out;
-	}
-
-	du = vmw_crtc_to_du(crtc);
-
-	du->hotspot_x = arg->xhot;
-	du->hotspot_y = arg->yhot;
-
-out:
-	mutex_unlock(&dev->mode_config.mutex);
-
-	return ret;
-}
-
 int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 			unsigned width, unsigned height, unsigned pitch,
 			unsigned bpp, unsigned depth)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 4eab581883e2..511e29cdb987 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -1,40 +1,21 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**************************************************************************
  *
- * Copyright (c) 2009-2024 Broadcom. All Rights Reserved. The term
+ * Copyright (c) 2009-2025 Broadcom. All Rights Reserved. The term
  * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
  **************************************************************************/
 
 #ifndef VMWGFX_KMS_H_
 #define VMWGFX_KMS_H_
 
+#include "vmwgfx_cursor_plane.h"
+#include "vmwgfx_drv.h"
+
 #include <drm/drm_encoder.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_probe_helper.h>
 
-#include "vmwgfx_drv.h"
-
 /**
  * struct vmw_du_update_plane - Closure structure for vmw_du_helper_plane_update
  * @plane: Plane which is being updated.
@@ -235,16 +216,11 @@ static const uint32_t __maybe_unused vmw_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB1555,
 };
 
-static const uint32_t __maybe_unused vmw_cursor_plane_formats[] = {
-	DRM_FORMAT_ARGB8888,
-};
-
 
 #define vmw_crtc_state_to_vcs(x) container_of(x, struct vmw_crtc_state, base)
 #define vmw_plane_state_to_vps(x) container_of(x, struct vmw_plane_state, base)
 #define vmw_connector_state_to_vcs(x) \
 		container_of(x, struct vmw_connector_state, base)
-#define vmw_plane_to_vcp(x) container_of(x, struct vmw_cursor_plane, base)
 
 /**
  * Derived class for crtc state object
@@ -255,11 +231,6 @@ struct vmw_crtc_state {
 	struct drm_crtc_state base;
 };
 
-struct vmw_cursor_plane_state {
-	struct vmw_bo *bo;
-	s32 hotspot_x;
-	s32 hotspot_y;
-};
 
 /**
  * Derived class for plane state object
@@ -283,7 +254,6 @@ struct vmw_plane_state {
 	/* For CPU Blit */
 	unsigned int cpp;
 
-	bool surf_mapped;
 	struct vmw_cursor_plane_state cursor;
 };
 
@@ -317,17 +287,6 @@ struct vmw_connector_state {
 	int gui_y;
 };
 
-/**
- * Derived class for cursor plane object
- *
- * @base DRM plane object
- * @cursor.cursor_mobs Cursor mobs available for re-use
- */
-struct vmw_cursor_plane {
-	struct drm_plane base;
-
-	struct vmw_bo *cursor_mobs[3];
-};
 
 /**
  * Base class display unit.
@@ -343,17 +302,6 @@ struct vmw_display_unit {
 	struct drm_plane primary;
 	struct vmw_cursor_plane cursor;
 
-	struct vmw_surface *cursor_surface;
-	size_t cursor_age;
-
-	int cursor_x;
-	int cursor_y;
-
-	int hotspot_x;
-	int hotspot_y;
-	s32 core_hotspot_x;
-	s32 core_hotspot_y;
-
 	unsigned unit;
 
 	/*
@@ -403,8 +351,6 @@ struct vmw_display_unit {
  */
 void vmw_du_init(struct vmw_display_unit *du);
 void vmw_du_cleanup(struct vmw_display_unit *du);
-void vmw_du_crtc_save(struct drm_crtc *crtc);
-void vmw_du_crtc_restore(struct drm_crtc *crtc);
 int vmw_du_crtc_gamma_set(struct drm_crtc *crtc,
 			   u16 *r, u16 *g, u16 *b,
 			   uint32_t size,
@@ -460,19 +406,10 @@ void vmw_kms_create_implicit_placement_property(struct vmw_private *dev_priv);
 
 /* Universal Plane Helpers */
 void vmw_du_primary_plane_destroy(struct drm_plane *plane);
-void vmw_du_cursor_plane_destroy(struct drm_plane *plane);
 
 /* Atomic Helpers */
 int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
 				      struct drm_atomic_state *state);
-int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
-				     struct drm_atomic_state *state);
-void vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
-				       struct drm_atomic_state *state);
-int vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
-				   struct drm_plane_state *new_state);
-void vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
-			     struct drm_plane_state *old_state);
 void vmw_du_plane_cleanup_fb(struct drm_plane *plane,
 			     struct drm_plane_state *old_state);
 void vmw_du_plane_reset(struct drm_plane *plane);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index f0b429525467..c23c9195f0dc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -372,7 +372,7 @@ static const struct drm_plane_funcs vmw_ldu_plane_funcs = {
 static const struct drm_plane_funcs vmw_ldu_cursor_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = vmw_du_cursor_plane_destroy,
+	.destroy = vmw_cursor_plane_destroy,
 	.reset = vmw_du_plane_reset,
 	.atomic_duplicate_state = vmw_du_plane_duplicate_state,
 	.atomic_destroy_state = vmw_du_plane_destroy_state,
@@ -383,10 +383,10 @@ static const struct drm_plane_funcs vmw_ldu_cursor_funcs = {
  */
 static const struct
 drm_plane_helper_funcs vmw_ldu_cursor_plane_helper_funcs = {
-	.atomic_check = vmw_du_cursor_plane_atomic_check,
-	.atomic_update = vmw_du_cursor_plane_atomic_update,
-	.prepare_fb = vmw_du_cursor_plane_prepare_fb,
-	.cleanup_fb = vmw_du_cursor_plane_cleanup_fb,
+	.atomic_check = vmw_cursor_plane_atomic_check,
+	.atomic_update = vmw_cursor_plane_atomic_update,
+	.prepare_fb = vmw_cursor_plane_prepare_fb,
+	.cleanup_fb = vmw_cursor_plane_cleanup_fb,
 };
 
 static const struct
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 74ff2812d66a..7de20e56082c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -1,27 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2019-2023 VMware, Inc., Palo Alto, CA., USA
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ * Copyright (c) 2019-2025 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
  **************************************************************************/
 #include "vmwgfx_bo.h"
@@ -71,6 +52,11 @@ struct vmw_bo_dirty {
 	unsigned long bitmap[];
 };
 
+bool vmw_bo_is_dirty(struct vmw_bo *vbo)
+{
+	return vbo->dirty && (vbo->dirty->start < vbo->dirty->end);
+}
+
 /**
  * vmw_bo_dirty_scan_pagetable - Perform a pagetable scan for dirty bits
  * @vbo: The buffer object to scan
@@ -341,6 +327,41 @@ void vmw_bo_dirty_transfer_to_res(struct vmw_resource *res)
 		dirty->end = res_start;
 }
 
+void vmw_bo_dirty_clear(struct vmw_bo *vbo)
+{
+	struct vmw_bo_dirty *dirty = vbo->dirty;
+	pgoff_t start, cur, end;
+	unsigned long res_start = 0;
+	unsigned long res_end = vbo->tbo.base.size;
+
+	WARN_ON_ONCE(res_start & ~PAGE_MASK);
+	res_start >>= PAGE_SHIFT;
+	res_end = DIV_ROUND_UP(res_end, PAGE_SIZE);
+
+	if (res_start >= dirty->end || res_end <= dirty->start)
+		return;
+
+	cur = max(res_start, dirty->start);
+	res_end = max(res_end, dirty->end);
+	while (cur < res_end) {
+		unsigned long num;
+
+		start = find_next_bit(&dirty->bitmap[0], res_end, cur);
+		if (start >= res_end)
+			break;
+
+		end = find_next_zero_bit(&dirty->bitmap[0], res_end, start + 1);
+		cur = end + 1;
+		num = end - start;
+		bitmap_clear(&dirty->bitmap[0], start, num);
+	}
+
+	if (res_start <= dirty->start && res_end > dirty->start)
+		dirty->start = res_end;
+	if (res_start < dirty->end && res_end >= dirty->end)
+		dirty->end = res_start;
+}
+
 /**
  * vmw_bo_dirty_clear_res - Clear a resource's dirty region from
  * its backing mob.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 32029d80b72b..6149a9c981da 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -764,7 +764,7 @@ static const struct drm_plane_funcs vmw_sou_plane_funcs = {
 static const struct drm_plane_funcs vmw_sou_cursor_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = vmw_du_cursor_plane_destroy,
+	.destroy = vmw_cursor_plane_destroy,
 	.reset = vmw_du_plane_reset,
 	.atomic_duplicate_state = vmw_du_plane_duplicate_state,
 	.atomic_destroy_state = vmw_du_plane_destroy_state,
@@ -775,10 +775,10 @@ static const struct drm_plane_funcs vmw_sou_cursor_funcs = {
  */
 static const struct
 drm_plane_helper_funcs vmw_sou_cursor_plane_helper_funcs = {
-	.atomic_check = vmw_du_cursor_plane_atomic_check,
-	.atomic_update = vmw_du_cursor_plane_atomic_update,
-	.prepare_fb = vmw_du_cursor_plane_prepare_fb,
-	.cleanup_fb = vmw_du_cursor_plane_cleanup_fb,
+	.atomic_check = vmw_cursor_plane_atomic_check,
+	.atomic_update = vmw_cursor_plane_atomic_update,
+	.prepare_fb = vmw_cursor_plane_prepare_fb,
+	.cleanup_fb = vmw_cursor_plane_cleanup_fb,
 };
 
 static const struct
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index f5d2ed1b0a72..20aab725e53a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1482,7 +1482,7 @@ static const struct drm_plane_funcs vmw_stdu_plane_funcs = {
 static const struct drm_plane_funcs vmw_stdu_cursor_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = vmw_du_cursor_plane_destroy,
+	.destroy = vmw_cursor_plane_destroy,
 	.reset = vmw_du_plane_reset,
 	.atomic_duplicate_state = vmw_du_plane_duplicate_state,
 	.atomic_destroy_state = vmw_du_plane_destroy_state,
@@ -1494,10 +1494,10 @@ static const struct drm_plane_funcs vmw_stdu_cursor_funcs = {
  */
 static const struct
 drm_plane_helper_funcs vmw_stdu_cursor_plane_helper_funcs = {
-	.atomic_check = vmw_du_cursor_plane_atomic_check,
-	.atomic_update = vmw_du_cursor_plane_atomic_update,
-	.prepare_fb = vmw_du_cursor_plane_prepare_fb,
-	.cleanup_fb = vmw_du_cursor_plane_cleanup_fb,
+	.atomic_check = vmw_cursor_plane_atomic_check,
+	.atomic_update = vmw_cursor_plane_atomic_update,
+	.prepare_fb = vmw_cursor_plane_prepare_fb,
+	.cleanup_fb = vmw_cursor_plane_cleanup_fb,
 };
 
 static const struct
@@ -1584,6 +1584,7 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 	}
 
 	drm_plane_helper_add(&cursor->base, &vmw_stdu_cursor_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(&cursor->base);
 
 	ret = drm_connector_init(dev, connector, &vmw_stdu_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5721c74da3e0..1a0a544b1ad0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1,32 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright (c) 2009-2024 Broadcom. All Rights Reserved. The term
+ * Copyright (c) 2009-2025 Broadcom. All Rights Reserved. The term
  * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
  **************************************************************************/
 
 #include "vmwgfx_bo.h"
+#include "vmwgfx_cursor_plane.h"
 #include "vmwgfx_drv.h"
 #include "vmwgfx_resource_priv.h"
 #include "vmwgfx_so.h"
@@ -818,25 +799,11 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 	res->guest_memory_size = cur_bo_offset;
-	if (!file_priv->atomic &&
-	    metadata->scanout &&
-	    metadata->num_sizes == 1 &&
-	    metadata->sizes[0].width == VMW_CURSOR_SNOOP_WIDTH &&
-	    metadata->sizes[0].height == VMW_CURSOR_SNOOP_HEIGHT &&
-	    metadata->format == VMW_CURSOR_SNOOP_FORMAT) {
-		const struct SVGA3dSurfaceDesc *desc =
-			vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
-		const u32 cursor_size_bytes = VMW_CURSOR_SNOOP_WIDTH *
-					      VMW_CURSOR_SNOOP_HEIGHT *
-					      desc->pitchBytesPerBlock;
-		srf->snooper.image = kzalloc(cursor_size_bytes, GFP_KERNEL);
-		if (!srf->snooper.image) {
-			DRM_ERROR("Failed to allocate cursor_image\n");
-			ret = -ENOMEM;
-			goto out_no_copy;
-		}
-	} else {
-		srf->snooper.image = NULL;
+
+	srf->snooper.image = vmw_cursor_snooper_create(file_priv, metadata);
+	if (IS_ERR(srf->snooper.image)) {
+		ret = PTR_ERR(srf->snooper.image);
+		goto out_no_copy;
 	}
 
 	if (drm_is_primary_client(file_priv))
-- 
2.45.2


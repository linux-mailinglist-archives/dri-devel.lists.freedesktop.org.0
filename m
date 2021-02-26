Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C632636E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 14:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778296EDE8;
	Fri, 26 Feb 2021 13:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC93A6EDE8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 13:36:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id g11so3726163wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 05:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gVH2ZxWpyTJ7W1g24Kefu+eIt/0P+s+vIl/N23MUvQc=;
 b=gv5ALXo46BOk+9aX24FviBIXT3RM+V5y5AoXKa9M+zZix/odjP8pbnbDn12lCdygYy
 46Bj5googFeqhgtlS7Ni2HZYuNMmvYMU0h440YVq/7mg4/iEP4v9wJEh9KpjIKjnF0dU
 iOLRsuVxX1UGKMB3IiYPIE59XBgFN5cXQ+fEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gVH2ZxWpyTJ7W1g24Kefu+eIt/0P+s+vIl/N23MUvQc=;
 b=aIqOsfzEpe1UCXnPfI8EfSiotlAsGd50eWR1lk7xVJiV1kd1VngpsGb31zMkWRTVmA
 bytyN406Hubkz7+1gXzhdlMZAH4mmh8YBKXRSv4Y5Z+221yvkhfS9J1Daqnznca5p1oe
 2dlW+NGfE6P5fKbpWz3ovbMprVcXr5GPUUsUtpENUdtAPBEfxVKKUOIVpxwNjhvfvDBy
 xcS4EFwgZ88bm86UazoIwXcIcM+3PDhemXTPkSAlWJFcNaJI0ysYmQMZILxrOrl2cOCB
 sifGJw3Eyg2oQO6YVEOWgfizmhBA2PYUoZZs4ZpGDv6ny8n749WTBUYsfuaqJpM7pLcx
 SshA==
X-Gm-Message-State: AOAM533FnGBjx+6EuRUDKi7pXwJYKEIDQNQ+1SUPhS35OBt1HSP9Z1Gp
 uC7AsjkEAXhkiQciuvAD/hgUo4UD2G7C2A==
X-Google-Smtp-Source: ABdhPJxGQAuHcI4E/GFJhidlyVVPvqP5uPa4RJknZyB36o563bqg2Z4FKuEi688aH8eWiEgag3eVKw==
X-Received: by 2002:a1c:4d19:: with SMTP id o25mr2973794wmh.98.1614346612461; 
 Fri, 26 Feb 2021 05:36:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y62sm13350793wmy.9.2021.02.26.05.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:36:52 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/arcpgu: Really delete file
Date: Fri, 26 Feb 2021 14:36:47 +0100
Message-Id: <20210226133647.1403642-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Somehow this got forgotten when I applied the patch in

commit e2c406ea0b0d398a4afda5702957064cc74f8c25
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue Jan 12 09:43:54 2021 +0100

    drm/arc: Inline arcpgu_crtc.c

Fixes: e2c406ea0b0d ("drm/arc: Inline arcpgu_crtc.c")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 161 ------------------------------
 1 file changed, 161 deletions(-)
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
deleted file mode 100644
index bfd892a9fa3d..000000000000
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ /dev/null
@@ -1,161 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ARC PGU DRM driver.
- *
- * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
- */
-
-#include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
-#include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
-#include <drm/drm_probe_helper.h>
-#include <linux/clk.h>
-#include <linux/platform_data/simplefb.h>
-
-#include "arcpgu.h"
-#include "arcpgu_regs.h"
-
-#define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
-
-static const u32 arc_pgu_supported_formats[] = {
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-};
-
-static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
-{
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
-	uint32_t pixel_format = fb->format->format;
-	u32 format = DRM_FORMAT_INVALID;
-	int i;
-	u32 reg_ctrl;
-
-	for (i = 0; i < ARRAY_SIZE(arc_pgu_supported_formats); i++) {
-		if (arc_pgu_supported_formats[i] == pixel_format)
-			format = arc_pgu_supported_formats[i];
-	}
-
-	if (WARN_ON(format == DRM_FORMAT_INVALID))
-		return;
-
-	reg_ctrl = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
-	if (format == DRM_FORMAT_RGB565)
-		reg_ctrl &= ~ARCPGU_MODE_XRGB8888;
-	else
-		reg_ctrl |= ARCPGU_MODE_XRGB8888;
-	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
-}
-
-static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
-					       const struct drm_display_mode *mode)
-{
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
-	long rate, clk_rate = mode->clock * 1000;
-	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
-
-	rate = clk_round_rate(arcpgu->clk, clk_rate);
-	if ((max(rate, clk_rate) - min(rate, clk_rate) < diff) && (rate > 0))
-		return MODE_OK;
-
-	return MODE_NOCLOCK;
-}
-
-static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
-{
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
-	u32 val;
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
-		      ENCODE_PGU_XY(m->crtc_htotal, m->crtc_vtotal));
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_HSYNC,
-		      ENCODE_PGU_XY(m->crtc_hsync_start - m->crtc_hdisplay,
-				    m->crtc_hsync_end - m->crtc_hdisplay));
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_VSYNC,
-		      ENCODE_PGU_XY(m->crtc_vsync_start - m->crtc_vdisplay,
-				    m->crtc_vsync_end - m->crtc_vdisplay));
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_ACTIVE,
-		      ENCODE_PGU_XY(m->crtc_hblank_end - m->crtc_hblank_start,
-				    m->crtc_vblank_end - m->crtc_vblank_start));
-
-	val = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
-
-	if (m->flags & DRM_MODE_FLAG_PVSYNC)
-		val |= ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST;
-	else
-		val &= ~(ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST);
-
-	if (m->flags & DRM_MODE_FLAG_PHSYNC)
-		val |= ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST;
-	else
-		val &= ~(ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST);
-
-	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, val);
-	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
-	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
-
-	arc_pgu_set_pxl_fmt(arcpgu);
-
-	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
-}
-
-static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
-{
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
-
-	arc_pgu_mode_set(arcpgu);
-
-	clk_prepare_enable(arcpgu->clk);
-	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
-		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
-		      ARCPGU_CTRL_ENABLE_MASK);
-}
-
-static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
-{
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
-
-	clk_disable_unprepare(arcpgu->clk);
-	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
-			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
-			      ~ARCPGU_CTRL_ENABLE_MASK);
-}
-
-static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *state)
-{
-	struct arcpgu_drm_private *arcpgu;
-	struct drm_gem_cma_object *gem;
-
-	if (!pipe->plane.state->fb)
-		return;
-
-	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
-	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
-}
-
-static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
-	.update = arc_pgu_update,
-	.mode_valid = arc_pgu_mode_valid,
-	.enable	= arc_pgu_enable,
-	.disable = arc_pgu_disable,
-};
-
-int arc_pgu_setup_pipe(struct drm_device *drm)
-{
-	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-
-	return drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					    arc_pgu_supported_formats,
-					    ARRAY_SIZE(arc_pgu_supported_formats),
-					    NULL, NULL);
-}
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF957B303
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4970510EFE8;
	Wed, 20 Jul 2022 08:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678F810F188
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:31:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E63A31FE1F;
 Wed, 20 Jul 2022 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658305864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5b3nGZ8m03eiz93oE/FbbNt9aMKQGmdakSCX91+p+XM=;
 b=EAlQZ1Ch2pLJW2lbkecTb7uuY2KMmBwMw8ab8QUMwqTf0n1NhdRdADDp8+3jJM1/viwoRj
 7Eke7eQKfvdo4ffdVEpkiIvg3fbU1fihH1K8uvlZ5Xg+EsawAbnwc05fMHcawoF/xkImbr
 dncrxoAuEc08vn02fRKv6rEzHB2ipyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658305864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5b3nGZ8m03eiz93oE/FbbNt9aMKQGmdakSCX91+p+XM=;
 b=aZXpThNZaPn689WrmabyLwL20EgLldZsZXh9rNDpsAjDYdlNFFLhPwt1RE4Q1850hxtPNy
 EV8Nr6jqUjazw8CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC6ED13ABB;
 Wed, 20 Jul 2022 08:31:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WF9MKUi912IddAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 08:31:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, zackr@vmware.com,
 linux@armlinux.org.uk, stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH 4/7] drm: Remove unnecessary include statements of
 drm_plane_helper.h
Date: Wed, 20 Jul 2022 10:30:55 +0200
Message-Id: <20220720083058.15371-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720083058.15371-1-tzimmermann@suse.de>
References: <20220720083058.15371-1-tzimmermann@suse.de>
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
Cc: linux-graphics-maintainer@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the include statement for drm_plane_helper.h from all the files
that don't need it. Althogh the header file is almost empty, many drivers
include it somewhere.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          | 1 -
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c  | 1 -
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 1 -
 drivers/gpu/drm/arm/malidp_planes.c               | 1 -
 drivers/gpu/drm/armada/armada_crtc.c              | 1 -
 drivers/gpu/drm/armada/armada_overlay.c           | 1 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 1 -
 drivers/gpu/drm/drm_atomic_helper.c               | 1 -
 drivers/gpu/drm/drm_crtc_helper.c                 | 1 -
 drivers/gpu/drm/exynos/exynos_drm_plane.c         | 1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c       | 1 -
 drivers/gpu/drm/gma500/psb_intel_display.c        | 2 --
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c   | 1 -
 drivers/gpu/drm/i915/display/intel_atomic.c       | 1 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 1 -
 drivers/gpu/drm/i915/display/intel_crtc.c         | 1 -
 drivers/gpu/drm/i915/display/intel_display.c      | 1 -
 drivers/gpu/drm/i915/intel_pm.c                   | 1 -
 drivers/gpu/drm/imx/imx-drm-core.c                | 1 -
 drivers/gpu/drm/ingenic/ingenic-ipu.c             | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c           | 1 -
 drivers/gpu/drm/meson/meson_overlay.c             | 1 -
 drivers/gpu/drm/mgag200/mgag200_mode.c            | 1 -
 drivers/gpu/drm/msm/msm_drv.h                     | 1 -
 drivers/gpu/drm/nouveau/dispnv50/disp.c           | 1 -
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c       | 1 -
 drivers/gpu/drm/omapdrm/omap_crtc.c               | 1 -
 drivers/gpu/drm/omapdrm/omap_overlay.c            | 1 -
 drivers/gpu/drm/omapdrm/omap_plane.c              | 1 -
 drivers/gpu/drm/radeon/radeon_display.c           | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c            | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c             | 1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c      | 1 -
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c         | 1 -
 drivers/gpu/drm/sti/sti_crtc.c                    | 1 -
 drivers/gpu/drm/sti/sti_plane.h                   | 1 -
 drivers/gpu/drm/stm/ltdc.c                        | 1 -
 drivers/gpu/drm/sun4i/sun4i_backend.c             | 1 -
 drivers/gpu/drm/sun4i/sun4i_layer.c               | 1 -
 drivers/gpu/drm/sun4i/sun8i_mixer.c               | 1 -
 drivers/gpu/drm/tegra/dc.c                        | 1 -
 drivers/gpu/drm/tegra/plane.c                     | 1 -
 drivers/gpu/drm/tidss/tidss_crtc.c                | 1 -
 drivers/gpu/drm/tilcdc/tilcdc_plane.c             | 1 -
 drivers/gpu/drm/vc4/vc4_kms.c                     | 1 -
 drivers/gpu/drm/vc4/vc4_plane.c                   | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c               | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c              | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c              | 1 -
 49 files changed, 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index d788a00043a5..37322550d750 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -38,7 +38,6 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 59172acb9738..ea56d7fb1b0b 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -11,7 +11,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index dff22dec54b5..c20ff72f0ae5 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -7,7 +7,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 8a9562642d16..a1cee1a5b523 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -18,7 +18,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 
 #include "malidp_hw.h"
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index b7bb90ae787f..15dd667aa2e7 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -12,7 +12,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 424250535fed..1db77549189e 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -9,7 +9,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 2306ceb3e999..10f31faf140c 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -16,7 +16,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "atmel_hlcdc_dc.h"
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 8bf41aa24068..c6abfd3d4b62 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -38,7 +38,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 8a6d54515f92..457448cc60f7 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -45,7 +45,6 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 66e5f1e34044..7c3aa77186d3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -9,7 +9,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_crtc.h"
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 0cd527f0c146..e4f518e44945 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -14,7 +14,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 9a5ea06a1a8e..531c1781a8fb 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -9,8 +9,6 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 
-#include <drm/drm_plane_helper.h>
-
 #include "framebuffer.h"
 #include "gem.h"
 #include "gma_display.h"
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 61c29c2834e6..2c7059b775a1 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -28,7 +28,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 40da7910f845..b94973b5633f 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -32,7 +32,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index efe8591619e3..dd876dbbaa39 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -33,7 +33,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include "gt/intel_rps.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 4442aa355f86..6792a9056f46 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -9,7 +9,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank_work.h>
 
 #include "i915_irq.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a0f84cbe974f..bf170bd83ef7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -42,7 +42,6 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index f06babdb3a8c..ef7553b494ea 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -32,7 +32,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include "display/intel_atomic.h"
 #include "display/intel_atomic_plane.h"
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index a57812ec36b1..50fd7aac5198 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -22,7 +22,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index d13f58ad4769..c117073fd61e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -29,7 +29,6 @@
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_property.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 42cc7052b050..112615817dcb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -15,7 +15,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index b4a0518c1028..93c1cd2aab43 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -16,7 +16,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "meson_overlay.h"
 #include "meson_registers.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 225cca2ed60e..a02f599cb9cf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -20,7 +20,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b3689a2d27d7..7d5fb0fc22dd 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -27,7 +27,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/display/drm_dsc.h>
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index ade2988e85f3..b73fdfbe58ee 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -39,7 +39,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
index 37f6da8b3f2a..1a9a07c77da1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
@@ -23,7 +23,6 @@
 #include "atom.h"
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <nouveau_bo.h>
 
 #include <nvif/clc37e.h>
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 06a719c104f4..63ddc5127f7b 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -10,7 +10,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mode.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
index b0bc9ad2ef73..fb97c74386f2 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -6,7 +6,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index b6cb537f7689..24a2ded08b45 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -8,7 +8,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index f12675e3d261..ca5598ae8bfc 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -38,7 +38,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/radeon_drm.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index f361a604337f..227a9be30715 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -19,7 +19,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "rcar_cmm.h"
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index e778fd52f890..44ac95da9c13 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -17,7 +17,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/bitops.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e4631f515ba4..552426d5d3a2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -29,7 +29,6 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_flip_work.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 071a929e9fe3..387fbd2ab32d 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -16,7 +16,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 409795786f03..3c7154f2d5f3 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -11,7 +11,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/sti/sti_plane.h b/drivers/gpu/drm/sti/sti_plane.h
index 8e33e629d9b0..2c0156bede9c 100644
--- a/drivers/gpu/drm/sti/sti_plane.h
+++ b/drivers/gpu/drm/sti/sti_plane.h
@@ -8,7 +8,6 @@
 #define _STI_PLANE_H_
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
 
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index da7a0a183b27..8f3307b279e7 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -34,7 +34,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_of.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 287e8c4bbaea..0c69eab1fd37 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -23,7 +23,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_backend.h"
diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index 648dd0b5b116..98f3176366c0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -10,7 +10,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "sun4i_backend.h"
 #include "sun4i_frontend.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 648b38a73066..4e9bd9cb6b36 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -19,7 +19,6 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_drv.h"
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 747abafb6a5c..bd0f60704467 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -26,7 +26,6 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index ca9f03e3675b..10090116895f 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -12,7 +12,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "dc.h"
 #include "plane.h"
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 2218da3b3ca3..ad4ce9d06622 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -10,7 +10,6 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "tidss_crtc.h"
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index 960136518814..0ccf791301cb 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -5,7 +5,6 @@
  */
 
 #include <drm/drm_atomic.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index b45dcdfd7306..4419e810103d 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -18,7 +18,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 82a650268f19..243b29ab6f85 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -23,7 +23,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "uapi/drm/vc4_drm.h"
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index e4347faccee0..b8761f16dd78 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -28,7 +28,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "vmwgfx_kms.h"
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index b29e650d77f4..ecd3c2fc978b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -29,7 +29,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "vmwgfx_kms.h"
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index eb014b97d156..8650c3aea8f0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -29,7 +29,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "vmwgfx_kms.h"
-- 
2.36.1


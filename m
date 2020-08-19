Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C370F249C4C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106646E258;
	Wed, 19 Aug 2020 11:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543B76E22B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 317FC22BEA;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=wHvrnGSBf44aSfNbbWy1EhP6lE/jd7H3OnEElcdJj6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chRc1MjSdEc+pBFsBSFlt0c6LOTES8NiKSFRyTcQ3vTfF4kxIF6uH2O963ARyGhWH
 c+5u879UsDsC504iM2En/9cLVeWCVIlB/zVTxRxzR7sEF0ixOzfmca/j1KV5i8Eld0
 RDs7ydPcxDsbtzs54zm2GDCjA1tyZAZnNj6zHNhs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Euad-2q; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 17/49] staging: hikey9xx/gpu: change the includes to reflect
 upstream
Date: Wed, 19 Aug 2020 13:45:45 +0200
Message-Id: <c39d02b40d01b1c86156393a41dc37ca14616fec.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Liuyao An <anliuyao@huawei.com>,
 mauro.chehab@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The includes there reflect a downstream version back on v4.4
times. change them to reflect the current upstream and to
avoid the need of using a -I flag at the Makefile.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 ...{kirin9xx_dpe_reg.h => kirin960_dpe_reg.h} |  3 +++
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   |  3 +++
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.c     |  6 +++---
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.h     |  4 ++--
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.c   | 11 ++++++----
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.h   | 10 +++++-----
 .../staging/hikey9xx/gpu/kirin9xx_drm_dss.c   | 20 ++++++++++---------
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c | 15 +++++++-------
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        |  2 ++
 drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c   | 12 ++++++-----
 10 files changed, 51 insertions(+), 35 deletions(-)
 rename drivers/staging/hikey9xx/gpu/{kirin9xx_dpe_reg.h => kirin960_dpe_reg.h} (99%)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
similarity index 99%
rename from drivers/staging/hikey9xx/gpu/kirin9xx_dpe_reg.h
rename to drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
index 282ba9b55e43..995ab8f7c9f4 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
@@ -24,6 +24,9 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 
+#include <drm/drm_plane.h>
+#include <drm/drm_crtc.h>
+
 #include <linux/ion.h>
 #include <linux/hisi/hisi_ion.h>
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 59e43722de56..ece49b99dca7 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -24,6 +24,9 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 
+#include <drm/drm_plane.h>
+#include <drm/drm_crtc.h>
+
 #include <linux/ion.h>
 #include <linux/hisi/hisi_ion.h>
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
index fe8372838bb3..a15c335da026 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
@@ -10,10 +10,10 @@
  * GNU General Public License for more details.
  *
  */
-#include <drm/drmP.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_mipi_dsi.h>
 
-#include "drm_mipi_dsi.h"
-#include "kirin_drm_dpe_utils.h"
+#include "kirin9xx_drm_dpe_utils.h"
 
 int g_debug_set_reg_val = 0;
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
index 89aaf6691f1d..0c5681d0a5ac 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
@@ -17,9 +17,9 @@
 #if defined (CONFIG_DRM_HISI_KIRIN970)
 #include "kirin970_dpe_reg.h"
 #else
-#include "kirin_dpe_reg.h"
+#include "kirin960_dpe_reg.h"
 #endif
-#include "kirin_drm_drv.h"
+#include "kirin9xx_drm_drv.h"
 
 void set_reg(char __iomem *addr, uint32_t val, uint8_t bw, uint8_t bs);
 uint32_t set_bits32(uint32_t old_val, uint32_t val, uint8_t bw, uint8_t bs);
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
index f5b05b26bc18..616fa7ca9c77 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
@@ -18,13 +18,16 @@
 #include <linux/component.h>
 #include <linux/of_graph.h>
 
-#include <drm/drmP.h>
-#include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 
-#include "kirin_drm_drv.h"
+#include "kirin9xx_drm_drv.h"
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 static bool fbdev = true;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
index 18a7478fee10..15ef96840e9f 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
@@ -11,18 +11,18 @@
 #ifndef __KIRIN_DRM_DRV_H__
 #define __KIRIN_DRM_DRV_H__
 
-#include <drm/drmP.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_print.h>
+
 #include <linux/iommu.h>
 #include <linux/ion.h>
 #include <linux/hisi/hisi_ion.h>
 #include <linux/hisi/hisi-iommu.h>
 
-#include "drm_crtc.h"
-#include "drm_fb_helper.h"
-
 #define MAX_CRTC	2
 
-//#define CMA_BUFFER_USED
 #define to_kirin_fbdev(x) container_of(x, struct kirin_fbdev, fb_helper)
 
 /* display controller init/cleanup ops */
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index b4c1bb8288de..fd0ccbaebd3f 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -25,22 +25,24 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 
-#include <drm/drmP.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
-#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
-#include "kirin_drm_drv.h"
-
-#include "kirin_drm_dpe_utils.h"
+#include "kirin9xx_drm_drv.h"
+#include "kirin9xx_drm_dpe_utils.h"
 #if defined (CONFIG_DRM_HISI_KIRIN970)
 #include "kirin970_dpe_reg.h"
 #else
-#include "kirin_dpe_reg.h"
+#include "kirin960_dpe_reg.h"
 #endif
 
 //#define DSS_POWER_UP_ON_UEFI
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 342a7f6fc964..4e79f630de96 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -16,17 +16,18 @@
  *
  */
 
-#include <drm/drmP.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
-#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
 
-#include "kirin_drm_dpe_utils.h"
-#include "kirin_drm_drv.h"
+#include "kirin9xx_drm_dpe_utils.h"
+#include "kirin9xx_drm_drv.h"
 
 static int mid_array[DSS_CHN_MAX_DEFINE] = {0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0};
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index 4fef154cd701..21fddeaa3c66 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -28,6 +28,8 @@
 #include <drm/drm_encoder_slave.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
 
 #include "dw_dsi_reg.h"
 #if defined (CONFIG_HISI_FB_970)
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
index 3d25c48f0769..bb540f5d77a6 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
@@ -10,18 +10,20 @@
 * GNU General Public License for more details.
 *
 */
-#include <drm/drmP.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_mipi_dsi.h>
+
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>
 
-#include "drm_mipi_dsi.h"
-#include "kirin_drm_dpe_utils.h"
-#include "kirin_fb_panel.h"
-#include "dw_dsi_reg.h"
+#include "kirin9xx_drm_dpe_utils.h"
+#include "kirin9xx_fb_panel.h"
+#include "kirin9xx_dw_dsi_reg.h"
 
 /* default pwm clk */
 #define DEFAULT_PWM_CLK_RATE	(80 * 1000000L)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

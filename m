Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70727E2F3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B99D6E17F;
	Wed, 30 Sep 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E296E52F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 07:15:52 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 68972A24CC4299B2C2EB;
 Wed, 30 Sep 2020 15:15:49 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 30 Sep 2020 15:15:38 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon 1/2] drm/hisilicon: Use the same style of
 variable type in hibmc_drm_de
Date: Wed, 30 Sep 2020 15:13:07 +0800
Message-ID: <1601449988-41463-2-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601449988-41463-1-git-send-email-tiantao6@hisilicon.com>
References: <1601449988-41463-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consistently Use the same style of variable type in hibmc_drm_de.c.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 59 +++++++++++++-------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index a3a9e0a..c54f93d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -23,15 +23,15 @@
 #include "hibmc_drm_regs.h"
 
 struct hibmc_display_panel_pll {
-	unsigned long M;
-	unsigned long N;
-	unsigned long OD;
-	unsigned long POD;
+	u64 M;
+	u64 N;
+	u64 OD;
+	u64 POD;
 };
 
 struct hibmc_dislay_pll_config {
-	unsigned long hdisplay;
-	unsigned long vdisplay;
+	u64 hdisplay;
+	u64 vdisplay;
 	u32 pll1_config_value;
 	u32 pll2_config_value;
 };
@@ -102,7 +102,7 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state	*state	= plane->state;
 	u32 reg;
 	s64 gpu_addr = 0;
-	unsigned int line_l;
+	u32 line_l;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(plane->dev);
 	struct drm_gem_vram_object *gbo;
 
@@ -155,10 +155,10 @@ static const struct drm_plane_helper_funcs hibmc_plane_helper_funcs = {
 	.atomic_update = hibmc_plane_atomic_update,
 };
 
-static void hibmc_crtc_dpms(struct drm_crtc *crtc, int dpms)
+static void hibmc_crtc_dpms(struct drm_crtc *crtc, u32 dpms)
 {
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
-	unsigned int reg;
+	u32 reg;
 
 	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
 	reg &= ~HIBMC_CRT_DISP_CTL_DPMS_MASK;
@@ -172,7 +172,7 @@ static void hibmc_crtc_dpms(struct drm_crtc *crtc, int dpms)
 static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
-	unsigned int reg;
+	u32 reg;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
@@ -191,7 +191,7 @@ static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,
 static void hibmc_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_crtc_state *old_state)
 {
-	unsigned int reg;
+	u32 reg;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 
 	hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_OFF);
@@ -212,7 +212,7 @@ static enum drm_mode_status
 hibmc_crtc_mode_valid(struct drm_crtc *crtc,
 		      const struct drm_display_mode *mode)
 {
-	int i = 0;
+	u32 i = 0;
 	int vrefresh = drm_mode_vrefresh(mode);
 
 	if (vrefresh < 59 || vrefresh > 61)
@@ -227,9 +227,9 @@ hibmc_crtc_mode_valid(struct drm_crtc *crtc,
 	return MODE_BAD;
 }
 
-static unsigned int format_pll_reg(void)
+static u32 format_pll_reg(void)
 {
-	unsigned int pllreg = 0;
+	u32 pllreg = 0;
 	struct hibmc_display_panel_pll pll = {0};
 
 	/*
@@ -249,7 +249,7 @@ static unsigned int format_pll_reg(void)
 	return pllreg;
 }
 
-static void set_vclock_hisilicon(struct drm_device *dev, unsigned long pll)
+static void set_vclock_hisilicon(struct drm_device *dev, u64 pll)
 {
 	u32 val;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
@@ -279,11 +279,10 @@ static void set_vclock_hisilicon(struct drm_device *dev, unsigned long pll)
 	writel(val, priv->mmio + CRT_PLL1_HS);
 }
 
-static void get_pll_config(unsigned long x, unsigned long y,
-			   u32 *pll1, u32 *pll2)
+static void get_pll_config(u64 x, u64 y, u32 *pll1, u32 *pll2)
 {
-	int i;
-	int count = ARRAY_SIZE(hibmc_pll_table);
+	u32 i;
+	u32 count = ARRAY_SIZE(hibmc_pll_table);
 
 	for (i = 0; i < count; i++) {
 		if (hibmc_pll_table[i].hdisplay == x &&
@@ -306,11 +305,11 @@ static void get_pll_config(unsigned long x, unsigned long y,
  * FPGA only supports 7 predefined pixel clocks, and clock select is
  * in bit 4:0 of new register 0x802a8.
  */
-static unsigned int display_ctrl_adjust(struct drm_device *dev,
-					struct drm_display_mode *mode,
-					unsigned int ctrl)
+static u32 display_ctrl_adjust(struct drm_device *dev,
+			       struct drm_display_mode *mode,
+			       u32 ctrl)
 {
-	unsigned long x, y;
+	u64 x, y;
 	u32 pll1; /* bit[31:0] of PLL */
 	u32 pll2; /* bit[63:32] of PLL */
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
@@ -358,12 +357,12 @@ static unsigned int display_ctrl_adjust(struct drm_device *dev,
 
 static void hibmc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	unsigned int val;
+	u32 val;
 	struct drm_display_mode *mode = &crtc->state->mode;
 	struct drm_device *dev = crtc->dev;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
-	int width = mode->hsync_end - mode->hsync_start;
-	int height = mode->vsync_end - mode->vsync_start;
+	u32 width = mode->hsync_end - mode->hsync_start;
+	u32 height = mode->vsync_end - mode->vsync_start;
 
 	writel(format_pll_reg(), priv->mmio + HIBMC_CRT_PLL_CTRL);
 	writel(HIBMC_FIELD(HIBMC_CRT_HORZ_TOTAL_TOTAL, mode->htotal - 1) |
@@ -393,7 +392,7 @@ static void hibmc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 static void hibmc_crtc_atomic_begin(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_state)
 {
-	unsigned int reg;
+	u32 reg;
 	struct drm_device *dev = crtc->dev;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
@@ -446,15 +445,15 @@ static void hibmc_crtc_load_lut(struct drm_crtc *crtc)
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
 	void __iomem   *mmio = priv->mmio;
 	u16 *r, *g, *b;
-	unsigned int reg;
-	int i;
+	u32 reg;
+	u32 i;
 
 	r = crtc->gamma_store;
 	g = r + crtc->gamma_size;
 	b = g + crtc->gamma_size;
 
 	for (i = 0; i < crtc->gamma_size; i++) {
-		unsigned int offset = i << 2;
+		u32 offset = i << 2;
 		u8 red = *r++ >> 8;
 		u8 green = *g++ >> 8;
 		u8 blue = *b++ >> 8;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

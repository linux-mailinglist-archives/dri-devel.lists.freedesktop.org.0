Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E51AE19A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E306E03A;
	Fri, 17 Apr 2020 15:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A716E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:56:44 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MLA6m-1jhYSy1x5e-00IH6g; Fri, 17 Apr 2020 17:56:22 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 1/8] fbdev: w100fb: clean up mach-pxa compile-time dependency
Date: Fri, 17 Apr 2020 17:55:46 +0200
Message-Id: <20200417155553.675905-2-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FSyLS2kD2Du4FJkr2PSO5IkSDJpM+w9TppbZSoEDwbAnlGno6cr
 YdxN/mZKd7kefnolwRhTPLde2WQ0EoCyTZCr7cOP1aeyIqV6Ol3kYdvRjUPrKM2Jh5F0IRh
 ikgcv4BOa4yHk3Q+8fTNKD0mrjUithBTDu+WQ5rtMVaA73zed4VfhnY36WE16r6Zo7h3JvL
 9yF1U57DofTc9Sr1hFqIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ogNLYWrB+oo=:z0WSPEoafwNG2cLJOcdNRg
 4iuJlVK2HhjWe+k8SExSQv4hsI8qssLLJO/lQyDXGMmprFboPKV7ZvEr44vsBg3qBx+F57F4/
 xZRdCz8EGtQtyQiyazkUoV81uxF8VilRNT6zvxpyOCoqyd9RCIhcjxsrB2O85/i3Iqt7v3MPu
 U3j4KkNT2QmtJP1zi9HN2R7dAQYcF/itwCf9rUvsjOQhtQYsVHCEOTFRcPn4Q9fSnW4YB/a3v
 1Cqg6gPD6xwkWYJfieB0Jh+Mnw3tSRFHQWp2HtjrXUqgpiv6v01i6OTxYC0Z2gAhbq6iBlYCE
 cDBH0vL3yX36Ddt7fq7cS9LYNIvrXFR4QgAPcrlC/TtgsIpo5vmgQMKIKFt0h7+I3Bn1u/YLH
 XGHBSvzAQ6+laXUzZgX3s4saVzy058/6DYJH9j0QNzHON/xpecaWH1wLSrgOYg8MY8gftZEc0
 iC4h5RvSmDSximaq0Iumb2r5Ku482IMGcZhly4jD/dXe/2+iXXzvMjenvHix9RSRnOVV4Ldrs
 JsE66YZUYg8cX8K9oP8nZvQa7DaiAbGMFamLpwTKfpEJf713q9ZGz/P1fgDqrBhFvg54jVG0A
 62hBGnK1yBGcRKyXCuGsBmoMuK/n0fCXi7VCQrY+rb5xc0XZZgrD9RUcIZYP8zIsxkQU2mXlo
 JFuVqlbSKfn409OIadBpGveT/hItNOcLrxAdJiEkQqra1TehL0FWtFZAwYIucWRHmZM+MA0CM
 3XxpyfrrKJq578U7kun86fNmz9L0DyWXOvVT5IWyIR9LLOTDBhb/sLiZ0V0tkOnR9idzCSUIs
 90N1+uN6aSeaxQxLMKgomeVW8uSXrq0bp376Jo5Tda/1sY6Ip0=
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
Cc: marex@denx.de, dsd@laptop.org, Arnd Bergmann <arnd@arndb.de>,
 Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, masahiroy@kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Saeed Mahameed <saeedm@mellanox.com>,
 thellstrom@vmware.com, haojian.zhuang@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 kieran.bingham+renesas@ideasonboard.com, linux-graphics-maintainer@vmware.com,
 Laurent.pinchart@ideasonboard.com, jfrederich@gmail.com,
 robert.jarzmik@free.fr, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to get rid of the 'select FB' line in Kconfig for all platforms,
change the w100fb driver to handle the gpio lines itself rather than
using an indirect function call.

This also allows removing the remaining exported interfaces from the
driver, the only other symbol has been unused for a long time.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/pxa_defconfig |  2 +
 arch/arm/mach-pxa/Kconfig      |  3 --
 arch/arm/mach-pxa/eseries.c    | 14 +-----
 drivers/video/fbdev/w100fb.c   | 84 +++++-----------------------------
 include/video/w100fb.h         |  6 +--
 5 files changed, 16 insertions(+), 93 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index b817c57f05f1..8df88e8a3048 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -454,6 +454,8 @@ CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_SOC_CAMERA_MT9M111=m
 CONFIG_DRM=m
 CONFIG_FIRMWARE_EDID=y
+CONFIG_FB=y
+CONFIG_FB_W100=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_PXA_OVERLAY=y
 CONFIG_FB_PXA_PARAMETERS=y
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index f60bc29aef68..8444d40df1b3 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -549,9 +549,6 @@ config MACH_ICONTROL
 
 config ARCH_PXA_ESERIES
 	bool "PXA based Toshiba e-series PDAs"
-	select FB_W100
-	select FB
-	select PXA25x
 
 config MACH_E330
 	bool "Toshiba e330"
diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
index f37c44b6139d..023ee901a7eb 100644
--- a/arch/arm/mach-pxa/eseries.c
+++ b/arch/arm/mach-pxa/eseries.c
@@ -849,20 +849,8 @@ static struct w100_mem_info e800_w100_mem_info = {
 	.size            = 0x1fffff,
 };
 
-static void e800_tg_change(struct w100fb_par *par)
-{
-	unsigned long tmp;
-
-	tmp = w100fb_gpio_read(W100_GPIO_PORT_A);
-	if (par->mode->xres == 480)
-		tmp |= 0x100;
-	else
-		tmp &= ~0x100;
-	w100fb_gpio_write(W100_GPIO_PORT_A, tmp);
-}
-
 static struct w100_tg_info e800_tg_info = {
-	.change = e800_tg_change,
+	.change_e800 = true,
 };
 
 static struct w100fb_mach_info e800_fb_info = {
diff --git a/drivers/video/fbdev/w100fb.c b/drivers/video/fbdev/w100fb.c
index 2d6e2738b792..512c4d5a73a3 100644
--- a/drivers/video/fbdev/w100fb.c
+++ b/drivers/video/fbdev/w100fb.c
@@ -48,7 +48,6 @@ static void w100_init_lcd(struct w100fb_par*);
 static void w100_set_dispregs(struct w100fb_par*);
 static void w100_update_enable(void);
 static void w100_update_disable(void);
-static void calc_hsync(struct w100fb_par *par);
 static void w100_init_graphic_engine(struct w100fb_par *par);
 struct w100_pll_info *w100_get_xtal_table(unsigned int freq);
 
@@ -101,8 +100,6 @@ static ssize_t flip_store(struct device *dev, struct device_attribute *attr, con
 	w100_set_dispregs(par);
 	w100_update_enable();
 
-	calc_hsync(par);
-
 	return count;
 }
 
@@ -157,7 +154,6 @@ static ssize_t fastpllclk_store(struct device *dev, struct device_attribute *att
 	}
 
 	w100_init_clocks(par);
-	calc_hsync(par);
 
 	return count;
 }
@@ -173,23 +169,6 @@ static struct attribute *w100fb_attrs[] = {
 };
 ATTRIBUTE_GROUPS(w100fb);
 
-/*
- * Some touchscreens need hsync information from the video driver to
- * function correctly. We export it here.
- */
-unsigned long w100fb_get_hsynclen(struct device *dev)
-{
-	struct fb_info *info = dev_get_drvdata(dev);
-	struct w100fb_par *par=info->par;
-
-	/* If display is blanked/suspended, hsync isn't active */
-	if (par->blanked)
-		return 0;
-	else
-		return par->hsync_len;
-}
-EXPORT_SYMBOL(w100fb_get_hsynclen);
-
 static void w100fb_clear_screen(struct w100fb_par *par)
 {
 	memset_io(remapped_fbuf + (W100_FB_BASE-MEM_WINDOW_BASE), 0, (par->xres * par->yres * BITS_PER_PIXEL/8));
@@ -405,6 +384,15 @@ static void w100fb_copyarea(struct fb_info *info,
 	writel((w << 16) | (h & 0xffff), remapped_regs + mmDST_WIDTH_HEIGHT);
 }
 
+static void w100fb_e800_tg_change(struct w100fb_par *par)
+{
+	u32 tmp = readl(remapped_regs + mmGPIO_DATA);
+	if (par->mode->xres == 480)
+		tmp |= 0x100;
+	else
+		tmp &= ~0x100;
+	writel(tmp, remapped_regs + mmGPIO_DATA);
+}
 
 /*
  *  Change the resolution by calling the appropriate hardware functions
@@ -425,10 +413,9 @@ static void w100fb_activate_var(struct w100fb_par *par)
 	w100_update_enable();
 	w100_init_graphic_engine(par);
 
-	calc_hsync(par);
-
-	if (!par->blanked && tg && tg->change)
-		tg->change(par);
+	if (IS_ENABLED(CONFIG_ARCH_PXA_ESERIES) &&
+	    !par->blanked && tg && tg->change_e800)
+		w100fb_e800_tg_change(par);
 }
 
 
@@ -837,28 +824,6 @@ static void w100_update_enable(void)
 	writel((u32) (disp_db_buf_wr_cntl.val), remapped_regs + mmDISP_DB_BUF_CNTL);
 }
 
-unsigned long w100fb_gpio_read(int port)
-{
-	unsigned long value;
-
-	if (port==W100_GPIO_PORT_A)
-		value = readl(remapped_regs + mmGPIO_DATA);
-	else
-		value = readl(remapped_regs + mmGPIO_DATA2);
-
-	return value;
-}
-
-void w100fb_gpio_write(int port, unsigned long value)
-{
-	if (port==W100_GPIO_PORT_A)
-		writel(value, remapped_regs + mmGPIO_DATA);
-	else
-		writel(value, remapped_regs + mmGPIO_DATA2);
-}
-EXPORT_SYMBOL(w100fb_gpio_read);
-EXPORT_SYMBOL(w100fb_gpio_write);
-
 /*
  * Initialization of critical w100 hardware
  */
@@ -1497,31 +1462,6 @@ static void w100_set_dispregs(struct w100fb_par *par)
 	writel((par->xres*BITS_PER_PIXEL/8), remapped_regs + mmGRAPHIC_PITCH);
 }
 
-
-/*
- * Work out how long the sync pulse lasts
- * Value is 1/(time in seconds)
- */
-static void calc_hsync(struct w100fb_par *par)
-{
-	unsigned long hsync;
-	struct w100_mode *mode = par->mode;
-	union crtc_ss_u crtc_ss;
-
-	if (mode->pixclk_src == CLK_SRC_XTAL)
-		hsync=par->mach->xtal_freq;
-	else
-		hsync=((par->fastpll_mode && mode->fast_pll_freq) ? mode->fast_pll_freq : mode->pll_freq)*100000;
-
-	hsync /= (w100_pwr_state.pclk_cntl.f.pclk_post_div + 1);
-
-	crtc_ss.val = readl(remapped_regs + mmCRTC_SS);
-	if (crtc_ss.val)
-		par->hsync_len = hsync / (crtc_ss.f.ss_end-crtc_ss.f.ss_start);
-	else
-		par->hsync_len = 0;
-}
-
 static void w100_suspend(u32 mode)
 {
 	u32 val;
diff --git a/include/video/w100fb.h b/include/video/w100fb.h
index a614654d8598..8f260ba4fcac 100644
--- a/include/video/w100fb.h
+++ b/include/video/w100fb.h
@@ -14,13 +14,9 @@
 
 struct w100fb_par;
 
-unsigned long w100fb_gpio_read(int port);
-void w100fb_gpio_write(int port, unsigned long value);
-unsigned long w100fb_get_hsynclen(struct device *dev);
-
 /* LCD Specific Routines and Config */
 struct w100_tg_info {
-	void (*change)(struct w100fb_par*);
+	bool change_e800;
 	void (*suspend)(struct w100fb_par*);
 	void (*resume)(struct w100fb_par*);
 };
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

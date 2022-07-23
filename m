Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D412557F0D2
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 19:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB326A7B7B;
	Sat, 23 Jul 2022 17:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A838A7B7B
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 17:57:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNq-0007TY-NT; Sat, 23 Jul 2022 19:57:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNo-002l3m-LB; Sat, 23 Jul 2022 19:57:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFJNn-00736y-FD; Sat, 23 Jul 2022 19:57:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 1/4] video: fb: imxfb: Drop platform data support
Date: Sat, 23 Jul 2022 19:57:17 +0200
Message-Id: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6660; h=from:subject;
 bh=y89wE7182nnsNf8FmAenMhLhHybFXcToTl7us5lNukY=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMSTdMcuLjXbLuqlU5rggvf+zdJrix7nr1n/3N9R567RVWpnh
 yXzhTkZjFgZGLgZZMUWWuiItsQkSa/7blSzhhhnEygQyhYGLUwAmEh3LwbDgQ/EeiTWc88NUs4Uyrs
 pmqMoutdd11e0zUTtoPz3VZVv11Fhvzta5S2613CreZqcTXO//SppTVn9ypjvTPHuz7wETO8XPKdum
 r2yoTm1Ydt5msRPHHaUT3ie2n9mmf8v0yBmFJ3de+h9Se1u+yP1wXH329je3Qxt3NaXvWKQuwier4D
 rv7NpvaQXWT2Na2fyfvLNQeKbaXFopJjz1ndcttYKbJqv+XJTfmDq1wbHy0DP1I05P1R4fFFwU6LGu
 /rtgmrtNuL4F91fZqLtbO7/1rVf1srgTsqvR5n75wwviFj9y09e4LdWJeHXp7dxls0KCdXdqfdLb96
 mrX3exoENsVal+XLLn/786TAU2AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No source file but the driver itself includes the header containing the
platform data definition. The last user is gone since commit
8485adf17a15 ("ARM: imx: Remove imx device directory").

So we can safely drop platform data support.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/imxfb.c               | 99 ++++++++---------------
 include/linux/platform_data/video-imxfb.h | 12 ---
 2 files changed, 34 insertions(+), 77 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index a2f644c97f28..85a5bf5639d9 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -656,7 +656,6 @@ static int imxfb_activate_var(struct fb_var_screeninfo *var, struct fb_info *inf
 
 static int imxfb_init_fbinfo(struct platform_device *pdev)
 {
-	struct imx_fb_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct fb_info *info = platform_get_drvdata(pdev);
 	struct imxfb_info *fbi = info->par;
 	struct device_node *np;
@@ -690,25 +689,20 @@ static int imxfb_init_fbinfo(struct platform_device *pdev)
 	info->fbops			= &imxfb_ops;
 	info->flags			= FBINFO_FLAG_DEFAULT |
 					  FBINFO_READS_FAST;
-	if (pdata) {
-		fbi->lscr1			= pdata->lscr1;
-		fbi->dmacr			= pdata->dmacr;
-		fbi->pwmr			= pdata->pwmr;
-	} else {
-		np = pdev->dev.of_node;
-		info->var.grayscale = of_property_read_bool(np,
-						"cmap-greyscale");
-		fbi->cmap_inverse = of_property_read_bool(np, "cmap-inverse");
-		fbi->cmap_static = of_property_read_bool(np, "cmap-static");
 
-		fbi->lscr1 = IMXFB_LSCR1_DEFAULT;
+	np = pdev->dev.of_node;
+	info->var.grayscale = of_property_read_bool(np,
+					"cmap-greyscale");
+	fbi->cmap_inverse = of_property_read_bool(np, "cmap-inverse");
+	fbi->cmap_static = of_property_read_bool(np, "cmap-static");
 
-		of_property_read_u32(np, "fsl,lpccr", &fbi->pwmr);
+	fbi->lscr1 = IMXFB_LSCR1_DEFAULT;
 
-		of_property_read_u32(np, "fsl,lscr1", &fbi->lscr1);
+	of_property_read_u32(np, "fsl,lpccr", &fbi->pwmr);
 
-		of_property_read_u32(np, "fsl,dmacr", &fbi->dmacr);
-	}
+	of_property_read_u32(np, "fsl,lscr1", &fbi->lscr1);
+
+	of_property_read_u32(np, "fsl,dmacr", &fbi->dmacr);
 
 	return 0;
 }
@@ -863,10 +857,10 @@ static int imxfb_probe(struct platform_device *pdev)
 	struct imxfb_info *fbi;
 	struct lcd_device *lcd;
 	struct fb_info *info;
-	struct imx_fb_platform_data *pdata;
 	struct resource *res;
 	struct imx_fb_videomode *m;
 	const struct of_device_id *of_id;
+	struct device_node *display_np;
 	int ret, i;
 	int bytes_per_pixel;
 
@@ -884,8 +878,6 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (!res)
 		return -ENODEV;
 
-	pdata = dev_get_platdata(&pdev->dev);
-
 	info = framebuffer_alloc(sizeof(struct imxfb_info), &pdev->dev);
 	if (!info)
 		return -ENOMEM;
@@ -898,43 +890,34 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto failed_init;
 
-	if (pdata) {
-		if (!fb_mode)
-			fb_mode = pdata->mode[0].mode.name;
-
-		fbi->mode = pdata->mode;
-		fbi->num_modes = pdata->num_modes;
-	} else {
-		struct device_node *display_np;
-		fb_mode = NULL;
-
-		display_np = of_parse_phandle(pdev->dev.of_node, "display", 0);
-		if (!display_np) {
-			dev_err(&pdev->dev, "No display defined in devicetree\n");
-			ret = -EINVAL;
-			goto failed_of_parse;
-		}
+	fb_mode = NULL;
 
-		/*
-		 * imxfb does not support more modes, we choose only the native
-		 * mode.
-		 */
-		fbi->num_modes = 1;
-
-		fbi->mode = devm_kzalloc(&pdev->dev,
-				sizeof(struct imx_fb_videomode), GFP_KERNEL);
-		if (!fbi->mode) {
-			ret = -ENOMEM;
-			of_node_put(display_np);
-			goto failed_of_parse;
-		}
+	display_np = of_parse_phandle(pdev->dev.of_node, "display", 0);
+	if (!display_np) {
+		dev_err(&pdev->dev, "No display defined in devicetree\n");
+		ret = -EINVAL;
+		goto failed_of_parse;
+	}
 
-		ret = imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
+	/*
+	 * imxfb does not support more modes, we choose only the native
+	 * mode.
+	 */
+	fbi->num_modes = 1;
+
+	fbi->mode = devm_kzalloc(&pdev->dev,
+			sizeof(struct imx_fb_videomode), GFP_KERNEL);
+	if (!fbi->mode) {
+		ret = -ENOMEM;
 		of_node_put(display_np);
-		if (ret)
-			goto failed_of_parse;
+		goto failed_of_parse;
 	}
 
+	ret = imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
+	of_node_put(display_np);
+	if (ret)
+		goto failed_of_parse;
+
 	/* Calculate maximum bytes used per pixel. In most cases this should
 	 * be the same as m->bpp/8 */
 	m = &fbi->mode[0];
@@ -1001,13 +984,6 @@ static int imxfb_probe(struct platform_device *pdev)
 
 	info->fix.smem_start = fbi->map_dma;
 
-	if (pdata && pdata->init) {
-		ret = pdata->init(fbi->pdev);
-		if (ret)
-			goto failed_platform_init;
-	}
-
-
 	INIT_LIST_HEAD(&info->modelist);
 	for (i = 0; i < fbi->num_modes; i++)
 		fb_add_videomode(&fbi->mode[i].mode, &info->modelist);
@@ -1059,9 +1035,6 @@ static int imxfb_probe(struct platform_device *pdev)
 failed_register:
 	fb_dealloc_cmap(&info->cmap);
 failed_cmap:
-	if (pdata && pdata->exit)
-		pdata->exit(fbi->pdev);
-failed_platform_init:
 	dma_free_wc(&pdev->dev, fbi->map_size, info->screen_buffer,
 		    fbi->map_dma);
 failed_map:
@@ -1079,7 +1052,6 @@ static int imxfb_probe(struct platform_device *pdev)
 
 static int imxfb_remove(struct platform_device *pdev)
 {
-	struct imx_fb_platform_data *pdata;
 	struct fb_info *info = platform_get_drvdata(pdev);
 	struct imxfb_info *fbi = info->par;
 	struct resource *res;
@@ -1092,9 +1064,6 @@ static int imxfb_remove(struct platform_device *pdev)
 
 	unregister_framebuffer(info);
 	fb_dealloc_cmap(&info->cmap);
-	pdata = dev_get_platdata(&pdev->dev);
-	if (pdata && pdata->exit)
-		pdata->exit(fbi->pdev);
 	dma_free_wc(&pdev->dev, fbi->map_size, info->screen_buffer,
 		    fbi->map_dma);
 	iounmap(fbi->regs);
diff --git a/include/linux/platform_data/video-imxfb.h b/include/linux/platform_data/video-imxfb.h
index 02812651af7d..b80a156a6617 100644
--- a/include/linux/platform_data/video-imxfb.h
+++ b/include/linux/platform_data/video-imxfb.h
@@ -55,16 +55,4 @@ struct imx_fb_videomode {
 	unsigned char	bpp;
 };
 
-struct imx_fb_platform_data {
-	struct imx_fb_videomode *mode;
-	int		num_modes;
-
-	u_int		pwmr;
-	u_int		lscr1;
-	u_int		dmacr;
-
-	int (*init)(struct platform_device *);
-	void (*exit)(struct platform_device *);
-};
-
 #endif /* ifndef __MACH_IMXFB_H__ */

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1


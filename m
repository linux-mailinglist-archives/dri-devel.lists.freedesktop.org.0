Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDE41911A1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 14:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ED36E491;
	Tue, 24 Mar 2020 13:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE206E48D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200324134520euoutp01957bfa9257d7f4689c44f38bd408799b~-QWrBw7Ra0072900729euoutp01p
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200324134520euoutp01957bfa9257d7f4689c44f38bd408799b~-QWrBw7Ra0072900729euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585057520;
 bh=YpuSFFNTd09+x2wYLvuiiWZ9nAKKYzilhyZjtSoZBG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O7+oeOkmK1XV6nnzGiE3QqWUQ6D3qDd7YT9GTj/NSsnV1Y1GCIkgSij8MJxc984cz
 1mVHAroxVVYK3+KNt63mJ3aCGTVS9mZdsqqgyImCugJh/4+Xlbpf3w2y5xMQNMovzo
 ZcWWe4wdINQ4YeMTztynWjj8zBJUtowvE8IdYJe4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200324134520eucas1p1641d6cc7bf9958c250b74f1c34a6b028~-QWqw8qst1323313233eucas1p1a;
 Tue, 24 Mar 2020 13:45:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 05.05.61286.0FE0A7E5; Tue, 24
 Mar 2020 13:45:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200324134519eucas1p24bc9d0be4182b2f0046c002920bf7cc3~-QWqYhydm0464404644eucas1p20;
 Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200324134519eusmtrp1cbc95761c80a1be4ee5239a3b4f5f7cb~-QWqX8xfY2619426194eusmtrp1y;
 Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-4d-5e7a0ef0c48a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AA.56.07950.FEE0A7E5; Tue, 24
 Mar 2020 13:45:19 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200324134519eusmtip245b355f16b1b671a6192b6108133df4f~-QWqEQsVH3226032260eusmtip20;
 Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] video: fbdev: controlfb: remove function prototypes
 part #2
Date: Tue, 24 Mar 2020 14:45:07 +0100
Message-Id: <20200324134508.25120-6-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200324134508.25120-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7of+KriDPacFbK4te4cq8XGGetZ
 La58fc9mcaLvA6vF5V1z2CxW/NzK6MDmcb/7OJPHkmlX2Tz6tqxi9Pi8SS6AJYrLJiU1J7Ms
 tUjfLoEro3HZPbaCyRkVC995NzDuC+5i5OSQEDCR2H/zLFsXIxeHkMAKRonzG98yQjhfGCXW
 TfsMlfnMKDH57hdWmJb3j68xQySWM0pca33DBpIAa5k92QTEZhOwkpjYvooRxBYRSJBYMX0G
 mM0skCLxYct/JhBbWCBU4sKbBrBeFgFViUtr+8BsXgFbiRUfz7BBLJOX2PrtE9hiTgE7id5p
 h5ghagQlTs58wgIxU16ieetssIMkBJrZJXq7O6GaXSTON5yHsoUlXh3fwg5hy0icntzDAtGw
 jlHib8cLqO7tjBLLJ/+D6rCWuHPuF5DNAbRCU2L9Ln2IsKPE3ucnWEDCEgJ8EjfeCkIcwScx
 adt0Zogwr0RHmxBEtZrEhmUb2GDWdu1cyQxhe0hsf9DBNIFRcRaSd2YheWcWwt4FjMyrGMVT
 S4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAtPK6X/HP+1g/Hop6RCjAAejEg+vxsPKOCHWxLLi
 ytxDjBIczEoivJtTK+KEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoE
 k2Xi4JRqYOR+915DXars5BzrQhf9IPvESnF2j7tz0ktVP4ib1K57Ktqjm1fPXG66Nf7Y/ttX
 8hd+F2mZupqVdZ1Y27wF1W8MhZ5d/tXqO5dFRk3UYeaRJBnFjTudg4S57JO42uM2JlxQyp8w
 g7Pg/7d2jujbglZ894y0pDpsP1encRuevuoqZcOl9DVUiaU4I9FQi7moOBEAXFCUiCcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42I5/e/4Pd33fFVxBjfemFvcWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bBYrfm5ldGDzuN99nMljybSrbB59W1YxenzeJBfAEqVnU5RfWpKq
 kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX0bjsHlvB5IyKhe+8
 Gxj3BXcxcnJICJhIvH98jbmLkYtDSGApo0TziUuMXYwcQAkZiePryyBqhCX+XOtig6j5xCjx
 v+E4I0iCTcBKYmL7KjBbRCBJorPhJDOIzSyQJjHp7F0mEFtYIFjiyNIGVhCbRUBV4tLaPjYQ
 m1fAVmLFxzNsEAvkJbZ++wRWwylgJ9E77RDYHCGgmnfrIXbxCghKnJz5hAVivrxE89bZzBMY
 BWYhSc1CklrAyLSKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMPi3Hfu5ZQdj17vgQ4wCHIxK
 PLwaDyvjhFgTy4orcw8xSnAwK4nwbk6tiBPiTUmsrEotyo8vKs1JLT7EaAr0xERmKdHkfGBk
 5pXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYNxRtTIq8vwGyS8C
 s85dYXM7fXHpw7bCIw+WmJ0WqdOeXqDyYdH7vxqJp79N279+Zd+72sJ0u7iytdkHptk/MQ/d
 c3H3/lv+J9R1Tl8p+vfwrMOdU90SNSqikrPC63LeHPPjMvk4R93Z7qXo/CP7UlO/vXyQ2RPM
 w9j79cN8nSU8neIThYOul61XYinOSDTUYi4qTgQAH32bmZQCAAA=
X-CMS-MailID: 20200324134519eucas1p24bc9d0be4182b2f0046c002920bf7cc3
X-Msg-Generator: CA
X-RootMTR: 20200324134519eucas1p24bc9d0be4182b2f0046c002920bf7cc3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324134519eucas1p24bc9d0be4182b2f0046c002920bf7cc3
References: <20200324134508.25120-1-b.zolnierkie@samsung.com>
 <CGME20200324134519eucas1p24bc9d0be4182b2f0046c002920bf7cc3@eucas1p2.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorder code a bit and then remove no longer needed function
prototypes.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/controlfb.c | 410 +++++++++++++++-----------------
 1 file changed, 198 insertions(+), 212 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 83b7a219f557..c67d37103705 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -143,20 +143,12 @@ struct fb_info_control {
 
 /******************** Prototypes for internal functions **********************/
 
-static void set_control_clock(unsigned char *params);
-static int init_control(struct fb_info_control *p);
 static void control_set_hardware(struct fb_info_control *p,
 	struct fb_par_control *par);
-static int control_of_init(struct device_node *dp);
-static void find_vram_size(struct fb_info_control *p);
-static int read_control_sense(struct fb_info_control *p);
-static int calc_clock_params(unsigned long clk, unsigned char *param);
 static int control_var_to_par(struct fb_var_screeninfo *var,
 	struct fb_par_control *par, const struct fb_info *fb_info);
 static inline void control_par_to_var(struct fb_par_control *par,
 	struct fb_var_screeninfo *var);
-static void control_init_info(struct fb_info *info, struct fb_info_control *p);
-static void control_cleanup(void);
 
 
 /************************** Internal variables *******************************/
@@ -370,77 +362,6 @@ static void set_control_clock(unsigned char *params)
 #endif	
 }
 
-
-/*
- * finish off the driver initialization and register
- */
-static int __init init_control(struct fb_info_control *p)
-{
-	int full, sense, vmode, cmode, vyres;
-	struct fb_var_screeninfo var;
-	int rc;
-	
-	printk(KERN_INFO "controlfb: ");
-
-	full = p->total_vram == 0x400000;
-
-	/* Try to pick a video mode out of NVRAM if we have one. */
-	cmode = default_cmode;
-	if (IS_REACHABLE(CONFIG_NVRAM) && cmode == CMODE_NVRAM)
-		cmode = nvram_read_byte(NV_CMODE);
-	if (cmode < CMODE_8 || cmode > CMODE_32)
-		cmode = CMODE_8;
-
-	vmode = default_vmode;
-	if (IS_REACHABLE(CONFIG_NVRAM) && vmode == VMODE_NVRAM)
-		vmode = nvram_read_byte(NV_VMODE);
-	if (vmode < 1 || vmode > VMODE_MAX ||
-	    control_mac_modes[vmode - 1].m[full] < cmode) {
-		sense = read_control_sense(p);
-		printk(KERN_CONT "Monitor sense value = 0x%x, ", sense);
-		vmode = mac_map_monitor_sense(sense);
-		if (control_mac_modes[vmode - 1].m[full] < 0)
-			vmode = VMODE_640_480_60;
-		cmode = min(cmode, control_mac_modes[vmode - 1].m[full]);
-	}
-
-	/* Initialize info structure */
-	control_init_info(&p->info, p);
-
-	/* Setup default var */
-	if (mac_vmode_to_var(vmode, cmode, &var) < 0) {
-		/* This shouldn't happen! */
-		printk("mac_vmode_to_var(%d, %d,) failed\n", vmode, cmode);
-try_again:
-		vmode = VMODE_640_480_60;
-		cmode = CMODE_8;
-		if (mac_vmode_to_var(vmode, cmode, &var) < 0) {
-			printk(KERN_ERR "controlfb: mac_vmode_to_var() failed\n");
-			return -ENXIO;
-		}
-		printk(KERN_INFO "controlfb: ");
-	}
-	printk("using video mode %d and color mode %d.\n", vmode, cmode);
-
-	vyres = (p->total_vram - CTRLFB_OFF) / (var.xres << cmode);
-	if (vyres > var.yres)
-		var.yres_virtual = vyres;
-
-	/* Apply default var */
-	var.activate = FB_ACTIVATE_NOW;
-	rc = fb_set_var(&p->info, &var);
-	if (rc && (vmode != VMODE_640_480_60 || cmode != CMODE_8))
-		goto try_again;
-
-	/* Register with fbdev layer */
-	if (register_framebuffer(&p->info) < 0)
-		return -ENXIO;
-
-	fb_info(&p->info, "control display adapter\n");
-
-	return 0;
-}
-
 #define RADACAL_WRITE(a,d) \
 	out_8(&p->cmap_regs->addr, (a)); \
 	out_8(&p->cmap_regs->dat,   (d))
@@ -502,67 +423,6 @@ static void control_set_hardware(struct fb_info_control *p, struct fb_par_contro
 #endif /* CONFIG_BOOTX_TEXT */
 }
 
-
-/*
- * Parse user specified options (`video=controlfb:')
- */
-static void __init control_setup(char *options)
-{
-	char *this_opt;
-
-	if (!options || !*options)
-		return;
-
-	while ((this_opt = strsep(&options, ",")) != NULL) {
-		if (!strncmp(this_opt, "vmode:", 6)) {
-			int vmode = simple_strtoul(this_opt+6, NULL, 0);
-			if (vmode > 0 && vmode <= VMODE_MAX &&
-			    control_mac_modes[vmode - 1].m[1] >= 0)
-				default_vmode = vmode;
-		} else if (!strncmp(this_opt, "cmode:", 6)) {
-			int depth = simple_strtoul(this_opt+6, NULL, 0);
-			switch (depth) {
-			 case CMODE_8:
-			 case CMODE_16:
-			 case CMODE_32:
-			 	default_cmode = depth;
-			 	break;
-			 case 8:
-				default_cmode = CMODE_8;
-				break;
-			 case 15:
-			 case 16:
-				default_cmode = CMODE_16;
-				break;
-			 case 24:
-			 case 32:
-				default_cmode = CMODE_32;
-				break;
-			}
-		}
-	}
-}
-
-static int __init control_init(void)
-{
-	struct device_node *dp;
-	char *option = NULL;
-	int ret = -ENXIO;
-
-	if (fb_get_options("controlfb", &option))
-		return -ENODEV;
-	control_setup(option);
-
-	dp = of_find_node_by_name(NULL, "control");
-	if (dp && !control_of_init(dp))
-		ret = 0;
-	of_node_put(dp);
-
-	return ret;
-}
-
-device_initcall(control_init);
-
 /* Work out which banks of VRAM we have installed. */
 /* danj: I guess the card just ignores writes to nonexistant VRAM... */
 
@@ -627,78 +487,6 @@ static void __init find_vram_size(struct fb_info_control *p)
 			(bank1 + bank2) << 1, bank1 << 1, bank2 << 1);
 }
 
-
-/*
- * find "control" and initialize
- */
-static int __init control_of_init(struct device_node *dp)
-{
-	struct fb_info_control	*p;
-	struct resource		fb_res, reg_res;
-
-	if (control_fb) {
-		printk(KERN_ERR "controlfb: only one control is supported\n");
-		return -ENXIO;
-	}
-
-	if (of_pci_address_to_resource(dp, 2, &fb_res) ||
-	    of_pci_address_to_resource(dp, 1, &reg_res)) {
-		printk(KERN_ERR "can't get 2 addresses for control\n");
-		return -ENXIO;
-	}
-	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (!p)
-		return -ENOMEM;
-	control_fb = p;	/* save it for cleanups */
-
-	/* Map in frame buffer and registers */
-	p->fb_orig_base = fb_res.start;
-	p->fb_orig_size = resource_size(&fb_res);
-	/* use the big-endian aperture (??) */
-	p->frame_buffer_phys = fb_res.start + 0x800000;
-	p->control_regs_phys = reg_res.start;
-	p->control_regs_size = resource_size(&reg_res);
-
-	if (!p->fb_orig_base ||
-	    !request_mem_region(p->fb_orig_base,p->fb_orig_size,"controlfb")) {
-		p->fb_orig_base = 0;
-		goto error_out;
-	}
-	/* map at most 8MB for the frame buffer */
-	p->frame_buffer = ioremap_wt(p->frame_buffer_phys, 0x800000);
-
-	if (!p->control_regs_phys ||
-	    !request_mem_region(p->control_regs_phys, p->control_regs_size,
-	    "controlfb regs")) {
-		p->control_regs_phys = 0;
-		goto error_out;
-	}
-	p->control_regs = ioremap(p->control_regs_phys, p->control_regs_size);
-
-	p->cmap_regs_phys = 0xf301b000;	 /* XXX not in prom? */
-	if (!request_mem_region(p->cmap_regs_phys, 0x1000, "controlfb cmap")) {
-		p->cmap_regs_phys = 0;
-		goto error_out;
-	}
-	p->cmap_regs = ioremap(p->cmap_regs_phys, 0x1000);
-
-	if (!p->cmap_regs || !p->control_regs || !p->frame_buffer)
-		goto error_out;
-
-	find_vram_size(p);
-	if (!p->total_vram)
-		goto error_out;
-
-	if (init_control(p) < 0)
-		goto error_out;
-
-	return 0;
-
-error_out:
-	control_cleanup();
-	return -ENXIO;
-}
-
 /*
  * Get the monitor sense value.
  * Note that this can be called before calibrate_delay,
@@ -1023,6 +811,115 @@ static void __init control_init_info(struct fb_info *info, struct fb_info_contro
         info->fix.accel = FB_ACCEL_NONE;
 }
 
+/*
+ * Parse user specified options (`video=controlfb:')
+ */
+static void __init control_setup(char *options)
+{
+	char *this_opt;
+
+	if (!options || !*options)
+		return;
+
+	while ((this_opt = strsep(&options, ",")) != NULL) {
+		if (!strncmp(this_opt, "vmode:", 6)) {
+			int vmode = simple_strtoul(this_opt+6, NULL, 0);
+			if (vmode > 0 && vmode <= VMODE_MAX &&
+			    control_mac_modes[vmode - 1].m[1] >= 0)
+				default_vmode = vmode;
+		} else if (!strncmp(this_opt, "cmode:", 6)) {
+			int depth = simple_strtoul(this_opt+6, NULL, 0);
+			switch (depth) {
+			 case CMODE_8:
+			 case CMODE_16:
+			 case CMODE_32:
+			 	default_cmode = depth;
+			 	break;
+			 case 8:
+				default_cmode = CMODE_8;
+				break;
+			 case 15:
+			 case 16:
+				default_cmode = CMODE_16;
+				break;
+			 case 24:
+			 case 32:
+				default_cmode = CMODE_32;
+				break;
+			}
+		}
+	}
+}
+
+/*
+ * finish off the driver initialization and register
+ */
+static int __init init_control(struct fb_info_control *p)
+{
+	int full, sense, vmode, cmode, vyres;
+	struct fb_var_screeninfo var;
+	int rc;
+	
+	printk(KERN_INFO "controlfb: ");
+
+	full = p->total_vram == 0x400000;
+
+	/* Try to pick a video mode out of NVRAM if we have one. */
+	cmode = default_cmode;
+	if (IS_REACHABLE(CONFIG_NVRAM) && cmode == CMODE_NVRAM)
+		cmode = nvram_read_byte(NV_CMODE);
+	if (cmode < CMODE_8 || cmode > CMODE_32)
+		cmode = CMODE_8;
+
+	vmode = default_vmode;
+	if (IS_REACHABLE(CONFIG_NVRAM) && vmode == VMODE_NVRAM)
+		vmode = nvram_read_byte(NV_VMODE);
+	if (vmode < 1 || vmode > VMODE_MAX ||
+	    control_mac_modes[vmode - 1].m[full] < cmode) {
+		sense = read_control_sense(p);
+		printk(KERN_CONT "Monitor sense value = 0x%x, ", sense);
+		vmode = mac_map_monitor_sense(sense);
+		if (control_mac_modes[vmode - 1].m[full] < 0)
+			vmode = VMODE_640_480_60;
+		cmode = min(cmode, control_mac_modes[vmode - 1].m[full]);
+	}
+
+	/* Initialize info structure */
+	control_init_info(&p->info, p);
+
+	/* Setup default var */
+	if (mac_vmode_to_var(vmode, cmode, &var) < 0) {
+		/* This shouldn't happen! */
+		printk("mac_vmode_to_var(%d, %d,) failed\n", vmode, cmode);
+try_again:
+		vmode = VMODE_640_480_60;
+		cmode = CMODE_8;
+		if (mac_vmode_to_var(vmode, cmode, &var) < 0) {
+			printk(KERN_ERR "controlfb: mac_vmode_to_var() failed\n");
+			return -ENXIO;
+		}
+		printk(KERN_INFO "controlfb: ");
+	}
+	printk("using video mode %d and color mode %d.\n", vmode, cmode);
+
+	vyres = (p->total_vram - CTRLFB_OFF) / (var.xres << cmode);
+	if (vyres > var.yres)
+		var.yres_virtual = vyres;
+
+	/* Apply default var */
+	var.activate = FB_ACTIVATE_NOW;
+	rc = fb_set_var(&p->info, &var);
+	if (rc && (vmode != VMODE_640_480_60 || cmode != CMODE_8))
+		goto try_again;
+
+	/* Register with fbdev layer */
+	if (register_framebuffer(&p->info) < 0)
+		return -ENXIO;
+
+	fb_info(&p->info, "control display adapter\n");
+
+	return 0;
+}
 
 static void control_cleanup(void)
 {
@@ -1049,4 +946,93 @@ static void control_cleanup(void)
 	kfree(p);
 }
 
+/*
+ * find "control" and initialize
+ */
+static int __init control_of_init(struct device_node *dp)
+{
+	struct fb_info_control	*p;
+	struct resource		fb_res, reg_res;
+
+	if (control_fb) {
+		printk(KERN_ERR "controlfb: only one control is supported\n");
+		return -ENXIO;
+	}
+
+	if (of_pci_address_to_resource(dp, 2, &fb_res) ||
+	    of_pci_address_to_resource(dp, 1, &reg_res)) {
+		printk(KERN_ERR "can't get 2 addresses for control\n");
+		return -ENXIO;
+	}
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+	control_fb = p;	/* save it for cleanups */
+
+	/* Map in frame buffer and registers */
+	p->fb_orig_base = fb_res.start;
+	p->fb_orig_size = resource_size(&fb_res);
+	/* use the big-endian aperture (??) */
+	p->frame_buffer_phys = fb_res.start + 0x800000;
+	p->control_regs_phys = reg_res.start;
+	p->control_regs_size = resource_size(&reg_res);
+
+	if (!p->fb_orig_base ||
+	    !request_mem_region(p->fb_orig_base,p->fb_orig_size,"controlfb")) {
+		p->fb_orig_base = 0;
+		goto error_out;
+	}
+	/* map at most 8MB for the frame buffer */
+	p->frame_buffer = ioremap_wt(p->frame_buffer_phys, 0x800000);
+
+	if (!p->control_regs_phys ||
+	    !request_mem_region(p->control_regs_phys, p->control_regs_size,
+	    "controlfb regs")) {
+		p->control_regs_phys = 0;
+		goto error_out;
+	}
+	p->control_regs = ioremap(p->control_regs_phys, p->control_regs_size);
+
+	p->cmap_regs_phys = 0xf301b000;	 /* XXX not in prom? */
+	if (!request_mem_region(p->cmap_regs_phys, 0x1000, "controlfb cmap")) {
+		p->cmap_regs_phys = 0;
+		goto error_out;
+	}
+	p->cmap_regs = ioremap(p->cmap_regs_phys, 0x1000);
+
+	if (!p->cmap_regs || !p->control_regs || !p->frame_buffer)
+		goto error_out;
+
+	find_vram_size(p);
+	if (!p->total_vram)
+		goto error_out;
+
+	if (init_control(p) < 0)
+		goto error_out;
+
+	return 0;
+
+error_out:
+	control_cleanup();
+	return -ENXIO;
+}
+
+static int __init control_init(void)
+{
+	struct device_node *dp;
+	char *option = NULL;
+	int ret = -ENXIO;
 
+	if (fb_get_options("controlfb", &option))
+		return -ENODEV;
+	control_setup(option);
+
+	dp = of_find_node_by_name(NULL, "control");
+	if (dp && !control_of_init(dp))
+		ret = 0;
+	of_node_put(dp);
+
+	return ret;
+}
+
+device_initcall(control_init);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

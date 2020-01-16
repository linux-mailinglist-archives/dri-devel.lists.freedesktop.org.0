Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F5413DD08
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5066ED31;
	Thu, 16 Jan 2020 14:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612A36ED21
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116140917euoutp01a37f07312c1ed870a8737504360867c7~qY0KcozCs0495504955euoutp01m
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200116140917euoutp01a37f07312c1ed870a8737504360867c7~qY0KcozCs0495504955euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579183757;
 bh=UjI7pq402iq5pI3T/IpsVyHBFogV/jA6cdkYrAOJUDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YrCjIFkiTE8whvokbTpIh794KDQwmjpK6EFfPRvaRegwdGzHUfJZLpmiJy8FIVFgm
 UMRjjW3lAjtG6Wr7MXieJ7haD5PgZbcbWXbw5Z/zWz10XIMhHWx5qbkgtfT1EkBiwn
 wFOjO1u9AX+EnhCS5tj2RDkr+4p9uU9zf19BAIeE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200116140916eucas1p202c94aa1429b4ae8a0d1ffa67dd9916c~qY0KPxfkq1059310593eucas1p2t;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C1.FD.60698.C8E602E5; Thu, 16
 Jan 2020 14:09:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200116140916eucas1p112ff962e85e6feb4dbc2ff65443ef1ce~qY0JwVXu30480504805eucas1p18;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200116140916eusmtrp26285d011ced2952841245f69eea2ace3~qY0Jvylh50965509655eusmtrp2G;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-ae-5e206e8ccefd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AA.FF.08375.C8E602E5; Thu, 16
 Jan 2020 14:09:16 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200116140916eusmtip1c274cd474e09869132dc019be1338c43~qY0Jb-Pzk0665806658eusmtip1Z;
 Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] video: fbdev: controlfb: remove function prototypes
 part #2
Date: Thu, 16 Jan 2020 15:08:59 +0100
Message-Id: <20200116140900.26363-6-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116140900.26363-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduzned2ePIU4g+NfdS1urTvHarFxxnpW
 iytf37NZnOj7wGpxedccNgdWj/vdx5k8+rasYvT4vEkugDmKyyYlNSezLLVI3y6BK+Nvx3PW
 ghfpFT9fXmduYJwR3MXIwSEhYCKx9a5HFyMXh5DACkaJE0ufs0A4Xxgldn5fxdzFyAnkfGaU
 eD2LG8QGafgz8zcbRNFyRomJt08zwXUcaGhnAqliE7CSmNi+ihHEFhFIkFgxfQYjyDpmAUeJ
 5n4+kLCwQJBE2/5N7CA2i4CqROeJXjCbV8BWYvevV+wQy+Qltn77xApicwrYScw7dY8RokZQ
 4uTMJywgNjNQTfPW2cwgN0gIfGeTuHavlwmi2UXiY888RghbWOLV8S1QQ2Uk/u+czwTRsI5R
 4m/HC6ju7YwSyyf/Y4Oospa4c+4XG8TVmhLrd+lDhB0lnv8+zQgJOz6JG28FIY7gk5i0bToz
 RJhXoqNNCKJaTWLDsg1sMGu7dq6EKvGQ6PtoPYFRcRaSb2Yh+WYWwtoFjMyrGMVTS4tz01OL
 jfNSy/WKE3OLS/PS9ZLzczcxAtPH6X/Hv+5g3Pcn6RCjAAejEg/vhxCFOCHWxLLiytxDjBIc
 zEoivCdnyMYJ8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvEwSnV
 wFiVet31esRu+6gZgvwXNoh1XRI5+2NZb0bBnlyB0slvfffNadf/JPbY7PW3iWFSym2HLfSn
 L7HfcqXQQu5QxoLF2s7XfCdU/kw8NOV7VojsNIkDb4p3apdL/yqxKj3h/9fe3vX9jrUK6r5T
 LBhPt8Uy+x2T+KB9WS+gu6Dz9IMo02RG82cxW5VYijMSDbWYi4oTAcuZFWUbAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsVy+t/xu7o9eQpxBrMuCVrcWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bA6sHve7jzN59G1ZxejxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
 nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbfjuesBS/SK36+vM7cwDgjuIuRk0NC
 wETiz8zfbF2MXBxCAksZJT4+PsDYxcgBlJCROL6+DKJGWOLPtS6omk+MEnN7NrKDJNgErCQm
 tq9iBLFFBJIkOhtOMoPYzALOErNuPWICmSMsECBx/DcLSJhFQFWi80QvWCuvgK3E7l+v2CHm
 y0ts/faJFcTmFLCTmHfqHtgJQkA1h6ZJQZQLSpyc+YQFYrq8RPPW2cwTGAVmIUnNQpJawMi0
 ilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzDMtx37uXkH46WNwYcYBTgYlXh4ZwQpxAmxJpYV
 V+YeYpTgYFYS4T05QzZOiDclsbIqtSg/vqg0J7X4EKMp0A8TmaVEk/OBMZhXEm9oamhuYWlo
 bmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFRrnxD/JWoi3NufrNWmPBr55RbO+78
 2nrsz96AuJssErvflkx7rLnIJXpFee4O26/7drS9nHHpkrDjvnL32OmP4lU/Bsw5uIxH3F9Z
 waYqiLvowNPoxfqMtq+mLNw7RXPyycC05V8fzk0Wdfijuen5CdvqgN0lf8wnWmUqzpU8fvuN
 66uV60QiNiqxFGckGmoxFxUnAgCzPc7UiQIAAA==
X-CMS-MailID: 20200116140916eucas1p112ff962e85e6feb4dbc2ff65443ef1ce
X-Msg-Generator: CA
X-RootMTR: 20200116140916eucas1p112ff962e85e6feb4dbc2ff65443ef1ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116140916eucas1p112ff962e85e6feb4dbc2ff65443ef1ce
References: <20200116140900.26363-1-b.zolnierkie@samsung.com>
 <CGME20200116140916eucas1p112ff962e85e6feb4dbc2ff65443ef1ce@eucas1p1.samsung.com>
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
Cc: b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorder code a bit and then remove no longer needed function
prototypes.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/controlfb.c | 410 +++++++++++++++-----------------
 1 file changed, 198 insertions(+), 212 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 32ee6e4b5db4..4012ecf72d47 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -131,20 +131,12 @@ struct fb_info_control {
 
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
@@ -360,77 +352,6 @@ static void set_control_clock(unsigned char *params)
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
@@ -492,67 +413,6 @@ static void control_set_hardware(struct fb_info_control *p, struct fb_par_contro
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
 
@@ -629,78 +489,6 @@ static void __init find_vram_size(struct fb_info_control *p)
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
@@ -1025,6 +813,115 @@ static void __init control_init_info(struct fb_info *info, struct fb_info_contro
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
@@ -1051,4 +948,93 @@ static void control_cleanup(void)
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

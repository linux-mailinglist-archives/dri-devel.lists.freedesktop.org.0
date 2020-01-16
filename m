Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63013DD05
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCBE6ED24;
	Thu, 16 Jan 2020 14:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE3C6ED22
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116140917euoutp02671da5daaf9d11caf5634ef3c1ea6638~qY0KyJMI_0652306523euoutp02W
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200116140917euoutp02671da5daaf9d11caf5634ef3c1ea6638~qY0KyJMI_0652306523euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579183757;
 bh=hpgw6xnVEWj+E/Pyg9EDeM6sLEMaetg0XhqQOF1Ravk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lfdA8L3MqjAn4KlFojNgxkuF8+x8Tj2lV+V6c0kCjeoNxWre96swmsCDz7OR0OV4I
 N+kYYUEtV/eX3SC+0uBfmGGDeZYdTcRbKNyWp6USm9JXJt4icibyBrp/Rmy5rQt/QA
 In/tuWfxTwnhHNVgdMr5wlzH9L9q8wct/6T5powQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200116140917eucas1p1d640595b59ab2a8f67765c3873bc61bf~qY0KczGcV1322413224eucas1p1O;
 Thu, 16 Jan 2020 14:09:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8D.FD.60679.C8E602E5; Thu, 16
 Jan 2020 14:09:17 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200116140916eucas1p2bd3480995a55fdc646481a8fa5a5aff3~qY0KCTod32425224252eucas1p27;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200116140916eusmtrp2bf28e8ece2286e3860f47641f36a9439~qY0KBtxrl0965509655eusmtrp2H;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-51-5e206e8c3e51
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0B.FF.08375.C8E602E5; Thu, 16
 Jan 2020 14:09:16 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200116140916eusmtip139c44590ab708c090249338a68ceb2be~qY0Jt7Ymx0711307113eusmtip1C;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] video: fbdev: controlfb: remove function prototypes
 part #3
Date: Thu, 16 Jan 2020 15:09:00 +0100
Message-Id: <20200116140900.26363-7-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116140900.26363-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd3ePIU4g/Z+Zotb686xWmycsZ7V
 4srX92wWJ/o+sFpc3jWHzYHV4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vgypgx3afg
 n3vFkr9PGRsYf1p2MXJwSAiYSGw8EdfFyMUhJLCCUaJhzldmCOcLo8Sb+5tZIJzPjBLbZzcC
 OZxgHRNnv4ZKLGeUOHKggw2u5XTzAXaQKjYBK4mJ7asYQWwRgQSJFdNnMILsYxZwlGju5wMx
 hQWCJHrPR4JUsAioSnyf0M0GYvMK2Er8+76JHWKXvMTWb59YQWxOATuJeafuMULUCEqcnPkE
 7B5moJrmrbPBrpYQ+MwmcXPJdahDXST+H9sHNUhY4tXxLVC2jMT/nfOZIBrWMUr87XgB1b2d
 UWL55H9sEFXWEnfO/WKDOFpTYv0ufYiwo8T0pcfYIGHHJ3HjrSDEEXwSk7ZNZ4YI80p0tAlB
 VKtJbFi2gQ1mbdfOlcwQtodET8sktgmMirOQvDMLyTuzEPYuYGRexSieWlqcm55abJSXWq5X
 nJhbXJqXrpecn7uJEZg+Tv87/mUH464/SYcYBTgYlXh4ZwQpxAmxJpYVV+YeYpTgYFYS4T05
 QzZOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp2ampBalFMFkmDk6pBkbtovI3
 0neCV4g2XCqr81pmMfeHT3jjE9n236VRy77P5ov1DGpl61v7kSFXc/PbGzn9LoJ++tGrsu9M
 Nt1Z5iHy7MH+5aKLNq3ddeZ4RrfD78NK2fG/D0T82fHXoMBOoK1u9eJ7LM1d+fadDl2My3O2
 sx67vuuyXKsqh8yJsxcm8T3mz7pjaKjEUpyRaKjFXFScCAC2vAG8GwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsVy+t/xu7o9eQpxBge+K1vcWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bA6sHve7jzN59G1ZxejxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
 nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaM6T4F/9wrlvx9ytjA+NOyi5GTQ0LA
 RGLi7NcsXYxcHEICSxklJp48xtTFyAGUkJE4vr4MokZY4s+1LjaImk+MEsdvtbGDJNgErCQm
 tq9iBLFFBJIkOhtOMoPYzALOErNuPWICsYUFAiQutHWzgdgsAqoS3ydA2LwCthL/vm9ih1gg
 L7H12ydWEJtTwE5i3ql7jCA3CAHVHJomBVEuKHFy5hMWiPHyEs1bZzNPYBSYhSQ1C0lqASPT
 KkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMAw33bs5+YdjJc2Bh9iFOBgVOLhnRGkECfEmlhW
 XJl7iFGCg1lJhPfkDNk4Id6UxMqq1KL8+KLSnNTiQ4ymQD9MZJYSTc4HxmBeSbyhqaG5haWh
 ubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZGL71Tl2Qjsmy1N1VtszHe8Kjy6smZ
 M4LYp0uuY4x453wp5fuvwP2CHdzJd+5urfU/c+xe6qLEzdJlMv0PFx0pKniS0/PphcK9hEqG
 A/Y5GuE3y5r9P5vrzhK3ivp9w7741kbO6x/0V/zdcNV+yYxPLFzaEb/XmMxQjf8/I8x6Ye+/
 pZzdvE6zlViKMxINtZiLihMBmJZlOYkCAAA=
X-CMS-MailID: 20200116140916eucas1p2bd3480995a55fdc646481a8fa5a5aff3
X-Msg-Generator: CA
X-RootMTR: 20200116140916eucas1p2bd3480995a55fdc646481a8fa5a5aff3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116140916eucas1p2bd3480995a55fdc646481a8fa5a5aff3
References: <20200116140900.26363-1-b.zolnierkie@samsung.com>
 <CGME20200116140916eucas1p2bd3480995a55fdc646481a8fa5a5aff3@eucas1p2.samsung.com>
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
 drivers/video/fbdev/controlfb.c | 306 +++++++++++++++-----------------
 1 file changed, 147 insertions(+), 159 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 4012ecf72d47..e71192ee5650 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -129,16 +129,6 @@ struct fb_info_control {
 #define CNTRL_REG(INFO,REG) (&(((INFO)->control_regs->REG).r))
 
 
-/******************** Prototypes for internal functions **********************/
-
-static void control_set_hardware(struct fb_info_control *p,
-	struct fb_par_control *par);
-static int control_var_to_par(struct fb_var_screeninfo *var,
-	struct fb_par_control *par, const struct fb_info *fb_info);
-static inline void control_par_to_var(struct fb_par_control *par,
-	struct fb_var_screeninfo *var);
-
-
 /************************** Internal variables *******************************/
 
 static struct fb_info_control *control_fb;
@@ -147,155 +137,6 @@ static int default_vmode __initdata = VMODE_NVRAM;
 static int default_cmode __initdata = CMODE_NVRAM;
 
 
-/********************  The functions for controlfb_ops ********************/
-
-/*
- * Checks a var structure
- */
-static int controlfb_check_var (struct fb_var_screeninfo *var, struct fb_info *info)
-{
-	struct fb_par_control par;
-	int err;
-
-	err = control_var_to_par(var, &par, info);
-	if (err)
-		return err;	
-	control_par_to_var(&par, var);
-
-	return 0;
-}
-
-/*
- * Applies current var to display
- */
-static int controlfb_set_par (struct fb_info *info)
-{
-	struct fb_info_control *p =
-		container_of(info, struct fb_info_control, info);
-	struct fb_par_control par;
-	int err;
-
-	if((err = control_var_to_par(&info->var, &par, info))) {
-		printk (KERN_ERR "controlfb_set_par: error calling"
-				 " control_var_to_par: %d.\n", err);
-		return err;
-	}
-	
-	control_set_hardware(p, &par);
-
-	info->fix.visual = (p->par.cmode == CMODE_8) ?
-		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_DIRECTCOLOR;
-	info->fix.line_length = p->par.pitch;
-	info->fix.xpanstep = 32 >> p->par.cmode;
-	info->fix.ypanstep = 1;
-
-	return 0;
-}
-
-/*
- * Set screen start address according to var offset values
- */
-static inline void set_screen_start(int xoffset, int yoffset,
-	struct fb_info_control *p)
-{
-	struct fb_par_control *par = &p->par;
-
-	par->xoffset = xoffset;
-	par->yoffset = yoffset;
-	out_le32(CNTRL_REG(p,start_addr),
-		 par->yoffset * par->pitch + (par->xoffset << par->cmode));
-}
-
-
-static int controlfb_pan_display(struct fb_var_screeninfo *var,
-				 struct fb_info *info)
-{
-	unsigned int xoffset, hstep;
-	struct fb_info_control *p =
-		container_of(info, struct fb_info_control, info);
-	struct fb_par_control *par = &p->par;
-
-	/*
-	 * make sure start addr will be 32-byte aligned
-	 */
-	hstep = 0x1f >> par->cmode;
-	xoffset = (var->xoffset + hstep) & ~hstep;
-
-	if (xoffset+par->xres > par->vxres ||
-	    var->yoffset+par->yres > par->vyres)
-		return -EINVAL;
-
-	set_screen_start(xoffset, var->yoffset, p);
-
-	return 0;
-}
-
-
-/*
- * Private mmap since we want to have a different caching on the framebuffer
- * for controlfb.
- * Note there's no locking in here; it's done in fb_mmap() in fbmem.c.
- */
-static int controlfb_mmap(struct fb_info *info,
-                       struct vm_area_struct *vma)
-{
-	unsigned long mmio_pgoff;
-	unsigned long start;
-	u32 len;
-
-	start = info->fix.smem_start;
-	len = info->fix.smem_len;
-	mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
-	if (vma->vm_pgoff >= mmio_pgoff) {
-		if (info->var.accel_flags)
-			return -EINVAL;
-		vma->vm_pgoff -= mmio_pgoff;
-		start = info->fix.mmio_start;
-		len = info->fix.mmio_len;
-		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	} else {
-		/* framebuffer */
-#ifdef CONFIG_PPC_PMAC
-		vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
-#endif
-	}
-
-	return vm_iomap_memory(vma, start, len);
-}
-
-static int controlfb_blank(int blank_mode, struct fb_info *info)
-{
-	struct fb_info_control *p =
-		container_of(info, struct fb_info_control, info);
-	unsigned ctrl;
-
-	ctrl = le32_to_cpup((const __force __le32 *)CNTRL_REG(p, ctrl));
-	if (blank_mode > 0)
-		switch (blank_mode) {
-		case FB_BLANK_VSYNC_SUSPEND:
-			ctrl &= ~3;
-			break;
-		case FB_BLANK_HSYNC_SUSPEND:
-			ctrl &= ~0x30;
-			break;
-		case FB_BLANK_POWERDOWN:
-			ctrl &= ~0x33;
-			/* fall through */
-		case FB_BLANK_NORMAL:
-			ctrl |= 0x400;
-			break;
-		default:
-			break;
-		}
-	else {
-		ctrl &= ~0x400;
-		ctrl |= 0x33;
-	}
-	out_le32(CNTRL_REG(p,ctrl), ctrl);
-
-	return 0;
-}
-
 static int controlfb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
 			     u_int transp, struct fb_info *info)
 {
@@ -352,6 +193,20 @@ static void set_control_clock(unsigned char *params)
 #endif	
 }
 
+/*
+ * Set screen start address according to var offset values
+ */
+static inline void set_screen_start(int xoffset, int yoffset,
+	struct fb_info_control *p)
+{
+	struct fb_par_control *par = &p->par;
+
+	par->xoffset = xoffset;
+	par->yoffset = yoffset;
+	out_le32(CNTRL_REG(p,start_addr),
+		 par->yoffset * par->pitch + (par->xoffset << par->cmode));
+}
+
 #define RADACAL_WRITE(a,d) \
 	out_8(&p->cmap_regs->addr, (a)); \
 	out_8(&p->cmap_regs->dat,   (d))
@@ -774,6 +629,139 @@ static inline void control_par_to_var(struct fb_par_control *par,
 	var->pixclock >>= par->regvals.clock_params[2];
 }
 
+/********************  The functions for controlfb_ops ********************/
+
+/*
+ * Checks a var structure
+ */
+static int controlfb_check_var (struct fb_var_screeninfo *var, struct fb_info *info)
+{
+	struct fb_par_control par;
+	int err;
+
+	err = control_var_to_par(var, &par, info);
+	if (err)
+		return err;	
+	control_par_to_var(&par, var);
+
+	return 0;
+}
+
+/*
+ * Applies current var to display
+ */
+static int controlfb_set_par (struct fb_info *info)
+{
+	struct fb_info_control *p =
+		container_of(info, struct fb_info_control, info);
+	struct fb_par_control par;
+	int err;
+
+	if((err = control_var_to_par(&info->var, &par, info))) {
+		printk (KERN_ERR "controlfb_set_par: error calling"
+				 " control_var_to_par: %d.\n", err);
+		return err;
+	}
+	
+	control_set_hardware(p, &par);
+
+	info->fix.visual = (p->par.cmode == CMODE_8) ?
+		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_DIRECTCOLOR;
+	info->fix.line_length = p->par.pitch;
+	info->fix.xpanstep = 32 >> p->par.cmode;
+	info->fix.ypanstep = 1;
+
+	return 0;
+}
+
+static int controlfb_pan_display(struct fb_var_screeninfo *var,
+				 struct fb_info *info)
+{
+	unsigned int xoffset, hstep;
+	struct fb_info_control *p =
+		container_of(info, struct fb_info_control, info);
+	struct fb_par_control *par = &p->par;
+
+	/*
+	 * make sure start addr will be 32-byte aligned
+	 */
+	hstep = 0x1f >> par->cmode;
+	xoffset = (var->xoffset + hstep) & ~hstep;
+
+	if (xoffset+par->xres > par->vxres ||
+	    var->yoffset+par->yres > par->vyres)
+		return -EINVAL;
+
+	set_screen_start(xoffset, var->yoffset, p);
+
+	return 0;
+}
+
+static int controlfb_blank(int blank_mode, struct fb_info *info)
+{
+	struct fb_info_control *p =
+		container_of(info, struct fb_info_control, info);
+	unsigned ctrl;
+
+	ctrl = le32_to_cpup((const __force __le32 *)CNTRL_REG(p, ctrl));
+	if (blank_mode > 0)
+		switch (blank_mode) {
+		case FB_BLANK_VSYNC_SUSPEND:
+			ctrl &= ~3;
+			break;
+		case FB_BLANK_HSYNC_SUSPEND:
+			ctrl &= ~0x30;
+			break;
+		case FB_BLANK_POWERDOWN:
+			ctrl &= ~0x33;
+			/* fall through */
+		case FB_BLANK_NORMAL:
+			ctrl |= 0x400;
+			break;
+		default:
+			break;
+		}
+	else {
+		ctrl &= ~0x400;
+		ctrl |= 0x33;
+	}
+	out_le32(CNTRL_REG(p,ctrl), ctrl);
+
+	return 0;
+}
+
+/*
+ * Private mmap since we want to have a different caching on the framebuffer
+ * for controlfb.
+ * Note there's no locking in here; it's done in fb_mmap() in fbmem.c.
+ */
+static int controlfb_mmap(struct fb_info *info,
+                       struct vm_area_struct *vma)
+{
+	unsigned long mmio_pgoff;
+	unsigned long start;
+	u32 len;
+
+	start = info->fix.smem_start;
+	len = info->fix.smem_len;
+	mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
+	if (vma->vm_pgoff >= mmio_pgoff) {
+		if (info->var.accel_flags)
+			return -EINVAL;
+		vma->vm_pgoff -= mmio_pgoff;
+		start = info->fix.mmio_start;
+		len = info->fix.mmio_len;
+		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	} else {
+		/* framebuffer */
+#ifdef CONFIG_PPC_PMAC
+		vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
+#endif
+	}
+
+	return vm_iomap_memory(vma, start, len);
+}
+
 static const struct fb_ops controlfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_check_var	= controlfb_check_var,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

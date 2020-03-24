Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FA19119A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 14:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4573E6E48D;
	Tue, 24 Mar 2020 13:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB02C6E48C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200324134520euoutp0172ba36722160733d4286fa9121fe8052~-QWqwXyOe0072900729euoutp01o
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200324134520euoutp0172ba36722160733d4286fa9121fe8052~-QWqwXyOe0072900729euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585057520;
 bh=wFMPPf1qHbV7MTxhfuXNX7PXRiVGUv9YYpv782+nToo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PTYXRyFaySZUptWT+tR0t0BB7oU73t5mQiFjq9rDwrNx9xaohCGotr5OK0H8pR8L6
 wF7QFqihwrKMlnsW9qEsYJ1NE9VPRxZxk8YiaJE8CAqGRpapyoeiKx6ZS9TH5ax1w1
 jwrO/pAa2V41yuUl4NsdVqR/Jb33hP2mbcK0YTPM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200324134519eucas1p1b9fc55b0edf478a002bd8b298cef4979~-QWqas9sN1323313233eucas1p1Y;
 Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 17.48.60679.FEE0A7E5; Tue, 24
 Mar 2020 13:45:19 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200324134519eucas1p1e9b54c01e452330425f49c442e4c1b4e~-QWqE3-R61592815928eucas1p1P;
 Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200324134519eusmtrp1dd9cdb988859cad042f02179a80bcdec~-QWqEVdbE2619426194eusmtrp1v;
 Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-c6-5e7a0eefbf14
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2D.E6.08375.FEE0A7E5; Tue, 24
 Mar 2020 13:45:19 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200324134519eusmtip267142118e3f73b5b45472bd472540e3a~-QWpwIps-2735827358eusmtip2n;
 Tue, 24 Mar 2020 13:45:19 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] video: fbdev: controlfb: remove function prototypes
 part #1
Date: Tue, 24 Mar 2020 14:45:06 +0100
Message-Id: <20200324134508.25120-5-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200324134508.25120-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djP87rv+ariDBbPtLS4te4cq8XGGetZ
 La58fc9mcaLvA6vF5V1z2CxW/NzK6MDmcb/7OJPHkmlX2Tz6tqxi9Pi8SS6AJYrLJiU1J7Ms
 tUjfLoEro2XZHJaCMyIVi3b+ZGtg3C/YxcjJISFgIvF131z2LkYuDiGBFYwSDZtnMkI4Xxgl
 pmy8C5X5zCjxsusQUIYDrGXlP0GI+HJGiW27TrHCdXw5eoUJZC6bgJXExPZVjCC2iECCxIrp
 M8BsZoEUiQ9b/oPVCAuESrT3v2IHsVkEVCUmdX1gA7F5BWwlTi64wQJxn7zE1m+fWEFsTgE7
 id5ph5ghagQlTs58wgIxU16ieetsZpAjJAT+s0l0n98D1ewi8fPuJEYIW1ji1fEt7BC2jMTp
 yT0sEA3rGCX+dryA6t7OKLF88j82iCpriTvnfrGB/MwsoCmxfpc+RNhRonsDSDMoKPgkbrwV
 hDiCT2LStunMEGFeiY42IYhqNYkNyzawwazt2rmSGcL2kDjQ9pV5AqPiLCTvzELyziyEvQsY
 mVcxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEJpbT/45/2cG460/SIUYBDkYlHl6Nh5Vx
 QqyJZcWVuYcYJTiYlUR4N6dWxAnxpiRWVqUW5ccXleakFh9ilOZgURLnNV70MlZIID2xJDU7
 NbUgtQgmy8TBKdXAyGVgaM1dzly26sFErwXOH9LTV9j8O/9/oXyz64QJfEzx+l+cEzrcJI/U
 L0xLP1cb5c9xK8Zx9+YbWup8Zp5P7ANdLzurc2j9eLqbV+P3xwmRf+fa7F+/oPx5MOOiQ6p/
 DTRuOqTudPq8J/BfpGZFyMIp6Xqzv6pNnCq5+1D8O79dTZ2bVdmXKLEUZyQaajEXFScCAKSj
 3zYoAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7rv+ariDKYtV7a4te4cq8XGGetZ
 La58fc9mcaLvA6vF5V1z2CxW/NzK6MDmcb/7OJPHkmlX2Tz6tqxi9Pi8SS6AJUrPpii/tCRV
 ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo2XZHJaCMyIVi3b+
 ZGtg3C/YxcjBISFgIrHyH5DJxSEksJRRoun1WRaIuIzE8fVlXYycQKawxJ9rXWwgtpDAJ0aJ
 A002IDabgJXExPZVjCC2iECSRGfDSWYQm1kgTWLS2btMIGOEBYIlHu4JBQmzCKhKTOr6ADaG
 V8BW4uSCGywQ4+Ultn77xApicwrYSfROO8QMscpW4t3644wQ9YISJ2c+YYEYLy/RvHU28wRG
 gVlIUrOQpBYwMq1iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIDPxtx35u3sF4aWPwIUYBDkYl
 Hl6Nh5VxQqyJZcWVuYcYJTiYlUR4N6dWxAnxpiRWVqUW5ccXleakFh9iNAV6YiKzlGhyPjAq
 80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MHInu2anVTOo5hsX
 XjoY0RL9Z9V+pmMBnz/Hp3xLtplseEqYi08z5Euga/SXAM/Ncu0+Bhz3yg8eNft2zDNw1bHu
 9rd9tkwbT6xSXMocxhEhxtmyZvLRs1wCXD6PhQVubbvyc1bDzGvi61fPDnI9PNGpM+b0SSO3
 5MWbDa3YvG4uEj76xur2TSWW4oxEQy3mouJEAPW0ZQeSAgAA
X-CMS-MailID: 20200324134519eucas1p1e9b54c01e452330425f49c442e4c1b4e
X-Msg-Generator: CA
X-RootMTR: 20200324134519eucas1p1e9b54c01e452330425f49c442e4c1b4e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324134519eucas1p1e9b54c01e452330425f49c442e4c1b4e
References: <20200324134508.25120-1-b.zolnierkie@samsung.com>
 <CGME20200324134519eucas1p1e9b54c01e452330425f49c442e4c1b4e@eucas1p1.samsung.com>
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
 drivers/video/fbdev/controlfb.c | 41 +++++++++++----------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 92cffd2d0219..83b7a219f557 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -141,20 +141,6 @@ struct fb_info_control {
 #define CNTRL_REG(INFO,REG) (&(((INFO)->control_regs->REG).r))
 
 
-/******************** Prototypes for exported functions ********************/
-/*
- * struct fb_ops
- */
-static int controlfb_pan_display(struct fb_var_screeninfo *var,
-	struct fb_info *info);
-static int controlfb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
-	u_int transp, struct fb_info *info);
-static int controlfb_blank(int blank_mode, struct fb_info *info);
-static int controlfb_mmap(struct fb_info *info,
-	struct vm_area_struct *vma);
-static int controlfb_set_par (struct fb_info *info);
-static int controlfb_check_var (struct fb_var_screeninfo *var, struct fb_info *info);
-
 /******************** Prototypes for internal functions **********************/
 
 static void set_control_clock(unsigned char *params);
@@ -181,20 +167,6 @@ static int default_vmode __initdata = VMODE_NVRAM;
 static int default_cmode __initdata = CMODE_NVRAM;
 
 
-static const struct fb_ops controlfb_ops = {
-	.owner		= THIS_MODULE,
-	.fb_check_var	= controlfb_check_var,
-	.fb_set_par	= controlfb_set_par,
-	.fb_setcolreg	= controlfb_setcolreg,
-	.fb_pan_display = controlfb_pan_display,
-	.fb_blank	= controlfb_blank,
-	.fb_mmap	= controlfb_mmap,
-	.fb_fillrect	= cfb_fillrect,
-	.fb_copyarea	= cfb_copyarea,
-	.fb_imageblit	= cfb_imageblit,
-};
-
-
 /********************  The functions for controlfb_ops ********************/
 
 /*
@@ -1012,6 +984,19 @@ static inline void control_par_to_var(struct fb_par_control *par,
 	var->pixclock >>= par->regvals.clock_params[2];
 }
 
+static const struct fb_ops controlfb_ops = {
+	.owner		= THIS_MODULE,
+	.fb_check_var	= controlfb_check_var,
+	.fb_set_par	= controlfb_set_par,
+	.fb_setcolreg	= controlfb_setcolreg,
+	.fb_pan_display = controlfb_pan_display,
+	.fb_blank	= controlfb_blank,
+	.fb_mmap	= controlfb_mmap,
+	.fb_fillrect	= cfb_fillrect,
+	.fb_copyarea	= cfb_copyarea,
+	.fb_imageblit	= cfb_imageblit,
+};
+
 /*
  * Set misc info vars for this driver
  */
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

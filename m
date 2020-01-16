Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2412F13DD06
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2136ED29;
	Thu, 16 Jan 2020 14:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9106ED1A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:17 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116140916euoutp01b826d40b0ea04299c3384889534c30d7~qY0J-XaSh0492304923euoutp01p
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200116140916euoutp01b826d40b0ea04299c3384889534c30d7~qY0J-XaSh0492304923euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579183756;
 bh=BGAg8y4UkwrAPBhyuTyPVRdvR/Vd6CHyN7f6GtWcWZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L4KNPdpPJ4GAJs6opH4MsqSXjZq/h/kVdC4uTbbpi5HGdVpKE+HFZ42elj6V5qPmw
 rrZUCE34Vm6ByRLaDxMYWrcyQJp8U/4c9z+tsp/i8CzQCGx/xIydEci55num0TFxxx
 JoPWozoIEU9VEjM4zjlGOXrvKSdKxUJTg14oELXw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200116140916eucas1p17fbbeae2a88748fb6bf266b90dc4b20f~qY0Jypy2u0480104801eucas1p1f;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 01.FD.60698.C8E602E5; Thu, 16
 Jan 2020 14:09:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200116140916eucas1p1a6aff99bd371c4e23b1cc287bc3c42a8~qY0JcT-L61322413224eucas1p1M;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200116140916eusmtrp2a95c5395f891c76eb43b800c1df445e1~qY0JbtfUU0965509655eusmtrp2E;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-ac-5e206e8c3668
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0A.FF.08375.B8E602E5; Thu, 16
 Jan 2020 14:09:15 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200116140915eusmtip10e5cd09bce3a469d76cf14e2fafd4e9b~qY0JKEJyx0239902399eusmtip1C;
 Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] video: fbdev: controlfb: remove function prototypes
 part #1
Date: Thu, 16 Jan 2020 15:08:58 +0100
Message-Id: <20200116140900.26363-5-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116140900.26363-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd2ePIU4gxXLRS1urTvHarFxxnpW
 iytf37NZnOj7wGpxedccNgdWj/vdx5k8+rasYvT4vEkugDmKyyYlNSezLLVI3y6BK2PtnUdM
 BQtFKl48nMHUwDhTsIuRk0NCwERi07bvTF2MXBxCAisYJWYv38wEkhAS+MIo8bWHFyLxmVGi
 e/M/NpiO1Qe2sUEULWeUWLPbA6IIqOHFt4XMIAk2ASuJie2rGEFsEYEEiRXTZwDZHBzMAo4S
 zf18IKawQJDEzCNaIBUsAqoSZy41soDYvAK2Et9a1jBCrJKX2PrtEyuIzSlgJzHv1D1GiBpB
 iZMzn4DVMwPVNG+dzQxygoTAdzaJ6V3nmSGaXSRmPN8AdbOwxKvjW9ghbBmJ/zvnM0E0rGOU
 +NvxAqp7O6PE8skwX1pL3Dn3iw3iaE2J9bv0IcKOEm9fPgD7RUKAT+LGW0GII/gkJm2bzgwR
 5pXoaBOCqFaT2LAM5gQZia6dK6FO85A4O+MLywRGxVlI3pmF5J1ZCHsXMDKvYhRPLS3OTU8t
 Ns5LLdcrTswtLs1L10vOz93ECEwfp/8d/7qDcd+fpEOMAhyMSjy8H0IU4oRYE8uKK3MPMUpw
 MCuJ8J6cIRsnxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dU
 A6NK4te38asNdld8fDv/uHf/Nb19l1tXTon3ev7E7jtHzcvmNY2RnKnNYud65Cc62nz4a9aq
 sZ7txuYGhuVK/wPnnH31+EZw8An5fQd3CTSxljq+PZChdqxp8UWB2Ij/Mz6e3PeSeUPPw7s/
 FjoUqbdfTfFoCQxMvPDJ4NL8U2zZ71S1I/pWax5TYinOSDTUYi4qTgQAhr99+RsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsVy+t/xu7rdeQpxBi0zbSxurTvHarFxxnpW
 iytf37NZnOj7wGpxedccNgdWj/vdx5k8+rasYvT4vEkugDlKz6Yov7QkVSEjv7jEVina0MJI
 z9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2PtnUdMBQtFKl48nMHUwDhTsIuRk0NC
 wERi9YFtbF2MXBxCAksZJd5NnczUxcgBlJCROL6+DKJGWOLPtS42EFtI4BOjxIvL2iA2m4CV
 xMT2VYwgtohAkkRnw0lmEJtZwFli1q1HTCC2sECAxJMV7WA2i4CqxJlLjSwgNq+ArcS3ljWM
 EPPlJbZ++8QKYnMK2EnMO3WPEeQEIaCaQ9OkIMoFJU7OfMICMV5eonnrbOYJjAKzkKRmIUkt
 YGRaxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERjm24793LyD8dLG4EOMAhyMSjy8M4IU4oRY
 E8uKK3MPMUpwMCuJ8J6cIRsnxJuSWFmVWpQfX1Sak1p8iNEU6IeJzFKiyfnAGMwriTc0NTS3
 sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cDYEilzJNvplYLl6ZzF01Xm6m6Y
 6xX2qSigY+tOy9A+FRXb2IvdU52ubPc6OvvZhMWJTQtaXm3aHjn/culSvstbt/N52+70E7ql
 yGJwSJH54Z+9bZtd73lP4hLanXPptVZk6tJZT7hNPt47f/72vQ0pPaeCAsvVFGN7zTsWqfj9
 WlIbbRZt4FSkxFKckWioxVxUnAgAGFA7sIkCAAA=
X-CMS-MailID: 20200116140916eucas1p1a6aff99bd371c4e23b1cc287bc3c42a8
X-Msg-Generator: CA
X-RootMTR: 20200116140916eucas1p1a6aff99bd371c4e23b1cc287bc3c42a8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116140916eucas1p1a6aff99bd371c4e23b1cc287bc3c42a8
References: <20200116140900.26363-1-b.zolnierkie@samsung.com>
 <CGME20200116140916eucas1p1a6aff99bd371c4e23b1cc287bc3c42a8@eucas1p1.samsung.com>
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
 drivers/video/fbdev/controlfb.c | 41 +++++++++++----------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 87cd817ad4c6..32ee6e4b5db4 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -129,20 +129,6 @@ struct fb_info_control {
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
@@ -169,20 +155,6 @@ static int default_vmode __initdata = VMODE_NVRAM;
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
@@ -1014,6 +986,19 @@ static inline void control_par_to_var(struct fb_par_control *par,
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

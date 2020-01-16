Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D213DD03
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377956ED21;
	Thu, 16 Jan 2020 14:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2546ED24
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116140916euoutp01fdd6efe793628dde84326ec82687227c~qY0J04r4F0495004950euoutp01k
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200116140916euoutp01fdd6efe793628dde84326ec82687227c~qY0J04r4F0495004950euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579183756;
 bh=4b2kZUKHe8BuGKdW66ZpFS0aOp/lsq8V4/w6GQZoDUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ozuh75amOHq+7DV7yjjlNs9Ppxtd7xZ0khYszzGWSzpsQxmBXALxForsusLYvug/l
 sLRJh3C6hCTgH1v7whQdNrse7d+M18sgWO5b1kTAcjJJWmIIQ5y5oFcfCYTwLVBWDB
 vAzxxtz1QkT6/B2yTZjFEGRWc/8Hw2gAQW1YkM0o=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200116140916eucas1p25c18a000ec4bd2ae35ff10a921d7ea07~qY0Jj7POK2050420504eucas1p22;
 Thu, 16 Jan 2020 14:09:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 59.7E.61286.B8E602E5; Thu, 16
 Jan 2020 14:09:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200116140915eucas1p28dfeecf8a58cecb00262fe86fd19c4f5~qY0JLv4pR1918219182eucas1p2D;
 Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200116140915eusmtrp298440ba1eb9261f67ab2e9dcccf6a23f~qY0JLJBkq0965509655eusmtrp2D;
 Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-48-5e206e8b10ba
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9B.80.07950.B8E602E5; Thu, 16
 Jan 2020 14:09:15 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200116140915eusmtip1bdab67b4f477ab38cbd85f70b6e268bd~qY0I35ezq0711307113eusmtip1B;
 Thu, 16 Jan 2020 14:09:15 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] video: fbdev: controlfb: add COMPILE_TEST support
Date: Thu, 16 Jan 2020 15:08:57 +0100
Message-Id: <20200116140900.26363-4-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116140900.26363-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd2ePIU4g+5OJotb686xWmycsZ7V
 4srX92wWJ/o+sFpc3jWHzYHV4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vgyri04B1L
 wWSxit8zdzA3MM4V6mLk5JAQMJH4cbCfEcQWEljBKNHxjRvC/sIoca1LtIuRC8j+zChxb8F9
 ZpiGtStbmCASyxklrs5cxgrhAHXM+fEebBSbgJXExPZVYLaIQILEiukzgGwODmYBR4nmfj6Q
 sLCAm8SjfXfASlgEVCW+310CZvMK2EpsmvQKapm8xNZvn1hBbE4BO4l5p+5B1QhKnJz5hAXE
 Zgaqad46mxnkBgmB72wSLy7OZoNodpH4OPkYlC0s8er4FnYIW0bi/875TBAN6xgl/na8gOre
 ziixfPI/qA5riTvnfrFBXK0psX6XPogpAfTAvVnGECafxI23ghA38ElM2jadGSLMK9HRBg1c
 NYkNyzawwWzt2rkS6i0PibZDzUwTGBVnIflmFpJvZiGsXcDIvIpRPLW0ODc9tdgwL7Vcrzgx
 t7g0L10vOT93EyMwfZz+d/zTDsavl5IOMQpwMCrx8M4IUogTYk0sK67MPcQowcGsJMJ7coZs
 nBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2MmTfaCx9w
 rNs4USLW6eIK1ka7DVx2J2JUGYI4BHPKbrnavJ8hZ84gpv+wZSr7YdEJHg+TLqRZNtgG+Ss4
 tZ5d4cZwQN/Of/3xmQsee894UXbUO+rfpcu3XZ+Hpxl58gbYT9/DsIln4tcr/uYGLaEW4S92
 7zE+NaHUNad3vr/g97KHsx78eXVRiaU4I9FQi7moOBEASOtw5xsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsVy+t/xu7rdeQpxBu8naVncWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bA6sHve7jzN59G1ZxejxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
 nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsalBe9YCiaLVfyeuYO5gXGuUBcjJ4eE
 gInE2pUtTF2MXBxCAksZJaa/e8rSxcgBlJCROL6+DKJGWOLPtS42iJpPjBI9Pa3sIAk2ASuJ
 ie2rGEFsEYEkic6Gk8wgNrOAs8SsW4+YQGxhATeJR/vugNWwCKhKfL+7BMzmFbCV2DTpFTPE
 AnmJrd8+sYLYnAJ2EvNO3WMEuUEIqObQNCmIckGJkzOfsECMl5do3jqbeQKjwCwkqVlIUgsY
 mVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEBvq2Yz+37GDsehd8iFGAg1GJh3dGkEKcEGti
 WXFl7iFGCQ5mJRHekzNk44R4UxIrq1KL8uOLSnNSiw8xmgL9MJFZSjQ5HxiFeSXxhqaG5haW
 hubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGB2iUyYe839t8XLr8oJtO57Vv1rl
 vjmjce8qvatGFx0+sQTFJHB8tG3tqvKwnB4yxdhrn1L1Db6mzO8FnAktxlt3up1L0Xps4f8p
 W6R7Jn8e21lWnTObNlr+uHXv2r+dEcVJJyJTDebOmKv+8/9WgfMfnzdM1/F6fSsyM2L5/GDb
 tZ1LOu7mXFJiKc5INNRiLipOBACxUS5nigIAAA==
X-CMS-MailID: 20200116140915eucas1p28dfeecf8a58cecb00262fe86fd19c4f5
X-Msg-Generator: CA
X-RootMTR: 20200116140915eucas1p28dfeecf8a58cecb00262fe86fd19c4f5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116140915eucas1p28dfeecf8a58cecb00262fe86fd19c4f5
References: <20200116140900.26363-1-b.zolnierkie@samsung.com>
 <CGME20200116140915eucas1p28dfeecf8a58cecb00262fe86fd19c4f5@eucas1p2.samsung.com>
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

Add COMPILE_TEST support to controlfb driver for better compile
testing coverage.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/Kconfig     |  2 +-
 drivers/video/fbdev/controlfb.c | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index aa9541bf964b..91c872457863 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -472,7 +472,7 @@ config FB_OF
 
 config FB_CONTROL
 	bool "Apple \"control\" display support"
-	depends on (FB = y) && PPC_PMAC && PPC32
+	depends on (FB = y) && ((PPC_PMAC && PPC32) || COMPILE_TEST)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index bd0f61d8bdb5..87cd817ad4c6 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -47,12 +47,25 @@
 #include <linux/nvram.h>
 #include <linux/adb.h>
 #include <linux/cuda.h>
+#ifdef CONFIG_PPC_PMAC
 #include <asm/prom.h>
 #include <asm/btext.h>
+#endif
 
 #include "macmodes.h"
 #include "controlfb.h"
 
+#ifndef CONFIG_PPC_PMAC
+#undef in_8
+#undef out_8
+#undef in_le32
+#undef out_le32
+#define in_8(addr)		0
+#define out_8(addr, val)
+#define in_le32(addr)		0
+#define out_le32(addr, val)
+#endif
+
 struct fb_par_control {
 	int	vmode, cmode;
 	int	xres, yres;
@@ -278,7 +291,9 @@ static int controlfb_mmap(struct fb_info *info,
 		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	} else {
 		/* framebuffer */
+#ifdef CONFIG_PPC_PMAC
 		vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
+#endif
 	}
 
 	return vm_iomap_memory(vma, start, len);
@@ -582,13 +597,14 @@ static void __init find_vram_size(struct fb_info_control *p)
 
 	out_8(&p->frame_buffer[0x600000], 0xb3);
 	out_8(&p->frame_buffer[0x600001], 0x71);
+#ifdef CONFIG_PPC_PMAC
 	asm volatile("eieio; dcbf 0,%0" : : "r" (&p->frame_buffer[0x600000])
 					: "memory" );
 	mb();
 	asm volatile("eieio; dcbi 0,%0" : : "r" (&p->frame_buffer[0x600000])
 					: "memory" );
 	mb();
-
+#endif
 	bank2 = (in_8(&p->frame_buffer[0x600000]) == 0xb3)
 		&& (in_8(&p->frame_buffer[0x600001]) == 0x71);
 
@@ -601,13 +617,14 @@ static void __init find_vram_size(struct fb_info_control *p)
 
 	out_8(&p->frame_buffer[0], 0x5a);
 	out_8(&p->frame_buffer[1], 0xc7);
+#ifdef CONFIG_PPC_PMAC
 	asm volatile("eieio; dcbf 0,%0" : : "r" (&p->frame_buffer[0])
 					: "memory" );
 	mb();
 	asm volatile("eieio; dcbi 0,%0" : : "r" (&p->frame_buffer[0])
 					: "memory" );
 	mb();
-
+#endif
 	bank1 = (in_8(&p->frame_buffer[0]) == 0x5a)
 		&& (in_8(&p->frame_buffer[1]) == 0xc7);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384E1BD6D4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 10:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB6B6ED7E;
	Wed, 29 Apr 2020 08:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412736ED7E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:07:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200429080407euoutp029eb6a7f7255d1450730bf5e1baa58797~KO7Bhi6kE2733527335euoutp02k
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:04:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200429080407euoutp029eb6a7f7255d1450730bf5e1baa58797~KO7Bhi6kE2733527335euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588147447;
 bh=8wZtlNmNqWWCVeLYNpsp4VIu5nk8QGOZAUKwMJbtN/c=;
 h=From:Subject:To:Cc:Date:References:From;
 b=HrWP0fNyONxEJwz4zWQk9srR6sqlY4W/4V6cJ43GjtvgLgYoZAuVyZIyTc7HcrP9s
 txYGPf3kcirkrEkloGb0ltrxnZOGCfN6coK69fc2a6lCkzuK/VKzCHxJkO5ccaclKq
 d6OTBdz7gSB0Jj+40gI4U9tlz+zvJlJfw4bNDy6Y=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200429080407eucas1p2398f54b5f3116b986dca2c0d9ea8aaed~KO7BT0cP-1544915449eucas1p2j;
 Wed, 29 Apr 2020 08:04:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 23.3E.60679.7F439AE5; Wed, 29
 Apr 2020 09:04:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200429080406eucas1p21147ed99ad98332729c2a2aff2a33fb2~KO7BBpZ9U1544915449eucas1p2i;
 Wed, 29 Apr 2020 08:04:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200429080406eusmtrp28f80f2181d97d267a8a40ba2cabbca4b~KO7A_lh_p1582015820eusmtrp23;
 Wed, 29 Apr 2020 08:04:06 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-22-5ea934f75dd1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 79.DB.07950.6F439AE5; Wed, 29
 Apr 2020 09:04:06 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200429080406eusmtip1e05c22505112d3c95906e63981b56f34~KO7Ap0eWQ2927929279eusmtip1E;
 Wed, 29 Apr 2020 08:04:06 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: controlfb: fix build for COMPILE_TEST=y &&
 PPC_PMAC=y && PPC32=n
To: Stephen Rothwell <sfr@canb.auug.org.au>, kbuild test robot <lkp@intel.com>
Message-ID: <ba50c26a-d69b-d88d-b34d-3194971b1018@samsung.com>
Date: Wed, 29 Apr 2020 10:04:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXe2s+NycpyGDxZpC4UEb2k00qRAaAaFH/pQYurKg4o6bUdn
 VoQZlNjNTFcNo5y2qYUu70qKzlsXNSnNZTcdi1SYRt6a6MzjmeS33/O8z+99/w+8BCZ6yXMn
 kuQZlEIuSxHjAm5jr/W971JwZUyAysCTlE58wyTDC7O45PWd3zzJx9YSXDJ9zYRLKqwNSNLQ
 NsI/zJdeNRpxadviU6607NUUR/rjZh9HWq4awaVztbsi8ShBaDyVkqSkFP5hcYLEocFabrpe
 eGG+eYmXg7Tb8pEDAWQw6Ho7eflIQIjICgTDg/04W8wj+Pmrm88WcwisZit3U7HUjdsVHYL+
 EZNdsSBY/nKXz0zh5EG4d6MKMexCyqB9vB1n2JWMhPLiasQIGPkcgaZIv34VQQjJMOgZiGJm
 uKQXWFUNG+528hT8Ge/iMSwkneHNI/NGCox0gzHzEw7LHtBkKcGYO4Gs4sOnoVGcjRoOi8+6
 +Sy7wHRfvZ13wloLIzNCNYLVvEm73YRAd99mt0Pg6+AyzqTDyL1Q0+rPto+ApqYUY9pAOoHR
 4syGcILCxgf2thDyrovYaW/Qa/X45rP5LZUYy1LomunAC9Bu9ZbV1FtWU29ZTf0/w1PErUJu
 VCadmkDR++RUlh8tS6Uz5Ql+59JSa9H6R3pn65tvRq0rZw2IJJDYUah3rIgR8WRKOjvVgIDA
 xK5CU6I2RiSMl2VfpBRpsYrMFIo2oB0EV+wmDNJMnRGRCbIMKpmi0inF5imHcHDPQYfmwv+G
 RpdMJgfpVQOlId/D6Y4gj4duuse0Z/GJyabEnvO8pElX2hh9eS1sT0S6rjR8efht6/EIvNPH
 1DW6cuXzB1vgAH57Zva0ubBOY8uNzR9zXnBXKwsqVo3HXpy8lOWZe9RrzNQXXz7hm+Z3K0Rb
 tl8cVlzvrcm2HAiIUxaJuXSiLNAHU9Cyf7P4oXlEAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7rfTFbGGex9p22x8OFdZosrX9+z
 WZzo+8BqcXnXHDaLV82P2CxW/NzKaLF171V2B3aPxhs32Dz2flvA4rF4z0smj/vdx5k8lky7
 yubxeZNcAFuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqR
 vl2CXsaFc5tYCjbwVnzZ8Z21gXEZdxcjJ4eEgInE280PWLsYuTiEBJYySjw+8Zuxi5EDKCEj
 cXx9GUSNsMSfa11sEDWvGSUmnnvFDJJgE7CSmNi+ihHEFhZIlNj3YB8bSK+IgJ/E3zO5IPXM
 AqsZJfa0X2QGifMK2EkcPRsFUs4ioCrxc9pWsFZRgQiJwztmgdm8AoISJ2c+YQGxmQXUJf7M
 u8QMYYtL3HoynwnClpfY/nYO8wRGgVlIWmYhaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OL
 S/PS9ZLzczcxAmNp27GfW3Ywdr0LPsQowMGoxMO7gWdFnBBrYllxZe4hRgkOZiUR3kcZy+KE
 eFMSK6tSi/Lji0pzUosPMZoCPTSRWUo0OR8Y53kl8YamhuYWlobmxubGZhZK4rwdAgdjhATS
 E0tSs1NTC1KLYPqYODilGhjn+yxbMStErUEh6tiGF6aTHOKKWs76THM5oKP/4TyXcdrUiNOy
 iyxPWSVxViUEfU6KOh1wkTPm9cttN0rjV63e/l146eISzqmv6nrC69+u05faMTNZw/nVJdvK
 6IVf018uuJi0qrbcttByprVIke9qqcnnfNtsshzbtjK4n7n42zVgtu3r/tNKLMUZiYZazEXF
 iQDxne+AuwIAAA==
X-CMS-MailID: 20200429080406eucas1p21147ed99ad98332729c2a2aff2a33fb2
X-Msg-Generator: CA
X-RootMTR: 20200429080406eucas1p21147ed99ad98332729c2a2aff2a33fb2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200429080406eucas1p21147ed99ad98332729c2a2aff2a33fb2
References: <CGME20200429080406eucas1p21147ed99ad98332729c2a2aff2a33fb2@eucas1p2.samsung.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


powerpc allyesconfig fails like this:

drivers/video/fbdev/controlfb.c: In function 'controlfb_mmap':
drivers/video/fbdev/controlfb.c:756:23: error: implicit declaration of function 'pgprot_cached_wthru'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
  756 |   vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
      |                       ^~~~~~~~~~~~~~~~~~~
      |                       pgprot_cached
drivers/video/fbdev/controlfb.c:756:23: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'

Fix it by adding missing PPC32 dependency.

Fixes: a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <lkp@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/controlfb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: b/drivers/video/fbdev/controlfb.c
===================================================================
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -47,7 +47,7 @@
 #include <linux/nvram.h>
 #include <linux/adb.h>
 #include <linux/cuda.h>
-#ifdef CONFIG_PPC_PMAC
+#if defined(CONFIG_PPC_PMAC) && defined(CONFIG_PPC32)
 #include <asm/prom.h>
 #include <asm/btext.h>
 #endif
@@ -55,7 +55,7 @@
 #include "macmodes.h"
 #include "controlfb.h"
 
-#ifndef CONFIG_PPC_PMAC
+#if !defined(CONFIG_PPC_PMAC) || !defined(CONFIG_PPC32)
 #define invalid_vram_cache(addr)
 #undef in_8
 #undef out_8
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

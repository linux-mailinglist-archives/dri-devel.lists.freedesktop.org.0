Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3736C13DDFB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F72B6EA93;
	Thu, 16 Jan 2020 14:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7E06EA93
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:51:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116145117euoutp017ea2f9a0c286beec74b1d2f61aa83fad~qZY1ZnhCO0710107101euoutp01z
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:51:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200116145117euoutp017ea2f9a0c286beec74b1d2f61aa83fad~qZY1ZnhCO0710107101euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579186277;
 bh=zM5QKDUUFvzxmck4BWoQ7EibKTrMCs6fH624KxIH7Jo=;
 h=From:Subject:To:Cc:Date:References:From;
 b=Nx70jCGHt8zusZVaJ62EXB+XAubmMAIuJT4X5FwYCSS9/Ox+GDwpS5TCWVBpQNbUE
 rXSD0GYZ0i8QwplwZthQhHaokBRtHBBE9zo72YnS0rETBdr0slOHEjKkjjEB3xykhN
 K+zRFW9XMCXegsvs53RGz08yBGfs+JiG+W0YlNW0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200116145116eucas1p1e42b04ca64c1403b153abc27e9a5c0cd~qZY1N42gL1036510365eucas1p1T;
 Thu, 16 Jan 2020 14:51:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 20.14.60679.468702E5; Thu, 16
 Jan 2020 14:51:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200116145116eucas1p2d512db3f05f01d87bc9039af5bf70af3~qZY016bKP0505605056eucas1p2B;
 Thu, 16 Jan 2020 14:51:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200116145116eusmtrp11db69222731b0e45a88d3414e3f6582f~qZY01Xt4Y1110811108eusmtrp14;
 Thu, 16 Jan 2020 14:51:16 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-70-5e20786426b2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 04.75.08375.468702E5; Thu, 16
 Jan 2020 14:51:16 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200116145115eusmtip1b9c1be999ff790774ec794ee71847d48~qZY0W6wQ43258232582eusmtip1g;
 Thu, 16 Jan 2020 14:51:15 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/2] video: fbdev: sh_mobile_lcdcfb: fix sparse warnings
 about using incorrect types
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <c687dbc5-cf5a-9508-2a61-e757a1a14568@samsung.com>
Date: Thu, 16 Jan 2020 15:51:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7opFQpxBl8WmVjcWneO1WLjjPWs
 Fle+vmezONH3gdXi8q45bA6sHve7jzN59G1ZxejxeZNcAHMUl01Kak5mWWqRvl0CV0bL6vmM
 Bcc4K+acOMXewDiZo4uRk0NCwETiwNX5jCC2kMAKRomVt9Qh7C+MEqeb+boYuYDsz4wS/ddm
 sMI0/Nx4lRUisZxRomP5bWaIjreMEv+buEBsNgEriYntq8CmCgukSXz7/o8JxBYRSJBYMX0G
 WJxZIF5iW/NRMJtXwE5iycN+oBoODhYBVYkvhw1AwqICERKfHhxmhSgRlDg58wkLRKu4xK0n
 85kgbHmJ7W/nMIPcIyHwm01iwduZbBCHukhM2X2dEcIWlnh1fAs7hC0jcXpyDwtEwzpGib8d
 L6C6tzNKLJ/8D6rbWuLOuV9sIBcxC2hKrN+lDxF2lNjbMYkdJCwhwCdx460gxBF8EpO2TWeG
 CPNKdLQJQVSrSWxYtoENZm3XzpXMELaHxNTGnSwTGBVnIXltFpLXZiF5bRbCDQsYWVYxiqeW
 FuempxYb5aWW6xUn5haX5qXrJefnbmIEppXT/45/2cG460/SIUYBDkYlHt4ZQQpxQqyJZcWV
 uYcYJTiYlUR4T86QjRPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampBahFM
 lomDU6qBUfOHRP6+qWwTtkR8+XauZ6rCN/Gzp/q8XU1EbvtN2Rv94em8incymsJ6r1NtGie/
 /ZL1QLc4f6L2m8bfC5Z4JC1x5D9VfHn2tculb7p/rTqhUWO0Ki3tHpd1G+usmZ1MCq08b0Sm
 urC1X9qySu5G0p3nBy5eSzFZ/bV3ZViL0r23DCetGWOWbVdiKc5INNRiLipOBABlbaKsJwMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42I5/e/4Xd2UCoU4gxs/ZC1urTvHarFxxnpW
 iytf37NZnOj7wGpxedccNgdWj/vdx5k8+rasYvT4vEkugDlKz6Yov7QkVSEjv7jEVina0MJI
 z9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL6Nl9XzGgmOcFXNOnGJvYJzM0cXIySEh
 YCLxc+NV1i5GLg4hgaWMEn2/3rF1MXIAJWQkjq8vg6gRlvhzrYsNouY1o8TSOxvZQRJsAlYS
 E9tXMYLYwgJpEptXvmIFsUUEEiSevp7PBmIzC8RLdG5rAKvhFbCTWPKwnwlkPouAqsSXwwYg
 YVGBCInDO2ZBlQhKnJz5hAWiVV3iz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSYhaRlFpKWWUha
 ZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwMrYd+7l5B+OljcGHGAU4GJV4eGcE
 KcQJsSaWFVfmHmKU4GBWEuE9OUM2Tog3JbGyKrUoP76oNCe1+BCjKdA/E5mlRJPzgVGbVxJv
 aGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBccKBug39lQd5IryUgxQ8
 Dwdw5Lpd3cm3RH2O5DFOo0mZMa0ZgTIi6389NVj8YcGjz8r31TTjX81a+LGbs+K31Jz5LVJf
 q8rVviv+qbkwz6rX9uKKyl1feIvWTGbevc46JPqE5+e9JZMOOKcUTg38OTNqocPuLVMecZ1d
 +0gh80j988l7ebz8i5VYijMSDbWYi4oTAWFq3yGiAgAA
X-CMS-MailID: 20200116145116eucas1p2d512db3f05f01d87bc9039af5bf70af3
X-Msg-Generator: CA
X-RootMTR: 20200116145116eucas1p2d512db3f05f01d87bc9039af5bf70af3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116145116eucas1p2d512db3f05f01d87bc9039af5bf70af3
References: <CGME20200116145116eucas1p2d512db3f05f01d87bc9039af5bf70af3@eucas1p2.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ->screen_buffer instead of ->screen_base to fix sparse warnings.

[ Please see commit 17a7b0b4d974 ("fb.h: Provide alternate screen_base
  pointer") for details. ]

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: b/drivers/video/fbdev/sh_mobile_lcdcfb.c
===================================================================
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1572,7 +1572,7 @@ sh_mobile_lcdc_overlay_fb_init(struct sh
 	info->flags = FBINFO_FLAG_DEFAULT;
 	info->fbops = &sh_mobile_lcdc_overlay_ops;
 	info->device = priv->dev;
-	info->screen_base = ovl->fb_mem;
+	info->screen_buffer = ovl->fb_mem;
 	info->par = ovl;
 
 	/* Initialize fixed screen information. Restrict pan to 2 lines steps
@@ -2056,7 +2056,7 @@ sh_mobile_lcdc_channel_fb_init(struct sh
 	info->flags = FBINFO_FLAG_DEFAULT;
 	info->fbops = &sh_mobile_lcdc_ops;
 	info->device = priv->dev;
-	info->screen_base = ch->fb_mem;
+	info->screen_buffer = ch->fb_mem;
 	info->pseudo_palette = &ch->pseudo_palette;
 	info->par = ch;
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

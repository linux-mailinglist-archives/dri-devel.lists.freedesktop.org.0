Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933FD1EA1F7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 12:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09726E22C;
	Mon,  1 Jun 2020 10:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332C86E22C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:37:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200601103701euoutp02d6b4de755534d4a9201f19b547c1e093~UZS8jZ61w1336113361euoutp02K
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:37:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200601103701euoutp02d6b4de755534d4a9201f19b547c1e093~UZS8jZ61w1336113361euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591007821;
 bh=/UMQHqTtHM5ikbtFOx1j0wz3rCuvK7jc3hS7HWS+nGw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=PSn/8IHcqu3IsJ7YUfJJyej7KsEFkbG/mltjXdz5vefOnn0woatdpo3N8LadrAPm4
 QdCUW0SxL8YlzYtK6CkNIwN+vohgCm6FxQHO8g8/jXDOwUg/XahydHH6ZN8DJu4J76
 rNOLhIJUJ4vcUGMmBbvKaBuQtGX9D1xGyWtdDduM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200601103701eucas1p155db4406e6f64904c8d6e3c0bc42ec32~UZS8VXS9q0313703137eucas1p1F;
 Mon,  1 Jun 2020 10:37:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5F.70.61286.D4AD4DE5; Mon,  1
 Jun 2020 11:37:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200601103700eucas1p29e06d187f744d086ac2cc3f4b37a8399~UZS79iiX-0485304853eucas1p2q;
 Mon,  1 Jun 2020 10:37:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200601103700eusmtrp1160fd800fdab63e14532ee97e815564c~UZS785TOA1200712007eusmtrp1W;
 Mon,  1 Jun 2020 10:37:00 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-af-5ed4da4d8437
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2A.1A.08375.C4AD4DE5; Mon,  1
 Jun 2020 11:37:00 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200601103700eusmtip1cf1797686670af94334216824ff56af5~UZS7lGa420450104501eusmtip1J;
 Mon,  1 Jun 2020 10:37:00 +0000 (GMT)
Subject: Re: [PATCH] video: uvesafb: use true,false for bool variables
To: Jason Yan <yanaijie@huawei.com>, Sam Ravnborg <sam@ravnborg.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <4b460d82-b23c-f6ce-6593-735a726e4d8a@samsung.com>
Date: Mon, 1 Jun 2020 12:37:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200422071845.403-1-yanaijie@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djP87q+t67EGay/xW1x5et7NosTfR9Y
 LS7vmsNmseLnVkaLKR+PM1ss2tPJ7MDmcfn7G2aPliNvWT3udx9n8lgy7Sqbx+dNcgGsUVw2
 Kak5mWWpRfp2CVwZbcteshZ0SFfsnfOIqYHxl2gXIyeHhICJxJ0Z/xm7GLk4hARWMEosO3Ge
 CSQhJPCFUWLtlWqIxGdGif3nJjPCdEx6cpYdIrGcUeLUuT2sEM5bRokJt5+DtQsLuEnM6/sH
 1iEi4CJxa+8zsDizQJFE342HrCA2m4CVxMT2VWA1vAJ2Eu1LJ4DFWQRUJO48fQtmiwpESHx6
 cJgVokZQ4uTMJywgNqeAucTb4x+ZIWaKS9x6Mh9qvrzE9rdzmEEOkhBYxy4xZ8IOdoizXSQa
 v7cyQ9jCEq+Ob4GKy0icntzDAtXAKPG34wVU93ZGieWT/7FBVFlL3Dn3C8jmAFqhKbF+lz5E
 2FHi/IHNYGEJAT6JG28FIY7gk5i0bTozRJhXoqNNCKJaTWLDsg1sMGu7dq5knsCoNAvJa7OQ
 vDMLyTuzEPYuYGRZxSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJEZh6Tv87/mkH49dLSYcY
 BTgYlXh4NS5djhNiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZpDhYlcV7j
 RS9jhQTSE0tSs1NTC1KLYLJMHJxSDYxix3QDtuppcsVyKT3VvMN5c51n0o9AR8Wgg6p536q/
 V/9b97tySpX8/wWlJdHJWVwqKx9mfDymEL05aY5IiXFuo67PVcFlX67Mb56T69rY5T3nQsNK
 K59vdbe+m7ibVIi7yXSyMfBH7pdt4p/PzpjxrX3+2lRey6cCU/SeG98/fdU5fz5boRJLcUai
 oRZzUXEiANKSy9I5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7o+t67EGTxcbmxx5et7NosTfR9Y
 LS7vmsNmseLnVkaLKR+PM1ss2tPJ7MDmcfn7G2aPliNvWT3udx9n8lgy7Sqbx+dNcgGsUXo2
 RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZbcteshZ0
 SFfsnfOIqYHxl2gXIyeHhICJxKQnZ9m7GLk4hASWMko0/N/N2MXIAZSQkTi+vgyiRljiz7Uu
 NhBbSOA1o8ST54ogtrCAm8S8vn+MILaIgIvErb3PmCDmdDFKvLp3lA1kDrNAkcSjg6ogNWwC
 VhIT21eB1fMK2Em0L53ACmKzCKhI3Hn6FswWFYiQOLxjFlSNoMTJmU9YQGxOAXOJt8c/MoPY
 zALqEn/mXYKyxSVuPZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWG
 esWJucWleel6yfm5mxiBcbbt2M/NOxgvbQw+xCjAwajEw3vh/OU4IdbEsuLK3EOMEhzMSiK8
 TmdPxwnxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjAF5JXEG5oamltYGpobmxubWSiJ83YI
 HIwREkhPLEnNTk0tSC2C6WPi4JRqYGxs9XVf0fO/etVeU81I1a7r+kEdL4+nly9cXJZw2SHh
 r9XGv7J5d0rKgud6TSrUfDhFYsbX1lKv9FP32eVcTW2//jISNv7lcL2c3f4Wq/2+eXNtmus+
 sDspH/KavPmlTleN+pprLbIi11YZqPy56VxxdWl5Uf+ZuxZ6mztSFZUqxE97RFxMVmIpzkg0
 1GIuKk4EAJAGurPJAgAA
X-CMS-MailID: 20200601103700eucas1p29e06d187f744d086ac2cc3f4b37a8399
X-Msg-Generator: CA
X-RootMTR: 20200422071952eucas1p219bc9ef0a74220149966ecb03688681c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200422071952eucas1p219bc9ef0a74220149966ecb03688681c
References: <CGME20200422071952eucas1p219bc9ef0a74220149966ecb03688681c@eucas1p2.samsung.com>
 <20200422071845.403-1-yanaijie@huawei.com>
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
Cc: spock@gentoo.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 4/22/20 9:18 AM, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/video/fbdev/uvesafb.c:48:12-17: WARNING: Assignment of 0/1 to
> bool variable
> drivers/video/fbdev/uvesafb.c:1827:3-13: WARNING: Assignment of 0/1 to
> bool variable
> drivers/video/fbdev/uvesafb.c:1829:3-13: WARNING: Assignment of 0/1 to
> bool variable
> drivers/video/fbdev/uvesafb.c:1835:3-9: WARNING: Assignment of 0/1 to
> bool variable
> drivers/video/fbdev/uvesafb.c:1837:3-9: WARNING: Assignment of 0/1 to
> bool variable
> drivers/video/fbdev/uvesafb.c:1839:3-8: WARNING: Assignment of 0/1 to
> bool variable
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/video/fbdev/uvesafb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
> index 1b385cf76110..bee29aadc646 100644
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -45,7 +45,7 @@ static const struct fb_fix_screeninfo uvesafb_fix = {
>  };
>  
>  static int mtrr		= 3;	/* enable mtrr by default */
> -static bool blank	= 1;	/* enable blanking by default */
> +static bool blank	= true;	/* enable blanking by default */
>  static int ypan		= 1;	/* 0: scroll, 1: ypan, 2: ywrap */
>  static bool pmi_setpal	= true; /* use PMI for palette changes */
>  static bool nocrtc;		/* ignore CRTC settings */
> @@ -1824,19 +1824,19 @@ static int uvesafb_setup(char *options)
>  		else if (!strcmp(this_opt, "ywrap"))
>  			ypan = 2;
>  		else if (!strcmp(this_opt, "vgapal"))
> -			pmi_setpal = 0;
> +			pmi_setpal = false;
>  		else if (!strcmp(this_opt, "pmipal"))
> -			pmi_setpal = 1;
> +			pmi_setpal = true;
>  		else if (!strncmp(this_opt, "mtrr:", 5))
>  			mtrr = simple_strtoul(this_opt+5, NULL, 0);
>  		else if (!strcmp(this_opt, "nomtrr"))
>  			mtrr = 0;
>  		else if (!strcmp(this_opt, "nocrtc"))
> -			nocrtc = 1;
> +			nocrtc = true;
>  		else if (!strcmp(this_opt, "noedid"))
> -			noedid = 1;
> +			noedid = true;
>  		else if (!strcmp(this_opt, "noblank"))
> -			blank = 0;
> +			blank = true;

The above conversion is incorrect.

The follow-up fix is included below (the original patch has been
already applied).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: uvesafb: fix "noblank" option handling

Fix the recent regression.

Fixes: dbc7ece12a38 ("video: uvesafb: use true,false for bool variables")
Cc: Jason Yan <yanaijie@huawei.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Januszewski <spock@gentoo.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/uvesafb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/video/fbdev/uvesafb.c
===================================================================
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1836,7 +1836,7 @@ static int uvesafb_setup(char *options)
 		else if (!strcmp(this_opt, "noedid"))
 			noedid = true;
 		else if (!strcmp(this_opt, "noblank"))
-			blank = true;
+			blank = false;
 		else if (!strncmp(this_opt, "vtotal:", 7))
 			vram_total = simple_strtoul(this_opt + 7, NULL, 0);
 		else if (!strncmp(this_opt, "vremap:", 7))
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

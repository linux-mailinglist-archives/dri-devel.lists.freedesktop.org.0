Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07326175E90
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BA26E4C9;
	Mon,  2 Mar 2020 15:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177436E359
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:43:03 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154301euoutp015c81893d942c0dedf7ca3e73f7dee5db~4hxJWZ2Rb1330713307euoutp01L
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:43:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200302154301euoutp015c81893d942c0dedf7ca3e73f7dee5db~4hxJWZ2Rb1330713307euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163781;
 bh=5YJmkzqSvsOl8Ktv0uRw2gsQLS0X8Ye3zrrzqfkrg18=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=S/K7AocXxU3JkFZvlxrG/fOl6z6WxxHIJ8pch7UNdQ5GtblGGuCRZUWCBqy0uz0KL
 sxlAk7H7JLxq68JN/aiXvApk6XVVumoT7UVmnyFq9TA0OoKEzQTgbIrWjubMl8yXMQ
 c4HxyOA0mL+rQTgZB3SZp7I+QGazXt1BFyNYDsZc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200302154301eucas1p2ba9a21a5c8aeeb1d5c68c8bc609a4b32~4hxI_wW7n1937719377eucas1p20;
 Mon,  2 Mar 2020 15:43:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 35.AD.61286.5892D5E5; Mon,  2
 Mar 2020 15:43:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154301eucas1p15080111e25e2a09f1848a659f3288b2b~4hxIsLcJJ1688016880eucas1p1f;
 Mon,  2 Mar 2020 15:43:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154301eusmtrp1f04d5a60bc8a020d9172c153cd2f87ad~4hxIroKlY2927629276eusmtrp1v;
 Mon,  2 Mar 2020 15:43:01 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-48-5e5d2985c20f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 31.10.07950.5892D5E5; Mon,  2
 Mar 2020 15:43:01 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154300eusmtip1cb8d74e6d2819f4b0f7e39596efad4c5~4hxIZzkNw2417824178eusmtip1-;
 Mon,  2 Mar 2020 15:43:00 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: Replace zero-length array with flexible-array
 member
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <98cf9000-7ba4-afa6-345e-f170216c6847@samsung.com>
Date: Mon, 2 Mar 2020 16:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200221160005.GA13552@embeddedor>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOd1Wzdg4g8bzkhZXvr5ns9i6R9Xi
 RN8HVovLu+awObB4rDuo6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZyzr7mAoWiVdsXrmM
 sYHxp1AXIyeHhICJxPNF19m6GLk4hARWMEocO7ESyvnCKLF70w0mkCohgc+MEhOXqcB0tK64
 wgpRtJxR4sKW08wQzltGicvrL7OAVLEJWElMbF/FCGILCwRJXDqyASwuImAkMXtGNyuIzSyQ
 IHF60T2wOK+AncSjmWfA4iwCKhL/Xv1lBrFFBSIkPj04zApRIyhxcuYTsHpOAQOJ6ds+MULM
 EZe49WQ+E4QtL7H97RxmiEu72SWer3GBsF0kfjy/AxUXlnh1fAs7hC0jcXpyDwvIAxIC6xgl
 /na8YIZwtjNKLJ/8jw2iylrizrlfQDYH0AZNifW79CHCjhIrGlaygoQlBPgkbrwVhLiBT2LS
 tunMEGFeiY42aFCrSWxYtoENZm3XzpXMExiVZiH5bBaSb2Yh+WYWwt4FjCyrGMVTS4tz01OL
 DfNSy/WKE3OLS/PS9ZLzczcxApPJ6X/HP+1g/Hop6RCjAAejEg9vAHNsnBBrYllxZe4hRgkO
 ZiURXl/O6Dgh3pTEyqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUa
 GPfK83NxB0z5cmfnq8iL3bcuWX8PFtR4aRLr/+jcze+/npm8mPdkoqP4iZOdHJ9fbwu+zGq2
 fs6nLvPLd26KeD9hev/obV0X59KSE0ce3b14Tejrj6PL5rhHuohKtPMc6cvKXh/Ltdp0WpXC
 edbufdP5lv/Ov5i18S6jQ+7num33n2rrvraUuG2vxFKckWioxVxUnAgAj9t3xCIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7qtmrFxBteesVlc+fqezWLrHlWL
 E30fWC0u75rD5sDise6gqsf97uNMHp83yQUwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY
 6hkam8daGZkq6dvZpKTmZJalFunbJehlLOvsYypYJF6xeeUyxgbGn0JdjJwcEgImEq0rrrB2
 MXJxCAksZZRY9LWRsYuRAyghI3F8fRlEjbDEn2tdbBA1rxklPk6dxgySYBOwkpjYvooRxBYW
 CJK4dGQDC4gtImAkMXtGNyvIHGaBBIln81IgepsZJa5+3A9WzytgJ/Fo5hlWEJtFQEXi36u/
 YDNFBSIkDu+YBVUjKHFy5hOwmZwCBhLTt30CizMLqEv8mXeJGcIWl7j1ZD4ThC0vsf3tHOYJ
 jEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRGz7ZjP7fsYOx6
 F3yIUYCDUYmH9wdDbJwQa2JZcWXuIUYJDmYlEV5fzug4Id6UxMqq1KL8+KLSnNTiQ4ymQM9N
 ZJYSTc4HRnZeSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZGwUm5
 MeGcahbbmV5+XZq3WfWBmIZOZYLCcUFZe7UFRdutSpPeFIcZ20qfn7hiQeSxd89P1Eufq+q5
 XXc37V1ZBv/Ma6mp8zROGegXfb297CjvUpWEizY/g5Zrh5zc989jW+nvPJN+oxPuCpe/eknv
 WyD6YCK7yZK/Z+16pI5JOG96zS5/1+abEktxRqKhFnNRcSIA2ZHYkLQCAAA=
X-CMS-MailID: 20200302154301eucas1p15080111e25e2a09f1848a659f3288b2b
X-Msg-Generator: CA
X-RootMTR: 20200221155727eucas1p13764b85076c6fc29eccaf27ab6dc4967
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200221155727eucas1p13764b85076c6fc29eccaf27ab6dc4967
References: <CGME20200221155727eucas1p13764b85076c6fc29eccaf27ab6dc4967@eucas1p1.samsung.com>
 <20200221160005.GA13552@embeddedor>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/21/20 5:00 PM, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://protect2.fireeye.com/url?k=0e91e8f4-53f6acd2-0e9063bb-0cc47a31384a-8666d8e5380b9caf&u=https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch queued for v5.7, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/mmp/hw/mmp_ctrl.h | 2 +-
>  drivers/video/fbdev/ssd1307fb.c       | 2 +-
>  include/video/mmp_disp.h              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.h b/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
> index 335d4983dc52..167585a889d3 100644
> --- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
> +++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
> @@ -1406,7 +1406,7 @@ struct mmphw_ctrl {
>  
>  	/*pathes*/
>  	int path_num;
> -	struct mmphw_path_plat path_plats[0];
> +	struct mmphw_path_plat path_plats[];
>  };
>  
>  static inline int overlay_is_vid(struct mmp_overlay *overlay)
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 142535267fec..fb2640fe575a 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -89,7 +89,7 @@ struct ssd1307fb_par {
>  
>  struct ssd1307fb_array {
>  	u8	type;
> -	u8	data[0];
> +	u8	data[];
>  };
>  
>  static const struct fb_fix_screeninfo ssd1307fb_fix = {
> diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
> index 1f9bc133e230..77252cb46361 100644
> --- a/include/video/mmp_disp.h
> +++ b/include/video/mmp_disp.h
> @@ -231,7 +231,7 @@ struct mmp_path {
>  
>  	/* layers */
>  	int overlay_num;
> -	struct mmp_overlay overlays[0];
> +	struct mmp_overlay overlays[];
>  };
>  
>  extern struct mmp_path *mmp_get_path(const char *name);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698881EA4EC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 15:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896586E09A;
	Mon,  1 Jun 2020 13:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0A26E09A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200601132530euoutp01ab8bb4830946796288672e54079d7900~UbmDUHdgF2599325993euoutp01C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 13:25:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200601132530euoutp01ab8bb4830946796288672e54079d7900~UbmDUHdgF2599325993euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591017930;
 bh=7MYfA7T1V2zf0ITQLbcPCa/EsxPMtj591hArtPdOjMw=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=G6EVZ06pRJJULZiV8S7AVTH/3ncNkfYaIcWhbeuLOLPrZWKG/W5wlpGKUIpMaRhjv
 DAorg2ctcMO5q+9C4UknJo+QbLjloH9IPsSM6T/KU6ExB5ZFwwyBqzMHDGNhM6JJiu
 SereMKlyB9KM9zu6Zen44NS+u1OuvrF1QVyCZ2kI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200601132530eucas1p19a24e5bd23ad1d0190549ddb8bf39910~UbmDLs-Sf1285112851eucas1p1o;
 Mon,  1 Jun 2020 13:25:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id AB.14.61286.AC105DE5; Mon,  1
 Jun 2020 14:25:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200601132530eucas1p273e2fc07bcc82b5acdc6329853398e59~UbmC5ESkn2293122931eucas1p2i;
 Mon,  1 Jun 2020 13:25:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200601132530eusmtrp2e22ef13b605eb5f0be3d4bec7968535b~UbmC4V9au1059710597eusmtrp2s;
 Mon,  1 Jun 2020 13:25:30 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-d3-5ed501caf24b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DC.95.07950.9C105DE5; Mon,  1
 Jun 2020 14:25:30 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200601132529eusmtip144ca8a4d65015ef72f79683e359a1e3b~UbmCifbJL1117511175eusmtip1Q;
 Mon,  1 Jun 2020 13:25:29 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [trivial PATCH] video: fbdev: Use IS_BUILTIN
To: Joe Perches <joe@perches.com>
Message-ID: <465a04eb-cd2e-d0da-b667-584d297a0102@samsung.com>
Date: Mon, 1 Jun 2020 15:25:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2zmbR2l6nJovGqWjrMy0UT9WmqQUrH/1Q8ku2lFPOtqm7TjT
 IrI/mQs1NVCXtfCSNnQuXU4NzBSc5TVviCQGmpuSWF4ItSwPZ5L/nve5fO/7wEdgoiq+DyFX
 pdFqFaUQC1zwpq61/qOf0Gjssa55kXRkdVEgfTY1jUsbpsf40u68H3zpcGvZFleZj0tLBtp4
 Z5xkU4+tPFlj5X3ZimEMky037L2AX3YJS6QV8nRaHRJ+3SX5Q2kRSv15MMPy/TmehTb8tMiZ
 APIEvLDk87TIhRCRNQhqSysQN6wgyH2vdSjLCD4PTThtR+pHe504oRpBV8E3nBsWEGTn2DDW
 JSBPQUG2AbHYgzwJje3mLRNBeJL+MGl2Y/0YaUVgLawUsB4hGQ761qeI9eDkfuh+48bSXuQl
 WPrayecs7vCxdAZnsTN5Hppzh3ksxkhvmJjRO/A+sCyUYez7QBqdoD2rF3FXn4WKmgIBhz1g
 3mp2tNkDf1v0PEcAwZ9HdkfagqC6aNORCIUv/esC9jqMPAz1rSEcHQG9g3M8lgbSFcYX3Lkj
 XKGwqRjjaCE8eiji3AFgemUSbK/VtrzGniCxbkc13Y46uh11dP/3vkS4AXnTGkaZRDMSFX07
 mKGUjEaVFJyQomxAW5+nZ9O61IxWh+I7EEkg8S6haWokVsSn0plMZQcCAhN7CiP7emJFwkQq
 8w6tTolTaxQ004F8CVzsLTxePndNRCZRafRNmk6l1dsqj3D2yULyplpzQqQtetrIXO1VHAhO
 jsuYDe9czifS5HWGmOK3ecFtxkN+R6Iy9YZoSaiOSIrqM95V577bsIetLeZEGKtKqJragSCb
 l75k9+mYhf6l2R7/SI0hXj4fP24uDzzXb3OuM1gmLw7afX9f2bwxalH+urceIVEGPbCv3TIF
 ZIhxJpmSBGJqhvoHW5fcpzgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xu7qnGK/GGfSZWlz5+p7NYvb9xywW
 mx5fY7U40feB1eLyrjlAsSX9LBYzzu9jcmD3uN99nMlj85J6jy+rrjF7fN4kF8ASpWdTlF9a
 kqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdxcOZkxoKP6hXb
 38xlaWD8rdDFyMkhIWAisf7qGXYQW0hgKaPE19tWXYwcQHEZiePryyBKhCX+XOti62LkAip5
 zSixe+lVNpAEm4CVxMT2VYwgtrCApcTmA1tYQHpFBBQl7m7hB6lnFjjOKPHlxBZWiOY5jBI7
 Xt0Aa+AVsJOYv2sKI0gDi4CKxImN/CBhUYEIicM7ZkGVCEqcnPmEBcTmFPCU2NF7mQnEZhZQ
 l/gz7xIzhC0ucevJfKi4vMT2t3OYJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFec
 mFtcmpeul5yfu4kRGGPbjv3csoOx613wIUYBDkYlHt4N96/ECbEmlhVX5h5ilOBgVhLhdTp7
 Ok6INyWxsiq1KD++qDQntfgQoynQbxOZpUST84Hxn1cSb2hqaG5haWhubG5sZqEkztshcDBG
 SCA9sSQ1OzW1ILUIpo+Jg1OqgXGK5b15//Vnf/2SrPblSUDGonXJ24J2b5/+1PRontf/lSI5
 7peD39QvmcS2NkLLXWXC1BU6WxkfpFf3zX7pHlKsr3K/XcHqcuyjyG/Xp9xdelAj/XKmRBPr
 NWUhHp3ykLMXImVvzj3EK1/nMbcuY3NFLW8c2+5tPrsrhdJPnOiIPjRDZ7v5mlolluKMREMt
 5qLiRABw3u1dxwIAAA==
X-CMS-MailID: 20200601132530eucas1p273e2fc07bcc82b5acdc6329853398e59
X-Msg-Generator: CA
X-RootMTR: 20200504232908eucas1p296927bc7c736ad924cefaea9a546459d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504232908eucas1p296927bc7c736ad924cefaea9a546459d
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/5/20 1:29 AM, Joe Perches wrote:
> IS_BUILTIN can be use to replace various initializations
> like #if CONFIG_<FOO> int val = 1; #else int val = 0; #endif
> so do so.
> 
> Signed-off-by: Joe Perches <joe@perches.com>


Applied to drm-misc-next tree (patch should show up in v5.9), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/aty/aty128fb.c     | 6 +-----
>  drivers/video/fbdev/aty/atyfb_base.c   | 7 +------
>  drivers/video/fbdev/aty/radeon_base.c  | 6 +-----
>  drivers/video/fbdev/nvidia/nvidia.c    | 6 +-----
>  drivers/video/fbdev/omap/omapfb_main.c | 6 +-----
>  drivers/video/fbdev/riva/fbdev.c       | 6 +-----
>  drivers/video/fbdev/s3c2410fb.c        | 6 +-----
>  7 files changed, 7 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
> index d05d4195acad..6fae6ad6cb77 100644
> --- a/drivers/video/fbdev/aty/aty128fb.c
> +++ b/drivers/video/fbdev/aty/aty128fb.c
> @@ -384,11 +384,7 @@ static int default_lcd_on = 1;
>  static bool mtrr = true;
>  
>  #ifdef CONFIG_FB_ATY128_BACKLIGHT
> -#ifdef CONFIG_PMAC_BACKLIGHT
> -static int backlight = 1;
> -#else
> -static int backlight = 0;
> -#endif
> +static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
>  #endif
>  
>  /* PLL constants */
> diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
> index 49d192869cf5..23a29d61c2a2 100644
> --- a/drivers/video/fbdev/aty/atyfb_base.c
> +++ b/drivers/video/fbdev/aty/atyfb_base.c
> @@ -317,12 +317,7 @@ static int mclk;
>  static int xclk;
>  static int comp_sync = -1;
>  static char *mode;
> -
> -#ifdef CONFIG_PMAC_BACKLIGHT
> -static int backlight = 1;
> -#else
> -static int backlight = 0;
> -#endif
> +static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
>  
>  #ifdef CONFIG_PPC
>  static int default_vmode = VMODE_CHOOSE;
> diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
> index e116a3f9ad56..3fe509cb9b87 100644
> --- a/drivers/video/fbdev/aty/radeon_base.c
> +++ b/drivers/video/fbdev/aty/radeon_base.c
> @@ -269,11 +269,7 @@ static bool force_measure_pll = 0;
>  static bool nomtrr = 0;
>  static bool force_sleep;
>  static bool ignore_devlist;
> -#ifdef CONFIG_PMAC_BACKLIGHT
> -static int backlight = 1;
> -#else
> -static int backlight = 0;
> -#endif
> +static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
>  
>  /* Note about this function: we have some rare cases where we must not schedule,
>   * this typically happen with our special "wake up early" hook which allows us to
> diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
> index c24de9107958..c6820e21875d 100644
> --- a/drivers/video/fbdev/nvidia/nvidia.c
> +++ b/drivers/video/fbdev/nvidia/nvidia.c
> @@ -74,11 +74,7 @@ static int vram = 0;
>  static int bpp = 8;
>  static int reverse_i2c;
>  static bool nomtrr = false;
> -#ifdef CONFIG_PMAC_BACKLIGHT
> -static int backlight = 1;
> -#else
> -static int backlight = 0;
> -#endif
> +static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
>  
>  static char *mode_option = NULL;
>  
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
> index 1a9d6242916e..0cbcc74fa943 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -34,11 +34,7 @@ static unsigned long	def_vyres;
>  static unsigned int	def_rotate;
>  static unsigned int	def_mirror;
>  
> -#ifdef CONFIG_FB_OMAP_MANUAL_UPDATE
> -static bool		manual_update = 1;
> -#else
> -static bool		manual_update;
> -#endif
> +static bool	manual_update = IS_BUILTIN(CONFIG_FB_OMAP_MANUAL_UPDATE);
>  
>  static struct platform_device	*fbdev_pdev;
>  static struct lcd_panel		*fbdev_panel;
> diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
> index 764ec3285e62..9b3493846f4d 100644
> --- a/drivers/video/fbdev/riva/fbdev.c
> +++ b/drivers/video/fbdev/riva/fbdev.c
> @@ -202,11 +202,7 @@ static int flatpanel = -1; /* Autodetect later */
>  static int forceCRTC = -1;
>  static bool noaccel  = 0;
>  static bool nomtrr = 0;
> -#ifdef CONFIG_PMAC_BACKLIGHT
> -static int backlight = 1;
> -#else
> -static int backlight = 0;
> -#endif
> +static int backlight = IS_BUILTIN(CONFIG_PMAC_BACKLIGHT);
>  
>  static char *mode_option = NULL;
>  static bool strictmode       = 0;
> diff --git a/drivers/video/fbdev/s3c2410fb.c b/drivers/video/fbdev/s3c2410fb.c
> index 2fb15a540167..6f8fa501583f 100644
> --- a/drivers/video/fbdev/s3c2410fb.c
> +++ b/drivers/video/fbdev/s3c2410fb.c
> @@ -44,11 +44,7 @@
>  #include "s3c2410fb.h"
>  
>  /* Debugging stuff */
> -#ifdef CONFIG_FB_S3C2410_DEBUG
> -static int debug	= 1;
> -#else
> -static int debug;
> -#endif
> +static int debug = IS_BUILTIN(CONFIG_FB_S3C2410_DEBUG);
>  
>  #define dprintk(msg...) \
>  do { \
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

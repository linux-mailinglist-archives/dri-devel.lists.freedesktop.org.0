Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E618CDD2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 13:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CCF6EB18;
	Fri, 20 Mar 2020 12:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742AA6EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:22:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200320122203euoutp02b9c244f9fef483d568c69c43a0cce320~_Ao0FmlUB0225002250euoutp02-
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:22:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200320122203euoutp02b9c244f9fef483d568c69c43a0cce320~_Ao0FmlUB0225002250euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584706923;
 bh=7DqLPwT9jbPp3D97g2+PtisAfL6UoBNG8W7Dxa+4fzE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=h1+6GomsQX8LYM/ct8EeOjZlXHjv1/biu7yjoMVwl7w//5Y0TOw/WzfX8p4AoZlKW
 PKsRU9kOxwi6pDOelVvUYxhiL41aDqkaMTXYtcVuKcJzYUfgoBG8gsgVk0W0pHznj6
 Emz/1aXR3N3JYkouVigujO2mP21QTJn962eEM8aA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200320122203eucas1p2796c4346372fcca05d81513f0755c00a~_Aoz6LGEB1895918959eucas1p2E;
 Fri, 20 Mar 2020 12:22:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FB.E7.60679.B65B47E5; Fri, 20
 Mar 2020 12:22:03 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200320122202eucas1p1747dddcf74680d35fadb4a48b7271b86~_AozhKBc21554515545eucas1p1r;
 Fri, 20 Mar 2020 12:22:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200320122202eusmtrp1b7f2d5df9f18069507bdf47c13200529~_AozgdfDj0150901509eusmtrp1G;
 Fri, 20 Mar 2020 12:22:02 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-a6-5e74b56b7a44
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 21.DD.08375.A65B47E5; Fri, 20
 Mar 2020 12:22:02 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200320122202eusmtip1e694c85f6bd876b4852242dc1648c826~_AozKCLoy0224302243eusmtip1R;
 Fri, 20 Mar 2020 12:22:02 +0000 (GMT)
Subject: Re: [PATCH v2] fbdev: s1d13xxxfb: add missed unregister_framebuffer
 in remove
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <eda0b4c0-93ff-dfb3-4f63-907a8bef01ec@samsung.com>
Date: Fri, 20 Mar 2020 13:22:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200310143033.5098-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7rZW0viDO5NF7e48vU9m8XsQy+Z
 LeadlLA40feB1eLyrjlsDqweO2fdZfe4332cyePzJrkA5igum5TUnMyy1CJ9uwSujNkvexgL
 eoQqTtw/wdbAeJOvi5GTQ0LARKKv8TVzFyMXh5DACkaJVSfnsYMkhAS+MErc/MUIkfjMKHG5
 eTUrTMffm91QieWMEu9+XmCDcN4ySpy4cZMZpEpYIEJi/pw+MFtEQF3i866dYGOZBaYySry+
 lQtiswlYSUxsX8UIYvMK2Encn3gVaBAHB4uAqsSmw7IgYVGgMZ8eHGaFKBGUODnzCQuIzSlg
 KTFn7j4miJHiEreezIey5SW2v50D9o6EwGR2ifU31zBBXO0i0bT8LguELSzx6vgWdghbRuL0
 5B4WiIZ1jBJ/O15AdW9nlFg++R8bRJW1xJ1zv8CuYxbQlFi/Sx/ElBBwlNjx2hLC5JO48VYQ
 4gY+iUnbpjNDhHklOtqEIGaoSWxYtoENZmvXzpXMExiVZiH5bBaSb2Yh+WYWwtoFjCyrGMVT
 S4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAtPK6X/Hv+xg3PUn6RCjAAejEg+vxcqSOCHWxLLi
 ytxDjBIczEoivLrpxXFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnNTk0tSC2C
 yTJxcEo1MMbu16/O6G3KMNK7IGH6dG3I0nPq8UyHl6me98o63KF+XOhq9Vx7q1+5QWK2rj+S
 xSY4n7qh5bPGrzBz96XDfZrOR32mrNp2q3yqNSc/39aHT9flPZkXyKydtvGtpdjinKx8FTm1
 uZkL/b8LapyOVLnhtkVeoDHoiluZM/fPNXV37i1YxFHIp8RSnJFoqMVcVJwIABhaXwYnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7pZW0viDKY8Nbe48vU9m8XsQy+Z
 LeadlLA40feB1eLyrjlsDqweO2fdZfe4332cyePzJrkA5ig9m6L80pJUhYz84hJbpWhDCyM9
 Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jNkvexgLeoQqTtw/wdbAeJOvi5GTQ0LA
 ROLvzW5GEFtIYCmjxI1dml2MHEBxGYnj68sgSoQl/lzrYuti5AIqec0ocW/FAhaQhLBAhMT8
 OX3MILaIgLrE51072UGKmAWmMkpM6JzICNHRwyjx5PgrJpAqNgEriYntq8C28QrYSdyfeJUN
 ZBuLgKrEpsOyIGFRoKGHd8yCKhGUODnzCdgyTgFLiTlz94GNYQZa9mfeJWYIW1zi1pP5UHF5
 ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwkrYd
 +7l5B+OljcGHGAU4GJV4eC1WlsQJsSaWFVfmHmKU4GBWEuHVTS+OE+JNSaysSi3Kjy8qzUkt
 PsRoCvTbRGYp0eR8YJTnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+Lg
 lGpg5HNkk/5h5/qk1XjvwR+fDkeH7Li58tq2VSqHnm3PvWx8/ZpG05u1B562b5Q7I5Dx+UL8
 2kMvoi+2ur7iL8zc41rkanXm6IJbQi+Y/gcHRQZL6Z9Z1rm3cWb268zfZrcrWjLuqa1Nj3O+
 tu8Ql+N2nkKmEr2UmHTW/7+l+mojzjz+2JHkt91aT4mlOCPRUIu5qDgRAI+TI5W6AgAA
X-CMS-MailID: 20200320122202eucas1p1747dddcf74680d35fadb4a48b7271b86
X-Msg-Generator: CA
X-RootMTR: 20200310143051eucas1p2ad43ac5aee1f9132db0c377212ec8419
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200310143051eucas1p2ad43ac5aee1f9132db0c377212ec8419
References: <CGME20200310143051eucas1p2ad43ac5aee1f9132db0c377212ec8419@eucas1p2.samsung.com>
 <20200310143033.5098-1-hslester96@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/10/20 3:30 PM, Chuhong Yuan wrote:
> The driver calls register_framebuffer() in probe but does not call
> unregister_framebuffer() in remove.
> Rename current remove to __s1d13xxxfb_remove() for error handler.
> Then add a new remove to call unregister_framebuffer().
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
> Changes in v2:
>   - Rename the existing remove and add a new one to ensure the correctness
>     of error handler in probe.
> 
>  drivers/video/fbdev/s1d13xxxfb.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
> index 8048499e398d..bafea3d09bba 100644
> --- a/drivers/video/fbdev/s1d13xxxfb.c
> +++ b/drivers/video/fbdev/s1d13xxxfb.c
> @@ -721,9 +721,8 @@ static void s1d13xxxfb_fetch_hw_state(struct fb_info *info)
>  		xres, yres, xres_virtual, yres_virtual, is_color, is_dual, is_tft);
>  }
>  
> -
>  static int
> -s1d13xxxfb_remove(struct platform_device *pdev)
> +__s1d13xxxfb_remove(struct platform_device *pdev)

The new function can be made void as it always returns 0.

Also please use the standard CodingStyle while at it:

void __s1d13xxxfb_remove(struct platform_device *pdev)

>  {
>  	struct fb_info *info = platform_get_drvdata(pdev);
>  	struct s1d13xxxfb_par *par = NULL;
> @@ -752,6 +751,18 @@ s1d13xxxfb_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int
> +s1d13xxxfb_remove(struct platform_device *pdev)

Please use the standard CodingStyle while at it:

static int s1d13xxxfb_remove(struct platform_device *pdev)

> +{
> +	struct fb_info *info = platform_get_drvdata(pdev);
> +
> +	if (info)

'info' check is superfluous in the ->remove only code-path.

> +		unregister_framebuffer(info);
> +
> +	return __s1d13xxxfb_remove(pdev);
> +}
> +
> +
>  static int s1d13xxxfb_probe(struct platform_device *pdev)
>  {
>  	struct s1d13xxxfb_par *default_par;
> @@ -895,7 +906,7 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
>  	return 0;
>  
>  bail:
> -	s1d13xxxfb_remove(pdev);
> +	__s1d13xxxfb_remove(pdev);
>  	return ret;
>  
>  }
> 

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

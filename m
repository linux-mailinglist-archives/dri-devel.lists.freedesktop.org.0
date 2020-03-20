Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA518CD62
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 13:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0840689950;
	Fri, 20 Mar 2020 12:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1648989350
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:01:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200320120110euoutp02a765e199a8689a2714348e8c73362246~_AWlRb6IS2159721597euoutp02-
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:01:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200320120110euoutp02a765e199a8689a2714348e8c73362246~_AWlRb6IS2159721597euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584705670;
 bh=H5bIZM9FzsaYL+dKBsNczZHBf7ddrKgF+qY2s6ZJp6s=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=n09kAoxK2GITAsZKOI4DZ/3lyoyPYE7173+ozuzSmSZ/1OKVId9CpnghqFqCEA3qY
 oQD+84U+C/3u3uNt0/xITIpdCetvhiWgtjPqXCc8VT/RRQQ67Z2ksQWi6JhEZcCx41
 4jmeixgB8eKnb/z0NNiYD0JcKJY/fcUZjhXBdkSM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200320120110eucas1p238eff09c5daf836e85cd083ba25ef65e~_AWlJuLme0892208922eucas1p2_;
 Fri, 20 Mar 2020 12:01:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EA.57.60698.680B47E5; Fri, 20
 Mar 2020 12:01:10 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200320120110eucas1p22ef61d6b7aee78fb98cd5627063b9fc8~_AWk6r0hk2318323183eucas1p2e;
 Fri, 20 Mar 2020 12:01:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200320120110eusmtrp177ee177fdeac01f36cb840b62f66e686~_AWk6E7ln2035020350eusmtrp1t;
 Fri, 20 Mar 2020 12:01:10 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-30-5e74b08660e4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.99.07950.680B47E5; Fri, 20
 Mar 2020 12:01:10 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200320120110eusmtip278b4906f4b5f5bcd5c5215b1ede21a48~_AWkrXjf11795917959eusmtip27;
 Fri, 20 Mar 2020 12:01:10 +0000 (GMT)
Subject: Re: [PATCH v3] video: fbdev: vesafb: add missed release_region
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <1f5e6f52-c638-f73e-cf9d-88eb641a010d@samsung.com>
Date: Fri, 20 Mar 2020 13:01:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200310023536.13622-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7djPc7ptG0riDLoalCyufH3PZjH70Etm
 ixN9H1gtLu+aw+bA4rFz1l12j/vdx5k8Pm+SC2CO4rJJSc3JLEst0rdL4Mp4cuYSa8E14Ypt
 39tZGhh38HcxcnBICJhIvDxh1MXIxSEksIJRYsu+LlYI5wujxKtXa9ggnM+MEmsuzGTsYuQE
 67jbuJMFIrGcUeLP0VfsEM5bRoknc76AVQkLuEvMmjyZDcQWEVCX+LxrJzuIzSyQIHF60T0W
 EJtNwEpiYvsqsHpeATuJv++OgtksAqoSfV/bmUBsUYEIiU8PDrNC1AhKnJz5BKyXE6h3wplW
 FoiZ4hK3nsxngrDlJba/ncMMcpCEQDe7xNW/H6DOdpE4c20llC0s8er4FnYIW0bi9OQeFoiG
 dYwSfzteQHVvZ5RYPvkfG0SVtcSdc7/YQEHGLKApsX6XPkTYUWLPrMvskJDkk7jxVhDiCD6J
 SdumM0OEeSU62oQgqtUkNizbwAaztmvnSuYJjEqzkLw2C8k7s5C8Mwth7wJGllWM4qmlxbnp
 qcXGeanlesWJucWleel6yfm5mxiBKeX0v+NfdzDu+5N0iFGAg1GJh9diZUmcEGtiWXFl7iFG
 CQ5mJRFe3fTiOCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8xotexgoJpCeWpGanphakFsFkmTg4
 pRoYeZtKhR6FXDAsu3FkllrZF75Q5zcnvH4FyuvV2nve+HxB9oJ6RNjq8Igb152+31n+ltf9
 coi8L1fd/sccKvPln0UtObvtWM+aXwr1pxPn7tqR6Hp/rsX2FIGv8nNeqH9wNnkT5W6+K+vA
 +5b++F38kjmrFs+UYtJgUYr98E11mcS5oIq0IJ51SizFGYmGWsxFxYkAn7HChyUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xe7ptG0riDHbvE7a48vU9m8XsQy+Z
 LU70fWC1uLxrDpsDi8fOWXfZPe53H2fy+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
 yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/jyZlLrAXXhCu2fW9naWDcwd/FyMkhIWAicbdx
 J0sXIxeHkMBSRolH99cydjFyACVkJI6vL4OoEZb4c62LDaLmNaPE9U+/mUASwgLuErMmT2YD
 sUUE1CU+79rJDtLLLJAg8WxeCkR9L6NE+87/LCA1bAJWEhPbVzGC2LwCdhJ/3x0Fs1kEVCX6
 vraDzRQViJA4vGMWVI2gxMmZT8B6OYF6J5xpBbOZgXb9mXeJGcIWl7j1ZD4ThC0vsf3tHOYJ
 jEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRG0LZjP7fsYOx6
 F3yIUYCDUYmH12JlSZwQa2JZcWXuIUYJDmYlEV7d9OI4Id6UxMqq1KL8+KLSnNTiQ4ymQM9N
 ZJYSTc4HRndeSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbG3XqK
 k32VUi5WrbC0Mmnxm1wfz5ay0lTmwsxZF8r9dzXZlzc9FM6sf7zTpkdN2efb6YQ+/WJ1i2jW
 4xfmaxWl2Jywvz1l3xe+Ht72/sbm/1Y6h2e45Xcn/b2cHO0eeP3pCZtXyks+vPVo2cR4/lJJ
 j6ikxYN3vP8iOmMXR0yJiCzT11C/8kOJpTgj0VCLuag4EQDr2C68tgIAAA==
X-CMS-MailID: 20200320120110eucas1p22ef61d6b7aee78fb98cd5627063b9fc8
X-Msg-Generator: CA
X-RootMTR: 20200310023550eucas1p10797f834d7dc16f634cf644011462393
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200310023550eucas1p10797f834d7dc16f634cf644011462393
References: <CGME20200310023550eucas1p10797f834d7dc16f634cf644011462393@eucas1p1.samsung.com>
 <20200310023536.13622-1-hslester96@gmail.com>
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


On 3/10/20 3:35 AM, Chuhong Yuan wrote:
> The driver forgets to free the I/O region in remove and probe
> failure.
> Add the missed calls to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
> Changes in v3:
>   - Revise the commit message.
>   - Add an error handler to suit the "goto error" before request_region().
>   - Revise the order of operations in remove.
>   
>  drivers/video/fbdev/vesafb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index a1fe24ea869b..c7bc9ace47d4 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -439,7 +439,7 @@ static int vesafb_probe(struct platform_device *dev)
>  		       "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
>  			vesafb_fix.smem_len, vesafb_fix.smem_start);
>  		err = -EIO;
> -		goto err;
> +		goto err_release_region;
>  	}
>  
>  	printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, "
> @@ -458,15 +458,17 @@ static int vesafb_probe(struct platform_device *dev)
>  
>  	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
>  		err = -ENOMEM;
> -		goto err;
> +		goto err_release_region;
>  	}
>  	if (register_framebuffer(info)<0) {
>  		err = -EINVAL;
>  		fb_dealloc_cmap(&info->cmap);
> -		goto err;
> +		goto err_release_region;
>  	}
>  	fb_info(info, "%s frame buffer device\n", info->fix.id);
>  	return 0;
> +err_release_region:
> +	release_region(0x3c0, 32);

This is incorrect.

The cleanup order should be the reverse of the probing order.

Also request_region() return value is not checked by the driver
(there is a comment that it can fail and is optional):

        /* request failure does not faze us, as vgacon probably has this
         * region already (FIXME) */
        request_region(0x3c0, 32, "vesafb");

so what would happen in such case? It seems that unconditionally
doing the release will result in freeing the I/O region owned by
the other driver (vgacon)..

>  err:
>  	arch_phys_wc_del(par->wc_cookie);
>  	if (info->screen_base)
> @@ -481,6 +483,7 @@ static int vesafb_remove(struct platform_device *pdev)
>  	struct fb_info *info = platform_get_drvdata(pdev);
>  
>  	unregister_framebuffer(info);
> +	release_region(0x3c0, 32);
>  	framebuffer_release(info);
>  
>  	return 0;
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

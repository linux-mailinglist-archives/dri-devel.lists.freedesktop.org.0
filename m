Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD6313C85E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C346EA38;
	Wed, 15 Jan 2020 15:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F6E6EA38
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:51:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115155115euoutp017e9e32d498945911beabbb93e1f17be3~qGj6Llje02520125201euoutp01w
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:51:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200115155115euoutp017e9e32d498945911beabbb93e1f17be3~qGj6Llje02520125201euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579103475;
 bh=+44ruQrELZzOfxaxRN2GmBO3IiWVrUwlLHTkRFl5+to=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=AKqDlkDk2HuuNJM8EpsZqXxshA+EfieR4fZqoJYSXQS6YHF51zWpnuC3TQkTAdD3M
 4QlUD5525LiauJHakxio/3AwQ4pTiBd4uSNnAygs/acgRN2qHo+0HjPZ/AfVkD83iS
 F5jBlsxwSTogQOSheeCiXvv8Ykvbd9wfs6F/qwtI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200115155115eucas1p27a60e25c2d968b43a30d2780a72de44e~qGj6Ed99s1479514795eucas1p2b;
 Wed, 15 Jan 2020 15:51:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AE.72.60679.3F43F1E5; Wed, 15
 Jan 2020 15:51:15 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200115155114eucas1p198c7ce2fbffe03e764f82f61898186db~qGj5puXIr1202512025eucas1p1Y;
 Wed, 15 Jan 2020 15:51:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200115155114eusmtrp2794655590659509db9904f1d9212ed0b~qGj5pKZGV1277712777eusmtrp2s;
 Wed, 15 Jan 2020 15:51:14 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-a3-5e1f34f34cdf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B4.B1.08375.2F43F1E5; Wed, 15
 Jan 2020 15:51:14 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115155114eusmtip132e904b80e9be5b7346d2b9713cbf679~qGj5NU8rN0471004710eusmtip1M;
 Wed, 15 Jan 2020 15:51:14 +0000 (GMT)
Subject: Re: [PATCH] pxa168fb: fix release function mismatch in probe failure
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <83ca49d1-ca86-1005-7799-cc9f95af28db@samsung.com>
Date: Wed, 15 Jan 2020 16:51:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191205160613.32075-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7djP87qfTeTjDA7NZbe48vU9m8XsQy+Z
 LU70fWC1uLxrDpsDi8fOWXfZPe53H2fy+LxJLoA5issmJTUnsyy1SN8ugSvj1bn/jAXTuCr2
 LNjN0sC4g6OLkZNDQsBEYv7J+0wgtpDACkaJTVOkuxi5gOwvjBJX/h5jg3A+M0pMnTqBDabj
 Zf8EqMRyRolJjyczQThvGSUWzjzGDFIlLOAvMenuCnYQW0RAXeLzrp1gNrNAgsTpRfdYQGw2
 ASuJie2rGEFsXgE7ifNLboP1sgioSiz4vQVsm6hAhMSnB4dZIWoEJU7OfALWywnU+3fhISaI
 meISt57Mh7LlJba/ncMMcpCEQDe7xMr7TxkhznaRmHT1ODOELSzx6vgWdghbRuL/zvlMEA3r
 GCX+dryA6t7OKLF88j+op60l7pz7BWRzAK3QlFi/Sx8i7CjxcOt9dpCwhACfxI23ghBH8ElM
 2jadGSLMK9HRJgRRrSaxYdkGNpi1XTtXMk9gVJqF5LVZSN6ZheSdWQh7FzCyrGIUTy0tzk1P
 LTbKSy3XK07MLS7NS9dLzs/dxAhMKaf/Hf+yg3HXn6RDjAIcjEo8vBl/5OKEWBPLiitzDzFK
 cDArifCenCEbJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwen
 VAOjaEyzc7lfyXY1htYLdwIcXx0OeTJjwxrLz1lmQkrSfP5GsXVWa7IkZu3ny05y/aOs5Gks
 +jSrOXipbPOuvzw7J6+bzS1z11buikK9gsH3e8/u1C9vunP8V0j6eufpKc1npd37piYc536w
 MyN0zsyn2rILSyfptXBkCeZ+fSN1aG25xK/lExuUWIozEg21mIuKEwFFRS6yJQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xu7qfTOTjDI4eU7W48vU9m8XsQy+Z
 LU70fWC1uLxrDpsDi8fOWXfZPe53H2fy+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
 yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j1bn/jAXTuCr2LNjN0sC4g6OLkZNDQsBE4mX/
 BLYuRi4OIYGljBKtH5ewdzFyACVkJI6vL4OoEZb4c60LquY1o8Sb5UeZQRLCAr4SZzo2sIPY
 IgLqEp937QTrZRZIkHg2LwWivpdR4vn2lWA1bAJWEhPbVzGC2LwCdhLnl9wGm8MioCqx4PcW
 NhBbVCBC4vCOWVA1ghInZz5hAbE5gXr/LjzEBGIzA+36M+8SM4QtLnHryXyouLzE9rdzmCcw
 Cs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERhB24793LyD8dLG
 4EOMAhyMSjy8GX/k4oRYE8uKK3MPMUpwMCuJ8J6cIRsnxJuSWFmVWpQfX1Sak1p8iNEU6LmJ
 zFKiyfnA6M4riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cCoy5Q6
 10JLLK8oPHWeVG/00dmais3MfOZrbYXFqrI1fb5zPXaVy52deXX7zPTPNfkV6Tpx7bcs9ynu
 f87Y82WqvSpPtMGVM4w8GaGzXk70Onf2a/Z7LT/HrDmzM7V/vOD9b76Ku3A/37vL/CGRLRt7
 uraw3LOWfOpx8NLfpglK7Hz/6vfKaiuxFGckGmoxFxUnAgB9pX67tgIAAA==
X-CMS-MailID: 20200115155114eucas1p198c7ce2fbffe03e764f82f61898186db
X-Msg-Generator: CA
X-RootMTR: 20191205160628epcas4p38c1843647699dcbd209c5381d65ab869
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191205160628epcas4p38c1843647699dcbd209c5381d65ab869
References: <CGME20191205160628epcas4p38c1843647699dcbd209c5381d65ab869@epcas4p3.samsung.com>
 <20191205160613.32075-1-hslester96@gmail.com>
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


On 12/5/19 5:06 PM, Chuhong Yuan wrote:
> The driver uses kfree() to release the resource allocated by
> framebuffer_alloc(), which does not match.
> Use framebuffer_release() instead to fix it.

For pxa168fb driver framebuffer_release() does only kfree() so
there is no real breakage currently. Lets fix it anyway so it
won't break in the future.

> Fixes: 638772c7553f ("fb: add support of LCD display controller on pxa168/910 (base layer)")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Patch queued for v5.6, thanks.
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/pxa168fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
> index 1410f476e135..b9435133b6f3 100644
> --- a/drivers/video/fbdev/pxa168fb.c
> +++ b/drivers/video/fbdev/pxa168fb.c
> @@ -769,7 +769,7 @@ static int pxa168fb_probe(struct platform_device *pdev)
>  	dma_free_coherent(fbi->dev, info->fix.smem_len,
>  			info->screen_base, fbi->fb_start_dma);
>  failed_free_info:
> -	kfree(info);
> +	framebuffer_release(info);
>  
>  	dev_err(&pdev->dev, "frame buffer device init failed with %d\n", ret);
>  	return ret;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

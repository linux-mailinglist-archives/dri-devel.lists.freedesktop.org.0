Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D2112F802
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2093B89CD5;
	Fri,  3 Jan 2020 12:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0C289CD5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:13:15 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103121313euoutp011603aeb91b8b8d7e8c4786f3a8e69c4c~mX2IALKsY0268602686euoutp01D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:13:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200103121313euoutp011603aeb91b8b8d7e8c4786f3a8e69c4c~mX2IALKsY0268602686euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578053593;
 bh=EbGxdZXMFKXe3miodKL+6DD0GYH88a6uKE3EEjxnIdc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=QSTtNifOPEuo3uSBYo35R/az4CqlBrRTR+N1I/olcnBJ1aBrDltaxkRAfJUeeqSsE
 IhoOZTKYLc5NTQHQy6OqStVZJ9XY6T+shk9gEdWZcnTkhTKB27abwyru/wuHIT0yh6
 2leBahlTTnkj09fjiLkiaG6u0/R+qYo6cOXcpKpY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200103121313eucas1p2b1fd2065bc034457bb72d76452537b3d~mX2H5Pmkq1578015780eucas1p29;
 Fri,  3 Jan 2020 12:13:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 4F.D8.60698.9DF2F0E5; Fri,  3
 Jan 2020 12:13:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200103121313eucas1p249d6cbaf452f7851af06e177c97dfd60~mX2HUg6hg1578015780eucas1p28;
 Fri,  3 Jan 2020 12:13:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200103121313eusmtrp110d7bd15bfb53d2e3d0475e3d7ad718e~mX2HT3_ED2321523215eusmtrp1V;
 Fri,  3 Jan 2020 12:13:13 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-6e-5e0f2fd98a2f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DE.C3.08375.9DF2F0E5; Fri,  3
 Jan 2020 12:13:13 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103121312eusmtip1c1dab331a49d72b286f7214211d64ce1~mX2GlC2jF2919429194eusmtip1y;
 Fri,  3 Jan 2020 12:13:12 +0000 (GMT)
Subject: Re: [PATCH -next] fbdev: da8xx-fb: use
 devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3c33d508-9295-1d3a-6f39-43197ad1fccf@samsung.com>
Date: Fri, 3 Jan 2020 13:13:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904115028.25392-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7o39fnjDFrX61isPPGPxeLK1/ds
 Fif6PrBaXN41h83ixoSnjBZ7Hq9ntti8aSqzxZ2vz1kcODxajrxl9di0qpPN4925c+we97uP
 M3l8fPOE3eP9vqtsHp83yQWwR3HZpKTmZJalFunbJXBlfJmgUdAtULFj9y72BsaVvF2MHBwS
 AiYSjc3xXYxcHEICKxglzv1sZ4dwvjBKvHq5ixnC+cwoMXfNJSCHE6xj1/w3LBCJ5YwSv88v
 YIJw3jJKXLu6CaxKWCBZ4ui7biYQW0RATaLl1BawOLPAZkaJR/t9QGw2ASuJie2rGEFsXgE7
 ieYN/1hAbBYBFYn/vSfBekUFIiQ+PTjMClEjKHFy5hOwGk4Ba4lTb1+xQ8wUl7j1ZD4ThC0v
 sf3tHLCzJQROsUt0/FjKAnG2i8TWWd+hbGGJV8e3sEPYMhKnJ/ewQDSsY5T42/ECqns7o8Ty
 yf/YIKqsJe6c+8UGCjJmAU2J9bv0IcKOEtum3WKEhCSfxI23ghBH8ElM2jadGSLMK9HRJgRR
 rSaxYdkGNpi1XTtXMk9gVJqF5LVZSN6ZheSdWQh7FzCyrGIUTy0tzk1PLTbOSy3XK07MLS7N
 S9dLzs/dxAhMUKf/Hf+6g3Hfn6RDjAIcjEo8vAnK/HFCrIllxZW5hxglOJiVRHjLA3njhHhT
 EiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQnliSmp2aWpBaBJNl4uCUamBcYW6U+LCe8R/7
 cZ1Z9jNe8LHrSfw7vJNrrcuJFslDn1cXFOVvbFmebrM6weXvvl+fP1eE2/0Iesos1vSKZ/aM
 nXJMPN9S/SU28d74p7p0is7TtQcUC2V+KwX4Z1688W5S/cvyimwFV6nqmbrGd2r8ls7R+/cl
 acOd9qp/YZ9EvZJvNq+perJGiaU4I9FQi7moOBEAcnbHOUwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7o39fnjDNr7uSxWnvjHYnHl63s2
 ixN9H1gtLu+aw2ZxY8JTRos9j9czW2zeNJXZ4s7X5ywOHB4tR96yemxa1cnm8e7cOXaP+93H
 mTw+vnnC7vF+31U2j8+b5ALYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV
 9O1sUlJzMstSi/TtEvQyvkzQKOgWqNixexd7A+NK3i5GTg4JAROJXfPfsHQxcnEICSxllLj9
 /wtzFyMHUEJG4vj6MogaYYk/17rYIGpeM0rM3v+dGSQhLJAscfRdNxOILSKgJtFyagtYnFlg
 M6PEixfBILaQQB+jxK+X+SA2m4CVxMT2VYwgNq+AnUTzhn8sIDaLgIrE/96TYHNEBSIkDu+Y
 BVUjKHFy5hOwGk4Ba4lTb1+xQ8xXl/gz7xLULnGJW0/mM0HY8hLb385hnsAoNAtJ+ywkLbOQ
 tMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYDxuO/Zz8w7GSxuDDzEKcDAq8fAm
 KPPHCbEmlhVX5h5ilOBgVhLhLQ/kjRPiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGCqyCuJ
 NzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwKj951dYZEBzvlOp4+aC
 JI6K1z13Z/pstHpVqiNydpesifkZ35+bN4WLXOqxSdkxQVdq6jmNZbk7LbR2reN4cfP1hw6N
 pXfFl64JMzKfbzalsZHB2yr1v9CinNAV9w4Ealne4avd9oRlwZ3WM49m1C0y+j/FwkGq3exn
 oNdLVsnFga8lTgc4qSuxFGckGmoxFxUnAgAy9uIg3QIAAA==
X-CMS-MailID: 20200103121313eucas1p249d6cbaf452f7851af06e177c97dfd60
X-Msg-Generator: CA
X-RootMTR: 20190904115137epcas2p49e26fe2b912c423caa61e97887849c15
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190904115137epcas2p49e26fe2b912c423caa61e97887849c15
References: <CGME20190904115137epcas2p49e26fe2b912c423caa61e97887849c15@epcas2p4.samsung.com>
 <20190904115028.25392-1-yuehaibing@huawei.com>
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
 dri-devel@lists.freedesktop.org, rfontana@redhat.com, mcgrof@kernel.org,
 tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/4/19 1:50 PM, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

This has been already fixed by:

commit c957c88f7be109a14294289f013b03bbe94e8af5
Author:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
AuthorDate: Mon Jul 22 15:44:21 2019 +0200
Commit:     Sekhar Nori <nsekhar@ti.com>
CommitDate: Mon Aug 26 17:53:59 2019 +0530

    fbdev: da8xx-fb: use devm_platform_ioremap_resource()
    
    Shrink the code a bit by using the new helper wrapping the calls to
    platform_get_resource() and devm_ioremap_resource() together.
    
    Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
    Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
    Signed-off-by: Sekhar Nori <nsekhar@ti.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/da8xx-fb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
> index b1cf248..57518d7 100644
> --- a/drivers/video/fbdev/da8xx-fb.c
> +++ b/drivers/video/fbdev/da8xx-fb.c
> @@ -1328,7 +1328,6 @@ static int fb_probe(struct platform_device *device)
>  {
>  	struct da8xx_lcdc_platform_data *fb_pdata =
>  						dev_get_platdata(&device->dev);
> -	struct resource *lcdc_regs;
>  	struct lcd_ctrl_config *lcd_cfg;
>  	struct fb_videomode *lcdc_info;
>  	struct fb_info *da8xx_fb_info;
> @@ -1346,8 +1345,7 @@ static int fb_probe(struct platform_device *device)
>  	if (lcdc_info == NULL)
>  		return -ENODEV;
>  
> -	lcdc_regs = platform_get_resource(device, IORESOURCE_MEM, 0);
> -	da8xx_fb_reg_base = devm_ioremap_resource(&device->dev, lcdc_regs);
> +	da8xx_fb_reg_base = devm_platform_ioremap_resource(device, 0);
>  	if (IS_ERR(da8xx_fb_reg_base))
>  		return PTR_ERR(da8xx_fb_reg_base);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

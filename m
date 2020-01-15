Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA3B13C702
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152D6EAD1;
	Wed, 15 Jan 2020 15:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEED6EAD2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:09:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115150908euoutp02f672ee52e8a351651aec9f93e507a688~qF-JIbHNQ3087730877euoutp02U
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:09:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200115150908euoutp02f672ee52e8a351651aec9f93e507a688~qF-JIbHNQ3087730877euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579100948;
 bh=pgc0KbIHRZtV95G/YdItWgVEQnJDvr037YYBXdbWFl8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=NGkEro7EDp2UhDipKS1U4C+qMuVCgMjDl7mzkBMYf5p36+EapQEYEyyU7hx7a0xHh
 On+OaTOUZyfGfVg6Ap8Bg0/wiFjAvEnYPGyB3OiGeEXcxc8uCJGD6rI3hy+NcS6JpQ
 RrnX/ujtCw6CKHyg6kDa8yGRf7QKoLpzXktw6W0E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200115150908eucas1p283cbcbee603710bc567640c991d16d20~qF-I9hzn81992219922eucas1p2X;
 Wed, 15 Jan 2020 15:09:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0F.0D.60679.41B2F1E5; Wed, 15
 Jan 2020 15:09:08 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115150907eucas1p2c04f054556f4751704eab807edc807e4~qF-IaDPiU1970519705eucas1p2d;
 Wed, 15 Jan 2020 15:09:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200115150907eusmtrp1a93425a3f9c857758d4679fc42bb4876~qF-IZW_HC0299102991eusmtrp1I;
 Wed, 15 Jan 2020 15:09:07 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-49-5e1f2b14df6f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BA.DC.07950.31B2F1E5; Wed, 15
 Jan 2020 15:09:07 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200115150907eusmtip2493072d5318fb15fcb5d627b60128478~qF-IEsI8p0507205072eusmtip20;
 Wed, 15 Jan 2020 15:09:07 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: arcfb: add missed free_irq
To: Chuhong Yuan <hslester96@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <76ebce76-6f24-c4c4-f067-3989a2c41710@samsung.com>
Date: Wed, 15 Jan 2020 16:09:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191116154416.19390-1-hslester96@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsWy7djPc7oi2vJxBo2z5C2ufH3PZjH70Etm
 i2nH/jFZnOj7wGpxedccNgdWj52z7rJ7bGvex+pxv/s4k8fnTXIBLFFcNimpOZllqUX6dglc
 GYs3XWMueMZZcWbiD9YGxr/sXYycHBICJhKrb7xn62Lk4hASWMEoseDvASjnC6PEkv9TWSCc
 z4wSr7Z9hGvpWbCJCSKxnFHi6pF97BDOW0aJu28mALVwcAgL2Eos2lgD0iAioC7xeddOsBpm
 gSZGidP3exlBEmwCVhIT21eB2bwCdhJ/bsxlBrFZBFQlXj9pZAKxRQUiJD49OMwKUSMocXLm
 ExYQmxOo9/T8i2AXMQuIS9x6Mp8JwpaX2P52DjPIMgmBRewSz67NYAQ5SELAReL0lViID4Ql
 Xh3fAvWNjMTpyT0sEPXrGCX+dryAat7OKLF88j82iCpriTvnfrGBDGIW0JRYv0sfIuwo8fz6
 W2aI+XwSN94KQtzAJzFp23SoMK9ER5sQRLWaxIZlG9hg1nbtXMk8gVFpFpLPZiH5ZhaSb2Yh
 7F3AyLKKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMM2c/nf8yw7GXX+SDjEKcDAq8fBm
 /JGLE2JNLCuuzD3EKMHBrCTCe3KGbJwQb0piZVVqUX58UWlOavEhRmkOFiVxXuNFL2OFBNIT
 S1KzU1MLUotgskwcnFINjJt9rjrpluU8EfRa/D9y0lFHdtEN2gJn/a9stfc7IWp1RqfgX8is
 PR8nMX3j1Nts7+iSIp9YsPz+qb9RDCcn/5kq3vV9l81nm4SiR/P5U7n3lTX/akjMV1jHv3GK
 1gq7wiz9gtKHr6eJzWWZ+2mLrOEXF6fnq76993mremT/6zuP9Tymh895b6jEUpyRaKjFXFSc
 CAAxPzWZLwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xe7rC2vJxBhc/mFhc+fqezWL2oZfM
 FtOO/WOyONH3gdXi8q45bA6sHjtn3WX32Na8j9XjfvdxJo/Pm+QCWKL0bIryS0tSFTLyi0ts
 laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MhZvusZc8Iyz4szEH6wNjH/Z
 uxg5OSQETCR6Fmxi6mLk4hASWMoo8btvCpDDAZSQkTi+vgyiRljiz7UuNoia14wSDatPsoDU
 CAvYSizaWANSIyKgLvF51052kBpmgSZGiQuHFzFCNPQySszbvYEZpIpNwEpiYvsqRhCbV8BO
 4s+NuWBxFgFViddPGplAbFGBCInDO2ZB1QhKnJz5hAXE5gTqPT3/ItjVzEDb/sy7xAxhi0vc
 ejKfCcKWl9j+dg7zBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNz
 NzEC42rbsZ9bdjB2vQs+xCjAwajEw3vgn1ycEGtiWXFl7iFGCQ5mJRHekzNk44R4UxIrq1KL
 8uOLSnNSiw8xmgI9N5FZSjQ5HxjzeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1ML
 Uotg+pg4OKUaGOfur0hs0uN4vOvJrf684C/6vA/qFhk8Pb5hsqzJx428RrE/FlyYe6DEMVLq
 wBa/IzWZlinzp5cxycjfWnYwLnrZy2OLOJpCpN++5Hziu+J7jDhTabPYrCXvt5kFnpH/GbHs
 yte+hflfyjlVls8tN43ZIyR8+PjzP/9XnzTQiOfIDZ2bvPZ9zlUlluKMREMt5qLiRABX0wpP
 wQIAAA==
X-CMS-MailID: 20200115150907eucas1p2c04f054556f4751704eab807edc807e4
X-Msg-Generator: CA
X-RootMTR: 20191116154430eucas1p21c738a988e3bc0c3544a388c71f4a75c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191116154430eucas1p21c738a988e3bc0c3544a388c71f4a75c
References: <CGME20191116154430eucas1p21c738a988e3bc0c3544a388c71f4a75c@eucas1p2.samsung.com>
 <20191116154416.19390-1-hslester96@gmail.com>
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
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/16/19 4:44 PM, Chuhong Yuan wrote:
> The driver forgets to free irq in remove which is requested in
> probe.
> Add the missed call to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/video/fbdev/arcfb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
> index a48741aab240..7aed01f001a4 100644
> --- a/drivers/video/fbdev/arcfb.c
> +++ b/drivers/video/fbdev/arcfb.c
> @@ -590,8 +590,11 @@ static int arcfb_probe(struct platform_device *dev)
>  static int arcfb_remove(struct platform_device *dev)
>  {
>  	struct fb_info *info = platform_get_drvdata(dev);
> +	struct arcfb_par *par = info->par;
>  
>  	if (info) {
> +		if (irq)
> +			free_irq(par->irq, info);
>  		unregister_framebuffer(info);

We cannot free IRQ while framebuffer is registered (as we can
deadlock in arcfb_ioctl()).

Also it seems that ordering in the probe function is wrong
(it should not request IRQ or initialize the hardware after
registering framebuffer).

>  		vfree((void __force *)info->screen_base);
>  		framebuffer_release(info);

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8528612F75C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 12:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2F06E1D7;
	Fri,  3 Jan 2020 11:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Fri, 03 Jan 2020 11:35:49 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96936E1D7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 11:35:49 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103112908euoutp01b302509db6efbd34ef8b55ba536aed4a~mXPn7rA810053800538euoutp01R
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 11:29:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200103112908euoutp01b302509db6efbd34ef8b55ba536aed4a~mXPn7rA810053800538euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578050948;
 bh=am8YhLIAmvCg+DCVx15rfPBNjQlNGbRxSRmJOWIfPqA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=p9jSuphVLinln3fYTCsZuplo1gUL/0ZgkzDc23YTSS8hj6Triub4w1x5EKdZCkD5Q
 Q5NalnkQpn/ECeEplVDnlnBRl9304a3NDRAooSWdKpGoHRYZU7gH+1gTrekkNgrr/T
 qcHGaaNHNsml2l/IsBKxffUsnjGsBJ/HHtu/uzUM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103112908eucas1p12c154fecd493b8a09259e6bf983e8a2f~mXPn0nsqJ2519525195eucas1p1Z;
 Fri,  3 Jan 2020 11:29:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.C2.60679.3852F0E5; Fri,  3
 Jan 2020 11:29:07 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200103112907eucas1p188fb06f73886f73aadc49d5411ab9269~mXPniM9Sz2395423954eucas1p1W;
 Fri,  3 Jan 2020 11:29:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103112907eusmtrp27883519da0894befd1f5f1c05c51a3e8~mXPnhAaJp2970329703eusmtrp2P;
 Fri,  3 Jan 2020 11:29:07 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-73-5e0f25838d0f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5B.A0.08375.3852F0E5; Fri,  3
 Jan 2020 11:29:07 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103112907eusmtip1e2d8eb1389728a13df5b5ee81b77cae8~mXPnLbAr70358403584eusmtip1l;
 Fri,  3 Jan 2020 11:29:07 +0000 (GMT)
Subject: Re: [PATCH v6 47/57] video: Remove dev_err() usage after
 platform_get_irq()
To: Stephen Boyd <swboyd@chromium.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <467ee450-e6de-e517-b8d9-7048c14a1931@samsung.com>
Date: Fri, 3 Jan 2020 12:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730181557.90391-48-swboyd@chromium.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7rNqvxxBt3HbSyufH3PZtG8eD2b
 xYm+D6wWl3fNYbM4fucpkwOrx+yGiywe++euYfe4332cyePzJrkAligum5TUnMyy1CJ9uwSu
 jD8LV7MUbNevuD3nI1sD4ya1LkZODgkBE4kd7YvZuhi5OIQEVjBKNBzewQrhfGGUOLZ0HZTz
 mVGi6eY3dpiW/R/Xs0AkljNKzNp4Bcp5yyjR0fuFBaRKWCBM4uLaBWAdIgJqErM/HGcCKWIW
 mMgosX7ZV1aQBJuAlcTE9lWMIDavgJ3EwZ4LbCA2i4CKxJpFa8FqRAUiJD49OMwKUSMocXLm
 E7AFnEC9+yYfBOtlFhCXuPVkPhOELS+x/e0cZohTF7FLrNjvA2G7SKx6dowJwhaWeHV8C9Q7
 MhL/d84HO05CYB2jxN+OF8wQznZGieWT/7FBVFlL3Dn3C8jmANqgKbF+lz5E2FFiWuMlsLCE
 AJ/EjbeCEDfwSUzaNp0ZIswr0dEmBFGtJrFh2QY2mLVdO1cyT2BUmoXks1lIvpmF5JtZCHsX
 MLKsYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECEw0p/8d/7KDcdefpEOMAhyMSjy8Ccr8
 cUKsiWXFlbmHGCU4mJVEeMsDeeOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKa
 nZpakFoEk2Xi4JRqYKwL63k25Yip+tSiLA6R6XtKQw/bT1RuvcgXV9wdat0VL7630sPj38xz
 D0R832ud+9C14OGcT+/F3/Cwuh+98PSHslxW7vnd17+tN8l+wvuuvNPq5Q7LaVfuFfVYfNzx
 LW/HtYcOHqlh1134lp62uM+i7/Kw7aFFi/vDKfpb3was5o/m7rPl+6DEUpyRaKjFXFScCABw
 ouGEMAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7rNqvxxBrdWalhc+fqezaJ58Xo2
 ixN9H1gtLu+aw2Zx/M5TJgdWj9kNF1k89s9dw+5xv/s4k8fnTXIBLFF6NkX5pSWpChn5xSW2
 StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GX8WrmYp2K5fcXvOR7YGxk1q
 XYycHBICJhL7P65n6WLk4hASWMoo8WT+EtYuRg6ghIzE8fVlEDXCEn+udbFB1LxmlPj1uZkR
 JCEsECZxce0CdhBbREBNYvaH40wgRcwCExkl1nfsYITo2MMoceDxfbAONgEriYntq8BsXgE7
 iYM9F9hAbBYBFYk1i9aygtiiAhESh3fMgqoRlDg58wkLiM0J1Ltv8kGwOLOAusSfeZeYIWxx
 iVtP5jNB2PIS29/OYZ7AKDQLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5y
 fu4mRmBkbTv2c/MOxksbgw8xCnAwKvHwJijzxwmxJpYVV+YeYpTgYFYS4S0P5I0T4k1JrKxK
 LcqPLyrNSS0+xGgK9NxEZinR5Hxg1OeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5N
 LUgtgulj4uCUamBUMjNtvi3845uPV+PL35yltw8HSKarXexOYPV83nXE6HHhwWXzvS7eUkn5
 ce6G1M3m6q9ZDJacnOmK8Y9S9vzvszhW0s7kybBH7emun0+kJDgfJc7TKnWYdD77Z1pq2E/W
 XearTBjU/6cwF654GHTr1CbGXUd9925Vu+gnryyw4gnP5GOdN9qUWIozEg21mIuKEwHRgph3
 wgIAAA==
X-CMS-MailID: 20200103112907eucas1p188fb06f73886f73aadc49d5411ab9269
X-Msg-Generator: CA
X-RootMTR: 20190730181641epcas3p26b5bd99f64726e7d110e20f1b673efeb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190730181641epcas3p26b5bd99f64726e7d110e20f1b673efeb
References: <20190730181557.90391-1-swboyd@chromium.org>
 <CGME20190730181641epcas3p26b5bd99f64726e7d110e20f1b673efeb@epcas3p2.samsung.com>
 <20190730181557.90391-48-swboyd@chromium.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

Sorry for the late reply.

On 7/30/19 8:15 PM, Stephen Boyd wrote:
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.

This patch changes handling of -EPROBE_DEFER in the modified drivers
(most don't support it and error message will no longer be printed).

I cannot apply it as it is (seems that -EPROBE_DEFER handling should
be audited/fixed in the affected drivers first).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
> 
> ret =
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
> 
> if ( \( ret < 0 \| ret <= 0 \) )
> {
> (
> -if (ret != -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
> 
> While we're here, remove braces on if statements that only have one
> statement (manually).
> 
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Please apply directly to subsystem trees
> 
>  drivers/video/fbdev/atmel_lcdfb.c     | 1 -
>  drivers/video/fbdev/mmp/hw/mmp_ctrl.c | 1 -
>  drivers/video/fbdev/nuc900fb.c        | 4 +---
>  drivers/video/fbdev/pxa168fb.c        | 4 +---
>  drivers/video/fbdev/pxa3xx-gcu.c      | 4 +---
>  drivers/video/fbdev/pxafb.c           | 1 -
>  drivers/video/fbdev/s3c2410fb.c       | 4 +---
>  drivers/video/fbdev/vt8500lcdfb.c     | 1 -
>  8 files changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index 5ff8e0320d95..4a16354d65c8 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -1114,7 +1114,6 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
>  
>  	sinfo->irq_base = platform_get_irq(pdev, 0);
>  	if (sinfo->irq_base < 0) {
> -		dev_err(dev, "unable to get irq\n");
>  		ret = sinfo->irq_base;
>  		goto stop_clk;
>  	}
> diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
> index 17174cd7a5bb..d6124976139b 100644
> --- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
> +++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
> @@ -447,7 +447,6 @@ static int mmphw_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		dev_err(&pdev->dev, "%s: no IRQ defined\n", __func__);
>  		ret = -ENOENT;
>  		goto failed;
>  	}
> diff --git a/drivers/video/fbdev/nuc900fb.c b/drivers/video/fbdev/nuc900fb.c
> index 4fd851598584..c4606c734f44 100644
> --- a/drivers/video/fbdev/nuc900fb.c
> +++ b/drivers/video/fbdev/nuc900fb.c
> @@ -526,10 +526,8 @@ static int nuc900fb_probe(struct platform_device *pdev)
>  	display = mach_info->displays + mach_info->default_display;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "no irq for device\n");
> +	if (irq < 0)
>  		return -ENOENT;
> -	}
>  
>  	fbinfo = framebuffer_alloc(sizeof(struct nuc900fb_info), &pdev->dev);
>  	if (!fbinfo)
> diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
> index 1410f476e135..d9e5258503f0 100644
> --- a/drivers/video/fbdev/pxa168fb.c
> +++ b/drivers/video/fbdev/pxa168fb.c
> @@ -625,10 +625,8 @@ static int pxa168fb_probe(struct platform_device *pdev)
>  	}
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "no IRQ defined\n");
> +	if (irq < 0)
>  		return -ENOENT;
> -	}
>  
>  	info = framebuffer_alloc(sizeof(struct pxa168fb_info), &pdev->dev);
>  	if (info == NULL) {
> diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3xx-gcu.c
> index 74ffb446e00c..07414d43cb3f 100644
> --- a/drivers/video/fbdev/pxa3xx-gcu.c
> +++ b/drivers/video/fbdev/pxa3xx-gcu.c
> @@ -614,10 +614,8 @@ static int pxa3xx_gcu_probe(struct platform_device *pdev)
>  
>  	/* request the IRQ */
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "no IRQ defined: %d\n", irq);
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	ret = devm_request_irq(dev, irq, pxa3xx_gcu_handle_irq,
>  			       0, DRV_NAME, priv);
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index 4282cb117b92..b44f402ce552 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -2353,7 +2353,6 @@ static int pxafb_probe(struct platform_device *dev)
>  
>  	irq = platform_get_irq(dev, 0);
>  	if (irq < 0) {
> -		dev_err(&dev->dev, "no IRQ defined\n");
>  		ret = -ENODEV;
>  		goto failed_free_mem;
>  	}
> diff --git a/drivers/video/fbdev/s3c2410fb.c b/drivers/video/fbdev/s3c2410fb.c
> index a702da89910b..2a846fd5da2a 100644
> --- a/drivers/video/fbdev/s3c2410fb.c
> +++ b/drivers/video/fbdev/s3c2410fb.c
> @@ -849,10 +849,8 @@ static int s3c24xxfb_probe(struct platform_device *pdev,
>  	display = mach_info->displays + mach_info->default_display;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "no irq for device\n");
> +	if (irq < 0)
>  		return -ENOENT;
> -	}
>  
>  	fbinfo = framebuffer_alloc(sizeof(struct s3c2410fb_info), &pdev->dev);
>  	if (!fbinfo)
> diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
> index be8d9702cbb2..a10088e1cdb0 100644
> --- a/drivers/video/fbdev/vt8500lcdfb.c
> +++ b/drivers/video/fbdev/vt8500lcdfb.c
> @@ -372,7 +372,6 @@ static int vt8500lcd_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		dev_err(&pdev->dev, "no IRQ defined\n");
>  		ret = -ENODEV;
>  		goto failed_free_palette;
>  	}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

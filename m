Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA013C8C2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 17:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051ED6EA2C;
	Wed, 15 Jan 2020 16:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39FF6EA2C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 16:06:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115160632euoutp01adcea2ba82886fecd88c514b19bc3331~qGxQHNhal0448704487euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 16:06:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200115160632euoutp01adcea2ba82886fecd88c514b19bc3331~qGxQHNhal0448704487euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579104392;
 bh=CmOiL3BLB2XPduqL5i0vdpv+vtMHGtAOqvLAZdojNyw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YcQDNKbD6wIeFQB706MJh5dxcvatUYED5vmgk/LjGEmzwDxIbyh/mPUIN4AULbzyG
 VEd1M2GkhweXBvAcjXuR/kC3B4xG6Kl+b8URNMrcJ9GV99VgpWo7ZgYZGew4eslPIY
 dfpX1Ss9zb2fQis0maEyvb4R5tD9bqxk4dyVysCw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200115160631eucas1p1bdc2f079bdc0044ab143aa9aeaa010a1~qGxPsAETn2239722397eucas1p15;
 Wed, 15 Jan 2020 16:06:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 46.54.60679.7883F1E5; Wed, 15
 Jan 2020 16:06:31 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115160631eucas1p204c4fec97aff0d30cd441b90b40f6d14~qGxPUwjv41574715747eucas1p2X;
 Wed, 15 Jan 2020 16:06:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200115160631eusmtrp1b491f5ae6df1c9f332b45727baaae811~qGxPUMxpp0946809468eusmtrp1r;
 Wed, 15 Jan 2020 16:06:31 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-77-5e1f38876c47
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F4.63.08375.7883F1E5; Wed, 15
 Jan 2020 16:06:31 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200115160630eusmtip2d00620257110c787822eef0bea931efb~qGxO0WtVq0273302733eusmtip2J;
 Wed, 15 Jan 2020 16:06:30 +0000 (GMT)
Subject: Re: [PATCH 03/10] fbdev: s1d13xxxfb: use resource_size
To: Julia Lawall <Julia.Lawall@inria.fr>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <847e5e23-38fd-ec1b-2296-456435c06fd6@samsung.com>
Date: Wed, 15 Jan 2020 17:06:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1577900990-8588-4-git-send-email-Julia.Lawall@inria.fr>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djP87rtFvJxBod7tS2ufH3PZtG0qp/Z
 YustaYt5JyUsTvR9YLW4vGsOmwObx85Zd9k9Jr04xOJxv/s4k8fnTXIBLFFcNimpOZllqUX6
 dglcGatXvWYtmCZdsXmlcQPjWrEuRk4OCQETiQfnZrJ3MXJxCAmsYJS49rmBDcL5wihx9VE3
 I4TzmVFi94XXrDAtN3o3QCWWM0qcaTvLAuG8ZZQ4sWoLWJWwgL3Ek+PP2EFsEQENiaUbV4AV
 MQtsY5TYt/ssWIJNwEpiYvsqoFEcHLwCdhL7n5mBhFkEVCXuHWpiBrFFBSIkPj04DDaTV0BQ
 4uTMJywgNqeAq8ThV7sYQWxmAXGJW0/mM0HY8hLb385hBtklIbCKXeLIvHdQZ7tITJi7jh3C
 FpZ4dXwLlC0jcXpyDwtEwzpGib8dL6C6tzNKLJ/8jw2iylrizrlfbCCXMgtoSqzfpQ8RdpR4
 2n+PFSQsIcAnceOtIMQRfBKTtk1nhgjzSnS0CUFUq0lsWLaBDWZt186VzBMYlWYheW0Wkndm
 IXlnFsLeBYwsqxjFU0uLc9NTi43yUsv1ihNzi0vz0vWS83M3MQKTzel/x7/sYNz1J+kQowAH
 oxIPb8YfuTgh1sSy4srcQ4wSHMxKIrwnZ8jGCfGmJFZWpRblxxeV5qQWH2KU5mBREuc1XvQy
 VkggPbEkNTs1tSC1CCbLxMEp1cA4o0h6ygR16agVdYedM/eHSUwoYPg5ZaO50MkZd25V1DX2
 rE7nPdH3scztL2dXj6fE682nrz2Y/KPFcnLxvu0Zp5cWRV+S435mtchJik3xy4blkR9Or49M
 i2dos36dUuZ/ImNz+wL15Jte8dcS+xMPiVvwHru1JbtmoXO/Qua1RW9vF/NOPKKkxFKckWio
 xVxUnAgAqkUVFjIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xe7rtFvJxBrc/CFlc+fqezaJpVT+z
 xdZb0hbzTkpYnOj7wGpxedccNgc2j52z7rJ7THpxiMXjfvdxJo/Pm+QCWKL0bIryS0tSFTLy
 i0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mlaves1aME26YvNK4wbG
 tWJdjJwcEgImEjd6NzB2MXJxCAksZZT4tPA5kMMBlJCROL6+DKJGWOLPtS42iJrXjBI7Oyax
 gSSEBewlnhx/xg5iiwhoSCzduIIFpIhZYBujxNSOZewQHZcZJfoWfWAFqWITsJKY2L4KbAOv
 gJ3E/mdmIGEWAVWJe4eamEFsUYEIicM7ZjGC2LwCghInZz5hAbE5BVwlDr/aBRZnFlCX+DPv
 EjOELS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0u
 zUvXS87P3cQIjK1tx35u3sF4aWPwIUYBDkYlHt6MP3JxQqyJZcWVuYcYJTiYlUR4T86QjRPi
 TUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGDc55XEG5oamltYGpobmxubWSiJ83YIHIwREkhP
 LEnNTk0tSC2C6WPi4JRqYIx+vSXkfXLaD0um9g8vY9KOxL3/9G/9vbT3TA/yFdslpxkX674y
 Yg37nXZqq+uBhsuNfQc3VxW8/MWgXOX2ebeUUGdQTLGCRtHcs3/Lbog23YhafzXTYJORQ47i
 deVIN6cPFWoLF868ny698KPsj09vMnp1GuZlz3we9vY2w8lbTjfdJqr9OaTEUpyRaKjFXFSc
 CABNmTYhwwIAAA==
X-CMS-MailID: 20200115160631eucas1p204c4fec97aff0d30cd441b90b40f6d14
X-Msg-Generator: CA
X-RootMTR: 20200101182630eucas1p2ba58d07a485bd831a4afb16adbbe9306
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200101182630eucas1p2ba58d07a485bd831a4afb16adbbe9306
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
 <CGME20200101182630eucas1p2ba58d07a485bd831a4afb16adbbe9306@eucas1p2.samsung.com>
 <1577900990-8588-4-git-send-email-Julia.Lawall@inria.fr>
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/1/20 6:49 PM, Julia Lawall wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> The semantic patch that makes these changes is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ struct resource ptr; @@
> - (ptr.end - ptr.start + 1)
> + resource_size(&ptr)
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch queued for v5.6, thanks.
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/s1d13xxxfb.c |   16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
> index 8048499e398d..eaea8c373753 100644
> --- a/drivers/video/fbdev/s1d13xxxfb.c
> +++ b/drivers/video/fbdev/s1d13xxxfb.c
> @@ -746,9 +746,9 @@ s1d13xxxfb_remove(struct platform_device *pdev)
>  	}
>  
>  	release_mem_region(pdev->resource[0].start,
> -			pdev->resource[0].end - pdev->resource[0].start +1);
> +			   resource_size(&pdev->resource[0]));
>  	release_mem_region(pdev->resource[1].start,
> -			pdev->resource[1].end - pdev->resource[1].start +1);
> +			   resource_size(&pdev->resource[1]));
>  	return 0;
>  }
>  
> @@ -788,14 +788,14 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
>  	}
>  
>  	if (!request_mem_region(pdev->resource[0].start,
> -		pdev->resource[0].end - pdev->resource[0].start +1, "s1d13xxxfb mem")) {
> +		resource_size(&pdev->resource[0]), "s1d13xxxfb mem")) {
>  		dev_dbg(&pdev->dev, "request_mem_region failed\n");
>  		ret = -EBUSY;
>  		goto bail;
>  	}
>  
>  	if (!request_mem_region(pdev->resource[1].start,
> -		pdev->resource[1].end - pdev->resource[1].start +1, "s1d13xxxfb regs")) {
> +		resource_size(&pdev->resource[1]), "s1d13xxxfb regs")) {
>  		dev_dbg(&pdev->dev, "request_mem_region failed\n");
>  		ret = -EBUSY;
>  		goto bail;
> @@ -810,7 +810,7 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, info);
>  	default_par = info->par;
>  	default_par->regs = ioremap(pdev->resource[1].start,
> -			pdev->resource[1].end - pdev->resource[1].start +1);
> +				    resource_size(&pdev->resource[1]));
>  	if (!default_par->regs) {
>  		printk(KERN_ERR PFX "unable to map registers\n");
>  		ret = -ENOMEM;
> @@ -819,7 +819,7 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
>  	info->pseudo_palette = default_par->pseudo_palette;
>  
>  	info->screen_base = ioremap(pdev->resource[0].start,
> -			pdev->resource[0].end - pdev->resource[0].start +1);
> +				    resource_size(&pdev->resource[0]));
>  
>  	if (!info->screen_base) {
>  		printk(KERN_ERR PFX "unable to map framebuffer\n");
> @@ -857,9 +857,9 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
>  
>  	info->fix = s1d13xxxfb_fix;
>  	info->fix.mmio_start = pdev->resource[1].start;
> -	info->fix.mmio_len = pdev->resource[1].end - pdev->resource[1].start + 1;
> +	info->fix.mmio_len = resource_size(&pdev->resource[1]);
>  	info->fix.smem_start = pdev->resource[0].start;
> -	info->fix.smem_len = pdev->resource[0].end - pdev->resource[0].start + 1;
> +	info->fix.smem_len = resource_size(&pdev->resource[0]);
>  
>  	printk(KERN_INFO PFX "regs mapped at 0x%p, fb %d KiB mapped at 0x%p\n",
>  	       default_par->regs, info->fix.smem_len / 1024, info->screen_base);
> 
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

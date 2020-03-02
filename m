Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B18175E5C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670FD6E2E5;
	Mon,  2 Mar 2020 15:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF686E2E5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:41:36 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154135euoutp0297853f49df6804428fa32b6cf1c7249f~4hv4vdjum1202812028euoutp02U
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:41:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200302154135euoutp0297853f49df6804428fa32b6cf1c7249f~4hv4vdjum1202812028euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163695;
 bh=jBbmLTZcLgWnjwFk3OQEwQVbU45SnDTQVTfDSXIqN2s=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=Lf+4WcS/gGRIzZr//M5YbJ+OqGZ8SbYlqwB6zkr+tehezdViZN6+Gsg/qA4jvhN0d
 W4zE4lKCHB31rt0rf9LqqJY6XS1uMdutEiKbx/9rRScewqAV3RFySU0xmjkpcdmVgD
 xPdcetkquD42FT5pNYPTmHx1gLWZ+UTWbQg1/B4E=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200302154135eucas1p190a193cd9f6399d4090af5d34727b54e~4hv4fxdTl1688116881eucas1p1R;
 Mon,  2 Mar 2020 15:41:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E0.7D.61286.E292D5E5; Mon,  2
 Mar 2020 15:41:34 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154134eucas1p2f331781cba9fca808cc50129f35e05f2~4hv4NDfFJ0750207502eucas1p2R;
 Mon,  2 Mar 2020 15:41:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154134eusmtrp175cc8a4f1eec147388cb523b9e4bedea~4hv4MarJ72837828378eusmtrp1y;
 Mon,  2 Mar 2020 15:41:34 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-47-5e5d292e3e8a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BA.DF.07950.E292D5E5; Mon,  2
 Mar 2020 15:41:34 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154133eusmtip10621c2aca79c59c92381b24dda41de6e~4hv3YoBPT2417824178eusmtip1d;
 Mon,  2 Mar 2020 15:41:33 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH -next] video: fbdev: pxa168fb: remove unnecessary
 platform_get_irq
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <a5c01548-9d80-f586-7d74-bd80458446ce@samsung.com>
Date: Mon, 2 Mar 2020 16:41:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200117032241.59148-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjlt3vvdidO76bip5XGSMUiTTK5ZUhCf9yKwggjCrWltym5KZta
 Bpag1JgWPgmnWSo4M1/4zEdpak4T7Ikr0zIV8zUsbVGGkttV8r/zfeec7/wO/EhM0kO4kjHK
 BFallMVK+TZ4c9+fob2+3mHh+5pIejWnT0A3Pb9P0CVfxzD6vXmRTxd2z2J0x+g8ovvvfifo
 d21FfHrU/A0/ImT+ruQg5umvhzjTqhsTMOm9JoIp65jlMV8yDDxmud6NWR6rJULI8zaHo9jY
 mCRW5Rt00Sb6VXseEZ8mvDZ1ZxFPRdUCLSJJoPzBWOGuRTakhKpAYNb/FnDDTwSTP3p43LCM
 oKSzDNMiodVhyu7ic4QeQXvXKMYNJgTD+o/IouJThyD7dqUVO1DnoLexH7dgR8oT0l82Wg0Y
 ZURQVqEhLISICoLp6XKrCKd2Qd2LZ9a907p5abxnQyOGgYIpq0ZIBUJh4zjPgjHKGUamHmxg
 d2gxFVkDgBoWQG3aCsY1PQpDCw5cBQeYMzQKOLwdBnMzcU5fg2BVM7NhbkGgz13jc6pAGB1a
 4VsOYZQ31Lb5cutg+LQ0ibj7dvDBJObeYAc5zfc2YkWguSXh1J5QV17H34zVtj7CspBUt6WZ
 bksb3ZY2uv+5DxFeiZzZRLVCzqr9lOxVH7VMoU5Uyn0i4xT1aP1rDa4Zlp4g89tL3YgikdRW
 FIKFhUsIWZI6WdGNgMSkjqKTwgvhElGULPk6q4qLUCXGsuputI3Epc6i/aWzYRJKLktgr7Bs
 PKvaZHmk0DUV5WTkOVS/8RibGd9j6g850JOizez0qpFhI32lGQMBDYrjHv75N8yVAUaNMto4
 31Fs/zo264TLgj0v4ky+V7Dcq+Py1M4U2zaDpqD88TGxkYqsmqhvYFLsTsc5TSR17nALrZ+7
 6QbM59KD+iyX6sJZH23CYq9KfJZYKHavCj2VKsXV0TK/3ZhKLfsHcYv1C1YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xu7p6mrFxBt8Pq1r8nXSM3WLrwbms
 Fgsf3mW2uPL1PZvF7EMvmS323HnNaHGi7wOrxeVdc9gs7nx9zuLA6fH71yRGj73fFrB47Jx1
 l92j5chbVo/Fe14yedzvPs7k8XmTnMfnu+tZAzii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSM
 TCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DLO757CWtDMWfGk9z1LA+Na9i5GTg4JAROJtxMP
 sHUxcnEICSxllDh6ZitrFyMHUEJG4vj6MogaYYk/17qgal4zSvxedYIVJMEmYCUxsX0VI4gt
 LBAhcWTLCRYQW0RATaLl1BZmkAZmgeuMEpP+74Hq7mOU+PR3MRNIFa+AncSzZ8vAOlgEVCQ2
 HN0HNlUUaNLhHbMYIWoEJU7OfAJWwylgLTF7ywOwXmYBdYk/8y4xQ9jiEreezIeKy0tsfzuH
 eQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgZG67djPLTsY
 u94FH2IU4GBU4uH9wRAbJ8SaWFZcmXuIUYKDWUmE15czOk6INyWxsiq1KD++qDQntfgQoynQ
 cxOZpUST84FJJK8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2Ms
 f/qCS8WtyksFReeGNF0LaWefXc99MVy0RP5Vs+06Qc7GaRWpjvICRhYbivacTrBwCnknOzXs
 2bQp2i4R85dOlLjgeDNyY51syEUnj8wVlru4r0cfmRbZ2X591dUF09VCo4W+hb+SmfBtyo33
 rm9rjzIkPT7VdaIv+XJpcVah1L5Cc/+/u5VYijMSDbWYi4oTAVKfM4zqAgAA
X-CMS-MailID: 20200302154134eucas1p2f331781cba9fca808cc50129f35e05f2
X-Msg-Generator: CA
X-RootMTR: 20200117032301eucas1p29817dfa06b4140d9e30634cf0052a5dd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200117032301eucas1p29817dfa06b4140d9e30634cf0052a5dd
References: <CGME20200117032301eucas1p29817dfa06b4140d9e30634cf0052a5dd@eucas1p2.samsung.com>
 <20200117032241.59148-1-yuehaibing@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, arnd@arndb.de, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, hslester96@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/17/20 4:22 AM, YueHaibing wrote:
> commit 640ba2444fa9 ("drivers/video/pxa168fb.c: use devm_ functions")
> left behind this, it can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch queued for v5.7, thanks.
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/pxa168fb.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
> index 706c6943..aef8a30 100644
> --- a/drivers/video/fbdev/pxa168fb.c
> +++ b/drivers/video/fbdev/pxa168fb.c
> @@ -779,7 +779,6 @@ static int pxa168fb_remove(struct platform_device *pdev)
>  {
>  	struct pxa168fb_info *fbi = platform_get_drvdata(pdev);
>  	struct fb_info *info;
> -	int irq;
>  	unsigned int data;
>  
>  	if (!fbi)
> @@ -799,8 +798,6 @@ static int pxa168fb_remove(struct platform_device *pdev)
>  	if (info->cmap.len)
>  		fb_dealloc_cmap(&info->cmap);
>  
> -	irq = platform_get_irq(pdev, 0);
> -
>  	dma_free_wc(fbi->dev, info->fix.smem_len,
>  		    info->screen_base, info->fix.smem_start);
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

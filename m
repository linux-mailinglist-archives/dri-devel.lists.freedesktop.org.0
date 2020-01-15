Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3535913C82F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08126EAEA;
	Wed, 15 Jan 2020 15:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214C06EAEA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:42:43 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115154242euoutp024ddbc727e47813201cc01dbd7b95daa3~qGccgN3Qz1728617286euoutp02M
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:42:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200115154242euoutp024ddbc727e47813201cc01dbd7b95daa3~qGccgN3Qz1728617286euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579102962;
 bh=5UcOrZcqA2Gc029OVzaqHjJku0OF8oexgVfZBcw5ALo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=tApO0fcO2muxSsWhgxaWaMRThdd3/rOQoM2TD2/5J6IUXlWAywGl45oF2so7G6KK/
 c+5sy0UCvijV0HuNBKRk19AhQTIIc1cAZtNEwWXkIWfzzsiwXoXbr5fcBq7RCKwwGo
 V2XISi2FNk618NR3NZGPsseF0Kmn4ZywXMQJNW4g=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200115154242eucas1p2028e091c4f5d6430591c9308c0313b96~qGccbKMcS0110001100eucas1p2Y;
 Wed, 15 Jan 2020 15:42:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 32.E4.60698.2F23F1E5; Wed, 15
 Jan 2020 15:42:42 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115154241eucas1p21c72afb605f6ffc1620212d17d746ba3~qGccF34mD0110001100eucas1p2X;
 Wed, 15 Jan 2020 15:42:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200115154241eusmtrp1f903b55d574667a5152c9417c323f023~qGccFQY412598225982eusmtrp1Q;
 Wed, 15 Jan 2020 15:42:41 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-31-5e1f32f29a7b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 43.D0.07950.1F23F1E5; Wed, 15
 Jan 2020 15:42:41 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115154241eusmtip113989aba779e4c4827ea19af8343fba2~qGcbmTfEu3130831308eusmtip1k;
 Wed, 15 Jan 2020 15:42:41 +0000 (GMT)
Subject: Re: [PATCH] OMAP: DSS2: remove non-zero check on variable r
To: Colin King <colin.king@canonical.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <6a3951c7-4b17-6371-24ab-17742aeaa464@samsung.com>
Date: Wed, 15 Jan 2020 16:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191204152847.1435188-1-colin.king@canonical.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7qfjOTjDP5eEbD4vbqXzeLK1/ds
 FltvSVuc6PvAanF51xw2i9lL+lksVl/9yezA7jGroZfN4373cSaPu7cuMXl83iQXwBLFZZOS
 mpNZllqkb5fAlXHo91S2grm8FS//7WdtYDzB1cXIySEhYCLx6tEXli5GLg4hgRWMEgeOLYFy
 vjBKdH6/wQbhfGaUmNXxkx2mpfHtWiaIxHJGie/tN1khnLeMEo93XmYBqRIWcJE4sP4zYxcj
 B4eIgKbE+XNFIDXMAqcYJfpmdTCD1LAJWElMbF8FVsMrYCex6Wk+SJhFQFXi2+VTYGNEBSIk
 Pj04zApi8woISpyc+QQszingILGi/R0jiM0sIC5x68l8JghbXmL72znMILskBDaxSxz6+5cV
 4moXiYW7VjFD2MISr45vgfpGRuL05B4WiIZ1jBJ/O15AdW9nlFg++R8bRJW1xJ1zv9hALmUG
 +mb9Ln2IsKNEe/8ydpCwhACfxI23ghBH8ElM2jadGSLMK9HRJgRRrSaxYdkGNpi1XTtXMk9g
 VJqF5LVZSN6ZheSdWQh7FzCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMPKf/Hf+6
 g3Hfn6RDjAIcjEo8vBl/5OKEWBPLiitzDzFKcDArifCenCEbJ8SbklhZlVqUH19UmpNafIhR
 moNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVAPjHv/fzIkGso+9r3O4/t4qs02gqWPBCb6X
 Hz++XfJEU0Sqpp/7Usmpt05Vn7lCJ3Z7byk3ZWKunxhtUiN+z2V2kMOMfAXbWe+8N6V9Dg+c
 q5771FuJr+ncLV+vg6Lb81dqn9HrurI9XNp4wZoO3aI3Jx51XcxZNeON+r3FM9o5uGz499uH
 W3YosRRnJBpqMRcVJwIARcJ8xjgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7ofjeTjDNZcNLT4vbqXzeLK1/ds
 FltvSVuc6PvAanF51xw2i9lL+lksVl/9yezA7jGroZfN4373cSaPu7cuMXl83iQXwBKlZ1OU
 X1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl3Ho91S2grm8
 FS//7WdtYDzB1cXIySEhYCLR+HYtUxcjF4eQwFJGiSc/L7J3MXIAJWQkjq8vg6gRlvhzrYsN
 ouY1o8TmP6tZQRLCAi4SB9Z/ZgSpFxHQlDh/rgikhlngFKPExtY+VoiGyYwSMy6eZQRpYBOw
 kpjYvgqsgVfATmLT03yQMIuAqsS3y6dYQGxRgQiJwztmgZXzCghKnJz5BCzOKeAgsaL9HVic
 WUBd4s+8S8wQtrjErSfzmSBseYntb+cwT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfY
 SK84Mbe4NC9dLzk/dxMjMM62Hfu5ZQdj17vgQ4wCHIxKPLwH/snFCbEmlhVX5h5ilOBgVhLh
 PTlDNk6INyWxsiq1KD++qDQntfgQoynQcxOZpUST84EpIK8k3tDU0NzC0tDc2NzYzEJJnLdD
 4GCMkEB6YklqdmpqQWoRTB8TB6dUA+POl/9erX+fo7Siq/GvbXnL9ckLDl44HK180oThoPfJ
 sxLbXsy3qCxX1hBxa0kLM7tl7LuH8cmEJd98GyeHcnAbHvJ6eOPhPjaWKSLS9is3va2V+XD2
 /KJyFv0dX9rrX0wy6kphnZP2Ybv4NDG/oMXHDA0C//EV9wXum9Vazqgx9XfwvU8xN6YqsRRn
 JBpqMRcVJwIA7E4WqckCAAA=
X-CMS-MailID: 20200115154241eucas1p21c72afb605f6ffc1620212d17d746ba3
X-Msg-Generator: CA
X-RootMTR: 20191204152851epcas5p413006712eafa500de3013c2ce8a3bc02
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191204152851epcas5p413006712eafa500de3013c2ce8a3bc02
References: <CGME20191204152851epcas5p413006712eafa500de3013c2ce8a3bc02@epcas5p4.samsung.com>
 <20191204152847.1435188-1-colin.king@canonical.com>
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@nokia.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/4/19 4:28 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable r is being initialized to zero, so the check of a non-zero
> rv is redundant and can be removed.
> 
> It appears that the previous case statements set r to be -EINVAL
> and the "Fallthrough" comment afterwards suggested it was going
> to fall through to this non-zero check but won't because of the
> break statement. Remove the confusion by removing the Fallthrough
> comment too.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: b39a982ddecf ("OMAP: DSS2: omapfb driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch queued for v5.6, thanks.
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
> index 858c2c011d19..a2a2c1b205d9 100644
> --- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
> +++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
> @@ -1154,16 +1154,12 @@ static int _setcolreg(struct fb_info *fbi, u_int regno, u_int red, u_int green,
>  		   r = fbdev->ctrl->setcolreg(regno, red, green, blue,
>  		   transp, update_hw_pal);
>  		   */
> -		/* Fallthrough */
>  		r = -EINVAL;
>  		break;
>  	case OMAPFB_COLOR_RGB565:
>  	case OMAPFB_COLOR_RGB444:
>  	case OMAPFB_COLOR_RGB24P:
>  	case OMAPFB_COLOR_RGB24U:
> -		if (r != 0)
> -			break;
> -
>  		if (regno < 16) {
>  			u32 pal;
>  			pal = ((red >> (16 - var->red.length)) <<
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

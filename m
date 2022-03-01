Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981E94C8557
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDBE10E597;
	Tue,  1 Mar 2022 07:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCF810E527
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 07:40:37 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220301074035epoutp0193e4bc61ea25957b7503e002ffbb61a0~YMdCXdxOk3016830168epoutp01y
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 07:40:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220301074035epoutp0193e4bc61ea25957b7503e002ffbb61a0~YMdCXdxOk3016830168epoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1646120435;
 bh=s6hP65nYa7TlVceThfCQxX+SbM7LXQfHiNW5LQqKHGk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=kfCO/akMdMmBveI3irJ11vatbN2rCetfxxvVOQ7ZBNx16ROPbqApnWrEm5AMcVSNk
 ko915LErmhGuqu9xNdLSmgz9kfQ5TnsYai+uPnMHHHZwVCU/5bEVklZqBeU67Mm7kr
 O6QsO+MiBg4/6QHvUM5wZxScRIFyj2UnwZzrNtHQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220301074034epcas1p4ba8b93d614bf7de02eb51338d6fb60e9~YMdBYpJHw2477924779epcas1p4F;
 Tue,  1 Mar 2022 07:40:34 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.232]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4K78L61S9Fz4x9Pv; Tue,  1 Mar
 2022 07:40:30 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 C0.A9.09592.DEDCD126; Tue,  1 Mar 2022 16:40:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220301074029epcas1p2f38b9efd5825ae57b8e9ed802954ad04~YMc8JrWAb1403814038epcas1p2T;
 Tue,  1 Mar 2022 07:40:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220301074029epsmtrp11fd6c8835375f5c5bdad551daeb638a2~YMc8IzbXp1486414864epsmtrp19;
 Tue,  1 Mar 2022 07:40:29 +0000 (GMT)
X-AuditID: b6c32a37-28fff70000002578-d9-621dcded0677
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7C.54.29871.CEDCD126; Tue,  1 Mar 2022 16:40:28 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220301074028epsmtip28189d62a8a58bd024bef8ce88ec29a0f~YMc7ripAr1545115451epsmtip2O;
 Tue,  1 Mar 2022 07:40:28 +0000 (GMT)
Message-ID: <45867b37-1fb0-2f09-5961-6f099a1ed611@samsung.com>
Date: Tue, 1 Mar 2022 16:52:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/exynos: fimd: add BGR support for exynos4/5
Content-Language: en-US
To: =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>
From: Inki Dae <inki.dae@samsung.com>
In-Reply-To: <20220225093313.GA87542@adroid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmge67s7JJBi3LGC16z51ksvi/bSKz
 xZWv79ksXty7yGKx8e0PJouzTW/YLTY9vsZqcXnXHDaLGef3MVmc+TeVxWLG5JdsDtwesxp6
 2Tz2flvA4rFz1l12j+3fHrB63O8+zuSxeUm9R9+WVYwenzfJBXBEZdtkpCampBYppOYl56dk
 5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAB2qpFCWmFMKFApILC5W0rezKcov
 LUlVyMgvLrFVSi1IySkwLdArTswtLs1L18tLLbEyNDAwMgUqTMjO6F+zna3gg1fF3UvHmRsY
 22y7GDk5JARMJJat7GLuYuTiEBLYwSjxYOUPdgjnE6PE+Sc72SCcb4wSX+/fZ4FpeXZoMTOI
 LSSwl1Hi1jQtiKL3jBI3Hu4EK+IVsJPY/PE2WBGLgIpE34YP7BBxQYmTM5+A1YgKREi8PPKX
 CcQWFnCRmLPoMFicWUBc4taT+WBxEQFbifMH+lhBFjAL9DBL7Nq1mg0kwSagKjFxxX0wm1NA
 R+L37MOsEM3yEs1bZ4M9JCFwhEPi67JbTBBnu0h8mXqPDcIWlnh1fAs7hC0l8bK/jR2iYTKj
 xJ3rK1ggnBmMEod/XmeEqDKW2L90MtAkDqAVmhLrd+lDhBUldv6eywixmU/i3dceVpASCQFe
 iY42IYgSJYljF29ATZGQuLBkItQNHhI/jp1jncCoOAspYGYhBcAsJP/MQli8gJFlFaNYakFx
 bnpqsWGBMTy+k/NzNzGCk7GW+Q7GaW8/6B1iZOJgPMQowcGsJMJ78adMkhBvSmJlVWpRfnxR
 aU5q8SFGU2D0TGSWEk3OB+aDvJJ4QxNLAxMzI2MTC0MzQyVx3lXTTicKCaQnlqRmp6YWpBbB
 9DFxcEo1MInsPrmhOd9WdQk/Y9vcy0oT0vvCRf1y90dWZxQe26sio3/qetj8f6+3pW31nHTG
 5RGbtMis9N4L/htv5sucm2fTlDfdhmeBbMonlmxhVk0h36WlDGL/gnLX97V4vXsaOsf26ywG
 ve3fgqTez1hi83FW/G7p4z5/+BpMQh7/P7viyfayjLwtO7Z15gdIsDF0tGdUOnb/0Z1ewmpj
 yPuwkTfY/uTZLWxZapMb+5NEkp2f/To43zh1e9rWk4Hyd7fP7W/t/7v1wPLZDD2nfuc/b9b4
 LBaUu3/C8r/VDKnG3idCqhv+f+1y5ttbOc83haOAc01stMrs+W/rNkXpPD6p9++jQ4TPOZGZ
 JhJFO8RilFiKMxINtZiLihMBX6KBC08EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvO6bs7JJBhNWm1v0njvJZPF/20Rm
 iytf37NZvLh3kcVi49sfTBZnm96wW2x6fI3V4vKuOWwWM87vY7I4828qi8WMyS/ZHLg9ZjX0
 snns/baAxWPnrLvsHtu/PWD1uN99nMlj85J6j74tqxg9Pm+SC+CI4rJJSc3JLEst0rdL4Mro
 X7OdreCDV8XdS8eZGxjbbLsYOTkkBEwknh1azNzFyMUhJLCbUeLgkZlsXYwcQAkJiS1bOSBM
 YYnDh4shSt4ySuy++IUdpJdXwE5i88fbzCA2i4CKRN+GD1BxQYmTM5+wgNiiAhESbcumgNUI
 C7hIzFl0GCzOLCAucevJfCYQW0TAVuL8gT5WkAXMAn3MEqfmLGGB2LaOSeLtiXlgHWwCqhIT
 V9xnA7E5BXQkfs8+zApyHbOAusT6eUIQQ+UlmrfOZp7AKDQLyR2zkOybhdAxC0nHAkaWVYyS
 qQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwXGnpbmDcfuqD3qHGJk4GA8xSnAwK4nwXvwp
 kyTEm5JYWZValB9fVJqTWnyIUZqDRUmc90LXyXghgfTEktTs1NSC1CKYLBMHp1QDE+P2/nJJ
 czH+uxVmbp6cxjXOphP5tte3eczT05a889XwksJnr10Ob/iLD3Tp/DGKtfsjP2FT7J8NCs5M
 LeujimMKA5nz2lTO9hUtj7dds8vqidtGp/0hCq82yTknCgSf1Nn4fuPVffdeRnd91p596pr4
 26REYeaPEh1Jy1zmdRv6rWIIzNarme9+6/iPBis/ha038m9cPyvcs9PDbsGaVy5vTMW0+KVW
 CRaxzxFvPD4z7RyvTNHKKZZOPIfOixsZzrv9ij0jf/UP1Zx7/RuDAt68r9qWP+lng/LDf1X+
 d6JOh1cfeBAia9Nytt3x849tLrzbLJmdEzOkynkyJkRuORHPdVf7yRL+7GfaBeeVWIozEg21
 mIuKEwF30Z4HKgMAAA==
X-CMS-MailID: 20220301074029epcas1p2f38b9efd5825ae57b8e9ed802954ad04
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220129220203epcas1p25b1704191dd7babfb8d5b8dc6704d566
References: <CGME20220129220203epcas1p25b1704191dd7babfb8d5b8dc6704d566@epcas1p2.samsung.com>
 <20220129220153.GA33165@adroid>
 <5e18705f-79c1-18a7-57f2-74866abe21e9@samsung.com>
 <20220224232723.GA133007@adroid>
 <b9650211-2e98-5e1f-1dc9-9c5c3571f359@samsung.com>
 <20220225093313.GA87542@adroid>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin,

22. 2. 25. 18:33에 Martin Jücker 이(가) 쓴 글:
> Hello Inki,
> 
> On Fri, Feb 25, 2022 at 12:52:56PM +0900, Inki Dae wrote:
>> Hi Martin,
>>
>> 22. 2. 25. 08:27에 Martin Jücker 이(가) 쓴 글:
>>> Hello Inki,
>>>
>>> On Thu, Feb 24, 2022 at 10:41:04AM +0900, Inki Dae wrote:
>>>> Hi Martin.
>>>>
>>>> I found that exynos4 and 5 data sheet include documented same register.
>>>> RGB_ORDER_E field of VIDCONx registers will do same thing.
>>>
>>> If I read the manual correctly, this register combined with the
>>> RGB_ORDER_O makes it possible to map the whole RGB interface output to a
>>> different order. What my patch provides is a way to configure each
>>> hardware plane separately while maintaining a consistent output on the
>>> RGB interface.
>>>
>>
>> Understood. Your patch will allow BGR pixel order per a plane. Seems to be useful because a framebuffer with BGR pixel format can be displayed on screen without any color space conversion. :)
>>
>>> Implementing the RGB_ORDER_O and E would need some logic to make sure
>>> that all planes are always using the same RGB order.
>>>
>>>>
>>>> I'm not sure whether the use of undocumented register is safe or not - maybe some HW bug exists.
>>>
>>> I see, that makes sense. Would it be possible then to introduce a new
>>> compatible, e.g. samsung,exynos4210-fimd-ext which can be used on tested
>>
>> Seems providing a new compatible is not a good idea.
>>
>>> devices? I know that some other Galaxy Note and S devices with the
>>> exynos4 chip have the same problem (and solution).
>>
>> Could you give me more details about the same problem and its solution on the devices?
>> It would be useful for us to decide the upstream direction.
>>
>> If necessary then we may need to contact HW engineer for clarity.
> 
> Here is my current understanding of the situation:
> 
> The issue is related to Android and a recovery image having conflicting
> pixel formats on the same device. There is a solution in Replicant[1]
> for this using parameters for the fimd driver to force the pixel format
> to RGB or BGR. It's using the PNRMODE register on VIDCON0, but this
> solution needs two separate kernels to be built to add the parameter as
> the boot loader is not adjustable.
> 
> This was also discussed in dri-devel irc and it was proposed to expose
> both formats and fail the atomic commit if userspace tried to use both
> RGB and BGR formats at the same time. With this approach there should be
> something on the screen but it might happen that some users can't deal
> with the failing commits as it's rather difficult to find the cause and
> fix it on the go.

Thanks for sharing.

> 
> After that I accidentally discovered this undocumented register while
> reading the old vendor sources and it seems that it fixes all the

Are the old vendor sources using this undocumented register? If so then the use of the register would be safe.

> issues. At least if there are no HW bugs as you mentioned.

I will try to contact HW engineer and check if no problem.

Thanks,
Inki Dae

> 



> Kind Regards
> Martin
> 
> [1] https://protect2.fireeye.com/v1/url?k=d515db34-b4683348-d514507b-74fe485cc33c-0ee001ffdcafd932&q=1&e=851ccfed-b6fa-4794-8989-27ef28bc7ac6&u=https%3A%2F%2Fgit.replicant.us%2Freplicant-next%2Fkernel_replicant_linux%2Fcommit%2F%3Fh%3Dreplicant-11%26id%3Dcc5a0615b40cd5ede1eb87a60daa50333701a135
> 
>>
>> Thanks,
>> Inki Dae
>>
>>>
>>>>
>>>> Anyway, I'd like to recommend you to use documented register only.
>>>>
>>>> Sorry for late and thanks,
>>>> Inki Dae
>>>
>>> Kind Regards
>>> Martin
>>>
>>>>
>>>> 22. 1. 30. 07:01에 Martin Jücker 이(가) 쓴 글:
>>>>> In the downstream kernels for exynos4 and exynos5 devices, there is an
>>>>> undocumented register that controls the order of the RGB output. It can
>>>>> be set to either normal order or reversed, which enables BGR support for
>>>>> those SoCs.
>>>>>
>>>>> This patch enables the BGR support for all the SoCs that were found to
>>>>> have at least one device with this logic in the corresponding downstream
>>>>> kernels.
>>>>>
>>>>> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
>>>>> ---
>>>>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 42 ++++++++++++++++++++++--
>>>>>  include/video/samsung_fimd.h             |  4 +++
>>>>>  2 files changed, 44 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> index c735e53939d8..cb632360c968 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>>>> @@ -109,6 +109,7 @@ struct fimd_driver_data {
>>>>>  	unsigned int has_dp_clk:1;
>>>>>  	unsigned int has_hw_trigger:1;
>>>>>  	unsigned int has_trigger_per_te:1;
>>>>> +	unsigned int has_bgr_support:1;
>>>>>  };
>>>>>  
>>>>>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
>>>>> @@ -138,6 +139,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
>>>>>  	.lcdblk_bypass_shift = 1,
>>>>>  	.has_shadowcon = 1,
>>>>>  	.has_vtsel = 1,
>>>>> +	.has_bgr_support = 1,
>>>>>  };
>>>>>  
>>>>>  static struct fimd_driver_data exynos5_fimd_driver_data = {
>>>>> @@ -149,6 +151,7 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
>>>>>  	.has_vidoutcon = 1,
>>>>>  	.has_vtsel = 1,
>>>>>  	.has_dp_clk = 1,
>>>>> +	.has_bgr_support = 1,
>>>>>  };
>>>>>  
>>>>>  static struct fimd_driver_data exynos5420_fimd_driver_data = {
>>>>> @@ -162,6 +165,7 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
>>>>>  	.has_vtsel = 1,
>>>>>  	.has_mic_bypass = 1,
>>>>>  	.has_dp_clk = 1,
>>>>> +	.has_bgr_support = 1,
>>>>>  };
>>>>>  
>>>>>  struct fimd_context {
>>>>> @@ -226,6 +230,18 @@ static const uint32_t fimd_formats[] = {
>>>>>  	DRM_FORMAT_ARGB8888,
>>>>>  };
>>>>>  
>>>>> +static const uint32_t fimd_extended_formats[] = {
>>>>> +	DRM_FORMAT_C8,
>>>>> +	DRM_FORMAT_XRGB1555,
>>>>> +	DRM_FORMAT_XBGR1555,
>>>>> +	DRM_FORMAT_RGB565,
>>>>> +	DRM_FORMAT_BGR565,
>>>>> +	DRM_FORMAT_XRGB8888,
>>>>> +	DRM_FORMAT_XBGR8888,
>>>>> +	DRM_FORMAT_ARGB8888,
>>>>> +	DRM_FORMAT_ABGR8888,
>>>>> +};
>>>>> +
>>>>>  static const unsigned int capabilities[WINDOWS_NR] = {
>>>>>  	0,
>>>>>  	EXYNOS_DRM_PLANE_CAP_WIN_BLEND | EXYNOS_DRM_PLANE_CAP_PIX_BLEND,
>>>>> @@ -673,21 +689,25 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
>>>>>  		val |= WINCONx_BYTSWP;
>>>>>  		break;
>>>>>  	case DRM_FORMAT_XRGB1555:
>>>>> +	case DRM_FORMAT_XBGR1555:
>>>>>  		val |= WINCON0_BPPMODE_16BPP_1555;
>>>>>  		val |= WINCONx_HAWSWP;
>>>>>  		val |= WINCONx_BURSTLEN_16WORD;
>>>>>  		break;
>>>>>  	case DRM_FORMAT_RGB565:
>>>>> +	case DRM_FORMAT_BGR565:
>>>>>  		val |= WINCON0_BPPMODE_16BPP_565;
>>>>>  		val |= WINCONx_HAWSWP;
>>>>>  		val |= WINCONx_BURSTLEN_16WORD;
>>>>>  		break;
>>>>>  	case DRM_FORMAT_XRGB8888:
>>>>> +	case DRM_FORMAT_XBGR8888:
>>>>>  		val |= WINCON0_BPPMODE_24BPP_888;
>>>>>  		val |= WINCONx_WSWP;
>>>>>  		val |= WINCONx_BURSTLEN_16WORD;
>>>>>  		break;
>>>>>  	case DRM_FORMAT_ARGB8888:
>>>>> +	case DRM_FORMAT_ABGR8888:
>>>>>  	default:
>>>>>  		val |= WINCON1_BPPMODE_25BPP_A1888;
>>>>>  		val |= WINCONx_WSWP;
>>>>> @@ -695,6 +715,18 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
>>>>>  		break;
>>>>>  	}
>>>>>  
>>>>> +	switch (pixel_format) {
>>>>> +	case DRM_FORMAT_XBGR1555:
>>>>> +	case DRM_FORMAT_XBGR8888:
>>>>> +	case DRM_FORMAT_ABGR8888:
>>>>> +	case DRM_FORMAT_BGR565:
>>>>> +		writel(WIN_RGB_ORDER_REVERSE, ctx->regs + WIN_RGB_ORDER(win));
>>>>> +		break;
>>>>> +	default:
>>>>> +		writel(WIN_RGB_ORDER_FORWARD, ctx->regs + WIN_RGB_ORDER(win));
>>>>> +		break;
>>>>> +	}
>>>>> +
>>>>>  	/*
>>>>>  	 * Setting dma-burst to 16Word causes permanent tearing for very small
>>>>>  	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
>>>>> @@ -1074,8 +1106,14 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>>>>>  	ctx->drm_dev = drm_dev;
>>>>>  
>>>>>  	for (i = 0; i < WINDOWS_NR; i++) {
>>>>> -		ctx->configs[i].pixel_formats = fimd_formats;
>>>>> -		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
>>>>> +		if (ctx->driver_data->has_bgr_support) {
>>>>> +			ctx->configs[i].pixel_formats = fimd_extended_formats;
>>>>> +			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_extended_formats);
>>>>> +		} else {
>>>>> +			ctx->configs[i].pixel_formats = fimd_formats;
>>>>> +			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
>>>>> +		}
>>>>> +
>>>>>  		ctx->configs[i].zpos = i;
>>>>>  		ctx->configs[i].type = fimd_win_types[i];
>>>>>  		ctx->configs[i].capabilities = capabilities[i];
>>>>> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
>>>>> index c4a93ce1de48..e6966d187591 100644
>>>>> --- a/include/video/samsung_fimd.h
>>>>> +++ b/include/video/samsung_fimd.h
>>>>> @@ -476,6 +476,10 @@
>>>>>   * 1111		-none-	 -none-   -none-   -none-    -none-
>>>>>  */
>>>>>  
>>>>> +#define WIN_RGB_ORDER(_win)			(0x2020 + ((_win) * 4))
>>>>> +#define WIN_RGB_ORDER_FORWARD			(0 << 11)
>>>>> +#define WIN_RGB_ORDER_REVERSE			(1 << 11)
>>>>> +
>>>>>  /* FIMD Version 8 register offset definitions */
>>>>>  #define FIMD_V8_VIDTCON0	0x20010
>>>>>  #define FIMD_V8_VIDTCON1	0x20014
>>>
> 

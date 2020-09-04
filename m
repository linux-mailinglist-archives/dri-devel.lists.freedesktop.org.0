Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFD25D254
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D176EA8C;
	Fri,  4 Sep 2020 07:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0506EA8C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 07:28:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904072829euoutp020912978bd8e7ecc3753e88f2c8f1ede9~xhAdJ6StS1354813548euoutp02P
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 07:28:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904072829euoutp020912978bd8e7ecc3753e88f2c8f1ede9~xhAdJ6StS1354813548euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599204509;
 bh=/luka6O8tQmQC+CLQPjkd8M2eOCfrb18ULApQWDFayo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Wi+Nidlb9NhmL1W3difNQMO+T3TgxkafophTicOijU1NvvKeAQOGTcVK0z67Oodsp
 v2h7gFNxf8O6RkuJYjpwPkftia6KDigJdM9o+irSEIMthKKtTmf1XjVT+y0cpPmyiW
 P3pOnc5HHyUiRd9nEwlQtEgkK5CI3IBZCmTrVwn8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200904072829eucas1p28bbad0d7b5be0d28993650082eed32dd~xhAdD04fD2946229462eucas1p2w;
 Fri,  4 Sep 2020 07:28:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 2E.B8.06456.D9CE15F5; Fri,  4
 Sep 2020 08:28:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904072829eucas1p19256652ad2a0f155fbe048fe0fead505~xhAcqxfVq0715107151eucas1p1W;
 Fri,  4 Sep 2020 07:28:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904072828eusmtrp2ad1f439f525315fa25a159856d87414a~xhAcqJWd31062510625eusmtrp2H;
 Fri,  4 Sep 2020 07:28:28 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-ed-5f51ec9d7420
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6D.48.06314.C9CE15F5; Fri,  4
 Sep 2020 08:28:28 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904072828eusmtip13fe683db3791fd332c7a80e6875405de~xhAcKnOOT1102411024eusmtip1a;
 Fri,  4 Sep 2020 07:28:28 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Drop local dma_parms
To: Robin Murphy <robin.murphy@arm.com>, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <fedadf3b-f9f8-b959-6e25-e687ad8a78f3@samsung.com>
Date: Fri, 4 Sep 2020 09:28:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87pz3wTGGxw5Jmxx5et7NotJ9yew
 WLy4d5HF4mzTG3aLTY+vsVrMOL+PyeLghydA1uSXbA4cHmvmrWH0uN99nMlj85J6j74tqxg9
 Pm+SC2CN4rJJSc3JLEst0rdL4Mo49imq4IBIRc/pVpYGxmsCXYycHBICJhLPdp1hBrGFBFYw
 Sixps+9i5AKyvzBKdG98zwrhfGaUOHOjlRmm48SnZewQieWMEt+n/2eBcN4zSjT8a2ACqRIW
 MJW4cO8mWLuIQDejxJolIFWcHMwCeRILNhxhBLHZBAwlut52sYHYvAJ2EjtWzAZrZhFQkTh/
 +xeYLSoQJ3Hs1CMWiBpBiZMzn4DZnALREle6zzNDzJSX2P52DpQtLnHryXwmkMUSAuvYJbY/
 fAjUwAHkuEicWZ0H8YKwxKvjW9ghbBmJ/zth6psZJR6eW8sO4fQwSlxumsEIUWUtcefcLzaQ
 QcwCmhLrd+lDhB0lGve+ZIWYzydx460gxA18EpO2TWeGCPNKdLQJQVSrScw6vg5u7cELl5gn
 MCrNQvLZLCTfzELyzSyEvQsYWVYxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIEpqLT/45/
 2sH49VLSIUYBDkYlHt4b7wPihVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI
 UZqDRUmc13jRy1ghgfTEktTs1NSC1CKYLBMHp1QD46Svrc+/qS/s9D19Pb4lSiH0kcbb1BlR
 R/avyFrOrD9TrrypdaYN780g1yeJXyVF+76sv1i6I+vIoUgGjdTFUp9PF/7fs7TDy6997f6v
 1781a1/kMnK5PmnLtguMzv1P5semdqsmiq2xZLzkcCpEMOe6p2Vaeem0aa/N49kEgjjfxEYs
 N+sOUmIpzkg01GIuKk4EANSosONBAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xu7pz3gTGG/xtM7e48vU9m8Wk+xNY
 LF7cu8hicbbpDbvFpsfXWC1mnN/HZHHwwxMga/JLNgcOjzXz1jB63O8+zuSxeUm9R9+WVYwe
 nzfJBbBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl
 6GUc+xRVcECkoud0K0sD4zWBLkZODgkBE4kTn5axdzFycQgJLGWUuPDmMTNEQkbi5LQGVghb
 WOLPtS42iKK3jBITzywEKxIWMJW4cO8mWJGIQDejxKTD8iA2s0CexPvdF6GmrmMEcrYzgiTY
 BAwlut6CTOLk4BWwk9ixYjYTiM0ioCJx/vYvMFtUIE7iTM8LqBpBiZMzn7CA2JwC0RJXus8z
 Qywwk5i3+SGULS+x/e0cKFtc4taT+UwTGIVmIWmfhaRlFpKWWUhaFjCyrGIUSS0tzk3PLTbU
 K07MLS7NS9dLzs/dxAiMvm3Hfm7ewXhpY/AhRgEORiUe3hvvA+KFWBPLiitzDzFKcDArifA6
 nT0dJ8SbklhZlVqUH19UmpNafIjRFOi5icxSosn5wMSQVxJvaGpobmFpaG5sbmxmoSTO2yFw
 MEZIID2xJDU7NbUgtQimj4mDU6qBseKC4dfdM57K/Z3juiR0+7SrV6xavRuvKB63W6rSxP+l
 yIhFqX3FyXudacFti09clC4Vjn1vs7GOf53m24fTs37vKmNTiX1zVVeUs+vHw5vPNvBNitW+
 Ebzu8HQ5KbbIP1N+REcxlh33epVzcSbPnrm6/PldDi0tl+qP5j6TEFiyS7VFpL5BW4mlOCPR
 UIu5qDgRABB0k+XUAgAA
X-CMS-MailID: 20200904072829eucas1p19256652ad2a0f155fbe048fe0fead505
X-Msg-Generator: CA
X-RootMTR: 20200903205201eucas1p124161a3310b7a0a3ba077a8369daa45b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200903205201eucas1p124161a3310b7a0a3ba077a8369daa45b
References: <CGME20200903205201eucas1p124161a3310b7a0a3ba077a8369daa45b@eucas1p1.samsung.com>
 <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On 03.09.2020 22:51, Robin Murphy wrote:
> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> for platform devices"), struct platform_device already provides a
> dma_parms structure, so we can save allocating another one.
>
> Also the DMA segment size is simply a size, not a bitmask.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

I've sent a similar patch over 2 months ago, but it looks it got lost:

https://lore.kernel.org/dri-devel/20200707110827.3760-1-m.szyprowski@samsung.com/

Inki, could You queue it for merge?

> ---
>   drivers/gpu/drm/exynos/exynos_drm_dma.c | 26 +------------------------
>   1 file changed, 1 insertion(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 58b89ec11b0e..9f25a5ebbf7d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -31,23 +31,6 @@
>   #define EXYNOS_DEV_ADDR_START	0x20000000
>   #define EXYNOS_DEV_ADDR_SIZE	0x40000000
>   
> -static inline int configure_dma_max_seg_size(struct device *dev)
> -{
> -	if (!dev->dma_parms)
> -		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> -	if (!dev->dma_parms)
> -		return -ENOMEM;
> -
> -	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> -	return 0;
> -}
> -
> -static inline void clear_dma_max_seg_size(struct device *dev)
> -{
> -	kfree(dev->dma_parms);
> -	dev->dma_parms = NULL;
> -}
> -
>   /*
>    * drm_iommu_attach_device- attach device to iommu mapping
>    *
> @@ -69,9 +52,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>   		return -EINVAL;
>   	}
>   
> -	ret = configure_dma_max_seg_size(subdrv_dev);
> -	if (ret)
> -		return ret;
> +	dma_set_max_seg_size(subdrv_dev, UINT_MAX);
>   
>   	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>   		/*
> @@ -89,9 +70,6 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>   		ret = iommu_attach_device(priv->mapping, subdrv_dev);
>   	}
>   
> -	if (ret)
> -		clear_dma_max_seg_size(subdrv_dev);
> -
>   	return ret;
>   }
>   
> @@ -114,8 +92,6 @@ static void drm_iommu_detach_device(struct drm_device *drm_dev,
>   		arm_iommu_attach_device(subdrv_dev, *dma_priv);
>   	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
>   		iommu_detach_device(priv->mapping, subdrv_dev);
> -
> -	clear_dma_max_seg_size(subdrv_dev);
>   }
>   
>   int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

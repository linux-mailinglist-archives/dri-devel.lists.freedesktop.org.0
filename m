Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136C31B1F0F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372BE6E8A6;
	Tue, 21 Apr 2020 06:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA936E843
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 19:51:07 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id a23so4347437plm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cXndO/9atMRBj3ki1OBgBAxeMbivxmBoqy5um/+TbH8=;
 b=aKHshmB81P4jVzDuwe3k2sHJgUvtTm1Mcpd9HHn/+ZTXeDzs7LPgFHPinxZV33OTkh
 pLup8x0WaJi7Rrvq6bARbjU8MnPvOUz5zJ3g9oxEkLBsKDGJqaVZWwXxnYq1LL6H1qil
 tr81s68QkcTewzitq+PCd8ExjXkLEROJBeVCzKrIcaoq2OdEGEhcFOUG7KR85Pc97QDH
 84FqeclwwQj8vxNGHVZBKGCtRCMAcAaDadYuUhNJrNdDxQ1EZqIJU2RtbsCz9PD6tmd1
 qJWWGZ7TrLLUAGVfObzkBCWMqvO4NuJBKPEQiRHjO0zwiEkLg5DxUBkdmMsLmlKs479o
 C9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cXndO/9atMRBj3ki1OBgBAxeMbivxmBoqy5um/+TbH8=;
 b=nB/XJYpXe0+kvTBVualCnax8EFpEsB3YnLoxPEuB7uwVZkOIbLWEC45iQR/Fbtk+6G
 wrofXdx9jO31pjrk1YlcBfuaOarEa5cvxi7TFWP1c/eyyIer8C76DVG/7rZHj3gLUcFP
 MeU7ZEdPRQYsSDCItxFQbiUBphpiZkmG21nR1khe0C1g/C0cumzjaVUlGfbzQoVngZc5
 34+/Ql9X1nulYDtoKNQwhaQ1kBRW+xmQTddOi0uWOAXPvauxcbx4MEq2xTtMPGWFosHN
 zopAPjJ6JfHOltwpZYU6Emp5ERUuWxhHV7O2isqREO44B/Ss0CQAzMN4IQOie7lo6Wem
 HcXA==
X-Gm-Message-State: AGi0Pubx6VuW/0GeOlp2IpIvfqEG51jeJyH20DX8JoAPppKauRbZC5go
 ffMAo2BbuHGVM1tFyybd9e8eeQ==
X-Google-Smtp-Source: APiQypKiYnTS3YZu4PQkYRxyoy2DcBPSp/lxOL17ZNtEaP8IVuejdUpKA+GupS/4BaQVy3zMZNf0Xg==
X-Received: by 2002:a17:902:7618:: with SMTP id
 k24mr8746327pll.71.1587412267357; 
 Mon, 20 Apr 2020 12:51:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id d8sm289923pfd.159.2020.04.20.12.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 12:51:06 -0700 (PDT)
Date: Mon, 20 Apr 2020 12:51:30 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/9] Revert "drm/msm/a6xx: Use the DMA API for GMU memory
 objects"
Message-ID: <20200420195130.GQ576963@builder.lan>
References: <20200420140313.7263-1-jonathan@marek.ca>
 <20200420140313.7263-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420140313.7263-3-jonathan@marek.ca>
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 20 Apr 07:03 PDT 2020, Jonathan Marek wrote:

> This reverts commit a5fb8b918920c6f7706a8b5b8ea535a7f077a7f6.

Why?

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 115 +++++++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   6 +-
>  2 files changed, 107 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index c4e71abbdd53..748cd379065f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2,7 +2,6 @@
>  /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. */
>  
>  #include <linux/clk.h>
> -#include <linux/dma-mapping.h>
>  #include <linux/interconnect.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
> @@ -921,10 +920,21 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>  
>  static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo)
>  {
> +	int count, i;
> +	u64 iova;
> +
>  	if (IS_ERR_OR_NULL(bo))
>  		return;
>  
> -	dma_free_wc(gmu->dev, bo->size, bo->virt, bo->iova);
> +	count = bo->size >> PAGE_SHIFT;
> +	iova = bo->iova;
> +
> +	for (i = 0; i < count; i++, iova += PAGE_SIZE) {
> +		iommu_unmap(gmu->domain, iova, PAGE_SIZE);
> +		__free_pages(bo->pages[i], 0);
> +	}
> +
> +	kfree(bo->pages);
>  	kfree(bo);
>  }
>  
> @@ -932,6 +942,7 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
>  		size_t size)
>  {
>  	struct a6xx_gmu_bo *bo;
> +	int ret, count, i;
>  
>  	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>  	if (!bo)
> @@ -939,14 +950,86 @@ static struct a6xx_gmu_bo *a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu,
>  
>  	bo->size = PAGE_ALIGN(size);
>  
> -	bo->virt = dma_alloc_wc(gmu->dev, bo->size, &bo->iova, GFP_KERNEL);
> +	count = bo->size >> PAGE_SHIFT;
>  
> -	if (!bo->virt) {
> +	bo->pages = kcalloc(count, sizeof(struct page *), GFP_KERNEL);
> +	if (!bo->pages) {
>  		kfree(bo);
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> +	for (i = 0; i < count; i++) {
> +		bo->pages[i] = alloc_page(GFP_KERNEL);
> +		if (!bo->pages[i])
> +			goto err;
> +	}
> +
> +	bo->iova = gmu->uncached_iova_base;
> +
> +	for (i = 0; i < count; i++) {
> +		ret = iommu_map(gmu->domain,
> +			bo->iova + (PAGE_SIZE * i),
> +			page_to_phys(bo->pages[i]), PAGE_SIZE,
> +			IOMMU_READ | IOMMU_WRITE);
> +
> +		if (ret) {
> +			DRM_DEV_ERROR(gmu->dev, "Unable to map GMU buffer object\n");
> +
> +			for (i = i - 1 ; i >= 0; i--)
> +				iommu_unmap(gmu->domain,
> +					bo->iova + (PAGE_SIZE * i),
> +					PAGE_SIZE);
> +
> +			goto err;
> +		}
> +	}
> +
> +	bo->virt = vmap(bo->pages, count, VM_IOREMAP,
> +		pgprot_writecombine(PAGE_KERNEL));
> +	if (!bo->virt)
> +		goto err;
> +
> +	/* Align future IOVA addresses on 1MB boundaries */
> +	gmu->uncached_iova_base += ALIGN(size, SZ_1M);
> +
>  	return bo;
> +
> +err:
> +	for (i = 0; i < count; i++) {
> +		if (bo->pages[i])
> +			__free_pages(bo->pages[i], 0);
> +	}
> +
> +	kfree(bo->pages);
> +	kfree(bo);
> +
> +	return ERR_PTR(-ENOMEM);
> +}
> +
> +static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
> +{
> +	int ret;
> +
> +	/*
> +	 * The GMU address space is hardcoded to treat the range
> +	 * 0x60000000 - 0x80000000 as un-cached memory. All buffers shared
> +	 * between the GMU and the CPU will live in this space
> +	 */
> +	gmu->uncached_iova_base = 0x60000000;
> +
> +
> +	gmu->domain = iommu_domain_alloc(&platform_bus_type);
> +	if (!gmu->domain)
> +		return -ENODEV;
> +
> +	ret = iommu_attach_device(gmu->domain, gmu->dev);
> +
> +	if (ret) {
> +		iommu_domain_free(gmu->domain);
> +		gmu->domain = NULL;
> +	}
> +
> +	return ret;
>  }
>  
>  /* Return the 'arc-level' for the given frequency */
> @@ -1206,6 +1289,10 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  
>  	a6xx_gmu_memory_free(gmu, gmu->hfi);
>  
> +	iommu_detach_device(gmu->domain, gmu->dev);
> +
> +	iommu_domain_free(gmu->domain);
> +
>  	free_irq(gmu->gmu_irq, gmu);
>  	free_irq(gmu->hfi_irq, gmu);
>  
> @@ -1226,15 +1313,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  	gmu->dev = &pdev->dev;
>  
> -	/* Pass force_dma false to require the DT to set the dma region */
> -	ret = of_dma_configure(gmu->dev, node, false);
> -	if (ret)
> -		return ret;
> -
> -	/* Set the mask after the of_dma_configure() */
> -	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(31));
> -	if (ret)
> -		return ret;
> +	of_dma_configure(gmu->dev, node, true);
>  
>  	/* Fow now, don't do anything fancy until we get our feet under us */
>  	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
> @@ -1246,6 +1325,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	if (ret)
>  		goto err_put_device;
>  
> +	/* Set up the IOMMU context bank */
> +	ret = a6xx_gmu_memory_probe(gmu);
> +	if (ret)
> +		goto err_put_device;
> +
>  	/* Allocate memory for for the HFI queues */
>  	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
>  	if (IS_ERR(gmu->hfi))
> @@ -1291,6 +1375,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  err_memory:
>  	a6xx_gmu_memory_free(gmu, gmu->hfi);
>  
> +	if (gmu->domain) {
> +		iommu_detach_device(gmu->domain, gmu->dev);
> +
> +		iommu_domain_free(gmu->domain);
> +	}
>  	ret = -ENODEV;
>  
>  err_put_device:
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 4af65a36d5ca..2af91ed7ed0c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -12,7 +12,8 @@
>  struct a6xx_gmu_bo {
>  	void *virt;
>  	size_t size;
> -	dma_addr_t iova;
> +	u64 iova;
> +	struct page **pages;
>  };
>  
>  /*
> @@ -48,6 +49,9 @@ struct a6xx_gmu {
>  	int hfi_irq;
>  	int gmu_irq;
>  
> +	struct iommu_domain *domain;
> +	u64 uncached_iova_base;
> +
>  	struct device *gxpd;
>  
>  	int idle_level;
> -- 
> 2.26.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

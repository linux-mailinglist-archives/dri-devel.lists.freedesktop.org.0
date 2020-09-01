Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48290258926
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B279E6E5CF;
	Tue,  1 Sep 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996E26E186
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 05:23:22 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id a6so9228oog.9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 22:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BnpD/Vlam+cdqGijHqW486BRKxvLJiEvQmtEvUrVV/8=;
 b=RXvDclUibfITB5XgmsUt3dQBw1Lu336IBL/q044Nyc8SS+2NVvzOrlKzAfdckai356
 7zDAt6qzgZ/bz04YPJDFTUftc7U1ru2RiQkz01yjbSB1it8naNpOGkBrrLO86BsWYxGL
 k6KJBMXcUm9LZ8pCg7D8GmwyGR+cCFxmPZPMOhBcYC9gYarhmwl3os9IcdbgPaIilCCq
 iJ2dfX1SfdggKwUtEKyjm9CtLFiiqBfypgSO1wNgi1/HeYO+pBKWfuLzuosrKY/vD27b
 e6Ov0d4KPm9uYEWRUaFrWSa2p3saTgHHnzJpo9VKfa3dnjGzLn6iKE1ZPaktU9nszhYr
 nw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BnpD/Vlam+cdqGijHqW486BRKxvLJiEvQmtEvUrVV/8=;
 b=fUkXA+1i/v3M3i499kw/c6SIhFauRT8uSEz7fY3MKgo9Q3HzVG/gU3nOjElVeSGOe3
 w9s272L3hJb0jy8hPC0Hr6Y6GWrbo+S9Yz2eR67L3uI6rKsNzXKD8pxAWidaii463Yvs
 YKqleWOm12vFbNWW5bSfAv10wpWoutEgrEQHKYWjtTOAtiGQlHI59d1vZNUTQb3xM+hN
 bDnDOBnDRu3+KrhVoMdQSCyaj4vFsqCh1kSRfNhzSDAcqyfwauQjAZXqQJ4uwFPe67Qa
 Pi14IOYKFQ6f3IXYBMq1zFZ4KlvhWUVdW3UIq6nWtlI9mw4ZDIjksuUjZ9v4x9vAUbqD
 ONJw==
X-Gm-Message-State: AOAM532BvxtwEwj10tJ2F5n+atjVWczj+ukKnU65ITg/gO5GzI8t+qir
 zoTW/bS1fG7nYuowrUE2/7z21w==
X-Google-Smtp-Source: ABdhPJwh7GfcK/oYOq0H3c5/JwiVODNwbdAuGC5Eny+WXgrJ2QeIAmHdU3adMzxILAvKZuc4GzUJgg==
X-Received: by 2002:a4a:d588:: with SMTP id z8mr2659oos.84.1598937801826;
 Mon, 31 Aug 2020 22:23:21 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id t5sm1917902oic.20.2020.08.31.22.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 22:23:21 -0700 (PDT)
Date: Tue, 1 Sep 2020 00:23:17 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 13/19] drm/msm: Set the global virtual address range from
 the IOMMU domain
Message-ID: <20200901052317.GU3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-14-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-14-robdclark@gmail.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, iommu@lists.linux-foundation.org,
 Jonathan Marek <jonathan@marek.ca>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Use the aperture settings from the IOMMU domain to set up the virtual
> address range for the GPU. This allows us to transparently deal with
> IOMMU side features (like split pagetables).
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 +++++++++++--
>  drivers/gpu/drm/msm/msm_iommu.c         |  7 +++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 533a34b4cce2..34e6242c1767 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -192,9 +192,18 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>  	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
>  	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
>  	struct msm_gem_address_space *aspace;
> +	u64 start, size;
>  
> -	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> -		0xffffffff - SZ_16M);
> +	/*
> +	 * Use the aperture start or SZ_16M, whichever is greater. This will
> +	 * ensure that we align with the allocated pagetable range while still
> +	 * allowing room in the lower 32 bits for GMEM and whatnot
> +	 */
> +	start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> +	size = iommu->geometry.aperture_end - start + 1;
> +
> +	aspace = msm_gem_address_space_create(mmu, "gpu",
> +		start & GENMASK(48, 0), size);
>  
>  	if (IS_ERR(aspace) && !IS_ERR(mmu))
>  		mmu->funcs->destroy(mmu);
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 3a381a9674c9..1b6635504069 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -36,6 +36,10 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
>  	struct msm_iommu *iommu = to_msm_iommu(mmu);
>  	size_t ret;
>  
> +	/* The arm-smmu driver expects the addresses to be sign extended */
> +	if (iova & BIT_ULL(48))
> +		iova |= GENMASK_ULL(63, 49);
> +
>  	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
>  	WARN_ON(!ret);
>  
> @@ -46,6 +50,9 @@ static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
>  {
>  	struct msm_iommu *iommu = to_msm_iommu(mmu);
>  
> +	if (iova & BIT_ULL(48))
> +		iova |= GENMASK_ULL(63, 49);
> +
>  	iommu_unmap(iommu->domain, iova, len);
>  
>  	return 0;
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

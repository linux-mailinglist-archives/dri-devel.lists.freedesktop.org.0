Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F626854D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309836E1CF;
	Mon, 14 Sep 2020 07:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1C76E10B
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 03:14:46 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 185so13860518oie.11
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 20:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eCqlMmeFwnaJqMzKobKwxzuAcoUu5Y/KrYbNh4cg/CI=;
 b=DSkn8ROU3zelVpsj2ReGD/hlM9SmL8+oVHeuo55D3Ic0A6eMcy5rkmr99lJJzVFgZo
 8gUsA0TI+kmEXjjmeOQh6QNCZsbI8E0b1I14BakseeoBK2LIdqXrPdEhoSKSLbp2Bu3K
 +UyKDxO97lMNDMcpJjVvVQbFBCEgJx5kcua5mSGE/Pq859gjwaGn+Lec2G++4Z/wS1dK
 WJYf5gt/PDgM/aZR5xORixMOF17AHJ0KiYoJEfUouANo012fcDfXjes/jUKVdWG3j7W7
 4+VD16X+/V971rzUV+N6mXkdlnh1T1e+9WTMD1pZCBXxiqky3Rl+zcxN0EcbPRrHC1+S
 r5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eCqlMmeFwnaJqMzKobKwxzuAcoUu5Y/KrYbNh4cg/CI=;
 b=j6LglmoAEKbSoh51r1pZ3LySm2qzuhAe2WASfwvXR+H31XMVRNQSLzvPqoUuQw8LMp
 5PKqQhWMVVyKt8RPN9zlcjKS8/P9xRbnAGb5s5cWwcc69CVQO8AwZWMz3WAerr3BoEx3
 6i7q9PfmiwvHYs4b1m9YoJWtdTeYhLA5XUqe4I0AigqMrz1oFCUUEhJxWOxo/xo4YUN8
 u9UKXrICxNGUVTo53WGXdSRGvE+m3lc42FHO1fUvDJoioXcTca3GZwLQy1IPOhhXPXh9
 Xx0ZW3N+JdyBLW2mw3liwUSA/zMy4zawSg4ZSIAwnvoWSvSZ0jg6FQxQxUx0KKRC2Nik
 U3Sg==
X-Gm-Message-State: AOAM530BjwSDaq4G2M13MFUVfyYL61CB958T1H/5e7nXQxpUVpxpWFnq
 DPBOcEvOWlv+kMX6iljfCFtmQg==
X-Google-Smtp-Source: ABdhPJwbeFPrbjxKAQIpdugGlybxZzVcWEtLsjEIfZtzkecp8+WvSdNWhEUJeeUEm54+jzLXONtJoQ==
X-Received: by 2002:a05:6808:601:: with SMTP id y1mr5490419oih.9.1599966885546; 
 Sat, 12 Sep 2020 20:14:45 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id w19sm1192469otq.70.2020.09.12.20.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 20:14:44 -0700 (PDT)
Date: Sat, 12 Sep 2020 22:14:42 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH] drm/msm/adreno: fix probe without iommu
Message-ID: <20200913031442.GS3715@yoga>
References: <20200911160854.484114-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911160854.484114-1-luca@z3ntu.xyz>
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 11 Sep 11:08 CDT 2020, Luca Weiss wrote:

> The function iommu_domain_alloc returns NULL on platforms without IOMMU
> such as msm8974. This resulted in PTR_ERR(-ENODEV) being assigned to
> gpu->aspace so the correct code path wasn't taken.
> 
> Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 862dd35b27d3..6e8bef1a9ea2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -189,10 +189,16 @@ struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>  		struct platform_device *pdev)
>  {
> -	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> -	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> +	struct iommu_domain *iommu;
> +	struct msm_mmu *mmu;
>  	struct msm_gem_address_space *aspace;
>  
> +	iommu = iommu_domain_alloc(&platform_bus_type);
> +	if (!iommu)
> +		return NULL;
> +
> +	mmu = msm_iommu_new(&pdev->dev, iommu);
> +
>  	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
>  		0xffffffff - SZ_16M);
>  
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

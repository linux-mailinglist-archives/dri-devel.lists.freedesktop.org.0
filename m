Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C03C258933
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6766E7E5;
	Tue,  1 Sep 2020 07:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1022A6E56D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 03:36:54 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id u24so2962706oic.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 20:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3bbR697W940r4qzYtPEkaaefcfDcXbIb27x0eRbQn1Q=;
 b=t88wyukFrGBP19mHYjYTWsz3cjpW6QpEg7Ltbz+G5xqv1PsMrwfuqtT+tsBMRaFiAe
 4gPWkDGMc/WT3t+OYUgDhDsySC1lQoBqPFXqCkKy/yNF7uKG0CBKbSLjEcYi8r99wzkD
 zJ1uKKejvBjXEpmdvoN6S1Kw1Lszf8WchWPjqE6kBvVrLaMFqaxCLB8jHPVd05sLjn5w
 Sn+IUjF1T8S8Vk2Gcxs12RcZw9Hv+7upag/QjiMCAT5OFVNyus4MjWThnyDI47KSEHer
 iinAg7zWc3pxEuBAlyWYMLY4fj4xuriYi3LKpZ+nfuCVl8br024gHoMVW+1TKqgidBXf
 4pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3bbR697W940r4qzYtPEkaaefcfDcXbIb27x0eRbQn1Q=;
 b=RhL/qt9CpQeS5WTLR/SYIOGdTNLN9V/pHla4X1nU0drlf4IFvZTx498Em6Tby/50TJ
 43uMoMSQc8dKjZFantfnE8nlapq9ju98Q6Lx50e+ZsUlj9mbx/QkGJ21gW1BSfR0xJOF
 Haru+NjHQSvxqnjTeXMc/tgVFH0zWnAtGLp3FlMYfZYg4r2RJabgGUGoeWcNonS4lMb8
 ZGjYH4BDvmK12bALQOi1gxo+VnXV492Ivf1K33vmbtZZXaBRajyzvmv+zTbLDRcleGK8
 7JeJ26iTa9OENtrmQ4Bhhdma/o1OAWV44mhlP0DmKBobzXL58Ai0t7bLHbv3b1rhBfea
 rCeA==
X-Gm-Message-State: AOAM533EePG7khXVq0u2wjcfRrt9a3NDOFI0ex/EydTZfX5Fl3zGfk3s
 nRxjvmlUNdUpu1by0b2rHzVFIA==
X-Google-Smtp-Source: ABdhPJzjeGy+/ZDGjjXngyiAJQe6e3aEgxmZgSoz2VhDdCQaWZ2XBv1SUodwsR+dKUEuJnH+tsgDPw==
X-Received: by 2002:aca:5413:: with SMTP id i19mr16131oib.105.1598931413164;
 Mon, 31 Aug 2020 20:36:53 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id w136sm2050529oif.14.2020.08.31.20.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 20:36:52 -0700 (PDT)
Date: Mon, 31 Aug 2020 22:36:35 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 02/19] iommu/arm-smmu: Pass io-pgtable config to
 implementation specific function
Message-ID: <20200901033635.GK3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-3-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 Krishna Reddy <vdumpa@nvidia.com>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:40 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Construct the io-pgtable config before calling the implementation specific
> init_context function and pass it so the implementation specific function
> can get a chance to change it before the io-pgtable is created.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  3 ++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 11 ++++++-----
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  3 ++-
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index f4ff124a1967..a9861dcd0884 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -68,7 +68,8 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
>  	return 0;
>  }
>  
> -static int cavium_init_context(struct arm_smmu_domain *smmu_domain)
> +static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
> +		struct io_pgtable_cfg *pgtbl_cfg)
>  {
>  	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
>  					      struct cavium_smmu, smmu);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 09c42af9f31e..37d8d49299b4 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -795,11 +795,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		cfg->asid = cfg->cbndx;
>  
>  	smmu_domain->smmu = smmu;
> -	if (smmu->impl && smmu->impl->init_context) {
> -		ret = smmu->impl->init_context(smmu_domain);
> -		if (ret)
> -			goto out_unlock;
> -	}
>  
>  	pgtbl_cfg = (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	= smmu->pgsize_bitmap,
> @@ -810,6 +805,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		.iommu_dev	= smmu->dev,
>  	};
>  
> +	if (smmu->impl && smmu->impl->init_context) {
> +		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
> +		if (ret)
> +			goto out_clear_smmu;
> +	}
> +
>  	if (smmu_domain->non_strict)
>  		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index d890a4a968e8..83294516ac08 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -386,7 +386,8 @@ struct arm_smmu_impl {
>  			    u64 val);
>  	int (*cfg_probe)(struct arm_smmu_device *smmu);
>  	int (*reset)(struct arm_smmu_device *smmu);
> -	int (*init_context)(struct arm_smmu_domain *smmu_domain);
> +	int (*init_context)(struct arm_smmu_domain *smmu_domain,
> +			struct io_pgtable_cfg *cfg);
>  	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
>  			 int status);
>  	int (*def_domain_type)(struct device *dev);
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

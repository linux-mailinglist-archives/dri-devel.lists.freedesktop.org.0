Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347F258929
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B226E7D0;
	Tue,  1 Sep 2020 07:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4A26E186
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 05:29:02 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 185so89614oie.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 22:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fAF+I6OKfLF1q/UNyvoEQ1KJPvT2UhZd8vG7KbMS404=;
 b=dB6AavOQWnDo1RTYyHF3Hkq+/BSgLBDEmUgFUj96Fy89y8dq7m+QdhLaHjGIcmnTia
 0J6VrEgSCsNt/k+aqofQUZa3cJsJ+1eXBu4A0pmj6og68NL/vtiZCUG3gye+50BrZ9jw
 KU9By8Suhpoka2I8dg/qqHuwpCvNDgRlJ3i+ebhV20yE/eB/1bHJznOllHWn59Vl9nnZ
 SkP169NLx0aj8+byHjlED001CaVLcxB0XSnn2CpOTFeDnUR8yTrr6KT6JBKAnyYVg1rs
 UAp4dwk93l4G9KQJsNaGkKvpfRFnWI2o5pxbKPDu6xrUhAfuplIl/oCKtTQyN9+IwAv5
 hnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fAF+I6OKfLF1q/UNyvoEQ1KJPvT2UhZd8vG7KbMS404=;
 b=V+MMUTMXe6SSuf2vTFzYyG9IgWO4Aum4MdLvce6fxRBnvjLcO9dqgnzcIct2FMvnSN
 1SnpbI9Mkv64MlGEs7zsBqPlwNr6INctTLrOgxncK00/qor166DNHZxj4X+EyUeR3wAC
 r53Me7HafaAVMZUT+ydKM9OJGUnf1WSMSMvPFWwnfv1poblr9E/GwB5f2aK5nvYgig19
 as+XN9LVlv/zOev3d1oWheqVOA4xM8aayOptKjhSo9Gzx3OW46ffeFQgKD3Tm5jblvEf
 c53cu4kgBNrqlY4lpwjmUGyoeeyngPCottG+Jw6alY3Lyh9vv7ChqEa8WTXi4H4OUOXy
 fLoA==
X-Gm-Message-State: AOAM533v9fs6ECtnqqJqV4y+zRklc3Vc1VcgmXdmrduLPq3iB2V7PhFt
 J03ilq/QTZkKX1P6ENce8ezikQ==
X-Google-Smtp-Source: ABdhPJx+hbWjsrStTWAQDZMDmP6KZfA2xhzTn7B1JR06qPUqkWbzUkA3e4fvmB0D8EuEBr1fucI8Hw==
X-Received: by 2002:aca:6c5:: with SMTP id 188mr119889oig.84.1598938141817;
 Mon, 31 Aug 2020 22:29:01 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id m11sm41679ooe.43.2020.08.31.22.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 22:29:01 -0700 (PDT)
Date: Tue, 1 Sep 2020 00:28:58 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 14/19] drm/msm: Add support to create a local pagetable
Message-ID: <20200901052858.GV3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-15-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-15-robdclark@gmail.com>
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
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Add support to create a io-pgtable for use by targets that support
> per-instance pagetables. In order to support per-instance pagetables the
> GPU SMMU device needs to have the qcom,adreno-smmu compatible string and
> split pagetables enabled.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpummu.c |   2 +-
>  drivers/gpu/drm/msm/msm_iommu.c  | 199 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_mmu.h    |  16 ++-
>  3 files changed, 214 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 310a31b05faa..aab121f4beb7 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -102,7 +102,7 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
>  	}
>  
>  	gpummu->gpu = gpu;
> -	msm_mmu_init(&gpummu->base, dev, &funcs);
> +	msm_mmu_init(&gpummu->base, dev, &funcs, MSM_MMU_GPUMMU);
>  
>  	return &gpummu->base;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 1b6635504069..697cc0a059d6 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -4,15 +4,210 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include <linux/adreno-smmu-priv.h>
> +#include <linux/io-pgtable.h>
>  #include "msm_drv.h"
>  #include "msm_mmu.h"
>  
>  struct msm_iommu {
>  	struct msm_mmu base;
>  	struct iommu_domain *domain;
> +	atomic_t pagetables;
>  };
> +
>  #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
>  
> +struct msm_iommu_pagetable {
> +	struct msm_mmu base;
> +	struct msm_mmu *parent;
> +	struct io_pgtable_ops *pgtbl_ops;
> +	phys_addr_t ttbr;
> +	u32 asid;
> +};
> +static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
> +{
> +	return container_of(mmu, struct msm_iommu_pagetable, base);
> +}
> +
> +static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
> +		size_t size)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> +	size_t unmapped = 0;
> +
> +	/* Unmap the block one page at a time */
> +	while (size) {
> +		unmapped += ops->unmap(ops, iova, 4096, NULL);
> +		iova += 4096;
> +		size -= 4096;
> +	}
> +
> +	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> +
> +	return (unmapped == size) ? 0 : -EINVAL;
> +}
> +
> +static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> +		struct sg_table *sgt, size_t len, int prot)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> +	struct scatterlist *sg;
> +	size_t mapped = 0;
> +	u64 addr = iova;
> +	unsigned int i;
> +
> +	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +		size_t size = sg->length;
> +		phys_addr_t phys = sg_phys(sg);
> +
> +		/* Map the block one page at a time */
> +		while (size) {
> +			if (ops->map(ops, addr, phys, 4096, prot, GFP_KERNEL)) {
> +				msm_iommu_pagetable_unmap(mmu, iova, mapped);
> +				return -EINVAL;
> +			}
> +
> +			phys += 4096;
> +			addr += 4096;
> +			size -= 4096;
> +			mapped += 4096;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
> +	struct adreno_smmu_priv *adreno_smmu =
> +		dev_get_drvdata(pagetable->parent->dev);
> +
> +	/*
> +	 * If this is the last attached pagetable for the parent,
> +	 * disable TTBR0 in the arm-smmu driver
> +	 */
> +	if (atomic_dec_return(&iommu->pagetables) == 0)
> +		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
> +
> +	free_io_pgtable_ops(pagetable->pgtbl_ops);
> +	kfree(pagetable);
> +}
> +
> +int msm_iommu_pagetable_params(struct msm_mmu *mmu,
> +		phys_addr_t *ttbr, int *asid)
> +{
> +	struct msm_iommu_pagetable *pagetable;
> +
> +	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
> +		return -EINVAL;
> +
> +	pagetable = to_pagetable(mmu);
> +
> +	if (ttbr)
> +		*ttbr = pagetable->ttbr;
> +
> +	if (asid)
> +		*asid = pagetable->asid;
> +
> +	return 0;
> +}
> +
> +static const struct msm_mmu_funcs pagetable_funcs = {
> +		.map = msm_iommu_pagetable_map,
> +		.unmap = msm_iommu_pagetable_unmap,
> +		.destroy = msm_iommu_pagetable_destroy,
> +};
> +
> +static void msm_iommu_tlb_flush_all(void *cookie)
> +{
> +}
> +
> +static void msm_iommu_tlb_flush_walk(unsigned long iova, size_t size,
> +		size_t granule, void *cookie)
> +{
> +}
> +
> +static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
> +		unsigned long iova, size_t granule, void *cookie)
> +{
> +}
> +
> +static const struct iommu_flush_ops null_tlb_ops = {
> +	.tlb_flush_all = msm_iommu_tlb_flush_all,
> +	.tlb_flush_walk = msm_iommu_tlb_flush_walk,
> +	.tlb_flush_leaf = msm_iommu_tlb_flush_walk,
> +	.tlb_add_page = msm_iommu_tlb_add_page,
> +};
> +
> +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
> +{
> +	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
> +	struct msm_iommu *iommu = to_msm_iommu(parent);
> +	struct msm_iommu_pagetable *pagetable;
> +	const struct io_pgtable_cfg *ttbr1_cfg = NULL;
> +	struct io_pgtable_cfg ttbr0_cfg;
> +	int ret;
> +
> +	/* Get the pagetable configuration from the domain */
> +	if (adreno_smmu->cookie)
> +		ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
> +	if (!ttbr1_cfg)
> +		return ERR_PTR(-ENODEV);
> +
> +	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
> +	if (!pagetable)
> +		return ERR_PTR(-ENOMEM);
> +
> +	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
> +		MSM_MMU_IOMMU_PAGETABLE);
> +
> +	/* Clone the TTBR1 cfg as starting point for TTBR0 cfg: */
> +	ttbr0_cfg = *ttbr1_cfg;
> +
> +	/* The incoming cfg will have the TTBR1 quirk enabled */
> +	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
> +	ttbr0_cfg.tlb = &null_tlb_ops;
> +
> +	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
> +		&ttbr0_cfg, iommu->domain);
> +
> +	if (!pagetable->pgtbl_ops) {
> +		kfree(pagetable);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/*
> +	 * If this is the first pagetable that we've allocated, send it back to
> +	 * the arm-smmu driver as a trigger to set up TTBR0
> +	 */
> +	if (atomic_inc_return(&iommu->pagetables) == 1) {
> +		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
> +		if (ret) {
> +			free_io_pgtable_ops(pagetable->pgtbl_ops);
> +			kfree(pagetable);
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	/* Needed later for TLB flush */
> +	pagetable->parent = parent;
> +	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
> +
> +	/*
> +	 * TODO we would like each set of page tables to have a unique ASID
> +	 * to optimize TLB invalidation.  But iommu_flush_tlb_all() will
> +	 * end up flushing the ASID used for TTBR1 pagetables, which is not
> +	 * what we want.  So for now just use the same ASID as TTBR1.
> +	 */
> +	pagetable->asid = 0;
> +
> +	return &pagetable->base;
> +}
> +
>  static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>  		unsigned long iova, int flags, void *arg)
>  {
> @@ -85,9 +280,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>  		return ERR_PTR(-ENOMEM);
>  
>  	iommu->domain = domain;
> -	msm_mmu_init(&iommu->base, dev, &funcs);
> +	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
>  	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
>  
> +	atomic_set(&iommu->pagetables, 0);
> +
>  	ret = iommu_attach_device(iommu->domain, dev);
>  	if (ret) {
>  		kfree(iommu);
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 3a534ee59bf6..61ade89d9e48 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -17,18 +17,26 @@ struct msm_mmu_funcs {
>  	void (*destroy)(struct msm_mmu *mmu);
>  };
>  
> +enum msm_mmu_type {
> +	MSM_MMU_GPUMMU,
> +	MSM_MMU_IOMMU,
> +	MSM_MMU_IOMMU_PAGETABLE,
> +};
> +
>  struct msm_mmu {
>  	const struct msm_mmu_funcs *funcs;
>  	struct device *dev;
>  	int (*handler)(void *arg, unsigned long iova, int flags);
>  	void *arg;
> +	enum msm_mmu_type type;
>  };
>  
>  static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
> -		const struct msm_mmu_funcs *funcs)
> +		const struct msm_mmu_funcs *funcs, enum msm_mmu_type type)
>  {
>  	mmu->dev = dev;
>  	mmu->funcs = funcs;
> +	mmu->type = type;
>  }
>  
>  struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
> @@ -41,7 +49,13 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>  	mmu->handler = handler;
>  }
>  
> +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> +
>  void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>  		dma_addr_t *tran_error);
>  
> +
> +int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> +		int *asid);
> +
>  #endif /* __MSM_MMU_H__ */
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

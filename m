Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548125892A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454186E7D1;
	Tue,  1 Sep 2020 07:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DCA6E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 05:00:33 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id t7so107187otp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 22:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P5vd6idOMR28SkAyT04doVMRgNUyURwcf98wzIckDek=;
 b=FnGzYI2rbc/1E3FO3UMzvHkTe0pD6bEAXs4LviLRcCpHy1RHen0pc6UJ8zrGZGpkog
 h4413JhorZvIVF2w2p1ugAkFBhLX0k0+3Zzh3PWx7kc4ltoeOiC0uCTNjHTKFNHIapQj
 UIMVJYbLUU5X6fyP6PLQW2/3dpsho26NuAZ3Kst1Kpq3DNPJayc32duasAa+Wbbic89l
 8iUfebXI8fLtUYuD4ZefdsQDIRznV84HfjjWsuPPykW0wWFYCPEZhMlHT9GKeqctYq3l
 /tqPPP+wIB+YGXrdEOK0Ojl3ULMUct1JyrRWmuZYxMMhN4/l42QhAD4F1A6FX21v8O6p
 g8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P5vd6idOMR28SkAyT04doVMRgNUyURwcf98wzIckDek=;
 b=hWMJ4cMdbnR7wTzkRdEZMF56nIVOYZUgZiYJ9HxtdVbXcbe6AOgk9okgeucw9mPJYm
 TNN7vU5Y2h+wtsTTbSeoZ7XYpVwNPfZWAXYunquwZb+lFaMvOaG6X93zz74k4L/eJX+5
 NLdQxjY3CE4v5eYniTdFG6qDewoj89SFcA/lMyFHQva0+8AhF2aM1sUu341xRpUykfFO
 lw/jnR3On7JeLR9ah1C+G2qLlY3DDG0NHUuOYBudUAxYB0lkCgdsrhz3UNlu0yNX2nX2
 3Asofh0GNA4Edfwgg7uSnYxdu8gStKo2gjBx3Pm9lFS/zW2xWkLYyZWxhSTLbgST4pyR
 +yxQ==
X-Gm-Message-State: AOAM5321cY12Ch7rbQY4HKHdfkgR0jFNQSdpNMYgnp65lnvgiQ31YDZZ
 +QwJGoQM+ReG2aGlBA7iOxcn4w==
X-Google-Smtp-Source: ABdhPJyWtAvWKH+O9zyGxPgSXTncSYEQcQMz67zHNHRdllrrSz0DuI3hz+O1k42Er8/8XmFNIFhz2Q==
X-Received: by 2002:a9d:61d5:: with SMTP id h21mr150678otk.187.1598936432380; 
 Mon, 31 Aug 2020 22:00:32 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id k21sm3206otp.40.2020.08.31.22.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 22:00:31 -0700 (PDT)
Date: Tue, 1 Sep 2020 00:00:28 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 09/19] iommu/arm-smmu-qcom: Add implementation for the
 adreno GPU SMMU
Message-ID: <20200901050028.GQ3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-10-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-10-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, iommu@lists.linux-foundation.org,
 Krishna Reddy <vdumpa@nvidia.com>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>,
 freedreno@lists.freedesktop.org, Hanna Hawa <hannah@marvell.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Add a special implementation for the SMMU attached to most Adreno GPU
> target triggered from the qcom,adreno-smmu compatible string.
> 
> The new Adreno SMMU implementation will enable split pagetables
> (TTBR1) for the domain attached to the GPU device (SID 0) and
> hard code it context bank 0 so the GPU hardware can implement
> per-instance pagetables.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Co-developed-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |   3 +
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 149 ++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |   1 +
>  3 files changed, 151 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 88f17cc33023..d199b4bff15d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -223,6 +223,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
>  		return qcom_smmu_impl_init(smmu);
>  
> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
> +		return qcom_adreno_smmu_impl_init(smmu);
> +
>  	if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
>  		smmu->impl = &mrvl_mmu500_impl;
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index be4318044f96..5640d9960610 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/adreno-smmu-priv.h>
>  #include <linux/of_device.h>
>  #include <linux/qcom_scm.h>
>  
> @@ -12,6 +13,132 @@ struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  };
>  
> +#define QCOM_ADRENO_SMMU_GPU_SID 0
> +
> +static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	int i;
> +
> +	/*
> +	 * The GPU will always use SID 0 so that is a handy way to uniquely
> +	 * identify it and configure it for per-instance pagetables
> +	 */
> +	for (i = 0; i < fwspec->num_ids; i++) {
> +		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
> +
> +		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static const struct io_pgtable_cfg *qcom_adreno_smmu_get_ttbr1_cfg(
> +		const void *cookie)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct io_pgtable *pgtable =
> +		io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
> +	return &pgtable->cfg;
> +}
> +
> +/*
> + * Local implementation to configure TTBR0 with the specified pagetable config.
> + * The GPU driver will call this to enable TTBR0 when per-instance pagetables
> + * are active
> + */
> +
> +static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
> +		const struct io_pgtable_cfg *pgtbl_cfg)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +
> +	/* The domain must have split pagetables already enabled */
> +	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> +		return -EINVAL;
> +
> +	/* If the pagetable config is NULL, disable TTBR0 */
> +	if (!pgtbl_cfg) {
> +		/* Do nothing if it is already disabled */
> +		if ((cb->tcr[0] & ARM_SMMU_TCR_EPD0))
> +			return -EINVAL;
> +
> +		/* Set TCR to the original configuration */
> +		cb->tcr[0] = arm_smmu_lpae_tcr(&pgtable->cfg);
> +		cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
> +	} else {
> +		u32 tcr = cb->tcr[0];
> +
> +		/* Don't call this again if TTBR0 is already enabled */
> +		if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0))
> +			return -EINVAL;
> +
> +		tcr |= arm_smmu_lpae_tcr(pgtbl_cfg);
> +		tcr &= ~(ARM_SMMU_TCR_EPD0 | ARM_SMMU_TCR_EPD1);
> +
> +		cb->tcr[0] = tcr;
> +		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> +		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
> +	}
> +
> +	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
> +
> +	return 0;
> +}
> +
> +static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
> +		struct device *dev, int start, int count)
> +{
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	/*
> +	 * Assign context bank 0 to the GPU device so the GPU hardware can
> +	 * switch pagetables
> +	 */
> +	if (qcom_adreno_smmu_is_gpu_device(dev)) {
> +		start = 0;
> +		count = 1;
> +	} else {
> +		start = 1;
> +	}
> +
> +	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
> +}
> +
> +static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
> +		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
> +{
> +	struct adreno_smmu_priv *priv;
> +
> +	/* Only enable split pagetables for the GPU device (SID 0) */
> +	if (!qcom_adreno_smmu_is_gpu_device(dev))
> +		return 0;
> +
> +	/*
> +	 * All targets that use the qcom,adreno-smmu compatible string *should*
> +	 * be AARCH64 stage 1 but double check because the arm-smmu code assumes
> +	 * that is the case when the TTBR1 quirk is enabled
> +	 */
> +	if ((smmu_domain->stage == ARM_SMMU_DOMAIN_S1) &&
> +	    (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64))
> +		pgtbl_cfg->quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> +
> +	/*
> +	 * Initialize private interface with GPU:
> +	 */
> +
> +	priv = dev_get_drvdata(dev);
> +	priv->cookie = smmu_domain;
> +	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
> +	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
> +
> +	return 0;
> +}
> +
>  static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,adreno" },
>  	{ .compatible = "qcom,mdp4" },
> @@ -65,7 +192,15 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
>  	.reset = qcom_smmu500_reset,
>  };
>  
> -struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
> +static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> +	.init_context = qcom_adreno_smmu_init_context,
> +	.def_domain_type = qcom_smmu_def_domain_type,
> +	.reset = qcom_smmu500_reset,
> +	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
> +};
> +
> +static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
> +		const struct arm_smmu_impl *impl)
>  {
>  	struct qcom_smmu *qsmmu;
>  
> @@ -75,8 +210,18 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  
>  	qsmmu->smmu = *smmu;
>  
> -	qsmmu->smmu.impl = &qcom_smmu_impl;
> +	qsmmu->smmu.impl = impl;
>  	devm_kfree(smmu->dev, smmu);
>  
>  	return &qsmmu->smmu;
>  }
> +
> +struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
> +{
> +	return qcom_smmu_create(smmu, &qcom_smmu_impl);
> +}
> +
> +struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu)
> +{
> +	return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
> +}
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 27c83333fc50..cd75a33967bb 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -519,6 +519,7 @@ static inline void arm_smmu_writeq(struct arm_smmu_device *smmu, int page,
>  struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
> +struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu);
>  
>  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

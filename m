Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952193A6D34
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 19:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533AE89D7B;
	Mon, 14 Jun 2021 17:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1693489DB5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 17:30:14 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id t40so15137809oiw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xLux/4m5ofoODBdUbT7Ehl5QrekB6WictYiNsn1mOWI=;
 b=BmXLqT56g32BvBM3bzR5kCvabeozm5NrpVSpsIpgvkOTPWRPJlxZ/z/D73OSBK/6W5
 6A5m0lZLGJQrk0wbOzn8azG01wcz2L7fv3KIn5f+5da/PfQrL2Jj+557OyLbNa9Lqrer
 8KztQ1xFxpDOcaY4LfrVezdrtI0n1Y6Elzgs5dh8Hl1F/TueJNJO4giGIFov47dp7kTZ
 AGxDoJ2L3ig2rYKdAyR0GGF3tq0K5rTrQW3NZH8wS/6twS9QR0yZeHE5iOjmi1EOxiwm
 upaQMi/vLbzIB1+4Elozh2AyCxcKDl1DyEq3zToBpNm8On3qgzOIKhkII3HppjMv2rnf
 /qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xLux/4m5ofoODBdUbT7Ehl5QrekB6WictYiNsn1mOWI=;
 b=Sy8OAVKLgJBMmg/iBdR4E3uLfroOQ4GlxLizN8mFYk3bewv5b12exgw315LS2aAYti
 xxnK4z1DNNYBXDyN1KJ1QS3NAZi6XC6ZKxLPzIOftVvCTHVZLN8OdKPcPX4VNC7kb05h
 L5HzxlaZBvcn5u3VX8GvEpWXMkplfYgccgsQJ2QPCgzaC9iap+Uc+AQr6o/gCHB6nZfu
 WlD2+PY/bsDMjW4DoZ518PF9i5NBlt5Wj/hnOlB+N4r+mVIJnxE/jKRUYFqtM6FUgK2C
 zkgWdujwVylmtKTTZG25rdqOkQNTYdRnbBeHc1vpIqQXun7zZ360XjHrkt+DQl7wB1je
 DNGQ==
X-Gm-Message-State: AOAM531HAovOiqlKfIy/jmWPds7Ou42U0N5mUrw/VMJQ4ea/2e4VJW2o
 OFcDRwpG/3D8WCP4eo+XWGzB/A==
X-Google-Smtp-Source: ABdhPJw8j+3e3AKEgROrlKNjzXSDsCtRrFzgE31HIB9XuZeQfTHZGaNm//El0eGHEbYeJRKmO7lkjg==
X-Received: by 2002:aca:ac47:: with SMTP id v68mr11196061oie.160.1623691813324; 
 Mon, 14 Jun 2021 10:30:13 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id f7sm3169502oot.36.2021.06.14.10.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 10:30:12 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:30:10 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 2/5] iommu/arm-smmu-qcom: Add an adreno-smmu-priv
 callback to get pagefault info
Message-ID: <YMeSIv1bkZEverhO@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610214431.539029-3-robdclark@gmail.com>
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
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, iommu@lists.linux-foundation.org,
 Krishna Reddy <vdumpa@nvidia.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Add a callback in adreno-smmu-priv to read interesting SMMU
> registers to provide an opportunity for a richer debug experience
> in the GPU driver.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

I presume this implies that more generic options has been discussed.
Regardless, if further conclusions are made in that regard I expect that
this could serve as a base for such efforts.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 17 ++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  include/linux/adreno-smmu-priv.h           | 31 +++++++++++++++++++++-
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 98b3a1c2a181..b2e31ea84128 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -32,6 +32,22 @@ static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
>  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
>  }
>  
> +static void qcom_adreno_smmu_get_fault_info(const void *cookie,
> +		struct adreno_smmu_fault_info *info)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
> +	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
> +	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
> +	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
> +	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
> +	info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
> +	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>  
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -156,6 +172,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->cookie = smmu_domain;
>  	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>  	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
> +	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>  
>  	return 0;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index c31a59d35c64..84c21c4b0691 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -224,6 +224,8 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_FSYNR0		0x68
>  #define ARM_SMMU_FSYNR0_WNR		BIT(4)
>  
> +#define ARM_SMMU_CB_FSYNR1		0x6c
> +
>  #define ARM_SMMU_CB_S1_TLBIVA		0x600
>  #define ARM_SMMU_CB_S1_TLBIASID		0x610
>  #define ARM_SMMU_CB_S1_TLBIVAL		0x620
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> index a889f28afb42..53fe32fb9214 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -8,6 +8,32 @@
>  
>  #include <linux/io-pgtable.h>
>  
> +/**
> + * struct adreno_smmu_fault_info - container for key fault information
> + *
> + * @far: The faulting IOVA from ARM_SMMU_CB_FAR
> + * @ttbr0: The current TTBR0 pagetable from ARM_SMMU_CB_TTBR0
> + * @contextidr: The value of ARM_SMMU_CB_CONTEXTIDR
> + * @fsr: The fault status from ARM_SMMU_CB_FSR
> + * @fsynr0: The value of FSYNR0 from ARM_SMMU_CB_FSYNR0
> + * @fsynr1: The value of FSYNR1 from ARM_SMMU_CB_FSYNR0
> + * @cbfrsynra: The value of CBFRSYNRA from ARM_SMMU_GR1_CBFRSYNRA(idx)
> + *
> + * This struct passes back key page fault information to the GPU driver
> + * through the get_fault_info function pointer.
> + * The GPU driver can use this information to print informative
> + * log messages and provide deeper GPU specific insight into the fault.
> + */
> +struct adreno_smmu_fault_info {
> +	u64 far;
> +	u64 ttbr0;
> +	u32 contextidr;
> +	u32 fsr;
> +	u32 fsynr0;
> +	u32 fsynr1;
> +	u32 cbfrsynra;
> +};
> +
>  /**
>   * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
>   *
> @@ -17,6 +43,8 @@
>   * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
>   *                 NULL config disables TTBR0 translation, otherwise
>   *                 TTBR0 translation is enabled with the specified cfg
> + * @get_fault_info: Called by the GPU fault handler to get information about
> + *                  the fault
>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> @@ -31,6 +59,7 @@ struct adreno_smmu_priv {
>      const void *cookie;
>      const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
>      int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
> +    void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>  };
>  
> -#endif /* __ADRENO_SMMU_PRIV_H */
> \ No newline at end of file
> +#endif /* __ADRENO_SMMU_PRIV_H */
> -- 
> 2.31.1
> 

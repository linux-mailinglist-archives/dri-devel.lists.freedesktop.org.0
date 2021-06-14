Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E32B3A6D18
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 19:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1906E071;
	Mon, 14 Jun 2021 17:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BDB6E071
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 17:26:10 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id t140so15142519oih.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 10:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dvIEBou67kHJiRTzW5qY/4yBKZTXktpS1R7fvVFvoyU=;
 b=ZKbH0tuAUFkipYD9h+mCBHbR28XpfU/ys/hYkHtXCIOGm44nDdNinPLLEcCU5GJX//
 EijxZeXU/x0BV2qv8lhMmePPbzYj0/P4A84t1g8tpIIQHsunxKyus8bLH2IdtKjLHGLS
 2Hc8yG2lUDTRv3FZEPujYdQcmOvxzQumCwaCXo0gm7BHYgTZ1BkKsFPqpxNqjBeXzJB1
 x2EgXA2+iyGwatUE/KIdasDMtrEHv4MxpkxW+CXSLEqljZiG8mXCzIiM3Cv+ZZ+vMAho
 st2geZgrruff3veHFmiiAEMWJO7F7y6BSPoVlOUIA2lkGkzlOwVKh2LJHzWpkzL8DBEw
 NeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dvIEBou67kHJiRTzW5qY/4yBKZTXktpS1R7fvVFvoyU=;
 b=OCQ4ShzYOiWM9xeEfpJQLJW3m79/fkSEvNVQ3ihsXmIKmepgjIx0tgPojq7UC93gBI
 05YUcfbL9cdUvIAz96e2alHM2iKd/v/Ru+NpyEx+cZU9plr74EXdr9oHNHgxpiqMYB8K
 InnLclwZt60La4BfkqDR7VIdBHpgsFC5kOe1ZIWdpcSktPRnH0kHlkbwiHYY1qrXz9Le
 j3laIZ7MxGluFOyHlMewyjmY0y4fDQLnCApBnCa1eLJGG7WOO6SCF01JCjeEuwUKAk6s
 g4fybokDdOtvaVBvjz72snrivM2z2QwC9nF4+4y0ql66GBCePYLFR++6HMzZELwshKcU
 1EMA==
X-Gm-Message-State: AOAM533a9EBafMngRqacTXsR5PhOHeGYHJP+zrGZIEZsjhBCuFse6GC/
 QrS/6P8wS1JfY0boGZH/l4ajIA==
X-Google-Smtp-Source: ABdhPJxYXdUiG7CFB0f563Qo+oUPK0plSEwpIpm/WaXTv3i5kjc+viL5mTEG0vDaC/hAxLm4HBNMjg==
X-Received: by 2002:aca:2410:: with SMTP id n16mr136639oic.56.1623691569228;
 Mon, 14 Jun 2021 10:26:09 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p25sm3200355ood.4.2021.06.14.10.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 10:26:08 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:26:06 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 1/5] iommu/arm-smmu: Add support for driver IOMMU
 fault handlers
Message-ID: <YMeRLuMkiG4Uv0ZP@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610214431.539029-2-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Call report_iommu_fault() to allow upper-level drivers to register their
> own fault handlers.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Will Deacon <will@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 6f72c4d208ca..b4b32d31fc06 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -408,6 +408,7 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	int idx = smmu_domain->cfg.cbndx;
> +	int ret;
>  
>  	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
>  	if (!(fsr & ARM_SMMU_FSR_FAULT))
> @@ -417,8 +418,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
>  	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
>  
> -	dev_err_ratelimited(smmu->dev,
> -	"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> +	ret = report_iommu_fault(domain, NULL, iova,
> +		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +
> +	if (ret == -ENOSYS)
> +		dev_err_ratelimited(smmu->dev,
> +		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>  			    fsr, iova, fsynr, cbfrsynra, idx);
>  
>  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> -- 
> 2.31.1
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

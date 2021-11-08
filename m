Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF82449B25
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 18:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCDB6E15F;
	Mon,  8 Nov 2021 17:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FB66E0EA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 17:55:43 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id bf8so10899087oib.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LhWfz+5JE21inJr4S250OgcbtsWmt4NJR6DvKNs5YBk=;
 b=NLZ/NWmaut34l69Gi0IMn3FhSPoI8MJxyT511eGKct44ivuZgMwua7hT0tOyLsDZUP
 TrgDXxUaUA7ChA+L3cFnC1wxXZ9OKrp2DAiclSjd/0dAqPiEQUMxdLhwh7TJBeW62J0y
 sxa7L/gO7PUUgBqELeaWYWMpjfyrDPN5orMWbR0tgee7qH946wvFrwRkNxmCE20baibN
 k+IRalaydJaBo+7hWaDZNjCRUOsSOX8GaiuqRGVUZ8nIAxdWVmPEL4ubW46Kx7KoptLH
 NXfufoYJtTJtYYpAQh2ZV1xuOG4OC8fEO2gNDc7SVhOr6lUM1CgDwpMx+e8MVxkv1JSD
 yRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LhWfz+5JE21inJr4S250OgcbtsWmt4NJR6DvKNs5YBk=;
 b=kf1Qqbr9G8tlMDNPiTP8oEmpOh/U7rQnh1oSchzby4AUPxVaua67lLADjcUQT+z3FT
 h12/WeF3Rrx3me5a+0JA0L/d3XZoRmDc6C0oCXpGZIJU71twX8bLWhwO49Ju41O5Lpti
 kONChfVSt826WZy90yARrVm+fZhFPUFUyht7kx1x3Z+g0yYqCvZq9DgtLUO5cfDnZlkC
 ZmjpBO9nBO7sABx2CzFq3bXZNUbM8IMdESbutlWsAb+7jnZriHTtMLxn2uGKMldfzI3c
 UleytIxJ1mbAFCEm1x38Phf2m224v1ep1OjceXscFMQ89yxm4oj2W285rhdpOqBfxFSn
 g9ZA==
X-Gm-Message-State: AOAM530puklKxwGI4td4pqoYW72WNDC4W7c9pbzxqOeLhE/TZcrTLa4+
 H9A8LTn87bB3kmIpvGeDIai+Gw==
X-Google-Smtp-Source: ABdhPJz9eQvKIrPc8ta+sw34+CJDdEJVNU0OWR59hAmfrup/u3GDs03M3CvU50HHVxV7g2TUwoHwZA==
X-Received: by 2002:a05:6808:128d:: with SMTP id
 a13mr98463oiw.29.1636394142851; 
 Mon, 08 Nov 2021 09:55:42 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id c16sm6822645oiw.31.2021.11.08.09.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 09:55:42 -0800 (PST)
Date: Mon, 8 Nov 2021 09:57:19 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix TTBR0 read
Message-ID: <YYlk/2VZCzX6tokf@ripper>
References: <20211108171724.470973-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108171724.470973-1-robdclark@gmail.com>
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
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 08 Nov 09:17 PST 2021, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> It is a 64b register, lets not lose the upper bits.
> 
> Fixes: ab5df7b953d8 ("iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault info")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 55690af1b25d..c998960495b4 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -51,7 +51,7 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
>  	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
>  	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
>  	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
> -	info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
> +	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
>  	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
>  }
>  
> -- 
> 2.31.1
> 

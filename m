Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD3B3D6D3A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 06:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECD06EEB0;
	Tue, 27 Jul 2021 04:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673826EEB0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 04:23:25 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id y18so13725226oiv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 21:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3OGxreqSYiCQ6F45TDhW+5/bOakeByAhZId0DwbZLFY=;
 b=Cu9WE6gTgrDrbfG/7huXX4zjgVCFoaewK/ubY8YVbEw+pdV24B9VEEicGF6ietqskH
 XWPdtgUWeOqM+wJ91qrA6B1nG4G7Pas/YUs+K4xTb0Zywz3SBNkpU2wBa0dq0i4LB1a/
 kOJ+wlDN1TylVh5ikUMrkbPiOzrauHoteIQxult2xwMcBjdilMPBvB0MRL+Z+hVljwBP
 r+Jff4Ljim0wqvra97JE1B7cit4K1D89oUHgW9DNCl0Vd0ulCOGk/lenMktXPQF9E2qw
 3lP50zysI8+Qu6LC8SpJ2tQc69/ZcCWa/i843THRD+oJu8TnvgdDt3fjGzBNEET173yy
 SJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3OGxreqSYiCQ6F45TDhW+5/bOakeByAhZId0DwbZLFY=;
 b=Ia1v2UtkrucN1yVrdYnu+YR+VfawAsNldBtcVB/y49UURPT5MoEQf6f+t1heNM6Je7
 wVfYab/4u1QG55QwYA3bOdna8PypYUPCl+dHGhzPWFHtnYoa4Qe/qamvkizvHL1tYNae
 aIZAJAzeKvxTv0kKXCbnL79GsIhhWM3nDiJPzHZ5wurYQ9HvUudFY7j73iTELI5Ld9c+
 +A2n5FsTCiO7dbmVR+qDo9btoKpFnE2Fi0onotxJ0x1ZHIJQKmEXu4ReAKSWgbxIVB2x
 v2gXL7Mrf+PRl6TEuyyx2oMj88/OqJjE3/idOekWmrXQVF9TSGnleT89dNG1VwO/5x68
 UtLg==
X-Gm-Message-State: AOAM5315SPemIH/tVmLwaaEqNz+IAW5J4NNIr1plkAyBx3R2ANAGwIZu
 TJ+PZWlzhqgpb7awvo9Zcl5FkQ==
X-Google-Smtp-Source: ABdhPJxFkjDkkgtmxrW1rMQURoIsDurVgUwq+//KYrhZXH8xIW+9cCCtPKmg6OVUWFT2EiIxjzl/0w==
X-Received: by 2002:a05:6808:8cd:: with SMTP id
 k13mr1633129oij.42.1627359804717; 
 Mon, 26 Jul 2021 21:23:24 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z6sm391592oiz.39.2021.07.26.21.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 21:23:24 -0700 (PDT)
Date: Mon, 26 Jul 2021 21:21:35 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: Fix display fault handling
Message-ID: <YP+JzyDwp4MpXdv4@ripper>
References: <20210707180113.840741-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707180113.840741-1-robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Yassine Oudjana <y.oudjana@protonmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 07 Jul 11:01 PDT 2021, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> It turns out that when the display is enabled by the bootloader, we can
> get some transient iommu faults from the display.  Which doesn't go over
> too well when we install a fault handler that is gpu specific.  To avoid
> this, defer installing the fault handler until we get around to setting
> up per-process pgtables (which is adreno_smmu specific).  The arm-smmu
> fallback error reporting is sufficient for reporting display related
> faults (and in fact was all we had prior to f8f934c180f629bb927a04fd90d)
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Fixes: 2a574cc05d38 ("drm/msm: Improve the a6xx page fault handler")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: John Stultz <john.stultz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index eed2a762e9dd..bcaddbba564d 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -142,6 +142,9 @@ static const struct iommu_flush_ops null_tlb_ops = {
>  	.tlb_add_page = msm_iommu_tlb_add_page,
>  };
>  
> +static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> +		unsigned long iova, int flags, void *arg);
> +
>  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  {
>  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
> @@ -157,6 +160,13 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  	if (!ttbr1_cfg)
>  		return ERR_PTR(-ENODEV);
>  
> +	/*
> +	 * Defer setting the fault handler until we have a valid adreno_smmu
> +	 * to avoid accidentially installing a GPU specific fault handler for
> +	 * the display's iommu
> +	 */
> +	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
> +
>  	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
>  	if (!pagetable)
>  		return ERR_PTR(-ENOMEM);
> @@ -300,7 +310,6 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>  
>  	iommu->domain = domain;
>  	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
> -	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
>  
>  	atomic_set(&iommu->pagetables, 0);
>  
> -- 
> 2.31.1
> 

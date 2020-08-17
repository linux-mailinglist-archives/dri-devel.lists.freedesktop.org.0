Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC51246D66
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 18:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A586E15B;
	Mon, 17 Aug 2020 16:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75136E148
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 16:55:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597683333; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=opili1/+0dW4EUDDFvf9qZg/sEOsjBH8GyzqwpumoDE=;
 b=E252tgh6AptkSjXlRws/XVUezmxpBUsO21D1Ms9L6ZpMGwXeESsmwPjlAJmAltnobAQ57Mza
 NDIn4OH1BvW4GeiEC6QApSjRulxaU9B93gSRos3xj2vVbqXiSXCp55FpV/KTQFDettvakxWS
 Y+3SCQQAU1qwNq1v7rPZrgy5W4o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f3ab683247ccc308c068e48 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 16:55:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 538B9C433C6; Mon, 17 Aug 2020 16:55:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BA23C433CB;
 Mon, 17 Aug 2020 16:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1BA23C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 17 Aug 2020 10:55:25 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 07/19] drm/msm: set adreno_smmu as gpu's drvdata
Message-ID: <20200817165524.GJ3221@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Shawn Guo <shawn.guo@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-8-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Joerg Roedel <joro@8bytes.org>,
 Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 07:41:02PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This will be populated by adreno-smmu, to provide a way for coordinating
> enabling/disabling TTBR0 translation.
> 

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
>  drivers/gpu/drm/msm/msm_gpu.c              | 2 +-
>  drivers/gpu/drm/msm/msm_gpu.h              | 6 +++++-
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 26664e1b30c0..58e03b20e1c7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -417,8 +417,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  		return PTR_ERR(gpu);
>  	}
>  
> -	dev_set_drvdata(dev, gpu);
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 6aa9e04e52e7..806eb0957280 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -892,7 +892,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		gpu->gpu_cx = NULL;
>  
>  	gpu->pdev = pdev;
> -	platform_set_drvdata(pdev, gpu);
> +	platform_set_drvdata(pdev, &gpu->adreno_smmu);
>  
>  	msm_devfreq_init(gpu);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 8bda7beaed4b..f91b141add75 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -7,6 +7,7 @@
>  #ifndef __MSM_GPU_H__
>  #define __MSM_GPU_H__
>  
> +#include <linux/adreno-smmu-priv.h>
>  #include <linux/clk.h>
>  #include <linux/interconnect.h>
>  #include <linux/pm_opp.h>
> @@ -73,6 +74,8 @@ struct msm_gpu {
>  	struct platform_device *pdev;
>  	const struct msm_gpu_funcs *funcs;
>  
> +	struct adreno_smmu_priv adreno_smmu;
> +
>  	/* performance counters (hw & sw): */
>  	spinlock_t perf_lock;
>  	bool perfcntr_active;
> @@ -143,7 +146,8 @@ struct msm_gpu {
>  
>  static inline struct msm_gpu *dev_to_gpu(struct device *dev)
>  {
> -	return dev_get_drvdata(dev);
> +	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
> +	return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
>  }
>  
>  /* It turns out that all targets use the same ringbuffer size */
> -- 
> 2.26.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

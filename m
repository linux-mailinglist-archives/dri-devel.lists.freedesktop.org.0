Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E615E44DB04
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 18:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C44C6E18F;
	Thu, 11 Nov 2021 17:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87726E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 17:15:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636650917; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=9ATOQmqTmW60i4WG7OBHPJjTDiTX5iJKy/x0ZGMNLKw=;
 b=dTfNWs/jT517Xwb0Rz7ZergzzAizCuJLCVZClS9UOalR8vlyIA82ceDz+tBqkCDlepJYq8P6
 PXHoEJo2Ly8qzyGOTUH6zBI3ejpBk6ej19Enu32xhRlN/ejliDAEGqdPBvP9avy7YSVnXpCB
 z/g0ZM264NK4nGWKJZmYzHussaE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 618d4f9cc51781f169eadb36 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Nov 2021 17:15:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0CB70C43617; Thu, 11 Nov 2021 17:15:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.16] (unknown [117.210.184.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A096AC4338F;
 Thu, 11 Nov 2021 17:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A096AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <89cbb324-b111-657f-fb3c-8ece3c21017b@codeaurora.org>
Date: Thu, 11 Nov 2021 22:44:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 5/5] drm/msm: Add debugfs to disable hw err handling
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20211109181117.591148-1-robdclark@gmail.com>
 <20211109181117.591148-6-robdclark@gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211109181117.591148-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Yangtao Li <tiny.windzz@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/2021 11:41 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a debugfs interface to ignore hw error irqs, in order to force
> fallback to sw hangcheck mechanism.  Because the hw error detection is
> pretty good on newer gens, we need this for igt tests to test the sw
> hang detection.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 ++++++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>   drivers/gpu/drm/msm/msm_debugfs.c     | 3 +++
>   drivers/gpu/drm/msm/msm_drv.h         | 9 +++++++++
>   4 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 6163990a4d09..ec8e043c9d38 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1252,6 +1252,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
>   
>   static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>   {
> +	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	u32 status = gpu_read(gpu, REG_A5XX_RBBM_INT_0_STATUS);
>   
>   	/*
> @@ -1261,6 +1262,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>   	gpu_write(gpu, REG_A5XX_RBBM_INT_CLEAR_CMD,
>   		status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
>   
> +	if (priv->disable_err_irq) {
> +		status &= A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
> +			  A5XX_RBBM_INT_0_MASK_CP_SW;
> +	}
> +
>   	/* Pass status to a5xx_rbbm_err_irq because we've already cleared it */
>   	if (status & RBBM_ERROR_MASK)
>   		a5xx_rbbm_err_irq(gpu, status);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 3d2da81cb2c9..8a2af3a27e33 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1373,10 +1373,14 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>   
>   static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>   {
> +	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
>   
>   	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>   
> +	if (priv->disable_err_irq)
> +		status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
> +
>   	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>   		a6xx_fault_detect_irq(gpu);
>   
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 6a99e8b5d25d..956b1efc3721 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -242,6 +242,9 @@ void msm_debugfs_init(struct drm_minor *minor)
>   	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
>   		&priv->hangcheck_period);
>   
> +	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
> +		&priv->disable_err_irq);
> +
>   	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
>   		dev, &shrink_fops);
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2943c21d9aac..a8da7a7efb84 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -246,6 +246,15 @@ struct msm_drm_private {
>   
>   	/* For hang detection, in ms */
>   	unsigned int hangcheck_period;
> +
> +	/**
> +	 * disable_err_irq:
> +	 *
> +	 * Disable handling of GPU hw error interrupts, to force fallback to
> +	 * sw hangcheck timer.  Written (via debugfs) by igt tests to test
> +	 * the sw hangcheck mechanism.
> +	 */
> +	bool disable_err_irq;
>   };
>   
>   struct msm_format {
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil.

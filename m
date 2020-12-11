Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F952D74F3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 12:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175F96EDBB;
	Fri, 11 Dec 2020 11:54:58 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DCD6EDBB
 for <dri-devel@freedesktop.org>; Fri, 11 Dec 2020 11:54:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1607687696; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=GbskrWAq7AiFgwCQN0+yODU9j0bpXqdk8MEJFG6uAZo=;
 b=bnLplqWpcwTs8KcUMisuB6ej7niNj481Egv5RMQ5kXeRi7F68qrMwtfKouWwjrIZla0D/ZUX
 6mfYfnPfkBIRcBp51jbw+PjWaaJk2DrUuPhA7Swdg4gULy9INTtGv5vU7Tk11nAg6/k44T2h
 /5eLz3DAibeI8YNDWHGOtGTfkHU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fd35e0735a25d1b16b6cf63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 11 Dec 2020 11:54:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 74006C43462; Fri, 11 Dec 2020 11:54:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.3] (unknown [117.210.189.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D610EC433C6;
 Fri, 11 Dec 2020 11:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D610EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v3 1/2] drm/msm: Add speed-bin support to a618 gpu
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>
References: <1607337728-11398-1-git-send-email-akhilpo@codeaurora.org>
Message-ID: <f8f680cb-a0d7-8cf3-339f-cc542edcc98c@codeaurora.org>
Date: Fri, 11 Dec 2020 17:24:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1607337728-11398-1-git-send-email-akhilpo@codeaurora.org>
Content-Language: en-US
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
Cc: linux-arm-msm@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/2020 4:12 PM, Akhil P Oommen wrote:
> Some GPUs support different max frequencies depending on the platform.
> To identify the correct variant, we should check the gpu speedbin
> fuse value. Add support for this speedbin detection to a6xx family
> along with the required fuse details for a618 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> Changes from v2:
> 	1. Made the changes a6xx specific to save space.
> Changes from v1:
> 	1. Added the changes to support a618 sku to the series.
> 	2. Avoid failing probe in case of an unsupported sku. (Rob)
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 74 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +
>   2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 1306618..6304578 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,10 +10,13 @@
>   
>   #include <linux/bitfield.h>
>   #include <linux/devfreq.h>
> +#include <linux/nvmem-consumer.h>
>   #include <linux/soc/qcom/llcc-qcom.h>
>   
>   #define GPU_PAS_ID 13
>   
> +const u32 a618_speedbins[] = {0, 169, 174};
> +
>   static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -1208,6 +1211,10 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>   	a6xx_gmu_remove(a6xx_gpu);
>   
>   	adreno_gpu_cleanup(adreno_gpu);
> +
> +	if (a6xx_gpu->opp_table)
> +		dev_pm_opp_put_supported_hw(a6xx_gpu->opp_table);
> +
>   	kfree(a6xx_gpu);
>   }
>   
> @@ -1264,6 +1271,67 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>   	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
>   }
>   
> +static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
> +{
> +	int i;
> +
> +	if (revn == 618) {
> +		for (i = 0; i < ARRAY_SIZE(a618_speedbins); i++) {
> +			if (fuse == a618_speedbins[i])
> +				return  (1 << i);
> +		}
> +	}
> +
> +	DRM_DEV_ERROR(dev,
> +			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
> +			fuse);
> +	return ~0U;
> +}
> +
> +static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> +		u32 revn)
> +{
> +
> +	struct opp_table *opp_table;
> +	struct nvmem_cell *cell;
> +	u32 supp_hw = ~0U;
> +	void *buf;
> +
> +	cell = nvmem_cell_get(dev, "speed_bin");
> +	/*
> +	 * -ENOENT means that the platform doesn't support speedbin which is
> +	 * fine
> +	 */
> +	if (PTR_ERR(cell) == -ENOENT)
> +		return 0;
> +	else if (IS_ERR(cell)) {
> +		DRM_DEV_ERROR(dev,
> +				"failed to read speed-bin. Some OPPs may not be supported by hardware");
> +		goto done;
> +	}
> +
> +	buf = nvmem_cell_read(cell, NULL);
> +	if (IS_ERR(buf)) {
> +		nvmem_cell_put(cell);
> +		DRM_DEV_ERROR(dev,
> +				"failed to read speed-bin. Some OPPs may not be supported by hardware");
> +		goto done;
> +	}
> +
> +	supp_hw = fuse_to_supp_hw(dev, revn, *((u32 *) buf));
> +
> +	kfree(buf);
> +	nvmem_cell_put(cell);
> +
> +done:
> +	opp_table = dev_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> +	if (IS_ERR(opp_table))
> +		return PTR_ERR(opp_table);
> +
> +	a6xx_gpu->opp_table = opp_table;
> +	return 0;
> +}
> +
>   static const struct adreno_gpu_funcs funcs = {
>   	.base = {
>   		.get_param = adreno_get_param,
> @@ -1325,6 +1393,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   
>   	a6xx_llc_slices_init(pdev, a6xx_gpu);
>   
> +	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
> +	if (ret) {
> +		a6xx_destroy(&(a6xx_gpu->base.base));
> +		return ERR_PTR(ret);
> +	}
> +
>   	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
>   	if (ret) {
>   		a6xx_destroy(&(a6xx_gpu->base.base));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index e793d32..ce0610c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -33,6 +33,8 @@ struct a6xx_gpu {
>   	void *llc_slice;
>   	void *htw_llc_slice;
>   	bool have_mmu500;
> +
> +	struct opp_table *opp_table;
>   };
>   
>   #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
> 

A gentle ping.

-Akhil.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09AB2E9CBA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 19:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0543A8994D;
	Mon,  4 Jan 2021 18:07:16 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30B889FC3
 for <dri-devel@freedesktop.org>; Mon,  4 Jan 2021 18:07:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609783634; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=txD1kK7c713c8W+M5K8v2Z4O5yjXvJH0xxaYw03By20=;
 b=i1mIBjpcOCjvTU87haQIq2TLQfJnnjapZmYKUi8JP7HL6103t6QyT6wpWhhVcc7SV3En+2/j
 /qjZoVhrBb1YBRFW6rIb1ONy7xIfRxUpzEYwz7VmEly0Ooa5qwRa4ipgSkpgoenPGwze+nc+
 fYYI5mtoHB3gTm3Q/MjEHnYnUwc=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ff3594e3d84969114678b81 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Jan 2021 18:07:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29EF1C433CA; Mon,  4 Jan 2021 18:07:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E3803C433CA;
 Mon,  4 Jan 2021 18:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3803C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 4 Jan 2021 11:07:04 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH v3 1/2] drm/msm: Add speed-bin support to a618 gpu
Message-ID: <20210104180704.GA26690@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Akhil P Oommen <akhilpo@codeaurora.org>,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh@kernel.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
References: <1607337728-11398-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607337728-11398-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 04:12:07PM +0530, Akhil P Oommen wrote:
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
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 74 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +
>  2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 1306618..6304578 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,10 +10,13 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/devfreq.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>  
>  #define GPU_PAS_ID 13
>  
> +const u32 a618_speedbins[] = {0, 169, 174};

This still feels too generic to me - this could easily be something like:

static u32 a618_get_speed_bin(int rev)
{
	if (rev == 0)
		return 0;
	else if (rev == 169)
		return 1;
	else if (rev == 174)
		return 2;
	
	return UINT_MAX;
}

I know Akhil can see a future where there might be other "pro" targets but it is
unclear to me when those will see upstream support and even if they do a
handful of inline-able functions still seem better to me than a group of const
arrays.

> +
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -1208,6 +1211,10 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>  	a6xx_gmu_remove(a6xx_gpu);
>  
>  	adreno_gpu_cleanup(adreno_gpu);
> +
> +	if (a6xx_gpu->opp_table)
> +		dev_pm_opp_put_supported_hw(a6xx_gpu->opp_table);
> +
>  	kfree(a6xx_gpu);
>  }
>  
> @@ -1264,6 +1271,67 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
>  }
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

u32 val = UINT_MAX;

if (revn == 618)
	val = a618_get_speed_bin(fuse);

if (val == UINT_MAX)
	DRM_DEV_ERROR(dev, "Missing support for speed-bin %u. Some OPPs may not
	be supported by hardware", fuse);

return val;

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

Beyond the comments above, I think the rest of this is reasonable.

Jordan

> +
>  static const struct adreno_gpu_funcs funcs = {
>  	.base = {
>  		.get_param = adreno_get_param,
> @@ -1325,6 +1393,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu);
>  
> +	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
> +	if (ret) {
> +		a6xx_destroy(&(a6xx_gpu->base.base));
> +		return ERR_PTR(ret);
> +	}
> +
>  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index e793d32..ce0610c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -33,6 +33,8 @@ struct a6xx_gpu {
>  	void *llc_slice;
>  	void *htw_llc_slice;
>  	bool have_mmu500;
> +
> +	struct opp_table *opp_table;
>  };
>  
>  #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
> -- 
> 2.7.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

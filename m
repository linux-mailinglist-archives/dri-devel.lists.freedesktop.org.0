Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B131B609D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 18:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540766E8F1;
	Thu, 23 Apr 2020 16:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42FC6E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:20:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587658847; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=G8CCubdbZmbrQxIHt3wYDsH0nUzExVnZZMmIZwVZnMI=;
 b=g852IvxKI4KraA6UYX6tvALoIk5hW7uxW8Ae9oH4AeUaCX82RtrVetm8fe07eUVi8hLFNGqL
 irGlNB5RrJHvfhS4cXTfZVf6ezzI5WbcgMsM7udiOPSotpW+9Jc993qDlQO8GSC9wdH9gCh8
 /RginkKR5Xv2Id4M1Tp8sorWvcE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1c04c.7f9633523068-smtp-out-n05;
 Thu, 23 Apr 2020 16:20:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B570EC4478F; Thu, 23 Apr 2020 16:20:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3188DC433CB;
 Thu, 23 Apr 2020 16:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3188DC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 23 Apr 2020 10:20:23 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 6/9] drm/msm/a6xx: A640/A650 GMU firmware path
Message-ID: <20200423162021.GA20925@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200421234127.27965-1-jonathan@marek.ca>
 <20200421234127.27965-7-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421234127.27965-7-jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 07:41:24PM -0400, Jonathan Marek wrote:
> Newer GPUs have different GMU firmware path.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 135 +++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  11 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |   6 +
>  3 files changed, 136 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b22a69e2f4b0..4aef5fe985d6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -571,6 +571,8 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
>  {
>  	/* Disable GMU WB/RB buffer */
>  	gmu_write(gmu, REG_A6XX_GMU_SYS_BUS_CONFIG, 0x1);
> +	gmu_write(gmu, REG_A6XX_GMU_ICACHE_CONFIG, 0x1);
> +	gmu_write(gmu, REG_A6XX_GMU_DCACHE_CONFIG, 0x1);
>  
>  	gmu_write(gmu, REG_A6XX_GMU_PWR_COL_INTER_FRAME_CTRL, 0x9c40400);
>  
> @@ -600,14 +602,91 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
>  		A6XX_GMU_RPMH_CTRL_GFX_VOTE_ENABLE);
>  }
>  
> +static int in_range(u32 addr, u32 start, u32 size)
> +{
> +	return addr >= start && addr < start + size;
> +}

I can't believe they don't have a clever macro in include/kernel.h for range
checking.

> +static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	const struct firmware *fw_image = adreno_gpu->fw[ADRENO_FW_GMU];
> +	const struct block_header {
> +		u32 addr;
> +		u32 size;
> +		u32 type;
> +		u32 value;
> +		u32 data[];
> +	} *blk;
> +	struct a6xx_gmu_bo *mem;
> +	u32 reg;
> +
> +	u32 itcm_base = 0x00000000;
> +	u32 dtcm_base = 0x00040000;
> +
> +	if (adreno_is_a650(adreno_gpu))
> +		dtcm_base = 0x10004000;
> +

Yet another one of those spots that might grow an ugly conditional.

> +	if (gmu->legacy) {
> +		/* Sanity check the size of the firmware that was loaded */
> +		if (fw_image->size > 0x8000) {
> +			DRM_DEV_ERROR(gmu->dev,
> +				"GMU firmware is bigger than the available region\n");
> +			return -EINVAL;
> +		}
> +
> +		gmu_write_bulk(gmu, REG_A6XX_GMU_CM3_ITCM_START,
> +			       (u32*) fw_image->data, fw_image->size >> 2);
> +		return 0;
> +	}
> +
> +
> +	for (blk = (const struct block_header *) fw_image->data;
> +	     (const u8*) blk < fw_image->data + fw_image->size;
> +	     blk = (const struct block_header *) &blk->data[blk->size >> 2]) {
> +		if (blk->size == 0)
> +			continue;
> +
> +		reg = 0;
> +		mem = NULL;
> +
> +		if (in_range(blk->addr, itcm_base, SZ_16K))
> +			reg = REG_A6XX_GMU_CM3_ITCM_START + ((blk->addr - itcm_base) >> 2);

Personally I would just gmu_write_bulk() here just to avoid the extra registers.

> +		else if (in_range(blk->addr, dtcm_base, SZ_16K))
> +			reg = REG_A6XX_GMU_CM3_DTCM_START + ((blk->addr - dtcm_base) >> 2);

> +		else if (in_range(blk->addr, gmu->icache.iova, gmu->icache.size))
> +			mem = &gmu->icache;

I would mempcpy here. 

> +		else if (in_range(blk->addr, gmu->dcache.iova, gmu->dcache.size))

> +			mem = &gmu->dcache;
> +		else if (in_range(blk->addr, gmu->dummy.iova, gmu->dummy.size))
> +			mem = &gmu->dummy;
> +		else {
> +			DRM_DEV_ERROR(gmu->dev,
> +				"failed to match fw block (addr=%.8x size=%d data[0]=%.8x)\n",
> +				blk->addr, blk->size, blk->data[0]);
> +		}
> +
> +		if (reg)
> +			gmu_write_bulk(gmu, reg, blk->data, blk->size >> 2);
> +
> +		if (mem)
> +			memcpy(mem->virt + blk->addr - mem->iova, blk->data, blk->size);
> +	}
> +
> +	return 0;
> +}
> +
>  static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  {
>  	static bool rpmh_init;
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> -	int i, ret;
> +	int ret;
>  	u32 chipid;
> -	u32 *image;
> +
> +	if (adreno_is_a650(adreno_gpu))
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
>  
>  	if (state == GMU_WARM_BOOT) {
>  		ret = a6xx_rpmh_start(gmu);
> @@ -618,13 +697,6 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  			"GMU firmware is not loaded\n"))
>  			return -ENOENT;
>  
> -		/* Sanity check the size of the firmware that was loaded */
> -		if (adreno_gpu->fw[ADRENO_FW_GMU]->size > 0x8000) {
> -			DRM_DEV_ERROR(gmu->dev,
> -				"GMU firmware is bigger than the available region\n");
> -			return -EINVAL;
> -		}
> -
>  		/* Turn on register retention */
>  		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
>  
> @@ -638,11 +710,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  				return ret;
>  		}
>  
> -		image = (u32 *) adreno_gpu->fw[ADRENO_FW_GMU]->data;
> -
> -		for (i = 0; i < adreno_gpu->fw[ADRENO_FW_GMU]->size >> 2; i++)
> -			gmu_write(gmu, REG_A6XX_GMU_CM3_ITCM_START + i,
> -				image[i]);
> +		ret = a6xx_gmu_fw_load(gmu);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, 0);
> @@ -769,12 +839,20 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	/* Enable the GMU interrupt */
>  	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
>  	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_MASK, ~A6XX_GMU_IRQ_MASK);
> +

Extra whitespace change.

>  	enable_irq(gmu->gmu_irq);
>  
>  	/* Check to see if we are doing a cold or warm boot */
>  	status = gmu_read(gmu, REG_A6XX_GMU_GENERAL_7) == 1 ?
>  		GMU_WARM_BOOT : GMU_COLD_BOOT;
>  
> +	/*
> +	 * Warm boot path does not work on newer GPUs
> +	 * Presumably this is because icache/dcache regions must be restored
> +	 */
> +	if (!gmu->legacy)
> +		status = GMU_COLD_BOOT;
> +

To be honest, I'm not 100% sure WARM_BOOT even makes sense on a630. Downstream
4.19 has no paths that actually use WARM_BOOT. It might be worth a shot to
try removing it in a future patch.

>  	ret = a6xx_gmu_fw_start(gmu, status);
>  	if (ret)
>  		goto out;
> @@ -957,6 +1035,9 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
>  {
>  	msm_gem_kernel_put(gmu->hfi.obj, gmu->aspace, false);
>  	msm_gem_kernel_put(gmu->debug.obj, gmu->aspace, false);
> +	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
> +	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
> +	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
>  
>  	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
>  	msm_gem_address_space_put(gmu->aspace);
> @@ -974,12 +1055,14 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
>  	size = PAGE_ALIGN(size);
>  	if (!iova) {
>  		/* no fixed address - use GMU's uncached range */
> -		range_start = 0x60000000;
> +		range_start = 0x60000000 + PAGE_SIZE; /* skip dummy page */
>  		range_end = 0x80000000;
>  	} else {
>  		/* range for fixed address */
>  		range_start = iova;
>  		range_end = iova + size;
> +		/* use IOMMU_PRIV for icache/dcache */
> +		flags |= MSM_BO_MAP_PRIV;
>  	}
>  
>  	bo->obj = msm_gem_new(dev, size, flags);
> @@ -1320,7 +1403,27 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	if (ret)
>  		goto err_put_device;
>  
> -	if (!adreno_is_a640(adreno_gpu) && !adreno_is_a650(adreno_gpu)) {
> +	/* Allocate memory for the GMU dummy page */
> +	ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, SZ_4K, 0x60000000);
> +	if (ret)
> +		goto err_memory;
> +
> +	if (adreno_is_a650(adreno_gpu)) {
> +		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
> +			SZ_16M - SZ_16K, 0x04000);
> +		if (ret)
> +			goto err_memory;
> +	} else if (adreno_is_a640(adreno_gpu)) {
> +		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
> +			SZ_256K - SZ_16K, 0x04000);
> +		if (ret)
> +			goto err_memory;
> +
> +		ret = a6xx_gmu_memory_alloc(gmu, &gmu->dcache,
> +			SZ_256K - SZ_16K, 0x44000);
> +		if (ret)
> +			goto err_memory;
> +	} else {
>  		/* HFI v1, has sptprac */
>  		gmu->legacy = true;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 463e2d5f2bb9..526911010cb1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -57,6 +57,9 @@ struct a6xx_gmu {
>  
>  	struct a6xx_gmu_bo hfi;
>  	struct a6xx_gmu_bo debug;
> +	struct a6xx_gmu_bo icache;
> +	struct a6xx_gmu_bo dcache;
> +	struct a6xx_gmu_bo dummy;
>  
>  	int nr_clocks;
>  	struct clk_bulk_data *clocks;
> @@ -92,6 +95,14 @@ static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
>  	return msm_writel(value, gmu->mmio + (offset << 2));
>  }
>  
> +static inline void
> +gmu_write_bulk(struct a6xx_gmu *gmu, u32 offset, const u32 *data, u32 size)
> +{
> +	int i;
> +	for (i = 0; i < size; i++)
> +		gmu_write(gmu, offset + i, data[i]);
> +}

mempcy_toio() might be helpful here instead.

> +
>  static inline void gmu_rmw(struct a6xx_gmu *gmu, u32 reg, u32 mask, u32 or)
>  {
>  	u32 val = gmu_read(gmu, reg);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> index 1cc1c135236b..eb2cd41dae6e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> @@ -101,6 +101,10 @@ static inline uint32_t A6XX_HFI_IRQ_OOB_MASK(uint32_t val)
>  
>  #define REG_A6XX_GMU_DCVS_RETURN				0x000023ff
>  
> +#define REG_A6XX_GMU_ICACHE_CONFIG				0x00004c00
> +
> +#define REG_A6XX_GMU_DCACHE_CONFIG				0x00004c01
> +
>  #define REG_A6XX_GMU_SYS_BUS_CONFIG				0x00004c0f
>  
>  #define REG_A6XX_GMU_CM3_SYSRESET				0x00005000
> @@ -199,6 +203,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>  
>  #define REG_A6XX_GPU_GMU_CX_GMU_RPMH_POWER_STATE		0x000050ec
>  
> +#define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
> +
>  #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
>  
>  #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

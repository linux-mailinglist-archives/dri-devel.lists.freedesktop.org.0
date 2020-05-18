Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6608A1D7B9F
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85786E31E;
	Mon, 18 May 2020 14:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B235F6E31E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:45:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589813103; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=3tDq+jKnVYb0dPQHWxScs1oepBrcNz/o2eMIFpFznZ4=;
 b=wGpgoxUIXosJ5LpqPAsy92q4J+b3lNXlqwA1YujH/cV+27A6UQ72DQLFVVDgLWWPYl+OKWZ+
 IDKCLJ2VEL6capXXVknga7RKZbnQdaz2VXfFI5DcMkDcw4CyDyQmH7OFjojUukSrQSczBpMZ
 xuNkGUXF7ys3niEwR9/juHeD+kY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ec29f60d4b17227ea52b302 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 May 2020 14:44:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4E86BC433D2; Mon, 18 May 2020 14:44:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A52AC433F2;
 Mon, 18 May 2020 14:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A52AC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 18 May 2020 08:44:43 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 6/9] drm/msm/a6xx: A640/A650 GMU firmware path
Message-ID: <20200518144443.GD3915@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200423210946.28867-1-jonathan@marek.ca>
 <20200423210946.28867-7-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423210946.28867-7-jonathan@marek.ca>
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

On Thu, Apr 23, 2020 at 05:09:18PM -0400, Jonathan Marek wrote:
> Newer GPUs have different GMU firmware path.
> 
> v3: updated a6xx_gmu_fw_load based on feedback, including gmu_write_bulk,
> and removed extra whitespace change

I'm not sure if you sent the XML updates to Rob yet, but don't forget to do that
so we don't accidentally lose the registers if we do a refresh.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 138 +++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  10 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |   6 +
>  3 files changed, 138 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b22a69e2f4b0..988575fc8e71 100644
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
> @@ -600,14 +602,95 @@ static void a6xx_gmu_power_config(struct a6xx_gmu *gmu)
>  		A6XX_GMU_RPMH_CTRL_GFX_VOTE_ENABLE);
>  }
>  
> +struct block_header {
> +	u32 addr;
> +	u32 size;
> +	u32 type;
> +	u32 value;
> +	u32 data[];
> +};
> +
> +/* this should be a general kernel helper */
> +static int in_range(u32 addr, u32 start, u32 size)
> +{
> +	return addr >= start && addr < start + size;
> +}
> +
> +static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
> +{
> +	if (!in_range(blk->addr, bo->iova, bo->size))
> +		return false;
> +
> +	memcpy(bo->virt + blk->addr - bo->iova, blk->data, blk->size);
> +	return true;
> +}
> +
> +static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	const struct firmware *fw_image = adreno_gpu->fw[ADRENO_FW_GMU];
> +	const struct block_header *blk;
> +	u32 reg_offset;
> +
> +	u32 itcm_base = 0x00000000;
> +	u32 dtcm_base = 0x00040000;
> +
> +	if (adreno_is_a650(adreno_gpu))
> +		dtcm_base = 0x10004000;
> +
> +	if (gmu->legacy) {
> +		/* Sanity check the size of the firmware that was loaded */
> +		if (fw_image->size > 0x8000) {
> +			DRM_DEV_ERROR(gmu->dev,
> +				"GMU firmware is bigger than the available region\n");
> +			return -EINVAL;
> +		}
> +
> +		gmu_write_bulk(gmu, REG_A6XX_GMU_CM3_ITCM_START,
> +			       (u32*) fw_image->data, fw_image->size);
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
> +		if (in_range(blk->addr, itcm_base, SZ_16K)) {
> +			reg_offset = (blk->addr - itcm_base) >> 2;
> +			gmu_write_bulk(gmu,
> +				REG_A6XX_GMU_CM3_ITCM_START + reg_offset,
> +				blk->data, blk->size);
> +		} else if (in_range(blk->addr, dtcm_base, SZ_16K)) {
> +			reg_offset = (blk->addr - dtcm_base) >> 2;
> +			gmu_write_bulk(gmu,
> +				REG_A6XX_GMU_CM3_DTCM_START + reg_offset,
> +				blk->data, blk->size);
> +		} else if (!fw_block_mem(&gmu->icache, blk) &&
> +			   !fw_block_mem(&gmu->dcache, blk) &&
> +			   !fw_block_mem(&gmu->dummy, blk)) {
> +			DRM_DEV_ERROR(gmu->dev,
> +				"failed to match fw block (addr=%.8x size=%d data[0]=%.8x)\n",
> +				blk->addr, blk->size, blk->data[0]);
> +		}
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
> @@ -618,13 +701,6 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
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
> @@ -638,11 +714,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
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
> @@ -775,6 +849,13 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
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
>  	ret = a6xx_gmu_fw_start(gmu, status);
>  	if (ret)
>  		goto out;
> @@ -957,6 +1038,9 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
>  {
>  	msm_gem_kernel_put(gmu->hfi.obj, gmu->aspace, false);
>  	msm_gem_kernel_put(gmu->debug.obj, gmu->aspace, false);
> +	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
> +	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
> +	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
>  
>  	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
>  	msm_gem_address_space_put(gmu->aspace);
> @@ -974,12 +1058,14 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
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
> @@ -1320,7 +1406,27 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
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
> index 463e2d5f2bb9..c6d8c0d1f90b 100644
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
> @@ -92,6 +95,13 @@ static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
>  	return msm_writel(value, gmu->mmio + (offset << 2));
>  }
>  
> +static inline void
> +gmu_write_bulk(struct a6xx_gmu *gmu, u32 offset, const u32 *data, u32 size)
> +{
> +	memcpy_toio(gmu->mmio + (offset << 2), data, size);
> +	wmb();
> +}
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

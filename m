Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82B4126DE6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 20:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03DB6E3C1;
	Thu, 19 Dec 2019 19:23:25 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9BC6E3C1
 for <dri-devel@freedesktop.org>; Thu, 19 Dec 2019 19:23:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576783404; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=QTWlYrQbxcO9fYiza5POtDwRYp37YaPpFMXhRPSU1wo=;
 b=EtRKLIZZNHWwQiZZAp/ti3uUXDabYh5aMC0wigPm65mj+Vy7fn0rbXILRBnRlxdI5RYvkcBK
 ESqcIr4+1zwohqyvgVzm7ow6SxQmJWwqjLGg+YC2ntrHtgxrdHv90IfU7aR9cMjmbvXpojBH
 Rjf/qMW81blV3le6MhgnJ6F+XS0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfbce28.7f342550ed88-smtp-out-n02;
 Thu, 19 Dec 2019 19:23:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D7A47C433A2; Thu, 19 Dec 2019 19:23:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3C49C43383;
 Thu, 19 Dec 2019 19:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3C49C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 19 Dec 2019 12:23:16 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/5] drm/msm: Pass mmu features to generic layers
Message-ID: <20191219192314.GA25355@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 iommu@lists.linux-foundation.org, saiprakash.ranjan@codeaurora.org
References: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
 <1576761286-20451-5-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576761286-20451-5-git-send-email-smasetty@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, saiprakash.ranjan@codeaurora.org,
 will@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dri-devel@freedesktop.org,
 robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 06:44:45PM +0530, Sharat Masetty wrote:
> Allow different Adreno targets the ability to pass
> specific mmu features to the generic layers. This will
> help conditionally configure certain iommu features for
> certain Adreno targets.
> 
> Also Add a few simple support functions to support a bitmask of
> features that a specific MMU implementation supports.

This whole change could benefit from [1] which makes the address space
creation target specific.

That would get rid of most of the blobs. Further more, if you took part of [2]
that set up the mmu inside of the target specific code (skipping over the
SPLIT_PAGETABLE stuff for now) you could set mmu->features directly and not need
a helper function to do it.

[1] https://patchwork.freedesktop.org/patch/342170/
[2] https://patchwork.freedesktop.org/patch/342173/

Jordan

> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c           |  6 ++++--
>  drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>  drivers/gpu/drm/msm/msm_mmu.h           | 11 +++++++++++
>  10 files changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index 1f83bc1..bbac43c 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -472,7 +472,7 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
>  
>  	adreno_gpu->reg_offsets = a2xx_register_offsets;
>  
> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> +	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1, 0);
>  	if (ret)
>  		goto fail;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 5f7e980..63448fb 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -488,7 +488,7 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->registers = a3xx_registers;
>  	adreno_gpu->reg_offsets = a3xx_register_offsets;
>  
> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> +	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1, 0);
>  	if (ret)
>  		goto fail;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index ab2b752..90ae26d 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -572,7 +572,7 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->registers = a4xx_registers;
>  	adreno_gpu->reg_offsets = a4xx_register_offsets;
>  
> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> +	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1, 0);
>  	if (ret)
>  		goto fail;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 99cd6e6..a51ed2e 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1445,7 +1445,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  
>  	check_speed_bin(&pdev->dev);
>  
> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 4);
> +	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 4, 0);
>  	if (ret) {
>  		a5xx_destroy(&(a5xx_gpu->base.base));
>  		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..faff6ff 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -924,7 +924,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->registers = NULL;
>  	adreno_gpu->reg_offsets = a6xx_register_offsets;
>  
> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> +	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1, 0);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 048c8be..7dade16 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -895,7 +895,8 @@ static int adreno_get_pwrlevels(struct device *dev,
>  
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct adreno_gpu *adreno_gpu,
> -		const struct adreno_gpu_funcs *funcs, int nr_rings)
> +		const struct adreno_gpu_funcs *funcs, int nr_rings,
> +		u32 mmu_features)
>  {
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
>  	struct msm_gpu_config adreno_gpu_config  = { 0 };
> @@ -916,6 +917,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		adreno_gpu_config.va_end = SZ_16M + 0xfff * SZ_64K;
>  
>  	adreno_gpu_config.nr_rings = nr_rings;
> +	adreno_gpu_config.mmu_features = mmu_features;
>  
>  	adreno_get_pwrlevels(&pdev->dev, gpu);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e12d5a9..27716f6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -248,7 +248,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct adreno_gpu *gpu, const struct adreno_gpu_funcs *funcs,
> -		int nr_rings);
> +		int nr_rings, u32 mmu_features);
>  void adreno_gpu_cleanup(struct adreno_gpu *gpu);
>  int adreno_load_fw(struct adreno_gpu *adreno_gpu);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index a052364..8bba01e 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -804,7 +804,7 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
>  
>  static struct msm_gem_address_space *
>  msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
> -		uint64_t va_start, uint64_t va_end)
> +		uint64_t va_start, uint64_t va_end, u32 mmu_features)
>  {
>  	struct msm_gem_address_space *aspace;
>  	int ret;
> @@ -838,6 +838,8 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
>  		return ERR_CAST(aspace);
>  	}
>  
> +	msm_mmu_set_feature(aspace->mmu, mmu_features);
> +
>  	ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
>  	if (ret) {
>  		msm_gem_address_space_put(aspace);
> @@ -920,7 +922,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	msm_devfreq_init(gpu);
>  
>  	gpu->aspace = msm_gpu_create_address_space(gpu, pdev,
> -		config->va_start, config->va_end);
> +		config->va_start, config->va_end, config->mmu_features);


>  
>  	if (gpu->aspace == NULL)
>  		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index a58ef16..fcdbab6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -24,6 +24,7 @@ struct msm_gpu_config {
>  	uint64_t va_start;
>  	uint64_t va_end;
>  	unsigned int nr_rings;
> +	u32 mmu_features;
>  };
>  
>  /* So far, with hardware that I've seen to date, we can have:
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 871d563..1e4ac36d 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -23,6 +23,7 @@ struct msm_mmu {
>  	struct device *dev;
>  	int (*handler)(void *arg, unsigned long iova, int flags);
>  	void *arg;
> +	u32 features;
>  };
>  
>  static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
> @@ -45,4 +46,14 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>  void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>  		dma_addr_t *tran_error);
>  
> +static inline void msm_mmu_set_feature(struct msm_mmu *mmu, u32 feature)
> +{
> +	mmu->features |= feature;
> +}
> +
> +static inline bool msm_mmu_has_feature(struct msm_mmu *mmu, u32 feature)
> +{
> +	return (mmu->features & feature) ? true : false;
> +}
> +
>  #endif /* __MSM_MMU_H__ */
> -- 
> 1.9.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

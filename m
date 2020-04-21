Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E22B41B2CD1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 18:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E926E2ED;
	Tue, 21 Apr 2020 16:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4986E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:39:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587487146; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ARqzDa0emM0SSGQygfh5tqB9cmkRZBpX2W+DDiBbY0s=;
 b=lmovSACwa6GOrO1vBOG3EUIoMNfr4sWZb2JdQRf/BKp2MPmweW4JILf6VZVq620gG+pXPNVx
 G7gNbfpqhLMF8Qf1IesRQbvA+1qrX7T3ACN5hQNSdc06QPbcKClQKSvwIHjqvEruOqqhs/5E
 a3o1Gffk2zBhSqFnH+jgvhlRBRo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f2196.7fc798505d50-smtp-out-n04;
 Tue, 21 Apr 2020 16:38:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 716F1C43637; Tue, 21 Apr 2020 16:38:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 61FAFC433CB;
 Tue, 21 Apr 2020 16:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61FAFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 21 Apr 2020 10:38:41 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH 8/9] drm/msm/a6xx: enable GMU log
Message-ID: <20200421163841.GC13825@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
References: <20200420140313.7263-1-jonathan@marek.ca>
 <20200420140313.7263-9-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420140313.7263-9-jonathan@marek.ca>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 10:03:12AM -0400, Jonathan Marek wrote:
> This is required for a650 to work.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 16 ++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  4 ++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b583bf6e293b..1cdb7c832b87 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -198,6 +198,12 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
>  	u32 val;
>  
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
> +
> +	/* Set the log wptr index
> +	 * note: downstream saves the value in poweroff and restores it here
> +	 */
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
> +
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
>  
>  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
> @@ -739,6 +745,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  
>  	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
>  
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG,
> +		  gmu->log->iova | (gmu->log->size / SZ_4K - 1));
> +
>  	/* Set up the lowest idle level on the GMU */
>  	a6xx_gmu_power_config(gmu);
>  
> @@ -1416,6 +1425,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  	a6xx_gmu_memory_free(gmu, gmu->dcache);
>  	a6xx_gmu_memory_free(gmu, gmu->dummy);
>  	a6xx_gmu_memory_free(gmu, gmu->debug);
> +	a6xx_gmu_memory_free(gmu, gmu->log);
>  	a6xx_gmu_memory_free(gmu, gmu->hfi);
>  
>  	iommu_detach_device(gmu->domain, gmu->dev);
> @@ -1495,6 +1505,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	if (IS_ERR(gmu->hfi))
>  		goto err_memory;
>  
> +	/* Allocate memory for the GMU log region */
> +	gmu->log = a6xx_gmu_memory_alloc(gmu, SZ_4K, 0);
> +	if (IS_ERR(gmu->log))
> +		goto err_memory;
> +
>  	/* Map the GMU registers */
>  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
>  	if (IS_ERR(gmu->mmio))
> @@ -1542,6 +1557,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  	a6xx_gmu_memory_free(gmu, gmu->dcache);
>  	a6xx_gmu_memory_free(gmu, gmu->dummy);
>  	a6xx_gmu_memory_free(gmu, gmu->debug);
> +	a6xx_gmu_memory_free(gmu, gmu->log);
>  	a6xx_gmu_memory_free(gmu, gmu->hfi);

This is starting to feel like we could use some devres style garbage collection.

>  
>  	if (gmu->domain) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index abd425ca6682..589b9b0c348e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -59,6 +59,7 @@ struct a6xx_gmu {
>  
>  	struct a6xx_gmu_bo *hfi;
>  	struct a6xx_gmu_bo *debug;
> +	struct a6xx_gmu_bo *log;
>  	struct a6xx_gmu_bo *icache;
>  	struct a6xx_gmu_bo *dcache;
>  	struct a6xx_gmu_bo *dummy;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> index b4357ea550ec..176ae94d9fe6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> @@ -205,6 +205,10 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>  
>  #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
>  
> +#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
> +
> +#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
> +
>  #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
>  
>  #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
> -- 
> 2.26.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

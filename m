Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5151D7BB9
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9753F6E34A;
	Mon, 18 May 2020 14:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFEF6E340
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:47:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589813227; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=UGTXBvl9Wc61eV/J0mp1IY6DwD5usu85aOYigFBHuko=;
 b=uCUhiNFdVWs9CkG5ydmu4VBKi6yXMhWYHWL1RBKoJr4UcgHw+3mqZmF8t5m2SrMTYBJSmvZ7
 XfjUnxWEq1ftSTj71lY63xtddv4hW9i7QGK+i4DOSZE6NUAIORjg6z3OvZAkfKHGSixH30Q1
 kg7+jcYHI2U/kfMhxuWKvItRQ7M=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec29feb.7f6a8aae1030-smtp-out-n01;
 Mon, 18 May 2020 14:47:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E2BF0C433D2; Mon, 18 May 2020 14:47:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7700CC433F2;
 Mon, 18 May 2020 14:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7700CC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 18 May 2020 08:47:03 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 9/9] drm/msm/a6xx: update a6xx_hw_init for A640 and A650
Message-ID: <20200518144703.GF3915@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200423210946.28867-1-jonathan@marek.ca>
 <20200423210946.28867-10-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423210946.28867-10-jonathan@marek.ca>
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
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 05:09:21PM -0400, Jonathan Marek wrote:
> Adreno 640 and 650 GPUs need some registers set differently.

As before, make sure you send the XML updates up so the database stays current.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h | 14 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 56 ++++++++++++++++++++++-----
>  2 files changed, 61 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
> index ed78fee2a262..47840b73cdda 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
> @@ -1047,6 +1047,8 @@ enum a6xx_tex_type {
>  
>  #define REG_A6XX_CP_MISC_CNTL					0x00000840
>  
> +#define REG_A6XX_CP_APRIV_CNTL					0x00000844
> +
>  #define REG_A6XX_CP_ROQ_THRESHOLDS_1				0x000008c1
>  
>  #define REG_A6XX_CP_ROQ_THRESHOLDS_2				0x000008c2
> @@ -1764,6 +1766,8 @@ static inline uint32_t A6XX_CP_PROTECT_REG_MASK_LEN(uint32_t val)
>  
>  #define REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL			0x00000010
>  
> +#define REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL			0x00000011
> +
>  #define REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL			0x0000001f
>  
>  #define REG_A6XX_RBBM_INT_CLEAR_CMD				0x00000037
> @@ -2418,6 +2422,16 @@ static inline uint32_t A6XX_UCHE_CLIENT_PF_PERFSEL(uint32_t val)
>  
>  #define REG_A6XX_TPL1_NC_MODE_CNTL				0x0000b604
>  
> +#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0			0x0000b608
> +
> +#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1			0x0000b609
> +
> +#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2			0x0000b60a
> +
> +#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3			0x0000b60b
> +
> +#define REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4			0x0000b60c
> +
>  #define REG_A6XX_TPL1_PERFCTR_TP_SEL_0				0x0000b610
>  
>  #define REG_A6XX_TPL1_PERFCTR_TP_SEL_1				0x0000b611
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index a860d4970e10..e1eb34fa3a99 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -414,7 +414,17 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  		a6xx_set_hwcg(gpu, true);
>  
>  	/* VBIF/GBIF start*/
> -	gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
> +	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
> +		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
> +		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
> +		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
> +		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
> +	} else {
> +		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
> +	}
> +
>  	if (adreno_is_a630(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
>  
> @@ -429,25 +439,35 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0xfffff000);
>  	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
>  
> -	/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
> -	gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
> -		REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
> +	if (!adreno_is_a650(adreno_gpu)) {
> +		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
> +		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
> +			REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
>  
> -	gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX_LO,
> -		REG_A6XX_UCHE_GMEM_RANGE_MAX_HI,
> -		0x00100000 + adreno_gpu->gmem - 1);
> +		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX_LO,
> +			REG_A6XX_UCHE_GMEM_RANGE_MAX_HI,
> +			0x00100000 + adreno_gpu->gmem - 1);
> +	}
>  
>  	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
>  	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
>  
> -	gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
> +	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu))
> +		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
> +	else
> +		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
>  	gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
>  
>  	/* Setting the mem pool size */
>  	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
>  
>  	/* Setting the primFifo thresholds default values */
> -	gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, (0x300 << 11));
> +	if (adreno_is_a650(adreno_gpu))
> +		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300000);
> +	else if (adreno_is_a640(adreno_gpu))
> +		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200000);
> +	else
> +		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, (0x300 << 11));
>  
>  	/* Set the AHB default slave response to "ERROR" */
>  	gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
> @@ -471,6 +491,19 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
>  
> +	/* Set weights for bicubic filtering */
> +	if (adreno_is_a650(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +			0x3fe05ff4);
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +			0x3fa0ebee);
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +			0x3f5193ed);
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +			0x3f0243f0);
> +	}
> +
>  	/* Protect registers from the CP */
>  	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, 0x00000003);
>  
> @@ -508,6 +541,11 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>  			A6XX_PROTECT_RDONLY(0x980, 0x4));
>  	gpu_write(gpu, REG_A6XX_CP_PROTECT(25), A6XX_PROTECT_RW(0xa630, 0x0));
>  
> +	if (adreno_is_a650(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_CP_APRIV_CNTL,
> +			(1 << 6) | (1 << 5) | (1 << 3) | (1 << 2) | (1 << 1));
> +	}
> +
>  	/* Enable interrupts */
>  	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_INT_MASK);
>  
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

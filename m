Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E241B2D12
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 18:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43496E30E;
	Tue, 21 Apr 2020 16:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092E38930E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:48:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587487700; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=OXhBL5oimC0xxfX2i1rmN7+RusYn9+BsYrXGaYsdBZ4=;
 b=CY/b2o2yctDpmw8+6Vz/uYSmzlKvUifFwa86ZwGYPYX97KXoGIbmGHJU1W/sGiqWZxrDkN91
 oAfnHHKQHneZMi6/vvYHps2cvBK/NyrRFvQHfotNLf16pU8HQXnLz2MxnKsCDyR0Dhrv5nGh
 3P4ulyYvA1j1Wm34djttAPH2Hu8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f23d1.7f3976ce02d0-smtp-out-n01;
 Tue, 21 Apr 2020 16:48:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4E163C44788; Tue, 21 Apr 2020 16:48:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E896C433D2;
 Tue, 21 Apr 2020 16:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E896C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 21 Apr 2020 10:48:11 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 9/9] drm/msm/a6xx: update a6xx_hw_init for A640 and A650
Message-ID: <20200421164810.GD13825@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200420140313.7263-1-jonathan@marek.ca>
 <20200420140313.7263-10-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420140313.7263-10-jonathan@marek.ca>
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

On Mon, Apr 20, 2020 at 10:03:13AM -0400, Jonathan Marek wrote:
> Adreno 640 and 650 GPUs need some registers set differently.

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

Oops, this should have been changed for 618 too.  Only 630 had the VBIF
so you can invert this if statement.

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

Okay, so this guy is fun. With these setting enabled the ringbuffer
automatically has register protection turned off and it can access privileged
buffers without setting any special registers. This isn't something we can
immediately take advantage of but the potential is there.

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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5C1D7BAB
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544FD89E86;
	Mon, 18 May 2020 14:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5CF89E86
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:46:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589813177; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=p5BjWiibjDX8jS5VnNz5ZiS87itwWoidnp54Cdhw4RY=;
 b=m1CR+aay3GTz3tjaOxnmTOQj2D3snt9GG04FrloamTclvzcGFlMxc5TT0I1YIoTg1loHqVV3
 288sBpDGY1xzKyVb550Z7F35h8m/pOlBsW6k4IEj/9C+N5GM97ioNAUXjE0prkE3lVaLdkWo
 0rcbMLgYYsGzCqibu5Uu3gSLKXg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec29fb8.7f54e6f77d50-smtp-out-n02;
 Mon, 18 May 2020 14:46:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 259A2C432C2; Mon, 18 May 2020 14:46:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B665C433D2;
 Mon, 18 May 2020 14:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B665C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 18 May 2020 08:46:10 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 7/9] drm/msm/a6xx: update pdc/rscc GMU registers for
 A640/A650
Message-ID: <20200518144610.GE3915@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200423210946.28867-1-jonathan@marek.ca>
 <20200423210946.28867-8-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423210946.28867-8-jonathan@marek.ca>
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

On Thu, Apr 23, 2020 at 05:09:19PM -0400, Jonathan Marek wrote:
> Update the gmu_pdc registers for A640 and A650.
> 
> Some of the RSCC registers on A650 are in a separate region.
> 
> Note this also changes the address of these registers:
> 
> RSCC_TCS1_DRV0_STATUS
> RSCC_TCS2_DRV0_STATUS
> RSCC_TCS3_DRV0_STATUS
> 
> Based on the values in msm-4.14 and msm-4.19 kernels.
> 
> v3: replaced adreno_is_a650 around ->rscc with checks for "rscc" resource

This is one of the most frustrating bits about the different GMU flavors. There
is simply no way to make this code elegant.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 90 ++++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h     | 10 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 38 +++++-----
>  3 files changed, 85 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 988575fc8e71..c6fce994194d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -421,7 +421,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>  		return ret;
>  	}
>  
> -	ret = gmu_poll_timeout(gmu, REG_A6XX_RSCC_SEQ_BUSY_DRV0, val,
> +	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_SEQ_BUSY_DRV0, val,
>  		!val, 100, 10000);
>  
>  	if (ret) {
> @@ -447,7 +447,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>  
>  	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
>  
> -	ret = gmu_poll_timeout(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
> +	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
>  		val, val & (1 << 16), 100, 10000);
>  	if (ret)
>  		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
> @@ -470,32 +470,48 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	struct platform_device *pdev = to_platform_device(gmu->dev);
>  	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
>  	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
> +	uint32_t pdc_address_offset;
>  
>  	if (!pdcptr || !seqptr)
>  		goto err;
>  
> +	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
> +		pdc_address_offset = 0x30090;
> +	else if (adreno_is_a650(adreno_gpu))
> +		pdc_address_offset = 0x300a0;
> +	else
> +		pdc_address_offset = 0x30080;
> +
>  	/* Disable SDE clock gating */
> -	gmu_write(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
> +	gmu_write_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
>  
>  	/* Setup RSC PDC handshake for sleep and wakeup */
> -	gmu_write(gmu, REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0, 1);
> -	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA, 0);
> -	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR, 0);
> -	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
> -	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
> -	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4, 0x80000000);
> -	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 4, 0);
> -	gmu_write(gmu, REG_A6XX_RSCC_OVERRIDE_START_ADDR, 0);
> -	gmu_write(gmu, REG_A6XX_RSCC_PDC_SEQ_START_ADDR, 0x4520);
> -	gmu_write(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_LO, 0x4510);
> -	gmu_write(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0, 1);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA, 0);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR, 0);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4, 0x80000000);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 4, 0);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_OVERRIDE_START_ADDR, 0);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_SEQ_START_ADDR, 0x4520);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_LO, 0x4510);
> +	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
>  
>  	/* Load RSC sequencer uCode for sleep and wakeup */
> -	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xa7a506a0);
> -	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xa1e6a6e7);
> -	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e081e1);
> -	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xe9a982e2);
> -	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020e8a8);
> +	if (adreno_is_a650(adreno_gpu)) {
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xeaaae5a0);
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xe1a1ebab);
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e0a581);
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xecac82e2);
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020edad);
> +	} else {
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xa7a506a0);
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xa1e6a6e7);
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e081e1);
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xe9a982e2);
> +		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020e8a8);
> +	}
>  
>  	/* Load PDC sequencer uCode for power up and power down sequence */
>  	pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0, 0xfebea1e1);
> @@ -516,10 +532,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 4, 0x0);
>  
>  	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID + 8, 0x10108);
> -	if (adreno_is_a618(adreno_gpu))
> -		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30090);
> -	else
> -		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30080);
> +	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, pdc_address_offset);
>  	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 8, 0x0);
>  
>  	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD_ENABLE_BANK, 7);
> @@ -531,17 +544,12 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  
>  	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 4, 0x10108);
>  	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, 0x30000);
> -	if (adreno_is_a618(adreno_gpu))
> +	if (adreno_is_a618(adreno_gpu) || adreno_is_a650(adreno_gpu))
>  		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x2);
>  	else
>  		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x3);
> -
> -
>  	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 8, 0x10108);
> -	if (adreno_is_a618(adreno_gpu))
> -		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30090);
> -	else
> -		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30080);
> +	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, pdc_address_offset);
>  	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 8, 0x3);
>  
>  	/* Setup GPU PDC */
> @@ -788,13 +796,13 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  	u32 val;
>  
>  	/* Make sure there are no outstanding RPMh votes */
> -	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS0_DRV0_STATUS, val,
> +	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS0_DRV0_STATUS, val,
>  		(val & 1), 100, 10000);
> -	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS1_DRV0_STATUS, val,
> +	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS1_DRV0_STATUS, val,
>  		(val & 1), 100, 10000);
> -	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS2_DRV0_STATUS, val,
> +	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS2_DRV0_STATUS, val,
>  		(val & 1), 100, 10000);
> -	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
> +	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
>  		(val & 1), 100, 1000);
>  }
>  
> @@ -1353,6 +1361,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  {
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	struct platform_device *pdev = to_platform_device(gmu->dev);
>  
>  	if (!gmu->initialized)
>  		return;
> @@ -1365,7 +1374,10 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  	}
>  
>  	iounmap(gmu->mmio);
> +	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> +		iounmap(gmu->rscc);
>  	gmu->mmio = NULL;
> +	gmu->rscc = NULL;
>  
>  	a6xx_gmu_memory_free(gmu);
>  
> @@ -1448,6 +1460,14 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  		goto err_memory;
>  	}
>  
> +	if (adreno_is_a650(adreno_gpu)) {
> +		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
> +		if (IS_ERR(gmu->rscc))
> +			goto err_mmio;
> +	} else {
> +		gmu->rscc = gmu->mmio + 0x23000;
> +	}
> +
>  	/* Get the HFI and GMU interrupts */
>  	gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
>  	gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
> @@ -1473,6 +1493,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  
>  err_mmio:
>  	iounmap(gmu->mmio);
> +	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> +		iounmap(gmu->rscc);
>  	free_irq(gmu->gmu_irq, gmu);
>  	free_irq(gmu->hfi_irq, gmu);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index c6d8c0d1f90b..e16c16bb65bf 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -47,6 +47,7 @@ struct a6xx_gmu {
>  	struct msm_gem_address_space *aspace;
>  
>  	void * __iomem mmio;
> +	void * __iomem rscc;
>  
>  	int hfi_irq;
>  	int gmu_irq;
> @@ -125,6 +126,15 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
>  	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
>  		interval, timeout)
>  
> +static inline void gmu_write_rscc(struct a6xx_gmu *gmu, u32 offset, u32 value)
> +{
> +	return msm_writel(value, gmu->rscc + (offset << 2));
> +}
> +
> +#define gmu_poll_timeout_rscc(gmu, addr, val, cond, interval, timeout) \
> +	readl_poll_timeout((gmu)->rscc + ((addr) << 2), val, cond, \
> +		interval, timeout)
> +
>  /*
>   * These are the available OOB (out of band requests) to the GMU where "out of
>   * band" means that the CPU talks to the GMU directly and not through HFI.
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> index eb2cd41dae6e..b4357ea550ec 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
> @@ -336,8 +336,6 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>  
>  #define REG_A6XX_GMU_AO_SPARE_CNTL				0x00009316
>  
> -#define REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0			0x00008c04
> -
>  #define REG_A6XX_GMU_RSCC_CONTROL_REQ				0x00009307
>  
>  #define REG_A6XX_GMU_RSCC_CONTROL_ACK				0x00009308
> @@ -350,39 +348,41 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
>  
>  #define REG_A6XX_GPU_CC_GX_DOMAIN_MISC				0x00009d42
>  
> -#define REG_A6XX_RSCC_PDC_SEQ_START_ADDR			0x00008c08
> +#define REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0			0x00000004
> +
> +#define REG_A6XX_RSCC_PDC_SEQ_START_ADDR			0x00000008
>  
> -#define REG_A6XX_RSCC_PDC_MATCH_VALUE_LO			0x00008c09
> +#define REG_A6XX_RSCC_PDC_MATCH_VALUE_LO			0x00000009
>  
> -#define REG_A6XX_RSCC_PDC_MATCH_VALUE_HI			0x00008c0a
> +#define REG_A6XX_RSCC_PDC_MATCH_VALUE_HI			0x0000000a
>  
> -#define REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0				0x00008c0b
> +#define REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0				0x0000000b
>  
> -#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR			0x00008c0d
> +#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR			0x0000000d
>  
> -#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA			0x00008c0e
> +#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA			0x0000000e
>  
> -#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_L_DRV0		0x00008c82
> +#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_L_DRV0		0x00000082
>  
> -#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_H_DRV0		0x00008c83
> +#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_H_DRV0		0x00000083
>  
> -#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_EN_DRV0			0x00008c89
> +#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_EN_DRV0			0x00000089
>  
> -#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_OUTPUT_DRV0		0x00008c8c
> +#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_OUTPUT_DRV0		0x0000008c
>  
> -#define REG_A6XX_RSCC_OVERRIDE_START_ADDR			0x00008d00
> +#define REG_A6XX_RSCC_OVERRIDE_START_ADDR			0x00000100
>  
> -#define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00008d01
> +#define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00000101
>  
> -#define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00008d80
> +#define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00000180
>  
> -#define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00008f46
> +#define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00000346
>  
> -#define REG_A6XX_RSCC_TCS1_DRV0_STATUS				0x000090ae
> +#define REG_A6XX_RSCC_TCS1_DRV0_STATUS				0x000003ee
>  
> -#define REG_A6XX_RSCC_TCS2_DRV0_STATUS				0x00009216
> +#define REG_A6XX_RSCC_TCS2_DRV0_STATUS				0x00000496
>  
> -#define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000937e
> +#define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000053e
>  
>  
>  #endif /* A6XX_GMU_XML */
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

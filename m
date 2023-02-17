Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D5869B4DB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D084310E474;
	Fri, 17 Feb 2023 21:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD6410E1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:37:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y29so3007097lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2xXZ4e9APLByS3a7eFOZRk6xLuGSn3K1y4gsPgwKaw=;
 b=cCbBgWJymamw7oCD2e2bMwd72SXFi55mgeeWxYL79wKYeicLptpUVLgL/TToV446Xb
 3qhG4GSBvBcrIn5jkL39oPtUUrPCAes3t1IU69w8QZxRhEeBE4pBld7yy7SAYlNKJouy
 MVtU5ntYwK1I+ZFy0teueVLDFDPY5+u7AonO1LjP2YQdDWUkHDZzvGa4t4Zi68/tWaB6
 JyGtKQe/bc0u/7iY+bW35Ik2Ht07nq9LVCIHiCP4Ne6lSUdTGN4JvF6YPw+AaOZUOSN5
 5mugkhtburegvZYL8m/eDcCIiBFcJSWnM5m55pYTgJDNO4Q4IuPCmfWoYK/d4BN11LRR
 goiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2xXZ4e9APLByS3a7eFOZRk6xLuGSn3K1y4gsPgwKaw=;
 b=WNCYZVJipv6xUOTvNAOfTsIcHKFNhcZpY57DmtF4UxCHVQe1OsIYBq3ijJcCHB0lZG
 +g+enf02WVT2J82tPdHe7q9H8Qga1sk/CnAMPgS0RiTOG/XVFjbPf4L8N0ze1D+BAwAt
 iHwrNKD0B76mD92w6MOX2XlstMKVapEbDSeVQ5gANQS051hRn6Czn1JcVIEdTebzWrBA
 NlSjajZoi9LI1lrsuu0Gka6jZbCC51c4F52yzJFr/FGLXFYI4jEi8I9DJMSGDeinaSGT
 KIgSsnXswQAqNhqFST56Zuh/D6ERY4OxQWrP1hgNl71/OHFBTCChgE0HugzOQCOxJMpI
 FQcA==
X-Gm-Message-State: AO0yUKV+0FQC6r745SvihlAy7VcAbnpWy/DYlXOfNyQAo+wUtC4L1oTm
 fMhvqRoC+VgJ088dyfe/EWOdDw==
X-Google-Smtp-Source: AK7set9dMCe4qQbceyZ0HJJraKaFJZaH0orilFjsuiabZ5/6SIBQMETLUDJZT5Al3p2Tn5cjzRQ89Q==
X-Received: by 2002:ac2:5fee:0:b0:4d7:576c:18d1 with SMTP id
 s14-20020ac25fee000000b004d7576c18d1mr711852lfg.34.1676669832706; 
 Fri, 17 Feb 2023 13:37:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z9-20020ac25de9000000b0048afb8b8e53sm786096lfq.80.2023.02.17.13.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:37:11 -0800 (PST)
Message-ID: <caae5c4b-4aa6-5219-3278-92c3bed7868d@linaro.org>
Date: Fri, 17 Feb 2023 23:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 03/14] drm/msm/a6xx: Introduce GMU wrapper support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-4-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-4-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
> but don't implement the associated GMUs. This is due to the fact that
> the GMU directly pokes at RPMh. Sadly, this means we have to take care
> of enabling & scaling power rails, clocks and bandwidth ourselves.
> 
> Reuse existing Adreno-common code and modify the deeply-GMU-infused
> A6XX code to facilitate these GPUs. This involves if-ing out lots
> of GMU callbacks and introducing a new type of GMU - GMU wrapper.
> This is essentially a register region which is convenient to model
> as a device. We'll use it for managing the GDSCs.

Why do you call it a wrapper?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  51 ++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 198 +++++++++++++++++---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
>   5 files changed, 233 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 90e636dcdd5b..5aa9f3ef41c2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1474,6 +1474,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
>   
>   void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>   {
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>   	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>   	struct platform_device *pdev = to_platform_device(gmu->dev);
>   
> @@ -1493,10 +1494,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>   	gmu->mmio = NULL;
>   	gmu->rscc = NULL;
>   
> -	a6xx_gmu_memory_free(gmu);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		a6xx_gmu_memory_free(gmu);
>   
> -	free_irq(gmu->gmu_irq, gmu);
> -	free_irq(gmu->hfi_irq, gmu);
> +		free_irq(gmu->gmu_irq, gmu);
> +		free_irq(gmu->hfi_irq, gmu);
> +	}
>   
>   	/* Drop reference taken in of_find_device_by_node */
>   	put_device(gmu->dev);
> @@ -1504,6 +1507,48 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>   	gmu->initialized = false;
>   }
>   
> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(node);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	int ret;
> +
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	gmu->dev = &pdev->dev;
> +
> +	of_dma_configure(gmu->dev, node, true);
> +
> +	pm_runtime_enable(gmu->dev);
> +
> +	/* Mark legacy for manual SPTPRAC control */
> +	gmu->legacy = true;
> +
> +	/* Map the GMU registers */
> +	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
> +	if (IS_ERR(gmu->mmio)) {
> +		ret = PTR_ERR(gmu->mmio);
> +		goto err_mmio;
> +	}
> +
> +	/* Get a link to the GX power domain to reset the GPU */
> +	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
> +
> +	gmu->initialized = true;
> +
> +	return 0;
> +
> +err_mmio:
> +	iounmap(gmu->mmio);
> +	ret = -ENODEV;
> +
> +	/* Drop reference taken in of_find_device_by_node */
> +	put_device(gmu->dev);
> +
> +	return ret;
> +}
> +
>   int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   {
>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 8855d798bbb3..72bf5c9f7ff1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -20,9 +20,11 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   
> -	/* Check that the GMU is idle */
> -	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> -		return false;
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Check that the GMU is idle */
> +		if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> +			return false;
> +	}
>   
>   	/* Check tha the CX master is idle */
>   	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS) &
> @@ -612,13 +614,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>   		return;
>   
>   	/* Disable SP clock before programming HWCG registers */
> -	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
>   
>   	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
>   		gpu_write(gpu, reg->offset, state ? reg->value : 0);
>   
>   	/* Enable SP clock */
> -	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
>   
>   	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
>   }
> @@ -994,10 +998,13 @@ static int hw_init(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>   	int ret;
>   
> -	/* Make sure the GMU keeps the GPU on while we set it up */
> -	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Make sure the GMU keeps the GPU on while we set it up */
> +		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> +	}
>   
>   	/* Clear GBIF halt in case GX domain was not collapsed */
>   	if (a6xx_has_gbif(adreno_gpu))
> @@ -1123,6 +1130,17 @@ static int hw_init(struct msm_gpu *gpu)
>   			0x3f0243f0);
>   	}
>   
> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Do it here, as GMU wrapper only inits the GMU for memory reservation etc. */
> +
> +		/* Set up the CX GMU counter 0 to count busy ticks */
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
> +
> +		/* Enable power counter 0 */
> +		gmu_rmw(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0, 0xff, BIT(5));
> +		gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
> +	}
> +
>   	/* Protect registers from the CP */
>   	a6xx_set_cp_protect(gpu);
>   
> @@ -1231,6 +1249,8 @@ static int hw_init(struct msm_gpu *gpu)
>   	}
>   
>   out:
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return ret;
>   	/*
>   	 * Tell the GMU that we are done touching the GPU and it can start power
>   	 * management
> @@ -1265,6 +1285,9 @@ static void a6xx_dump(struct msm_gpu *gpu)
>   	adreno_dump(gpu);
>   }
>   
> +#define GBIF_GX_HALT_MASK	BIT(0)
> +#define GBIF_CLIENT_HALT_MASK	BIT(0)
> +#define GBIF_ARB_HALT_MASK	BIT(1)
>   #define VBIF_RESET_ACK_TIMEOUT	100
>   #define VBIF_RESET_ACK_MASK	0x00f0
>   
> @@ -1296,7 +1319,8 @@ static void a6xx_recover(struct msm_gpu *gpu)
>   	 * Turn off keep alive that might have been enabled by the hang
>   	 * interrupt
>   	 */
> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>   
>   	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
>   
> @@ -1320,6 +1344,35 @@ static void a6xx_recover(struct msm_gpu *gpu)
>   	/* Call into gpucc driver to poll for cx gdsc collapse */
>   	reset_control_reset(gpu->cx_collapse);
>   
> +	/* Software-reset the GPU */
> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Halt the GX side of GBIF */
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
> +		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
> +			   GBIF_GX_HALT_MASK);
> +
> +		/* Halt new client requests on GBIF */
> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> +		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> +			   (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
> +
> +		/* Halt all AXI requests on GBIF */
> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> +		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> +			   (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
> +
> +		/* Clear the halts */
> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> +
> +		if (adreno_is_a619_holi(adreno_gpu))
> +			gpu_write(gpu, 0x18, 0);
> +		else
> +			gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> +
> +		/* This *really* needs to go through before we do anything else! */
> +		mb();
> +	}
> +
>   	pm_runtime_use_autosuspend(&gpu->pdev->dev);
>   
>   	if (active_submits)
> @@ -1504,7 +1557,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>   	 * Force the GPU to stay on until after we finish
>   	 * collecting information
>   	 */
> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
>   
>   	DRM_DEV_ERROR(&gpu->pdev->dev,
>   		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
> @@ -1669,6 +1723,7 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>   	int ret;
>   
>   	gpu->needs_hw_init = true;
> @@ -1676,35 +1731,81 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>   	trace_msm_gpu_resume(0);
>   
>   	mutex_lock(&a6xx_gpu->gmu.lock);
> -	ret = a6xx_gmu_resume(a6xx_gpu);
> -	mutex_unlock(&a6xx_gpu->gmu.lock);
> -	if (ret)
> -		return ret;
>   
> -	msm_devfreq_resume(gpu);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		ret = a6xx_gmu_resume(a6xx_gpu);
> +		mutex_unlock(&a6xx_gpu->gmu.lock);
> +		if (ret)
> +			return ret;
>   
> -	a6xx_llc_activate(a6xx_gpu);
> +		msm_devfreq_resume(gpu);
>   
> -	return 0;
> +		a6xx_llc_activate(a6xx_gpu);
> +	} else {
> +		pm_runtime_get_sync(gmu->dev);
> +		if (!IS_ERR_OR_NULL(gmu->gxpd))
> +			pm_runtime_get_sync(gmu->gxpd);
> +
> +		/* Set the core clock, having VDD scaling in mind */
> +		ret = dev_pm_opp_set_rate(gpu->dev->dev, gpu->fast_rate);
> +		if (ret)
> +			return ret;

Both this function and the suspend one below would leave the mutex 
enabled in the error path.

I'd add a6xx_gmu_wrapper_suspend() / _resume() instead, call them 
conditionally close to the plain a6xx_gmu_suspend() / _resume and then 
add a !wrapper contition to the a6xx_llc_(de)activate() calls.

> +
> +		ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
> +		if (ret)
> +			return ret;
> +
> +		ret = clk_prepare_enable(gpu->ebi1_clk);
> +		if (ret)
> +			return ret;
> +
> +		mutex_unlock(&a6xx_gpu->gmu.lock);
> +
> +		msm_devfreq_resume(gpu);
> +	}
> +
> +	return ret;
>   }
>   
>   static int a6xx_pm_suspend(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>   	int i, ret;
>   
>   	trace_msm_gpu_suspend(0);
>   
> -	a6xx_llc_deactivate(a6xx_gpu);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		a6xx_llc_deactivate(a6xx_gpu);
>   
> -	msm_devfreq_suspend(gpu);
> +		msm_devfreq_suspend(gpu);
>   
> -	mutex_lock(&a6xx_gpu->gmu.lock);
> -	ret = a6xx_gmu_stop(a6xx_gpu);
> -	mutex_unlock(&a6xx_gpu->gmu.lock);
> -	if (ret)
> -		return ret;
> +		mutex_lock(&a6xx_gpu->gmu.lock);
> +		ret = a6xx_gmu_stop(a6xx_gpu);
> +		mutex_unlock(&a6xx_gpu->gmu.lock);
> +		if (ret)
> +			return ret;
> +	} else {
> +		msm_devfreq_suspend(gpu);
> +
> +		mutex_lock(&a6xx_gpu->gmu.lock);
> +
> +		ret = clk_prepare_enable(gpu->ebi1_clk);
> +		if (ret)
> +			return ret;
> +
> +		ret = clk_set_rate(gpu->core_clk, 0);
> +		if (ret)
> +			return ret;
> +
> +		if (!IS_ERR_OR_NULL(gmu->gxpd))
> +			pm_runtime_put_sync(gmu->gxpd);
> +
> +		pm_runtime_put_sync(gmu->dev);
> +
> +		mutex_unlock(&a6xx_gpu->gmu.lock);
> +	}
>   
>   	if (a6xx_gpu->shadow_bo)
>   		for (i = 0; i < gpu->nr_rings; i++)
> @@ -1720,6 +1821,11 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   
> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> +		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO);
> +		return 0;
> +	}
> +
>   	mutex_lock(&a6xx_gpu->gmu.lock);
>   
>   	/* Force the GPU power on so we can read this register */
> @@ -1757,7 +1863,8 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>   		drm_gem_object_put(a6xx_gpu->shadow_bo);
>   	}
>   
> -	a6xx_llc_slices_destroy(a6xx_gpu);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		a6xx_llc_slices_destroy(a6xx_gpu);
>   
>   	a6xx_gmu_remove(a6xx_gpu);
>   
> @@ -2020,6 +2127,34 @@ static const struct adreno_gpu_funcs funcs = {
>   	.get_timestamp = a6xx_get_timestamp,
>   };
>   
> +static const struct adreno_gpu_funcs funcs_gmuwrapper = {
> +	.base = {
> +		.get_param = adreno_get_param,
> +		.set_param = adreno_set_param,
> +		.hw_init = a6xx_hw_init,
> +		.pm_suspend = a6xx_pm_suspend,
> +		.pm_resume = a6xx_pm_resume,
> +		.recover = a6xx_recover,
> +		.submit = a6xx_submit,
> +		.active_ring = a6xx_active_ring,
> +		.irq = a6xx_irq,
> +		.destroy = a6xx_destroy,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +		.show = a6xx_show,
> +#endif
> +		.gpu_busy = a6xx_gpu_busy,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +		.gpu_state_get = a6xx_gpu_state_get,
> +		.gpu_state_put = a6xx_gpu_state_put,
> +#endif
> +		.create_address_space = a6xx_create_address_space,
> +		.create_private_address_space = a6xx_create_private_address_space,
> +		.get_rptr = a6xx_get_rptr,
> +		.progress = a6xx_progress,
> +	},
> +	.get_timestamp = a6xx_get_timestamp,
> +};
> +
>   struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
> @@ -2052,7 +2187,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
>   		adreno_gpu->base.hw_apriv = true;
>   
> -	a6xx_llc_slices_init(pdev, a6xx_gpu);
> +	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> +	if (info && info->quirks & ~ADRENO_QUIRK_GMU_WRAPPER)
> +		a6xx_llc_slices_init(pdev, a6xx_gpu);
>   
>   	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
>   	if (ret) {
> @@ -2060,7 +2197,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   		return ERR_PTR(ret);
>   	}
>   
> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> +	if (info && info->quirks & ADRENO_QUIRK_GMU_WRAPPER)

I think !info should be a fatal error here.

Also you can set gpu->info early in this function and use the existing 
adreno_has_gmu_wrapper() instead of hand-coding it here.

> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
> +	else
> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
>   	if (ret) {
>   		a6xx_destroy(&(a6xx_gpu->base.base));
>   		return ERR_PTR(ret);
> @@ -2075,11 +2215,13 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   
>   	/* Check if there is a GMU phandle and set it up */
>   	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> -
>   	/* FIXME: How do we gracefully handle this? */
>   	BUG_ON(!node);
>   
> -	ret = a6xx_gmu_init(a6xx_gpu, node);
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
> +	else
> +		ret = a6xx_gmu_init(a6xx_gpu, node);
>   	of_node_put(node);
>   	if (ret) {
>   		a6xx_destroy(&(a6xx_gpu->base.base));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index eea2e60ce3b7..51a7656072fa 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -76,6 +76,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>   void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>   
>   int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>   void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>   
>   void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index b7e217d00a22..e11e8a02ac22 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1041,16 +1041,18 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>   	/* Get the generic state from the adreno core */
>   	adreno_gpu_state_get(gpu, &a6xx_state->base);
>   
> -	a6xx_get_gmu_registers(gpu, a6xx_state);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		a6xx_get_gmu_registers(gpu, a6xx_state);
>   
> -	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
> -	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
> -	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
> +		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
> +		a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
> +		a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
>   
> -	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
> +		a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
> +	}
>   
>   	/* If GX isn't on the rest of the data isn't going to be accessible */
> -	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
> +	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>   		return &a6xx_state->base;
>   
>   	/* Get the banks of indexed registers */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index b4f9b1343d63..7c5e0a90b5fb 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -32,6 +32,7 @@ enum {
>   #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
>   #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>   #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
> +#define ADRENO_QUIRK_GMU_WRAPPER		BIT(3)
>   
>   struct adreno_rev {
>   	uint8_t  core;
> @@ -145,6 +146,11 @@ struct adreno_platform_config {
>   
>   bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>   
> +static inline bool adreno_has_gmu_wrapper(struct adreno_gpu *gpu)
> +{
> +	return !!(gpu->info->quirks & ADRENO_QUIRK_GMU_WRAPPER);
> +}
> +
>   static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
>   {
>   	return (gpu->revn < 300);

-- 
With best wishes
Dmitry


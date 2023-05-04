Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF06F651B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 08:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF9F10E399;
	Thu,  4 May 2023 06:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE0710E398
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 06:34:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ec9c7c6986so105592e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683182050; x=1685774050;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OHCwM54cF9BEFTWJALMzqBlcY59FLmcgLPg49DT67Ms=;
 b=N6rLh3+ivTijJB2CyWvBieSPWYTm2RCcRCyJOyBoHwSathYJpxwAsMlhavbbp/OYQp
 QUPd1sQeWo/l9MDmwwNXcn/FdK6juJryR2Pa0fMbEAk1bW+OBHTvwNZJeTHCkJc3ORNO
 U+1NouK/YI5uBokALzCYw9BIid+g4oWvMTpuQ/d/FdT+M0MySZJHjJw2YLenekV8VG5e
 EfjkAq2ZEu3Dly/uH6LlIRiPWEVaEVAux0yrn2Ce4650dN08Cn9FQV2leq2Piugc2ZRw
 OaFzbRSknUSl31BRL4dXbgooaTI932W9r0uf6l/ANnbBG0oDLEZVoVYYT2SFTXbwShIN
 UOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683182050; x=1685774050;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OHCwM54cF9BEFTWJALMzqBlcY59FLmcgLPg49DT67Ms=;
 b=E64iD2P2ScQojrp+T7WQk/Difu/IweODfA+8ojL+9LTUQSHqcRngs6J/dStuBzOm9Q
 DMZfhi5GKksEBInL5bcSWtIu5TBWYmYe4XnqlXJVBhb/qAnW4b1p8GwV/Ubt891qhT3I
 sJRUEl3a75V1ISd+Pn2Ye58EJkDFK/nudReFLxGPZSJeGoGybJpABe4ShLI0npE3b7nS
 dXiWUgDDdCuI6okwMUirX+zbUQ7elah/9kkN5SoJIObyO3GnmyFX3X0yZ2+utLSUtYH/
 cy0tCShiccLEsdh7BxSe+NEKWYt05OFmSEz6O7LAJTXeDsTtBJEgpGv9DBjCOhG1VJdx
 YewA==
X-Gm-Message-State: AC+VfDxD4gts55mUvTJdajkqrEK+pnyDopMkZIlMHzcOySWTjMBExsIV
 /fLVGtCwQtR26s5fmTIumvqnRg==
X-Google-Smtp-Source: ACHHUZ7WpwdFgSHHI/5Zxd1T2pj6MJ+cqkI/N3LHRUu275rwvfXtKSimgykZMaVXYHagcbF6MtLeeg==
X-Received: by 2002:ac2:4468:0:b0:4dc:82b0:4c68 with SMTP id
 y8-20020ac24468000000b004dc82b04c68mr1281911lfl.50.1683182049339; 
 Wed, 03 May 2023 23:34:09 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 u24-20020ac25198000000b004eca2b1c5b4sm6379788lfi.229.2023.05.03.23.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 23:34:08 -0700 (PDT)
Message-ID: <8fc74f8e-726b-501c-6800-0bd515d4181a@linaro.org>
Date: Thu, 4 May 2023 08:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 06/15] drm/msm/a6xx: Introduce GMU wrapper support
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
 <20230223-topic-gmuwrapper-v6-6-2034115bb60c@linaro.org>
 <20230502074956.GA21869@akhilpo-linux.qualcomm.com>
 <d2374464-82e6-78c3-9c5e-f4e509c86d83@linaro.org>
 <20230503203236.GA1177@akhilpo-linux.qualcomm.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230503203236.GA1177@akhilpo-linux.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3.05.2023 22:32, Akhil P Oommen wrote:
> On Tue, May 02, 2023 at 11:40:26AM +0200, Konrad Dybcio wrote:
>>
>>
>> On 2.05.2023 09:49, Akhil P Oommen wrote:
>>> On Sat, Apr 01, 2023 at 01:54:43PM +0200, Konrad Dybcio wrote:
>>>> Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
>>>> but don't implement the associated GMUs. This is due to the fact that
>>>> the GMU directly pokes at RPMh. Sadly, this means we have to take care
>>>> of enabling & scaling power rails, clocks and bandwidth ourselves.
>>>>
>>>> Reuse existing Adreno-common code and modify the deeply-GMU-infused
>>>> A6XX code to facilitate these GPUs. This involves if-ing out lots
>>>> of GMU callbacks and introducing a new type of GMU - GMU wrapper (it's
>>>> the actual name that Qualcomm uses in their downstream kernels).
>>>>
>>>> This is essentially a register region which is convenient to model
>>>> as a device. We'll use it for managing the GDSCs. The register
>>>> layout matches the actual GMU_CX/GX regions on the "real GMU" devices
>>>> and lets us reuse quite a bit of gmu_read/write/rmw calls.
>>> << I sent a reply to this patch earlier, but not sure where it went.
>>> Still figuring out Mutt... >>
>> Answered it here:
>>
>> https://lore.kernel.org/linux-arm-msm/4d3000c1-c3f9-0bfd-3eb3-23393f9a8f77@linaro.org/
> 
> Thanks. Will check and respond there if needed.
> 
>>
>> I don't think I see any new comments in this "reply revision" (heh), so please
>> check that one out.
>>
>>>
>>> Only convenience I found is that we can reuse gmu register ops in a few
>>> places (< 10 I think). If we just model this as another gpu memory
>>> region, I think it will help to keep gmu vs gmu-wrapper/no-gmu
>>> architecture code with clean separation. Also, it looks like we need to
>>> keep a dummy gmu platform device in the devicetree with the current
>>> approach. That doesn't sound right.
>> That's correct, but.. if we switch away from that, VDD_GX/VDD_CX will
>> need additional, gmuwrapper-configuration specific code anyway, as
>> OPP & genpd will no longer make use of the default behavior which
>> only gets triggered if there's a single power-domains=<> entry, afaicu.
> Can you please tell me which specific *default behviour* do you mean here?
> I am curious to know what I am overlooking here. We can always get a cxpd/gxpd device
> and vote for the gdscs directly from the driver. Anything related to
> OPP?
I *believe* this is true:

if (ARRAY_SIZE(power-domains) == 1) {
	of generic code will enable the power domain at .probe time

	opp APIs will default to scaling that domain with required-opps
}

and we do need to put GX/CX (with an MX parent to match) there, as the
AP is responsible for voting in this configuration

Konrad
> 
> -Akhil
>>
>> If nothing else, this is a very convenient way to model a part of the
>> GPU (as that's essentially what GMU_CX is, to my understanding) and
>> the bindings people didn't shoot me in the head for proposing this, so
>> I assume it'd be cool to pursue this..
>>
>> Konrad
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  72 +++++++-
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 255 +++++++++++++++++++++++++---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   8 +-
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
>>>>  6 files changed, 318 insertions(+), 38 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index 87babbb2a19f..b1acdb027205 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -1469,6 +1469,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
>>>>  
>>>>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>>>>  {
>>>> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>  	struct platform_device *pdev = to_platform_device(gmu->dev);
>>>>  
>>>> @@ -1494,10 +1495,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>>>>  	gmu->mmio = NULL;
>>>>  	gmu->rscc = NULL;
>>>>  
>>>> -	a6xx_gmu_memory_free(gmu);
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
>>>> +		a6xx_gmu_memory_free(gmu);
>>>>  
>>>> -	free_irq(gmu->gmu_irq, gmu);
>>>> -	free_irq(gmu->hfi_irq, gmu);
>>>> +		free_irq(gmu->gmu_irq, gmu);
>>>> +		free_irq(gmu->hfi_irq, gmu);
>>>> +	}
>>>>  
>>>>  	/* Drop reference taken in of_find_device_by_node */
>>>>  	put_device(gmu->dev);
>>>> @@ -1516,6 +1519,69 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>>> +{
>>>> +	struct platform_device *pdev = of_find_device_by_node(node);
>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>> +	int ret;
>>>> +
>>>> +	if (!pdev)
>>>> +		return -ENODEV;
>>>> +
>>>> +	gmu->dev = &pdev->dev;
>>>> +
>>>> +	of_dma_configure(gmu->dev, node, true);
>>> why setup dma for a device that is not actually present?
>>>> +
>>>> +	pm_runtime_enable(gmu->dev);
>>>> +
>>>> +	/* Mark legacy for manual SPTPRAC control */
>>>> +	gmu->legacy = true;
>>>> +
>>>> +	/* Map the GMU registers */
>>>> +	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
>>>> +	if (IS_ERR(gmu->mmio)) {
>>>> +		ret = PTR_ERR(gmu->mmio);
>>>> +		goto err_mmio;
>>>> +	}
>>>> +
>>>> +	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
>>>> +	if (IS_ERR(gmu->cxpd)) {
>>>> +		ret = PTR_ERR(gmu->cxpd);
>>>> +		goto err_mmio;
>>>> +	}
>>>> +
>>>> +	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
>>>> +		ret = -ENODEV;
>>>> +		goto detach_cxpd;
>>>> +	}
>>>> +
>>>> +	init_completion(&gmu->pd_gate);
>>>> +	complete_all(&gmu->pd_gate);
>>>> +	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
>>>> +
>>>> +	/* Get a link to the GX power domain to reset the GPU */
>>>> +	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
>>>> +	if (IS_ERR(gmu->gxpd)) {
>>>> +		ret = PTR_ERR(gmu->gxpd);
>>>> +		goto err_mmio;
>>>> +	}
>>>> +
>>>> +	gmu->initialized = true;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +detach_cxpd:
>>>> +	dev_pm_domain_detach(gmu->cxpd, false);
>>>> +
>>>> +err_mmio:
>>>> +	iounmap(gmu->mmio);
>>>> +
>>>> +	/* Drop reference taken in of_find_device_by_node */
>>>> +	put_device(gmu->dev);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>>>  {
>>>>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 931f9f3b3a85..8e0345ffab81 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -20,9 +20,11 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>  
>>>> -	/* Check that the GMU is idle */
>>>> -	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
>>>> -		return false;
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
>>>> +		/* Check that the GMU is idle */
>>>> +		if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
>>>> +			return false;
>>>> +	}
>>>>  
>>>>  	/* Check tha the CX master is idle */
>>>>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS) &
>>>> @@ -612,13 +614,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>>  		return;
>>>>  
>>>>  	/* Disable SP clock before programming HWCG registers */
>>>> -	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
>>>>  
>>>>  	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
>>>>  		gpu_write(gpu, reg->offset, state ? reg->value : 0);
>>>>  
>>>>  	/* Enable SP clock */
>>>> -	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
>>>>  
>>>>  	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
>>>>  }
>>>> @@ -1018,10 +1022,13 @@ static int hw_init(struct msm_gpu *gpu)
>>>>  {
>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>  	int ret;
>>>>  
>>>> -	/* Make sure the GMU keeps the GPU on while we set it up */
>>>> -	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
>>>> +		/* Make sure the GMU keeps the GPU on while we set it up */
>>>> +		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>>>> +	}
>>>>  
>>>>  	/* Clear GBIF halt in case GX domain was not collapsed */
>>>>  	if (a6xx_has_gbif(adreno_gpu))
>>>> @@ -1144,6 +1151,17 @@ static int hw_init(struct msm_gpu *gpu)
>>>>  			0x3f0243f0);
>>>>  	}
>>>>  
>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
>>>> +		/* Do it here, as GMU wrapper only inits the GMU for memory reservation etc. */
>>>> +
>>>> +		/* Set up the CX GMU counter 0 to count busy ticks */
>>>> +		gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
>>>> +
>>>> +		/* Enable power counter 0 */
>>>> +		gmu_rmw(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0, 0xff, BIT(5));
>>>> +		gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
>>>> +	}
>>>> +
>>>>  	/* Protect registers from the CP */
>>>>  	a6xx_set_cp_protect(gpu);
>>>>  
>>>> @@ -1233,6 +1251,8 @@ static int hw_init(struct msm_gpu *gpu)
>>>>  	}
>>>>  
>>>>  out:
>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		return ret;
>>>>  	/*
>>>>  	 * Tell the GMU that we are done touching the GPU and it can start power
>>>>  	 * management
>>>> @@ -1267,6 +1287,9 @@ static void a6xx_dump(struct msm_gpu *gpu)
>>>>  	adreno_dump(gpu);
>>>>  }
>>>>  
>>>> +#define GBIF_GX_HALT_MASK	BIT(0)
>>>> +#define GBIF_CLIENT_HALT_MASK	BIT(0)
>>>> +#define GBIF_ARB_HALT_MASK	BIT(1)
>>>>  #define VBIF_RESET_ACK_TIMEOUT	100
>>>>  #define VBIF_RESET_ACK_MASK	0x00f0
>>>>  
>>>> @@ -1299,7 +1322,8 @@ static void a6xx_recover(struct msm_gpu *gpu)
>>>>  	 * Turn off keep alive that might have been enabled by the hang
>>>>  	 * interrupt
>>>>  	 */
>>>> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>>>
>>> Maybe it is better to move this to a6xx_gmu_force_power_off.
>>>
>>>>  
>>>>  	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
>>>>  
>>>> @@ -1329,6 +1353,32 @@ static void a6xx_recover(struct msm_gpu *gpu)
>>>>  
>>>>  	dev_pm_genpd_remove_notifier(gmu->cxpd);
>>>>  
>>>> +	/* Software-reset the GPU */
>>>
>>> This is not soft reset sequence. We are trying to quiescent gpu - ddr
>>> traffic with this sequence.
>>>
>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
>>>> +		/* Halt the GX side of GBIF */
>>>> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
>>>> +		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
>>>> +			   GBIF_GX_HALT_MASK);
>>>> +
>>>> +		/* Halt new client requests on GBIF */
>>>> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
>>>> +		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
>>>> +			   (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
>>>> +
>>>> +		/* Halt all AXI requests on GBIF */
>>>> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
>>>> +		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
>>>> +			   (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
>>>> +
>>>> +		/* Clear the halts */
>>>> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
>>>> +
>>>> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
>>>> +
>>>> +		/* This *really* needs to go through before we do anything else! */
>>>> +		mb();
>>>> +	}
>>>> +
>>>
>>> This sequence should be before we collapse cx gdsc. Also, please see if
>>> we can create a subroutine to avoid code dup.
>>>
>>>>  	pm_runtime_use_autosuspend(&gpu->pdev->dev);
>>>>  
>>>>  	if (active_submits)
>>>> @@ -1463,7 +1513,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>>>>  	 * Force the GPU to stay on until after we finish
>>>>  	 * collecting information
>>>>  	 */
>>>> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
>>>>  
>>>>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>>>>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
>>>> @@ -1624,7 +1675,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>>>>  		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
>>>>  }
>>>>  
>>>> -static int a6xx_pm_resume(struct msm_gpu *gpu)
>>>> +static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
>>>>  {
>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> @@ -1644,10 +1695,61 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>>>>  
>>>>  	a6xx_llc_activate(a6xx_gpu);
>>>>  
>>>> -	return 0;
>>>> +	return ret;
>>>>  }
>>>>  
>>>> -static int a6xx_pm_suspend(struct msm_gpu *gpu)
>>>> +static int a6xx_pm_resume(struct msm_gpu *gpu)
>>>> +{
>>>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>> +	unsigned long freq = 0;
>>>> +	struct dev_pm_opp *opp;
>>>> +	int ret;
>>>> +
>>>> +	gpu->needs_hw_init = true;
>>>> +
>>>> +	trace_msm_gpu_resume(0);
>>>> +
>>>> +	mutex_lock(&a6xx_gpu->gmu.lock);
>>> I think we can ignore gmu lock as there is no real gmu device.
>>>
>>>> +
>>>> +	pm_runtime_resume_and_get(gmu->dev);
>>>> +	pm_runtime_resume_and_get(gmu->gxpd);
>>>> +
>>>> +	/* Set the core clock, having VDD scaling in mind */
>>>> +	ret = dev_pm_opp_set_rate(&gpu->pdev->dev, gpu->fast_rate);
>>>> +	if (ret)
>>>> +		goto err_core_clk;
>>>> +
>>>> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
>>>> +	if (ret)
>>>> +		goto err_bulk_clk;
>>>> +
>>>> +	ret = clk_prepare_enable(gpu->ebi1_clk);
>>>> +	if (ret)
>>>> +		goto err_mem_clk;
>>>> +
>>>> +	/* If anything goes south, tear the GPU down piece by piece.. */
>>>> +	if (ret) {
>>>> +err_mem_clk:
>>>> +		clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
>>>> +err_bulk_clk:
>>>> +		opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
>>>> +		dev_pm_opp_put(opp);
>>>> +		dev_pm_opp_set_rate(&gpu->pdev->dev, 0);
>>>> +err_core_clk:
>>>> +		pm_runtime_put(gmu->gxpd);
>>>> +		pm_runtime_put(gmu->dev);
>>>> +	}
>>>> +	mutex_unlock(&a6xx_gpu->gmu.lock);
>>>> +
>>>> +	if (!ret)
>>>> +		msm_devfreq_resume(gpu);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
>>>>  {
>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> @@ -1674,11 +1776,62 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int a6xx_pm_suspend(struct msm_gpu *gpu)
>>>> +{
>>>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>> +	unsigned long freq = 0;
>>>> +	struct dev_pm_opp *opp;
>>>> +	int i, ret;
>>>> +
>>>> +	trace_msm_gpu_suspend(0);
>>>> +
>>>> +	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
>>>> +	dev_pm_opp_put(opp);
>>>> +
>>>> +	msm_devfreq_suspend(gpu);
>>>> +
>>>> +	mutex_lock(&a6xx_gpu->gmu.lock);
>>>> +
>>>> +	clk_disable_unprepare(gpu->ebi1_clk);
>>>> +
>>>> +	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
>>>> +
>>>> +	/* Set frequency to the minimum supported level (no 27MHz on A6xx!) */
>>>> +	ret = dev_pm_opp_set_rate(&gpu->pdev->dev, freq);
>>>> +	if (ret)
>>>> +		goto err;
>>>> +
>>>> +	pm_runtime_put_sync(gmu->gxpd);
>>>> +	pm_runtime_put_sync(gmu->dev);
>>>> +
>>>> +	mutex_unlock(&a6xx_gpu->gmu.lock);
>>>> +
>>>> +	if (a6xx_gpu->shadow_bo)
>>>> +		for (i = 0; i < gpu->nr_rings; i++)
>>>> +			a6xx_gpu->shadow[i] = 0;
>>>> +
>>>> +	gpu->suspend_count++;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err:
>>>> +	mutex_unlock(&a6xx_gpu->gmu.lock);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>  static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>>>  {
>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>  
>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
>>>> +		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
>>>> +		return 0;
>>>> +	}
>>>> +
>>> Instead of wrapper check here, we can just create a separate op. I don't
>>> see any benefit in reusing the same function here.
>>>
>>>
>>>>  	mutex_lock(&a6xx_gpu->gmu.lock);
>>>>  
>>>>  	/* Force the GPU power on so we can read this register */
>>>> @@ -1716,7 +1869,8 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>>>>  		drm_gem_object_put(a6xx_gpu->shadow_bo);
>>>>  	}
>>>>  
>>>> -	a6xx_llc_slices_destroy(a6xx_gpu);
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		a6xx_llc_slices_destroy(a6xx_gpu);
>>>>  
>>>>  	mutex_lock(&a6xx_gpu->gmu.lock);
>>>>  	a6xx_gmu_remove(a6xx_gpu);
>>>> @@ -1957,8 +2111,8 @@ static const struct adreno_gpu_funcs funcs = {
>>>>  		.set_param = adreno_set_param,
>>>>  		.hw_init = a6xx_hw_init,
>>>>  		.ucode_load = a6xx_ucode_load,
>>>> -		.pm_suspend = a6xx_pm_suspend,
>>>> -		.pm_resume = a6xx_pm_resume,
>>>> +		.pm_suspend = a6xx_gmu_pm_suspend,
>>>> +		.pm_resume = a6xx_gmu_pm_resume,
>>>>  		.recover = a6xx_recover,
>>>>  		.submit = a6xx_submit,
>>>>  		.active_ring = a6xx_active_ring,
>>>> @@ -1982,6 +2136,35 @@ static const struct adreno_gpu_funcs funcs = {
>>>>  	.get_timestamp = a6xx_get_timestamp,
>>>>  };
>>>>  
>>>> +static const struct adreno_gpu_funcs funcs_gmuwrapper = {
>>>> +	.base = {
>>>> +		.get_param = adreno_get_param,
>>>> +		.set_param = adreno_set_param,
>>>> +		.hw_init = a6xx_hw_init,
>>>> +		.ucode_load = a6xx_ucode_load,
>>>> +		.pm_suspend = a6xx_pm_suspend,
>>>> +		.pm_resume = a6xx_pm_resume,
>>>> +		.recover = a6xx_recover,
>>>> +		.submit = a6xx_submit,
>>>> +		.active_ring = a6xx_active_ring,
>>>> +		.irq = a6xx_irq,
>>>> +		.destroy = a6xx_destroy,
>>>> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
>>>> +		.show = a6xx_show,
>>>> +#endif
>>>> +		.gpu_busy = a6xx_gpu_busy,
>>>> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
>>>> +		.gpu_state_get = a6xx_gpu_state_get,
>>>> +		.gpu_state_put = a6xx_gpu_state_put,
>>>> +#endif
>>>> +		.create_address_space = a6xx_create_address_space,
>>>> +		.create_private_address_space = a6xx_create_private_address_space,
>>>> +		.get_rptr = a6xx_get_rptr,
>>>> +		.progress = a6xx_progress,
>>>> +	},
>>>> +	.get_timestamp = a6xx_get_timestamp,
>>>> +};
>>>> +
>>>>  struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>>  {
>>>>  	struct msm_drm_private *priv = dev->dev_private;
>>>> @@ -2003,18 +2186,36 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>>  
>>>>  	adreno_gpu->registers = NULL;
>>>>  
>>>> +	/* Check if there is a GMU phandle and set it up */
>>>> +	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>>> +	/* FIXME: How do we gracefully handle this? */
>>>> +	BUG_ON(!node);
>>> How will you handle this BUG() when there is no GMU (a610 gpu)?
>>>
>>>> +
>>>> +	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
>>>> +
>>>>  	/*
>>>>  	 * We need to know the platform type before calling into adreno_gpu_init
>>>>  	 * so that the hw_apriv flag can be correctly set. Snoop into the info
>>>>  	 * and grab the revision number
>>>>  	 */
>>>>  	info = adreno_info(config->rev);
>>>> -
>>>> -	if (info && (info->revn == 650 || info->revn == 660 ||
>>>> -			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
>>>> +	if (!info)
>>>> +		return ERR_PTR(-EINVAL);
>>>> +
>>>> +	/* Assign these early so that we can use the is_aXYZ helpers */
>>>> +	/* Numeric revision IDs (e.g. 630) */
>>>> +	adreno_gpu->revn = info->revn;
>>>> +	/* New-style ADRENO_REV()-only */
>>>> +	adreno_gpu->rev = info->rev;
>>>> +	/* Quirk data */
>>>> +	adreno_gpu->info = info;
>>>> +
>>>> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
>>>>  		adreno_gpu->base.hw_apriv = true;
>>>>  
>>>> -	a6xx_llc_slices_init(pdev, a6xx_gpu);
>>>> +	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		a6xx_llc_slices_init(pdev, a6xx_gpu);
>>>>  
>>>>  	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
>>>>  	if (ret) {
>>>> @@ -2022,7 +2223,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>>  		return ERR_PTR(ret);
>>>>  	}
>>>>  
>>>> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
>>>> +	else
>>>> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
>>>>  	if (ret) {
>>>>  		a6xx_destroy(&(a6xx_gpu->base.base));
>>>>  		return ERR_PTR(ret);
>>>> @@ -2035,13 +2239,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>>  	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>>>>  		priv->gpu_clamp_to_idle = true;
>>>>  
>>>> -	/* Check if there is a GMU phandle and set it up */
>>>> -	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>>> -
>>>> -	/* FIXME: How do we gracefully handle this? */
>>>> -	BUG_ON(!node);
>>>> -
>>>> -	ret = a6xx_gmu_init(a6xx_gpu, node);
>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>>>> +		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>>>> +	else
>>>> +		ret = a6xx_gmu_init(a6xx_gpu, node);
>>>>  	of_node_put(node);
>>>>  	if (ret) {
>>>>  		a6xx_destroy(&(a6xx_gpu->base.base));
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> index eea2e60ce3b7..51a7656072fa 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> @@ -76,6 +76,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>>>>  void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>>>>  
>>>>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>>>> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>>>>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>>>>  
>>>>  void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>>> index 30ecdff363e7..4e5d650578c6 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>>> @@ -1041,16 +1041,18 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>>>>  	/* Get the generic state from the adreno core */
>>>>  	adreno_gpu_state_get(gpu, &a6xx_state->base);
>>>>  
>>>> -	a6xx_get_gmu_registers(gpu, a6xx_state);
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
>>> nit: Kinda misleading function name to a layman. Should we invert the
>>> function to "adreno_has_gmu"?
>>>
>>> -Akhil
>>>> +		a6xx_get_gmu_registers(gpu, a6xx_state);
>>>>  
>>>> -	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
>>>> -	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
>>>> -	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
>>>> +		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
>>>> +		a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
>>>> +		a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
>>>>  
>>>> -	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
>>>> +		a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
>>>> +	}
>>>>  
>>>>  	/* If GX isn't on the rest of the data isn't going to be accessible */
>>>> -	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>>>>  		return &a6xx_state->base;
>>>>  
>>>>  	/* Get the banks of indexed registers */
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index 6934cee07d42..5c5901d65950 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -528,6 +528,10 @@ int adreno_load_fw(struct adreno_gpu *adreno_gpu)
>>>>  		if (!adreno_gpu->info->fw[i])
>>>>  			continue;
>>>>  
>>>> +		/* Skip loading GMU firwmare with GMU Wrapper */
>>>> +		if (adreno_has_gmu_wrapper(adreno_gpu) && i == ADRENO_FW_GMU)
>>>> +			continue;
>>>> +
>>>>  		/* Skip if the firmware has already been loaded */
>>>>  		if (adreno_gpu->fw[i])
>>>>  			continue;
>>>> @@ -1074,8 +1078,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>  	u32 speedbin;
>>>>  	int ret;
>>>>  
>>>> -	/* Only handle the core clock when GMU is not in use */
>>>> -	if (config->rev.core < 6) {
>>>> +	/* Only handle the core clock when GMU is not in use (or is absent). */
>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
>>>>  		/*
>>>>  		 * This can only be done before devm_pm_opp_of_add_table(), or
>>>>  		 * dev_pm_opp_set_config() will WARN_ON()
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> index f62612a5c70f..ee5352bc5329 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> @@ -115,6 +115,7 @@ struct adreno_gpu {
>>>>  	 * code (a3xx_gpu.c) and stored in this common location.
>>>>  	 */
>>>>  	const unsigned int *reg_offsets;
>>>> +	bool gmu_is_wrapper;
>>>>  };
>>>>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>>>>  
>>>> @@ -145,6 +146,11 @@ struct adreno_platform_config {
>>>>  
>>>>  bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>>>>  
>>>> +static inline bool adreno_has_gmu_wrapper(struct adreno_gpu *gpu)
>>>> +{
>>>> +	return gpu->gmu_is_wrapper;
>>>> +}
>>>> +
>>>>  static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
>>>>  {
>>>>  	return (gpu->revn < 300);
>>>>
>>>> -- 
>>>> 2.40.0
>>>>

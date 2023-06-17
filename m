Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F9733D1B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 02:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053C410E6AD;
	Sat, 17 Jun 2023 00:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F79110E6AD
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 00:00:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f8467e39cfso1843550e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 17:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686960053; x=1689552053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W3KWVeHmsHPIaRZA6DLr0joW7Ttav+PaqmaoaMCes3k=;
 b=Fr0YFsTnFYpZr2E6woSTSacK+xGPXui0A8DNyQZGfB51pPpU1dv679Yqiik1+Mp2ms
 AknaszaOVklCNwMrU3js2EURxkTM6x3XvCay9wVJh17pDhMr0WttgAphHJBYmiquCzbr
 0OpF9rVsG/V4aakdyotWQiNqgrmdEMtmAqHhm+bjis4Jl1X1gj9t2rnk93JRJStkXN7i
 FWJeoiTrW0VAIZz8aw2O2/NaT8rluHZd6+slkgvjSI80tkXwBtVSFdwztdLHrhls+URp
 QBvL4+SgkHUXHcYyzdGB4bLGNB5WJoj8wpR4fiMgWJ12xIPob+sKMoTTRSwkoOXJOxmU
 RhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686960053; x=1689552053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W3KWVeHmsHPIaRZA6DLr0joW7Ttav+PaqmaoaMCes3k=;
 b=kuo5NTiHWWUlGYBDuQf7KMjOKrr/H9aEDQDZdDRzINZaJgfRSW1dS3XFZFouati/rI
 qyPz76tO7RHLjiPFoRjlC4otQ/Cn6ZqnpxRNJAI6Tz706owuZAoi7DpIJ5YpcxQ/tpP9
 aEoA6wvHxgkMctqJ3Vh+DfmPAxVmmZpjPzrrtNsjTERtSFep2MSzJ9wcMA/b51hSW02K
 jpl3GEmctr0c03htDMIioGszGieJ6rJav/9UxgvPJmUa+eiyje33vSqnVk7h8/wgGk1i
 AwCh7Gmbo/APFRjgH2jjFuz3OVjmzk1b34MXOXefLPscQbhH7vcTURnfKEq3M3z6YTiP
 Jk/A==
X-Gm-Message-State: AC+VfDwpQq3ZHBPhhFE76Nbn1OdwBAABXo7ToxrSZFMqqMM+h2rq95if
 fHbYjOc2ESFlQRjKc62VZGDxJA==
X-Google-Smtp-Source: ACHHUZ6VIkLSjzCxdHpJRh/DtsIbyfdxALlas9PDHHZfTsJPGHvn+jB/qypqfMhEsiVOUWjQZj9N8g==
X-Received: by 2002:a05:6512:290:b0:4f6:1504:f93c with SMTP id
 j16-20020a056512029000b004f61504f93cmr2518520lfp.66.1686960052552; 
 Fri, 16 Jun 2023 17:00:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 t12-20020ac2548c000000b004f60e0ecc78sm3202487lfk.239.2023.06.16.17.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 17:00:52 -0700 (PDT)
Message-ID: <68e64a35-9705-6565-3b5c-5de38419aba8@linaro.org>
Date: Sat, 17 Jun 2023 02:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [Freedreno] [PATCH v8 10/18] drm/msm/a6xx: Introduce GMU wrapper
 support
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-10-69c68206609e@linaro.org>
 <2vr72w4tslxxumzphtuwgkcnbfjrtmw2j4qak2cukcabchadlg@spjbqoa7v4lr>
 <c5396101-ad5b-afdd-d6d7-1a2efa3b9bf7@linaro.org>
 <z5imqaxyumc5pyk4ijumjby4tswfmnjsnedeekonx5tymhwsfi@h5dk3pl2zawf>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <z5imqaxyumc5pyk4ijumjby4tswfmnjsnedeekonx5tymhwsfi@h5dk3pl2zawf>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.06.2023 19:54, Akhil P Oommen wrote:
> On Thu, Jun 15, 2023 at 11:43:04PM +0200, Konrad Dybcio wrote:
>>
>> On 10.06.2023 00:06, Akhil P Oommen wrote:
>>> On Mon, May 29, 2023 at 03:52:29PM +0200, Konrad Dybcio wrote:
>>>>
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
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
[...]

>>>> +
>>>> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
>>>> +	if (ret)
>>>> +		goto err_bulk_clk;
>>>> +
>>>> +	/* If anything goes south, tear the GPU down piece by piece.. */
>>>> +	if (ret) {
>>>> +err_bulk_clk:
>>>
>>> Goto jump directly to another block looks odd to me. Why do you need this label
>>> anyway?
>> If clk_bulk_prepare_enable() fails, trying to proceed will hang the
>> platform with unclocked accesses. We need to unwind everything that
>> has been done up until that point, in reverse order.
> 
> I missed this response from you earlier.
> 
> But you are checking for 'ret' twice here. You will end up here even
> if you don't jump! So "if (ret) goto err_bulk_clk;" looks
> unnecessary.
> 
> -Akhil.
Ohhh right, silly mistake on my part ;)

I already sent out a v9 since.. Please check it out and if you
have any further comments, I'll fix this, and if not.. Perhaps I
could fix it in an incremental patch if that revision is gtg?

Konrad
> 
>>
>>>
>>>> +		pm_runtime_put(gmu->gxpd);
>>>> +		pm_runtime_put(gmu->dev);
>>>> +		dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
>>>> +	}
>>>> +err_set_opp:
>>>
>>> Generally, it is better to name the label based on what you do here. For
>>> eg: "unlock_lock:".
>> That seems to be a mixed bag all throughout the kernel, I've seen many
>> usages of err_(what went wrong)
>>
>>>
>>> Also, this function is small enough that it is better to return directly
>>> in case of error. I think that would be more readable.
>> Not really, adding the necessary cleanup steps in `if (ret)`
>> blocks would roughly double the function's size.
>>
>>>
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
>>>> @@ -1720,7 +1799,40 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>>> +static int a6xx_pm_suspend(struct msm_gpu *gpu)
>>>> +{
>>>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>> +	int i;
>>>> +
>>>> +	trace_msm_gpu_suspend(0);
>>>> +
>>>> +	msm_devfreq_suspend(gpu);
>>>> +
>>>> +	mutex_lock(&a6xx_gpu->gmu.lock);
>>>
>>> Again, is this initialized somewhere?
>>>
>>>> +
>>>> +	/* Drain the outstanding traffic on memory buses */
>>>> +	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
>>>> +
>>>> +	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
>>>> +
>>>> +	pm_runtime_put_sync(gmu->gxpd);
>>>> +	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
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
>>>> +}
>>>> +
>>>> +static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>>>  {
>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> @@ -1739,6 +1851,12 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>>> +{
>>>> +	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
>>>>  {
>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> @@ -2004,8 +2122,8 @@ static const struct adreno_gpu_funcs funcs = {
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
>>>> @@ -2020,6 +2138,35 @@ static const struct adreno_gpu_funcs funcs = {
>>>>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>>>>  		.gpu_state_get = a6xx_gpu_state_get,
>>>>  		.gpu_state_put = a6xx_gpu_state_put,
>>>> +#endif
>>>> +		.create_address_space = a6xx_create_address_space,
>>>> +		.create_private_address_space = a6xx_create_private_address_space,
>>>> +		.get_rptr = a6xx_get_rptr,
>>>> +		.progress = a6xx_progress,
>>>> +	},
>>>> +	.get_timestamp = a6xx_gmu_get_timestamp,
>>>> +};
>>>> +
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
>>>>  #endif
>>>>  		.create_address_space = a6xx_create_address_space,
>>>>  		.create_private_address_space = a6xx_create_private_address_space,
>>>> @@ -2050,15 +2197,31 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>>  
>>>>  	adreno_gpu->registers = NULL;
>>>>  
>>>> +	/* Check if there is a GMU phandle and set it up */
>>>> +	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>>> +	/* FIXME: How do we gracefully handle this? */
>>>> +	BUG_ON(!node);
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
>>>>  	a6xx_llc_slices_init(pdev, a6xx_gpu);
>>>> @@ -2069,7 +2232,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
>>>> @@ -2082,13 +2248,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
>>>> index aa70390ee1c6..c788b06e72da 100644
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
>>>> +		a6xx_get_gmu_registers(gpu, a6xx_state);
>>>>  
>>>> -	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
>>>> -	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
>>>> -	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
>>>> +		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
>>>> +		a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
>>>> +		a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
>>>>  /
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
>>>> 2.40.1
>>>>
>>>
>>> I am still not fully onboard with the idea of gmu_wrapper node in devicetree.
>>> Aside from that, I don't see any other issue. Please check the few comments I left.
>> Thanks for your review!
>>
>> Konrad
>>>
>>> -Akhil.
>>>

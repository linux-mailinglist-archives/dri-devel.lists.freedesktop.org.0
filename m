Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FE973213B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3966310E54A;
	Thu, 15 Jun 2023 20:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA98910E54A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:59:27 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f76a4c211dso3111277e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686862765; x=1689454765;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=niAlZljWXW/H63Y0SMOkpmVWJA4JXQOx/GZYVfHqRhM=;
 b=IZAfsnAPCywJPU6vGov8IiuC6/OwaScJ9/lcwgZmfIQ+t81KTiG8qIrf4Q9J7ow31a
 e0/BFZWJP4J1T5ji4OH0hSYdtWRyQls3po7+NhWcz4xvyi2YiVoG4Bion7fMqLczexeE
 ggZ9o0NHQdd3oltkh5+eoV8OM4Y1YAaYUpslFx4qZEbmD3pTEjp24Oe0FC/7Dv0pblL3
 lIX/ZO5eIxg7cHAp8QHOXm49JYcRqb8iSFLsnw7nm0v7XbE/qbJ97zdoMqPAowpz9f3U
 TfgSxGaXXkY5OzOKfevkEBnWgvh3lTDbYP35Fzg9i9vLq7hX1lvXYLO8EAmWKhUcteOC
 zWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686862765; x=1689454765;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=niAlZljWXW/H63Y0SMOkpmVWJA4JXQOx/GZYVfHqRhM=;
 b=aZCC+rkhnq8LuOwhKi/hzPKrFg1a4/AZKKGIiZQ6BS3Qz/gzqsjC8ZVheJ3vIXJXP6
 nQgu0ybT2DBixQGSOI9sGu5bWOAg4euYiKKoViiBBtqXIjl1xtrcecopUtD7UL0ayYBC
 d+Z5Su7QHXeKH8CBmOSpPoZFdgjaShHrk+bRMdISTdoxkT+vqCWjZZftJO1wsh3RhK1M
 f8LbTG3t0+2UP5PCne8nEBooCE1OIE1eSl+i8Jst8SKIpyVWS3A+zNvmXhIKHeZi93Xb
 eMBEHI5zmp0V+POapvM9GXYlxMjgGUlVHufFDyu9jzNWx1WMnHWgoiNxN/Ugaptiqr4u
 tFHA==
X-Gm-Message-State: AC+VfDxehSigKXTqu+2wOIUV2ePfZSYIhX8s54M5Agid6/bXpLdW4zK+
 5GhrjSIi9FRdxwFmnroR854Gig==
X-Google-Smtp-Source: ACHHUZ5iut2/IQev9V/2oWiVW8z3ctcktYp59vG5CrqEkxtz2aEQV7PRsrNmDdJcBnuil92PLjjKQQ==
X-Received: by 2002:a19:d611:0:b0:4f7:434b:70b4 with SMTP id
 n17-20020a19d611000000b004f7434b70b4mr7568688lfg.41.1686862765535; 
 Thu, 15 Jun 2023 13:59:25 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac244ba000000b004ec8b638115sm2700798lfm.193.2023.06.15.13.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 13:59:25 -0700 (PDT)
Message-ID: <e0141f93-b3d8-cc3e-7b2d-32618351ba10@linaro.org>
Date: Thu, 15 Jun 2023 22:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 07/18] drm/msm/a6xx: Add a helper for
 software-resetting the GPU
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-7-69c68206609e@linaro.org>
 <jplt5g5xuphbnci73pdtaxd63fguxtgtp4c37kc7ehavzrjbau@kamshezxnvgy>
 <001d7571-5e9f-4f60-f6d0-35806a3e51c5@linaro.org>
 <rd4mte26n22xlgx5umerpgr66b4wfi7mdm6ovszafyinrg3q4c@g227oj3nh2vc>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <rd4mte26n22xlgx5umerpgr66b4wfi7mdm6ovszafyinrg3q4c@g227oj3nh2vc>
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
 Conor Dooley <conor+dt@kernel.org>,
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

On 15.06.2023 22:11, Akhil P Oommen wrote:
> On Thu, Jun 15, 2023 at 12:34:06PM +0200, Konrad Dybcio wrote:
>>
>> On 6.06.2023 19:18, Akhil P Oommen wrote:
>>> On Mon, May 29, 2023 at 03:52:26PM +0200, Konrad Dybcio wrote:
>>>>
>>>> Introduce a6xx_gpu_sw_reset() in preparation for adding GMU wrapper
>>>> GPUs and reuse it in a6xx_gmu_force_off().
>>>>
>>>> This helper, contrary to the original usage in GMU code paths, adds
>>>> a write memory barrier which together with the necessary delay should
>>>> ensure that the reset is never deasserted too quickly due to e.g. OoO
>>>> execution going crazy.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +--
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
>>>>  3 files changed, 13 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index b86be123ecd0..5ba8cba69383 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -899,8 +899,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
>>>>  	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
>>>>  
>>>>  	/* Reset GPU core blocks */
>>>> -	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
>>>> -	udelay(100);
>>>> +	a6xx_gpu_sw_reset(gpu, true);
>>>>  }
>>>>  
>>>>  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index e3ac3f045665..083ccb5bcb4e 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -1634,6 +1634,17 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
>>>>  	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
>>>>  }
>>>>  
>>>> +void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
>>>> +{
>>>> +	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
>>>> +	/* Add a barrier to avoid bad surprises */
>>> Can you please make this comment a bit more clear? Highlight that we
>>> should ensure the register is posted at hw before polling.
>>>
>>> I think this barrier is required only during assert.
>> Generally it should not be strictly required at all, but I'm thinking
>> that it'd be good to keep it in both cases, so that:
>>
>> if (assert)
>> 	we don't keep writing things to the GPU if it's in reset
>> else
>> 	we don't start writing things to the GPU becomes it comes
>> 	out of reset
>>
>> Also, if you squint hard enough at the commit message, you'll notice
>> I intended for this so only be a wmb, but for some reason generalized
>> it.. Perhaps that's another thing I should fix!
>> for v9..
> 
> wmb() doesn't provide any ordering guarantee with the delay loop.
Hm, fair.. I'm still not as fluent with memory access knowledge as I'd
like to be..

> A common practice is to just read back the same register before
> the loop because a readl followed by delay() is guaranteed to be ordered.
So, how should I proceed? Keep the r/w barrier, or add a readback and
a tiiiny (perhaps even using ndelay instead of udelay?) delay on de-assert?

Konrad
> 
> -Akhil.
>>
>> Konrad
>>>
>>> -Akhil.
>>>> +	mb();
>>>> +
>>>> +	/* The reset line needs to be asserted for at least 100 us */
>>>> +	if (assert)
>>>> +		udelay(100);
>>>> +}
>>>> +
>>>>  static int a6xx_pm_resume(struct msm_gpu *gpu)
>>>>  {
>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> index 9580def06d45..aa70390ee1c6 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>> @@ -89,5 +89,6 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
>>>>  int a6xx_gpu_state_put(struct msm_gpu_state *state);
>>>>  
>>>>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
>>>> +void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
>>>>  
>>>>  #endif /* __A6XX_GPU_H__ */
>>>>
>>>> -- 
>>>> 2.40.1
>>>>

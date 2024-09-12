Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AD0976744
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 13:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6868810EB2B;
	Thu, 12 Sep 2024 11:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T3W3fFaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D101110EB2B;
 Thu, 12 Sep 2024 11:15:39 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso116437866b.1; 
 Thu, 12 Sep 2024 04:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726139738; x=1726744538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+4S6glc4Oo1QgS1kNnp0+BV6au00fwd4yWgTCcyo2DY=;
 b=T3W3fFaSbXUTQzycDt0+YRl5usL2kJp6fSMENFpMyGnxwc0aB6udywCaNEKL3L0VCn
 Vz/S9C+6GoH2CBAoiGLnE7VBAWPUTQul22x+6dp8Gbkf7NmAbkia9QNpOJpI7swVD+iE
 Efs75zvGSOgH9ysAMLyOSh0Up95IIM3LxPfriK1+FILUWqW2VFW8OvurFbyAWpLE5aXP
 e7TZIT2bYdP0e/4Gwz4Rc4NBpG56gBvpFq910CplZLvRKudiylvBtof6OY0EtrJX3B+V
 r41uym9BTKfyD/2k7DCA5//QZC2HYIcdQGgs4vD/f5+1wWpahX3LF4ahRcS7z4wUWnhq
 5lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726139738; x=1726744538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+4S6glc4Oo1QgS1kNnp0+BV6au00fwd4yWgTCcyo2DY=;
 b=sxzhnlfZMyIgkhgBT1r9rEQ6T2OUW7nfqyi3/DKVZMUTevbtvWxj5dXn6N9x0MtQlV
 zEvw1jMDaxx20mVcw5bmOHU9P3NnnScEn1w87PWmBzECE/L9V+GHNr/nDPdm1H6lAi12
 PKXTJfmSnWProtuka9kPfbbCroZdITI72jMDJG4JRgM4EZWqXUH2DyN0ZgLT2f2Oaf3N
 ETpjbADzzEolMgDBaVtcinlU1FiLj8MFMH0JGWS1lWez18bXChZTNYcU8Oj+WzwFdSTI
 hvCDhif0aruVFlprLTmQOx6DzrUE+BnMelIoFh92UqznZl8S73RZVCM5UVoGBLmH3BuV
 LWwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAMbPUVhLctnvWrqTJGTd3+60phgxVbtHx9Kj3jXW1+dMNvRKwBhMgsADmowYMZ3gVroyAqJNkG5Y=@lists.freedesktop.org,
 AJvYcCVeTvX96A750Isp9eFgAEvvTOTgwGBdD+OOrGuUdfQBR7e06t9YrnrkYFeytmJAXrNJXAhSlDjVNODq@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl9UoUBRumrEkAKq+isBlUk0j1Yy5QMMwM8blM2yZMvUx9fJ55
 BgbEwf8yeHGPSxEgK9jVa6TUIBbJCBK2aywheUQ4WbXT4IuCODaE
X-Google-Smtp-Source: AGHT+IGkGCSxpk0LKAatd+cPpkKSDrM50h5JJoqpXNZ1v5+cvzLmxSTsmgPFoentcNzIjGcrVQc0pQ==
X-Received: by 2002:a17:907:948c:b0:a71:ddb8:9394 with SMTP id
 a640c23a62f3a-a902961794emr235436766b.40.1726139737206; 
 Thu, 12 Sep 2024 04:15:37 -0700 (PDT)
Received: from [192.168.1.17] (host-87-20-168-161.retail.telecomitalia.it.
 [87.20.168.161]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835d16sm725470066b.36.2024.09.12.04.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 04:15:36 -0700 (PDT)
Message-ID: <4df30c9e-8604-42aa-bf48-c8bb508429ad@gmail.com>
Date: Thu, 12 Sep 2024 13:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/msm/A6xx: Use posamble to reset counters on
 preemption
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-6-fd947699f7bc@gmail.com>
 <20240906200847.ajcrpikzl65fwbjz@hu-akhilpo-hyd.qualcomm.com>
 <69efbf90-7ce1-429f-bf3a-d19acd7d649d@gmail.com>
 <20240910213412.xfw6abex5aqp7b66@hu-akhilpo-hyd.qualcomm.com>
 <39d9e3bf-ad37-43f0-a7d9-edbfdedede8e@gmail.com>
 <20240912071235.cuhe6nhd6gufsmpm@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240912071235.cuhe6nhd6gufsmpm@hu-akhilpo-hyd.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/12/24 9:12 AM, Akhil P Oommen wrote:
> On Wed, Sep 11, 2024 at 12:35:08AM +0200, Antonino Maniscalco wrote:
>> On 9/10/24 11:34 PM, Akhil P Oommen wrote:
>>> On Mon, Sep 09, 2024 at 05:07:42PM +0200, Antonino Maniscalco wrote:
>>>> On 9/6/24 10:08 PM, Akhil P Oommen wrote:
>>>>> On Thu, Sep 05, 2024 at 04:51:24PM +0200, Antonino Maniscalco wrote:
>>>>>> Use the postamble to reset perf counters when switching between rings,
>>>>>> except when sysprof is enabled, analogously to how they are reset
>>>>>> between submissions when switching pagetables.
>>>>>>
>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 20 ++++++++++++++++++-
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  5 +++++
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++++++++++++++++++++
>>>>>>     drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>>>>>>     4 files changed, 61 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index ed0b138a2d66..710ec3ce2923 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>>>     static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>>>>>     		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>>>>>>     {
>>>>>> -	u64 preempt_offset_priv_secure;
>>>>>> +	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>>>>>> +	u64 preempt_offset_priv_secure, preempt_postamble;
>>>>>>     	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>>>>>> @@ -398,6 +399,23 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>>>>>     	/* seems OK to set to 0 to disable it */
>>>>>>     	OUT_RING(ring, 0);
>>>>>>     	OUT_RING(ring, 0);
>>>>>> +
>>>>>> +	/* if not profiling set postamble to clear perfcounters, else clear it */
>>>>>> +	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
>>>
>>> Setting len = 0 is enough to skip processing postamble packets. So how
>>> about a simpler:
>>>
>>> len = a6xx_gpu->preempt_postamble_len;
>>> if (sysprof)
>>> 	len = 0;
>>>
>>> OUT_PKT7(ring, CP_SET_AMBLE, 3);
>>> OUT_RING(ring, lower_32_bits(preempt_postamble));
>>> OUT_RING(ring, upper_32_bits(preempt_postamble));
>>> OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(len) |
>>> 		CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>>>
>>>>>> +		preempt_postamble = a6xx_gpu->preempt_postamble_iova;
>>>>>> +
>>>>>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>>>>>> +		OUT_RING(ring, lower_32_bits(preempt_postamble));
>>>>>> +		OUT_RING(ring, upper_32_bits(preempt_postamble));
>>>>>> +		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
>>>>>> +					a6xx_gpu->preempt_postamble_len) |
>>>>>> +				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>>>>>> +	} else {
>>>>>
>>>>> Why do we need this else part?
>>>>
>>>> Wouldn't the postmable remain set if we don't explicitly set it to 0?
>>>
>>> Aah, that is a genuine concern. I am not sure! Lets keep it.
>>>
>>>>
>>>>>
>>>>>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>>>>>> +		OUT_RING(ring, 0);
>>>>>> +		OUT_RING(ring, 0);
>>>>>> +		OUT_RING(ring, CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>>>>>> +	}
>>>>>>     }
>>>>>>     static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>>> index da10060e38dc..b009732c08c5 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>>> @@ -71,6 +71,11 @@ struct a6xx_gpu {
>>>>>>     	bool uses_gmem;
>>>>>>     	bool skip_save_restore;
>>>>>> +	struct drm_gem_object *preempt_postamble_bo;
>>>>>> +	void *preempt_postamble_ptr;
>>>>>> +	uint64_t preempt_postamble_iova;
>>>>>> +	uint64_t preempt_postamble_len;
>>>>>> +
>>>>>>     	struct a6xx_gmu gmu;
>>>>>>     	struct drm_gem_object *shadow_bo;
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>>>> index 1caff76aca6e..ec44f44d925f 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>>>> @@ -346,6 +346,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>>>>>>     	return 0;
>>>>>>     }
>>>>>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>>>>>> +{
>>>>>> +	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
>>>>>> +	u32 count = 0;
>>>>>> +
>>>>>> +	postamble[count++] = PKT7(CP_REG_RMW, 3);
>>>>>> +	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>>>>>> +	postamble[count++] = 0;
>>>>>> +	postamble[count++] = 1;
>>>>>> +
>>>>>> +	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
>>>>>> +				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>>>>>> +	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>>>>>
>>>>> Isn't it better to just replace this with NOP packets when sysprof is
>>>>> enabled, just before triggering preemption? It will help to have an
>>>>> immediate effect.
>>>>>
>>>>> -Akhil
>>>>>
>>>>
>>>> Mmm, this being a postamble I wonder whether we have the guarantee that it
>>>> finishes execution before the IRQ is called so updating it doesn't race with
>>>> the CP executing it.
>>>
>>> Yes, it will be complete. But on a second thought now, this suggestion from me
>>> looks like an overkill.
>>
>> Thanks for confirming! I have actually already implemented something similar
>> to what you proposed https://gitlab.com/pac85/inux/-/commit/8b8ab1d89b0f611cfdbac4c3edba4192be91a7f9
>> so we can chose between the two. Let me know your prefence.
> 
> That looks fine. Can we try to simplify that patch further? We can lean
> towards readability instead of saving few writes. I don't think there
> will be frequent sysprof toggles.
> 

Sure yeah, I removed the patch argument on preempt_prepare_postamble so 
when we enable the postamble we just re-emit the entire IB.

> -Akhil
> 
>>
>>>
>>> -Akhil.
>>>
>>>>
>>>>>> +
>>>>>> +	a6xx_gpu->preempt_postamble_len = count;
>>>>>> +}
>>>>>> +
>>>>>>     void a6xx_preempt_fini(struct msm_gpu *gpu)
>>>>>>     {
>>>>>>     	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>> @@ -376,6 +398,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>>>>>     	a6xx_gpu->uses_gmem = 1;
>>>>>>     	a6xx_gpu->skip_save_restore = 1;
>>>>>> +	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
>>>>>> +			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
>>>>>> +			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
>>>>>> +			&a6xx_gpu->preempt_postamble_iova);
>>>>>> +
>>>>>> +	preempt_prepare_postamble(a6xx_gpu);
>>>>>> +
>>>>>> +	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
>>>>>> +		goto fail;
>>>>>> +
>>>>>>     	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
>>>>>>     	return;
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> index 6b1888280a83..87098567483b 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>>> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>>>>>>     	OUT_RING(ring, PKT4(regindx, cnt));
>>>>>>     }
>>>>>> +#define PKT7(opcode, cnt) \
>>>>>> +	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
>>>>>> +		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
>>>>>> +
>>>>>>     static inline void
>>>>>>     OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>>>>>>     {
>>>>>>     	adreno_wait_ring(ring, cnt + 1);
>>>>>> -	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
>>>>>> -		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
>>>>>> +	OUT_RING(ring, PKT7(opcode, cnt));
>>>>>>     }
>>>>>>     struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
>>>>>>
>>>>>> -- 
>>>>>> 2.46.0
>>>>>>
>>>>
>>>> Best regards,
>>>> -- 
>>>> Antonino Maniscalco <antomani103@gmail.com>
>>>>
>>
>> Best regards,
>> -- 
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


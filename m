Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C864971A97
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E398D10E562;
	Mon,  9 Sep 2024 13:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h4rQDOw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6387F10E09C;
 Mon,  9 Sep 2024 13:15:55 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so5763842a12.0; 
 Mon, 09 Sep 2024 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725887754; x=1726492554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0szTpntTikg706FgJTsH1S+zClPIdKgVR1ySeBMMIEA=;
 b=h4rQDOw1z33xXioRkzwdETwqGrv7VeImbVmsR1w+2LFmHKb5GdlDL3l9dv/M3OXdL5
 rtRZloR7L64oCPMDTRU3gIph4Vf0G+QvjsAmJkm+iolhb1h+w+zG1AH/hk0LojKgbox7
 zQN0ViY03xqYaRefl4Taxg9hzURFCQ6vxu7Rk2Rc8Z5u2tRI/Ae26flRblFtM/r/T2m8
 WgPifLB3fNxQPu874hpHH8CmLpn1eYe9Gi+saGPjyX30gv68xqSg+fgrQXX/6pwUP3ME
 ibJV80cszhdtWyMpbR4uatRvkMgWUCHupc8F6M3r3oyokNL+RYg/qOcnEu94Yi2RXNtC
 guAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725887754; x=1726492554;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0szTpntTikg706FgJTsH1S+zClPIdKgVR1ySeBMMIEA=;
 b=FK8xc2o2sRx0f4NXp4s45EVbcJvQZSLswu91y3rB356G1+FHCnShG7ugmoNWanFN64
 0EIOJxJ/tHFrPL6yZ3CQbvT/Co9Pzikpgm4NWYDv7SU6v6LUF/qybWTSri2rI5hs40D8
 sHyVlcsmgL2DNsOlpoVpCkW+pQt6+Z2ptmYIKkqGXJNgVj+587LDNS1EOYj5pjwvFihC
 M/B7hWhkGeQF+z8DVSYg3xhqBh1xQ8tdSLeZUwpG7IzWWGJ9XKLN7ZfjgTwtwbbi3oAy
 n/wZ7KuWdz80FJ5srVqXdzfoOpK7DloLo8rAAEeki240WWjoM05n+0jd31SC8sGSEsQy
 Kg7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP1yNv/GOVtL9lzC/QOfXQZS0ftOi8ujM1H+lxf+AHVuu84Ft0/t572o2AUE/BRdrNreh1h4aMS324@lists.freedesktop.org,
 AJvYcCUjQbsPvtSrLrqnyO0x6QoqdjBexikyF7fym8Q4XwZElhIfaQeIa/Fl89pORjbycScCjrB18Zm0ow4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQwq82+mVA46GVZINtuKTm4Uw+ZXV71q8vnN6O4isGzZy2K3yS
 t1zk08U4Dmo/BcJx0O35OeXZINvHMMdM9eK0opiFe7UVmHxKGrMB
X-Google-Smtp-Source: AGHT+IF/r30Dk3ePhvp2ter/2dqTi0m3U1rU/oX1maS5tjBZG1A0aRxKAkqme9+zXHINhvtdF0T8dA==
X-Received: by 2002:a05:6402:5193:b0:5c3:c520:b019 with SMTP id
 4fb4d7f45d1cf-5c3dc7c7154mr8327573a12.34.1725887752685; 
 Mon, 09 Sep 2024 06:15:52 -0700 (PDT)
Received: from [192.168.1.17] (host-95-246-172-178.retail.telecomitalia.it.
 [95.246.172.178]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd468a1sm2988829a12.26.2024.09.09.06.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:15:52 -0700 (PDT)
Message-ID: <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
Date: Mon, 9 Sep 2024 15:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX
 targets
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
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com>
 <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
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

On 9/6/24 9:54 PM, Akhil P Oommen wrote:
> On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
>> This patch implements preemption feature for A6xx targets, this allows
>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>> hardware as such supports multiple levels of preemption granularities,
>> ranging from coarse grained(ringbuffer level) to a more fine grained
>> such as draw-call level or a bin boundary level preemption. This patch
>> enables the basic preemption level, with more fine grained preemption
>> support to follow.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> ---
>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
...
> 
> we can use the lighter smp variant here.
> 
>> +
>> +		if (a6xx_gpu->cur_ring == ring)
>> +			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
>> +		else
>> +			ring->skip_inline_wptr = true;
>> +	} else {
>> +		ring->skip_inline_wptr = true;
>> +	}
>> +
>> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>   }
>>   
>>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> 
> set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
> not. This is currently not tracked separately for each ring. Can you
> please check that?

I totally missed that. Thanks for catching it!

> 
> I wonder why that didn't cause any gpu errors in testing. Not sure if I
> am missing something.
> 

I think this is because, so long as a single context doesn't submit to 
two different rings with differenr priorities, we will only be incorrect 
in the sense that we emit more page table switches than necessary and 
never less. However untrusted userspace could create a context that 
submits to two different rings and that would lead to execution in the 
wrong context so we must fix this.

>>   
>>   	/*
>>   	 * Write the new TTBR0 to the memstore. This is good for debugging.
>> +	 * Needed for preemption
>>   	 */
>> -	OUT_PKT7(ring, CP_MEM_WRITE, 4);
>> +	OUT_PKT7(ring, CP_MEM_WRITE, 5);
>>   	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
>>   	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
>>   	OUT_RING(ring, lower_32_bits(ttbr));
>> -	OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
>> +	OUT_RING(ring, upper_32_bits(ttbr));
>> +	OUT_RING(ring, ctx->seqno);
>>   
>>   	/*
>>   	 * Sync both threads after switching pagetables and enable BR only
>> @@ -268,6 +363,43 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>   	a6xx_flush(gpu, ring);
>>   }
...
>> +	struct a6xx_preempt_record *record_ptr =
>> +		a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE;
>> +	u64 ttbr0 = ring->memptrs->ttbr0;
>> +	u32 context_idr = ring->memptrs->context_idr;
>> +
>> +	smmu_info_ptr->ttbr0 = ttbr0;
>> +	smmu_info_ptr->context_idr = context_idr;
>> +	record_ptr->wptr = get_wptr(ring);
>> +
>> +	/*
>> +	 * The GPU will write the wptr we set above when we preempt. Reset
>> +	 * skip_inline_wptr to make sure that we don't write WPTR to the same
>> +	 * thing twice. It's still possible subsequent submissions will update
>> +	 * wptr again, in which case they will set the flag to true. This has
>> +	 * to be protected by the lock for setting the flag and updating wptr
>> +	 * to be atomic.
>> +	 */
>> +	ring->skip_inline_wptr = false;
>> +
>> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>> +
>> +	gpu_write64(gpu,
>> +		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
>> +		a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_SMMU_INFO);
>> +
>> +	gpu_write64(gpu,
>> +		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
>> +		a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE);
>> +
>> +	preempt_offset_priv_secure =
>> +		PREEMPT_OFFSET_PRIV_SECURE(adreno_gpu->info->preempt_record_size);
>> +	gpu_write64(gpu,
>> +		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR,
>> +		a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_secure);
> 
> Secure buffers are not supported currently, so we can skip this and the
> context record allocation. Anyway this has to be a separate buffer
> mapped in secure pagetable which don't currently have. We can skip the
> same in pseudo register packet too.
>

Mmm it would appear that not setting it causes an hang very early. I'll 
see if I can find out more about what is going on.

>> +
>> +	a6xx_gpu->next_ring = ring;
>> +
...
>>   
>>   struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>
>> -- 
>> 2.46.0
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


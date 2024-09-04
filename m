Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAA96BEC0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 15:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B3810E1A5;
	Wed,  4 Sep 2024 13:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSz/r4iC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1B710E10D;
 Wed,  4 Sep 2024 13:39:04 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c263118780so2744120a12.2; 
 Wed, 04 Sep 2024 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725457143; x=1726061943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=08yJDMGUC5nJvNhwZc+qx2S6bd96dFeBgNvhyQY1m4Y=;
 b=KSz/r4iCTPiAttKyCkpdlOV7pgicZ/cQTqoq7bM170qnFL7bjxtN0RBfuS9msMfzay
 x6MZppDU2fS3mxJSIqRIdh8KqmHyuS+Aj0NQvClUbGYpq7uXoT1uos3Y1aKGezAthWMs
 MnqMMozbpyAr/OivJ0y7hivTr7aomn6uHTT2p/TWIWEwJDRaUO2QGvZCht4A9UtV4QU0
 H/d8uMpZFjC68wEChjRr9Nrlx1Zqx48MYuWz/MGbTlcABmcEbHVLG8boEx9KbWpF9z7P
 gyIpLInPHGxB09FodNqs9GU27N3lblRfYhUg/9rJ0FOe14gkaIvMZB0OVKi6nyl3S6U/
 N9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725457143; x=1726061943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=08yJDMGUC5nJvNhwZc+qx2S6bd96dFeBgNvhyQY1m4Y=;
 b=hPcANrrhLKaWMDe2wvQaz74b6NMDYu5BCZJVNax1VvqhhJgkusfPbJ28D9lNH7sak0
 kdyAZZj+XaMXDA2mgvComzZZ3ZVOh5DlP09tiCnk/H1wkIMWaAGTvkuCpH5nqifAdCUi
 TvdgWP7oDeR2Nst7OIr5OmkZD+66oeS/Vt6Vx9cvhWwQMtqIWVCKtLgwYi51GeeR8al4
 vLfEA9mslMJPGqMSSQ85kqZ5kVaymS6oCLqYzV0poc8cnzGRYuLkro63uQSY/6mVLzzg
 HlnfaR6rOd7WrQ04YSpCrYBTgd76i3BexL2RW+DPAPWFcEXfMZApuKXGso0uWzDZM4v1
 qRUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6u4ZyuySTty07D9QYpWnTCay2gOkoMwYpTFDWxk32gociWqphxTAE7Gq6oPrEiVOdK0J7KnN8SDmT@lists.freedesktop.org,
 AJvYcCVmvnpYxL2MZfx4x175PZVxBTHPxxJOaXFIm8F+BdEKMW+s+FngfvzsFaqXHdWkI85jl02e8gWAHnI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJpm8LB2mE3sjWMFDXrsUR93Ck2eUQyQf0NhlxgHmTZ5CSfnnw
 zFAJoH1tpE/zU/AoeQijR8LpuhuC2YDT06jYzcSKNLfZtxSB52mx
X-Google-Smtp-Source: AGHT+IFMURDKJcnkYF+8eavXj8ZUdnqa5cQaVjvuPu8moS+BA4V7/R/3KDv+62gvdYtT1mL3oEKeIQ==
X-Received: by 2002:a05:6402:2110:b0:5bf:c8:78a with SMTP id
 4fb4d7f45d1cf-5c25f244d2cmr7313938a12.17.1725457141638; 
 Wed, 04 Sep 2024 06:39:01 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a36fsm7611564a12.16.2024.09.04.06.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 06:39:01 -0700 (PDT)
Message-ID: <b899d35a-fedf-4748-ac23-6389a8742160@gmail.com>
Date: Wed, 4 Sep 2024 15:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/msm/A6xx: Use posamble to reset counters on
 preemption
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
 <CAF6AEGv82=N4=motCpGhp5N7Yv8oqtBcG4bGahgF53CpFYpTgg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGv82=N4=motCpGhp5N7Yv8oqtBcG4bGahgF53CpFYpTgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 8/30/24 8:32 PM, Rob Clark wrote:
> On Fri, Aug 30, 2024 at 8:33 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> Use the postamble to reset perf counters when switching between rings,
>> except when sysprof is enabled, analogously to how they are reset
>> between submissions when switching pagetables.
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 26 +++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>>   4 files changed, 49 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 1a90db5759b8..3528ecbbc1ab 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>   static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>                  struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>>   {
>> -       u64 preempt_offset_priv_secure;
>> +       bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>> +       u64 preempt_offset_priv_secure, preempt_postamble;
>>
>>          OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>>
>> @@ -403,6 +404,17 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>          /* seems OK to set to 0 to disable it */
>>          OUT_RING(ring, 0);
>>          OUT_RING(ring, 0);
>> +
>> +       if (!sysprof && a6xx_gpu->preempt_postamble_len) {
>> +               preempt_postamble = SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu);
>> +
>> +               OUT_PKT7(ring, CP_SET_AMBLE, 3);
>> +               OUT_RING(ring, lower_32_bits(preempt_postamble));
>> +               OUT_RING(ring, upper_32_bits(preempt_postamble));
>> +               OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
>> +                                       a6xx_gpu->preempt_postamble_len) |
>> +                               CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>> +       }
> 
> Hmm, ok, we set this in the submit path.. but do we need to clear it
> somehow when transitioning from !sysprof to sysprof?
> 

We can always emit the packet and 0 fields out when sysprof is enabled. 
Would that be ok for you? Only emitting it when needed might be 
nontrivial given that there are multiple rings and we would be paying 
the overhead for emitting it in the more common case (not profiling) anyway.

> Also, how does this interact with UMD perfctr queries, I would expect
> they would prefer save/restore?

Right so my understanding given previous discussions is that we want to 
disable preemption from userspace in that case? The vulkan extension 
requires to acquire and release a lock so we could use that to emit the 
packets that enable and disable preemption perhaps.

> 
> BR,
> -R
> 
>>   }
>>
>>   static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 652e49f01428..2338e36c8f47 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -66,6 +66,7 @@ struct a6xx_gpu {
>>          atomic_t preempt_state;
>>          spinlock_t eval_lock;
>>          struct timer_list preempt_timer;
>> +       uint64_t preempt_postamble_len;
>>
>>          unsigned int preempt_level;
>>          bool uses_gmem;
>> @@ -99,6 +100,11 @@ struct a6xx_gpu {
>>   #define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
>>          (a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
>>
>> +#define SCRATCH_PREEMPT_POSTAMBLE_OFFSET (100 * sizeof(u64))
>> +
>> +#define SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu) \
>> +       (a6xx_gpu->scratch_iova + SCRATCH_PREEMPT_POSTAMBLE_OFFSET)
>> +
>>   /*
>>    * In order to do lockless preemption we use a simple state machine to progress
>>    * through the process.
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index 4b61b993f75f..f586615db97e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -351,6 +351,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>>          return 0;
>>   }
>>
>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>> +{
>> +       u32 *postamble = a6xx_gpu->scratch_ptr + SCRATCH_PREEMPT_POSTAMBLE_OFFSET;
>> +       u32 count = 0;
>> +
>> +       postamble[count++] = PKT7(CP_REG_RMW, 3);
>> +       postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>> +       postamble[count++] = 0;
>> +       postamble[count++] = 1;
>> +
>> +       postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
>> +       postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
>> +       postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
>> +                               REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
>> +       postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
>> +       postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
>> +       postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>> +       postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>> +
>> +       a6xx_gpu->preempt_postamble_len = count;
>> +}
>> +
>>   void a6xx_preempt_fini(struct msm_gpu *gpu)
>>   {
>>          struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> @@ -382,10 +404,12 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>          a6xx_gpu->skip_save_restore = 1;
>>
>>          a6xx_gpu->scratch_ptr  = msm_gem_kernel_new(gpu->dev,
>> -                       gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
>> +                       PAGE_SIZE, MSM_BO_WC,
>>                          gpu->aspace, &a6xx_gpu->scratch_bo,
>>                          &a6xx_gpu->scratch_iova);
>>
>> +       preempt_prepare_postamble(a6xx_gpu);
>> +
>>          if (IS_ERR(a6xx_gpu->scratch_ptr))
>>                  goto fail;
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 6b1888280a83..87098567483b 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>>          OUT_RING(ring, PKT4(regindx, cnt));
>>   }
>>
>> +#define PKT7(opcode, cnt) \
>> +       (CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
>> +               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
>> +
>>   static inline void
>>   OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>>   {
>>          adreno_wait_ring(ring, cnt + 1);
>> -       OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
>> -               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
>> +       OUT_RING(ring, PKT7(opcode, cnt));
>>   }
>>
>>   struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
>>
>> --
>> 2.46.0
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


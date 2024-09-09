Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF17D971D8A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 17:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512DC10E54F;
	Mon,  9 Sep 2024 15:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YuiF1X1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0807A10E54F;
 Mon,  9 Sep 2024 15:08:57 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f762de00e5so20076761fa.3; 
 Mon, 09 Sep 2024 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725894535; x=1726499335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=erOfIg5fQXx54gTTQlJYEfyRSx79pT0WOxzbWVH3BNM=;
 b=YuiF1X1/8ANWEcAnBVb26fAOB3jEy9jALTy4+Nm8JityLNsNXWyT2bbLcjfvOnY5/b
 aj4h+gCyxXrrCN5rdbNFuH6ZaVWVXp9F2qUEM7gMfK11GktzAkiMze0Qf2TAVQPmtdsl
 3/FrQbM4GScCVKHGtlEfEVRy3SHl4xmdXXX4lrxpZwDBPWyPrdXtZbeQ8nQWtlc2Uw3+
 FayQwja/+JcmqBUSiMLOVE8BNbCbeN0H5n2xb6xQ/6tDwGy73Nqi8RNJc/ttMf/cxNr1
 k7jzb1txi3BdGAk+mD7IyATEMUMZZL5QSG6Xa5JIMjhCsGTOx7TMtlJWoG2NP0ZMPT2n
 eRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725894535; x=1726499335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=erOfIg5fQXx54gTTQlJYEfyRSx79pT0WOxzbWVH3BNM=;
 b=CCahE09Uwu5wro06RiSNn6T1Dm5NxF0X3a7RClj6zoWzp75UaTANNbu76l2TT3264g
 HsBGSCyC/i+XK9NSSaJSZVUghkhpNgHRVqy9kCG+PFZ4/QCMWbBNzJpyXYVnJQRSwK4D
 7gqFDQEYtrCGFq1/AGVw7bactthfJ230sK/RMqo2UL1zd4NDmHrnGueROJrtXrMOAKku
 8F3H5sPEHii1ZUf3ubAv+CZh3lZm3xQjikztSTYGRnJq2ch/qaXHu8ilqht5Buhsmkk8
 KbTfq+3Z/VKN1CVc5tlDqCp0J18zn9v67NjhHfJkYAF1q8feI6LkepfYfbpMttpcbHtJ
 U9iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+A8NufelGz7WMVImqIGnMpSLH5QMKuYyoE8TG//UJnl1b+RHoQt22w5f2/bWiTQepXrfFYrMSEHk=@lists.freedesktop.org,
 AJvYcCVKxdHftZ9m0VTWKTSa0+S+3qyp0lR/h/vBRuTjnrtMT18XBmPfMV7Kj61fzcfPmkjXINlNIktfSbRy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiHti7S8qE4Jq1zjJ3VhGPrP67mBNgvCY2szUK5Eo0EwDZvGXT
 mDZWZi2XWF26r1zOgS3qkInBzb1Kv2yPt+zITP3koIDRIL95zWmU
X-Google-Smtp-Source: AGHT+IEYRIRAjoJwEF3v61Fg8BoF+Xi79gge+X1kwzAKmORNuEYSRvDi7XfFgjdome3hdviGnZukyg==
X-Received: by 2002:a2e:a202:0:b0:2f6:62a1:25fe with SMTP id
 38308e7fff4ca-2f751f2b0d4mr68764151fa.23.1725894534768; 
 Mon, 09 Sep 2024 08:08:54 -0700 (PDT)
Received: from [192.168.1.17] (host-95-246-172-178.retail.telecomitalia.it.
 [95.246.172.178]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76fc4sm3135915a12.78.2024.09.09.08.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 08:08:54 -0700 (PDT)
Message-ID: <74e8bca6-dc4a-41fb-b7a3-1281ea89ae97@gmail.com>
Date: Mon, 9 Sep 2024 17:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] drm/msm/A6xx: Add traces for preemption
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
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-7-fd947699f7bc@gmail.com>
 <20240906201101.vccq54s4nmlmgeoz@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240906201101.vccq54s4nmlmgeoz@hu-akhilpo-hyd.qualcomm.com>
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

On 9/6/24 10:11 PM, Akhil P Oommen wrote:
> On Thu, Sep 05, 2024 at 04:51:25PM +0200, Antonino Maniscalco wrote:
>> Add trace points corresponding to preemption being triggered and being
>> completed for latency measurement purposes.
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
>>   drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index ec44f44d925f..ca9d36c107f2 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -7,6 +7,7 @@
>>   #include "a6xx_gpu.h"
>>   #include "a6xx_gmu.xml.h"
>>   #include "msm_mmu.h"
>> +#include "msm_gpu_trace.h"
>>   
>>   /*
>>    * Try to transition the preemption state from old to new. Return
>> @@ -143,6 +144,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>   
>>   	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>>   
>> +	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>> +
>>   	/*
>>   	 * Retrigger preemption to avoid a deadlock that might occur when preemption
>>   	 * is skipped due to it being already in flight when requested.
>> @@ -264,6 +267,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>   	 */
>>   	ring->skip_inline_wptr = false;
>>   
>> +	trace_msm_gpu_preemption_trigger(
>> +		a6xx_gpu->cur_ring ? a6xx_gpu->cur_ring->id : -1,
> 
> Can't we avoid this check?
>
Sorry yeah you had requested this change but I had forgotten to do it.

> -Akhil.
> 
>> +		ring ? ring->id : -1);
>> +
>>   	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>   
>>   	gpu_write64(gpu,
>> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
>> index ac40d857bc45..7f863282db0d 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
>> @@ -177,6 +177,34 @@ TRACE_EVENT(msm_gpu_resume,
>>   		TP_printk("%u", __entry->dummy)
>>   );
>>   
>> +TRACE_EVENT(msm_gpu_preemption_trigger,
>> +		TP_PROTO(int ring_id_from, int ring_id_to),
>> +		TP_ARGS(ring_id_from, ring_id_to),
>> +		TP_STRUCT__entry(
>> +			__field(int, ring_id_from)
>> +			__field(int, ring_id_to)
>> +			),
>> +		TP_fast_assign(
>> +			__entry->ring_id_from = ring_id_from;
>> +			__entry->ring_id_to = ring_id_to;
>> +			),
>> +		TP_printk("preempting %u -> %u",
>> +			  __entry->ring_id_from,
>> +			  __entry->ring_id_to)
>> +);
>> +
>> +TRACE_EVENT(msm_gpu_preemption_irq,
>> +		TP_PROTO(u32 ring_id),
>> +		TP_ARGS(ring_id),
>> +		TP_STRUCT__entry(
>> +			__field(u32, ring_id)
>> +			),
>> +		TP_fast_assign(
>> +			__entry->ring_id = ring_id;
>> +			),
>> +		TP_printk("preempted to %u", __entry->ring_id)
>> +);
>> +
>>   #endif
>>   
>>   #undef TRACE_INCLUDE_PATH
>>
>> -- 
>> 2.46.0
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


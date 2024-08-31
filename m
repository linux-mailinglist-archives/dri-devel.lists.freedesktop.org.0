Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3DB967225
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 16:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569A610E0FA;
	Sat, 31 Aug 2024 14:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Za8jAo8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3BB10E08F;
 Sat, 31 Aug 2024 14:27:05 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f3f0a31ab2so30914411fa.0; 
 Sat, 31 Aug 2024 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725114423; x=1725719223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ClDDUTpR8t6DPG6KoXyNnf/qGLBhLmE/UmuhkywqIpw=;
 b=Za8jAo8t29luudSV15KiAEsciFpTB6alknw2sLWPLxjOh+MqOMdFWzAJO/auVgyK4b
 is96O/+mUtwNR1aeDF+h1vGShjrinL2Mb9JFNJaNw2QQBjZoxDNN8pdECrpJS0shYYVF
 oLEVAuXcBCnvJXfnz2jUiqun2lwb1NDWVtY8KRqkbmA1YbQoE0N3GIbd1kbrPTgovzGz
 EvEand/nvA2tnn0srnzZwhRSN2zQHDMoO52geWKrXrxZG4i7EuJG89eyl0D7LurDy0ia
 SJWArA9rqc1iZimkg7A70Zxir1YZgJUYIWAG0oXyYfZj+cBOyKACBVYiSwEqddfeTt3R
 RW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725114423; x=1725719223;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ClDDUTpR8t6DPG6KoXyNnf/qGLBhLmE/UmuhkywqIpw=;
 b=Id80rdbU2dd/aO7CXdBVckkaWi3jYk7+ijdf4nzwsDQBKqRPbwXDBArYfYhr4NU/0I
 3VmnN33u3GCm6qNUB1UE1l30BJc6L9E9hxouk0+n9uTqcfhJcTrntCckzUEU0FVlHkd5
 hCYrzw4yJf6LQ2PSvpDkmrztRFlK2l8sUtVhywZxb1i7MVz+Cmd5vvSGPahc6l2h1Omq
 QY7yNxbnE/hpYK8NM6mMKVk+jBT9OjF11ZsZZT1crjecB9bLZXiQgkPnY5VXWSWSNoLD
 DidltMFNRldbxDSR41ex62yLzHOmmjIG2NdlTQrAcU5QZMnvF4kpEz9sYxwQQppYvMzs
 qD1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX10PO0ppRf3Y9vbaPCxw5/cX725iKZEXwTjrWHZnNOW1W6qzvGD9D8Fv6BsyzyCKknXZOjy0KwmYGI@lists.freedesktop.org,
 AJvYcCXMRaHFzy73vU8gaw5VhDOArrfszRwPgbdIPhSRQobyEdR0K6kxKgS5dy9uT0OJs7XBXuIoCrjNKl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYwNHoKyPlGc+LRdlhpLfIauMJ1djrO3NX7GXVEfpbRPmez9O3
 +6xQkazRAjmKyl0AUkuexcgmsOuw+vQP2dj3eP2cD1YbBp0mWIz+
X-Google-Smtp-Source: AGHT+IG0soZ5n4oimLQY1Jh8mnsJcHcxLpHeW/bofHdniT0E1XHiLWLlJ9NcFIp6//datiepOAkLFQ==
X-Received: by 2002:a05:6512:124f:b0:530:e228:779c with SMTP id
 2adb3069b0e04-53546b04212mr3837461e87.19.1725114421834; 
 Sat, 31 Aug 2024 07:27:01 -0700 (PDT)
Received: from [192.168.1.17] (host-79-46-163-127.retail.telecomitalia.it.
 [79.46.163.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196751sm330525766b.121.2024.08.31.07.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2024 07:27:00 -0700 (PDT)
Message-ID: <8537f53c-3898-4fa0-8376-de789d5c3ba3@gmail.com>
Date: Sat, 31 Aug 2024 16:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
 <CAF6AEGuwtgzOZtDKPq+dna-mvv2M193Neow_7ZprxrLV+hf+FA@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGuwtgzOZtDKPq+dna-mvv2M193Neow_7ZprxrLV+hf+FA@mail.gmail.com>
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

On 8/30/24 10:25 PM, Rob Clark wrote:
> On Fri, Aug 30, 2024 at 8:33 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
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
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>>   5 files changed, 921 insertions(+), 9 deletions(-)
>>
> 
> [snip]
> 
>> @@ -784,6 +1062,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                  msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>>          }
>>
>> +       a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
>> +                                                        MSM_BO_WC  | MSM_BO_MAP_PRIV,
>> +                                                        gpu->aspace, &a6xx_gpu->pwrup_reglist_bo,
>> +                                                        &a6xx_gpu->pwrup_reglist_iova);
> 
> I guess this could also be MSM_BO_GPU_READONLY?
> 
> BR,
> -R

Besides containing the the actual reglist this buffer also contains the 
`cpu_gpu_lock` structure which is written by the SQE so adding the 
`MSM_BO_GPU_READONLY` flag would cause it to fault.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


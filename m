Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12579988B27
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 22:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4314610E34D;
	Fri, 27 Sep 2024 20:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="etnmtqeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7BA10E07E;
 Fri, 27 Sep 2024 20:15:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53659867cbdso4116411e87.3; 
 Fri, 27 Sep 2024 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727468125; x=1728072925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QIMNxc9i5uywt236vnRMCdmiBIxZF4zCqaMPF6coLfc=;
 b=etnmtqeg1VgVBUxhKXCliEWX9KAQgl89CgRVqaNqTNQI9Hh7SoJijabzVseL8+oaHS
 VD9Z3xKErr565pby8OEUOf+dq5/FmGHA5y96KsuawRLgihHpoFs95JXMzwAMQCXOHIVj
 qCHMEUYoB5kyEbDCLLCHX/sytY3GII2mGeY2P4Qkp5icfQnrlJPmrjlCezphQaPtGCw7
 rLcXLMsNgp8+4SENOvHVIBOCVHADT38QoHU19otrQgbZVetHBJ1IYBMOIohh64wh/Y9N
 D22KahLZJJHAq3tQtz9xHOrBu+HapWeTDMJ0HV4IJQKoMZEsOYeBoTZHJtn6YpQHNKZU
 cQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727468125; x=1728072925;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QIMNxc9i5uywt236vnRMCdmiBIxZF4zCqaMPF6coLfc=;
 b=MRMNaqeHf1fde+O8GHD0V5+cf3mBpYU80G7+cDgne515XbvoAa4xhX03AJQL3HCRiW
 3v+ub0Pa1BbIFqti9dgWwgoenSjNGTaUhmVpHHmjkrrJ6NbTlvZPlr0biw15HVQpoNA/
 b5wCnThMY+BowR162Pd9MaOONkP21iyLpb7BnHMpCdQ7NqKq9ZOGOqAk1UlCcoTPEZoH
 fRtB2NCjR6A45imWK/kY8OcKEPmZGRQ8EoYgUzoCdOgVQ6hcfQr0ul8kncqaVM6a8Zz/
 wFVGdk/UUQnCLxalOF+dnyHSXfpZCyzxzx2UotpM6MwRWhmblSShMWEMw09nqpt/kOYY
 koyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr37klBoFupXFMTMKlter526JuDhylwIMyz5ZuaObY4f9gOA6Clw8M6LS4bNhQTo2L7uJjKCAok90=@lists.freedesktop.org,
 AJvYcCW9+jSklRIutCRKCZcpu7ImtQKnADue5Y0jLo6F7V+S+9gxBXuv4xCur3zWFpi5XqC7TFMrhIG2jjLz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp4QLNcvEzA8GeG1BjwyiA11805fV09K9Ks6lUSMJ6g9ode60J
 ybuHHyD2FsxWklaYb96YfFQU/ugxA83W/5B50kbpASQ+fR8l8jkm
X-Google-Smtp-Source: AGHT+IHQGK1XWDK0fxlB6FflHsYkNhurTWaq10UOXiMznBIujmMLFUq8kQYDLfUnHiiGnjT2eyaWxA==
X-Received: by 2002:a05:6512:31c1:b0:536:5625:511f with SMTP id
 2adb3069b0e04-5389fc7d145mr4416291e87.45.1727468124570; 
 Fri, 27 Sep 2024 13:15:24 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-160-215.retail.telecomitalia.it.
 [87.19.160.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2997507sm168172766b.204.2024.09.27.13.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 13:15:24 -0700 (PDT)
Message-ID: <a035fb73-e2b8-4928-b136-b3b99996bc84@gmail.com>
Date: Fri, 27 Sep 2024 22:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] drm/msm/a6xx: Implement preemption for a7xx
 targets
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
 <CAF6AEGviMOLoZKHf4DX9mEj84Y5Xx2hH4tvrkRVLsYyQz35Bwg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGviMOLoZKHf4DX9mEj84Y5Xx2hH4tvrkRVLsYyQz35Bwg@mail.gmail.com>
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

On 9/27/24 6:29 PM, Rob Clark wrote:
> On Thu, Sep 26, 2024 at 2:17 PM Antonino Maniscalco
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
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 283 +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 +++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 377 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>>   5 files changed, 825 insertions(+), 11 deletions(-)
>>
> 
> [snip]
> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 6e065500b64d6d95599d89c33e6703c92f210047..355a3e210335d60a5bed0ee287912271c353402a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> 
> [snip]
> 
>> @@ -784,6 +1015,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                  msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>>          }
>>
>> +       a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
>> +                                                        MSM_BO_WC  | MSM_BO_MAP_PRIV,
>> +                                                        gpu->aspace, &a6xx_gpu->pwrup_reglist_bo,
>> +                                                        &a6xx_gpu->pwrup_reglist_iova);
> 
> Couldn't this also be MSM_BO_GPU_READONLY?  And same for the
> preempt_postamble_ptr, I assume?

So for pwrup_reglist_ptr, it contains the cpu_gpu_lock struct that needs 
to be written by the gpu. The list itself is part of that struct.

> 
> Also, it looks like we are only writing the smmu_info from the
> kernel.. is there any way that could be split out into a RO buffer?

For preempt_postamble_ptr, and smmu_info I think it should be possible 
so I'll work on that.

> 
> BR,
> -R
> 
>> +
>> +       if (IS_ERR(a6xx_gpu->pwrup_reglist_ptr))
>> +               return PTR_ERR(a6xx_gpu->pwrup_reglist_ptr);
>> +
>> +       msm_gem_object_set_name(a6xx_gpu->pwrup_reglist_bo, "pwrup_reglist");
>> +
>>          return 0;
>>   }
>>


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

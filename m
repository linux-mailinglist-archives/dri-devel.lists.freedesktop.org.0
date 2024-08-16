Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A3955965
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 21:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C3610E0DA;
	Sat, 17 Aug 2024 19:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LnVX41Zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363B110E06B;
 Fri, 16 Aug 2024 23:42:47 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a7a94aa5080so291776866b.3; 
 Fri, 16 Aug 2024 16:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723851765; x=1724456565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RH/rPI35J13TIcTmDXM4xAWE7+R4US73obFliUuHk8g=;
 b=LnVX41ZbixWPxffPts7zD4cjaWUaX0MVCeqR8QwUfqmD0DdX8RitvB8J4zGEBWKVpp
 PQrT104LAvSg8Rn+uSHYMaxYuIX4OWjFw0/yKpR0RUW7lgRXzwdDKkwB3OkPITLGc/e0
 DIINLNRwOyy0XHR79pbpq3WvURVSMVaNpsdIRZMNpC7esHPgFVnIh66q4KDOiFX5+tUw
 bTX5HaS63DQFggFEaphspt4hgr//DiF+WDsgaOSWyjQXKndOrRLI2zdgeSCkwrX4xp5v
 Yc5/EPXSP4UaFtXktsLKGrg4wF5PaBUymZ2p11S9tZZMTXqDCQnUDFBHTxU9uxbhO451
 4oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723851765; x=1724456565;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RH/rPI35J13TIcTmDXM4xAWE7+R4US73obFliUuHk8g=;
 b=fP4jO9hgXiRcbaOzrkuE8l6lhK2n/vUk/PEg7uw4MlkdZOzrcW23f8kSTmjKA8Hb7H
 tfQK4EdO65JebMi7jCaRKozl7LzHOB7bOg7OhNc5slclnyAtKGR7RZ8R7ZuVtYbHQPo0
 Q+ITMNDK1+SGqSU/91iuF7UfJZ8S9ikS/Z3oPUPKSW9ixahaabz5PdgX07vomGTI8Hcn
 XOJ+PSBjQMH89t/utjsvSQELuhstQ1H3XxOJF7OVx/nqRVWKmbPdgwgpr4kRqghYGjDM
 fhleEs5wKRzt34Ge4rAeiqr7r/KvxKORzXbgXuQdjK3fmQdDU2KkHoJwCMj0ZsXviWQO
 YsoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp3ILcnjViMgXFqWBaRnsj1RbngA44HS8U1/b87VFp0u9Y1Nuqm/Gj1/wdQRjLclXb2aBeSBw/JHjTjz3R5spoEa8WPayQL/jRUW9J4nUVe049cSmTzlrvJKFeV8ZJKL36YJswXD+kGKtOtLzKXuSh
X-Gm-Message-State: AOJu0Yxqb3ZitgzLxaBLeOesyd4uZpAqgUgFF0t/iLzzVpMKeOO6y4bK
 PmZbroRPDtYIooW4MI8xiv2TUFsFLxjpvS6YacMfSUrzwYG7GRTZ
X-Google-Smtp-Source: AGHT+IFHh3rJK/WkfcHOF52rAbjLG1pNSReXF3Ompen1dC2c00uCWocEwRcDw+ckHU2wnMDrRLmmaA==
X-Received: by 2002:a17:907:7fa5:b0:a80:aefa:14d3 with SMTP id
 a640c23a62f3a-a8392a4128amr351909366b.63.1723851764930; 
 Fri, 16 Aug 2024 16:42:44 -0700 (PDT)
Received: from [192.168.1.13] (host-95-235-164-146.retail.telecomitalia.it.
 [95.235.164.146]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838393599asm319803166b.132.2024.08.16.16.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2024 16:42:44 -0700 (PDT)
Message-ID: <78d36089-5a65-41b3-a9fa-102266736d9b@gmail.com>
Date: Sat, 17 Aug 2024 01:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Preemption support for A7XX
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
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <CAF6AEGsiu2OBbwQJO5nS55CAQtCvKebc59-mu2h0BDiu4C2gxg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGsiu2OBbwQJO5nS55CAQtCvKebc59-mu2h0BDiu4C2gxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 17 Aug 2024 19:28:20 +0000
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

On 8/16/24 7:47 PM, Rob Clark wrote:
> On Thu, Aug 15, 2024 at 11:27 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> This series implements preemption for A7XX targets, which allows the GPU to
>> switch to an higher priority ring when work is pushed to it, reducing latency
>> for high priority submissions.
>>
>> This series enables L1 preemption with skip_save_restore which requires
>> the following userspace patches to function:
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>
>> A flag is added to `msm_gem_submit` to only allow submissions from compatible
>> userspace to be preempted, therefore maintaining compatibility.
> 
> I guess this last para is from an earlier iteration of this series?
> Looks like instead you are making this a submitqueue flag (which is an
> approach that I prefer)
> 
> BR,
> -R
> 

That is correct, I got confused on which one I ended up going with when 
I wrote that.

Thanks for spotting it!

>> Some commits from this series are based on a previous series to enable
>> preemption on A6XX targets:
>>
>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>> Antonino Maniscalco (7):
>>        drm/msm: Fix bv_fence being used as bv_rptr
>>        drm/msm: Add submitqueue setup and close
>>        drm/msm: Add a `preempt_record_size` field
>>        drm/msm/A6xx: Implement preemption for A7XX targets
>>        drm/msm/A6xx: Add traces for preemption
>>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>        drm/msm/A6xx: Enable preemption for A7xx targets
>>
>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
>>   drivers/gpu/drm/msm/msm_gpu.h             |   7 +
>>   drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
>>   drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
>>   include/uapi/drm/msm_drm.h                |   5 +-
>>   11 files changed, 995 insertions(+), 16 deletions(-)
>> ---
>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>
>> Best regards,
>> --
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DF97BB7E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 13:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1B310E23C;
	Wed, 18 Sep 2024 11:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KxuBXi5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624EF10E1D0;
 Wed, 18 Sep 2024 11:20:15 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso802815066b.3; 
 Wed, 18 Sep 2024 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726658414; x=1727263214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yJsWJdrG2Kc8YkboHwPy2HHcJI536qKQX7JA14yR9wk=;
 b=KxuBXi5Y4UsxnK4/OYprpaLmZD8HG2O5c0IyyvMKsEMU/nMffvpzZDlz/AMx5c7FY9
 67WvuFYlcgQ5uyVFqKxYDiYYpw5gotlErvWO4JIuwCJYDxQEqH89hybWV+mpGIvpGuIz
 09sDYjhRAp+vzRVPtjnS/AIRZDXI39OIjd/NNHHwXGdxRKcDA/ZTv9qVBCuBg7DtwQv0
 8/I4YiRTcHl/e6HLLDLIGrT4BtJslRofwey+gsgfjeNXrHEwnK4VIwIQCO3cbT9B7DWi
 zT9wvlIdvWObLOnYNnze/PTU9YMfUJgMm+oOP+0HC7MHvkVJu1nWU3Dw7r3x6HsQ+8OX
 gErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726658414; x=1727263214;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yJsWJdrG2Kc8YkboHwPy2HHcJI536qKQX7JA14yR9wk=;
 b=QAF59EBlAzH30iCLzjN7fAS8a5YhJkBgrXHUGf4g9PZmEXyZk+z7hPgyvmfBZ4aSvf
 +x/kWsvbC6WPIJEOrhFe+qkpweplSm3mfkdrQ6T5atbSF5pwQXlVmIhXGGZ1H3BNlylR
 HljlCMWKnEHin/HAomvRrRq+HHE4LJp7zQ8ka301a6uKVXv2NXgBc1tikZ/JXD1/HgWF
 O23GvYe120bVnx6FhS2fliO4XQUg3Z+hhg3z1HlGKp9jQ244DcIb3+o7Nq0RckI5PR8D
 chAjfelS5MJKUSu+QUV7WaTUYUPivCkWWo2N1Y5I6bKfM0W0XVSGGjBF0yoXqit3iw0c
 ILCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjh4Ycp2otShkBSCSlj6Va+z3/9hEXuq9vz8H3jni4wipWopsoZuWCIo/VDXTGSsAQrMip3tBW08VT@lists.freedesktop.org,
 AJvYcCWG3+k8MpQldr+WJdbkDAt67c+DZ0FGw8iV2vqgCWtI3NpGWC0zDBf1BlIlsi93v0Yk+WgAo4Kg0aY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtYyqlwEZSQGq21UVDSvjiM2ruGlM0w0uccmTBerINwPY5bFw4
 oguaZksQ9WEjzGEuptZWE16NoY/d86pbznBkWBlelIhju05GU0p9
X-Google-Smtp-Source: AGHT+IF/8Y7rQzca7C7eeHtlv/vvB8DA92bCfXIe1Qckye3K8XNz1VVfg44bg9L/JO+PBLc3z+8nYA==
X-Received: by 2002:a17:907:d590:b0:a8d:470e:1793 with SMTP id
 a640c23a62f3a-a902950525emr2056039566b.21.1726658413115; 
 Wed, 18 Sep 2024 04:20:13 -0700 (PDT)
Received: from [192.168.1.17] (host-82-59-132-21.retail.telecomitalia.it.
 [82.59.132.21]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610968c4sm576863966b.4.2024.09.18.04.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2024 04:20:12 -0700 (PDT)
Message-ID: <19925e9c-90c4-406f-9160-7f1e8da9352d@gmail.com>
Date: Wed, 18 Sep 2024 13:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
To: neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
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

On 9/18/24 9:46 AM, Neil Armstrong wrote:
> Hi,
> 
> On 17/09/2024 13:14, Antonino Maniscalco wrote:
>> This series implements preemption for A7XX targets, which allows the 
>> GPU to
>> switch to an higher priority ring when work is pushed to it, reducing 
>> latency
>> for high priority submissions.
>>
>> This series enables L1 preemption with skip_save_restore which requires
>> the following userspace patches to function:
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>
>> A flag is added to `msm_submitqueue_create` to only allow submissions
>> from compatible userspace to be preempted, therefore maintaining
>> compatibility.
>>
>> Preemption is currently only enabled by default on A750, it can be
>> enabled on other targets through the `enable_preemption` module
>> parameter. This is because more testing is required on other targets.
>>
>> For testing on other HW it is sufficient to set that parameter to a
>> value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
>> allows to run any application as high priority therefore preempting
>> submissions from other applications.
>>
>> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
>> added in this series can be used to observe preemption's behavior as
>> well as measuring preemption latency.
>>
>> Some commits from this series are based on a previous series to enable
>> preemption on A6XX targets:
>>
>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>> Changes in v4:
>> - Added missing register in pwrup list
>> - Removed and rearrange barriers
>> - Renamed `skip_inline_wptr` to `restore_wptr`
>> - Track ctx seqno per ring
>> - Removed secure preempt context
>> - NOP out postamble to disable it instantly
>> - Only emit pwrup reglist once
>> - Document bv_rptr_addr
>> - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
>> - Set name on preempt record buffer
>> - Link to v3: 
>> https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com
>>
>> Changes in v3:
>> - Added documentation about preemption
>> - Use quirks to determine which target supports preemption
>> - Add a module parameter to force disabling or enabling preemption
>> - Clear postamble when profiling
>> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
>> - Make preemption records MAP_PRIV
>> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
>>    anymore
>> - Link to v2: 
>> https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
>>
>> Changes in v2:
>> - Added preept_record_size for X185 in PATCH 3/7
>> - Added patches to reset perf counters
>> - Dropped unused defines
>> - Dropped unused variable (fixes warning)
>> - Only enable preemption on a750
>> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
>> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
>> - Added Neil's Tested-By tags
>> - Added explanation for UAPI changes in commit message
>> - Link to v1: 
>> https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
>>
>> ---
>> Antonino Maniscalco (11):
>>        drm/msm: Fix bv_fence being used as bv_rptr
>>        drm/msm/A6XX: Track current_ctx_seqno per ring
>>        drm/msm: Add a `preempt_record_size` field
>>        drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
>>        drm/msm/A6xx: Implement preemption for A7XX targets
>>        drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
>>        drm/msm/A6xx: Use posamble to reset counters on preemption
>>        drm/msm/A6xx: Add traces for preemption
>>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>        drm/msm/A6xx: Enable preemption for A750
>>        Documentation: document adreno preemption
>>
>>   Documentation/gpu/msm-preemption.rst               |  98 +++++
>>   drivers/gpu/drm/msm/Makefile                       |   1 +
>>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
>>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
>>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 
>> ++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 
>> +++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
>>   drivers/gpu/drm/msm/msm_drv.c                      |   4 +
>>   drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
>>   drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
>>   drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
>>   drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
>>   drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
>>   .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
>>   include/uapi/drm/msm_drm.h                         |   5 +-
>>   20 files changed, 1117 insertions(+), 66 deletions(-)
>> ---
>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>
>> Best regards,
> 
> I've been running vulkan-cts 
> (1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 from Yocto)
> on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preemption in 
> default value
> and forced to 1, and I've seen no regression so far
> 
> On SM8550, I've seen a few:
> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* 
> Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for response
> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* 
> Unexpected message id 2743 on the response queue
> but it's unrelated to preempt
> 
> and on SM8450:
> platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout 
> waiting for GMU OOB set GPU_SET: 0x0
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] 
> *ERROR* 7.3.0.1: hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] 
> *ERROR* 7.3.0.1:     completed fence: 331235
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] 
> *ERROR* 7.3.0.1:     submitted fence: 331236
> adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 fence 
> 50de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 
> 0000000000000000/0000
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 
> 7.3.0.1: hangcheck recover!
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 
> 7.3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 
> 7.3.0.1: hangcheck recover!
> leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt support.
> 
> So you can also add:
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> 
> Thanks,
> Neil

Thanks for testing! Enabling for those targets then.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E115797DDEC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 18:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F410710E0B4;
	Sat, 21 Sep 2024 16:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qVJ7t6C9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9E410E0B4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 16:45:42 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37a413085cbso1298153f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726937140; x=1727541940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=11BcDD5IihY8sHkWDN4bZKYEHZDz5Md3HLgNTNoCcv8=;
 b=qVJ7t6C93R9u0ebxgndQj6fSSnTVxI0mCGy5Ri/FB6LXCtZcl+U4cbGCIl6cfq4KJ9
 lS+7LwwXdLRzhBWeF9Rr5dqV6dpNaMyaUxmLspX9anqrRmGHvnXTI1SymhNsi4nlq0Al
 /UrKEhlnpHkJNbVn8CyzbynViC+inI28UcShu05AjT2lvmggp3RzDPAzR6A2h7hD6jjn
 1z1dVcJ4dnXgZdtTry+ugACV0ROZTBnHTwYwVXNkX9QQVHxllUVwesI2pTQvyD/HEgef
 oAQiazMTMC2Aj0033SXDikDHrT1n+RTGTNaRwQBU7DtRGaFb0RsgXo0IfCt3CB8Tjk1l
 gELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726937140; x=1727541940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=11BcDD5IihY8sHkWDN4bZKYEHZDz5Md3HLgNTNoCcv8=;
 b=hNmNPjjxsVpl7nWz/7boO/HYeueaf26dm1s4UJ+5WoiA2TeruSkoPZ0HePRiQ66dH4
 HUiBokRKRFeXZ+G+xqLv1+BzvkNwPEMH00h2WJFoCTbpse+GoK8hqvh0Yj2tRnKdG3cj
 msGxylNQTlIManh5vVmihpcPysDC47L31DKot0ifjiYEQZZULmX5dn9g/S4TYeVvpIO5
 dp2mW56WFYOVk8FkwCvwexEJySObJUKQobRtA4LFAC+bi66p2dYL7sBx/naXWu1dwT5O
 WizQwMtsWnqlcO5kLKdUzRQnRxVuTcWMiUNW6t+Op+5vQEIsZ4EJuVqkhsZ9RlLBwLSU
 wUCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsB4b6a6/rNvGKRwfgZoWPOswi3rKJLMF2n4X0dqZ+3nVOqM//xmFcYmXK8Yapiek03S31P7ydS0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfg+8HGvZo6OUX6Ducv+nB5hr+JhuepvzUBjoEk2npCvtpQasT
 PozWFXYSaHbpgD9tgdtWWEXrcMCXF4LdulotEh2l75j+pA+ZZLtueMdFHgkSbcg=
X-Google-Smtp-Source: AGHT+IGJxFMVH30eOyDamIi8EJSOxXEIYis2TfZ8Ked9m32LuYuazdpkQsz44vOA8nV3YSdj2nd1Vw==
X-Received: by 2002:adf:f6cd:0:b0:374:d2a3:d213 with SMTP id
 ffacd0b85a97d-37a414f4b94mr3768151f8f.18.1726937140340; 
 Sat, 21 Sep 2024 09:45:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7001:d575:d71f:f3b?
 ([2a01:e0a:982:cbb0:7001:d575:d71f:f3b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37a47b58bfdsm3004926f8f.14.2024.09.21.09.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Sep 2024 09:45:39 -0700 (PDT)
Message-ID: <11cdd74f-683c-458e-bb18-8a0d8f8904e8@linaro.org>
Date: Sat, 21 Sep 2024 18:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
 <20240920170949.vp3642gghhey3pjb@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-GB
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20240920170949.vp3642gghhey3pjb@hu-akhilpo-hyd.qualcomm.com>
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

Le 20/09/2024 à 19:09, Akhil P Oommen a écrit :
> On Wed, Sep 18, 2024 at 09:46:33AM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On 17/09/2024 13:14, Antonino Maniscalco wrote:
>>> This series implements preemption for A7XX targets, which allows the GPU to
>>> switch to an higher priority ring when work is pushed to it, reducing latency
>>> for high priority submissions.
>>>
>>> This series enables L1 preemption with skip_save_restore which requires
>>> the following userspace patches to function:
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>>
>>> A flag is added to `msm_submitqueue_create` to only allow submissions
>>> from compatible userspace to be preempted, therefore maintaining
>>> compatibility.
>>>
>>> Preemption is currently only enabled by default on A750, it can be
>>> enabled on other targets through the `enable_preemption` module
>>> parameter. This is because more testing is required on other targets.
>>>
>>> For testing on other HW it is sufficient to set that parameter to a
>>> value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
>>> allows to run any application as high priority therefore preempting
>>> submissions from other applications.
>>>
>>> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
>>> added in this series can be used to observe preemption's behavior as
>>> well as measuring preemption latency.
>>>
>>> Some commits from this series are based on a previous series to enable
>>> preemption on A6XX targets:
>>>
>>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>>
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> ---
>>> Changes in v4:
>>> - Added missing register in pwrup list
>>> - Removed and rearrange barriers
>>> - Renamed `skip_inline_wptr` to `restore_wptr`
>>> - Track ctx seqno per ring
>>> - Removed secure preempt context
>>> - NOP out postamble to disable it instantly
>>> - Only emit pwrup reglist once
>>> - Document bv_rptr_addr
>>> - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
>>> - Set name on preempt record buffer
>>> - Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com
>>>
>>> Changes in v3:
>>> - Added documentation about preemption
>>> - Use quirks to determine which target supports preemption
>>> - Add a module parameter to force disabling or enabling preemption
>>> - Clear postamble when profiling
>>> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
>>> - Make preemption records MAP_PRIV
>>> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
>>>     anymore
>>> - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
>>>
>>> Changes in v2:
>>> - Added preept_record_size for X185 in PATCH 3/7
>>> - Added patches to reset perf counters
>>> - Dropped unused defines
>>> - Dropped unused variable (fixes warning)
>>> - Only enable preemption on a750
>>> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
>>> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
>>> - Added Neil's Tested-By tags
>>> - Added explanation for UAPI changes in commit message
>>> - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
>>>
>>> ---
>>> Antonino Maniscalco (11):
>>>         drm/msm: Fix bv_fence being used as bv_rptr
>>>         drm/msm/A6XX: Track current_ctx_seqno per ring
>>>         drm/msm: Add a `preempt_record_size` field
>>>         drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
>>>         drm/msm/A6xx: Implement preemption for A7XX targets
>>>         drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
>>>         drm/msm/A6xx: Use posamble to reset counters on preemption
>>>         drm/msm/A6xx: Add traces for preemption
>>>         drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>>         drm/msm/A6xx: Enable preemption for A750
>>>         Documentation: document adreno preemption
>>>
>>>    Documentation/gpu/msm-preemption.rst               |  98 +++++
>>>    drivers/gpu/drm/msm/Makefile                       |   1 +
>>>    drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++++-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
>>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++++++++++++++++++
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
>>>    drivers/gpu/drm/msm/msm_drv.c                      |   4 +
>>>    drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
>>>    drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
>>>    drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
>>>    drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
>>>    drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
>>>    drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
>>>    .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
>>>    include/uapi/drm/msm_drm.h                         |   5 +-
>>>    20 files changed, 1117 insertions(+), 66 deletions(-)
>>> ---
>>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>>
>>> Best regards,
>>
>> I've been running vulkan-cts (1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 from Yocto)
>> on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preemption in default value
>> and forced to 1, and I've seen no regression so far
>>
>> On SM8550, I've seen a few:
>> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for response
>> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* Unexpected message id 2743 on the response queue
>> but it's unrelated to preempt
>>
>> and on SM8450:
>> platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1: hangcheck detected gpu lockup rb 0!
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1:     completed fence: 331235
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1:     submitted fence: 331236
>> adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 fence 50de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 0000000000000000/0000
>> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: hangcheck recover!
>> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
>> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: hangcheck recover!
>> leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt support.
>>
>> So you can also add:
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>>
> 
> Niel,
> 
> On my x1e device, all submissions were somehow going into only a single
> ring, even the compositor's. Not sure why. So effectively preemption was
> not really exercised. I had to force one of the two benchmark I ran
> using the "highprio" mesa debug flag force submittions to ring 0.
> 
> If possible it is a good idea to check the new preemption traces to
> ensure preemption kicks in.

Sure I'll run the test again on a750 and check if preemption kicks in.

Neil

> 
> -Akhil
> 
>> Thanks,
>> Neil


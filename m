Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69518961A2A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 00:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5471010E2B4;
	Tue, 27 Aug 2024 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h+hN/Iv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4534410E2B4;
 Tue, 27 Aug 2024 22:56:34 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso63108a12.1; 
 Tue, 27 Aug 2024 15:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724799392; x=1725404192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SWpLb/X7aiYpuqlLVZErCPmL+o5dP4r/q3MqARrm0j0=;
 b=h+hN/Iv1NXYzw1rBtXjj5rEFC1CLzWmSpVQkkc0MG4sw/iOl5isY2qSNGBGe+5C/lA
 Om2Tei5rGLHNf68qCRtjsrsrr40n8oxzx08SiBdsmBbpR8iY7hecSDU+mexgI1ANNqN/
 VuOVyYVKpcdDxIzGLEk4CDBqizeTmHuCLdLwQR5sbdMWF2ot5+A/6UwrMSdU2gTvpUdw
 JNCmLW+w+Xk488XZawHsl5Ig64en0pfJhZ5b0vK7Ywhr5MnADtuZFzlojItaa/xF1zz3
 3hYH5pdwVbjU7LVEtCsgjHo6bMhXgzgI5rx7/Bx23pm1MFHZlz+wkbpmvK650V8gQ2BE
 1nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724799392; x=1725404192;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SWpLb/X7aiYpuqlLVZErCPmL+o5dP4r/q3MqARrm0j0=;
 b=ImtKcKg2Q8lTOU49k40qCOGMYwjvehG8/HHkoojapOUw7GbMTC2qqgvtkt658pxH4G
 oPfYykP5IynYOfkKTm+fSkXdXdGxETnPnrTG0jPGDIgtN8XtSwQXcF9pslgvZv7NejkI
 wbCXUrLqDHfiC4wCEtdf7vO9HSd0jjEcUy++hI9uNAGXSmqcVG6mkzExkZxiGXeNmEPA
 8MkjLJPQa/V+NSwvFZ8wkQbPDXoeFO/qbe1GkrvM7y2k4NLMBS5aa+cbwMpScLzcBygm
 eLZpLhDcmf05rTWnsxcHrMmLJd7wuAGtScl46MnDLcWX8BadyYmOew1GK1cGvt2zV3yy
 JReg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEuD7Vpy3/DK3p7n/F6f6e6+Q8qmA2KT0dOOhGdBgUwGjSDbCl7GE42XzMfLDys7rbb8YKhjV8rIkr@lists.freedesktop.org,
 AJvYcCWYSFmhWvniENAQkmA91Yw4vSkWNDuQwr3+Zj2xonUZB2i5+aDkCk35vLOWHcxXETO+uydfg6krdps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKrcxELKbvKpkUAeBSkWxHZoyzS5rv8IvxYyo8t3MnVVg+IgM/
 /AaiXAlCYZb49sSWAgvJOSJ4gf6EgB2/oQdJsLfbTobaf3B2x+9i
X-Google-Smtp-Source: AGHT+IGyusmuwUq9MhSHyFZ1rPPiCyQSa+NOTebzPV+FSP3Rx8Iuj24zHQmyjqeB8WasFTmGeO6Sdw==
X-Received: by 2002:a05:6402:2788:b0:5be:e9f8:9ba4 with SMTP id
 4fb4d7f45d1cf-5c212a3d350mr278525a12.4.1724799391770; 
 Tue, 27 Aug 2024 15:56:31 -0700 (PDT)
Received: from [192.168.1.15] (host-87-18-175-92.retail.telecomitalia.it.
 [87.18.175.92]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb4714bbsm1504015a12.64.2024.08.27.15.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 15:56:31 -0700 (PDT)
Message-ID: <57064da3-190c-4554-b085-d56daf979933@gmail.com>
Date: Wed, 28 Aug 2024 00:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Rob Clark <robdclark@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
 <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7E7FPJP-Ry64m257A7WrL3Q9jy8xMS9XpSBRNimBWzYUQ@mail.gmail.com>
 <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7F068sAMFgn=D7qBGM81qvYP4iW1+hXpfXVKtQGWeyTKQ@mail.gmail.com>
 <CACu1E7EueMnte9e+yLEtRE9WmG0J5bVMj59VbPfkDeB7OHbsAw@mail.gmail.com>
 <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com>
 <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
 <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
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

On 8/27/24 11:07 PM, Rob Clark wrote:
> On Tue, Aug 27, 2024 at 1:25 PM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
>>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
>>>> On Fri, Aug 23, 2024 at 10:21 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>>>
>>>>> On Thu, Aug 22, 2024 at 9:06 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
>>>>>>> On Mon, Aug 19, 2024 at 9:09 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>>>>>>>>> This patch implements preemption feature for A6xx targets, this allows
>>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>>>>>>>> hardware as such supports multiple levels of preemption granularities,
>>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>>>>>>>> such as draw-call level or a bin boundary level preemption. This patch
>>>>>>>>> enables the basic preemption level, with more fine grained preemption
>>>>>>>>> support to follow.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>>>>>>> ---
>>>>>>>>
>>>>>>>> No postamble packets which resets perfcounters? It is necessary. Also, I
>>>>>>>> think we should disable preemption during profiling like we disable slumber.
>>>>>>>>
>>>>>>>> -Akhil.
>>>>>>>
>>>>>>> I don't see anything in kgsl which disables preemption during
>>>>>>> profiling. It disables resetting perfcounters when doing system-wide
>>>>>>> profiling, like freedreno, and in that case I assume preempting is
>>>>>>> fine because the system profiler has a complete view of everything and
>>>>>>> should "see" preemptions through the traces. For something like
>>>>>>> VK_KHR_performance_query I suppose we'd want to disable preemption
>>>>>>> because we disable saving/restoring perf counters, but that has to
>>>>>>> happen in userspace because the kernel doesn't know what userspace
>>>>>>> does.
>>>>>>>
>>>>>>
>>>>>> KGSL does some sort of arbitration of perfcounter configurations and
>>>>>> adds the select/enablement reg configuration as part of dynamic
>>>>>> power up register list which we are not doing here. Is this something
>>>>>> you are taking care of from userspace via preamble?
>>>>>>
>>>>>> -Akhil
>>>>>
>>>>> I don't think we have to take care of that in userspace, because Mesa
>>>>> will always configure the counter registers before reading them in the
>>>>> same submission, and if it gets preempted in the meantime then we're
>>>>> toast anyways (due to not saving/restoring perf counters). kgsl sets
>>>>> them from userspace, which is why it has to do something to set them
>>>>
>>>> Sorry, should be "kgsl sets them from the kernel".
>>>>
>>>>> after IFPC slumber or a context switch when the HW state is gone.
>>>>> Also, because the upstream approach doesn't play nicely with system
>>>>> profilers like perfetto, VK_KHR_performance_query is hidden by default
>>>>> behind a debug flag in turnip. So there's already an element of "this
>>>>> is unsupported, you have to know what you're doing to use it."
>>>
>>> But when you have composition on GPU enabled, there will be very frequent
>>> preemption. And I don't know how usable profiling tools will be in that
>>> case unless you disable preemption with a Mesa debug flag. But for that
>>> to work, all existing submitqueues should be destroyed and recreated.
>>>
>>> So I was thinking that we can use the sysprof propertry to force L0
>>> preemption from kernel.
>>>
>>> -Akhil.
>>>
>>
>> Right but when using a system profiler I imagined the expectation would
>> be to be able to understand how applications and compositor interact. An
>> use case could be measuring latency and understanding what contributes
>> to it. That is actually the main reason I added traces for preemption.
>> Disabling preemption would make it less useful for this type of
>> analysis. Did you have an use case in mind for a system profiler that
>> would benefit from disabling preemption and that is not covered by
>> VK_KHR_performance_query (or equivalent GL ext)?
> 
> I would think that we want to generate an event, with GPU timestamp
> (ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
> could display multiple GPU timelines and where the switch from one to
> the other happens.
> 
> I'm a bit curious how this is handled on android, with AGI/etc.. I
> don't see any support in perfetto for this.
> 
> BR,
> -R
> 
>> Best regards,
>> --
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Looking at KGSL they seem to use ftrace and I don't see it doing 
anything to get a timestamp from some GPU timer, really not sure how 
that would be put in a gpu timeline.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


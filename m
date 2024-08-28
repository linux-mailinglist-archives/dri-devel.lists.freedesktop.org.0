Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAF6963129
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 21:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D36B10E5C2;
	Wed, 28 Aug 2024 19:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DJsUItu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2467C10E004;
 Wed, 28 Aug 2024 19:46:56 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so655126366b.0; 
 Wed, 28 Aug 2024 12:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724874414; x=1725479214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cD7nXVNIH/PHGLLjSIJQT2JX0QXEmSqhiG+NCi9Wrzk=;
 b=DJsUItu5Pmfm9TIVvPMRfDT0Waogkzh7UFdyTyCnlIsT1cxx9mJ5TBmcdirTr6+IEI
 CwNGuUV1F3gyUBXo2Ikdeo8J2u3o/BffjhQ8QiII9PkX+vqrY3c0TWcHO2kXGFcZWbXl
 wVLnOJddJU7g4ny8RHo/ElJXoYSZ1vZmkOZBmbwI0Jd+KS78BELr7G0ZVhTOUl9A55WQ
 Jl1Cn0SfrQqwv3PC5GICjuXKfZWg3VRhUG/w3LyZ6Ypq8T9ZlwDZCGhcfKY5t93sWPUi
 pG3M2yXdFjBOVGrFj3mqqIC/BOigItYMVWeVr97ImKbFgeChA5n+G+YStn1aSheq5++d
 PUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724874414; x=1725479214;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cD7nXVNIH/PHGLLjSIJQT2JX0QXEmSqhiG+NCi9Wrzk=;
 b=W3xsF0SsnXF0PZrdTK9p8yp52n7I7QNB9RAPOdLKvUz8AGHSswVKqc79bkatjL/a16
 Yhn/UWrIrH7rjZd4JX3JVg+QVrnJC5ISoZHWizaf/9sCW6GQKG17yi4BOM4cQP1mVcdM
 SaDOilOeYtqHqeo+wnS6s1fkE1g9b4c8llvxSiSU6+1t8Gj3PmukAJeApoywpsUcKysr
 HK4pkF2BqylHGwvcxuqPhyyohuSZ26Q2cQVNDMQVrs/IQEMXJiHodQ3gwoFRaok7sKkp
 tznsJP3isvBe1Y1MuHGZyM+o8hjbiGUHuMX8Qt5mN1JLJs4CtxdKERHgwAnVbddYZg15
 fxag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz/1IyRDOo+wmWk+MqF7JKpH/fUW0ZhtglVPDCwsZhbDcozSVAwEOX7gpsXWDB3LqfjU7upig6a/A=@lists.freedesktop.org,
 AJvYcCWw/rZPZISV4CnlSQM04jIUZ8shp+wQgusxRfA3Abd4vreKyEP6q9tXIS5vGvYLidEaBxSlFH+ifCJF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaR3QQ4+TUaMX8LN8Qw5JtECOcDdpIW2TV6Mqi6CQao+FU6V0T
 r1bU2bhWxGlz42TsHClq3Rk4hUX5rjN7yIGtZMxfAk3Aqn5iVFV5
X-Google-Smtp-Source: AGHT+IFHqUTDbsiy0KKd7d50tdZ3WO6P/LGDWj5MgTIjOlHaI3NCNO00uKJ0HUnPf8rmCkAsB1rt1g==
X-Received: by 2002:a17:907:9482:b0:a86:700f:93c1 with SMTP id
 a640c23a62f3a-a897face4cfmr38236766b.60.1724874413867; 
 Wed, 28 Aug 2024 12:46:53 -0700 (PDT)
Received: from [192.168.1.14] (host-95-249-206-143.retail.telecomitalia.it.
 [95.249.206.143]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582ded7sm277734266b.120.2024.08.28.12.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 12:46:53 -0700 (PDT)
Message-ID: <f3bc0b3f-d35b-4cf8-ace8-2f4a6e387e13@gmail.com>
Date: Wed, 28 Aug 2024 21:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
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
References: <CACu1E7E7FPJP-Ry64m257A7WrL3Q9jy8xMS9XpSBRNimBWzYUQ@mail.gmail.com>
 <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7F068sAMFgn=D7qBGM81qvYP4iW1+hXpfXVKtQGWeyTKQ@mail.gmail.com>
 <CACu1E7EueMnte9e+yLEtRE9WmG0J5bVMj59VbPfkDeB7OHbsAw@mail.gmail.com>
 <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com>
 <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
 <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
 <57064da3-190c-4554-b085-d56daf979933@gmail.com>
 <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
 <CAF6AEGuBMiQft4SCrf=xTQ76q8=+-OS3SEKMmw7TGT5rb=Sygw@mail.gmail.com>
 <20240828192304.dojqyvbnqzhy63na@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240828192304.dojqyvbnqzhy63na@hu-akhilpo-hyd.qualcomm.com>
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

On 8/28/24 9:23 PM, Akhil P Oommen wrote:
> On Wed, Aug 28, 2024 at 06:46:37AM -0700, Rob Clark wrote:
>> On Wed, Aug 28, 2024 at 6:42 AM Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Tue, Aug 27, 2024 at 3:56 PM Antonino Maniscalco
>>> <antomani103@gmail.com> wrote:
>>>>
>>>> On 8/27/24 11:07 PM, Rob Clark wrote:
>>>>> On Tue, Aug 27, 2024 at 1:25 PM Antonino Maniscalco
>>>>> <antomani103@gmail.com> wrote:
>>>>>>
>>>>>> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
>>>>>>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
>>>>>>>> On Fri, Aug 23, 2024 at 10:21 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> On Thu, Aug 22, 2024 at 9:06 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
>>>>>>>>>>> On Mon, Aug 19, 2024 at 9:09 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>>>>>>>>>>>>> This patch implements preemption feature for A6xx targets, this allows
>>>>>>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>>>>>>>>>>>> hardware as such supports multiple levels of preemption granularities,
>>>>>>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>>>>>>>>>>>> such as draw-call level or a bin boundary level preemption. This patch
>>>>>>>>>>>>> enables the basic preemption level, with more fine grained preemption
>>>>>>>>>>>>> support to follow.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>>>>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>
>>>>>>>>>>>> No postamble packets which resets perfcounters? It is necessary. Also, I
>>>>>>>>>>>> think we should disable preemption during profiling like we disable slumber.
>>>>>>>>>>>>
>>>>>>>>>>>> -Akhil.
>>>>>>>>>>>
>>>>>>>>>>> I don't see anything in kgsl which disables preemption during
>>>>>>>>>>> profiling. It disables resetting perfcounters when doing system-wide
>>>>>>>>>>> profiling, like freedreno, and in that case I assume preempting is
>>>>>>>>>>> fine because the system profiler has a complete view of everything and
>>>>>>>>>>> should "see" preemptions through the traces. For something like
>>>>>>>>>>> VK_KHR_performance_query I suppose we'd want to disable preemption
>>>>>>>>>>> because we disable saving/restoring perf counters, but that has to
>>>>>>>>>>> happen in userspace because the kernel doesn't know what userspace
>>>>>>>>>>> does.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> KGSL does some sort of arbitration of perfcounter configurations and
>>>>>>>>>> adds the select/enablement reg configuration as part of dynamic
>>>>>>>>>> power up register list which we are not doing here. Is this something
>>>>>>>>>> you are taking care of from userspace via preamble?
>>>>>>>>>>
>>>>>>>>>> -Akhil
>>>>>>>>>
>>>>>>>>> I don't think we have to take care of that in userspace, because Mesa
>>>>>>>>> will always configure the counter registers before reading them in the
>>>>>>>>> same submission, and if it gets preempted in the meantime then we're
>>>>>>>>> toast anyways (due to not saving/restoring perf counters). kgsl sets
>>>>>>>>> them from userspace, which is why it has to do something to set them
>>>>>>>>
>>>>>>>> Sorry, should be "kgsl sets them from the kernel".
>>>>>>>>
>>>>>>>>> after IFPC slumber or a context switch when the HW state is gone.
>>>>>>>>> Also, because the upstream approach doesn't play nicely with system
>>>>>>>>> profilers like perfetto, VK_KHR_performance_query is hidden by default
>>>>>>>>> behind a debug flag in turnip. So there's already an element of "this
>>>>>>>>> is unsupported, you have to know what you're doing to use it."
>>>>>>>
>>>>>>> But when you have composition on GPU enabled, there will be very frequent
>>>>>>> preemption. And I don't know how usable profiling tools will be in that
>>>>>>> case unless you disable preemption with a Mesa debug flag. But for that
>>>>>>> to work, all existing submitqueues should be destroyed and recreated.
>>>>>>>
>>>>>>> So I was thinking that we can use the sysprof propertry to force L0
>>>>>>> preemption from kernel.
>>>>>>>
>>>>>>> -Akhil.
>>>>>>>
>>>>>>
>>>>>> Right but when using a system profiler I imagined the expectation would
>>>>>> be to be able to understand how applications and compositor interact. An
>>>>>> use case could be measuring latency and understanding what contributes
>>>>>> to it. That is actually the main reason I added traces for preemption.
>>>>>> Disabling preemption would make it less useful for this type of
>>>>>> analysis. Did you have an use case in mind for a system profiler that
>>>>>> would benefit from disabling preemption and that is not covered by
>>>>>> VK_KHR_performance_query (or equivalent GL ext)?
> 
> Please consider this as a friendly suggestion based on Conner's clarification.
> Not a blocker. TBH, I don't have clairty on the profiling story in Mesa!
> 

Thanks, your input was appreciated :) I just wanted to make sure we 
where on the same page. So considering this, I will be able to send v2 soon.

>>>>>
>>>>> I would think that we want to generate an event, with GPU timestamp
>>>>> (ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
>>>>> could display multiple GPU timelines and where the switch from one to
>>>>> the other happens.
>>>>>
>>>>> I'm a bit curious how this is handled on android, with AGI/etc.. I
>>>>> don't see any support in perfetto for this.
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> Best regards,
>>>>>> --
>>>>>> Antonino Maniscalco <antomani103@gmail.com>
>>>>>>
>>>>
>>>> Looking at KGSL they seem to use ftrace and I don't see it doing
>>>> anything to get a timestamp from some GPU timer, really not sure how
>>>> that would be put in a gpu timeline.
> 
> Yeah, we usually rely on ftraces which is good enough to measure preemption
> latency.
> 
> -Akhil.
> 

Thanks for confirming! The traces I added are pretty similar to KGSL's 
so it should be suitable for serving the same purpose.

>>>
>>> I suspect it would require some work on perfetto trace-processor.  It
>>> can ingest ftrace events (but those would end up being something
>>> driver specific).  Maybe with u_trace and some tracepoints in the
>>> 'ambles something could be done that would be more driver agnostic
>>> (but idk if that would work for gpu's where preemption happens more
>>> autonomously in the fw)
>>
>> btw how to handle tracing preemption probably shouldn't hold up
>> sending the next iteration of this series.  There isn't that much more
>> time to get this in v6.12, and I think better visualization of
>> preemption is going to take some work outside of the kernel.
>>
>> BR,
>> -R

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


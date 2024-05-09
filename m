Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3F8C0DA2
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 11:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C1B10E86B;
	Thu,  9 May 2024 09:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ijoSrCmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D8610E5A1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 09:39:59 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41fd5dc0508so2067235e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1715247597; x=1715852397;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MwiwwNdKg2Ic82Yv97muzU/CMbsfDzNfh2F7gfIB8tw=;
 b=ijoSrCmT5x2/JFKocQEq9j0DFacg8dIiTN7Hc5tqqFs6Px/zOMLjFfd62B8H/OmhUj
 PpuY+bCiXWv5IHIiipt1FbAWJKDfvev6bCy7zln7ANtsR9nCgqf6b5Agm9OgqPJrNXzC
 yRVldISmOFargWUYElFTm6/rXnn4TnSXRJUVUXjIFzpUnWqv4Xhgri6ik2R5vXOyPzJg
 nGoZtypXV/XdVQBswhJeaE0G70eN8ho+LxLODiCvjVZ48QOUvLDgk64ZetE0r8bgYQkA
 /ZnQvK2zEP3Gu8h3zw2viRRdBZPX8Aa9AOFfP65yI7a6YqfqBg0B7kyjAHw02VjNUhAt
 GV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715247597; x=1715852397;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MwiwwNdKg2Ic82Yv97muzU/CMbsfDzNfh2F7gfIB8tw=;
 b=LaeUkmkGLf0JwZSsQ5NMQUiW90j7hLcs7wZWK3ErH5JWtbQFVPdHwAGodwg1ikQjWx
 mpjAQnV/k1RM7poHSgyRJFE9cgb9kK+2ZJKbGPb3VPEEZ6Yt9BGrsrAsznyzl7hyMcgS
 YTd8ZnCCSAUXvpR89c6AtRm7s7Jyt8EaX1q6kfhcncA0pHxp29ZKN68BL8CkQx0RbSm3
 kp78uBwGE8PI5YDXrR9520j/ylk/jPf/gSbKtYjF1ma0BxgpzWyw0inCD2+6T2Hpi7Rg
 l1MNr0DuF+ChlMvKZ9zSVOR05OwUgK1g3GE0OyXlNGIW3jX5mqytBdz+Lcs16otwVeg0
 f8zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR3ut2HojB0MjmbGLG2B2mPwmzq2Pl6loH1Ww2+H4Q1paExttYj1c7TbnEfDlzuczvd2SdaK6tTuElQj4q5ofMKIk7dQU38+6pwEog2R6h
X-Gm-Message-State: AOJu0YyzQNL96t8YawT1Ze1sxVRGaJI3JLr89caOiIDWoak8FXEZNbA9
 EYo6esuxGb98gsk+QKZQnuOD+M0C3/OebEMXXCPfHfWrYlqXUsOw9n9K+iWDMWA=
X-Google-Smtp-Source: AGHT+IGVg0t2RMtmzRkFuSx+80jxyWrMV9RecVeYZ30/FskpqWeV4hHmFAK/FswH73aZj3/9MPmA8w==
X-Received: by 2002:a05:600c:35c1:b0:416:536b:683a with SMTP id
 5b1f17b1804b1-41f719d5dccmr42242825e9.32.1715247596959; 
 Thu, 09 May 2024 02:39:56 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8969f0sm1220025f8f.28.2024.05.09.02.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 02:39:56 -0700 (PDT)
Message-ID: <99781bf8-bd3e-4069-9712-4edb0a52ae42@ursulin.net>
Date: Thu, 9 May 2024 10:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/xe/client: Print runtime to fdinfo
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-7-lucas.demarchi@intel.com>
 <ed28cb4e-a417-4255-b034-778dbfdaf6ec@ursulin.net>
 <xwp77yi7y3e3f6eyqf3qqeawsv3nh4db4vwmok3pccdddnimce@n7rts73arupp>
 <88d6eeee-fa6f-4e5e-9304-22df8fb0f63c@ursulin.net>
 <h2xkygfdjfmjzb7i7i6vec7o6zbslfdrjdm6lutpn4plicggeg@h6cyouletta4>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <h2xkygfdjfmjzb7i7i6vec7o6zbslfdrjdm6lutpn4plicggeg@h6cyouletta4>
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


On 08/05/2024 21:53, Lucas De Marchi wrote:
> On Wed, May 08, 2024 at 09:23:17AM GMT, Tvrtko Ursulin wrote:
>>
>> On 07/05/2024 22:35, Lucas De Marchi wrote:
>>> On Fri, Apr 26, 2024 at 11:47:37AM GMT, Tvrtko Ursulin wrote:
>>>>
>>>> On 24/04/2024 00:56, Lucas De Marchi wrote:
>>>>> Print the accumulated runtime for client when printing fdinfo.
>>>>> Each time a query is done it first does 2 things:
>>>>>
>>>>> 1) loop through all the exec queues for the current client and
>>>>>    accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
>>>>>    that, being read from the context image.
>>>>>
>>>>> 2) Read a "GPU timestamp" that can be used for considering "how 
>>>>> much GPU
>>>>>    time has passed" and that has the same unit/refclock as the one
>>>>>    recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>>>>>
>>>>> Since for all current platforms RING_TIMESTAMP follows the same
>>>>> refclock, just read it once, using any first engine.
>>>>>
>>>>> This is exported to userspace as 2 numbers in fdinfo:
>>>>>
>>>>>     drm-cycles-<class>: <RUNTIME>
>>>>>     drm-total-cycles-<class>: <TIMESTAMP>
>>>>>
>>>>> Userspace is expected to collect at least 2 samples, which allows to
>>>>> know the client engine busyness as per:
>>>>>
>>>>>             RUNTIME1 - RUNTIME0
>>>>>     busyness = ---------------------
>>>>>               T1 - T0
>>>>>
>>>>> Another thing to point out is that it's expected that userspace will
>>>>> read any 2 samples every few seconds.  Given the update frequency 
>>>>> of the
>>>>> counters involved and that CTX_TIMESTAMP is 32-bits, the counter for
>>>>> each exec_queue can wrap around (assuming 100% utilization) after 
>>>>> ~200s.
>>>>> The wraparound is not perceived by userspace since it's just 
>>>>> accumulated
>>>>> for all the exec_queues in a 64-bit counter), but the measurement will
>>>>> not be accurate if the samples are too far apart.
>>>>>
>>>>> This could be mitigated by adding a workqueue to accumulate the 
>>>>> counters
>>>>> every so often, but it's additional complexity for something that is
>>>>> done already by userspace every few seconds in tools like gputop (from
>>>>> igt), htop, nvtop, etc with none of them really defaulting to 1 sample
>>>>> per minute or more.
>>>>>
>>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> ---
>>>>>  Documentation/gpu/drm-usage-stats.rst       |  16 ++-
>>>>>  Documentation/gpu/xe/index.rst              |   1 +
>>>>>  Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
>>>>>  drivers/gpu/drm/xe/xe_drm_client.c          | 138 
>>>>> +++++++++++++++++++-
>>>>>  4 files changed, 162 insertions(+), 3 deletions(-)
>>>>>  create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
>>>>>
>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>>>>> b/Documentation/gpu/drm-usage-stats.rst
>>>>> index 6dc299343b48..421766289b78 100644
>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>>> @@ -112,6 +112,17 @@ larger value within a reasonable period. Upon 
>>>>> observing a value lower than what
>>>>>  was previously read, userspace is expected to stay with that 
>>>>> larger previous
>>>>>  value until a monotonic update is seen.
>>>>> +- drm-total-cycles-<keystr>: <uint>
>>>>> +
>>>>> +Engine identifier string must be the same as the one specified in the
>>>>> +drm-cycles-<keystr> tag and shall contain the total number cycles 
>>>>> for the given
>>>>> +engine.
>>>>> +
>>>>> +This is a timestamp in GPU unspecified unit that matches the 
>>>>> update rate
>>>>> +of drm-cycles-<keystr>. For drivers that implement this interface, 
>>>>> the engine
>>>>> +utilization can be calculated entirely on the GPU clock domain, 
>>>>> without
>>>>> +considering the CPU sleep time between 2 samples.
>>>>
>>>> Two opens.
>>>>
>>>> 1)
>>>> Do we need to explicity document that drm-total-cycles and 
>>>> drm-maxfreq are mutually exclusive?
>>>
>>> so userspace has a fallback mechanism to calculate utilization depending
>>> on what keys are available?
>>
>> No, to document all three at once do not make sense. Or at least are 
>> not expected. Or you envisage someone might legitimately emit all 
>> three? I don't see what would be the semantics. When we have 
>> cycles+maxfreq the latter is in Hz. And when we have cycles+total then 
>> it is unitless. All three?
> 
> I don't follow what you mean here. *cycles* is actually a unit.
> 
> The engine spent 10 cycles running this context (drm-cycles). In the
> same period there were 100 cycles available (drm-total-cycles). Current
> frequency is X MHz. Max frequency is Y MHz. For me all of them make
> sense if one wants to mix them together. For xe it doesn't make sense
> because the counter backing drm-cycles and drm-total-cycles is unrelated
> to the engine frequency.
> 
> I can add something in the doc that we do not expected to see all of them
> together until we see a usecase. Each driver may implement a subset.

I still don't quite see how a combination of cycles, total cycles and 
maxfreq makes sense together. It would require a driver where cycle 
period is equal to 1 / maxfreq, which also means total-cycles would be 
equal to maxfreq, making one of them redundant. So both for drivers like 
xe where cycle period is unrelated to maxfreq (or even the fataly 
misguided curfreq) it doens't make sense, and for driver like above is 
not needed. What use case am I missing?

We need to document this properly so userspace knows how to do the right 
thing depending on what keys they discover.

>>>> 2)
>>>> Should drm-total-cycles for now be documents as driver specific?
>>>
>>> you mean to call it xe-total-cycles?
>>
>> Yes but it is not an ask, just an open.
> 
> Ok, my opinion is that we shouldn't. Just like we have drm-cycles today
> implemented by some drivers, but not all. I'd consider the drm-curfreq,
> not documented in the drm layer as something to be fixed or migrated to
> a driver-only interface (probably not possible anymore as it'd break the
> uapi).  Problem I see with turning it into xe-total-cycles, is that the
> moment another driver decide to implement they will either have to use
> xe- prefix or xe will need to start publishing both keys.
> As said above, I can document that it's not expected to use both total
> and maxfreq as it's currently the case.

I see your point. If as an alternative solution we would say it is okay 
to prefix driver specific keys drm-? It would legitimise panfrost 
drm-curfreq. Downside would be anyone adding new common keys would have 
to inspect all driver specific docs, and worse, the actual source since 
people do forget to document things.

Even having drm-cycles + xe-total-cycles wouldn't be spec compliant. 
Okay.. drm-total-cycles- sounds like the least bad solution. Luckily it 
feels a clean concept with some chance of reuse.

Regards,

Tvrtko

>>>> I have added some more poeple in the cc who were involved with 
>>>> driver fdinfo implementations if they will have an opinion.
>>>>
>>>> I would say potentially yes, and promote it to common if more than 
>>>> one driver would use it.
>>>>
>>>> For instance I see panfrost has the driver specific drm-curfreq 
>>>> (although isn't documenting it fully in panfrost.rst). And I have to 
>>>> say it is somewhat questionable to expose the current frequency per 
>>>> fdinfo per engine but not my call.
>>>
>>> aren't all of Documentation/gpu/drm-usage-stats.rst optional that
>>> driver may or may not implement? When you say driver-specific I'd think
>>> more of the ones not using <drm> as prefix as e.g. amd-*.
>>>
>>> I think drm-cycles + drm-total-cycles is just an alternative
>>> implementation for engine utilization. Like drm-cycles + drm-maxfreq
>>> already is an alternative to drm-engine and is not implemented by e.g.
>>> amdgpu/i915.
>>>
>>> I will submit a new version of the entire patch series to get the ball
>>> rolling, but let's keep this open for now.
>>>
>>> <...>
>>>
>>>>> +static void show_runtime(struct drm_printer *p, struct drm_file 
>>>>> *file)
>>>>> +{
>>>>> +    struct xe_file *xef = file->driver_priv;
>>>>> +    struct xe_device *xe = xef->xe;
>>>>> +    struct xe_gt *gt;
>>>>> +    struct xe_hw_engine *hwe;
>>>>> +    struct xe_exec_queue *q;
>>>>> +    unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] 
>>>>> = { };
>>>>> +    u64 gpu_timestamp, engine_mask = 0;
>>>>> +    bool gpu_stamp = false;
>>>>> +
>>>>> +    xe_pm_runtime_get(xe);
>>>>> +
>>>>> +    /* Accumulate all the exec queues from this client */
>>>>> +    mutex_lock(&xef->exec_queue.lock);
>>>>> +    xa_for_each(&xef->exec_queue.xa, i, q)
>>>>> +        xe_exec_queue_update_runtime(q);
>>>>> +    mutex_unlock(&xef->exec_queue.lock);
>>>>> +
>>>>> +
>>>>> +    /* Calculate capacity of each engine class */
>>>>> +    BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>>>>> +    for_each_gt(gt, xe, id_gt)
>>>>> +        engine_mask |= gt->info.engine_mask;
>>>>> +    for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>>>>> +        capacity[i] = hweight64(engine_mask & class_to_mask[i]);
>>>>
>>>> FWIW the above two loops are static so could store capacity in 
>>>> struct xe_device.
>>>
>>> yes, but just creating a cache in xe of something derived from gt is not
>>> something to consider lightly. Particularly considering the small number
>>> of xe->info.gt_count we have. For something that runs only when someone
>>> cat the fdinfo, this doesn't seem terrible.
>>>
>>>>
>>>>> +
>>>>> +    /*
>>>>> +     * Iterate over all engines, printing the accumulated
>>>>> +     * runtime for this client, per engine class
>>>>> +     */
>>>>> +    for_each_gt(gt, xe, id_gt) {
>>>>> +        xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>> +        for_each_hw_engine(hwe, gt, id_hwe) {
>>>>> +            const char *class_name;
>>>>> +
>>>>> +            if (!capacity[hwe->class])
>>>>> +                continue;
>>>>> +
>>>>> +            /*
>>>>> +             * Use any (first) engine to have a timestamp to be 
>>>>> used every
>>>>> +             * time
>>>>> +             */
>>>>> +            if (!gpu_stamp) {
>>>>> +                gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>>> +                gpu_stamp = true;
>>>>> +            }
>>>>> +
>>>>> +            class_name = xe_hw_engine_class_to_str(hwe->class);
>>>>> +
>>>>> +            drm_printf(p, "drm-cycles-%s:\t%llu\n",
>>>>> +                   class_name, xef->runtime[hwe->class]);
>>>>> +            drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>>>>> +                   class_name, gpu_timestamp);
>>>>> +
>>>>> +            if (capacity[hwe->class] > 1)
>>>>> +                drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>>>> +                       class_name, capacity[hwe->class]);
>>>>> +
>>>>> +            /* engine class already handled, skip next iterations */
>>>>> +            capacity[hwe->class] = 0;
>>>>> +        }
>>>>> +        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>> +    }
>>>>
>>>> More FWIW and AFAICT, could just walk the "list" of classes instead of
>>>
>>> xe_force_wake_get() is per gt, so the alternative would be... loop
>>> through the gts to get all forcewakes, loop through all engine 
>>> classes, loop
>>> again through all gts to put the forcewake. And we also need to consider
>>> that an engine class may not be available in all GTs... example:
>>> vcs/vecs in MTL and later, so we need to track it globally across GTs
>>> anyway.
>>
>> Forcewake is only needed once for the gpu_timestamp, no? At least I 
>> don't see any other potential hardware access in the loop. Hence I 
>> thought if you could have a known engine to get the timestamp outside 
>> the loop, you could then run a flat loop (over classes) avoiding the 
>> per gt fw dance. Your choice ofc.
> 
> makes sense... I will try this and run some tests.
> 
> thanks
> Lucas De Marchi

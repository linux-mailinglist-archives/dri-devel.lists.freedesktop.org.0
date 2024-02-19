Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182EB85A0B0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D7310E18C;
	Mon, 19 Feb 2024 10:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="awTSjoob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42D710E18C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708337658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWhBL3GnicAi8zUYnqUkP4tf2fRdXGjK1E7BLd7S6rA=;
 b=awTSjoobIo0N1lN7z7r6bf12IPFPBaw5d8BDIjBfrPG6V5gdvkF4I2xJ6zWwHhBIx1ek8V
 pFdBqLvXv6fomMYiyxMB8QW6hb7J1uB9LLB0C/B3eWZh3g+djK6und7YhZfo1Mc0CABz7O
 6IDX4p+m6peQZwEMP19c9CTfl1R8ZNI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-4hj4AiniOryig3LCmR0Njg-1; Mon, 19 Feb 2024 05:14:14 -0500
X-MC-Unique: 4hj4AiniOryig3LCmR0Njg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a357c92f241so128257166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 02:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708337653; x=1708942453;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WWhBL3GnicAi8zUYnqUkP4tf2fRdXGjK1E7BLd7S6rA=;
 b=SFVSlQiWLRJ5OAV0FduG6qgc6whLhcCi57sNsyIy7mDrjb4O57jwymrng63SB0VAdF
 YzHSm/j557JQesXpaugUGWfk42SaDQj+mlSI5DgOcXJiGFu6IK0tdu/5Rhj61l10QhFe
 O+CwKcfcGGGlk7GbVv96Qko7gy6NxM4AGBhABDYrlzAhFrwGxYIZfcqlX4MvBq3MTLjs
 kphIub4TJ4iSPbRnyNk5R/j8w6oGR00rRvKmsAxRxLG/Mdm2JOMqC8zxRSaXvIvippMr
 tJvXSyeB4plKRMnyg8B5GHknK5/Gikody1OvA6otiR2adSRwTCGD2U5s9BO7rNR5LwKU
 dKhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGpJGniriiQ9tBVnVneyciNsZ/RTcN2q7yflFAfrB3R4a/xXe/kJMGGZTBso+HhIVv/Ll67Hjn9A97zdI/epeUZuIC47LWdx2oanwP/uyK
X-Gm-Message-State: AOJu0Yykc7Fg7QdmYegS3d3T4F6/fMutr6fbp9EfykoolnjRyPMRmQOK
 gSlqHt5u1VMnWsGUPPKt2cG5KLiJajMTNycyl5FN2HcG8yf8BtTn/wpvoRD+E/Exvg1NBHYaiJp
 kKtFKdY8cP4WP+eCMdE7YHNUD7Fib8Fuv6zomKIzXqbfkP/+2zud9sdZ/a1fPR20lNA==
X-Received: by 2002:a17:906:fa85:b0:a3e:6038:42b8 with SMTP id
 lt5-20020a170906fa8500b00a3e603842b8mr2500505ejb.39.1708337652874; 
 Mon, 19 Feb 2024 02:14:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeznp9SkMqxTmW+aPhtsfANIITGJfAY2km3OvJR4M4+kYmp0p4SBpx57S+1sm4iFRc3wDgTQ==
X-Received: by 2002:a17:906:fa85:b0:a3e:6038:42b8 with SMTP id
 lt5-20020a170906fa8500b00a3e603842b8mr2500485ejb.39.1708337652482; 
 Mon, 19 Feb 2024 02:14:12 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 cu14-20020a170906ba8e00b00a3e553fe352sm1769006ejd.133.2024.02.19.02.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:14:12 -0800 (PST)
Message-ID: <4a1dad75-b81c-4807-b464-06f8073b7c9f@redhat.com>
Date: Mon, 19 Feb 2024 11:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
 <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
 <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
 <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
 <a2174cc2-ea65-4bcf-a112-f60f26b7213c@redhat.com>
 <ZcZ0UXfbKYNhhBiC@phenom.ffwll.local>
 <c13596a5-f672-46e4-8ca6-4f1e449f3267@redhat.com>
 <Zc-QO3vFRIUKSIhT@phenom.ffwll.local>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Zc-QO3vFRIUKSIhT@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 2/16/24 17:41, Daniel Vetter wrote:
> On Tue, Feb 13, 2024 at 06:39:20PM +0100, Danilo Krummrich wrote:
>> On 2/9/24 19:52, Daniel Vetter wrote:
>>> On Fri, Feb 09, 2024 at 06:41:32PM +0100, Danilo Krummrich wrote:
>>>> On 2/6/24 15:03, Daniel Vetter wrote:
>>>>> On Mon, Feb 05, 2024 at 11:00:04PM +0100, Danilo Krummrich wrote:
>>>>>> On 2/5/24 22:08, Dave Airlie wrote:
>>>>>>> On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
>>>>>>>>
>>>>>>>> On 1/29/24 02:50, Dave Airlie wrote:
>>>>>>>>> From: Dave Airlie <airlied@redhat.com>
>>>>>>>>>
>>>>>>>>> This should break the deadlock between the fctx lock and the irq lock.
>>>>>>>>>
>>>>>>>>> This offloads the processing off the work from the irq into a workqueue.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>>>>>>
>>>>>>>> Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
>>>>>>>> safe deferring fence signalling to the kernel global wq. However, I wonder
>>>>>>>> if we could create deadlocks by building dependency chains into other
>>>>>>>> drivers / kernel code that, by chance, makes use of the kernel global wq as
>>>>>>>> well.
>>>>>>>>
>>>>>>>> Admittedly, even if, it's gonna be extremely unlikely given that
>>>>>>>> WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
>>>>>>>>
>>>>>>>> Also, do we need to CC stable?
>>>>>>>
>>>>>>> I pushed this to Linus at the end of last week, since the hangs in 6.7
>>>>>>> take out the complete system and I wanted it in stable.
>>>>>>>
>>>>>>> It might be safer to use a dedicated wq, is the concern someone is
>>>>>>> waiting on a fence in a workqueue somewhere else so we will never
>>>>>>> signal it?
>>>>>>
>>>>>> Yes, if some other work is waiting for this fence (or something else in the same
>>>>>> dependency chain) to signal it can prevent executing the work signaling this fence,
>>>>>> in case both are scheduled on the same wq. As mentioned, with the kernel global wq
>>>>>> this would be rather unlikely to lead to an actual stall with WQ_MAX_ACTIVE == 512,
>>>>>> but formally the race condition exists. I guess a malicious attacker could try to
>>>>>> intentionally push jobs directly or indirectly depending on this fence to a driver
>>>>>> which queues them up on a scheduler using the kernel global wq.
>>>>>
>>>>> I think if you add dma_fence_signalling annotations (aside, there's some
>>>>> patch from iirc Thomas Hellstrom to improve them and cut down on some
>>>>> false positives, but I lost track) then I think you won't get any splats
>>>>> because the wq subsystem assumes that WC_MAX_ACTIVE is close enough to
>>>>> infinity to not matter.
>>>>
>>>> As mentioned, for the kernel global wq it's 512. (Intentionally) feeding the kernel
>>>> with enough jobs to to provoke a deadlock doesn't seem impossible to me.
>>>>
>>>> I think it'd be safer to just establish not to use the kernel global wq for executing
>>>> work in the fence signalling critical path.
>>>>
>>>> We could also run into similar problems with a dedicated wq, e.g. when drivers share
>>>> a wq between drm_gpu_scheduler instances (see [1]), however, I'm not sure we can catch
>>>> that with lockdep.
>>>
>>> I think if you want to fix it perfectly you'd need to set the max number
>>> of wq to the number of engines (or for dynamic/fw scheduled engines to the
>>> number of context) you have. Or whatever limit to the number of parallel
>>> timelines there is.> I guess this would need a new wq function to
>>> update? drm/sched code could
>>> be able to set that for drivers, so drivers cannot get this wrong.
>>
>> Not sure I can follow. The scheduler instance might be per context and bind
>> queue. In this case it gets the shared wq passed, but doesn't know how many
>> other scheduler instances share the same one.
> 
> Yeah that's why maybe more of that logic should be in the drm/sched code
> instead of drivers just cleverly using what's there ...

Agree, that's gonna be a huge design change though.

> 
>> Additionally, there might be drivers not using the DRM scheduler for for bind
>> queues at all (I think Xe does not).
> 
> Uh ... maybe we should do this the same across all drivers? But I also
> thought that Xe was flat-out synchronous and only had an out-fence since
> you need a userspace thread in mesa for vk semantics anyway.
> 
> If xe hand-rolled a scheduler I'm not going to be very amused.

I really don't know the details, but there are similarities at least.

There is the the rebind work, which seems to be called in some VM_BIND cases and
in the context of an EXEC ioctl and seems to signal a fence. It seems valid to
not stuff this into the scheduler.

There are also cases like this one, where we have fence signalling critical code
in wqs outside the context of a scheduler instance.

> 
>>> If we don't do something like that then I'm not sure there's really much
>>> benefit - instead of carefully timing 512 dma_fence on the global wq you
>>> just need to create a pile of context (at least on intel's guc that's
>>> absolutely no issue) and then careful time them.
>>
>> Well, that's true. I'd still argue that there is a slight difference. From a
>> drivers isolated perspective using the global kernel wq might be entirely fine,
>> as in this patch. However, in combination with another driver doing the same
>> thing, things can blow up. For the case you illustrated it's at least possible
>> to spot it from a driver's perspective.
>>
>>>
>>> I still feel like we have bigger fish to fry ... But might be worth the
>>> effort to at least make the parallel timeline limit a lot more explicit?
>>
>> I agree, and it'd be great if we can find a solution such bugs can be detected
>> systematically (e.g. through lockdep), but maybe we can start to at least
>> document that we should never use the kernel global wq and where we need to be
>> careful in sharing driver wqs.
> 
> Yeah I guess the above two are other reasons why maybe we need a bit more
> structure in scheduler apis instead of just allowing drivers to hand in
> shared wq pointers. Something like a struct drm_sched_domain, which
> contains the wq + a list of drm_sched for it. Would also make stuff like
> reliably stopping the right amount of schedulers in tdr much more robust.

Yeah, that sounds like a good starting point. I can also add a corresponding entry
to the DRM TODO list explaining the issue.

- Danilo

> -Sima
> 
>>
>> - Danilo
>>
>>>
>>> Cheers, Sima
>>>
>>>>
>>>> [1] https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/gpu/drm/nouveau/nouveau_drm.c#L313
>>>>
>>>>>
>>>>> I'm not sure we should care differently, but I guess it'd be good to
>>>>> annotate it all in case the wq subsystem's idea of how much such deadlocks
>>>>> are real changes.
>>>>>
>>>>> Also Teo is on a mission to get rid of all the global wq flushes, so there
>>>>> should also be no source of deadlocks from that kind of cross-driver
>>>>> dependency. Or at least shouldn't be in the future, I'm not sure it all
>>>>> landed.
>>>>> -Sima
>>>>
>>>
>>
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F4B388CBB
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CF46EB38;
	Wed, 19 May 2021 11:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A006EB38
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 11:24:49 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gb17so1394788ejc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 04:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bAIjjTcjY6NHtBvXiyPhNsWfJKyzQSNib/VM0tXVPlE=;
 b=I8hZT/YAkNPghsd/6fzorAUuDd7A81NZ/p7+W30eE58MDR/reAdaAkHccDDJjQ1G57
 ymPp/8LSOInjA58s41fqIGaEIk67tRDKkOzvSU+boJ2uJuYoLbQFJhWKLA51oYqdhXqi
 +2AHWACJ0CQ4wFBp4HiV3KkwimTOp3/5k18xQb09TiGDGNx9qa0hnbHuyL3KGS6sbhtI
 2XVRoK5Fq41eh/x4rgLIRC+0mbouOel/sH7hcg4pLkZR0QEbdynjEAq2TtlPdJxg3SAe
 KgRlyAuxIWcHOolOJLqGAHe3NfQ6aWvSCSLBngay5QXnaOesiNbOAtTLxNGlapS6TmTH
 j2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bAIjjTcjY6NHtBvXiyPhNsWfJKyzQSNib/VM0tXVPlE=;
 b=Summ7+Z2tOnzRIQVNAhNm3ebzyNGj5up2ls+7/7xmRrAEdYb3XbF9rOpKcrUETvu7D
 vlWt/2IcG1irF1SPmsg2B3yppRjV0/vVcW5TQTek6uJwBYp1cPM+iCT+dMxxst+SzFKH
 6XNpHXx+MlkfrFHf2QJ+jtpC6XHE3fyRBjkKSpXgJBKuxpB8s0fXAmno5bVLauu0BNvS
 /GTeSHZkQqY6PveN65bLkJ6XlyfDd8R9czyW4mDLEgpzm4stul5+V1liNemqsd+HMTJ0
 Au1K520TOVkUjrTjUfsiNxhEDVt45gxgF5ib4zk8YWkQQsNInFqrnqBGC82Hg8iO9dY/
 XT/w==
X-Gm-Message-State: AOAM532iD3t/EmzNmbQAbS3PH13VGtwnzhbBSKw+7qBdMJo9ROVVdWtL
 O4o32zbsSSf8ppzaauQHbCM=
X-Google-Smtp-Source: ABdhPJythZaLlfIbc+UrePH0mfxa23hOuJ74xpe1gKEMBA5UNqGf5jDkTXuZFjhj0sbGgFKgjpLYVA==
X-Received: by 2002:a17:906:4a81:: with SMTP id
 x1mr11840812eju.508.1621423488482; 
 Wed, 19 May 2021 04:24:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8e28:1d3:41f3:e15a?
 ([2a02:908:1252:fb60:8e28:1d3:41f3:e15a])
 by smtp.gmail.com with ESMTPSA id h9sm15357782edt.18.2021.05.19.04.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 04:24:48 -0700 (PDT)
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ee36b7f8-070b-39da-48f5-d546f2c0ceb8@gmail.com>
Date: Wed, 19 May 2021 13:24:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 23:17 schrieb Daniel Vetter:
> [SNIP]
>> The problem in this case is not starting a new CS, but synchronizing to
>> the existing ones.
>>
>> See a heavy TLB flush is made completely out of sync. E.g. it doesn't
>> want to wait for any previous operation.
>>
>> In other words imagine the following example:
>> 1. Both process A and B have a BO mapped.
>> 2. Process A is heavily using the BO and doing all kind of rendering.
>> 3. Process B is unmapping the BO.
>>
>> Now that process B unmaps the BO needs to trigger page table updates and
>> a heavy TLB flush, but since this can take really long we want to do it
>> asynchronously on the hardware.
>>
>> With the current approach you basically can't do that because you can't
>> note that a fence should not participate in synchronization at all.
>>
>> E.g. we can't add a fence which doesn't wait for the exclusive one as
>> shared.
> Ok I think that's a real problem, and  guess it's also related to all
> the ttm privatization tricks and all that. So essentially we'd need
> the opposite of ttm_bo->moving, as in you can't ignore it, but
> otherwise it completely ignores all the userspace implicit fence
> stuff.

It goes into that direction, but doesn't sounds like the full solution 
either.

[SNIP]
> Can we please stop with the "amdgpu is right, everyone else is wrong" approach?

Well the approach I do here is not "amdgpu is right, everyone else is 
wrong". But rather we had DRM uAPI for i915, nouveau and radeon and 
unfortunately leaked that into DMA-buf without much thinking about it.

I'm also not saying that the approach amdgpu is right. It's just what 
amdgpu needs in it's CS interface.

What I'm saying is that DMA-buf is a device driver independent subsystem 
and we shouldn't make any assumption which come from just a handful of 
DRM driver on it's implicit sync implementation.

> Like I'm pretty much going to type up the patch that does a full drm
> subsytem audit of everything and whack amdgpu into compliance. Perf
> hit be damned, you had a few years to fix this with better uapi. Or I
> find out that there's a giant inconsistent mess, but at least we'd
> gain some clarity about where exactly we are here and maybe what to do
> next.

Ok to let us move forward please take a look at the first patches of the 
set. It cleans up quite a bunch of the mess we have in there before even 
coming to adding flags to the shared slots.

I think you will agree on that we should do is cleaning up the use cases 
further and separate implicit sync from resource management.

In other words we forbid touching the exclusive and shared fences 
directly and have separate APIs for resource management and implicit sync.

This makes sense anyway, no matter what implicit synchronization 
framework we will install underneath.

Regards,
Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> After that I think we can look at what exact oversync issue remains
>>> and why and solve it, but until we have this this just feels like
>>> another rehash of "amgpu insist its own dma_resv interpration is the
>>> right one and everyone else should move one over".
>>>
>>> Or maybe I've just become real garbage at reading random driver code,
>>> wouldn't be the first time :-)
>>>
>>> Cheers, Daniel
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Cheers, Daniel
>>>>>
>>>>>> --Jason
>>>>>>
>>>>>>
>>>>>>>> That's also the reason the Valve guys came up with a solution where each
>>>>>>>> BO gets a flag for explicit sync, but that only works for exports and
>>>>>>>> not for imports.
>>>>>>>>
>>>>>>>>> I915 and iirc msm has explicit flags for this, panfrost was designed to
>>>>>>>>> support this correctly from the start (also with flags I think). That's at
>>>>>>>>> least what I remember from all the discussions at XDC and #dri-devel, but
>>>>>>>>> didn't check the code again to give you the list of uapi flags you need
>>>>>>>>> for each driver.
>>>>>>>>>
>>>>>>>>> The other piece is making sure you're only picking up implicit fences when
>>>>>>>>> you should, and not any later ones, for which Jason has a solution:
>>>>>>>>>
>>>>>>>>> https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jason@jlekstrand.net/
>>>>>>>> Yes, I helped with that as well. But I think that this is just another
>>>>>>>> workaround without really addressing the underlying problem.
>>>>>>>>
>>>>>>>>> If amdgpu isn't using those, then you will suffer from
>>>>>>>>> over-synchronization in vulkan and pay a price. The entire point of vulkan
>>>>>>>>> is that you pick up sync points very explicitly, and we also need to have
>>>>>>>>> very explicit uapi for userspace to pick up/set the implicit fences.
>>>>>>>>>
>>>>>>>>> Trying to paper over this with more implicit magic is imo just wrong, and
>>>>>>>>> definitely not the long term explicit sync model we want.
>>>>>>>> I completely disagree.
>>>>>>>>
>>>>>>>> In my opinion the implicit sync model we have for dma_resv currently is
>>>>>>>> just not well designed at all, since it always requires cooperation from
>>>>>>>> userspace.
>>>>>>>>
>>>>>>>> In other words you need to know when to enable implicit sync in
>>>>>>>> userspace and that information is simply not present all of the time.
>>>>>>>>
>>>>>>>> What we have done here is just keeping the old reader/writer flags i915,
>>>>>>>> radeon and nouveau once had and pushed that out to everybody else making
>>>>>>>> the assumption that everybody would follow that without documenting the
>>>>>>>> actual rules of engagement you need to follow here.
>>>>>>>>
>>>>>>>> That was a really big mistake and we should try to fix that sooner or
>>>>>>>> later. The only other clean alternative I see is to use a flag on the
>>>>>>>> exporter to tell the importer if it should sync to shared fences or not.
>>>>>>>>
>>>>>>>> Additional to that I'm perfectly fine with implicit sync. Explicit sync
>>>>>>>> certainly has some use cases as well, but I don't see it as an absolute
>>>>>>>> advantage over the implicit model.
>>>>>>> Ok this stops making sense. Somehow you claim userspace doesn't know
>>>>>>> when to sync, but somehow the kernel does? By guessing, and getting it
>>>>>>> wrong mostly, except for the one case that you benchmarked?
>>>>>>>
>>>>>>> Aside from silly userspace which exports a buffer to a dma-buf, but
>>>>>>> then never imports it anywhere else, there isn't a case I know of
>>>>>>> where the kernel actually knows more than userspace. But there's lots
>>>>>>> of cases where the kernel definitely knows less, especially if
>>>>>>> userspace doesn't tell it about what's going on with each rendering
>>>>>>> and buffer.
>>>>>>>
>>>>>>> So here's the 2 things you need to make this work like every other driver:
>>>>>>>
>>>>>>> 1. A way to set the explicit fence on a buffer. CS ioctl is perfectly
>>>>>>> fine, but also can be seperate. Userspace uses this only on a) shared
>>>>>>> buffers b) when there's a flush/swap on that shared buffer. Not when
>>>>>>> rendering any of the interim stuff, that only leads to oversync.
>>>>>>> Anything non-shared is handled explicitly in userspace (at least for
>>>>>>> modern-ish drivers). This is the only thing that ever sets an
>>>>>>> exclusive fence (aside from ttm moving buffers around ofc).
>>>>>>>
>>>>>>> 2. A way to sync with the implicit fences, either all of them (for
>>>>>>> upcoming write access) or just the write fence (for read access). At
>>>>>>> first we thought it's good enough to do this in the CS ioctl, but
>>>>>>> that's a wee bit too late, hence the patches from Jason. My
>>>>>>> understanding is that vulkan converts this into an vk syncobj/fence of
>>>>>>> some sorts, so really can't make this more explicit and intentional
>>>>>>> than that.
>>>>>>>
>>>>>>> None of this is something the kernel has the slightest idea about when
>>>>>>> it happens, so you have to have explicit uapi for it. Trying to fake
>>>>>>> it in the kernel just doesn't work.
>>>>>>> -Daniel
>>>>>>> --
>>>>>>> Daniel Vetter
>>>>>>> Software Engineer, Intel Corporation
>>>>>>> http://blog.ffwll.ch
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> http://blog.ffwll.ch
>


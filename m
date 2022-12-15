Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3901564DA3F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74F10E537;
	Thu, 15 Dec 2022 11:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A7110E534;
 Thu, 15 Dec 2022 11:27:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u19so33019930ejm.8;
 Thu, 15 Dec 2022 03:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PpPeLW6wrxCw6peIhRB9wDznRr+BfVoJRbIJDxliuKg=;
 b=b7vpYQqC352lpVyRFyBhXT1qrQm+9O82Hig8nwbMltu8VqXvDmPa7ihGSuPqZm34Jy
 r8eSs2yVh4nHmz2lCN3D9wGYXDKZcZdv2Jc8so+BJsBiP0pT8UuaJchfU9yZwmDEMOcf
 xl0evtlmJLNdqlukPMPRxKL57WyIYhpLTRoAgRuuRV8pqs3OxsMX1+iaxNhX2ZUfFaH0
 h6XXpuo13SVJCgcvh1KI12MKnOacpvoWI92U+ya7vzN+VZZ9J2E95Ingfk8gy5bLSAu5
 Vc4HM3RqQKiMPNytNSyMs4zImAwgT11uWk4jdUnqnD387E+5TovEmthJyvrbhw7OJ5v8
 TyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PpPeLW6wrxCw6peIhRB9wDznRr+BfVoJRbIJDxliuKg=;
 b=YrqSHbXpClP8f6+ejpX2WTTQl7t8V3y2pyNZJy3x5WKDrppMBJ4LIYyehKwSoy0BGG
 7RuXA7NlkvMDiOWq4I/cizKm8/F6uby545mnKn1506Ss+jLyOtypjKSzAUc8lqgCJEsz
 yW5jpIk7SVm10ekFt8+hrDZunhIURjTO0YMhdHryB0kerXfvr+yGuosm26jJ7LuG5i8Y
 a+tKcxrArWi2ighw/4FD/PYVMXHPPvVwkvhD7XkdQlLds/pxOekEV90ERb1yKtVzqvbR
 ksuw4RGY9JfjO5kQnuknAlxyZc+vJvoCF+DKChQ8LsbPLhEMaUiRUzx7Y3F/AaUtpIkq
 KszQ==
X-Gm-Message-State: ANoB5pkBOroeLBj1qVCn+oId6ZBNIHkgkWAMM3I2S7GQIG6NTqfmOF+h
 AtBnvpqodUqNr+BC0mYeyw0=
X-Google-Smtp-Source: AA0mqf5avcqO/O8en3tK8Ke/RbP0NojehCQqc4877oYLkgYURmFnZgZ76EbC4pvO9DPBUR0sVtQy1Q==
X-Received: by 2002:a17:906:524f:b0:7bf:f0e9:4edc with SMTP id
 y15-20020a170906524f00b007bff0e94edcmr24360242ejm.31.1671103639121; 
 Thu, 15 Dec 2022 03:27:19 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 b16-20020a170906491000b007c0b9500129sm6919566ejq.68.2022.12.15.03.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 03:27:18 -0800 (PST)
Message-ID: <20f15c8d-fbe5-8dca-39dc-dc67fff2eca9@gmail.com>
Date: Thu, 15 Dec 2022 12:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, Robin Murphy <robin.murphy@arm.com>, 
 Alex Deucher <alexdeucher@gmail.com>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
 <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
 <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
 <5b5a731b-0208-58a9-cb6f-2614efadbab2@arm.com>
 <9f18f970-98c5-649a-5f2c-dc4bc26db1e7@gmail.com>
 <466c4ce0-9a13-7d99-768e-43f7027f4933@amd.com>
 <02c45581-f988-2c10-17c8-dca6836acb00@gmail.com>
 <de9bf189-c204-f499-f027-1320e2faaa20@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <de9bf189-c204-f499-f027-1320e2faaa20@amd.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Mikhail Krylov <sqarert@gmail.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.12.22 um 11:19 schrieb Luben Tuikov:
> On 2022-12-15 04:46, Christian König wrote:
>> Am 15.12.22 um 10:08 schrieb Luben Tuikov:
>>> On 2022-12-15 03:07, Christian König wrote:
>>>> Am 15.12.22 um 00:08 schrieb Robin Murphy:
>>>>> On 2022-12-14 22:02, Alex Deucher wrote:
>>>>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com>
>>>>>> wrote:
>>>>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>>>>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>>>>>>
>>>>>>>> On older systems with little memory, for instance 1.5 GiB, using an
>>>>>>>> AGP chip,
>>>>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is
>>>>>>>> 0x7FFFFFF, and
>>>>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>>>>>>> false. As such the result of this static inline isn't suitable for
>>>>>>>> the last
>>>>>>>> argument to ttm_device_init()--it simply needs to now whether to
>>>>>>>> use GFP_DMA32
>>>>>>>> when allocating DMA buffers.
>>>>>>> This sounds wrong to me. If the issues happen on systems without PAE it
>>>>>>> clearly can't have anything to with the actual DMA address size. Not to
>>>>>>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>>>>>>> GFP_DMA32 would be functionally meaningless anyway. Although the
>>>>>>> reported symptoms initially sounded like they could be caused by DMA
>>>>>>> going to the wrong place, that is also equally consistent with a
>>>>>>> loss of
>>>>>>> cache coherency.
>>>>>>>
>>>>>>> My (limited) understanding of AGP is that the GART can effectively
>>>>>>> alias
>>>>>>> memory to a second physical address, so I could well believe that
>>>>>>> something somewhere in the driver stack needs to perform some cache
>>>>>>> maintenance to avoid coherency issues, and that in these particular
>>>>>>> setups whatever that is might be assuming the memory is direct-mapped
>>>>>>> and thus going wrong for highmem pages.
>>>>>>>
>>>>>>> So as I said before, I really think this is not about using
>>>>>>> GFP_DMA32 at
>>>>>>> all, but about *not* using GFP_HIGHUSER.
>>>>>> One of the wonderful features of AGP is that it has to be used with
>>>>>> uncached memory.  The aperture basically just provides a remapping of
>>>>>> physical pages into a linear aperture that you point the GPU at.  TTM
>>>>>> has to jump through quite a few hoops to get uncached memory in the
>>>>>> first place, so it's likely that that somehow isn't compatible with
>>>>>> HIGHMEM.  Can you get uncached HIGHMEM?
>>>>> I guess in principle yes, if you're careful not to use regular
>>>>> kmap()/kmap_atomic(), and always use pgprot_noncached() for
>>>>> userspace/vmalloc mappings, but clearly that leaves lots of scope for
>>>>> slipping up.
>>>> I theory we should do exactly that in TTM, but we have very few users
>>>> who actually still exercise that functionality.
>>>>
>>>>> Working backwards from primitives like set_memory_uc(), I see various
>>>>> paths in TTM where manipulating the caching state is skipped for
>>>>> highmem pages, but I wouldn't even know where to start looking for
>>>>> whether the right state is propagated to all the places where they
>>>>> might eventually be mapped somewhere.
>>>> The tt object has the caching state for the pages and
>>>> ttm_prot_from_caching() then uses pgprot_noncached() and co for the
>>>> userspace/vmalloc mappings.
>>>>
>>> The point of this patch is that dma_addressing_limited() is unsuitable as
>>> the last parameter to ttm_pool_init(), since if it is "false"--as it is in this
>>> particular case--then TTM ends up using HIGHUSER, and we get the screen corruption.
>>> (gfp_flags |= GFP_HIGHUSER in in ttm_pool_alloc())
>> Well I would rather say that dma_addressing_limited() works, but the
>> default value from dma_get_required_mask() is broken.
>>
> dma_get_required_mask() for his setup of 1.5 GiB of memory returns 0x7FFFFFF.

This 0x7FFFFFF mask looks fishy to me. That would only be 128MiB 
addressable memory (27 bits set)? Or is there another F missing?

> While the dma mask is 0xFFFFFFFF, as set in radeon_device.c in radeon_device_init().
>
>> 32 bits only work with bounce buffers and we can't use those on graphics
>> hardware.
>>
>>> Is there an objection to this patch, if it fixes the screen corruption?
>> Not from my side, but fixing the underlying issues would be better I think.
>>
> Have they been identified?

I'm not 100% sure. I think by using GFP_DMA32 we just work around the 
issue somehow.

>>> Or does TTM need fixing, in that what we really need is to specify whether
>>> caching is desired and/or DMA32 when we allocate a TTM pool (ttm_pool_init(),
>>> called from ttm_device_init(), called from radeon_ttm_init.c)?
>> Could be, but it's more likely that the problem is in the DMA layer
>> because we fail to recognize that the device can't access all of the memory.
>>
> Right, I agree. Ideally, setting dev->{dma_mask, coherent_dma_mask, bus_dma_limit},
> should be sufficient to tell the DMA layer what kind of memory the device
> can handle.
>
> But this patch doesn't change non-local behaviour and as such is local and safe
> to apply.

Yeah, agree. It's pretty hard to find such old hardware for testing anyway.

I do still have a working AGP system somewhere in my basement, but 
dusting that of just for testing this doesn't sounds like valuable time 
spend.

Regards,
Christian.

>
> Regards,
> Luben
>


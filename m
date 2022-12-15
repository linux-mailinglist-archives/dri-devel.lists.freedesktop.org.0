Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0602564D8E9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 10:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA8410E0A7;
	Thu, 15 Dec 2022 09:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D808010E0A7;
 Thu, 15 Dec 2022 09:46:15 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id b2so50922625eja.7;
 Thu, 15 Dec 2022 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nSuPUvnkHfisy+0Wgn+yBJ2C5burqMUBeQ+wDBWToTw=;
 b=aQpYR25ooZFwwdc71GPfLa9g8CQXV1ShFGzUJLStDmjfOc3PvLEEiu4yp6bV81/aZv
 olSWp4VIs5lysVnWoLMpngLluS8ZvGcL+2HN5kx/DKjgqp9EcJ1BvCo6SyMVQpjNsFE6
 gqomVLsxjlrLLVNL2GcEvJGyJr6sZWMdLDVMUBlsSxTVgn6X+rkjib8pgIjkM9larZmb
 zZdPpDocrbEyfe+9McOgfs8YoYcNHB8HdZoP+pfTgbYPatMlaR4bSr6hd5XkbWO3MDsf
 Sjbjrd8cbd0FlzO/GOm/G8/2kHgpe1R4Bq4h71IdVK+DEQDAk6uFEUXt0yRb1eDKDhQv
 Ek4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nSuPUvnkHfisy+0Wgn+yBJ2C5burqMUBeQ+wDBWToTw=;
 b=aSp9Ym2SIFTKdyc2zVM3hheZVx+RpyGwievs2ilhi49aXEBksw43scyk0BS6kGb3++
 lFj1SX4MpmOGD1CdFA/73LYW2dlOCyHFhLWQUACeEnGrWHbPB8HvGzJ4f435wA/P9YcB
 mt8YpBGCf4+FBZg3CL+9xLPTLitzl5DL3rD1++nhRqe+6YvFR1ureNfIhB7yQ5/EJTm8
 5bQLGj3PHzfCc1bbW1d9IVAswGR7CMzuDZCbTJqUW2BlZH7s2tTE/i4mpbk5ABdA122d
 iMrfofafvH553hCVTej+d85cHJNtbkAxBkoUxR81AO4g2l+Rzz/pEuK14WlAvdVZziBU
 gm5w==
X-Gm-Message-State: ANoB5pkf+b/lQAb2v7AIWbqspiqXQSRjgYzJ/z+AsOkXF/q8FPUxWvdR
 I9aVzVtNBModumhpc+AyowErkh+4LGA=
X-Google-Smtp-Source: AA0mqf6aGaFFy1OaCi3Z6OmzF0bhZ+9yog9XFVrcezEGX4EQV7vLucNoVVOpjXsuGBrLA8IMqqwvJw==
X-Received: by 2002:a17:906:3e41:b0:7ad:e67d:f15c with SMTP id
 t1-20020a1709063e4100b007ade67df15cmr25176246eji.48.1671097574313; 
 Thu, 15 Dec 2022 01:46:14 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 1-20020a170906200100b0073d71792c8dsm6871001ejo.180.2022.12.15.01.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 01:46:13 -0800 (PST)
Message-ID: <02c45581-f988-2c10-17c8-dca6836acb00@gmail.com>
Date: Thu, 15 Dec 2022 10:46:12 +0100
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <466c4ce0-9a13-7d99-768e-43f7027f4933@amd.com>
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

Am 15.12.22 um 10:08 schrieb Luben Tuikov:
> On 2022-12-15 03:07, Christian König wrote:
>> Am 15.12.22 um 00:08 schrieb Robin Murphy:
>>> On 2022-12-14 22:02, Alex Deucher wrote:
>>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com>
>>>> wrote:
>>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>>>>
>>>>>> On older systems with little memory, for instance 1.5 GiB, using an
>>>>>> AGP chip,
>>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is
>>>>>> 0x7FFFFFF, and
>>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>>>>> false. As such the result of this static inline isn't suitable for
>>>>>> the last
>>>>>> argument to ttm_device_init()--it simply needs to now whether to
>>>>>> use GFP_DMA32
>>>>>> when allocating DMA buffers.
>>>>> This sounds wrong to me. If the issues happen on systems without PAE it
>>>>> clearly can't have anything to with the actual DMA address size. Not to
>>>>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>>>>> GFP_DMA32 would be functionally meaningless anyway. Although the
>>>>> reported symptoms initially sounded like they could be caused by DMA
>>>>> going to the wrong place, that is also equally consistent with a
>>>>> loss of
>>>>> cache coherency.
>>>>>
>>>>> My (limited) understanding of AGP is that the GART can effectively
>>>>> alias
>>>>> memory to a second physical address, so I could well believe that
>>>>> something somewhere in the driver stack needs to perform some cache
>>>>> maintenance to avoid coherency issues, and that in these particular
>>>>> setups whatever that is might be assuming the memory is direct-mapped
>>>>> and thus going wrong for highmem pages.
>>>>>
>>>>> So as I said before, I really think this is not about using
>>>>> GFP_DMA32 at
>>>>> all, but about *not* using GFP_HIGHUSER.
>>>> One of the wonderful features of AGP is that it has to be used with
>>>> uncached memory.  The aperture basically just provides a remapping of
>>>> physical pages into a linear aperture that you point the GPU at.  TTM
>>>> has to jump through quite a few hoops to get uncached memory in the
>>>> first place, so it's likely that that somehow isn't compatible with
>>>> HIGHMEM.  Can you get uncached HIGHMEM?
>>> I guess in principle yes, if you're careful not to use regular
>>> kmap()/kmap_atomic(), and always use pgprot_noncached() for
>>> userspace/vmalloc mappings, but clearly that leaves lots of scope for
>>> slipping up.
>> I theory we should do exactly that in TTM, but we have very few users
>> who actually still exercise that functionality.
>>
>>> Working backwards from primitives like set_memory_uc(), I see various
>>> paths in TTM where manipulating the caching state is skipped for
>>> highmem pages, but I wouldn't even know where to start looking for
>>> whether the right state is propagated to all the places where they
>>> might eventually be mapped somewhere.
>> The tt object has the caching state for the pages and
>> ttm_prot_from_caching() then uses pgprot_noncached() and co for the
>> userspace/vmalloc mappings.
>>
> The point of this patch is that dma_addressing_limited() is unsuitable as
> the last parameter to ttm_pool_init(), since if it is "false"--as it is in this
> particular case--then TTM ends up using HIGHUSER, and we get the screen corruption.
> (gfp_flags |= GFP_HIGHUSER in in ttm_pool_alloc())

Well I would rather say that dma_addressing_limited() works, but the 
default value from dma_get_required_mask() is broken.

32 bits only work with bounce buffers and we can't use those on graphics 
hardware.

> Is there an objection to this patch, if it fixes the screen corruption?

Not from my side, but fixing the underlying issues would be better I think.

> Or does TTM need fixing, in that what we really need is to specify whether
> caching is desired and/or DMA32 when we allocate a TTM pool (ttm_pool_init(),
> called from ttm_device_init(), called from radeon_ttm_init.c)?

Could be, but it's more likely that the problem is in the DMA layer 
because we fail to recognize that the device can't access all of the memory.

Regards,
Christian.

>
> Regards,
> Luben
>


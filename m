Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FB64D786
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D53810E4EF;
	Thu, 15 Dec 2022 08:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF34810E4EF;
 Thu, 15 Dec 2022 08:07:24 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id tz12so27736156ejc.9;
 Thu, 15 Dec 2022 00:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IumG94NWekH4RGw/rERdEz2xSSqm2nwseAlzAQdNaJw=;
 b=D7v1bpDFRn8J8AakrPaTYKIZeTe2U/IIvqOqROlO+5ZhXkobO9ULJmsprlaLNMXw6x
 xvaXkzXYMjJcMNP+q2Z9rr7myK+k7OpAj+ZhO1+aJ15xDpgR4c8hnY1gKC+Zo/EMxYYO
 Ny/wKOl950gWem7QZkwCDeBnsIEaI+1xQsiKuPbvvBbM8S/ZHAvavSOUvcp72FqYDt8V
 0PD3cw/vvDNUh1qh9gGiM5yvLYmVPowiPIhyy7ffrBAQaVXtwns6NXD8v8gLXubzRd4G
 JYsZctx5eB8b6ORwaWY6ztf3jeSSQQP7ugXlvrMdmiT2QcHuzYHqA8ChFyxlt3m+gzi+
 IJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IumG94NWekH4RGw/rERdEz2xSSqm2nwseAlzAQdNaJw=;
 b=QF3s/hJ8Fmbxp97f/oT+59ZZeZnFizW6OHmc07+TJcpahEKt6lzDc1v2pcj3A4mMfY
 DVZARPZ/Sgz93go1Z7RxBm58Da4jQEhjwR799Sy1NPi3DLLgPFaN4aOWjFj5u9PVZGVx
 doNNYJPG1Uhka72T+bsuo9oIbzX6cfvUPyiLvHt/JVZOHIjsvgRVSFT6KvWNQSdNTiQ8
 5a5hCse3yZoTy+qXs4FyikgtYMmt8tpMC5mb8CDmhPi8S8X6jpsuH26p9MVXwg75BHE6
 aaUntq2PYYZJzlJTf5nRK4fSnzfXxNp2KJ9O9DUXb9PDbvJjc1poun5Zxy4PkISKyT1M
 R7eA==
X-Gm-Message-State: ANoB5pldpRWZfUuAZSITB27zAkYd6AjkfWVkCawYJ+QMusWS/+/RENN2
 /kOpl8fWi/7x3egDg2RrRgc=
X-Google-Smtp-Source: AA0mqf5VX6kzl18xNuW34V6+GMxcOPbn8JSzTWHKIbAeEvBw7z98p52APeGmgNWWWHsJN/LbmnDDsg==
X-Received: by 2002:a17:907:c688:b0:7bb:af66:f38c with SMTP id
 ue8-20020a170907c68800b007bbaf66f38cmr22899403ejc.10.1671091642076; 
 Thu, 15 Dec 2022 00:07:22 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 i15-20020a50fd0f000000b0046b4e0fae75sm7088076eds.40.2022.12.15.00.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 00:07:21 -0800 (PST)
Message-ID: <9f18f970-98c5-649a-5f2c-dc4bc26db1e7@gmail.com>
Date: Thu, 15 Dec 2022 09:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
 <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
 <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
 <5b5a731b-0208-58a9-cb6f-2614efadbab2@arm.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <5b5a731b-0208-58a9-cb6f-2614efadbab2@arm.com>
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
 Mikhail Krylov <sqarert@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.12.22 um 00:08 schrieb Robin Murphy:
> On 2022-12-14 22:02, Alex Deucher wrote:
>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com> 
>> wrote:
>>>
>>> On 2022-12-12 02:08, Luben Tuikov wrote:
>>>> Fix screen corruption on older 32-bit systems using AGP chips.
>>>>
>>>> On older systems with little memory, for instance 1.5 GiB, using an 
>>>> AGP chip,
>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask is 
>>>> 0x7FFFFFF, and
>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
>>>> false. As such the result of this static inline isn't suitable for 
>>>> the last
>>>> argument to ttm_device_init()--it simply needs to now whether to 
>>>> use GFP_DMA32
>>>> when allocating DMA buffers.
>>>
>>> This sounds wrong to me. If the issues happen on systems without PAE it
>>> clearly can't have anything to with the actual DMA address size. Not to
>>> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
>>> GFP_DMA32 would be functionally meaningless anyway. Although the
>>> reported symptoms initially sounded like they could be caused by DMA
>>> going to the wrong place, that is also equally consistent with a 
>>> loss of
>>> cache coherency.
>>>
>>> My (limited) understanding of AGP is that the GART can effectively 
>>> alias
>>> memory to a second physical address, so I could well believe that
>>> something somewhere in the driver stack needs to perform some cache
>>> maintenance to avoid coherency issues, and that in these particular
>>> setups whatever that is might be assuming the memory is direct-mapped
>>> and thus going wrong for highmem pages.
>>>
>>> So as I said before, I really think this is not about using 
>>> GFP_DMA32 at
>>> all, but about *not* using GFP_HIGHUSER.
>>
>> One of the wonderful features of AGP is that it has to be used with
>> uncached memory.  The aperture basically just provides a remapping of
>> physical pages into a linear aperture that you point the GPU at.  TTM
>> has to jump through quite a few hoops to get uncached memory in the
>> first place, so it's likely that that somehow isn't compatible with
>> HIGHMEM.  Can you get uncached HIGHMEM?
>
> I guess in principle yes, if you're careful not to use regular 
> kmap()/kmap_atomic(), and always use pgprot_noncached() for 
> userspace/vmalloc mappings, but clearly that leaves lots of scope for 
> slipping up.

I theory we should do exactly that in TTM, but we have very few users 
who actually still exercise that functionality.

>
> Working backwards from primitives like set_memory_uc(), I see various 
> paths in TTM where manipulating the caching state is skipped for 
> highmem pages, but I wouldn't even know where to start looking for 
> whether the right state is propagated to all the places where they 
> might eventually be mapped somewhere.

The tt object has the caching state for the pages and 
ttm_prot_from_caching() then uses pgprot_noncached() and co for the 
userspace/vmalloc mappings.

Regards,
Christian.

>
> Cheers,
> Robin.


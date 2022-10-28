Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3D9611480
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 16:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15A710E1C0;
	Fri, 28 Oct 2022 14:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77F710E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 14:26:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l14so6841409wrw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jKFG/IV+5ec3zcjXicuA61ey7zmdKiGiE9ULsyhPuWI=;
 b=f+exP041h+qfRVWomwoiD34PApbbnGjZ4whqX4NB/6+BSX+EI5l470FkIUGUWGyBeO
 VWeQD5mkaaa9ZDUFZ/x/lArOKxe5dHqKb7ATwADMtql5k9FHIPCmaOXdwaqkR5HXiCat
 nZ0ukXYnxDth3ReKqcjTryatwqc/YNfMa2AKGvqHvmdjBRbwrkih6qFCxeAEU8A/0iFY
 89QY1Kx2KhCGV36xfqVR9I4P5QoWsLmG7Zhfr0Rh3szJFAqiSNOZMr7P+4VoJd2QI7+L
 8g9MdTvOpGHfwdWpspg2ZPJ+CJJk5N43EXtfglZhv2CKoO1+qEG+cEq5GOlbChptTkGc
 ZCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jKFG/IV+5ec3zcjXicuA61ey7zmdKiGiE9ULsyhPuWI=;
 b=KrRm4NrQvOGBlhrDiTQcqXAEh7s68+v1elRmFEHUelo/B0CGnva0PHNt8U9ceQAteS
 /IoX6YFQY5u9Q2MoqNmU8S+xQ6lMCpxIaaY2TrVXi6nh0jRbjmZM6WyXIdwla8WXLlEU
 25ZUtXLOnJ/cg6qt368cUfr+lr0qv0Z/b8ZhQhNgXIwx99hK0eKdnU/TfhBtrsIEHnRk
 LPU13a4t3D+6+6lFXNDtd+ClShLDoq5C6xR0wtJfsSPrtvpGVyZ3WjUsRJcx9JdKpbNi
 GNLqKSjc+pCnVTELzmgIRdXfFpKQ4tWevkIX0h6IhVcoUTmdmneNehFRaq7/YTS9/+Uz
 nASw==
X-Gm-Message-State: ACrzQf1E+mWq3kkFmNqor9iufpwU+7ZQ33KH8hQzsahrXct2/V780qV5
 oz3pNbeN4dHIyQlwNkFryJI=
X-Google-Smtp-Source: AMsMyM6Za7KXnYfawwk6J+VO6O6IWomWkhwoo+JKQOab/RhkGAGrhtydsetKEUwhxk2ia4StpdR9Ug==
X-Received: by 2002:adf:fa83:0:b0:236:a97d:693c with SMTP id
 h3-20020adffa83000000b00236a97d693cmr1159336wrr.108.1666967200999; 
 Fri, 28 Oct 2022 07:26:40 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:9377:d2f2:2ed:af4b?
 ([2a02:908:1256:79a0:9377:d2f2:2ed:af4b])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b003b4ff30e566sm14020929wms.3.2022.10.28.07.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 07:26:40 -0700 (PDT)
Message-ID: <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
Date: Fri, 28 Oct 2022 16:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, nicolas@ndufresne.ca,
 ppaalanen@gmail.com, sumit.semwal@linaro.org, daniel@ffwll.ch,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
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

Am 28.10.22 um 13:42 schrieb Lucas Stach:
> Am Freitag, dem 28.10.2022 um 10:40 +0200 schrieb Christian König:
>> But essentially the right thing to do. The only alternative I can see is
>> to reverse the role of exporter and importer.
>>
> I don't think that would work generally either, as buffer exporter and
> importer isn't always a 1:1 thing. As soon as any attached importer has
> a different coherency behavior than the others, things fall apart.

I've just mentioned it because somebody noted that when you reverse the 
roles of exporter and importer with the V4L driver and i915 then the use 
case suddenly starts working.

>>>> For DRM and most V4L2 devices I then fill in the dma_coherent flag based on the
>>>> return value of dev_is_dma_coherent(). Exporting drivers are allowed to clear
>>>> the flag for their buffers if special handling like the USWC flag in amdgpu or
>>>> the uncached allocations for radeon/nouveau are in use.
>>>>
>>> I don't think the V4L2 part works for most ARM systems. The default
>>> there is for devices to be noncoherent unless explicitly marked
>>> otherwise. I don't think any of the "devices" writing the video buffers
>>> in cached memory with the CPU do this. While we could probably mark
>>> them as coherent, I don't think this is moving in the right direction.
>> Well why not? Those devices are coherent in the sense of the DMA API
>> that they don't need an extra CPU copy on sync_to_cpu/sync_to_device.
>>
>> We could come up with a better name for coherency, e.g. snooping for
>> example. But that is just an documentation detail.
>>
> I agree that those devices copying data into a CPU cacheable buffer
> should be marked as coherent, just not sure right now if other things
> like DMA mappings are done on that device, which would require the
> cache maintenance.

Yeah, good point.

>> And this the exact wrong approach as far as I can see. As Daniel noted
>> as well we absolutely need some kind of coherency between exporter and
>> importer.
>>
> I think it's important that we are very specific about the thing we are
> talking about here: I guess when you say coherency you mean hardware
> enforced coherency on cacheable memory, which is the default on
> x86/PCI.

Well, no. What I mean with coherency is that the devices don't need 
insert special operation to access each others data.

This can be archived by multiple approaches, e.g. by the PCI coherency 
requirements, device internal connections (XGMI, NVLink, CXL etc...) as 
well as using uncached system memory.

The key point is what we certainly don't want is special operations 
which say: Ok, now device A can access the data, now device B..... 
because this breaks tons of use cases.

> The other way to enforce coherency is to either insert cache
> maintenance operations, or make sure that the buffer is not cacheable
> by any device taking part in the sharing, including the CPU.

Yes and no. When we want the devices to interact with each other without 
the CPU then we need some negotiated coherency between the two.

>> This can either be provided by the PCI specification which makes it
>> mandatory for device to snoop the caches or by platform devices agreeing
>> that they only work on uncached memory.
> What you disregard here is the fact that there are many systems out
> there with mixed topologies, where some masters are part of the
> coherency domain and some are not.
>
> We have two options here: either mandate that coherency for dma-bufs
> need to be established by hardware, which is the option that you
> strongly prefer, which means forcing all buffers to be uncacheable in a
> system with masters that are not coherent, or allowing some form of
> bracketed DMA access with cache maintenance ops.

Well I don't prefer that option, it's just the only one I can see. One 
of the main goals of DMA-buf is to allow device to share data without 
the need for CPU interactions.

In other words we negotiate the high level properties and then the 
device can talk to each other without explicitly noting who is accessing 
what.

And this concept is completely incompatible with maintenance ops. We 
made that mistake with SWIOTLB for the DMA API and I don't really want 
to repeat that stunt.

>> Explicit cache flush operations are simple not part of the design of
>> DMA-buf because they are not part of the design of the higher level APIs
>> like Vulkan and OpenGL.
> I'm aware that some graphics APIs have been living in a universe
> blissfully unaware of systems without hardware enforced coherency. But
> that isn't the only use for dma-bufs.

Yeah, but the other use cases are extremely limited. As far as I can see

>
> I totally agree that some higher level API primitives aren't possible
> without coherency at the hardware level and for those uses we should
> require either HW enforced coherency or uncachable memory. But I don't
> think we should make things slow deliberately on systems that allow to
> optimize things with the help of bracketed access.
>
> If I understood things right your amdgpu use-case even falls into this
> category: normally you would want to use cacheable memory for
> everything, but just make sure to clean the caches before using the
> buffer with the non-coherent display engine.

No, that won't work like this. The caching attributes must be coherent 
for the display engine to work correctly.

>> Adding this to DMA-buf for the rather special use case would completely
>> break that and make live much more complicated for everybody.
>>
>>> I also think that we should keep in mind that the world is moving into
>>> a direction where DMA masters may not only snoop the CPU caches (what
>>> is the definition of cache coherent on x86), but actually take part in
>>> the system coherence and are able to have writeback caches for shared
>>> data on their own. I can only speculate, as I haven't seen the amdgpu
>>> side yet, but I think this proposal is moving in the other direction by
>>> assuming a central system cache, where the importer has some magic way
>>> to clean this central cache.
>> What you mean is CXL: https://en.wikipedia.org/wiki/Compute_Express_Link
> Or ARM AMBA CHI.
>> And yes we support that in a bunch of configurations and also have
>> worked with that and amdgpu with DMA-buf based shared.
>>
>> This should not be a problem with this approach.
> It works as long as all masters sharing the buffer are accessing the
> buffer through the HW cache coherence facilities provided by CXL. As
> soon as a master wants to bypass it (like your nosnoop scanout) you
> need some way to force all other masters sharing access to the buffer
> to clean their caches.

That won't work like this. The problem is that this is an APU and so the 
display is part of the CPU. When either the MTRR or PAT says that the 
physical address is cacheable the engine might just hang on access.

>>> Since I have a vested interest in seeing V4L2 UVC and non-coherent GPU
>>> dma-buf sharing work on ARM systems and seem to hold some strong
>>> opinions on how this should work, I guess I need to make some time
>>> available to type it up, so we can discuss over coder rather than
>>> abstract ideas. If I come up with something that works for my use-cases
>>> would you be up for taking a shot at a amdgpu implementation?
>> Well, not really. As I said I see what you have in mind here as
>> completely wrong approach we will certainly not support in any GPU driver.
>>
>> What we can do is to request the use case which won't work and this is
>> exactly what the patch here does.
>>
> Did you mean to write "prevent the use case which won't work" here?

Oh, yes. To fast typing.

Regards,
Christian.

>
> Regards,
> Lucas
>


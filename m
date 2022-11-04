Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9053619A8F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C9010E84A;
	Fri,  4 Nov 2022 14:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A9C10E84A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:51:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l14so7417066wrw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Wc2jsNOexwW+dAT0tReNL8z52qtdL4m+9R396rw+xY=;
 b=ddRzSMcyTyvR9vCEgF8H/7BNeY5xSwk1IbYyT2D9eT1ENWApfJBXzh9sVWcQjbfSuj
 zL36+cZXbjye5yNe0f42TldIKf+s83cN3mgosUsZUh7qaAl5nP8sl4RN2us2De867dsz
 c5i9Bk7e//aDNmzXS1p5e6MGvzOFbVwUwlvCxLTCyAPVqm1EkqSQZtxwEkv0KebO1xF6
 qLAUrcv3Bq5xjn2wUtetFR2RDK3zMmlSlPh9y+iKDZJiBNP4qeVJcMNnDgUpAagDXzID
 /DJv5Tro9VkGx1X7OF1NgCPuQAhnqxlJbbSskk/PrjHN4egnFjbD54nqD1k0PYPvbnHk
 Nw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Wc2jsNOexwW+dAT0tReNL8z52qtdL4m+9R396rw+xY=;
 b=Z8c8zAQrt+uVR/Jr+pK0QNqEQFR+MTmCQmr5uJFZUBZq/AHe+YGqUYSOjUjCpI+jRg
 sBMXMgXSdYamFdof29LDF88GkLnhrWlrisqFGlLM6nNTROCITGr4G2PGQM/gL2lqnpVl
 +RpcXdJn4sFrsa6dk2ZM4l3dU9aWqYEArB5lRktnQdpTETY/68vlROf3/DJNAL5zlUWv
 mRXVLZ+3x557lX3hLFGhyxhabTFcrOxt8jHmoB6Wl/UV7OFI3TM6UcEgoA1bHfMgcB+9
 qZgan6QCBhj2Tq/Ua6V0QuPU3topJLLxZojwtUWwFSnco/G9/e5zXUUdbnsCKfq4YEXG
 8VDQ==
X-Gm-Message-State: ACrzQf0mruxpygOf2+wZ2zSo0WKtKLi+k1+bdPNwyD3RaoHinxHOCJEO
 W3rPh6R4G+1agCxO/JlMQY4=
X-Google-Smtp-Source: AMsMyM5hrtyXs4ZcIlYxByNLzk3pumvW8uX/mVO7s3L9nrIAwC5/hbko5ltr77oqDTSE+pu2lN8AaQ==
X-Received: by 2002:adf:fd87:0:b0:236:7ad7:d3c4 with SMTP id
 d7-20020adffd87000000b002367ad7d3c4mr22778071wrr.687.1667573477232; 
 Fri, 04 Nov 2022 07:51:17 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:8469:5663:826a:8164?
 ([2a02:908:1256:79a0:8469:5663:826a:8164])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05600000cb00b0023677e1157fsm3535610wrx.56.2022.11.04.07.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 07:51:16 -0700 (PDT)
Message-ID: <3488df2f-d4c0-af05-575b-707a82a7ec30@gmail.com>
Date: Fri, 4 Nov 2022 15:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Daniel Stone <daniel@fooishbar.org>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <90a1fb6101483971ef14d22370aac50d494a4752.camel@ndufresne.ca>
 <441e7155-2fa3-e34f-1bf6-706a0e5698d8@gmail.com>
 <434299935e7ed9a7a02e4e358cd044e54145582e.camel@ndufresne.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <434299935e7ed9a7a02e4e358cd044e54145582e.camel@ndufresne.ca>
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
Cc: ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.11.22 um 14:38 schrieb Nicolas Dufresne:
> Le vendredi 04 novembre 2022 à 10:03 +0100, Christian König a écrit :
>> Am 03.11.22 um 23:16 schrieb Nicolas Dufresne:
>>> [SNIP]
>>>
>>> Was there APIs suggested to actually make it manageable by userland to allocate
>>> from the GPU? Yes, this what Linux Device Allocator idea is for. Is that API
>>> ready, no.
>> Well, that stuff is absolutely ready:
>> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/heaps/system_heap.c#L175
>> What do you think I'm talking about all the time?
> I'm aware of DMA Heap, still have few gaps, but this unrelated to coherency (we
> can discuss offline, with Daniel S.). For DMABuf Heap, its used in many forks by
> vendors in production. There is an upstream proposal for GStreamer, but review
> comments were never addressed, in short, its stalled, and it waiting for a
> volunteer. It might also be based on very old implementation of DMABuf Heap,
> needs to be verified in depth for sure as the time have passed.
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1391

Well this is actually quite related to coherency.

As general purpose framework it's mandatory for DMA Heaps to support the 
coherency callbacks. And as far as I can see they are indeed correctly 
implemented.

So if you allocate from a DMA Heap it should be guaranteed that sharing 
with all devices work correctly, no matter if they write with the CPU or 
don't snoop the CPU cache. That's essentially what those heaps are good for.

I just don't know how you should select between the contiguous and the 
system heap since I'm not deep enough in the userspace side of this.

We should have come up with heaps earlier and don't implement so many 
different system memory allocators in the drivers in the first place.

>> DMA-buf has a lengthy section about CPU access to buffers and clearly
>> documents how all of that is supposed to work:
>> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-buf.c#L1160
>> This includes braketing of CPU access with dma_buf_begin_cpu_access()
>> and dma_buf_end_cpu_access(), as well as transaction management between
>> devices and the CPU and even implicit synchronization.
>>
>> This specification is then implemented by the different drivers
>> including V4L2:
>> https://elixir.bootlin.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-dma-sg.c#L473
>>
>> As well as the different DRM drivers:
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c#L117
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c#L234
> I know, I've implement the userspace bracketing for this in GStreamer [1] before
> DMAbuf Heap was merged and was one of the reporter for the missing bracketing in
> VB2. Was tested against i915 driver. Note, this is just a fallback, the
> performance is terrible, memory exported by (at least my old i915 HW) is not
> cacheable on CPU. Though, between corrupted image and bad performance or just
> bad performance, we decided that it was better to have the second. When the
> DMABuf is backed by CPU cacheable memory, peformance is great and CPU fallback
> works. Work is in progress to better handle these two cases generically. For
> now, sometimes the app need to get involved, but this is only happens on
> embedded/controlled kind of use cases. What matters is that application that
> needs this can do it.
>
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/gst-plugins-base/gst-libs/gst/allocators/gstdmabuf.c

Yeah, I've heard complains about that before with people asking if we 
couldn't map buffers exporter by the GPU as cacheable and then flush it 
on demand.

For i915 that's more or less possible because it just uses stolen system 
memory, but pretty much any other dGPU uses local memory and mapping a 
PCIe BAR cacheable is really a no-go.

>> This design was then used by us with various media players on different
>> customer projects, including QNAP https://www.qnap.com/en/product/ts-877
>> as well as the newest Tesla
>> https://www.amd.com/en/products/embedded-automotive-solutions
>>
>> I won't go into the details here, but we are using exactly the approach
>> I've outlined to let userspace control the DMA between the different
>> device in question. I'm one of the main designers of that and our
>> multimedia and mesa team has up-streamed quite a number of changes for
>> this project.
>>
>> I'm not that well into different ARM based solutions because we are just
>> recently getting results that this starts to work with AMD GPUs, but I'm
>> pretty sure that the design should be able to handle that as well.
>>
>> So we have clearly prove that this design works, even with special
>> requirements which are way more complex than what we are discussing
>> here. We had cases where we used GStreamer to feed DMA-buf handles into
>> multiple devices with different format requirements and that seems to
>> work fine.
> Sounds like you have a love/hate relationship with GStreamer. Glad the framework
> is working for you too. The framework have had bidirectional memory allocation
> for over a decade, it also has context sharing for stacks like
> D3D11,12/GL/Vulkan/CUDA etc. I strictly didn't understand what you were
> complaining about. As a vendor, you can solve all this in your BSP. Though,
> translating BSP patches into a generic upstream-able features is not as simple.
> The solution that works for vendor is usually the most cost effective one. I'm
> sure, Tesla or AMD Automotive are no exceptions.

The framework is indeed great. It's just that customers often come up 
with their own sources/sinks which then obviously don't go upstream.

The LGPL was sometimes helpful to get people involved, but most often 
just leaves to much opportunity to develop a throw away solution.

>> -----
>> What is clearly a bug in the kernel is that we don't reject things which
>> won't work correctly and this is what this patch here addresses. What we
>> could talk about is backward compatibility for this patch, cause it
>> might look like it breaks things which previously used to work at least
>> partially.
> I did read your code review (I don't class this discussion as a code review).
> You where asked to address several issues, clearly a v2 is needed.
>
> 1. Rob Clark stated the coherency is not homogeneous in many device drivers. So
> your patch will yield many false positives. He asked if you could think of a
> "per attachement" solution, as splitting drivers didn't seem like the best
> approach (and it would have to happen at the same time anyway).

That should already be addressed. The flag is intentionally per buffer 
and only gets check as pre condition the framework itself.

So for example importing a buffer which requires CPU cache coherency is 
still possible, but then creating the framebuffer fails. This is pretty 
much the handling we already have, just not driver specific any more.

> 2. Lucas raised a concern, unfortunately no proof yet, that this may cause
> regressions in existing userspace application. You stated that the application
> must be wrong, yet this would break Linus rule #1. I'm not participating in that
> discussion, I tried to reproduced, but appart from writing an app that will
> break, I haven't found yet. But it feels like the way forward is to ensure each
> exporter driver can override this in case it has a good reason to do so.

Yes, that's what I meant that we should discuss this. Essentially we 
have the option between an application using corrupted data or breaking 
in the first place. I tend to say that the second is less harmful, but 
that's not a hard opinion.

> As a third option, a safer approach would be to avoid reusing a flawed mechanism
> to detect device coherency (or rephrased, accept that device coherency isn't
> homogeneous). Communicate this back another way. this means patching all the
> drivers, but at least each driver maintainer will be able to judge with their HW
> knowledge if this is going to regress or not. When I first looked at it, I
> wanted to experiment with enabling cache in vb2 contiguous allocator. I was
> thinking that perhaps I could have bracketing, and state changes triggered by
> the attach call, all based on the device coherency, but now that I saw Rob Clark
> comment, I feel like this is flawed.

Yeah, that won't work. Daniel V also noted multiple times that we could 
do this in the attach callback, but attaching should really be something 
done only once.

If you want device which write to the buffers with the CPU and devices 
which don't snoop to work together on system memory then DMA Heaps are 
really the way to go.

Just going to extend the patch set to the cases we have in amdgpu and 
i915 as well.

Thanks,
Christian.

>
> happy v2,
> Nicolas


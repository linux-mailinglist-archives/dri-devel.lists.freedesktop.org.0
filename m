Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C6619313
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 10:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10A110E025;
	Fri,  4 Nov 2022 09:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D642F10E025
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 09:03:17 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id 13so11631090ejn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xnK6kWVXoqnNcDEY5vyrY6CV3Lr2l3QPzy5usl2/3wI=;
 b=Wvt10HlgwLHq9bwijyln95eMHIZhkk5KRBOGybT2B2YtvE7DA3xK4r6DvcYE13vU1f
 GbXARg/5G96S+A/7LJcvC/8L8TNl9KD/Oq+EdpMkXZcRAAzCjVNzwDr68OBCJgXt233S
 AunheYZ7aQrkcfYyy1AD259wjqhyvaT8w64TV2TRYSr2MlTw3Fc0W29A3lfOT0imK5IY
 XVzxu8heNPV4N0HLiMRAS44z0Cp6DorOLxNsFMQS1VVfobCgjy6zLeGcQszvprqpnQyL
 yftBUymAvtrDOgU6G0XsKL+lIxs2NIpmQfbjh+yz2JL2Mu2H4qwAJqMzVCqpk5O8f6Ro
 GulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xnK6kWVXoqnNcDEY5vyrY6CV3Lr2l3QPzy5usl2/3wI=;
 b=pkBjdi4Zup3JtfFQdIba+QPZria3FfaNH0WRVTjfOHBLv2xvVdlhlc+kVkjmGEhLmd
 7hE9NGg+pwByX7yOJk0rBiwB0v3Ej+tjx9mfG84E0fNmeXhzNlv85tr0Nn1Ymo/YWIL/
 niDs8G32nPQIAg6II2YUsScOvej6p8vI/UUu6VHoX7NrbfTKDdT0uZtv+tEZ/nakb69m
 iTAefpMoJAikIkhtAJcIoC5kSAWcWAZuJ7JQbwvfoknO2R0So4mgd+i45ZYDBcB71flw
 TTzOigHbm2JbWiaMkAlmzNqDEIo+hG+VHj/eFeKxLdmWPtFNwld6QsK0IBkDO3ZCSpfq
 z0yA==
X-Gm-Message-State: ACrzQf1QQheBvFr4+pNqlaN9jLR0TuSN/7Q3GaSNRBHYBt6TfU8Xom6v
 PhLHlWVBULRLuImCDo79cvc=
X-Google-Smtp-Source: AMsMyM4qBvcpDi1ZpdbEdg42v7bUNRJlZjvUmHzExHJZrdG4n26KhU60AgcVh9NXDVvQnmaR3OczeQ==
X-Received: by 2002:a17:907:7d8f:b0:78e:2cba:560f with SMTP id
 oz15-20020a1709077d8f00b0078e2cba560fmr33608159ejc.173.1667552596239; 
 Fri, 04 Nov 2022 02:03:16 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:13f7:f69a:a72b:6707?
 ([2a02:908:1256:79a0:13f7:f69a:a72b:6707])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090607c400b007803083a36asm1517757ejc.115.2022.11.04.02.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 02:03:15 -0700 (PDT)
Message-ID: <441e7155-2fa3-e34f-1bf6-706a0e5698d8@gmail.com>
Date: Fri, 4 Nov 2022 10:03:14 +0100
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <90a1fb6101483971ef14d22370aac50d494a4752.camel@ndufresne.ca>
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

Am 03.11.22 um 23:16 schrieb Nicolas Dufresne:
> [SNIP]
>> We already had numerous projects where we reported this practice as bugs
>> to the GStreamer and FFMPEG project because it won't work on x86 with dGPUs.
> Links ? Remember that I do read every single bugs and emails around GStreamer
> project. I do maintain older and newer V4L2 support in there. I also did
> contribute a lot to the mechanism GStreamer have in-place to reverse the
> allocation. In fact, its implemented, the problem being that on generic Linux,
> the receiver element, like the GL element and the display sink don't have any
> API they can rely on to allocate memory. Thus, they don't implement what we call
> the allocation offer in GStreamer term. Very often though, on other modern OS,
> or APIs like VA, the memory offer is replaced by a context. So the allocation is
> done from a "context" which is neither an importer or an exporter. This is
> mostly found on MacOS and Windows.
>
> Was there APIs suggested to actually make it manageable by userland to allocate
> from the GPU? Yes, this what Linux Device Allocator idea is for. Is that API
> ready, no.

Well, that stuff is absolutely ready: 
https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/heaps/system_heap.c#L175 
What do you think I'm talking about all the time?

DMA-buf has a lengthy section about CPU access to buffers and clearly 
documents how all of that is supposed to work: 
https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-buf.c#L1160 
This includes braketing of CPU access with dma_buf_begin_cpu_access() 
and dma_buf_end_cpu_access(), as well as transaction management between 
devices and the CPU and even implicit synchronization.

This specification is then implemented by the different drivers 
including V4L2: 
https://elixir.bootlin.com/linux/latest/source/drivers/media/common/videobuf2/videobuf2-dma-sg.c#L473

As well as the different DRM drivers: 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c#L117 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c#L234

This design was then used by us with various media players on different 
customer projects, including QNAP https://www.qnap.com/en/product/ts-877 
as well as the newest Tesla 
https://www.amd.com/en/products/embedded-automotive-solutions

I won't go into the details here, but we are using exactly the approach 
I've outlined to let userspace control the DMA between the different 
device in question. I'm one of the main designers of that and our 
multimedia and mesa team has up-streamed quite a number of changes for 
this project.

I'm not that well into different ARM based solutions because we are just 
recently getting results that this starts to work with AMD GPUs, but I'm 
pretty sure that the design should be able to handle that as well.

So we have clearly prove that this design works, even with special 
requirements which are way more complex than what we are discussing 
here. We had cases where we used GStreamer to feed DMA-buf handles into 
multiple devices with different format requirements and that seems to 
work fine.

-----

But enough of this rant. As I wrote Lucas as well this doesn't help us 
any further in the technical discussion.

The only technical argument I have is that if some userspace 
applications fail to use the provided UAPI while others use it correctly 
then this is clearly not a good reason to change the UAPI, but rather an 
argument to change the applications.

If the application should be kept simple and device independent then 
allocating the buffer from the device independent DMA heaps would be 
enough as well. Cause that provider implements the necessary handling 
for dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().

I'm a bit surprised that we are arguing about stuff like this because we 
spend a lot of effort trying to document this. Daniel gave me the job to 
fix  this documentation, but after reading through it multiple times now 
I can't seem to find where the design and the desired behavior is unclear.

What is clearly a bug in the kernel is that we don't reject things which 
won't work correctly and this is what this patch here addresses. What we 
could talk about is backward compatibility for this patch, cause it 
might look like it breaks things which previously used to work at least 
partially.

Regards,
Christian.

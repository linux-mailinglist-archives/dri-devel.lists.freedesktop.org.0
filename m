Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB17BD78F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AF910E0E9;
	Mon,  9 Oct 2023 09:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EA110E0E9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696844924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iKA7IBMMtkOdCeJTfchzFCAqPgvdonmBkFypkrL0c4=;
 b=JOUuXIbEV98bbg7bpdV0NOIBEOXICRsJMGNApVw4cyW5jA9uUs5Uj1Ey4IPyGqfBrjhhX1
 gtRjjkaiamstJHw4/cmO54qt16U9nbDjOiw0z7J1VkGsQM+2mRih+2/qaSy1CYPaR3+OGr
 8mQtRGco+G2L08b36ngERPaFJ+AGCFE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-2lgL7HfPN5KB9kKIhqffwQ-1; Mon, 09 Oct 2023 05:48:33 -0400
X-MC-Unique: 2lgL7HfPN5KB9kKIhqffwQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so27901475e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696844911; x=1697449711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3iKA7IBMMtkOdCeJTfchzFCAqPgvdonmBkFypkrL0c4=;
 b=kV4XRJuXn8p+Eq2QN4NJY/GeBjRR8Ns5xxnO9+K44QO9XnIph80PstHSmkeBb5yjEt
 i+XJ8ryPOCR9l69FZN4250Bf9V/dq+NOfmmX62nxnMWuAZ+ubWmWj9XEFLolswTYEf0a
 S3lStxWnu2RFFvNtRClb4xorc1d4Z62o7BUTFNtbkS4Q+dCMBDIYX7p7+4f6PCgz9PuV
 SZYp90ulYDQ5vqFFrYbMgK96u0QZOoHZSkvPLp+McmcJlVRTVz7sEcIMIYuaZdNDxORN
 sX/OAxwdDXg7hU4KZdJKcbr9hW7gKHPu/7jiJYYOKN2WJK+0XXk0wB7jx0M4j/Zqichb
 yBOw==
X-Gm-Message-State: AOJu0Yw2yNBG/1gOg/IZDhKCuC9orixOG7H6vOSxhgRQ5iKlNdAU+9JD
 LSxc12PVGUYnYKCdNenaPrL4/lJFiG6nHmsLlXSIAdTTHy1Uv9PLEpLrmE+s+IJ1PYXj70T0qit
 SjDnLq0T2EW7ZQWwXxW9BJbu+zV7f
X-Received: by 2002:a7b:c8c8:0:b0:402:cf9f:c02d with SMTP id
 f8-20020a7bc8c8000000b00402cf9fc02dmr12490730wml.8.1696844911459; 
 Mon, 09 Oct 2023 02:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI6jXpnle/jO9KFa6nIaoybGXmuREYBsurSZwge9wMapVw5fu+Nai3LnLybE4APdKXlpQ2OQ==
X-Received: by 2002:a7b:c8c8:0:b0:402:cf9f:c02d with SMTP id
 f8-20020a7bc8c8000000b00402cf9fc02dmr12490714wml.8.1696844911041; 
 Mon, 09 Oct 2023 02:48:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc40a000000b003fc06169ab3sm12924576wmi.20.2023.10.09.02.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 02:48:30 -0700 (PDT)
Message-ID: <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
Date: Mon, 9 Oct 2023 11:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
To: Maxime Ripard <mripard@kernel.org>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, tzimmermann@suse.de,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 10:28, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Oct 09, 2023 at 09:47:49AM +0200, Jocelyn Falempe wrote:
>> On 06/10/2023 18:54, Noralf Trønnes wrote:
>>>
>>>
>>> On 10/6/23 16:35, Maxime Ripard wrote:
>>>> Hi Jocelyn,
>>>>
>>>> On Thu, Oct 05, 2023 at 11:16:15AM +0200, Jocelyn Falempe wrote:
>>>>> On 05/10/2023 10:18, Maxime Ripard wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Tue, Oct 03, 2023 at 04:22:45PM +0200, Jocelyn Falempe wrote:
>>>>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>>>>> index 89e2706cac56..e538c87116d3 100644
>>>>>>> --- a/include/drm/drm_drv.h
>>>>>>> +++ b/include/drm/drm_drv.h
>>>>>>> @@ -43,6 +43,7 @@ struct dma_buf_attachment;
>>>>>>>     struct drm_display_mode;
>>>>>>>     struct drm_mode_create_dumb;
>>>>>>>     struct drm_printer;
>>>>>>> +struct drm_scanout_buffer;
>>>>>>>     struct sg_table;
>>>>>>>     /**
>>>>>>> @@ -408,6 +409,19 @@ struct drm_driver {
>>>>>>>     	 */
>>>>>>>     	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>>>>>> +	/**
>>>>>>> +	 * @get_scanout_buffer:
>>>>>>> +	 *
>>>>>>> +	 * Get the current scanout buffer, to display a panic message with drm_panic.
>>>>>>> +	 * It is called from a panic callback, and must follow its restrictions.
>>>>>>> +	 *
>>>>>>> +	 * Returns:
>>>>>>> +	 *
>>>>>>> +	 * Zero on success, negative errno on failure.
>>>>>>> +	 */
>>>>>>> +	int (*get_scanout_buffer)(struct drm_device *dev,
>>>>>>> +				  struct drm_scanout_buffer *sb);
>>>>>>> +
>>>>>>
>>>>>> What is the format of that buffer? What is supposed to happen if the
>>>>>> planes / CRTC are setup in a way that is incompatible with the buffer
>>>>>> format?
>>>>>
>>>>> Currently, it only supports linear format, either in system memory, or
>>>>> iomem.
>>>>> But really what is needed is the screen size, and a way to write pixels to
>>>>> it.
>>>>> For more complex GPU, I don't know if it's easier to reprogram the GPU to
>>>>> linear format, or to add a simple "tiled" support to drm_panic.
>>>>> What would you propose as a panic interface to handle those complex format ?
>>>>
>>>> It's not just about tiling, but also about YUV formats. If the display
>>>> engine is currently playing a video at the moment, it's probably going
>>>> to output some variation of multi-planar YUV and you won't have an RGB
>>>> buffer available.
>>>>
>>>
>>> I had support for some YUV formats in my 2019 attempt on a panic
>>> handler[1] and I made a recording of a test run as well[2] (see 4:30 for
>>> YUV). There was a discussion about challenges and i915 can disable
>>> tiling by flipping a bit in a register[3] and AMD has a debug
>>> interface[4] they can use to write pixels.
>>
>> I only added support for the format used by simpledrm, because I don't want
>> to add support for all possible format if no driver are using it.
> 
> Sure.
> 
>> It should be possible to add YUV format too.
>>
>> I also prefer to convert only the foreground/background color, and then
>> write directly into the buffers, instead of converting line by line.
>> It works for all format where pixel size is a multiple of byte.
> 
> My point was that there might not be a buffer to write to.
> DMA_ATTR_NO_KERNEL_MAPPING exists, dma-buf might be unaccessible, unsafe
> or be completely out of control of the kernel space, or even not be
> accessible by the system at all (when doing secure playback for example,
> where the "trusted" component will do the decoding and will only give
> back a dma-buf handle to a secure memory buffer).
> 
> I appreciate that we probably don't want to address these scenarios
> right now, but we should have a path forward to support them eventually.
> Copying the panic handler content to the buffer is optimistic and won't
> work in all the scenarios described above, pretty much requiring to
> start from scratch that effort.
> 
>>> https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/
>>> [2] https://youtu.be/lZ80vL4dgpE
>>> [3]
>>> https://lore.kernel.org/dri-devel/20190314095004.GP2665@phenom.ffwll.local/
>>> [4]
>>> https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@amd.com/
>>>
>>>> Same story if you're using a dma-buf buffer. You might not even be able
>>>> to access that buffer at all from the CPU or the kernel.
>>>>
>>>> I really think we should have some emergency state ready to commit on
>>>> the side, and possibly a panic_commit function to prevent things like
>>>> sleeping or waiting that regular atomic_commit can use.
>>>>
>>>> That way, you know have all the resources available to you any time.
>>
>> I think reusing the atomic commit functions might be hard, because there are
>> locks/allocation/threads hidden in drivers callback.
> 
> Allocations are bugs as far as I'm concerned. Allocations in
> atomic_commit path are pretty big hint that you're doing something wrong
> so I wouldn't worry too much about them. For locking, yeah... Which is
> why I was suggesting an emergency atomic_commit of some sorts (for
> planes only?). Switching back to whatever we were doing to an RGB plane
> should be simple enough for most drivers and probably can be done safely
> enough on most drivers without any locks.
> 
> And you don't need to support all kinds of tiling, YUV or RGB variants.

So if I understand correctly, drm_panic would pre-allocate a 
plane/commit, and use that when a panic occurs ?
I have two concern about this approach:
- How much memory would be allocated for this ? a whole framebuffer can 
be big for just this use case.
- I find it risky to completely reconfigure the hardware in a panic handler.

Also how many drivers would need this ?

Currently I was mostly considering x86 platform, so:

simpledrm/ast/mgag200 which works well with the get_scanout_buffer().

i915/amdgpu/nouveau, which are quite complex, and will need to do their 
own thing anyway.


> 
>> I'm more in favor of an emergency function, that each driver has to
>> implement, and use what the hardware can do to display a simple frame
>> quickly. get_scanout_buffer() is a good start for simple driver, but
>> will need refactoring for the more complex case, like adding a
>> callback to write pixels one by one, if there is no memory mapped
>> buffer available.
> 
> Sorry, I'm not quite sure what you mean there, where would you write the
> pixel to?

It was mentioned by Noralf, about the amdgpu driver:

https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@amd.com/

They have a slow "debug interface" that you can write to, and can be 
used for the panic handler. It's not memory mapped, so you have to write 
pixels one by one.

So for the struct drm_scanout_buffer, I can add a function pointer to a 
write_pixel(u32 x, u32 y, u32 color)
So if the iosys map is null, it will use that instead.

> 
> Maxime


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB167BFD8A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799A910E36B;
	Tue, 10 Oct 2023 13:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16DE10E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696944761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNx1rgkKImK52eBTeMWhX0WcA66AfV9XLylLD9mjEhM=;
 b=TRoquPL+hWMxWTHhNGPZE/gxc+4RfUQae/AHV0P6WvERK1sWkiMa6Kqj8kPpKJ32MxA+aE
 UybybtegMyhN/pUX3ZlZshNPJ3UW+ZWigTB5j85M/8LQ0GRafelWK/A9ZYhmwC6uOcbCWs
 VlEZhiOu3Fce3VWSufH24uLsjukHzYo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-tCO_huU3NviHTyhI-nAHxg-1; Tue, 10 Oct 2023 09:32:40 -0400
X-MC-Unique: tCO_huU3NviHTyhI-nAHxg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32480c0ad52so4242508f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696944759; x=1697549559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WNx1rgkKImK52eBTeMWhX0WcA66AfV9XLylLD9mjEhM=;
 b=clXLKoQ/PVAG4hX9UDo64B0tLEvMvHOPkNDfzJPVQarWANqmPRB2WaOG9XCbzXi/rB
 RF9cTfGRyTfRRqWTVEzYZVSzH3EAgjZPDOwB9O1+UnfuFtVfDCBvneqDhZbLNLQ7OeRF
 NRhFSk8sjK3AZnknOwB54oqp1+LLmbjYzHn74yQzfU0Q87FTFbWz97kuGdu5/ZCw55YW
 kEv/FC83oKXyPJpNJVpgtn+qAOjKIx5RvwTrOOuuNE2jXaYQd/zM8iHXxN8M7IP/J0/Y
 R7gZGMI/xUo8bjhC+qTXZ2l97Xe4oNvCLZvBYV4SIbIIepYf6cqzepG3UaWvG7vh/o8o
 xC2Q==
X-Gm-Message-State: AOJu0YzwvhNHauGm+0J7P5yJ9oADgdlsw3QOk2XH+sdvkPUj4Mtm7JMR
 HaoG6kA+2pvMVhQQ/0skYMQ8FfH3YQkSm0FerCxldc7cepnc/cGJMU8GxqDG5KqHPPnZ2rHaQi9
 iC7ePsBzj+8977qCmZyFCz9VrFEln
X-Received: by 2002:adf:fdc7:0:b0:31f:f982:5395 with SMTP id
 i7-20020adffdc7000000b0031ff9825395mr16764367wrs.35.1696944759256; 
 Tue, 10 Oct 2023 06:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEarVG0yXq10yw5vDhuoS0zFwQri3TvMwDCo3Kg/iXrNEqBsUEweAyevD9Rl2iDZjO44M5og==
X-Received: by 2002:adf:fdc7:0:b0:31f:f982:5395 with SMTP id
 i7-20020adffdc7000000b0031ff9825395mr16764343wrs.35.1696944758860; 
 Tue, 10 Oct 2023 06:32:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 bp22-20020a5d5a96000000b0032ce54bacb1sm2198915wrb.0.2023.10.10.06.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 06:32:38 -0700 (PDT)
Message-ID: <5009b7ab-21fa-7e09-bd94-fc4fbcbc5995@redhat.com>
Date: Tue, 10 Oct 2023 15:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
References: <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
 <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
 <18af6c07-e2c1-4c77-8083-2e82d29f16c9@suse.de>
 <nkfwl7bs7mbe4xqj3skktlkfoh5osgvdx5jj3oa7dfdfetxnxm@eutubfkjbhmp>
 <dfc93641-b163-4114-97bc-c481b15f16b8@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <dfc93641-b163-4114-97bc-c481b15f16b8@suse.de>
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
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2023 15:05, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.10.23 um 11:33 schrieb Maxime Ripard:
> [...]
>>> We also have discussions about kexec/kdump support. Here we'd need to
>>> retrieve the scanout address, forward it to the kexec kernel and put
>>> simpledrm onto that framebuffer until the regular driver takes over.
>>
>> Generically speaking, there's strictly no guarantee that the current
>> scanout buffer is accessible by the CPU. It's not even a driver issue,
>> it's a workload issue, so it will affect 100% of the times some users,
>> and some 0% of the time.
> 
> And I'd be OK with that. It's all best effort anyway.
> 
>>
>>> An interface like get_scanout_buffer will be helpful for this use
>>> case. So it makes sense to use it for the panic handler as well.
>>
>> It won't be helpful because the vast majority of the ARM drivers (and
>> thus the vast majority of the KMS drivers) won't be able to implement it
>> properly and reliably.
> 
> The barrier for firmware-based drivers is low: a pre-configured display 
> and mmap'able framebuffer memory. And it's assumed that a callback for 
> kexec would attempt to configure hardware accordingly. If a system 
> really cannot provide this, so be it.
> 
>>
>>>>> run the atomic_update() on it, and return this commit's framebuffer ?
>>>>>
>>>>> That way each driver have a better control on what the panic 
>>>>> handler will
>>>>> do.
>>>>> It can even call directly its internal functions, to avoid the 
>>>>> locks of the
>>>>> drm generic functions, and make sure it will only change the format 
>>>>> and base
>>>>> address.
>>>>> That's a bit more work for each driver, but should be more reliable 
>>>>> I think.
>>>>
>>>> I don't think that better control there is a good idea, it's a path 
>>>> that
>>>> won't get tested much so we'd be better off not allowing drivers to
>>>> deviate too much from the "ideal" design.
>>>>
>>>> What I had in mind is something like:
>>>>
>>>>     - Add a panic hook in drm_mode_config_funcs, with a
>>>>       drm_atomic_helper_panic helper;
>>>>
>>>>     - Provide an atomic_panic hook or something in 
>>>> drm_plane_helper_funcs;
>>>>
>>>>     - If they are set, we register the drm_panic handler;
>>>>
>>>>     - The handler will call drm_mode_config_funcs.panic, which will 
>>>> take
>>>>       its prepared state, fill the framebuffer it allocated with the
>>>>       penguin and backtrace, call 
>>>> drm_plane_helper_funcs.atomic_panic().
>>>>
>>>>     - The driver now updates the format and fb address.
>>>>
>>>>     - Halt and catch fire
>>>>
>>>> Does that make sense?
>>>
>>> Please see my other replies. I find this fragile, and unnecessary for 
>>> cases
>>> where there already is a working scanout buffer in place.
>>
>> And please see my other replies. Depending on a working scanout buffer
>> in place being accessible by the CPU is incredibly limiting. Ignoring it
>> when I'm pointing that out won't get us to a solution acceptable for
>> everyone.
>>
>>> It's something a driver could implement internally to provide a
>>> scanout buffer if none has been set up already.
>>
>> Some drivers need extra resources when setting up a plane. VC4 for
>> example need for every plane to allocate multiple internal SRAM buffers.
>> Just allocating an extra framebuffer won't cut it.
>>
>> This is tied to the state so far, so I guess we would need to allocate a
>> new state. Oh, and if we have several drivers that need to allocate that
>> extra framebuffer and state, we could make it part of the core or turn
>> it into a helper?
> 
> I mentioned that even the simple drivers hold locks during the atomic 
> commit. Some of the drivers use vmap/vunmap, which might make problems 
> as well. It's used in the context of damage handling, which also makes 
> no sense here. So the regular atomic helpers most likely won't work.
> 
> It sounds to me as if you're essentially asking for something like a 
> flush or sync operation.
> 
> Stepping back from get_scanout_buffer for a moment and adopting your 
> proposal from above, I can see something like this working:
> 
>    - the driver provides a panic callback in struct drm_driver
> 
>    - DRM registers a panic handler to invokes the callback
> 
>    - the panic callback has a scanout buffer from somewhere (currently 
> active, prepared, from firmware, plain memory, etc)
> 
>    - we provide a helper that fills the scanout buffer with information
> 
>    - the driver then updates the hardware from/with the scanout buffer; 
> details depend on the hardware
> 
> The final step is like a flush or commit operation. To give some 
> examples: The simple drivers of this patchset probably don't have to do 
> anything. Drivers with command/packet queues could attempt to send the 
> necessary commands to the device.

Yes that was the second question in the cover letter.
Some drivers probably want a flush_scanout_buffer() to send the 
framebuffer to the hardware.
That callback can be in struct drm_driver as well.

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>>
>> Maxime
> 


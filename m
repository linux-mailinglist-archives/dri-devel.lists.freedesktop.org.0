Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE0397394
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DBF6EA4C;
	Tue,  1 Jun 2021 12:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154E06EA4C;
 Tue,  1 Jun 2021 12:51:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id t15so8512316eju.3;
 Tue, 01 Jun 2021 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LI0Q78qyybBkkMEsr+53BUSl3nYRJ6x+2h/9IAbxxUY=;
 b=VKdk0ns61Yn4S6txkfIrHTZps2BR+EhkBrY3cOiEMz7uoGUJrX2UbMMhw39TpJ6HaA
 /hKxHP4ERPBMmdD0Bup17rbL/MTFskdZf6CiBiN2WiVEYoSEZMLw61nFDNpvQsKMqOW5
 DDhyRDS0GIlql6Xt8aZCiPQyU7A8FkBp9MaATka+iwXiVM3njdJ6/O6lAylaDmuFYzcp
 IpZOyU9tQutce/fTZEWyum/jgKbUC2G4o7p9OCpc8omKJBRwar3NZzbPgVXmEfb2qkZf
 BNpuSsSYaiSA3rhFmxNSp2VSNstdScwrsotQmdIODWIL4P05hngfuhvnENRV3BSUHBwC
 FuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LI0Q78qyybBkkMEsr+53BUSl3nYRJ6x+2h/9IAbxxUY=;
 b=IKG86VYX47h8B2OBj3UUZaxJiyjLKeJr1okIr2rXnlNrhrU+S10OQ5vXDQDPsgetv0
 og+SU0uQ+CPMPOEBlz1LL+nZk/Tjnn/wJCPFHVnyXJQsWmEJxTnyHTSxA6ji1Or7pLgK
 5zmLa8pHykOQNI3yv8dwmHPlJ7TwjJLXIJ7DoxJ82swQ6zNGqLWB4u3p2YhgYjM3jX6W
 cfK4zyOKdBY9QETFMej+2P4MJgA1c8u834/fU+ABMaZwjDg2hrS47713Pm4E93ciJn6d
 NoKZXXCPRTqk5bNg5R0m0yv1VbCi6um/OQekejI9kABJ3SQYMDfd2PUKr23U3xaUR1gP
 K2xQ==
X-Gm-Message-State: AOAM531OBHa1Z6vj33i3xSnhWzCWYhaKFNfY3DxN3G8QTt7P3b5hIAU7
 tni7SwysogI1tEIIR02qjdo=
X-Google-Smtp-Source: ABdhPJxfHhVJTCFG+7O4JQAUHak1nqtXIuINi3ZdYSwNrlbe6iNuSLcojhERBx6Gywc1uF7SDziLLw==
X-Received: by 2002:a17:906:a203:: with SMTP id
 r3mr29420463ejy.361.1622551885668; 
 Tue, 01 Jun 2021 05:51:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5ee0:b6d9:de45:97bd?
 ([2a02:908:1252:fb60:5ee0:b6d9:de45:97bd])
 by smtp.gmail.com with ESMTPSA id zb19sm53476ejb.120.2021.06.01.05.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 05:51:24 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
Date: Tue, 1 Jun 2021 14:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.21 um 14:30 schrieb Daniel Vetter:
> On Tue, Jun 1, 2021 at 2:10 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 01.06.21 um 12:49 schrieb Michel Dänzer:
>>> On 2021-06-01 12:21 p.m., Christian König wrote:
>>>> Am 01.06.21 um 11:02 schrieb Michel Dänzer:
>>>>> On 2021-05-27 11:51 p.m., Marek Olšák wrote:
>>>>>> 3) Compositors (and other privileged processes, and display flipping) can't trust imported/exported fences. They need a timeout recovery mechanism from the beginning, and the following are some possible solutions to timeouts:
>>>>>>
>>>>>> a) use a CPU wait with a small absolute timeout, and display the previous content on timeout
>>>>>> b) use a GPU wait with a small absolute timeout, and conditional rendering will choose between the latest content (if signalled) and previous content (if timed out)
>>>>>>
>>>>>> The result would be that the desktop can run close to 60 fps even if an app runs at 1 fps.
>>>>> FWIW, this is working with
>>>>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 , even with implicit sync (on current Intel GPUs; amdgpu/radeonsi would need to provide the same dma-buf poll semantics as other drivers and high priority GFX contexts via EGL_IMG_context_priority which can preempt lower priority ones).
>>>> Yeah, that is really nice to have.
>>>>
>>>> One question is if you wait on the CPU or the GPU for the new surface to become available?
>>> It's based on polling dma-buf fds, i.e. CPU.
>>>
>>>> The former is a bit bad for latency and power management.
>>> There isn't a choice for Wayland compositors in general, since there can be arbitrary other state which needs to be applied atomically together with the new buffer. (Though in theory, a compositor might get fancy and special-case surface commits which can be handled by waiting on the GPU)
>>>
>>> Latency is largely a matter of scheduling in the compositor. The latency incurred by the compositor shouldn't have to be more than single-digit milliseconds. (I've seen total latency from when the client starts processing a (static) frame to when it starts being scanned out as low as ~6 ms with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620, lower than typical with Xorg)
>> Well let me describe it like this:
>>
>> We have an use cases for 144 Hz guaranteed refresh rate. That
>> essentially means that the client application needs to be able to spit
>> out one frame/window content every ~6.9ms. That's tough, but doable.
>>
>> When you now add 6ms latency in the compositor that means the client
>> application has only .9ms left for it's frame which is basically
>> impossible to do.
>>
>> See for the user fences handling the display engine will learn to read
>> sequence numbers from memory and decide on it's own if the old frame or
>> the new one is scanned out. To get the latency there as low as possible.
> This won't work with implicit sync at all.
>
> If you want to enable this use-case with driver magic and without the
> compositor being aware of what's going on, the solution is EGLStreams.
> Not sure we want to go there, but it's definitely a lot more feasible
> than trying to stuff eglstreams semantics into dma-buf implicit
> fencing support in a desperate attempt to not change compositors.

Well not changing compositors is certainly not something I would try 
with this use case.

Not changing compositors is more like ok we have Ubuntu 20.04 and need 
to support that we the newest hardware generation.

> I still think the most reasonable approach here is that we wrap a
> dma_fence compat layer/mode over new hw for existing
> userspace/compositors. And then enable userspace memory fences and the
> fancy new features those allow with a new model that's built for them.

Yeah, that's basically the same direction I'm heading. Question is how 
to fix all those details.

> Also even with dma_fence we could implement your model of staying with
> the previous buffer (or an older buffer at that's already rendered),
> but it needs explicit involvement of the compositor. At least without
> adding eglstreams fd to the kernel and wiring up all the relevant
> extensions.

Question is do we already have some extension which allows different 
textures to be selected on the fly depending on some state?

E.g. something like use new frame if it's available and old frame otherwise.

If you then apply this to the standard dma_fence based hardware or the 
new user fence based one is then pretty much irrelevant.

Regards,
Christian.

> -Daniel
>
>>>> Another question is if that is sufficient as security for the display server or if we need further handling down the road? I mean essentially we are moving the reliability problem into the display server.
>>> Good question. This should generally protect the display server from freezing due to client fences never signalling, but there might still be corner cases.
>>>
>>>
>


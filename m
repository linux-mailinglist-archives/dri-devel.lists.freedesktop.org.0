Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEA17C067
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 15:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD696E45F;
	Fri,  6 Mar 2020 14:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E7689B11
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 14:40:04 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 6so2690628wmi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 06:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UHD8Cjg7cxe0FqPGUpuHhNgIy9D9uE3DNlkPjJCU8G8=;
 b=l9aV7/iIMZWP7WExZGHmYOkk4/U6qN4T0pes5Cu/n3yRVNNMvlqwXVjFL/eECPwcRC
 0zfbRVw2vY3ZXn2qtFPJJfnYOaVr72U84zkD5uGe8cfrXdLT3SSjPnwe8G88GOrVFhuB
 p26/ZrbLxY/Hi4uovWbZoyYOG5/g2gZv3OUQdL8/RgRk/P1KVMOwQw4V1naKFzY97qEG
 zbUySt+FaP86FFKR6ypJkrZ7RjMRIfnccU7H2E3Hhm5yhH58GJ5hQBDG3IveGQwp51Zb
 JKCopBvF6mL6QBnRnjsTtDa2X3QkMPikLUpQvqYb4gpEP1zTXkREy1TV/LZuL1EiP1Q4
 51Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:cc:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UHD8Cjg7cxe0FqPGUpuHhNgIy9D9uE3DNlkPjJCU8G8=;
 b=SIuhgCd2hhp2BwwfhqaPtavgIkchQZVJ38Z/WQR0g8uYLmGfMGThw20PoH+q3TLNmK
 hn+Y9UvO0jMTp8YWgk1q0n0p6nGs4egSZwQePmzP+s1Fe9R39H3Qlw3YCi4bqfuCOfCW
 1uqWO+hDAguupZ05fDGADF9d0fe0cYB19HSvLuBuwMB7sK/pHHe/ouKsBSAIDuDSg6+w
 PILpPscO2MvH8NuCLqM6BoqTkFtcdM/Mc/x7ca8PNQ+F72rl5LooS8y6iecuKrHQfAKw
 C9OqR1sHIll8jevgpEtT3lLKdk2Heb5e5qZ0rDSjl5hiCeHOXkp8iyHyFdaRtVzBpc72
 vmWQ==
X-Gm-Message-State: ANhLgQ0sSrUHEeBdNZG30+xS5UAD79665/OBqTyZgq7cm4sN1/wfi7XI
 r3d1vJkgCLEMmFR03800Wi1txQ==
X-Google-Smtp-Source: ADFU+vtrd1NhrnDH8NuluvSgfA17Px/Wd7uZBkEak0FqLMyq7DnyB2Oz9NJXqvdh6uYeJUMWEuqtCQ==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr4285735wmc.52.1583505603072; 
 Fri, 06 Mar 2020 06:40:03 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2?
 ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id d15sm47329840wrp.37.2020.03.06.06.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 06:40:02 -0800 (PST)
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
 <20200303121029.5532669d@eldfell.localdomain>
 <20200303105325.bn4sob6yrdf5mwrh@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFgQGrnEkXyac15Wz8Opg43RTa=5cX0nN5=E_omb8oY8Q@mail.gmail.com>
 <20200303152541.68ab6f3d@eldfell.localdomain>
 <20200303173332.1c6daa09@eldfell.localdomain>
 <20200306101328.GR2363188@phenom.ffwll.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <27d09559-055a-7bf3-0f23-9948da0e1f76@baylibre.com>
Date: Fri, 6 Mar 2020 15:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200306101328.GR2363188@phenom.ffwll.local>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, nd <nd@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka, Brian, Daniel,

On 06/03/2020 11:13, Daniel Vetter wrote:
> On Tue, Mar 03, 2020 at 05:33:32PM +0200, Pekka Paalanen wrote:
>> On Tue, 3 Mar 2020 15:25:41 +0200
>> Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>>> On Tue, 3 Mar 2020 12:37:16 +0100
>>> Daniel Vetter <daniel@ffwll.ch> wrote:
>>>
>>>> On Tue, Mar 3, 2020 at 11:53 AM Brian Starkey <brian.starkey@arm.com> wrote:  
>>>>>
>>>>> Hi,
>>>>>
>>>>> On Tue, Mar 03, 2020 at 12:10:29PM +0200, Pekka Paalanen wrote:    
>>>>>> On Fri, 21 Feb 2020 10:08:42 +0100
>>>>>> Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>>>    
>> ...
>>>>>>> +/*
>>>>>>> + * Amlogic Video Framebuffer Compression modifiers
>>>>>>> + *
>>>>>>> + * Amlogic uses a proprietary lossless image compression protocol and format
>>>>>>> + * for their hardware video codec accelerators, either video decoders or
>>>>>>> + * video input encoders.
>>>>>>> + *
>>>>>>> + * It considerably reduces memory bandwidth while writing and reading
>>>>>>> + * frames in memory.
>>>>>>> + * Implementation details may be platform and SoC specific, and shared
>>>>>>> + * between the producer and the decoder on the same platform.    
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> after a lengthy IRC discussion on #dri-devel, this "may be platform and
>>>>>> SoC specific" is a problem.

This one is definitely only for the SCATTER modifier, not the DEFAULT and MEM_SAVING.

>>>>>>
>>>>>> It can be an issue in two ways:
>>>>>>
>>>>>> - If something in the data acts like a sub-modifier, then advertising
>>>>>>   support for one modifier does not really tell if the data layout is
>>>>>>   supported or not.

It's clearly not.

The DEFAULT and MEM_SAVING modifiers are clearly transferable, and their layout is
extremely simple. While we don't have the memory compression algorithm, the memory
layout is simple to describe and doesn't act as a sub-modifier.

The complexity lies in the SCATTER modifier, which describe an instant live memory
layout, that is not transferable and with an unknown and variable layout.

>>>>>>
>>>>>> - If you need to know the platform and/or SoC to be able to interpret
>>>>>>   the data, it means the modifier is ill-defined and cannot be used in
>>>>>>   inter-machine communication (e.g. Pipewire).

It's not the case for the DEFAULT and MEM_SAVING modifiers.

The SCATTER modifier is mandatory for the Amlogic G12A and G12B HW video decoder,
but the same HW is capable of displaying the non-SCATTER buffer for example.

>>>>>>    
>>>>>
>>>>> Playing devil's advocate, the comment sounds similar to
>>>>> I915_FORMAT_MOD_{X,Y}_TILED:
>>>>>
>>>>>  * This format is highly platforms specific and not useful for cross-driver
>>>>>  * sharing. It exists since on a given platform it does uniquely identify the
>>>>>  * layout in a simple way for i915-specific userspace.    
>>>>
>>>> Yeah which we regret now. We need to now roll out a new set of
>>>> modifiers for at least some of the differences in these on the
>>>> modern-ish chips (the old crap is pretty much lost cause anyway).
>>>>
>>>> This was kinda a nasty hack to smooth things over since we have epic
>>>> amounts of userspace, but it's really not a great idea (and no one
>>>> else really has epic amounts of existing userspace that uses tiling
>>>> flags everywhere, this is all new code).
>>>> -Daniel
>>>>   
>>>>> Isn't the statement that this for sharing between producer and decoder
>>>>> _on the same platform_ a similar clause with the same effect?
>>>>>
>>>>> What advantage is there to exposing the gory details? For Arm AFBC
>>>>> it's necessary because IP on the SoC can be (likely to be) from
>>>>> different vendors with different capabilities.
>>>>>
>>>>> If this is only for talking between Amlogic IP on the same SoC, and
>>>>> those devices support all the same "flavours", I don't see what is
>>>>> gained by making userspace care about internals.    
>>>>
>>>> The trouble is if you mix&match IP cores, and one of them supports
>>>> flavours A, B, C and the other C, D, E. But all you have is a single
>>>> magic modifier for "whatever the flavour is that soc prefers". So
>>>> someone gets to stuff this in DT.

This is not the case here, maybe I should explicit the "DEFAULT" modifier with
a bit like "BASIC" to explicitly define support for the currently defined
DEFAULT mode.

>>>>
>>>> Also eventually, maybe, perhaps ARM does grow up into the
>>>> client/server space with add-on pcie graphics, and at least for client
>>>> you very often end up with integrated + add-in pcie gpu. At that point
>>>> you really can't have magic per-soc modifiers anymore.  
>>>
>>> Hi,
>>>
>>> I also heard that Pipewire will copy buffers and modifiers verbatim
>>> from one machine to another when streaming across network, assuming
>>> that the same modifier means the same thing on all machines.[Citation needed]

Transferring AFBC buffers doesn't sound like a good idea to me....

>>>
>>> If that is something that must not be done with DRM modifiers, then
>>> please contact them and document that.
>>
>> Sorry, it's waypipe, not pipewire:
>> https://gitlab.freedesktop.org/mstoeckl/waypipe/
> 
> I do think this is very much something we want to make possible. They
> might pick a silly modifier (compression modifiers only compress bw, by
> necessity the lossless ones have to increase storage space so kinda dumb
> thing to push over the network if you don't add .xz or whatever on top).

The AFBC, and Amlogic FBC are not size optimized compressions, but really
layout and memory access optimized compressions, without a proper network
size compression, transferring plain NV12 would be the same.

> 
> I'm also hoping that intel's modifiers are definitely the one and only
> that we ever screwed up, and we should be getting those fixed in the near
> future too.

I'd like too.

> 
> So maybe what we should do instead is add a comment to the modifier docs
> that this stuff _is_ supposed to be transferrable over networks and work.

Only the "SCATTER" is not transferable, the other options are definitely
transferable, and across 6 families and at least between a minimum of 15
different upstream supported SoCs.

Should it be in the modifier description ? should I add a reserved bit
in the Amlogic modifier space describing it's non-transferable nature ?


> -Daniel
> 

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

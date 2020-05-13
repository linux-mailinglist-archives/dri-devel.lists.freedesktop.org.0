Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F51D0A4C
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 09:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696E26E9B5;
	Wed, 13 May 2020 07:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A29D6E9B5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 07:55:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e1so5668525wrt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 00:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aBPMqPAfx7rI2hbKY/RaurgcHE1iKygIj4PF78CqOAg=;
 b=Erhuej+TCF12WUzsp28HTUmTGGaaorZnxbMlJIVxRTntB6zCVOFeOXM3iZSKfCYeGk
 0Xc/qRtNi2gMNtZXGI7qGiUkxcVmAjs9JKfNGaY/O0aWyKUJFCt9iZGyOcsyjp+xdDix
 X8RB8j8AxBJe0Pqej/0mkno6pvmGOnM7Kgo+9LrOOYdfACT0saEH88WyVnMy8V2snR0E
 FSjJisn8mM5ICJB80LYz3aRCQlqUR270DYc+CaXo2K7vDzkLXD+gssQUBmsTvJRWQMoL
 cAfOzAF+SvF04DXQqsi24F6mcJ6dqi7Wnv8vEG2bMMOrq65EQRsbgU87Y9Fwh7zLCma0
 exvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=aBPMqPAfx7rI2hbKY/RaurgcHE1iKygIj4PF78CqOAg=;
 b=G+RcXUhLRJy/wLyPEP8eTY9DxMTrYhLbq+JaT6zEEtCpFmp6xFmleUsxbWF7ppcBJY
 jA3nhUzZQ55MemEiL+VbW6/R/xs7jrTP+vUO2lGcv84jDVHyL3eq0LLQZ/aJ8SuFONs3
 7K4TfTiu+HbenuaP7WSBrJnP9hOOKbgTKhc5Ucky33Ab0JSPmc7YesOSWUBSYV5g1mxB
 aBBLGj7UgWToZVB0qHeLdbKJwoBa8eURZulRT3uXpPqHJpsr8kRY8e5M34DHhmRmadNB
 E6piX1mVKRsMaj73Xhm3+WE0qk2FrE4LznJygOLXtcqRJC1BUy/2CK7+Ecme+7RchEKp
 LQeg==
X-Gm-Message-State: AGi0PuZiMGBSMoPQGX8I+blwPWoxpokr033FFs/qSXI7Lm+MlRgWAo+Y
 joUlLOADGs+VLWaOAJJWwwdAC3Ay
X-Google-Smtp-Source: APiQypK5VfapdagzwGPKHzaBG5j2Zf54EwQM6dgAZGSwavpsBibIE0BndmiCKbPCIPBAQQa3U6a73A==
X-Received: by 2002:adf:a298:: with SMTP id s24mr18782028wra.184.1589356531799; 
 Wed, 13 May 2020 00:55:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t6sm10485805wma.4.2020.05.13.00.55.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 00:55:31 -0700 (PDT)
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
 <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
 <CAKMK7uG3R4uve41MkkcFSiDJ+p=MwW81gcFW7NFENjKbdDUZ+g@mail.gmail.com>
 <CADnq5_NFDjOzgnjHOHEcjacd2dX1kA1QEzHp8=NweZg_b-82-A@mail.gmail.com>
 <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1b63d971-acb0-e365-14aa-03d61e9a23e9@gmail.com>
Date: Wed, 13 May 2020 09:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHv_Hj8BB8t_i=EXx1C4WXw1PnmxuTyNfrA=b5eQMaSLg@mail.gmail.com>
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
Reply-To: christian.koenig@amd.com
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Karoly Balogh \(Charlie/SGR\)" <charlie@scenergy.dfmk.hu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.05.20 um 09:19 schrieb Daniel Vetter:
> On Tue, May 12, 2020 at 8:22 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Tue, May 12, 2020 at 12:38 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Tue, May 12, 2020 at 3:22 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>> On Tue, May 12, 2020 at 5:40 AM Karoly Balogh (Charlie/SGR)
>>>> <charlie@scenergy.dfmk.hu> wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, 12 May 2020, Rui Salvaterra wrote:
>>>>>
>>>>>>> FWIW, on my last-generation PowerBook with RV350 (IIRC), there was a
>>>>>>> big performance difference between AGP and PCI GART. The latter was
>>>>>>> sort of usable for normal desktop operation, but not so much for
>>>>>>> OpenGL apps (which were usable with AGP).
>>>>>> I never really understood what were the issues with AGP on PowerPC
>>>>>> (well, Apple, the only ones I've tested) machines. I mean, did OS X also
>>>>>> disable AGP entirely, or did it have workarounds somewhere else on the
>>>>>> stack nobody was able to figure out?
>>>>> I don't know about OS X, but I doubt there is a major/blocker hardware
>>>>> issue, at least not one which affects every AGP machine.
>>>>>
>>>>> MorphOS' own Radeon driver uses the AGP facilities to some degree on all
>>>>> AGP PowerPC Macs supported by that OS, which is from PMac AGP Graphics
>>>>> (3,1) all the way up to the AGP G5 (7,3), including the various portables
>>>>> and the Mac mini G4. For example it can utilize it to stream video data
>>>>> directly from mainboard RAM, so you don't have to copy it with the CPU,
>>>>> allowing reasonably good 720p h264 video playback on most systems above
>>>>> the 1Ghz mark with the native MPlayer port. I'm sure the 3D part of the
>>>>> driver also use it to some degree, given the performance improvement we
>>>>> experienced when the AGP support was enabled (initially the system was
>>>>> running without it), but to which extent I can't say.
>>>> The problem is AGP doesn't support CPU cache snooping.  Technically
>>>> PCI must support coherent device access to system memory.  Unsnooped
>>>> access is an optional feature and some platforms may not support it at
>>>> all.  Unfortunately, AGP required unsnooped access.  x8t generally
>>>> provides a way to do this, but other platforms, not so much.  I don't
>>>> recall to what extent PowerPC supported this.  The Linux DMA API
>>>> doesn't really have a way to get uncached memory for DMA so there is
>>>> that too.  Windows and Mac may provide a way to do this depending on
>>>> the platforms.  What probably should have been done on AGP boards was
>>>> to use both the AGP GART and the device GART.  The former for uncached
>>>> memory (if the platform supported it) and the latter for cached
>>>> memory.  That never happened.
>>> Slight correction on the dma-api side of things: The dma-api very much
>>> can give you uncached memory, but only on some platforms, and the
>>> dma-api is very opinionated about which those are. And it refuses to
>>> tell you whether your memory ends up being uncached or cached. That's
>>> all done in the name of platform portability, which is good for most
>>> drivers, but just too much pain for gpu drivers.
>> Out of curiosity how do you do that without manually messing around
>> with PAT or MTRRs?
> i915 is even worse, we manually mess around with clflush. In
> userspace. So really there's 2 axis for dma memory: coherent vs.
> non-coherent (which is something the dma-api somewhat exposed), i.e.
> do you need to clflush or not, and cached vs uncached, i.e. are the
> PAT entries wc or wb.
>
> But yeah if you dont have PAT real uncached isn't possible, can't frob
> MTTR for individual pages. That also, to my understanding, why the dma
> api doesn't want to expose this to driver, but abstract it all away:
> On many tiny soc platforms all you have for uncached is an mttr (well
> the equivalent on that platform), so you anything you get from
> dma_alloc_coherent needs to come from there.

IIRC I once got it explained like this: On some platforms all you have a 
register with a value and if your address is above that value it is 
uncached and wc if it is below it is cached and wb.

> But then no one is ever going to plug in a big gpu into such a system
> and expect anything to work, so we really need an abstraction that
> works on a bit more than just x86 (so we don't dig around in platform
> stuff like updating PAT or issusing clflush anymore), but doesn't try
> to work everywhere linux runs, just on the few platforms people expect
> big gpus to work on. For all the kms-only drivers we have the dma api
> seems actually perfectly fine (essentially the cma helpes we have
> should be called dma helpers, since that's what they're using
> underneath for all buffer management).

That is unfortunately not true for AMD GPUs, people tend to put them 
into those embedded ARM or PowerPC boxes and just expect them to work.

On the other hand we have hardware/firmware engineers which assumed you 
always have USWC and we wonder for weeks why firmware loaded doesn't 
work....

Regards,
Christian.

>
> Cheers, Daniel
>
>> Alex
>>
>>> Otherwise all agree, agp is a mighty mess and essentially just
>>> crapshot outside of x86. It kinda worked for the much more static
>>> allocations for dri1, but with in-kernel memory managers all the cache
>>> flushing issues showed up big time and it all fell to pieces. Plus a
>>> lot of these host chipset back then where designed for the rather
>>> static windows gpu managers, so even on x86 the coherency issues for
>>> agp mode when used together with ttm or something else really dynamic
>>> is pretty bad because the hw just doesn't really cope and has all
>>> kinds of flushing troubles and races. I think the later agp chipsets
>>> were better.
>>> -Daniel
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

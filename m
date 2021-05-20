Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB72B38A438
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 12:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C804E6F3A8;
	Thu, 20 May 2021 10:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8949A6F3A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:00:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h16so18691395edr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3M+oi/O5PNaK1CoEoVeTrQPUtn5HClRQ4IqV6H7ywB0=;
 b=ECutEpYoSLJwIfLB40YxiH9/53GrDenulWP48XFUNPAqBD+38dYmu2Z5vvcxBUYgQb
 XjjgS07z6tEKkXNtmvugPXQXaHnzXKfpbzIljS1eQONR8c3aFBDsTtXrXp2fP49pcZ+g
 QC4bFjMB2LGQEBgKRaesKl0TnsWJq6UYMMMgghYSY6eThgw64sP0N4IVvgv91hIxoMEA
 l58d2sxPYZlDYuEOn46uT7ku1oYuRDoIl3+E4UCyyyKJKNs2PjIHNzsCD5mrXPYdFdci
 JIxUq8wibAQd5eNkhkux7qnftJGXk9728g6rPSU5FMf1AGiXS5cH3H20YX5ABKg2yGMl
 kuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3M+oi/O5PNaK1CoEoVeTrQPUtn5HClRQ4IqV6H7ywB0=;
 b=pXYoE7kaLDhCekX6SbUgvWCS73PLeqKqYAjMyaiNdjNVdLGjqQ+I8cQmJzVMGkNXlM
 qaWD68yhzx0MiDoCmhD/FWhQOQmPSIRpbmBgseQ8+T4v4l3YjJJQ0dWAS3dJ2/DnwG8B
 a8gESw2Q/dz/+wlAHYhcMojuFDNjXWoAnMjTvw9heQNZzh2PvammY9JO9T2IRAkAY3uM
 GQaXAeBgfM9yDeA/HWmEAfSNnSiwFVYIJ0suhL3Eme0jZFoAWMOh690uxhjuG98VolDl
 zHoQeSuypUvYVzr7ElgoNMFFON5BgPg+stRgNjP4yXUPwV3Ggh3hEVJaXmzRsLflisp+
 zh+g==
X-Gm-Message-State: AOAM532uetTIo83Y58ZyMHOBK3Jf5x6iuzgi/0QWk6sL+Y8vUvxYkh8q
 X81XBXjGWCHxFHabjryHhVg=
X-Google-Smtp-Source: ABdhPJyqzuQkZv+kPIgzMRzUKSnXiPG1wP7UO8Izi4/lkmucYVMWVA+waqVJ2TbfWhVCoCkjRVp5Bw==
X-Received: by 2002:a05:6402:2793:: with SMTP id
 b19mr3993069ede.191.1621504852223; 
 Thu, 20 May 2021 03:00:52 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a?
 ([2a02:908:1252:fb60:4635:589e:67a4:e02a])
 by smtp.gmail.com with ESMTPSA id di7sm1226481edb.34.2021.05.20.03.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 03:00:51 -0700 (PDT)
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
 <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
 <14524566-8854-4bc0-9f70-b7219c9fccfc@daenzer.net>
 <CAOFGe96VttW2VzAnx13ZXLBGcEDJMehGuOFifcr+pcbEOa-Brw@mail.gmail.com>
 <6f3e2628-7b39-417c-3bd2-c837c5367458@daenzer.net>
 <CAKMK7uFMQGth19OjWmeNGTeVFoAqxK2tYXYrvme+NuCSNLxLUQ@mail.gmail.com>
 <7cbba7b7-d7e5-9c76-c747-4e39542268a2@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4aa3ee97-f860-999f-9874-2b89b29c9634@gmail.com>
Date: Thu, 20 May 2021 12:00:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7cbba7b7-d7e5-9c76-c747-4e39542268a2@daenzer.net>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 10:13 schrieb Michel Dänzer:
> On 2021-05-20 9:55 a.m., Daniel Vetter wrote:
>> On Wed, May 19, 2021 at 5:48 PM Michel Dänzer <michel@daenzer.net> wrote:
>>> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
>>>> On Wed, May 19, 2021 at 5:52 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>>> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
>>>>>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>> On Tue, May 18, 2021 at 7:40 PM Christian König
>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
>>>>>>>>> On Tue, May 18, 2021 at 2:49 PM Christian König
>>>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>>> And as long as we are all inside amdgpu we also don't have any oversync,
>>>>>>>>>> the issue only happens when we share dma-bufs with i915 (radeon and
>>>>>>>>>> AFAIK nouveau does the right thing as well).
>>>>>>>>> Yeah because then you can't use the amdgpu dma_resv model anymore and
>>>>>>>>> have to use the one atomic helpers use. Which is also the one that
>>>>>>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl,
>>>>>>>>> so as soon as that lands and someone starts using it, something has to
>>>>>>>>> adapt _anytime_ you have a dma-buf hanging around. Not just when it's
>>>>>>>>> shared with another device.
>>>>>>>> Yeah, and that is exactly the reason why I will NAK this uAPI change.
>>>>>>>>
>>>>>>>> This doesn't works for amdgpu at all for the reasons outlined above.
>>>>>>> Uh that's really not how uapi works. "my driver is right, everyone
>>>>>>> else is wrong" is not how cross driver contracts are defined. If that
>>>>>>> means a perf impact until you've fixed your rules, that's on you.
>>>>>>>
>>>>>>> Also you're a few years too late with nacking this, it's already uapi
>>>>>>> in the form of the dma-buf poll() support.
>>>>>> ^^  My fancy new ioctl doesn't expose anything that isn't already
>>>>>> there.  It just lets you take a snap-shot of a wait instead of doing
>>>>>> an active wait which might end up with more fences added depending on
>>>>>> interrupts and retries.  The dma-buf poll waits on all fences for
>>>>>> POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.
>>>>> Note that the dma-buf poll support could be useful to Wayland compositors for the same purpose as Jason's new ioctl (only using client buffers which have finished drawing for an output frame, to avoid missing a refresh cycle due to client drawing), *if* it didn't work differently with amdgpu.
>>>>>
>>>>> Am I understanding correctly that Jason's new ioctl would also work differently with amdgpu as things stand currently? If so, that would be a real bummer and might hinder adoption of the ioctl by Wayland compositors.
>>>> My new ioctl has identical semantics to poll().  It just lets you take
>>>> a snapshot in time to wait on later instead of waiting on whatever
>>>> happens to be set right now.  IMO, having identical semantics to
>>>> poll() isn't something we want to change.
>>> Agreed.
>>>
>>> I'd argue then that making amdgpu poll semantics match those of other drivers is a pre-requisite for the new ioctl, otherwise it seems unlikely that the ioctl will be widely adopted.
>> This seems backwards, because that means useful improvements in all
>> other drivers are stalled until amdgpu is fixed.
>>
>> I think we need agreement on what the rules are, reasonable plan to
>> get there, and then that should be enough to unblock work in the wider
>> community. Holding the community at large hostage because one driver
>> is different is really not great.
> I think we're in violent agreement. :) The point I was trying to make is that amdgpu really needs to be fixed to be consistent with other drivers ASAP.

Well from my point of view I rather think that the rules of DMA-buf 
implicit sync should be fixed, cause those are based on an ancient DRM 
approach.

And I'm seriously not accepting any changes to amdgpu involving per BO 
flags for CS.

Regards,
Christian.



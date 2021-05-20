Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B524338B1C6
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0246F45A;
	Thu, 20 May 2021 14:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 661E36F45F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 14:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 2C09D20201C;
 Thu, 20 May 2021 16:31:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 7BmQALa4TkK6; Thu, 20 May 2021 16:30:59 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id C01E020201A;
 Thu, 20 May 2021 16:30:59 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1ljjhS-0010zu-HC; Thu, 20 May 2021 16:30:58 +0200
To: Daniel Vetter <daniel@ffwll.ch>
References: <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
 <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
 <14524566-8854-4bc0-9f70-b7219c9fccfc@daenzer.net>
 <CAOFGe96VttW2VzAnx13ZXLBGcEDJMehGuOFifcr+pcbEOa-Brw@mail.gmail.com>
 <6f3e2628-7b39-417c-3bd2-c837c5367458@daenzer.net>
 <CAKMK7uFMQGth19OjWmeNGTeVFoAqxK2tYXYrvme+NuCSNLxLUQ@mail.gmail.com>
 <7cbba7b7-d7e5-9c76-c747-4e39542268a2@daenzer.net>
 <YKZvx0UXYnJrfVw4@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
Message-ID: <9fcd6de3-a1f3-f7f8-e6c8-c7d69c18fad0@daenzer.net>
Date: Thu, 20 May 2021 16:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKZvx0UXYnJrfVw4@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-20 4:18 p.m., Daniel Vetter wrote:
> On Thu, May 20, 2021 at 10:13:38AM +0200, Michel Dänzer wrote:
>> On 2021-05-20 9:55 a.m., Daniel Vetter wrote:
>>> On Wed, May 19, 2021 at 5:48 PM Michel Dänzer <michel@daenzer.net> wrote:
>>>>
>>>> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
>>>>> On Wed, May 19, 2021 at 5:52 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>>>>
>>>>>> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
>>>>>>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>>>
>>>>>>>> On Tue, May 18, 2021 at 7:40 PM Christian König
>>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
>>>>>>>>>> On Tue, May 18, 2021 at 2:49 PM Christian König
>>>>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>>> And as long as we are all inside amdgpu we also don't have any oversync,
>>>>>>>>>>> the issue only happens when we share dma-bufs with i915 (radeon and
>>>>>>>>>>> AFAIK nouveau does the right thing as well).
>>>>>>>>>> Yeah because then you can't use the amdgpu dma_resv model anymore and
>>>>>>>>>> have to use the one atomic helpers use. Which is also the one that
>>>>>>>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl,
>>>>>>>>>> so as soon as that lands and someone starts using it, something has to
>>>>>>>>>> adapt _anytime_ you have a dma-buf hanging around. Not just when it's
>>>>>>>>>> shared with another device.
>>>>>>>>>
>>>>>>>>> Yeah, and that is exactly the reason why I will NAK this uAPI change.
>>>>>>>>>
>>>>>>>>> This doesn't works for amdgpu at all for the reasons outlined above.
>>>>>>>>
>>>>>>>> Uh that's really not how uapi works. "my driver is right, everyone
>>>>>>>> else is wrong" is not how cross driver contracts are defined. If that
>>>>>>>> means a perf impact until you've fixed your rules, that's on you.
>>>>>>>>
>>>>>>>> Also you're a few years too late with nacking this, it's already uapi
>>>>>>>> in the form of the dma-buf poll() support.
>>>>>>>
>>>>>>> ^^  My fancy new ioctl doesn't expose anything that isn't already
>>>>>>> there.  It just lets you take a snap-shot of a wait instead of doing
>>>>>>> an active wait which might end up with more fences added depending on
>>>>>>> interrupts and retries.  The dma-buf poll waits on all fences for
>>>>>>> POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.
>>>>>>
>>>>>> Note that the dma-buf poll support could be useful to Wayland compositors for the same purpose as Jason's new ioctl (only using client buffers which have finished drawing for an output frame, to avoid missing a refresh cycle due to client drawing), *if* it didn't work differently with amdgpu.
>>>>>>
>>>>>> Am I understanding correctly that Jason's new ioctl would also work differently with amdgpu as things stand currently? If so, that would be a real bummer and might hinder adoption of the ioctl by Wayland compositors.
>>>>>
>>>>> My new ioctl has identical semantics to poll().  It just lets you take
>>>>> a snapshot in time to wait on later instead of waiting on whatever
>>>>> happens to be set right now.  IMO, having identical semantics to
>>>>> poll() isn't something we want to change.
>>>>
>>>> Agreed.
>>>>
>>>> I'd argue then that making amdgpu poll semantics match those of other drivers is a pre-requisite for the new ioctl, otherwise it seems unlikely that the ioctl will be widely adopted.
>>>
>>> This seems backwards, because that means useful improvements in all
>>> other drivers are stalled until amdgpu is fixed.
>>>
>>> I think we need agreement on what the rules are, reasonable plan to
>>> get there, and then that should be enough to unblock work in the wider
>>> community. Holding the community at large hostage because one driver
>>> is different is really not great.
>>
>> I think we're in violent agreement. :) The point I was trying to make is
>> that amdgpu really needs to be fixed to be consistent with other drivers
>> ASAP.
> 
> It's not that easy at all. I think best case we're looking at about a one
> year plan to get this into shape, taking into account usual release/distro
> update latencies.
> 
> Best case.
> 
> But also it's not a really big issue, since this shouldn't stop
> compositors from using poll on dma-buf fd or the sync_file stuff from
> Jason: The use-case for this in compositors is to avoid a single client
> stalling the entire desktop. If a driver lies by not setting the exclusive
> fence when expected, you simply don't get this stall avoidance benefit of
> misbehaving clients. But also this needs a gpu scheduler and higher
> priority for the compositor (or a lot of hw planes so you can composite
> with them alone), so it's all fairly academic issue.

AFAIK current AMD GPUs have everything needed to make this work, it would just need to be hooked up for high priority EGL contexts (which at least mutter already uses when available) in amdgpu & radeonsi.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer

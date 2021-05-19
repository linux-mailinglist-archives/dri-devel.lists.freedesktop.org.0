Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE03F388C19
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C206E9B4;
	Wed, 19 May 2021 10:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 106F86E9B4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3BDEB20201B;
 Wed, 19 May 2021 12:52:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id RoD5Ispb2_Ev; Wed, 19 May 2021 12:52:55 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 783D120201A;
 Wed, 19 May 2021 12:52:55 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1ljJos-000hlM-LH; Wed, 19 May 2021 12:52:54 +0200
To: Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel@ffwll.ch>
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
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
Message-ID: <14524566-8854-4bc0-9f70-b7219c9fccfc@daenzer.net>
Date: Wed, 19 May 2021 12:52:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Tue, May 18, 2021 at 7:40 PM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>
>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
>>>> On Tue, May 18, 2021 at 2:49 PM Christian König
>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>
>>>>> And as long as we are all inside amdgpu we also don't have any oversync,
>>>>> the issue only happens when we share dma-bufs with i915 (radeon and
>>>>> AFAIK nouveau does the right thing as well).
>>>> Yeah because then you can't use the amdgpu dma_resv model anymore and
>>>> have to use the one atomic helpers use. Which is also the one that
>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl,
>>>> so as soon as that lands and someone starts using it, something has to
>>>> adapt _anytime_ you have a dma-buf hanging around. Not just when it's
>>>> shared with another device.
>>>
>>> Yeah, and that is exactly the reason why I will NAK this uAPI change.
>>>
>>> This doesn't works for amdgpu at all for the reasons outlined above.
>>
>> Uh that's really not how uapi works. "my driver is right, everyone
>> else is wrong" is not how cross driver contracts are defined. If that
>> means a perf impact until you've fixed your rules, that's on you.
>>
>> Also you're a few years too late with nacking this, it's already uapi
>> in the form of the dma-buf poll() support.
> 
> ^^  My fancy new ioctl doesn't expose anything that isn't already
> there.  It just lets you take a snap-shot of a wait instead of doing
> an active wait which might end up with more fences added depending on
> interrupts and retries.  The dma-buf poll waits on all fences for
> POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.

Note that the dma-buf poll support could be useful to Wayland compositors for the same purpose as Jason's new ioctl (only using client buffers which have finished drawing for an output frame, to avoid missing a refresh cycle due to client drawing), *if* it didn't work differently with amdgpu.

Am I understanding correctly that Jason's new ioctl would also work differently with amdgpu as things stand currently? If so, that would be a real bummer and might hinder adoption of the ioctl by Wayland compositors.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer

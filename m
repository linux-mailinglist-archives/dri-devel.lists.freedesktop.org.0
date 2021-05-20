Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334C38A881
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 12:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067696E0E7;
	Thu, 20 May 2021 10:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CAC6E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:50:40 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gb17so6506290ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XFbYliOMvEOd6Jdc+WdGEi50t9JwV69wEL+rjEJw1lU=;
 b=pv2fuF/JjWey1AGPwtFyjAId/YS4C95+TABL872sENlgJDxDRR8TtU8l5OQOGGKC12
 Z682EfoVATVUC3pNH+q5JNd3N6ZQtMA5Pq+UhAUX0BKy7e+vK/znjam294AqXsxb8Y/8
 So0SXNPysor4oVRSzeKCnuut6xJFRfHQA3pkJ1TdImzyutXqstaY8qk3wXz5nnPCXDUP
 DlbfFpkXQgCXtKsEYUqZboWa9s/zH3vIgW4RL3NRQE2KzOrCD5Ydpis+J5RmXAD5lRa7
 7rbLeSr1X9ELa6xeZWJ0AWH3aMn05DcGy9S0emPqaSndeL39hfyyjWG2VL7Qvc65+lDH
 X7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XFbYliOMvEOd6Jdc+WdGEi50t9JwV69wEL+rjEJw1lU=;
 b=WdqyDItB5pPcfExG7ycYCUnyuZmmJkbd6v1GqoIN2pRPL5Bg3umktoqdMOvngIHeNY
 Rrt66b5Sszi56HFCXJla7XLxLF9kyeq3Z9TBgJwKaWWYua4IS+Fl7V+6H3h+ozM8++MC
 SRHdsVFYIupeiD+C5Gr0eSn5O0gb+O/h3ajxAroSlJB1Q5GJuZpC63ITS728+LdRjyM+
 X9R7gXcLJwdooalQz+pRjR9mZNWhcl6WmMMNj+dA36cvtFTnIeT+6O2dT8U9q962vQw9
 QyZL0I4VyyU7ueBpkwXeIPHvt3QGA6EMe5Y9Nf9Mcvj/oJg12OWkZFJLh9kk9GmwyHJE
 Nscw==
X-Gm-Message-State: AOAM533XA3CoavBHWw34v4Hyb2Z9rq8MeZCH6mYs45brpIHCGilRw2mn
 TyS2izXjMVYSjvrQOKAkpn+gWmpn0Xc=
X-Google-Smtp-Source: ABdhPJy/SqfEqs49QjaJpeGi8v7+MFrugju3RkGwVg6UdjqEtMviHtlZ6ae8ojpzYiJeNfj9OdMdlA==
X-Received: by 2002:a17:907:76e8:: with SMTP id
 kg8mr3836195ejc.130.1621507839133; 
 Thu, 20 May 2021 03:50:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a?
 ([2a02:908:1252:fb60:4635:589e:67a4:e02a])
 by smtp.gmail.com with ESMTPSA id b16sm1368456edu.53.2021.05.20.03.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 03:50:38 -0700 (PDT)
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a8d0acd9-6a0e-58bb-1f2d-e85f00ad9677@gmail.com>
Date: Thu, 20 May 2021 12:50:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFMQGth19OjWmeNGTeVFoAqxK2tYXYrvme+NuCSNLxLUQ@mail.gmail.com>
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
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 09:55 schrieb Daniel Vetter:
> On Wed, May 19, 2021 at 5:48 PM Michel Dänzer <michel@daenzer.net> wrote:
>> On 2021-05-19 5:21 p.m., Jason Ekstrand wrote:
>>> On Wed, May 19, 2021 at 5:52 AM Michel Dänzer <michel@daenzer.net> wrote:
>>>> On 2021-05-19 12:06 a.m., Jason Ekstrand wrote:
>>>>> On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>> On Tue, May 18, 2021 at 7:40 PM Christian König
>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
>>>>>>>> On Tue, May 18, 2021 at 2:49 PM Christian König
>>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>>
>>>>>>>>> And as long as we are all inside amdgpu we also don't have any oversync,
>>>>>>>>> the issue only happens when we share dma-bufs with i915 (radeon and
>>>>>>>>> AFAIK nouveau does the right thing as well).
>>>>>>>> Yeah because then you can't use the amdgpu dma_resv model anymore and
>>>>>>>> have to use the one atomic helpers use. Which is also the one that
>>>>>>>> e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl,
>>>>>>>> so as soon as that lands and someone starts using it, something has to
>>>>>>>> adapt _anytime_ you have a dma-buf hanging around. Not just when it's
>>>>>>>> shared with another device.
>>>>>>> Yeah, and that is exactly the reason why I will NAK this uAPI change.
>>>>>>>
>>>>>>> This doesn't works for amdgpu at all for the reasons outlined above.
>>>>>> Uh that's really not how uapi works. "my driver is right, everyone
>>>>>> else is wrong" is not how cross driver contracts are defined. If that
>>>>>> means a perf impact until you've fixed your rules, that's on you.
>>>>>>
>>>>>> Also you're a few years too late with nacking this, it's already uapi
>>>>>> in the form of the dma-buf poll() support.
>>>>> ^^  My fancy new ioctl doesn't expose anything that isn't already
>>>>> there.  It just lets you take a snap-shot of a wait instead of doing
>>>>> an active wait which might end up with more fences added depending on
>>>>> interrupts and retries.  The dma-buf poll waits on all fences for
>>>>> POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.
>>>> Note that the dma-buf poll support could be useful to Wayland compositors for the same purpose as Jason's new ioctl (only using client buffers which have finished drawing for an output frame, to avoid missing a refresh cycle due to client drawing), *if* it didn't work differently with amdgpu.
>>>>
>>>> Am I understanding correctly that Jason's new ioctl would also work differently with amdgpu as things stand currently? If so, that would be a real bummer and might hinder adoption of the ioctl by Wayland compositors.
>>> My new ioctl has identical semantics to poll().  It just lets you take
>>> a snapshot in time to wait on later instead of waiting on whatever
>>> happens to be set right now.  IMO, having identical semantics to
>>> poll() isn't something we want to change.
>> Agreed.
>>
>> I'd argue then that making amdgpu poll semantics match those of other drivers is a pre-requisite for the new ioctl, otherwise it seems unlikely that the ioctl will be widely adopted.
> This seems backwards, because that means useful improvements in all
> other drivers are stalled until amdgpu is fixed.

Well there is nothing to fix in amdgpu, what we need to is to come up 
with an DMA-buf implicit syncing model which works for everyone.

I've pointed this problem out at FOSDEM roughly 6 years ago, before 
DMA-buf was even merged upstream and way before amdgpu even existed. And 
the response was yeah, maybe we need to look at this as well.

Over the years I've mentioned now at least 5 times that this isn't going 
to work in some situations and came up with different approaches how to 
fix it.

And you still have the nerves to tell me that this isn't a problem and 
we should fix amdgpu instead? Sorry, but I'm really running out of ideas 
how to explain why this isn't working for everybody.

That amdgpu wants to be special is true, but it is a fundamental problem 
that we have designed the implicit sync in DMA-buf only around the needs 
of DRM drivers at that time instead of going a step back and saying hey 
what would be an approach which works for everyone.

You just need to apply my example from FOSDEM with ring buffers in a 
single BO to the DMA-buf implicit sync model and immediately see how it 
falls apart.

> I think we need agreement on what the rules are, reasonable plan to
> get there, and then that should be enough to unblock work in the wider
> community. Holding the community at large hostage because one driver
> is different is really not great.

Well forcing a drivers into a synchronization model not ideal for their 
hardware isn't great either.

The patches I provided at least clean up the naming convention and 
provide clean interfaces for iterating over the shared fence container. 
On top of that use case driven APIs can be implemented.

And yes I'm perfectly aware that this means that we need to touch all 
drivers and memory management handlers, but I'm pretty sure that 
untangling implicit synchronization from resource management is worth 
the effort no matter what changes to the sync model we are going to do.

Regards,
Christian.


> I've just finished the subsystem review of everything, and thus far
> only found some minor bugs without practical significance. I'll fix
> those and then send out a series.
> -Daniel


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A138C0AD
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 09:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8CB6F5C4;
	Fri, 21 May 2021 07:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF0E6F5C4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 07:24:19 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b17so22240175ede.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ACvlHFTs+pnWmbLCIR6auAWY0hoVd55RrmqxedgDsDs=;
 b=bxHCgFMqmRRZJVOOcFX1I1IjyVWQTWwHpYpLarHly5Q+x0Zu1bPlPj3fQtvixHraZu
 3rmygYJtKDWONA101oxM8/8uVjKkj4sYEQKCltO3Jrl+9v6FTSGrMdHgMk5bdICy5RQd
 FZvgadYhhbsOA8XODT1QC5/jfeZiameVlW08fsAZuge17iuDUy7IFIXTTTqXrlDJSTKI
 aaWWVM+CzcDz1KsizIuH/YstO1U0DmwU5PsCL0ONnGfFzyiyznDViB6u5c6FRoS26Ezu
 n8CFGe5rigejc9fMDwbwqE31AiZ6t62Y0HU9pEHd4JOyNARlBd68KFA00CE4GGa7sZgy
 Le+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ACvlHFTs+pnWmbLCIR6auAWY0hoVd55RrmqxedgDsDs=;
 b=JPUMjm5asyeYwxxfC8weM+wabhoKfDzzAkmY727YdZ3oAu3u9NsCNUo9/u66J1ufFd
 Yzq2xa7EAgEoh63Wy7TvXuvr8GjLvn1p3oI5QZ/s2NsocjANbBnnd8Mm+v7M4qwHimK1
 zIPS0XrraHEJ98DuMEw2GZhQFmw1t4qSdqSBU3TBCI76B9S/LxnmK9EiP9pJV3gEnAEt
 INe536FCPjRj0B0hKa9nTdin48hh3IHccSoSW34W8D3SW/OEpPXxyV2Qa/bUwKrZMoMC
 mSxr9vGnhrB09iAFwUivinMG7hrdnn0zNIMTd7gBkSbMujMTZ9KeL1RSlYrA/oJsCeH2
 kL6w==
X-Gm-Message-State: AOAM532MHTHkKYdTJEXFD7Edz4umWCa0zsKoOdtoWB+rYpJ8JwtBZA3I
 MrjQ363Ezrye0Dko5fD+I7lEIsBFyQA=
X-Google-Smtp-Source: ABdhPJySQmqcU3R5mwOmpRQiinM2Qqi7hzmIWgEVe9tGN8hIqlukh4EU19rBRxauRDWFRgtPN7TDIw==
X-Received: by 2002:aa7:c54a:: with SMTP id s10mr9430900edr.132.1621581858246; 
 Fri, 21 May 2021 00:24:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d?
 ([2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d])
 by smtp.gmail.com with ESMTPSA id q16sm3257252edw.87.2021.05.21.00.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 00:24:17 -0700 (PDT)
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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
 <a8d0acd9-6a0e-58bb-1f2d-e85f00ad9677@gmail.com>
 <CAOFGe96tzhp+=NX8TdPmGpq8L+FrQcOzgPUDdtog4MQ72RJv2w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a1925038-5c3c-0193-1870-27488caa2577@gmail.com>
Date: Fri, 21 May 2021 09:24:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe96tzhp+=NX8TdPmGpq8L+FrQcOzgPUDdtog4MQ72RJv2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 20.05.21 um 19:23 schrieb Jason Ekstrand:
> [SNIP]
>>>> I'd argue then that making amdgpu poll semantics match those of other drivers is a pre-requisite for the new ioctl, otherwise it seems unlikely that the ioctl will be widely adopted.
>>> This seems backwards, because that means useful improvements in all
>>> other drivers are stalled until amdgpu is fixed.
>> Well there is nothing to fix in amdgpu, what we need to is to come up
>> with an DMA-buf implicit syncing model which works for everyone.
>>
>> I've pointed this problem out at FOSDEM roughly 6 years ago, before
>> DMA-buf was even merged upstream and way before amdgpu even existed. And
>> the response was yeah, maybe we need to look at this as well.
>>
>> Over the years I've mentioned now at least 5 times that this isn't going
>> to work in some situations and came up with different approaches how to
>> fix it.
>>
>> And you still have the nerves to tell me that this isn't a problem and
>> we should fix amdgpu instead? Sorry, but I'm really running out of ideas
>> how to explain why this isn't working for everybody.
> I'm trying really hard to not fuel a flame war here but I tend to lean
> Daniel's direction on this.  Stepping back from the individual needs
> of amdgpu and looking at things from the PoV of Linux as a whole, AMD
> being a special snowflake here is bad.  I think we have two problems:
> amdgpu doesn't play by the established rules, and the rules don't work
> well for amdgpu.  We need to solve BOTH problems.  Does that mean we
> need to smash something into amdgpu to force it into the dma-buf model
> today?  Maybe not; stuff's working well enough, I guess.  But we can't
> just rewrite all the rules and break everyone else either.

Totally agree. Key point is I think I really expressed why some of the 
rules needs some changes and that at least requires an audit of 
everything currently using the dma_resv object.

>> That amdgpu wants to be special is true, but it is a fundamental problem
>> that we have designed the implicit sync in DMA-buf only around the needs
>> of DRM drivers at that time instead of going a step back and saying hey
>> what would be an approach which works for everyone.
> How else was it supposed to be designed?  Based on the needs of
> non-existent future drivers?  That's just not fair.  We (Intel) are
> being burned by various aspects of dma-buf these days too.  It does no
> good to blame past developers or our past selves for not knowing the
> future.  It sucks but it's what we have.  And, to move forward, we
> need to fix it.  Let's do that.

Yeah, coming up with a design which also works for future needs is 
always hard.

But what annoys me is that I've noted those problems way before DMA-buf 
was merged or amdgpu even existed. I could really kick my own ass to not 
have pushed back on this harder.

> My concern with the flags approach as I'm beginning to digest it is
> that it's a bit too much of an attempt to rewrite history for my
> liking.  What do I mean by that?  I mean that any solution we come up
> with needs ensure that legacy drivers and modern drivers can play
> nicely together.  Either that or we need to modernize all the users of
> dma-buf implicit sync.  I really don't like the "as long as AMD+Intel
> works, we're good" approach.

Seconded. That's why I'm saying that we need to take a step back and 
look at what would be a good design for drivers in general.

After sleeping a night over it I think what Daniel noted to have 
something similar to the moving fence of TTM inside the dma_resv object 
is a really good step into the right direction.

When we combine that with an ability to add fences which should never 
play with implicit sync and only resource management I think we could 
solve this.

This essentially untangles resource management from implicit sync and 
results in the following four categories:

1. A moving fence used by resource management only. Userspace can't in 
any way mess with that one.
2. The existing exclusive fence which is set by CS and/or your new IOCTL.
3. The existing shared fences which can be added by CS.
4. A new group of fences which don't participate in resource management, 
but not in implicit sync.

Number 1 requires an audit of all places which currently do CS or page flip.

Number 4 requires an audit of all places which do resource management.

I can tackle those and I'm perfectly aware that it might take some time.

Regards,
Christian.

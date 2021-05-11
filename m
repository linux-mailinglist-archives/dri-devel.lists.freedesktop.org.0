Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BCC37AAC1
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 17:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CFD6EA66;
	Tue, 11 May 2021 15:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5A56EA66
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 15:32:32 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u21so30340821ejo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dkTA6Iw5ENReyk4DiUxNzgte6X9LV/miABuXsNWNAgI=;
 b=dRcNhtmgLgOlAHuf5oBeTtU99pSfJCjPMEn3MAe6XA6hOM1N7hLzt8CEQlIVwH01Au
 psyAf+Yd9+vlo9vBtZ6aeTnM2sDnjgTLKrCn+d9CwcSwN69XwDlMU3h+xyBunS2/Yna6
 me0gtOav0VhGa/cglWOvU61K3mdgFFn9T5N4KTP/49Jvphhxno63cL2aCWnFze80DaoV
 QO7kPMjgtk9mare4nGeldFNYlUlPIXQVuhTYL4bcx/U7ukD3EDADqoq2n3CRitn/xxWA
 MmqVnYF4dRPD7qju1TWSAboy/TwGBAbDk+3LRnATSx8tiqyxFMAGUS4TyrDWyyJ77UlD
 45Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dkTA6Iw5ENReyk4DiUxNzgte6X9LV/miABuXsNWNAgI=;
 b=fG0+nc7ynYTci3QYP2TMq3LewZM7Tx3UBHJfc1ej7b9ipVGWasns5fEZWcn97/Z/QN
 176+9VN9Ym2OrPy5iyOdUJ7PDUz4EeC/Pj+J+7FPBm30T+7h528WaT4i0dE4wrvoqxzX
 MVLj+cwFe2nE8TSZVczKyJs2WWkDEfWaEEp4HRnMJwufXl5lAMCH/DOOfQ7xFeYafKE9
 i7oD45Bbjt0mWtT946UJpomI5APApfXxvqnl3/23kS2sRSfMSTB+odeCgQMiMSXTmfcK
 pwg0RZq3WT75oOoU8SmjLog9hd4mH5qUr6rqVzMFthraoUQ/xQl0nO4L8V0uJTJ1NrPg
 1XJA==
X-Gm-Message-State: AOAM532hAz8zWdgVaZEUBHW04yKdJlvEFewG4Xc03/9pXbVIZxigf5vm
 zeA1UkGc5aMvmBqot4hUTD1tqA3WdNY=
X-Google-Smtp-Source: ABdhPJw57jjBUqEGw4/KqtyFTJ+i4cg7bE9R8SsuNnAiqTJZskTo6Fkk455Ssf2Q1AfRSoKuS1+JUg==
X-Received: by 2002:a17:906:cf82:: with SMTP id
 um2mr32296359ejb.322.1620747151569; 
 Tue, 11 May 2021 08:32:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5935:8b67:3cdd:7cc1?
 ([2a02:908:1252:fb60:5935:8b67:3cdd:7cc1])
 by smtp.gmail.com with ESMTPSA id r10sm12042793ejd.112.2021.05.11.08.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 08:32:30 -0700 (PDT)
Subject: Re: [RFC] Implicit vs explicit user fence sync
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210504132729.2046-1-christian.koenig@amd.com>
 <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
 <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
 <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
 <YJoy6oI34tQZMt6/@phenom.ffwll.local>
 <0128750d-56bf-7697-0fda-0342c7b7df17@gmail.com>
 <YJqTeQAjsr1Tn9CZ@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a08a4b30-5ae5-49ac-bad0-c77a5cabbecd@gmail.com>
Date: Tue, 11 May 2021 17:32:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJqTeQAjsr1Tn9CZ@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.21 um 16:23 schrieb Daniel Vetter:
> On Tue, May 11, 2021 at 09:47:56AM +0200, Christian König wrote:
>> Am 11.05.21 um 09:31 schrieb Daniel Vetter:
>>> [SNIP]
>>>>> And that's just the one ioctl I know is big trouble, I'm sure we'll find
>>>>> more funny corner cases when we roll out explicit user fencing.
>>>> I think we can just ignore sync_file. As far as it concerns me that UAPI is
>>>> pretty much dead.
>>> Uh that's rather bold. Android is built on it. Currently atomic kms is
>>> built on it.
>> To be honest I don't think we care about Android at all.
> we = amd or we = upstream here?

we = amd, for everybody else that is certainly a different topic.

But for now AMD is the only one running into this problem.

Could be that Nouveau sees this as well with the next hw generation, but 
who knows?

>>> Why is this not much of a problem if it's just within one driver?
>> Because inside the same driver I can easily add the waits before submitting
>> the MM work as necessary.
> What is MM work here now?

MM=multimedia, e.g. UVD, VCE, VCN engines on AMD hardware.

>>>>>> Adding implicit synchronization on top of that is then rather trivial.
>>>>> Well that's what I disagree with, since I already see some problems that I
>>>>> don't think we can overcome (the atomic ioctl is one). And that's with us
>>>>> only having a fairly theoretical understanding of the overall situation.
>>>> But how should we then ever support user fences with the atomic IOCTL?
>>>>
>>>> We can't wait in user space since that will disable the support for waiting
>>>> in the hardware.
>>> Well, figure it out :-)
>>>
>>> This is exactly why I'm not seeing anything solved with just rolling a
>>> function call to a bunch of places, because it's pretending all things are
>>> solved when clearly that's not the case.
>>>
>>> I really think what we need is to first figure out how to support
>>> userspace fences as explicit entities across the stack, maybe with
>>> something like this order:
>>> 1. enable them purely within a single userspace driver (like vk with
>>> winsys disabled, or something else like that except not amd because
>>> there's this amdkfd split for "real" compute)
>>> 1a. including atomic ioctl, e.g. for vk direct display support this can be
>>> used without cross-process sharing, new winsys protocols and all that fun
>>> 2. figure out how to transport these userspace fences with something like
>>> drm_syncobj
>>> 2a. figure out the compat story for drivers which dont do userspace fences
>>> 2b. figure out how to absorb the overhead if the winsys/compositor doesn't
>>> support explicit sync
>>> 3. maybe figure out how to make this all happen magically with implicit
>>> sync, if we really, really care
>>>
>>> If we do 3 before we've nailed all these problems, we're just guaranteeing
>>> we'll get the wrong solutions and so we'll then have 3 ways of doing
>>> userspace fences
>>> - the butchered implicit one that didn't quite work
>>> - the explicit one
>>> - the not-so-butchered implicit one with the lessons from the properly
>>>     done explicit one
>>>
>>> The thing is, if you have no idea how to integrate userspace fences
>>> explicitly into atomic ioctl, then you definitely have no idea how to do
>>> it implicitly :-)
>> Well I agree on that. But the question is still how would you do explicit
>> with atomic?
> If you supply an userpace fence (is that what we call them now) as
> in-fence, then your only allowed to get a userspace fence as out-fence.

Yeah, that part makes perfectly sense. But I don't see the problem with 
that?

> That way we
> - don't block anywhere we shouldn't
> - don't create a dma_fence out of a userspace fence
>
> The problem is this completely breaks your "magically make implicit
> fencing with userspace fences" plan.

Why?

> So I have a plan here, what was yours?

As far as I see that should still work perfectly fine and I have the 
strong feeling I'm missing something here.

>> Transporting fences between processes is not the fundamental problem here,
>> but rather the question how we represent all this in the kernel?
>>
>> In other words I think what you outlined above is just approaching it from
>> the wrong side again. Instead of looking what the kernel needs to support
>> this you take a look at userspace and the requirements there.
> Uh ... that was my idea here? That's why I put "build userspace fences in
> userspace only" as the very first thing. Then extend to winsys and
> atomic/display and all these cases where things get more tricky.
>
> I agree that transporting the fences is easy, which is why it's not
> interesting trying to solve that problem first. Which is kinda what you're
> trying to do here by adding implicit userspace fences (well not even that,
> just a bunch of function calls without any semantics attached to them).
>
> So if there's more here, you need to flesh it out more or I just dont get
> what you're actually trying to demonstrate.

Well I'm trying to figure out why you see it as such a problem to keep 
implicit sync around.

As far as I can tell it is completely octagonal if we use 
implicit/explicit and dma_fence/user_fence.

It's just a different implementation inside the kernel.

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> And "just block" might be good enough for a quick demo, it still breaks
>>> the contract. Same holds for a bunch of the winsys problems we'll have to
>>> deal with here.
>>> -Daniel
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Like here at intel we have internal code for compute, and we're starting
>>>>> to hit some interesting cases with interop with media already, but that's
>>>>> it. Nothing even close to desktop/winsys/kms, and that's where I expect
>>>>> will all the pain be at.
>>>>>
>>>>> Cheers, Daniel


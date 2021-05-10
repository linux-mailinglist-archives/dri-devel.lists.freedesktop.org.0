Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35CE3796D6
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 20:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567586E4D7;
	Mon, 10 May 2021 18:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35866E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 18:12:34 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id u13so19820312edd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9hdndwAJUBnQV5pnZieVkpscecNWxlYEAbn/Qg88Ho0=;
 b=lGlYr/SQsB5FViL4AJ8MUL5fxJ90DoiVB9Du5uzcXmS3t0fbI//I22xj7gkD31iKzr
 sEf03msL7HoqBd6cuvSW0PlgF1bndQTQDLxf3E+YG/+AgUmCzqofqpmFhMIswFHIkx3T
 frlWYi9gsw89neYW9a47RQVlqpIhuVUBDzpZI2/TFnTQ4bksC/RgjhZIVNOyJ1njE+b6
 E6Hu5OXG08nGp2XbSgVZ8rr3SX1hZ2Pai4We3kSD+2JN9teOp0Hs3x9AB8GHpxPcEwEx
 PjLHImsqs90wrSlxaVcmomAncR6szLv28TD7i1METGex+GKKeg+h2QKFK2jweG32Lea6
 NbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9hdndwAJUBnQV5pnZieVkpscecNWxlYEAbn/Qg88Ho0=;
 b=Yiunwpmel82ZcG60JI5F03FpuzZnK0T8js+7NbBVLeE14Jv7fZ/IrqKKF+l0WMhaTQ
 jkXKXI/9+LjI/mBUeLsRWNN+IJqiGrsaDA8tfgcrgA1faZr96JjStwPv4xVoeDDB0AJj
 kABpgwEGu27Q3SyxU9nWEmvvnr/7DIHBtKd08E2nFvNChOjeccQ8TkClfl3XtBQzb1kR
 9t9kCvmJAQEw2eSU6jaCqcABeFfId69iIpMJjqPauIMTXuY/jbaFLJrifjwRE+5EaPCd
 br9DIFuf+52EjDP7RvWMPwojW8jcOR+FQSzPBL/ZrWQRGJBP/FQbZhaIjiKK7tNnnJGx
 CY7g==
X-Gm-Message-State: AOAM533UWcmThOOCiysYDa7J+saCGcvZJOeXap2JG0XKeT5Jc2y9P9OM
 bfQR5XhVAr5VUtHLOrvh6z1PN1Jk4AY=
X-Google-Smtp-Source: ABdhPJzWFSFhnt7fipPVUch3hIpTwMqbpnPtUmESl485spp6ES7HiMYfSgHd6pRxTfWK+7qQciceBA==
X-Received: by 2002:aa7:cb06:: with SMTP id s6mr23365294edt.284.1620670353358; 
 Mon, 10 May 2021 11:12:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7903:34fa:e13f:17ac?
 ([2a02:908:1252:fb60:7903:34fa:e13f:17ac])
 by smtp.gmail.com with ESMTPSA id d25sm11811622edx.58.2021.05.10.11.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 11:12:32 -0700 (PDT)
Subject: Re: [RFC] Implicit vs explicit user fence sync
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210504132729.2046-1-christian.koenig@amd.com>
 <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
 <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
Date: Mon, 10 May 2021 20:12:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
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

Am 04.05.21 um 17:11 schrieb Daniel Vetter:
> On Tue, May 04, 2021 at 04:26:42PM +0200, Christian König wrote:
>> Hi Daniel,
>>
>> Am 04.05.21 um 16:15 schrieb Daniel Vetter:
>>> Hi Christian,
>>>
>>> On Tue, May 04, 2021 at 03:27:17PM +0200, Christian König wrote:
>>>> Hi guys,
>>>>
>>>> with this patch set I want to look into how much more additional work it
>>>> would be to support implicit sync compared to only explicit sync.
>>>>
>>>> Turned out that this is much simpler than expected since the only
>>>> addition is that before a command submission or flip the kernel and
>>>> classic drivers would need to wait for the user fence to signal before
>>>> taking any locks.
>>> It's a lot more I think
>>> - sync_file/drm_syncobj still need to be supported somehow
>> You need that with explicit fences as well.
>>
>> I'm just concentrating on what extra burden implicit sync would get us.
> It's not just implicit sync. Currently the best approach we have for
> explicit sync is hiding them in drm_syncobj. Because for that all the work
> with intentional stall points and userspace submit thread already exists.
>
> None of this work has been done for sync_file. And looking at how much
> work it was to get drm_syncobj going, that will be anything but easy.

I don't think we will want this for sync_file in the first place.

>>> - we need userspace to handle the stall in a submit thread at least
>>> - there's nothing here that sets the sync object
>>> - implicit sync isn't just execbuf, it's everything. E.g. the various
>>>     wait_bo ioctl also need to keep working, including timeout and
>>>     everything
>> Good point, but that should be relatively easily to add as well.
>>
>>> - we can't stall in atomic kms where you're currently stalling, that's for
>>>     sure. The uapi says "we're not stalling for fences in there", and you're
>>>     breaking that.
>> Again as far as I can see we run into the same problem with explicit sync.
>>
>> So the question is where could we block for atomic modeset for user fences
>> in general?
> Nah, I have an idea. But it only works if userspace is aware, because the
> rules are essentialyl:
>
> - when you supply a userspace in-fence, then you only get a userspace
>    out-fence
> - mixing in fences between dma-fence and user fence is ok
> - mixing out fences isn't
>
> And we currently do have sync_file out fence. So it's not possible to
> support implicit user fence in atomic in a way which doesn't break the
> uapi somewhere.
>
> Doing the explicit user fence support first will make that very obvious.
>
> And that's just the one ioctl I know is big trouble, I'm sure we'll find
> more funny corner cases when we roll out explicit user fencing.

I think we can just ignore sync_file. As far as it concerns me that UAPI 
is pretty much dead.

What we should support is drm_syncobj, but that also only as an in-fence 
since that's what our hardware supports.

> Anotherone that looks very sketchy right now is buffer sharing between
> different userspace drivers, like compute <-> media (if you have some
> fancy AI pipeline in your media workload, as an example).

Yeah, we are certainly going to get that. But only inside the same 
driver, so not much of a problem.

>
>>> - ... at this point I stopped pondering but there's definitely more
>>>
>>> Imo the only way we'll even get the complete is if we do the following:
>>> 1. roll out implicit sync with userspace fences on a driver-by-driver basis
> 		s/implicit/explicit/
>
> But I think you got that.
>
>>>      1a. including all the winsys/modeset stuff
>> Completely agree, that's why I've split that up into individual patches.
>>
>> I'm also fine if drivers can just opt out of user fence based
>> synchronization and we return an error from dma_buf_dynamic_attach() if some
>> driver says it can't handle that.
> Yeah, but that boils down to us just breaking those use-cases. Which is
> exactly what you're trying to avoid by rolling out implicit user fence I
> think.

But we can add support to all drivers as necessary.

>
>>> 2. roll out support for userspace fences to drm_syncobj timeline for
>>>      interop, both across process/userspace and across drivers
>>>      2a. including all the winsys/modeset stuff, but hopefully that's
>>>          largely solved with 1. already.
>> Correct, but again we need this for explicit fencing as well.
>>
>>> 3. only then try to figure out how to retroshoehorn this into implicit
>>>      sync, and whether that even makes sense.
>>>
>>> Because doing 3 before we've done 1&2 for at least 2 drivers (2 because
>>> interop fun across drivers) is just praying that this time around we're
>>> not collectively idiots and can correctly predict the future. That never
>>> worked :-)
>>>
>>>> For this prototype this patch set doesn't implement any user fence
>>>> synchronization at all, but just assumes that faulting user pages is
>>>> sufficient to make sure that we can wait for user space to finish
>>>> submitting the work. If necessary this can be made even more strict, the
>>>> only use case I could find which blocks this is the radeon driver and
>>>> that should be handle able.
>>>>
>>>> This of course doesn't give you the same semantic as the classic
>>>> implicit sync to guarantee that you have exclusive access to a buffers,
>>>> but this is also not necessary.
>>>>
>>>> So I think the conclusion should be that we don't need to concentrate on
>>>> implicit vs. explicit sync, but rather how to get the synchronization
>>>> and timeout signalling figured out in general.
>>> I'm not sure what exactly you're proving here aside from "it's possible to
>>> roll out a function with ill-defined semantics to all drivers". This
>>> really is a lot harder than just this one function and just this one patch
>>> set.
>> No it isn't. The hard part is getting the user sync stuff up in general.
>>
>> Adding implicit synchronization on top of that is then rather trivial.
> Well that's what I disagree with, since I already see some problems that I
> don't think we can overcome (the atomic ioctl is one). And that's with us
> only having a fairly theoretical understanding of the overall situation.

But how should we then ever support user fences with the atomic IOCTL?

We can't wait in user space since that will disable the support for 
waiting in the hardware.

Regards,
Christian.

>
> Like here at intel we have internal code for compute, and we're starting
> to hit some interesting cases with interop with media already, but that's
> it. Nothing even close to desktop/winsys/kms, and that's where I expect
> will all the pain be at.
>
> Cheers, Daniel


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7381C37A122
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 09:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C32B6E9E8;
	Tue, 11 May 2021 07:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7CE6E9EC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 07:47:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gx5so28312543ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 00:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XPE+QElY9t0BJnCD7BWso4sg6yAPTyr9YX0SJrkxNK0=;
 b=qwpBQHyIfC7jhqjoPmIDDy1o+djAgIA6CqobYRpcsC/wgNiQHmSaaxAl3DIsvID+i7
 3Cgee8NyXoWg6ooV5SKcM+CU9E5Xp/H5uTH3ti96PzYUDQBPU5N0p/v9T7R5MG9Gu5i3
 I4nmetplMSQXR0B82+QPiTSmw3QrDJi2P90SAXwCbj9bf7SuMNpJHPLZvTptUMpnJE9h
 e2AM02DPM3ohkXOHnIcTZyFjDSLMBTa65F+F0oy1Da0s3KT4Xr2YI+Tdq7AJS0O+V6ch
 e6hsNFsU9auXIwS0L9olm7pnKChH54IebA8UoAzQYkEe5graOOmlroXraJXMsWKUVTXJ
 EMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XPE+QElY9t0BJnCD7BWso4sg6yAPTyr9YX0SJrkxNK0=;
 b=bcuNik0L6OLnMSyZ7fZi+tr9YOQc2ggT/aqKcpFs6uiKKh5a9yPD/lqbsCFutAUghK
 IZxq4HeY1nDC+WtsvF/Ga+SCvSK51Wc7iQRjzDuGJMHLqQs+3+ICYEPjnpFWAQ1q2Eiv
 H1cgGz4A8kvCdQ542MpGLnBaJn+D7NIHTELbssaj4uabVAe08KCak6kMBSh2260U1Z+C
 wKC1jpNNwb3lJuJ5qzinzxhBNd6HmPYX/T5V+Ug2DBbNOy+b/rUxixOBI/kIvMMkA0QA
 C4BAs7zjQe5QSFawVOE9S6Ek+ILiqPrdzdCCoukiKLm2sWSI5Io5204GymWN9ksu7iSr
 v9sA==
X-Gm-Message-State: AOAM530aOn0PQqKvH//4Fl03bpJ2Pf7WkwKFAnkzIkPRVQomlKy0ubQq
 Ei98DXQy3DJTWEYQh+sOQcIYFvXmGEU=
X-Google-Smtp-Source: ABdhPJwsKXu/AZH9wNOvLHtbOG9jATcoc5FIlIKLmQxl5xqNn/kWZ+6A5ZfaWgz8Nnqg0jpvs3G85A==
X-Received: by 2002:a17:906:f1d4:: with SMTP id
 gx20mr29822440ejb.108.1620719277493; 
 Tue, 11 May 2021 00:47:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c3ab:ee01:d547:2c4e?
 ([2a02:908:1252:fb60:c3ab:ee01:d547:2c4e])
 by smtp.gmail.com with ESMTPSA id z22sm10946135ejo.113.2021.05.11.00.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 00:47:56 -0700 (PDT)
Subject: Re: [RFC] Implicit vs explicit user fence sync
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210504132729.2046-1-christian.koenig@amd.com>
 <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
 <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
 <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
 <YJoy6oI34tQZMt6/@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0128750d-56bf-7697-0fda-0342c7b7df17@gmail.com>
Date: Tue, 11 May 2021 09:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJoy6oI34tQZMt6/@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.21 um 09:31 schrieb Daniel Vetter:
> [SNIP]
>>> And that's just the one ioctl I know is big trouble, I'm sure we'll find
>>> more funny corner cases when we roll out explicit user fencing.
>> I think we can just ignore sync_file. As far as it concerns me that UAPI is
>> pretty much dead.
> Uh that's rather bold. Android is built on it. Currently atomic kms is
> built on it.

To be honest I don't think we care about Android at all.

>> What we should support is drm_syncobj, but that also only as an in-fence
>> since that's what our hardware supports.
> Convince Android folks, minimally. Probably a lot more. Yes with hindsight
> we should have just gone for drm_syncobj instead of the sync_file thing,
> but hindsight and all that.
>
> This is kinda why I don't think trying to support the existing uapi with
> userspace fences underneath with some magic tricks is a good idea. It's
> just a pile of work, plus it's not really architecturally clean.
>
>>> Anotherone that looks very sketchy right now is buffer sharing between
>>> different userspace drivers, like compute <-> media (if you have some
>>> fancy AI pipeline in your media workload, as an example).
>> Yeah, we are certainly going to get that. But only inside the same driver,
>> so not much of a problem.
> Why is this not much of a problem if it's just within one driver?

Because inside the same driver I can easily add the waits before 
submitting the MM work as necessary.

>>>> Adding implicit synchronization on top of that is then rather trivial.
>>> Well that's what I disagree with, since I already see some problems that I
>>> don't think we can overcome (the atomic ioctl is one). And that's with us
>>> only having a fairly theoretical understanding of the overall situation.
>> But how should we then ever support user fences with the atomic IOCTL?
>>
>> We can't wait in user space since that will disable the support for waiting
>> in the hardware.
> Well, figure it out :-)
>
> This is exactly why I'm not seeing anything solved with just rolling a
> function call to a bunch of places, because it's pretending all things are
> solved when clearly that's not the case.
>
> I really think what we need is to first figure out how to support
> userspace fences as explicit entities across the stack, maybe with
> something like this order:
> 1. enable them purely within a single userspace driver (like vk with
> winsys disabled, or something else like that except not amd because
> there's this amdkfd split for "real" compute)
> 1a. including atomic ioctl, e.g. for vk direct display support this can be
> used without cross-process sharing, new winsys protocols and all that fun
> 2. figure out how to transport these userspace fences with something like
> drm_syncobj
> 2a. figure out the compat story for drivers which dont do userspace fences
> 2b. figure out how to absorb the overhead if the winsys/compositor doesn't
> support explicit sync
> 3. maybe figure out how to make this all happen magically with implicit
> sync, if we really, really care
>
> If we do 3 before we've nailed all these problems, we're just guaranteeing
> we'll get the wrong solutions and so we'll then have 3 ways of doing
> userspace fences
> - the butchered implicit one that didn't quite work
> - the explicit one
> - the not-so-butchered implicit one with the lessons from the properly
>    done explicit one
>
> The thing is, if you have no idea how to integrate userspace fences
> explicitly into atomic ioctl, then you definitely have no idea how to do
> it implicitly :-)

Well I agree on that. But the question is still how would you do 
explicit with atomic?

Transporting fences between processes is not the fundamental problem 
here, but rather the question how we represent all this in the kernel?

In other words I think what you outlined above is just approaching it 
from the wrong side again. Instead of looking what the kernel needs to 
support this you take a look at userspace and the requirements there.

Regards,
Christian.

>
> And "just block" might be good enough for a quick demo, it still breaks
> the contract. Same holds for a bunch of the winsys problems we'll have to
> deal with here.
> -Daniel
>
>> Regards,
>> Christian.
>>
>>> Like here at intel we have internal code for compute, and we're starting
>>> to hit some interesting cases with interop with media already, but that's
>>> it. Nothing even close to desktop/winsys/kms, and that's where I expect
>>> will all the pain be at.
>>>
>>> Cheers, Daniel


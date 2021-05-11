Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9537AF5D
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 21:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05FC6E1F5;
	Tue, 11 May 2021 19:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC146E1F5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 19:34:14 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id t4so31539234ejo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Rv50VShPgfyMveCB9OhxlZ+GUV8MNvMtGFPh1AuYxTw=;
 b=KkfTLlFDCDCo3TbMwEqMNMe4c3AioNsNDFNUl4emNxzQ8zJkB5X/zfFkppY6LfBfqM
 ajeGRPn2VwQL0xjrZZhBQyoodLOLu3PWdzKG3gu6DvqadeIhumoYXMNgtPLp6gtkDtRr
 /9hmoTTkc5nNaVEBeO5/e6RLJXarCWg2hzXQpQnxsJQWn2ex5DOVZWJfv6fxw4HSRxgS
 L7VpLZsru0gTfM5CMKqZXvyrYM9BoWHd0Il2Ag4d+b9J3WToV/iodMW7zJvT5oxOm1Vq
 yoMrv3Rw36wfFXZ3DIul6bqFmlwIyxMubVK6cnsF6z2uoOthpXKvgfauH/xFXU7Z8AWq
 BImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Rv50VShPgfyMveCB9OhxlZ+GUV8MNvMtGFPh1AuYxTw=;
 b=ht7nnzVuHhttQ/iAfqL4SPmDbAM7h16oy57dpX++jECJJFwm4elLe5Wq6F7ANzc+Bo
 8VD17UWy4vOMfGN9LyYUBCa86Ca9z2kd6wmWIJhwfgJjqKK4fvSvQqdT8wfmcuFltkRZ
 TQkL2HUEguprIbngPD0YjwxrPZpUoR1i1T9lfzBvFgL0jKYua/1Mdh46A0vLa141cSzw
 AM9v0GherhpTDnbCnATDO7o2Rtdb858dyeSXRtomVhvHyP2wAD4wnaTQSbhC/85MUO6V
 cPRrt/FbC02RvnBD//W5DSGS4K8hakPo2U16KyMt39MXC48KDc56H9tH8360a5LjlRO+
 irnA==
X-Gm-Message-State: AOAM530RdhK6edpxh6rxFBZEX3DNctfoOgN6k1nrbWOWvRPo5hxL//sh
 ZdMFEvG/hLqLsofgDWuaQHXbDmNDoAg=
X-Google-Smtp-Source: ABdhPJwTE/d/bGg7mPEJmRHBWZC8IrtRJIebGgAo4UlD+Z4uxhhfdlqHktLUJLg+gvvxMZrPX7M7JQ==
X-Received: by 2002:a17:906:8307:: with SMTP id
 j7mr32413946ejx.420.1620761653315; 
 Tue, 11 May 2021 12:34:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f9f0:da63:8d2d:bbc6?
 ([2a02:908:1252:fb60:f9f0:da63:8d2d:bbc6])
 by smtp.gmail.com with ESMTPSA id bw16sm8408083ejb.50.2021.05.11.12.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 12:34:12 -0700 (PDT)
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
 <a08a4b30-5ae5-49ac-bad0-c77a5cabbecd@gmail.com>
 <YJq1T8yWXSW6TRjW@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d91f5635-9f03-d1ea-4bc5-594b42402eaa@gmail.com>
Date: Tue, 11 May 2021 21:34:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJq1T8yWXSW6TRjW@phenom.ffwll.local>
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

Am 11.05.21 um 18:48 schrieb Daniel Vetter:
> [SNIP]
>> Why?
> If you allow implicit fencing then you can end up with
> - an implicit userspace fence as the in-fence
> - but an explicit dma_fence as the out fence
>
> Which is not allowed. So there's really no way to make this work, except
> if you stall in the ioctl, which also doesn't work.

Ok, wait a second. I really don't understand what's going on here.

The out fence is just to let the userspace know when the frame is 
displayed. Or rather when the old frame is no longer displayed so that 
it can be reused, right?

Then why does that need to be a dma_fence? We don't use that for memory 
management anywhere, don't we?

> So you have to do an uapi change here. At that point we might as well do
> it right.

I mean in the worst case we might need to allow user fences with 
sync_files as well when that is really used outside of Android.

But I still don't see the fundamental problem here.

Regards,
Christian.

> Of course if you only care about some specific compositors (or maybe only
> the -amdgpu Xorg driver even) then this isn't a concern, but atomic is
> cross-driver so we can't do that. Or at least I don't see a way how to do
> this without causing endless amounts of fun down the road.
>
>>> So I have a plan here, what was yours?
>> As far as I see that should still work perfectly fine and I have the strong
>> feeling I'm missing something here.
>>
>>>> Transporting fences between processes is not the fundamental problem here,
>>>> but rather the question how we represent all this in the kernel?
>>>>
>>>> In other words I think what you outlined above is just approaching it from
>>>> the wrong side again. Instead of looking what the kernel needs to support
>>>> this you take a look at userspace and the requirements there.
>>> Uh ... that was my idea here? That's why I put "build userspace fences in
>>> userspace only" as the very first thing. Then extend to winsys and
>>> atomic/display and all these cases where things get more tricky.
>>>
>>> I agree that transporting the fences is easy, which is why it's not
>>> interesting trying to solve that problem first. Which is kinda what you're
>>> trying to do here by adding implicit userspace fences (well not even that,
>>> just a bunch of function calls without any semantics attached to them).
>>>
>>> So if there's more here, you need to flesh it out more or I just dont get
>>> what you're actually trying to demonstrate.
>> Well I'm trying to figure out why you see it as such a problem to keep
>> implicit sync around.
>>
>> As far as I can tell it is completely octagonal if we use implicit/explicit
>> and dma_fence/user_fence.
>>
>> It's just a different implementation inside the kernel.
> See above. It falls apart with the atomic ioctl.
> -Daniel

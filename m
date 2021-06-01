Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DB2397305
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55576E50E;
	Tue,  1 Jun 2021 12:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41D66E463;
 Tue,  1 Jun 2021 12:10:49 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gb17so21289371ejc.8;
 Tue, 01 Jun 2021 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=jtvcIaFxgOT25JTMY5cLgmFjDay+DXxACyyo+Y4B3xk=;
 b=XBI0LhuT3Gk5Sc7xPXfkVnjAKAaTHRnD/5rh4UZSOC3rN0Kv8n/rjlpRpvVXuORZjP
 S0blG+/WLeNWqm4NqqAR79225rB5XvZnHX/dKazI9Fh0I4KTBpvg9nYtWCCekFvQZeC2
 gce5bu4SeC7kGuXxSQpD6BpoqMLRqPFlG8mn6NCNXZka96G28sDpRbvvKsEV1hsJn40Y
 F0yPdjUD/K3aXaEp7z/aIA8JoTovLy5iSsZhk8yQoShcUKbgm65pyqynu9n7zLt95NCs
 UDOIdEsR9m3Deq6+/ZfGUNgvf8aSbrHuwVMzrmxiQxGCwBkzn/QR+a0x2+nlV+e6HI0T
 Rerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jtvcIaFxgOT25JTMY5cLgmFjDay+DXxACyyo+Y4B3xk=;
 b=axJorD2oXS2tKG7RVN90yPVVwP5MuLX7KVogYwVWg8GjU4cmP+xv2hXKljCtkPnI6B
 sBYz8o/+Mn1W7C+Ma4sjoo3+q/k3yO8hzZhdHz2s18VUZuXmCcZRCEJXdFxIXV899tYl
 Enh9KLce76tV8kMssmMw19VJElIxQm10gFM3JOdFUTk94kOtt4bCj3+KtJDTAPTzN7R0
 lXu51IRc99NyLlSYA7HteBeC5Pu9zvJ5TnzmciApwNvjBPf/t/Q3StGioUvKmpKSo8Gj
 MNIkq/f+HdEjGBtMxW6USKAnSjaBNwWj4TCmglgPxz0I8s5MOaPGVZpg115ohGuQM/Sa
 3Reg==
X-Gm-Message-State: AOAM532xsRcYaP2WolhvM4t6L8mw+oyOvHQHP6T6tdFSuPPG5+1KojOd
 DLJuZkXn1GA4GEjbHs7GhI4=
X-Google-Smtp-Source: ABdhPJw9J2/T2fjGh5dnpj32QD+nPcAuNliRfNPxXEJiaBE5VYMn8Obg6o56VSKvJItjnb52B82IBg==
X-Received: by 2002:a17:906:a017:: with SMTP id
 p23mr29427929ejy.460.1622549448373; 
 Tue, 01 Jun 2021 05:10:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5ee0:b6d9:de45:97bd?
 ([2a02:908:1252:fb60:5ee0:b6d9:de45:97bd])
 by smtp.gmail.com with ESMTPSA id p14sm3012401eds.19.2021.06.01.05.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 05:10:47 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
Date: Tue, 1 Jun 2021 14:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.21 um 12:49 schrieb Michel Dänzer:
> On 2021-06-01 12:21 p.m., Christian König wrote:
>> Am 01.06.21 um 11:02 schrieb Michel Dänzer:
>>> On 2021-05-27 11:51 p.m., Marek Olšák wrote:
>>>> 3) Compositors (and other privileged processes, and display flipping) can't trust imported/exported fences. They need a timeout recovery mechanism from the beginning, and the following are some possible solutions to timeouts:
>>>>
>>>> a) use a CPU wait with a small absolute timeout, and display the previous content on timeout
>>>> b) use a GPU wait with a small absolute timeout, and conditional rendering will choose between the latest content (if signalled) and previous content (if timed out)
>>>>
>>>> The result would be that the desktop can run close to 60 fps even if an app runs at 1 fps.
>>> FWIW, this is working with
>>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 , even with implicit sync (on current Intel GPUs; amdgpu/radeonsi would need to provide the same dma-buf poll semantics as other drivers and high priority GFX contexts via EGL_IMG_context_priority which can preempt lower priority ones).
>> Yeah, that is really nice to have.
>>
>> One question is if you wait on the CPU or the GPU for the new surface to become available?
> It's based on polling dma-buf fds, i.e. CPU.
>
>> The former is a bit bad for latency and power management.
> There isn't a choice for Wayland compositors in general, since there can be arbitrary other state which needs to be applied atomically together with the new buffer. (Though in theory, a compositor might get fancy and special-case surface commits which can be handled by waiting on the GPU)
>
> Latency is largely a matter of scheduling in the compositor. The latency incurred by the compositor shouldn't have to be more than single-digit milliseconds. (I've seen total latency from when the client starts processing a (static) frame to when it starts being scanned out as low as ~6 ms with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620, lower than typical with Xorg)

Well let me describe it like this:

We have an use cases for 144 Hz guaranteed refresh rate. That 
essentially means that the client application needs to be able to spit 
out one frame/window content every ~6.9ms. That's tough, but doable.

When you now add 6ms latency in the compositor that means the client 
application has only .9ms left for it's frame which is basically 
impossible to do.

See for the user fences handling the display engine will learn to read 
sequence numbers from memory and decide on it's own if the old frame or 
the new one is scanned out. To get the latency there as low as possible.

>> Another question is if that is sufficient as security for the display server or if we need further handling down the road? I mean essentially we are moving the reliability problem into the display server.
> Good question. This should generally protect the display server from freezing due to client fences never signalling, but there might still be corner cases.
>
>


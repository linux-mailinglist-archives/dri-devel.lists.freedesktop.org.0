Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1492239B37F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 09:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA116F5AE;
	Fri,  4 Jun 2021 07:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65176F5A9;
 Fri,  4 Jun 2021 07:00:34 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id l1so12906867ejb.6;
 Fri, 04 Jun 2021 00:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/cJYLgn056I8qN1G9JNmYA6byQI5zwJ1AD+/u/e487M=;
 b=H7YeL2vtH//RGj7rQy1pgV+wua6VAwq/hLz0Ac1kt9O0Pp+V4HociNxsZUB+SctFjN
 g4w3UlGcYeqCEP6y3GznrmHMwdV6yVrj/H5bU+PUYAhMPitPOFK9PwWFRYg6VeTsgZ3/
 evbFampnXaIHG33JUPJD2KlqQ7CkT+DqNw2poIIChdTTvA5Cl27qz/wLqPMFWBTyPT+G
 RNuJNfaoIQ6jTxOLQEWI8CbvIRo9C8+LqTd6DpXbtmH6/hfQelUjkqUNXAhVh4yP5LIO
 pW8yE4LK8XBOoDOBuhAyz/RhoDgvoJufVUJYLk6c9QzzrKlGVpvkfw3FAiYRAj3czNrf
 ly0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/cJYLgn056I8qN1G9JNmYA6byQI5zwJ1AD+/u/e487M=;
 b=RoQBtxpEc0mwqah7Y6x96lnVT0If1n51clduX1SRtYRCmh/tfUbctDgfrPj4fET9k1
 5xedbEyu2UqintbzfS/ZylqHMj+EG2LSw5EocakcDKCNXX9Yl3Yq5GSZ3hVG7rKxM3KM
 vbOfS+bfnLt95FY2LjG2msUQGReJFReBdeYIS+lUe7DXVrFhFdnS+VxH1xEeOvhiXlD5
 ZJgmZWwUDg6z6QulsVky8Uw2iLD+a/33OxJjqywgl6czZDWZmYg2V+KEHfLVNB/OHhQu
 GbxxideWauqYWewy4lpkwz1q3Ty60oojrnrijFq885XY7qe2f1POryHkWSgIhQZ4QDL7
 0C+w==
X-Gm-Message-State: AOAM5339lqoCf/wuuT9gXDL/a1TiCd8kMCCVkHuS8VCxweebimYUUti+
 FvE/VgdVLyhYaG0+iSUFQ5kfiFND8Vg=
X-Google-Smtp-Source: ABdhPJz4FD34pa6Uibn4A6FqozcirTbnncRc5v0x+VrgmizFxNGjK3M7ki0r3pUPbrz5MvvEgZ/XOw==
X-Received: by 2002:a17:906:17c4:: with SMTP id
 u4mr2872751eje.481.1622790033312; 
 Fri, 04 Jun 2021 00:00:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id h7sm2410245ejp.24.2021.06.04.00.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 00:00:32 -0700 (PDT)
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Vetter <daniel@ffwll.ch>
References: <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <a43f81f6-fe41-a6db-442e-83eb163124b9@gmail.com>
 <YLfZq5lAaR/RiFV8@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0fbb1197-fa88-c474-09db-6daec13d3004@gmail.com>
Date: Fri, 4 Jun 2021 09:00:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLfZq5lAaR/RiFV8@phenom.ffwll.local>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.06.21 um 21:19 schrieb Daniel Vetter:
> On Wed, Jun 02, 2021 at 08:52:38PM +0200, Christian König wrote:
>>
>> Am 02.06.21 um 20:48 schrieb Daniel Vetter:
>>> On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Olšák wrote:
>>>> On Wed, Jun 2, 2021 at 5:34 AM Marek Olšák <maraeo@gmail.com> wrote:
>>>>
>>>>> Yes, we can't break anything because we don't want to complicate things
>>>>> for us. It's pretty much all NAK'd already. We are trying to gather more
>>>>> knowledge and then make better decisions.
>>>>>
>>>>> The idea we are considering is that we'll expose memory-based sync objects
>>>>> to userspace for read only, and the kernel or hw will strictly control the
>>>>> memory writes to those sync objects. The hole in that idea is that
>>>>> userspace can decide not to signal a job, so even if userspace can't
>>>>> overwrite memory-based sync object states arbitrarily, it can still decide
>>>>> not to signal them, and then a future fence is born.
>>>>>
>>>> This would actually be treated as a GPU hang caused by that context, so it
>>>> should be fine.
>>> This is practically what I proposed already, except your not doing it with
>>> dma_fence. And on the memory fence side this also doesn't actually give
>>> what you want for that compute model.
>>>
>>> This seems like a bit a worst of both worlds approach to me? Tons of work
>>> in the kernel to hide these not-dma_fence-but-almost, and still pain to
>>> actually drive the hardware like it should be for compute or direct
>>> display.
>>>
>>> Also maybe I've missed it, but I didn't see any replies to my suggestion
>>> how to fake the entire dma_fence stuff on top of new hw. Would be
>>> interesting to know what doesn't work there instead of amd folks going of
>>> into internal again and then coming back with another rfc from out of
>>> nowhere :-)
>> Well to be honest I would just push back on our hardware/firmware guys that
>> we need to keep kernel queues forever before going down that route.
> I looked again, and you said the model wont work because preemption is way
> too slow, even when the context is idle.
>
> I guess at that point I got maybe too fed up and just figured "not my
> problem", but if preempt is too slow as the unload fence, you can do it
> with pte removal and tlb shootdown too (that is hopefully not too slow,
> otherwise your hw is just garbage and wont even be fast for direct submit
> compute workloads).

Have you seen that one here: 
https://www.spinics.net/lists/amd-gfx/msg63101.html :)

I've rejected it because I think polling for 6 seconds on a TLB flush 
which can block interrupts as well is just madness.



>
> The only thing that you need to do when you use pte clearing + tlb
> shootdown instad of preemption as the unload fence for buffers that get
> moved is that if you get any gpu page fault, you don't serve that, but
> instead treat it as a tdr and shot the context permanently.
>
> So summarizing the model I proposed:
>
> - you allow userspace to directly write into the ringbuffer, and also
>    write the fences directly
>
> - actual submit is done by the kernel, using drm/scheduler. The kernel
>    blindly trusts userspace to set up everything else, and even just wraps
>    dma_fences around the userspace memory fences.
>
> - the only check is tdr. If a fence doesn't complete an tdr fires, a) the
>    kernel shot the entire context and b) userspace recovers by setting up a
>    new ringbuffer
>
> - memory management is done using ttm only, you still need to supply the
>    buffer list (ofc that list includes the always present ones, so CS will
>    only get the list of special buffers like today). If you hw can't trun
>    gpu page faults and you ever get one we pull up the same old solution:
>    Kernel shots the entire context.
>
>    The important thing is that from the gpu pov memory management works
>    exactly like compute workload with direct submit, except that you just
>    terminate the context on _any_ page fault, instead of only those that go
>    somewhere where there's really no mapping and repair the others.
>
>    Also I guess from reading the old thread this means you'd disable page
>    fault retry because that is apparently also way too slow for anything.
>
> - memory management uses an unload fence. That unload fences waits for all
>    userspace memory fences (represented as dma_fence) to complete, with
>    maybe some fudge to busy-spin until we've reached the actual end of the
>    ringbuffer (maybe you have a IB tail there after the memory fence write,
>    we have that on intel hw), and it waits for the memory to get
>    "unloaded". This is either preemption, or pte clearing + tlb shootdown,
>    or whatever else your hw provides which is a) used for dynamic memory
>    management b) fast enough for actual memory management.
>
> - any time a context dies we force-complete all it's pending fences,
>    in-order ofc
>
> So from hw pov this looks 99% like direct userspace submit, with the exact
> same mappings, command sequences and everything else. The only difference
> is that the rinbuffer head/tail updates happen from drm/scheduler, instead
> of directly from userspace.
>
> None of this stuff needs funny tricks where the kernel controls the
> writes to memory fences, or where you need kernel ringbuffers, or anything
> like thist. Userspace is allowed to do anything stupid, the rules are
> guaranteed with:
>
> - we rely on the hw isolation features to work, but _exactly_ like compute
>    direct submit would too
>
> - dying on any page fault captures memory management issues
>
> - dying (without kernel recover, this is up to userspace if it cares) on
>    any tdr makes sure fences complete still
>
>> That syncfile and all that Android stuff isn't working out of the box with
>> the new shiny user queue submission model (which in turn is mostly because
>> of Windows) already raised some eyebrows here.
> I think if you really want to make sure the current linux stack doesn't
> break the _only_ option you have is provide a ctx mode that allows
> dma_fence and drm/scheduler to be used like today.

Yeah, but I still can just tell our hw/fw guys that we really really 
need to keep kernel queues or the whole Linux/Android infrastructure 
needs to get a compatibility layer like you describe above.

> For everything else it sounds you're a few years too late, because even
> just huge kernel changes wont happen in time. Much less rewriting
> userspace protocols.

Seconded, question is rather if we are going to start migrating at some 
point or if we should keep pushing on our hw/fw guys.

Christian.

> -Daniel


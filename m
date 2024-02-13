Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2013D8538A3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 18:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A639610E0D7;
	Tue, 13 Feb 2024 17:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zi9OTKMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A4610E0E2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707845964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7p4JDbtJm1cogqhFZW34xhMu5zMD7LEdMdg/0QPw0Cw=;
 b=Zi9OTKMnyxhwMZEOml048h+zuI7CSl3wd1qM52uO+QbTrC9NjJThqNhoe5yP0Qj+bnt9vt
 Da5/ALsd+/wgWO2u2qc9f2msm3jKTjeKYSKVsg8Hq7iEyC/rMcyAORhgvbU4q+h9jDnLcF
 V7xYeaejt8q0Q0crL2XR2PihzQyXzTs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-JINLG1CVOYO2vrVxcV4Vxg-1; Tue, 13 Feb 2024 12:39:23 -0500
X-MC-Unique: JINLG1CVOYO2vrVxcV4Vxg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-55ffcfed2ffso6268478a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 09:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845961; x=1708450761;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7p4JDbtJm1cogqhFZW34xhMu5zMD7LEdMdg/0QPw0Cw=;
 b=tOYKLc3fIM0hYeBP9hYeTeoMqs9zOUNlPbdSm9qIKrvttUyJL8JacwdzwvVlFpyldr
 FdMvIYOWr8b38X/f2vjyhwcJnhVbKsMbbAyO9IPVTwOnUA190qGu2hTvvPNNWv3xTr/K
 bwnuLqauh+CwCKQw+ChAjZrIRhTl48eg6aaoDli16oFDtz7znpUB/J/8gVkp/9KmJFfJ
 UhC2zqVnYpUnXQuT+3cd65oLriDVbnYu0CTIbV7OGw9t7nCp8VXb/dHoDzjFIdB8tOEx
 t9uYy5gNGPQMj75ssGuliNSiAAquiVSV96vkCmGah/HcAHX3hscGF5NS4pZEt+zmeYUe
 8eOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbY34tZfHXyiGG86UPfsdrZFSzLJoc2sFedoI98wuFlyds2jT3vWFuOvEhDXTEXsWT+NP2eBDFjso6A2V81lpDTb7XeYXCnuYeGqk8okQ7
X-Gm-Message-State: AOJu0YyEgd+DShzz+6IJBFXO+cG75BnW2zjEvfHMRIpC9N8NQ0PCDAxC
 zK8Pv+qie1mYFihpMx/MxjVsWe0NNliSqvGAjCGsGvlRlabmfSQRyu1QlROcZeoxNIHadbo88VC
 79w2sK8m8v8TGMmr1Z0FROrWxAeT5ZAKUazlNQGjqOmKheNke3R5GaNRV1X7uBcj/RrknUSp8Bg
 ==
X-Received: by 2002:a05:6402:1f03:b0:55f:ce14:337a with SMTP id
 b3-20020a0564021f0300b0055fce14337amr3370961edb.11.1707845961533; 
 Tue, 13 Feb 2024 09:39:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgrdfmK0g+Ywab6m3Flje1TWrp4F6K+oXf5dXG9V6kAdl3FWJz/RFUgY54zRXSoj+gGM5t8g==
X-Received: by 2002:a05:6402:1f03:b0:55f:ce14:337a with SMTP id
 b3-20020a0564021f0300b0055fce14337amr3370943edb.11.1707845961155; 
 Tue, 13 Feb 2024 09:39:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9j/9qClzTVGDZpurtbdHmr3dv+QQWJ+XFT3AvRwmEgHHbcrJgMtIIuKgg3fe7r5Oy64c3kSL2cnFAMqB6rihu0Di1mOjMkUWTixru2UosXa7WnPdIkrTBJOlMr9X3C8K7FdVTFlTRwvXSdOFEGw==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 c19-20020aa7c993000000b0056211a1635esm242219edt.47.2024.02.13.09.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 09:39:20 -0800 (PST)
Message-ID: <c13596a5-f672-46e4-8ca6-4f1e449f3267@redhat.com>
Date: Tue, 13 Feb 2024 18:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
 <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
 <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
 <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
 <a2174cc2-ea65-4bcf-a112-f60f26b7213c@redhat.com>
 <ZcZ0UXfbKYNhhBiC@phenom.ffwll.local>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZcZ0UXfbKYNhhBiC@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2/9/24 19:52, Daniel Vetter wrote:
> On Fri, Feb 09, 2024 at 06:41:32PM +0100, Danilo Krummrich wrote:
>> On 2/6/24 15:03, Daniel Vetter wrote:
>>> On Mon, Feb 05, 2024 at 11:00:04PM +0100, Danilo Krummrich wrote:
>>>> On 2/5/24 22:08, Dave Airlie wrote:
>>>>> On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
>>>>>>
>>>>>> On 1/29/24 02:50, Dave Airlie wrote:
>>>>>>> From: Dave Airlie <airlied@redhat.com>
>>>>>>>
>>>>>>> This should break the deadlock between the fctx lock and the irq lock.
>>>>>>>
>>>>>>> This offloads the processing off the work from the irq into a workqueue.
>>>>>>>
>>>>>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>>>>
>>>>>> Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
>>>>>> safe deferring fence signalling to the kernel global wq. However, I wonder
>>>>>> if we could create deadlocks by building dependency chains into other
>>>>>> drivers / kernel code that, by chance, makes use of the kernel global wq as
>>>>>> well.
>>>>>>
>>>>>> Admittedly, even if, it's gonna be extremely unlikely given that
>>>>>> WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
>>>>>>
>>>>>> Also, do we need to CC stable?
>>>>>
>>>>> I pushed this to Linus at the end of last week, since the hangs in 6.7
>>>>> take out the complete system and I wanted it in stable.
>>>>>
>>>>> It might be safer to use a dedicated wq, is the concern someone is
>>>>> waiting on a fence in a workqueue somewhere else so we will never
>>>>> signal it?
>>>>
>>>> Yes, if some other work is waiting for this fence (or something else in the same
>>>> dependency chain) to signal it can prevent executing the work signaling this fence,
>>>> in case both are scheduled on the same wq. As mentioned, with the kernel global wq
>>>> this would be rather unlikely to lead to an actual stall with WQ_MAX_ACTIVE == 512,
>>>> but formally the race condition exists. I guess a malicious attacker could try to
>>>> intentionally push jobs directly or indirectly depending on this fence to a driver
>>>> which queues them up on a scheduler using the kernel global wq.
>>>
>>> I think if you add dma_fence_signalling annotations (aside, there's some
>>> patch from iirc Thomas Hellstrom to improve them and cut down on some
>>> false positives, but I lost track) then I think you won't get any splats
>>> because the wq subsystem assumes that WC_MAX_ACTIVE is close enough to
>>> infinity to not matter.
>>
>> As mentioned, for the kernel global wq it's 512. (Intentionally) feeding the kernel
>> with enough jobs to to provoke a deadlock doesn't seem impossible to me.
>>
>> I think it'd be safer to just establish not to use the kernel global wq for executing
>> work in the fence signalling critical path.
>>
>> We could also run into similar problems with a dedicated wq, e.g. when drivers share
>> a wq between drm_gpu_scheduler instances (see [1]), however, I'm not sure we can catch
>> that with lockdep.
> 
> I think if you want to fix it perfectly you'd need to set the max number
> of wq to the number of engines (or for dynamic/fw scheduled engines to the
> number of context) you have. Or whatever limit to the number of parallel
> timelines there is.> 
> I guess this would need a new wq function to update? drm/sched code could
> be able to set that for drivers, so drivers cannot get this wrong.

Not sure I can follow. The scheduler instance might be per context and bind
queue. In this case it gets the shared wq passed, but doesn't know how many
other scheduler instances share the same one.

Additionally, there might be drivers not using the DRM scheduler for for bind
queues at all (I think Xe does not).

> 
> If we don't do something like that then I'm not sure there's really much
> benefit - instead of carefully timing 512 dma_fence on the global wq you
> just need to create a pile of context (at least on intel's guc that's
> absolutely no issue) and then careful time them.

Well, that's true. I'd still argue that there is a slight difference. From a
drivers isolated perspective using the global kernel wq might be entirely fine,
as in this patch. However, in combination with another driver doing the same
thing, things can blow up. For the case you illustrated it's at least possible
to spot it from a driver's perspective.

> 
> I still feel like we have bigger fish to fry ... But might be worth the
> effort to at least make the parallel timeline limit a lot more explicit?

I agree, and it'd be great if we can find a solution such bugs can be detected
systematically (e.g. through lockdep), but maybe we can start to at least
document that we should never use the kernel global wq and where we need to be
careful in sharing driver wqs.

- Danilo

> 
> Cheers, Sima
> 
>>
>> [1] https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/gpu/drm/nouveau/nouveau_drm.c#L313
>>
>>>
>>> I'm not sure we should care differently, but I guess it'd be good to
>>> annotate it all in case the wq subsystem's idea of how much such deadlocks
>>> are real changes.
>>>
>>> Also Teo is on a mission to get rid of all the global wq flushes, so there
>>> should also be no source of deadlocks from that kind of cross-driver
>>> dependency. Or at least shouldn't be in the future, I'm not sure it all
>>> landed.
>>> -Sima
>>
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3F3AE6DA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 12:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E68689DF7;
	Mon, 21 Jun 2021 10:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6273089DAB;
 Mon, 21 Jun 2021 10:16:58 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dm5so15500732ejc.9;
 Mon, 21 Jun 2021 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vwoZH4PsgycQW61cTQy0ASo+KIGGM6EOCEkdoJtiJtA=;
 b=eUiEHs75vGzUDHtPJdEpvbJNVEBDmBqmu1u7EyiP36yLdJLV4h3DbfIY+bI08NOBIm
 mMTXJ3nPqKxdKBF2x7hD3HW+rLveYWLla9xHDcFqC1P2G0H+YDgKknxyQqJQW67/Hl1Q
 WUSjF2t4BdC1a0zaTTWFjo7wsiugYCyFIwVtlDO3PS2OdNiI5Mh6N4pVLjYqQ5mvVIZw
 vFliOaFAaEzeVlVu88lwb9A8qccYNR31DLWt/zSC1iuijbvqjBMRn4sFcpVCAxkUyc3m
 n5IX0HS9lBBdogvoOdTal+f18H+9dLjoVEsGb165N91wRHEv0pekg3/LSNxoEDyE+kVG
 PmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vwoZH4PsgycQW61cTQy0ASo+KIGGM6EOCEkdoJtiJtA=;
 b=EOVhkFTSqF/OPz7Hq8U8fevoBmNIEdSag0n3EbVxu2gSb1iUaiVR42YLkIgzvc2n8k
 jWkzL9ukO87CzreG41QR5sM8LRMklhfsjQbtIH2OR5xfp8xB59RCaAxUfkBFBFR7C4W6
 kF6XEcc25K+suBLi/Fg/HdeGICnw2UjFIWivafN+Nasgeikl1XInT5QEJWrITsZ3vtJV
 r8hWsBjSeY7vPVmzYbJUMBMNMOryaVTnvXOHDi4qYcrSLO7aqzBKDrTtLYLmrdOa5qWI
 tWdj0d+t4LrNJpzvoShMghTW/TiYvsKewqBaetqhBvqGcEBhhVNF8p49f4j1fBG768sG
 /CKA==
X-Gm-Message-State: AOAM532naMc7HLs+pZ680MbKaEFGm3BNeRYvGHrjFhPJMRob9bjrtIx+
 cutlGq9ofO2IW08MZvagu6M=
X-Google-Smtp-Source: ABdhPJx1tRvmL8UD6g7bzign9JURLbAVdBke+58pD9Z57TIPthSb6nvfo6u9dYZdOewaibqZayhOyw==
X-Received: by 2002:a17:907:2d07:: with SMTP id
 gs7mr6420244ejc.375.1624270616927; 
 Mon, 21 Jun 2021 03:16:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:aae5:6e05:c:d69?
 ([2a02:908:1252:fb60:aae5:6e05:c:d69])
 by smtp.gmail.com with ESMTPSA id l7sm7508608edc.78.2021.06.21.03.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 03:16:56 -0700 (PDT)
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
 <YMupgTffAfw8xw51@phenom.ffwll.local>
 <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
 <CAKMK7uH5oW3icBPOPsumRv+LJ-5qCVKgfniXd-J8mnA+JuRq+Q@mail.gmail.com>
 <53c1c0c2-5e17-a54f-155b-66f3cd4b48a3@amd.com>
 <CAKMK7uHng_beNWeYa50Nxrz2SQVmjTuuN-cAYz-SQtAymGdH3Q@mail.gmail.com>
 <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
 <CAKMK7uELvm+OFZ_GJT4NnB5xXChUcTEuozz4MTu9KwEne=bzgA@mail.gmail.com>
 <ce3fbc52-d629-f022-da52-bcc1adafbe23@amd.com>
 <CAKMK7uENS-LQdMcQpa2gi-QZVUu74Y_-13iNoZO8eFTnZZ1PEw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <dba19127-3500-6fbe-f20b-b7889fe5cae4@gmail.com>
Date: Mon, 21 Jun 2021 12:16:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uENS-LQdMcQpa2gi-QZVUu74Y_-13iNoZO8eFTnZZ1PEw@mail.gmail.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.06.21 um 20:45 schrieb Daniel Vetter:
> On Fri, Jun 18, 2021 at 8:02 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 18.06.21 um 19:20 schrieb Daniel Vetter:
>> [SNIP]
>> The whole thing was introduced with this commit here:
>>
>> commit f2c24b83ae90292d315aa7ac029c6ce7929e01aa
>> Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>> Date:   Wed Apr 2 17:14:48 2014 +0200
>>
>>       drm/ttm: flip the switch, and convert to dma_fence
>>
>>       Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>>
>>    int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>> ....
>> -       bo->sync_obj = driver->sync_obj_ref(sync_obj);
>> +       reservation_object_add_excl_fence(bo->resv, fence);
>>           if (evict) {
>>
>> Maarten replaced the bo->sync_obj reference with the dma_resv exclusive
>> fence.
>>
>> This means that we need to apply the sync_obj semantic to all drivers
>> using a DMA-buf with its dma_resv object, otherwise you break imports
>> from TTM drivers.
>>
>> Since then and up till now the exclusive fence must be waited on and
>> never replaced with anything which signals before the old fence.
>>
>> Maarten and I think Thomas did that and I was always assuming that you
>> know about this design decision.
> Surprisingly I do actually know this.
>
> Still the commit you cite did _not_ change any of the rules around
> dma_buf: Importers have _no_ obligation to obey the exclusive fence,
> because the buffer is pinned. None of the work that Maarten has done
> has fundamentally changed this contract in any way.

Well I now agree that the rules around dma_resv are different than I 
thought, but this change should have raised more eyebrows.

The problem is this completely broke interop with all drivers using TTM 
and I think might even explain some bug reports.

I re-introduced the moving fence by adding bo->moving a few years after 
the initial introduction of dma_resv, but that was just to work around 
performance problems introduced by using the exclusive fence for both 
use cases.

> If amdgpu (or any other ttm based driver) hands back and sgt without
> waiting for ttm_bo->moving or the exclusive fence first, then that's a
> bug we need to fix in these drivers. But if ttm based drivers did get
> this wrong, then they got this wrong both before and after the switch
> over to using dma_resv - this bug would go back all the way to Dave's
> introduction of drm_prime.c and support for that.

I'm not 100% sure, but I think before the switch to the dma_resv object 
drivers just waited for the BOs to become idle and that should have 
prevented this.

Anyway let's stop discussing history and move forward. Sending patches 
for all affected TTM driver with CC: stable tags in a minute.


> The only thing which importers have to do is not wreak the DAG nature
> of the dma_resv fences and drop dependencies. Currently there's a
> handful of drivers which break this (introduced over the last few
> years), and I have it somewhere on my todo list to audit&fix them all.

Please give that some priority.

Ignoring the moving fence is a information leak, but messing up the DAG 
gives you access to freed up memory.

> The goal with extracting dma_resv from ttm was to make implicit sync
> working and get rid of some terrible stalls on the userspace side.
> Eventually it was also the goal to make truly dynamic buffer
> reservation possible, but that took another 6 or so years to realize
> with your work. And we had to make dynamic dma-buf very much opt-in,
> because auditing all the users is very hard work and no one
> volunteered. And for dynamic dma-buf the rule is that the exclusive
> fence must _never_ be ignored, and the two drivers supporting it (mlx5
> and amdgpu) obey that.
>
> So yeah for ttm drivers dma_resv is primarily for memory management,
> with a side effect of also supporting implicit sync.
>
> For everyone else (and this includes a pile of render drivers, all the
> atomic kms drivers, v4l and I have no idea what else on top) dma_resv
> was only ever about implicit sync, and it can be ignored. And it (the
> implicit sync side) has to be ignored to be able to support vulkan
> winsys buffers correctly without stalling where we shouldn't. Also we
> have to ignore it on atomic kms side too (and depending upon whether
> writeback is supported atomic kms is perfectly capable of reading out
> any buffer passed to it).

Oh! That might actually explain some issues, but that just completely 
breaks when TTM based drivers use atomic.

In other words for the first use is actually rather likely for TTM based 
drivers to need to move the buffer around so that scanout is possible.

And that in turn means you need to wait for this move to finish even if 
you have an explicit fence to wait for. IIRC amdgpu rolled its own 
implementation of this and radeon doesn't have atomic, but nouveau is 
most like broken.

So we do need a better solution for this sooner or later.

>> It's absolutely not that this is my invention, I'm just telling you how
>> it ever was.
>>
>> Anyway this means we have a seriously misunderstanding and yes now some
>> of our discussions about dynamic P2P suddenly make much more sense.
> Yeah I think at least we finally managed to get this across.
>
> Anyway I guess w/e for me now, otherwise we'll probably resort to
> throwing chairs :-) I'm dearly hoping the thunderstorms all around me
> actually get all the way to me, because it's way, way too hot here
> right now.

Well it's probably rather Dave or Linus who might start to throw chairs 
at us to not getting this straight sooner.

At least the weather is getting more durable.

Cheers,
Christian.

>
> Cheers, Daniel
>
>> Regards,
>> Christian.
>>
>>
>>> _only_ when you have a dynamic importer/exporter can you assume that
>>> the dma_resv fences must actually be obeyed. That's one of the reasons
>>> why we had to make this a completely new mode (the other one was
>>> locking, but they really tie together).
>>>
>>> Wrt your problems:
>>> a) needs to be fixed in drivers exporting buffers and failing to make
>>> sure the memory is there by the time dma_buf_map_attachment returns.
>>> b) needs to be fixed in the importers, and there's quite a few of
>>> those. There's more than i915 here, which is why I think we should
>>> have the dma_resv_add_shared_exclusive helper extracted from amdgpu.
>>> Avoids hand-rolling this about 5 times (6 if we include the import
>>> ioctl from Jason).
>>>
>>> Also I've like been trying to explain this ever since the entire
>>> dynamic dma-buf thing started.
>>> -Daniel
>


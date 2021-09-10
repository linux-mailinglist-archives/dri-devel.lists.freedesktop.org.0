Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9540684D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14596E988;
	Fri, 10 Sep 2021 08:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583F46E988
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:25:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so775204wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jnAf0xLBWusghZcMjk31Mo1kGPpJ5bVW3Bux4jnUVec=;
 b=HYhFfUUvv74i9Cy9zP+coZKqDFJ80DnLqtccUf3o2VdKg0WsVudTCrRwZNguxXauRa
 crtYOOEWS0lmsGu/vjs9YW2a3sVh5Lks+E0KxDzsJ959DtUp+7xHdnv+D6JNQ72TmB80
 xONNK6XXpFneYuGf/8bHOw1ScaYHzgCLzk5rn7AB8p+rloBfMQK03QNOIA0xc8k6LnNw
 wE6czWEeAWRtMHP2v43gSUV4l13ABoqCgsfPFxcHDMshNh1TF0t6Q1t4qTZBPBrIfTG4
 sAbv5+7s1tPgYSYrk9d9Ir8Vr7B6hmUunOHNlQMUtvK1rdXN9MVzvQ/C0T0GnnK78LSL
 4tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jnAf0xLBWusghZcMjk31Mo1kGPpJ5bVW3Bux4jnUVec=;
 b=KYkA6cXHJwnNa99ypUuDrXaFYhEAEhiyNt0skjsy+MIDoPgfaInhBlYi1xKVY7TMnp
 nH4qQwIGWbWAa2sIyGsTmDiwESYyJJyLp7cXGR9USGzXmMmoq5YvUXTfOLQf8CjvsWj8
 V6VZPSSepYU1jZnd5yGRhnPYiRWH6AkBKjjpi5Tvppg9sIL5CxiUtx0UJCZjAK2Q6SXf
 OrhuOi7pFXlCeMtp0sdGdvF1651YuWkcJsNGrmgbbRkH7/CaxhpMcfC0SCO4qOINXOHD
 K9jwhUvGB0wHxJ1eKsp5AFSBBsU7/PMVymuv6kX7b1ng3/lj8iibwuBsszfSblVoBTRa
 TsGw==
X-Gm-Message-State: AOAM5305SsljBymr6ih0iRZaFUn8MP+5FKk9Df/R4+KR+srWlZ8t/pZc
 dLeNmcV2bWGWlTIKt7fO9JtqArM8oE0VsOfY
X-Google-Smtp-Source: ABdhPJzsX0MhmxQNqLuJcwoeCNj8SDBJAPpFOZkQ4IEpccGQq3+tCZzela3JGdC0eXu7qPnLMRSdAA==
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr7222371wmh.64.1631262350820;
 Fri, 10 Sep 2021 01:25:50 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id a3sm1071327wrt.28.2021.09.10.01.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 01:25:49 -0700 (PDT)
Subject: Re: i915 ttm_tt shmem backend
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
References: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
 <MN2PR12MB377560697912FB903C3EA00C83D59@MN2PR12MB3775.namprd12.prod.outlook.com>
 <CAM0jSHNkzR8bfcWET-d8BY1QrvPBFMfkDJLsfNUm4Ek6-2Cgzw@mail.gmail.com>
 <ffab32dacece7fe3bb155f1ce2873d9e603f9f09.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8129207c-bfb6-a710-c051-0f1befa55807@gmail.com>
Date: Fri, 10 Sep 2021 10:25:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ffab32dacece7fe3bb155f1ce2873d9e603f9f09.camel@linux.intel.com>
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



Am 10.09.21 um 10:08 schrieb Thomas Hellström:
> Perhaps some background and goal is worth mentioning here.
>
>
> On Thu, 2021-09-09 at 17:56 +0100, Matthew Auld wrote:
>> On Thu, 9 Sept 2021 at 17:43, Koenig, Christian
>> <Christian.Koenig@amd.com> wrote:
>>> Hi Matthew,
>>>
>>> this doesn't work, I've already tried something similar.
>>>
>>> TTM uses the reverse lookup functionality when migrating BOs
>>> between system and device memory. And that doesn't seem to work
>>> with pages from a shmem file.
>> Hmm, what do you mean by reverse lookup functionality? Could you
>> please point out where that is in the TTM code?
> I think this is in unmap_mapping_range() where, if we use VM_MIXEDMAP,
> there is a reverse lookup on the PTEs that point to real pages. Now
> that we move over to VM_PFNMAP, that problem should go away since core
> vm never has a page to investigate. Probably this is why things works
> on non-TTM i915 GEM.

Yeah, that was really likely the root problem. I didn't kept 
investigating after realizing that my approach wouldn't work.

> @Christian: Some background here:
> First I think that there might be things like the above that will pose
> problems, and we may or may not be able to overcome those but more
> importantly is that we agree with you that *if* we make it work, it is
> something that you as a maintainer of TTM can accept from a design- and
> maintainabiltiy point of view.
>
> The approach would be similar to the buddy allocator, we adapt some
> driver code to TTM in a way that it may be reused with other drivers,
> and if other drivers are interested, we'd assist in moving to core TTM.
> In essence it'd be a TTM shmem page pool with full shrinking ability
> for cached pages only.
>
> What we're really after here is the ability to shrink that doesn't
> regress much w r t the elaborate shrinker that's in i915 today that is
> power management aware and is also able to start shmem writebacks to
> avoid shmem just caching the pages instead of giving them back to the
> system (IIRC it was partly the lack of this that blocked earlier TTM
> shrinking efforts).
>
> And since it doesn't really matter whether the shrinker sits in core
> TTM or in a driver, I think a future goal might be a set of TTM
> shrinker helpers that makes sure we shrink the right TTM object, and
> perhaps a simple implementation that is typically used by simple
> drivers and other drivers can build on that for a more elaborate power-
> management aware shrinker.

That's understandable, but I think not necessary what we should aim for 
in the long term.

First of all I would really like to move more of the functionality from 
ttm_pool.c into the core memory management, especially handling of 
uncached and write combined memory.

That's essentially completely architecture dependent and currently 
implemented extremely awkward. Either Daniels suggestion of having a 
GFP_WC or Christophs approach of moving all this into the DMA API is the 
way to go here.

As long as i915 has no interest in USWC support implementing their own 
shmemfile backend sounds fine to me, but I have strong doubt that this 
will be of use to anybody else.

Christian.

>
> /Thomas
>
>
>
>>> Regards,
>>> Christian.
>>>
>>> ________________________________
>>> Von: Matthew Auld <matthew.william.auld@gmail.com>
>>> Gesendet: Donnerstag, 9. September 2021 16:56
>>> An: Christian König <ckoenig.leichtzumerken@gmail.com>; Koenig,
>>> Christian <Christian.Koenig@amd.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; ML dri-
>>> devel <dri-devel@lists.freedesktop.org>
>>> Betreff: i915 ttm_tt shmem backend
>>>
>>> Hi Christian,
>>>
>>> We are looking into using shmem as a ttm_tt backend in i915 for
>>> cached
>>> system memory objects. We would also like to make such objects
>>> visible
>>> to the i915-gem shrinker, so that they may be swapped out or
>>> discarded
>>> when under memory pressure.
>>>
>>> One idea for handling this is roughly something like:
>>> - Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
>>> - Skip the ttm_pages_allocated accounting on such objects, similar
>>> to
>>> how FLAG_SG is already handled.
>>> - Skip all the page->mapping and page->index related bits, like in
>>> tt_add_mapping, since it looks like these are set and used by
>>> shmem.
>>> Not sure what functionally this might break, but looks like it's
>>> maybe
>>> only driver specific?
>>> - Skip calling into ttm_bo_swap_out/in and just have
>>> ttm_populate/unpopulate handle this directly for such objects.
>>> - Make such objects visible to the i915-gem shrinker.
>>>
>>> Does this approach look acceptable?
>


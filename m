Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BFCABE9D1
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 04:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5723910E5FE;
	Wed, 21 May 2025 02:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AAPN657f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6764310E5FE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 02:24:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so1234495466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 19:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747794250; x=1748399050; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zep8jUyVWRqWdl1ySZ1IMmitiQ9Bx2l2/3z+6CoOAyQ=;
 b=AAPN657fAwmk1aPFv68WdxgRcdHfaa7rFHAn5ZPOeAmv5QM6Qa3N3I66akH195jt1M
 H3vuk970ydPHzLXJFqrVuBhuKAF2AinbNn7t8Emf58b6dTeGHMZmkAYZTPW5x6T/Y9Eu
 QpXOwsGg6CNFZTWRg4FLNCJyYGGp55Y+jFlO/w+Mq7vLCttm+VDmHE6vaZK3kTRg/eUM
 xMnDu1q/d167LJFkgKczdt2yIP+5Q7GwNvWjTKVT641qsOgXfKYZ64FTRp0bTd0bR3vO
 uHqHgl85JbuTqef5MSx+K4LnJIxizS/YZnOGDvoWf6LDmfnI8eyIiCrtg2NOHbyjmR2G
 Jmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747794250; x=1748399050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zep8jUyVWRqWdl1ySZ1IMmitiQ9Bx2l2/3z+6CoOAyQ=;
 b=D6ncKP1XOvrg96HeBrdur7ka2AuiXB+vrWizlRfYzilNPFBv4baSUAqCGbPfdVwaxZ
 FUvtvW+5sodjlmRCk13ZP4HOzSCUOLvvt5sV3qNJ2K4F6j07NRvMU/QCtdzRzbH5Up4O
 lt+IA5VjPXGLRQebtz2pam6kDgQEM4LYRhH2WXLJFFOQlG17KGXUxa9H0l/+DHdDnfQh
 wV3zvRu7qCq2LLtfnjsSU4ciqwvsH4teCAKMxWMGjap5zuNULVC8FHJROIJPha8fmG9N
 Aebu5cnCoRtx4/CAI6oFPaTWbRuzF7O27s55iEodMjfL4HrkkWEeXnRG1bIEtoaU8EBn
 uBMw==
X-Gm-Message-State: AOJu0YwfjKXN4nOHKn3LntRmTwFREXCa8pbEIkXrb5sYlZQKpCol7a9l
 GUBrPsbNxSism9h/wcICXsp+dIejrwcEaBciZPNfBBJ9MGeUKgPmqtj6tvO6fI47IqX5MHgsA9Q
 VWKs6nYjAkIfHKxKNnzRdgHecaQsZRs4=
X-Gm-Gg: ASbGnctbKK/tWwSW5MEl8JYo7PQ7FZm4MVwC+Bx4PlgdDpfyVLVV+b1hm6iYGYIqgns
 3LV4cLXziyRLoLR6buL25QXXdOx93JzojkT1Vxy27D2UtLXzqaO3hPvSR9YXYQ/idnJJWcUDmCc
 6zwfZKR9MmDmhvdhmemfG89zV/trgE7K4=
X-Google-Smtp-Source: AGHT+IEqmUUUARaTWdPbScfW/UOOWhQFAMlTlqruo8FR5l5jgD1WE6rjs2FuMs+sRKIX0Z3QLcywUcEUaMDJj70Wk7Y=
X-Received: by 2002:a17:907:2da1:b0:ad5:7bc4:84b5 with SMTP id
 a640c23a62f3a-ad57bc48ff6mr861511966b.57.1747794249742; Tue, 20 May 2025
 19:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
In-Reply-To: <20250513075446.GA623911@cmpxchg.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 May 2025 12:23:58 +1000
X-Gm-Features: AX0GCFt2XDDsnmfi-Qx3KaucN19nBAb-rbHv-O-eZqS1qgLB8WI-6u1buY6AC_Y
Message-ID: <CAPM=9tw+DE5-q2o6Di2POEPcXq2kgE4DXbn_uoN+LAXYKMp06g@mail.gmail.com>
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
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

>
> So in the GPU case, you'd charge on allocation, free objects into a
> cgroup-specific pool, and shrink using a cgroup-specific LRU
> list. Freed objects can be reused by this cgroup, but nobody else.
> They're reclaimed through memory pressure inside the cgroup, not due
> to the action of others. And all allocated memory is accounted for.
>
> I have to admit I'm pretty clueless about the gpu driver internals and
> can't really judge how feasible this is. But from a cgroup POV, if you
> want proper memory isolation between groups, it seems to me that's the
> direction you'd have to take this in.

I've been digging into this a bit today, to try and work out what
various paths forward might look like and run into a few impedance
mismatches.

1. TTM doesn't pool objects, it pools pages. TTM objects are varied in
size, we don't need to keep any sort of special allocator that we
would need if we cached sized objects (size buckets etc). list_lru
doesn't work on pages, if we were pooling the ttm objects I can see
being able to enable list_lru. But I'm seeing increased complexity for
no major return, but I might dig a bit more into whether caching
objects might help.

2. list_lru isn't suitable for pages, AFAICS we have to stick the page
into another object to store it in the list_lru, which would mean we'd
be allocating yet another wrapper object. Currently TTM uses the page
LRU pointer to add it to the shrinker_list, which is simple and low
overhead.

If we wanted to stick with keeping pages in the pool, I do feel moving
the pool code closer to the mm core and having some sort of more
tightly integrated reclaim to avoid the overheads. Now in an ideal
world we'd get a page flag like PG_uncached, and we can keep an
uncached inactive list per memcg/node and migrate pages off it, but I
don't think anyone is willing to give us a page flag for this, so I
think we do need to find a compromise that isn't ideal but works for
us now. I've also played a bit with the idea of MEMCG_LOWOVERHEAD
which adds a shrinker to start of shrinker list instead of end and
registering TTM pool shrinker as one of those.

Have I missed anything here that might make this easier?

Dave.

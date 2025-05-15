Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E3EAB7BEF
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 05:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA1110E128;
	Thu, 15 May 2025 03:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aang9sXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FA710E128
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 03:02:20 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5fcaff7274bso775983a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747278139; x=1747882939; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=86XbXvTLz8UDUISxlcsp2p/PExbaUXdKcv+lnR4Z9Ug=;
 b=aang9sXbbeVRm8QVFLHOcQVx2rtCxqDwmLNJoTIkw2jeOjsJUSHY2p76ZJMiWH0JFk
 EwcmdwMakAFB66Xu1rAwcH/0HOscTgcozZbTpeXWkp5CwlNeCwfC/WGTeXzpraDE9qBd
 6qbo618kbFL+pl+wm42NILI5F7WuVW0RzY9Dk0qh8oYSsAD6SsGgXt8Y2bNCXwKW8IhQ
 rjNt4+G7a4zTq+X1cttEb9EYQEnXFEcinxehXYkZWt85zmcBzELyxJwHHVIyp3t8Rr8t
 eq1FunfAPC/8hl8JJG5Uge7M8BqW7cPESzGaXalpmUt0IiEGpmjjwNm8NVLfEmTJTRM2
 PUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747278139; x=1747882939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=86XbXvTLz8UDUISxlcsp2p/PExbaUXdKcv+lnR4Z9Ug=;
 b=X7j/HDQLkgKNLNQyyUhvEdbUDDkLfJHCNu5Hu9K47vZxFIMKUv6LM0gBThkrmRvneQ
 PaeSh3gVkLRE3ILRulPBbI3e0IrJ7gyksFDKhIot+Ve05uCCeuLexg5K9UgoD/bM7gq4
 tQYKrrkyv5dfGzu09JPkm2ZO1/9IdAN8GPbLd6yZRr9rjlXxe3Ew1VSBcY0ICa+tqS5m
 voG39BoCvtA7PCzODXomjEi8R3FlnXL8xz+WHT0u8wRyYo19wbQveH5APQn4oFkcii2H
 WBUC70JNBq2uRZXNHWfHkiV9IBWeIvwPLH4pJz4oR/e2yX0PEdyXxK707Lg2E6rws3wK
 YNLA==
X-Gm-Message-State: AOJu0Yxgk5enhakwmpjpxV0E+Yx47V0aNeaeybOs6szkPpql2KLRQv0y
 nEU/0hSNPCwnTK/XL589GkWzP0/Ob2YNn0QXDvh3nQITa9yWRMsTR/JFSsLmpBY3Fp+G0lyi4CS
 2tiRl7esGTCM1jkN+QVtUkR6K9pA=
X-Gm-Gg: ASbGncvnzvkinnEQp0J1tuWIrMp2WDfK6kszTjWI6KjMghprgtcBkRkGKY8kPl5/I//
 thiCKmuj0yFfn3HXT/gxt/L1EjTtWMwc5nOu0et/btnmNn0fAj6hd1m5BfSNaASwmmQMf55Nw/K
 k5Hv9JWlXHcKGCDM8aoUWCi+nEKqI1Z71Z
X-Google-Smtp-Source: AGHT+IHmHCtGkDKttyJYJP7nyhj7N2BAS3mMwXtsLwVd2476Wp7qLIklhWa5dLJzilk4UQF/RAhFy5inlK0B96f5Ego=
X-Received: by 2002:a17:906:730f:b0:acf:b9bd:300b with SMTP id
 a640c23a62f3a-ad4f70fb961mr525124366b.11.1747278138894; Wed, 14 May 2025
 20:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
In-Reply-To: <20250513075446.GA623911@cmpxchg.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 15 May 2025 13:02:07 +1000
X-Gm-Features: AX0GCFtQ8ZvmRW_pqvYiNr7wclW0HCf8f-YoFeASKT106nOB_Wm8_IwXdZtQM98
Message-ID: <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
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

> I have to admit I'm pretty clueless about the gpu driver internals and
> can't really judge how feasible this is. But from a cgroup POV, if you
> want proper memory isolation between groups, it seems to me that's the
> direction you'd have to take this in.

Thanks for this insight, I think you have definitely shown me where
things need to go here, and I agree that the goal should be to make
the pools and the shrinker memcg aware is the proper answer,
unfortunately I think we are long way from that at the moment, but
I'll need to do a bit more research. I wonder if we can agree on some
compromise points in order to move things forward from where they are
now.

Right now we have 0 accounting for any system memory allocations done
via GPU APIs, never mind the case where we have pools and evictions.

I think I sort of see 3 stages:
1. Land some sort of accounting so you can at least see the active GPU
memory usage globally, per-node and per-cgroup - this series mostly
covers that, modulo any other feedback I get.
2. Work on making the ttm subsystem cgroup aware and achieve the state
where we can shrink inside the cgroup first.
3. Work on what to do with evicted memory for VRAM allocations, and
how best to integrate with dmem to possibly allow userspace to define
policy for this.

> Ah, no need to worry about it. The name is just a historical memcgism,
> from back when we first started charging "kernel" allocations, as
> opposed to the conventional, pageable userspace memory. It's no longer
> a super meaningful distinction, tbh.
>
> You can still add a separate counter for GPU memory.

Okay that's interesting, so I guess the only question vs the bespoke
ones is whether we use __GFP_ACCOUNT and whether there is benefit in
having page->memcg set.

>
> I agree this doesn't need to be a goal in itself. It would just be a
> side effect of charging through __GFP_ACCOUNT and uncharging inside
> __free_pages(). What's more important is that the charge lifetime is
> correlated with the actual memory allocation.

How much flexibility to do we have to evolve here, like if we start
with where the latest series I posted gets us (maybe with a CONFIG
option), then work on memcg aware shrinkers for the pools, then with
that in place it might make more sense to account across the complete
memory allocation. I think I'm also not sure if passing __GFP_ACCOUNT
to the dma allocators is supported, which is also something we need to
do, and having the bespoke API allows that to be possible.

Dave.

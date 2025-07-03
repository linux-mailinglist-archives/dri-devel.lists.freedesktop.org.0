Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9CAAF69EC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 07:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB8410E11C;
	Thu,  3 Jul 2025 05:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I8kAymOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5A110E11C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 05:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751522032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g93xnR94ghhQeXUascDTqu51LAmFxEiGorxT1x78S3I=;
 b=I8kAymOjMeDUNaWXYexeVQyYrybLlOmhcVCDTEvDNEFRAVymC9mVoqwujccpJxmI0EZCQ5
 /fiBqaUXAFKcr5gv54JFSJjY1krYHeDeGUioBuYtlm6FydOkU29DWb81nhxmPnU9F8Tl7p
 Ft63ljHb0NszqPZizU2gGvlSZvH4jqM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-INOEiEf9OkOUyc5z18p1NA-1; Thu, 03 Jul 2025 01:53:50 -0400
X-MC-Unique: INOEiEf9OkOUyc5z18p1NA-1
X-Mimecast-MFC-AGG-ID: INOEiEf9OkOUyc5z18p1NA_1751522030
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b34fa832869so495451a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 22:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751522029; x=1752126829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g93xnR94ghhQeXUascDTqu51LAmFxEiGorxT1x78S3I=;
 b=GYts3J9Dh9sYZ1bORkugpliGQjfB4SLQvV8kPAKEDHMlgTjr48RUGeijPJRA5yvsL+
 StjcC6+2o3z26BAoWwCxUULhaDtB6/5dZRv4xirPr0XYdMzrl0uGDR14iASV5nBW1IVM
 /m/3IY4Qv2XgfBgq3WtCpuezPZ/7skf4cOlxtSGQRl6RMnOmRza2TtE7eQRwrZgZccCw
 5p6jWCFRES0CUdXz6gVOikhVUZAXFQWq0Gkc79v2KVNSoCG/BHwdQgL5VNBzcl09MlYJ
 tPLDeg/lZ5j7yerc5Kjg/9MSnF4J5wNPn2EIfk3CtZmlzbac+2rqgR2flxDDAnkAP0jI
 X5mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEz0+8VL7FDcpB5pmV2LXfqXMrW5EN8kBlhXgxAwqtrEEuUi+QPMjJ+hxnkKa5nZ27SEQ98Kswcv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/qT60PE2r2s2e9Qei/aSSLMli/4GUnyWx5tTD0CVZScaLVkT1
 /sPUj009URe5FqflVnCKRa2p2XRupkPKd6uKah4K+qxhQ4S8VdqoXVH9IkPWWrbDcXWylGGbAgT
 p6Lb78cestunjAewcxLm4t/TYhdpIa+xhHHGQHDFc9tzL3ZHYWe7Widio5oAIVPCXx0rQwgmbzE
 VZAStBGqPAFr8lKGnv02XCXg39WtuAxi/3zYuoFa3jXaneglIvaivV09U=
X-Gm-Gg: ASbGncsFCdZ4cIIPnzFvL+8e5hotS2znfpTDDtIzNpw0eUI3VFbMT4WKIh8GFw098oG
 jaOn3pyoIVztclAq2DgWBHUUButIOgdMNzYmL27WpNd1FSnc2TOkvkRIxR7ajuYpelfzSS3TYAr
 F4BA==
X-Received: by 2002:a17:90b:2252:b0:313:d7ec:b7b7 with SMTP id
 98e67ed59e1d1-31a9f5b04ccmr1481431a91.13.1751522029115; 
 Wed, 02 Jul 2025 22:53:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw5hFVi//TsCa4Q6XzLBJ8tf++ndTT7/F7yDroUNNHQkrMEr4tlTJRzyW12RoLx7a+Se4ML52TJNjzTq9i/BI=
X-Received: by 2002:a17:90b:2252:b0:313:d7ec:b7b7 with SMTP id
 98e67ed59e1d1-31a9f5b04ccmr1481391a91.13.1751522028543; Wed, 02 Jul 2025
 22:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
 <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
 <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
 <CAMwc25q-kBRGDrphU+iAyqENZhgdRtEnSrR9z6b5bQ_JFzzK2g@mail.gmail.com>
 <26c79b1e-0f7f-4efa-9040-92df8c5bdf1f@amd.com>
 <CAMwc25oMQ_=Hagb9N6SN3pFFPwZ8+8ZBOGvziCPhUypMpPeKUQ@mail.gmail.com>
 <54b2ee4a-0f2f-49a1-a680-8dc1193e2d30@amd.com>
 <CAMwc25oYx1L9H+GCE95ZAxXAwqCDQVjpJfre_Ndv=Z8j8KOyYw@mail.gmail.com>
 <d925b300-d7e2-48ef-b533-a52fb24d222a@amd.com>
In-Reply-To: <d925b300-d7e2-48ef-b533-a52fb24d222a@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 3 Jul 2025 15:53:37 +1000
X-Gm-Features: Ac12FXyN8cI1GoKXfE4cc8g5wD4GK8VxW5bbEvzv2TsNWks9aUUHYz3_8vZfjps
Message-ID: <CAMwc25qr7LY9jH_rztTn1pT-aTEDGCHZP0GnC5U8bd46sp9p+A@mail.gmail.com>
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y_v_nFsEjrWm2OV8MiWul9vptCuXwWsTJYFn_kgBts8_1751522030
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 2, 2025 at 6:24=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 02.07.25 09:57, David Airlie wrote:
> >>>
> >>> It makes it easier now, but when we have to solve swapping, step one
> >>> will be moving all this code around to what I have now, and starting
> >>> from there.
> >>>
> >>> This just raises the bar to solving the next problem.
> >>>
> >>> We need to find incremental approaches to getting all the pieces of
> >>> the puzzle solved, or else we will still be here in 10 years.
> >>>
> >>> The steps I've formulated (none of them are perfect, but they all see=
m
> >>> better than status quo)
> >>>
> >>> 1. add global counters for pages - now we can at least see things in
> >>> vmstat and per-node
> >>> 2. add numa to the pool lru - we can remove our own numa code and
> >>> align with core kernel - probably doesn't help anything
> >>
> >> So far no objections from my side to that.
> >>
> >>> 3. add memcg awareness to the pool and pool shrinker.
> >>>     if you are on a APU with no swap configured - you have a lot bett=
er time.
> >>>     if you are on a dGPU or APU with swap - you have a moderately
> >>> better time, but I can't see you having a worse time.
> >>
> >> Well that's what I'm strongly disagreeing on.
> >>
> >> Adding memcg to the pool has no value at all and complicates things ma=
ssively when moving forward.
> >>
> >> What exactly should be the benefit of that?
> >
> > I'm already showing the benefit of the pool moving to memcg, we've
> > even talked about it multiple times on the list, it's not a OMG change
> > the world benefit, but it definitely provides better alignment between
> > the pool and memcg allocations.
> >
> > We expose userspace API to allocate write combined memory, we do this
> > for all currently supported CPU/GPUs. We might think in the future we
> > don't want to continue to do this, but we do it now. My Fedora 42
> > desktop uses it, even if you say there is no need.
> >
> > If I allocate 100% of my memcg budget to WC memory, free it, then
> > allocate 100% of my budget to non-WC memory, we break container
> > containment as we can force other cgroups to run out of memory budget
> > and have to call the global shrinker.
>
> Yeah and that is perfectly intentional.

But it's wrong, we've been told by the mm/cgroup people that this
isn't correct behaviour and we should fix it, and in order to move
forward with fixing our other problems, we should start with this one.
We are violating cgroups containment and we should endeavour to stop
doing so.

>
> > With this in place, the
> > container that allocates the WC memory also pays the price to switch
> > it back. Again this is just correctness, it's not going to fix any
> > major workloads, but I also don't think it should cause any
> > regressions, since it won't be worse than current worst case
> > expectation for most workloads.
>
> No, this is not correct behavior any more.
>
> Memory which is used by your cgroup is not used for allocations by anothe=
r cgroup any more nor given back to the core memory managment for the page =
pool. E.g. one cgroup can't steal the memory from another cgroup any more.
>
> In other words that is reserving the memory for the cgroup and don't give=
 it back to the global pool as soon as you free it.

But what is the big advantage of giving it back to the global pool
here, I'm pretty neither the worst case or steady state behaviour will
change here, but the ability for one cgroup to help or hinder another
cgroup will be curtailed, which as far as I can see is what the cgroup
behaviour is meant to be. Each piece operates in it's own container,
and can cause minimal disruption either good or bad to other
containers.

> That would only be acceptable if we have per cgroup limit on the pool siz=
e which is *much* lower than the current global limit we have.

That is up to whoever configures the cgroup limits, if they say this
process should only have access to 1GB of RAM, then between normal RAM
and uncached/wc RAM they get 1GB, if they need to move RAM between
this via the ttm shrinker then it's all contained in that cgroup. This
isn't taking swapping into account, but currently we don't do that
now.

>
> Maybe we could register a memcg aware shrinker, but not make the LRU memc=
g aware or something like that.
>
> As far as I can see that would give us the benefit of both approaches, th=
e only problem is that we would have to do per cgroup counter tracking on o=
ur own.
>
> That's why I asked if we could have TTM pool specific variables in the cg=
roup.
>
> Another alternative would be to change the LRU so that we track per memcg=
, but allow stealing of pages between cgroups.

I just don't get why we'd want to steal pages, just put all the
processes in the same cgroup. If you want to do that, we leave it up
to the cgroup administration to decide what they want to share between
processes. That policy shouldn't be in the driver/ttm layers, it
should be entirely configurable by the admin, and default to
reasonably sane behaviours.

If there is a system out there already using cgroups for containment,
but relying on this cgroup bypass to share uncached/wc pages, then
clearly it's not a great system, and we should figure out how to fix
that. If we need a backwards compat flag to turn this off, then I'm
fine with that, but we've been told by the cgroup folks that it's not
really a correct cgroup usage, and we should discourage it.

> > I understand we have to add more code to the tt level and that's fine,
> > I just don't see why you think starting at the bottom level is wrong?
> > it clearly has a use, and it's just cleaning up and preparing the
> > levels, so we can move up and solve the next problem.
>
> Because we don't have the necessary functionality to implement a memcg aw=
are shrinker which moves BOs into swap there.

We need to have two levels of shrinker here, I'm not disputing the tt
level shinker like xe has doesn't need more work, but right now we
have two shrinkers that aren't aware of numa or memcg, I'd like to
start by reducing that to one for the corner case that nobody really
cares about but would be good to be correct. Then we can work on
swap/shrinker problem, which isn't this shrinker, and if after we do
that we find a single shrinker could be take care of it all, then we
move towards that.

Dave.


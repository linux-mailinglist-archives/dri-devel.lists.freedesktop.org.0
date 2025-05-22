Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA468AC0531
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1FF10E715;
	Thu, 22 May 2025 07:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Itvx5SIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E4310E715
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 07:03:26 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5fff52493e0so8952757a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 00:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747897405; x=1748502205; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QASu0n7wbgfaqjcnh7zTxVQmk98xCzaXsu33gQpTePg=;
 b=Itvx5SIQdr5TJ8+ceI39T8V7IIqOIsv0+ueexdPwOutnl1hDJoVTEBMFSmvXoojYh7
 bIQ6O4Epp8dR7FS5E1tk7YEhABUOA6rripDZw+f+AaWIixJvXhp5rhkD1PFN5iFP4w9k
 ppoG9s8XjNXH3IX07rsKXB8UUt5liTSjeKV8N0fB3x2x3F8E3V5r4Jbq4theoT5pbnsS
 IxSwN9AmGokGh+O14zgLPntgdff1mSGAPGfy9J8hnzRvUrI5PRAUclM/X/bK+5ZSZoH1
 wKuTULGg1NF947Wfar41/5fs7Ux/GILvNaFhbPjFpCYtyTaqqleQoz2nqCn8JRmE6B6Z
 s4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747897405; x=1748502205;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QASu0n7wbgfaqjcnh7zTxVQmk98xCzaXsu33gQpTePg=;
 b=adB15R6ebeT9/nPL44iWzCzVhuYb6cdTSSz0FX+IY09/YlcY0U4H8QLBXfzw9NjPgf
 c9Z53Lsffoe3M6xnHFC0Y2Ha0W56ehusU3lIbZyzXIokl8XZ+7CDN6zgqV0Ku0m5utM9
 hlZJMdvcTwJD5rCsq3oVCHpuSG4IJusiCavCnEXAhTJyqaH7si11h5Un9sUCx9qW7XKI
 2iHwP0spAeeZbrviDZp+KK5sMm0kKQIuT7uLb6Du5meNqDI8FRpTryHeEq4CDQPxYGrM
 mUTlqhr4BRBPoLUszIyqVe3xl0H0ogkUukSfvPNYvvQIKIQ7AmqBcQaTUp7UCu7G6nQa
 8YeA==
X-Gm-Message-State: AOJu0YzjTQ3UMVKJ/9OSLmUkm/T6ngPjEV/mLd6Jp8I8gPJGN2OD7eeG
 caJ8e798wzlNiqsGVErFaAM5pj0k+9DH1FQEBOEpYgCIaLdiHFlDVhHeUJyyi4L1BaswC18HWRJ
 L284QFfwE9NMEQNfWGZLPWJPG77eUiXg=
X-Gm-Gg: ASbGncsMzckDOsCPkIpbSNdBN/THTvA/hYF6l638i150ckpxqQd6O/0PX9qVpxIiqBE
 2weZll2fIWh8bs+t6FY0kZ/SmF475ZbBFLWokGvtVud84jvx482WplMSIdlsnQqhZdt2wcHpAzy
 dJdiB/kogidU+3JjoOk18TDtVS2puAvYc=
X-Google-Smtp-Source: AGHT+IGOqrSFnE61mkfV9ZVoYVqabTtnpohyYE6OV2be+ISriSKd2LqnnymMWj+mOfrDsjsGp8ZNCKBm0grKHEbHuRM=
X-Received: by 2002:a17:907:7e87:b0:acb:5c83:25b with SMTP id
 a640c23a62f3a-ad52d42bf0cmr2329462766b.7.1747897404339; Thu, 22 May 2025
 00:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9tw+DE5-q2o6Di2POEPcXq2kgE4DXbn_uoN+LAXYKMp06g@mail.gmail.com>
 <20250521144312.GE773385@cmpxchg.org>
In-Reply-To: <20250521144312.GE773385@cmpxchg.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 22 May 2025 17:03:12 +1000
X-Gm-Features: AX0GCFvXFWotGY0gxOq3H1gGVQsCFG1oE3R-IrlQ6g1awmYaBT_6hd_z90A3vuk
Message-ID: <CAPM=9tzMc18JzG3MD8hDY1hRDFEsBCHzKSNH_EqyZ-NYqMsBzw@mail.gmail.com>
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

On Thu, 22 May 2025 at 00:43, Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Wed, May 21, 2025 at 12:23:58PM +1000, Dave Airlie wrote:
> > >
> > > So in the GPU case, you'd charge on allocation, free objects into a
> > > cgroup-specific pool, and shrink using a cgroup-specific LRU
> > > list. Freed objects can be reused by this cgroup, but nobody else.
> > > They're reclaimed through memory pressure inside the cgroup, not due
> > > to the action of others. And all allocated memory is accounted for.
> > >
> > > I have to admit I'm pretty clueless about the gpu driver internals and
> > > can't really judge how feasible this is. But from a cgroup POV, if you
> > > want proper memory isolation between groups, it seems to me that's the
> > > direction you'd have to take this in.
> >
> > I've been digging into this a bit today, to try and work out what
> > various paths forward might look like and run into a few impedance
> > mismatches.
> >
> > 1. TTM doesn't pool objects, it pools pages. TTM objects are varied in
> > size, we don't need to keep any sort of special allocator that we
> > would need if we cached sized objects (size buckets etc). list_lru
> > doesn't work on pages, if we were pooling the ttm objects I can see
> > being able to enable list_lru. But I'm seeing increased complexity for
> > no major return, but I might dig a bit more into whether caching
> > objects might help.
> >
> > 2. list_lru isn't suitable for pages, AFAICS we have to stick the page
> > into another object to store it in the list_lru, which would mean we'd
> > be allocating yet another wrapper object. Currently TTM uses the page
> > LRU pointer to add it to the shrinker_list, which is simple and low
> > overhead.
>
> Why wouldn't you be able to use the page LRU list_head with list_lru?
>
> list_lru_add(&ttm_pool_lru, &page->lru, page_to_nid(page), page_memcg(page));

I for some reason got it into my head that list_lru objects weren't
list_head, not sure why, guess I shall spend next week exploring this
possibility.

Dave.

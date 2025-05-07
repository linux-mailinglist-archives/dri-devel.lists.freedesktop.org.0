Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5A4AAEE8A
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 00:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213B210E8BD;
	Wed,  7 May 2025 22:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g/NSrEy5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59E10E273
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 22:11:29 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ac2af2f15d1so43239666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 15:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746655888; x=1747260688; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e/wF8jWPpKP/omVW3/Oh2nVdWf6erCfnXqTkbwt05XE=;
 b=g/NSrEy5UzAuwwLGBaQO6+4Iq4v37vpsO7TvPnIMrkc5egbtQRO0vIYfM1dE+749iJ
 xOJC1diHfAeFsJM46Y+aFvMnGYtcpRthhyTKntJayJQKmuFhYrepFMXqRB476CQTTvk4
 chZMaWKeyhvF7AULjQJ0NYQlS2C9Sd5MD1GSlsooa0n/5vKPSN4AlBDslsB6KjkLExfw
 ngLtk4Ci/ro+wLEV6GchjpRZ8C4h6SY4TzYnnjpZ2shDq6fEOCxln0hGEMhfDb6XGvJW
 CiEPbErvQvNjo9HBGxdcsHFhw25KhWp3/FtXg/MlhJmW+iVq8ZN07PCdGvGSbzEidypi
 ++WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746655888; x=1747260688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e/wF8jWPpKP/omVW3/Oh2nVdWf6erCfnXqTkbwt05XE=;
 b=WRK2yzA7ouLpnWXEcf0sBGzi7v9QVrNGa7shBsTJsPlCLXkI+eUvDLpuAEZHKrDojr
 ByTkjbgJ0VLsMSjFHkC7rhV4YXazWE9FPmAxj6ps6v2SH6a+OmmhTBF07E+iffIkxCug
 woYkyObU7Ya2cYfSbwA++7eX0Xr38qZD2cwMX2eOakGZ+PnAYi96pGh5IINGDLpW/cbE
 XpjKXe5w30e2CYmCR3q18SR6t6mVnA8rnYQmoqM8+9upfVvPXQMbmVGaFiGpmJzBJydi
 V6SWxh89IVqCT++1hqTw7HQ69gJam5U/E594MBkRfeRPyu+1ov6faAfIpo+ou3VwR+8j
 Fv6A==
X-Gm-Message-State: AOJu0Yzg+nfRSqZfQ7ajhy23OeJSGT6OXAkzJvYKAlXM0yh2xllYK5BW
 +7kz2Z/GmcEoPkfrqOqMt6pay7U63bLdNVbxFXfVk6mifD0TeaTuefA3GgafxJ3D+Jk1eOarDw8
 Q6XzYXaKdnYBGb85wkL9wBAdUHCD/pA==
X-Gm-Gg: ASbGncuNkkd2qY7ZytnCNFfP8saLWgpEqFQPJgjSbvqWxXo2Akabj9nAUto414llC33
 UilkPrpGSXfANuLmPmAFkz4/07SfHgaLfq0I9aiDLOHXcmFSWlSkeSNAjT+6uLGQi5TIquC9HcD
 dsljuTqgz2O4gcGX4zmB8NFHxcBaQc27A=
X-Google-Smtp-Source: AGHT+IGK7hg699O1G7VtUqCETSuLiVGeMCxq5LNunpXF8PyQyX9K++c1adNqP9CZdwpu+p8E+labArtI2sBMixds4Bw=
X-Received: by 2002:a17:907:7da9:b0:ace:c540:ffda with SMTP id
 a640c23a62f3a-ad1e8bf69cemr435027066b.26.1746655888273; Wed, 07 May 2025
 15:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
In-Reply-To: <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 8 May 2025 08:11:17 +1000
X-Gm-Features: ATxdqUE0t48D_J4NfX8UkSO40rS_eMQ8jOodU_q5EzZlkEyIHfblTJQ2jv6pXbc
Message-ID: <CAPM=9tw--fB7S75THKQQtLav2XPq9REU76keggKy2_jCJe+tYg@mail.gmail.com>
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

On Thu, 8 May 2025 at 08:03, Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 8 May 2025 at 03:52, Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > Hello Dave,
> >
> > On Fri, May 02, 2025 at 01:35:59PM +1000, Dave Airlie wrote:
> > > Hey all,
> > >
> > > This is my second attempt at adding the initial simple memcg/ttm
> > > integration.
> > >
> > > This varies from the first attempt in two major ways:
> > >
> > > 1. Instead of using __GFP_ACCOUNT and direct calling kmem charges
> > > for pool memory, and directly hitting the GPU statistic, Waiman
> > > suggested I just do what the network socket stuff did, which looks
> > > simpler. So this adds two new memcg apis that wrap accounting.
> > > The pages no longer get assigned the memcg, it's owned by the
> > > larger BO object which makes more sense.
> >
> > Unfortunately, this was bad advice :(
> >
> > Naked-charging like this is quite awkward from the memcg side. It
> > requires consumer-specific charge paths in the memcg code, adds stat
> > counters that are memcg-only with no system-wide equivalent, and it's
> > difficult for the memcg maintainers to keep track of the link between
> > what's in the counter and the actual physical memory that is supposed
> > to be tracked.
> >
> > The network and a few others like it are rather begrudging exceptions
> > because they do not have a suitable page context or otherwise didn't
> > fit the charging scheme. They're not good examples to follow if it can
> > at all be avoided.
>
> I unfortunately feel GPU might fit in this category as well, we aren't
> allocating pages in the traditional manner, so we have a number of
> problems with doing it at the page level.
>
> I think the biggest barrier to doing page level tracking is with the
> page pools we have to keep. When we need CPU uncached pages, we
> allocate a bunch of pages and do the work to fix their cpu mappings to
> be uncached, this work is costly, so when we no longer need the
> uncached pages in an object, we return them to a pool rather than to
> the central allocator. We then use a shrinker to empty the pool and
> undo the cpu mapping change. We also do equivalent pools for dma able
> and 32-bit dma able pages if they are used.
>
> This means that if userspace allocates a large uncached object, and we
> account it to the current memcg with __GFP_ACCOUNT, then when it gets
> handed back to the pool we have to remove it from the memcg
> accounting. This was where I used the memcg kmem charge/uncharges,
> uncharge on adding to pool and charge on reuse. However kmem seems
> like the wrong place to charge, but it's where the initial
> __GFP_ACCOUNT will put those pages. This is why the suggestions to use
> the network solution worked better for me, I can do all the work
> outside the pool code at a slightly higher level (the same level where
> we charge/uncharge dmem), and I don't have to worry about handling the
> different pool types etc. We also don't need page->memcg to be set for
> these pages I don't think as all pages are part of a large object and
> the object is what gets swapped or freed, not parts of it.

With all that said we also manage moving objects to swap and maybe for
proper accounting of
swapping I need the more detailed integrated approach at the lower
levels, so objects that have
been swapped get removed from the gpu counter and added to the normal
swap counters.

Dave.

>
> >
> > __GFP_ACCOUNT and an enum node_stat_item is the much preferred way. I
> > have no objections to exports if you need to charge and account memory
> > from a module.
>
> Now maybe it makes sense to add a node_stat_item for this as well as
> the GPU memcg accounting so we can have it accounted in both places,
> right now mm has no insight statistics wise into this memory at all,
> other than it being pages allocated.
>
> Dave.

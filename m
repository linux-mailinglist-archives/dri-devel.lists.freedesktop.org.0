Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A087AAEE69
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 00:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48D610E1ED;
	Wed,  7 May 2025 22:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OtT1J5t7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1885110E1ED
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 22:04:03 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so42230666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746655441; x=1747260241; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lb7bkXBSvzcM1h6VIKpZXSJSWY2RvghKR7Hds+w2dZA=;
 b=OtT1J5t7taP5yuKR6I561AWUX7tdPIxxkYWxWlROmgCyRVNvAWmqrYwM9hNhdi3NYo
 mE9xXMkH5CELcXTOORw01lHNRBQLCjr38116oRtnFI9uwCjlM4PSoX5aDRU7zr/aPDx3
 0o3S7z5y+6uyVFULG65lPOJQRHOv4RnofaMD67JfIGkv0DbhldaGoeAh8yn1h0YCI1RC
 Lv/2QiFdoGkkTRsLsZs4LkCJrnXKnevhCMwXThFKMFSgcAdzHefY38Egrv0omHC7PQgW
 Tkn0ml5H+fDHpTzOYkMqLpfEKAVq+VYHOUi3FRwCRappgfsKSlJvl/PuE3ARlQ5X1WJp
 +80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746655441; x=1747260241;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lb7bkXBSvzcM1h6VIKpZXSJSWY2RvghKR7Hds+w2dZA=;
 b=ct+EvoTLqXkYGAXJWQkwk7uP7Bw1RyCdtz7zp5onyVER4cTtuBAyL1d0J8pJqeZw9h
 NKYBRsDhfM0YSOj+uWgwOgJTQ019t6tFPUD21+3EpTfrdmkhmxj+lD4ZLGm9UJzVnLce
 /0mChIVwlld3lM9+rY03SCb7pdZQulHjLFBJIfv93QzBmH6ucTeqfRFCVo0Md6dxNafD
 DWGMHeOA+bcCkS1Wp0MOoEk3ZWKmEpFxfJ4pTXgTPTF9t/hcWNOp/RPbiwcmZZWg9v+Y
 xQ/HkAeFWoywj0MV7R8ZGMIG75ocX+NPVEqJZ2vrLXjMUCgbK616Dxt9jRZhkuyJsKg+
 aRVA==
X-Gm-Message-State: AOJu0YwWRJsZ0gbvPJlzgxNuhrAbEXWaq32iYRuTmfNOVOgJxJqCZxeB
 1bABEQAQQLvQZ6KEYWnPmbqVwEe3QS5j+SCHI7pnDV/Yvkfo5hQoEsOqB4th6/W8muA04pGEEuI
 9s4kWYna67pIB9NcErSyuxIP/KpQ0aA==
X-Gm-Gg: ASbGnctVEZZ9BwnuW/9KzFsDJ8y2SRm4OkjUNZ/LWjYwfud/TIRp0zz8mQz3Fti9Vpu
 8L6Xyb9H8D1MKXASTfMUPdiJUUy1upxe0qS0U3Z9c05QwZXszHYolOlZVzQVQpi0KSJ7VK/8Ro8
 Vis2v3mrUB/HgFXaI09XXD
X-Google-Smtp-Source: AGHT+IEVp2JYGLCucPaa7MeFKn3S9Fs5YDGYy4r7+I8/OUDzWVnDumfRwKk2uWXlfISjMjrO4FmEIraRpRWqNWGMntc=
X-Received: by 2002:a17:907:96a7:b0:ac7:b368:b193 with SMTP id
 a640c23a62f3a-ad1fe6f68b4mr80059766b.27.1746655441255; Wed, 07 May 2025
 15:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
In-Reply-To: <20250507175238.GB276050@cmpxchg.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 8 May 2025 08:03:49 +1000
X-Gm-Features: ATxdqUE-XkPYYvmPDC9K5gmdD4QxNGDNDEIeMqq3wTVXbK9hqMOAxkGEOLg_JiA
Message-ID: <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
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

On Thu, 8 May 2025 at 03:52, Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> Hello Dave,
>
> On Fri, May 02, 2025 at 01:35:59PM +1000, Dave Airlie wrote:
> > Hey all,
> >
> > This is my second attempt at adding the initial simple memcg/ttm
> > integration.
> >
> > This varies from the first attempt in two major ways:
> >
> > 1. Instead of using __GFP_ACCOUNT and direct calling kmem charges
> > for pool memory, and directly hitting the GPU statistic, Waiman
> > suggested I just do what the network socket stuff did, which looks
> > simpler. So this adds two new memcg apis that wrap accounting.
> > The pages no longer get assigned the memcg, it's owned by the
> > larger BO object which makes more sense.
>
> Unfortunately, this was bad advice :(
>
> Naked-charging like this is quite awkward from the memcg side. It
> requires consumer-specific charge paths in the memcg code, adds stat
> counters that are memcg-only with no system-wide equivalent, and it's
> difficult for the memcg maintainers to keep track of the link between
> what's in the counter and the actual physical memory that is supposed
> to be tracked.
>
> The network and a few others like it are rather begrudging exceptions
> because they do not have a suitable page context or otherwise didn't
> fit the charging scheme. They're not good examples to follow if it can
> at all be avoided.

I unfortunately feel GPU might fit in this category as well, we aren't
allocating pages in the traditional manner, so we have a number of
problems with doing it at the page level.

I think the biggest barrier to doing page level tracking is with the
page pools we have to keep. When we need CPU uncached pages, we
allocate a bunch of pages and do the work to fix their cpu mappings to
be uncached, this work is costly, so when we no longer need the
uncached pages in an object, we return them to a pool rather than to
the central allocator. We then use a shrinker to empty the pool and
undo the cpu mapping change. We also do equivalent pools for dma able
and 32-bit dma able pages if they are used.

This means that if userspace allocates a large uncached object, and we
account it to the current memcg with __GFP_ACCOUNT, then when it gets
handed back to the pool we have to remove it from the memcg
accounting. This was where I used the memcg kmem charge/uncharges,
uncharge on adding to pool and charge on reuse. However kmem seems
like the wrong place to charge, but it's where the initial
__GFP_ACCOUNT will put those pages. This is why the suggestions to use
the network solution worked better for me, I can do all the work
outside the pool code at a slightly higher level (the same level where
we charge/uncharge dmem), and I don't have to worry about handling the
different pool types etc. We also don't need page->memcg to be set for
these pages I don't think as all pages are part of a large object and
the object is what gets swapped or freed, not parts of it.

>
> __GFP_ACCOUNT and an enum node_stat_item is the much preferred way. I
> have no objections to exports if you need to charge and account memory
> from a module.

Now maybe it makes sense to add a node_stat_item for this as well as
the GPU memcg accounting so we can have it accounted in both places,
right now mm has no insight statistics wise into this memory at all,
other than it being pages allocated.

Dave.

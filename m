Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EFABA4A6
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 22:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD0310EB86;
	Fri, 16 May 2025 20:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XSNiOtnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C99A10EB86
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 20:25:15 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ad2216ef31cso436430266b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747427114; x=1748031914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJtI08ZdLCcw6bkpJ+rEQSFFcud7levmwZFe8IxZZO0=;
 b=XSNiOtnSfcMrXRcknbre0mro10JH4rMsVWGCuRCkYam960Zpq/7H7BtLDXtBbBp24F
 Pd8la6aECfH9ElfRMh0zHlQcvrxCOo2jAwRGmB0si1WAxPIbwnNV5oVF4nm/nOwjs+l2
 NNGqhH+tIKk8R/bxZp8xUdyKCY/+W1bMzSPvQiNbQRB9dCXa2ahihD86qzbwQCNn5oVk
 dBB+edBsXiubkvbR0QWV/QPvSFjdzmpCR5Biu1I+gsrbBwP/YCjz6KiMf0LusyGQ2iER
 qpL9ogchtdGdzQEuD0xwN7ukjuNlIna1p7IAPWsTy222rdaeYKw1aNBycWt56epVS5ty
 sXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747427114; x=1748031914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJtI08ZdLCcw6bkpJ+rEQSFFcud7levmwZFe8IxZZO0=;
 b=t1vBOpN4gYpAU3Vb+S1JmrBnHBS9SgjEqr4VEiSMGYiYy+9IRpHFv9xRsqbAzn1Ur4
 nWqhphfeUZjRYIbtEvU9ZEihiNw19ZFZMSIK3198fja1wK1bBpJ8D5zRsdf1FdgybGVU
 l4ZpKrJIUhqGFI86WxHy3iQBZRAtFKK0qZB7r+z2AcPwxqAI0hxwEo4KvxP1Gg9ddojK
 OZ0/p+PlNO17Wvkzy0ZDAgwUkbIjkLMKYW8CGReUBHfaWXWkLcx+ghDAj6CC4uqryVn7
 O2W94yHQ4VfTECwkxGHNkEtEzRGo3FGpf/X6cp7a37MS0olNPQtUfHZNjHlpf8SH/IiB
 bpqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW46HgV2kJfP+MLKS+iLrcVvYwLt4GP7RVGL4MeXEPueE35xeHsEXWtxi83PslDuspaThKgPrOJjJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxMKclRneS9MwABqdrC+0FVs5/Lw3jZB+hLsYF3PC/m0h+kiDx
 yW6TM+gzHqHXqMCjo5lm363uxdCQUsraf7+LeM9gDewbHO19q6jFYHatwI4RwqYg+yA5RIqbCip
 4B22JT2Zuh8QGp079LHQG7Bja3+qiHrU=
X-Gm-Gg: ASbGncsPLF/pgWS7519LM42v694kN/mOR2dMNSPttltKkDWlNZbLJxqUdBUe5onZxW+
 vkZMS3VreO2+7klvtRzZcKEDwg0moq8OCtzR/0GlPYLPhNVzDqfC5xjHt2y6o588WcCgfPRlZkE
 +h/dJb52qGfRYvmk2Y4l1hmZGlmh80q2I=
X-Google-Smtp-Source: AGHT+IF6IesSsloSzfaxg/M64Zjm1vE5MlDFW1s1cX1z2megWPE7Es4e+n2QFcDLhy0sKjm5auuB7s7yMTSxPsfEPL8=
X-Received: by 2002:a17:907:7d89:b0:ad2:5408:bf1a with SMTP id
 a640c23a62f3a-ad52d64216fmr467700466b.61.1747427113583; Fri, 16 May 2025
 13:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
In-Reply-To: <20250516200423.GE720744@cmpxchg.org>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 17 May 2025 06:25:02 +1000
X-Gm-Features: AX0GCFtasG3sWnbvC4qlI42fwzXP33Z7Y2iUUh9fyHDZOgHKzoSPu0dwVStFEkg
Message-ID: <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, tj@kernel.org, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
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

On Sat, 17 May 2025 at 06:04, Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Fri, May 16, 2025 at 07:42:08PM +0200, Christian K=C3=B6nig wrote:
> > On 5/16/25 18:41, Johannes Weiner wrote:
> > >>> Listen, none of this is even remotely new. This isn't the first cac=
he
> > >>> we're tracking, and it's not the first consumer that can outlive th=
e
> > >>> controlling cgroup.
> > >>
> > >> Yes, I knew about all of that and I find that extremely questionable
> > >> on existing handling as well.
> > >
> > > This code handles billions of containers every day, but we'll be sure
> > > to consult you on the next redesign.
> >
> > Well yes, please do so. I'm working on Linux for around 30 years now an=
d halve of that on device memory management.
> >
> > And the subsystems I maintain is used by literally billion Android devi=
ces and HPC datacenters
> >
> > One of the reasons we don't have a good integration between device memo=
ry and cgroups is because specific requirements have been ignored while des=
igning cgroups.
> >
> > That cgroups works for a lot of use cases doesn't mean that it does for=
 all of them.
> >
> > >> Memory pools which are only used to improve allocation performance
> > >> are something the kernel handles transparently and are completely
> > >> outside of any cgroup tracking whatsoever.
> > >
> > > You're describing a cache. It doesn't matter whether it's caching CPU
> > > work, IO work or network packets.
> >
> > A cache description doesn't really fit this pool here.
> >
> > The memory properties are similar to what GFP_DMA or GFP_DMA32
> > provide.
> >
> > The reasons we haven't moved this into the core memory management is
> > because it is completely x86 specific and only used by a rather
> > specific group of devices.
>
> I fully understand that. It's about memory properties.
>
> What I think you're also saying is that the best solution would be
> that you could ask the core MM for pages with a specific property, and
> it would hand you pages that were previously freed with those same
> properties. Or, if none such pages are on the freelists, it would grab
> free pages with different properties and convert them on the fly.
>
> For all intents and purposes, this free memory would then be trivially
> fungible between drm use, non-drm use, and different cgroups - except
> for a few CPU cycles when converting but that's *probably* negligible?
> And now you could get rid of the "hack" in drm and didn't have to hang
> on to special-property pages and implement a shrinker at all.
>
> So far so good.
>
> But that just isn't the implementation of today. And the devil is very
> much in the details with this:
>
> Your memory attribute conversions are currently tied to a *shrinker*.
>
> This means the conversion doesn't trivially happen in the allocator,
> it happens from *reclaim context*.
>
> Now *your* shrinker is fairly cheap to run, so I do understand when
> you're saying in exasperation: We give this memory back if somebody
> needs it for other purposes. What *is* the big deal?
>
> The *reclaim context* is the big deal. The problem is *all the other
> shrinkers that run at this time as well*. Because you held onto those
> pages long enough that they contributed to a bonafide, general memory
> shortage situation. And *that* has consequences for other cgroups.

I think this is where we have 2 options:
(a) moving this stuff into core mm and out of shrinker context
(b) fix our shrinker to be cgroup aware and solve that first.

The main question I have for Christian, is can you give me a list of
use cases that this will seriously negatively effect if we proceed
with (b).

From my naive desktop use case and HPC use case scenarios, I'm not
seeing a massive hit, now maybe I see more consistency from an
application overheads inside a cgroup.

Desktop use-case:
The user session and everything inside the user-session, compositor,
apps are all in a single cgroup, any pools memory usage will be
reusable between all the users active session, if there are multiple
users, they won't have the benefit of pages from others but their own
pool will be available.

HPC use-case:
One cgroup per application running in some sort of batch system. There
will be a downside at app launch if there has already been a bunch of
other applications launched on the machine the have filled the pool,
but by default in the cold start case the app won't get any worse
behaviour than it's current worst case, it will get consistent
behaviour of initial allocations being worst case in a new cgroup vs
now where they might benefit from previously running cgroups having
allocated pooled memory, but I'm not sure the benefit outweighs the
upside here since they reallly want containers contained.

Android? I've no idea.

Like what can we live with here, vs what needs to be a Kconfig option
vs what needs to be a kernel command line option,

I'm also happy to look at (a) but I think for (a) it's not just
uncached pool that is the problem, the dma pools will be harder to
deal with.

Dave.

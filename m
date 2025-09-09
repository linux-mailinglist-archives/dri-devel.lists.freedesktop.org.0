Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE4B49F15
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 04:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6D110E0DB;
	Tue,  9 Sep 2025 02:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QpbMo+2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A8210E0DB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 02:19:11 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b0449b1b56eso740736766b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757384350; x=1757989150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UvRPKCJK+kNCgeqO86d67tqhHi9R/WWb/GxxGuL8x0w=;
 b=QpbMo+2M3qTju2s/i7KeBDWny+j0c5CCk1HGNawfG+36DmT3AT1ZVj5ngrbjojVFvP
 fYbPIO8py+dWF3wVw6HNLwR1v1WRSXSmHcMk9anMO+3Oz9TBotTXvVWErbMZf9s3eAmL
 SMWsMNDhWBOMVesQlOUofP2kb+s8X2YaSNCaA9uQCPedgmPfcyLRWi8qZSgxUq6a/o2Z
 CfQ7TEXD5OWeUhvcY/olu9sm2ZQQelY+kpJcLnW9txJ0XBBYElSG3CBbTO70wT2KIkAA
 J8WTLrd6DgHmXLm9qzY9Tdm5Gl0/R3ew6taZQEFC6FTVAKJgqjGK3InSwLj42hqsDBMC
 IZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757384350; x=1757989150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UvRPKCJK+kNCgeqO86d67tqhHi9R/WWb/GxxGuL8x0w=;
 b=PQNGIu+0zf7Ql+wV3gjyWGMgNDiDuEExrTfEWACT4xKOKGa8BpAiwwu/wL0TUIx7Vw
 UVgD5IOEh2iYZqnUyRp8ZG2sUcjJdPlYP8Gsw9rre7LkNFizZqNVInj7qU1hcmJsXGFI
 2ne7vyawz2z69DmMEyItMJItDE70LtLKKYg9Wmf9+rBVT6B3qnUSR22N3QdAw4nQacIR
 iRpbR3YWZXhfGnYZSqP5NS9VSQ4xs+Kv66xXrCSfWTvKrguFTDC6Iuuc2iLN8p4OYLfu
 vnmX9C2T/o2EkpZGaAGnjmF8TA5njQ6OAEYYDGVNSlqDTK83SRKiA8a6SPx8E2/tpd3k
 W0Cg==
X-Gm-Message-State: AOJu0YyQly0MoEBzOcioNdEeR1Z/uZk2vZGcxUD5HIGtueV8br/afyHn
 /eBc3/Xx6KTn7p3r+amEkvsEOJytpZk8tZ8O3nXOyXG0ZCAS0fVJO9jJ5cb1bmIbj5JVZ9XZSSh
 F1ZZJOnGmHbPR2xFGCORsgPN+tWssFAY=
X-Gm-Gg: ASbGncuBPirDT43v5qfpftuaLailzJls0++32wFppIMQRYDaRxqBf7RDPtVmzpbPcgE
 wVsdcLiCrMjK2tIb6xn4cAaj/LZYrP1bX+FsjxnB4EkOybvmWmgzGmQU/Yw1lwVz/q6yBk+v7dQ
 /nhdr59VhU6U8X7De6SuCo2GrP59iWW6JFEkE9bsGlSFp2M+ZPkzOeE6viRed99lmuLKBVS41KM
 caA7A==
X-Google-Smtp-Source: AGHT+IF0ojGfLsVbNe2EXxxIANSe+zd3BuP0PWTFJD+VmQrDZcvpCqFTs1wan4o9XVQtoEf8UmOwBUP1Pb9fXf0w0AU=
X-Received: by 2002:a17:906:6d4:b0:b07:6538:4dc5 with SMTP id
 a640c23a62f3a-b076538667dmr149881366b.64.1757384349488; Mon, 08 Sep 2025
 19:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-12-airlied@gmail.com>
 <4e462912-64de-461c-8c4b-204e6f58dde8@amd.com>
 <CAPM=9txiApDK8riR3TH3gM2V0pVwGBD5WobbXv2_bfoH+wsgSw@mail.gmail.com>
 <f4d04144-d8e7-4d4e-81a9-65e1fcef26fd@amd.com>
In-Reply-To: <f4d04144-d8e7-4d4e-81a9-65e1fcef26fd@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 9 Sep 2025 12:18:57 +1000
X-Gm-Features: Ac12FXxS3xUS5G2sDvkGWbEQ-36qve91eBxiVAMCJmoW1HsflS2lot9U-Pu8uuI
Message-ID: <CAPM=9txzf8OfyQ79X29iC0s_QqaNVPfPsAFbRw056Zsjvb2iTg@mail.gmail.com>
Subject: Re: [PATCH 11/15] ttm/pool: enable memcg tracking and shrinker. (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, 
 Dave Chinner <david@fromorbit.com>, Waiman Long <longman@redhat.com>,
 simona@ffwll.ch
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

On Thu, 4 Sept 2025 at 21:30, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 04.09.25 04:25, Dave Airlie wrote:
> > On Wed, 3 Sept 2025 at 00:23, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote:
> >>
> >> On 02.09.25 06:06, Dave Airlie wrote:
> >>> From: Dave Airlie <airlied@redhat.com>
> >>>
> >>> This enables all the backend code to use the list lru in memcg mode,
> >>> and set the shrinker to be memcg aware.
> >>>
> >>> It adds the loop case for when pooled pages end up being reparented
> >>> to a higher memcg group, that newer memcg can search for them there
> >>> and take them back.
> >>
> >> I can only repeat that as far as I can see that makes no sense at all.
> >>
> >> This just enables stealing pages from the page pool per cgroup and won=
't give them back if another cgroup runs into a low memery situation.
> >>
> >> Maybe Thomas and the XE guys have an use case for that, but as far as =
I can see that behavior is not something we would ever want.
> >
> > This is what I'd want for a desktop use case at least, if we have a
> > top level cgroup then logged in user cgroups, each user will own their
> > own uncached pages pool and not cause side effects to other users. If
> > they finish running their pool will get give to the parent.
> >
> > Any new pool will get pages from the parent, and manage them itself.
> >
> > This is also what cgroup developers have said makes the most sense for
> > containerisation here, one cgroup allocator should not be able to
> > cause shrink work for another cgroup unnecessarily.
>
> The key point is i915 is doing the exact same thing completely without a =
pool and with *MUCH* less overhead.
>
> Together with Thomas I've implemented that approach for TTM as WIP patch =
and on a Ryzen 7 page faulting becomes nearly ten times faster.
>
> The problem is that the PAT and other legacy handling is like two decades=
 old now and it seems like nobody can remember how it is actually supposed =
to work.
>
> See this patch here for example as well:
>
> commit 9542ada803198e6eba29d3289abb39ea82047b92
> Author: Suresh Siddha <suresh.b.siddha@intel.com>
> Date:   Wed Sep 24 08:53:33 2008 -0700
>
>     x86: track memtype for RAM in page struct
>
>     Track the memtype for RAM pages in page struct instead of using the
>     memtype list. This avoids the explosion in the number of entries in
>     memtype list (of the order of 20,000 with AGP) and makes the PAT
>     tracking simpler.
>
>     We are using PG_arch_1 bit in page->flags.
>
>     We still use the memtype list for non RAM pages.
>
>     Signed-off-by: Suresh Siddha <suresh.b.siddha@intel.com>
>     Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
>     Signed-off-by: Ingo Molnar <mingo@elte.hu>
>
> So we absolutely *do* have a page flag to indicate the cached vs uncached=
 status, it's just that we can't allocate those pages in TTM for some reaso=
n. I'm still digging up what part is missing here.
>
> What I want to avoid is that we created UAPI or at least specific behavio=
r people then start to rely upon. That would make it much more problematic =
to remove the pool in the long term.

Okay, how about we land the first set of patches to move over to
list_lru at least,

The patches up ttm/pool: track allocated_pages per numa node. If I can
get r-b on those I think we should land those.

Then we try and figure out how to do this without pools, and just land
memcg with no uncached pools support. However we still have to handle
dma pages for certain scenarios and I think they may suffer from the
same problem, but just less one we care about.

Dave.

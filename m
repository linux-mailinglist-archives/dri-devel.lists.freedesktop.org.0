Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36943A316C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3675E6EDB5;
	Thu, 10 Jun 2021 16:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01A96EDB4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:52:35 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id i6so288573ybm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yUKjA2CcdOSgHjObJE60yhiBeGUAGUGUG7OgeissM3g=;
 b=1+4DK9spJG3AXdRsC7UasHfNapz+9TmqMwND6/1zD1Kul+e/KjZECg/3vwpXZ/oKGG
 UdFkLx3zNRrKLosBRQWUwc4DLQqDap02OxVmLh8D7LsU+lA3lV6IlVJzpQz+aTHjNdp7
 cEUHDO0NS5wCUFBJ3y2fJNyHAw1nUIZ0LavTgVThFm2IamUeRsJOayLikeY0oeFFVMOH
 1aGFESA6mvq1ZMfFugwLI6OmQQB6at1uoaOa8sJb3ObJValLJa9vhj74ecMHppaxp+Vx
 3W6izj3Kqs759u+JU4CIhXlqKtk5r7+9vIQLgG5FViqqYIv5aQaM5xC/GRXQW42LDLOU
 RjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yUKjA2CcdOSgHjObJE60yhiBeGUAGUGUG7OgeissM3g=;
 b=Yxm7w8lJ+Gb0HSIzhlUnmMvg5gexgzDQz5UXmlF4lP3QUMc42QiYYzRNK4aYrRdCqY
 Zalz/mm+2Cvdrok7tqwjYpC6K6EuqOOl4nYOPrulq7EKXbte34B/mnz7EPI5RR0iOcM0
 X8zD+WWuCdpnTk9TJ2QFlGu3uAHS49mpPQ/dlcI4/VIl1nejva/tRpcX3F6/xI0dXTVb
 46CW4VZXG2f2mVunWf5ZCI/GtjjB7TASGR94zB6W8gpqcejBFx9lD/Oha/fO9S/C9JkU
 p1cU+3FTSW4CGsV6iw4fW7AbkZ/QC325RN1DNh0PoeGKehJwR5HrIkY6Es1Xis5bjyNy
 Szgw==
X-Gm-Message-State: AOAM532m8FZd4cTEL0yhgMjW07085rQtvDbyP5KbzUd7icwUuuvB2swQ
 Zjqy9c7rq1buvh6eRqkFZdPekQR6gqs6qQlNc6mCiVSmrkHaAw==
X-Google-Smtp-Source: ABdhPJxNDkpGwuUOQvptuJKD8Abz9yPahef26rtQjVruTV/KdMIH02fjSnp1rGu9EHM8LV7A/BRv8OP+rd5FfqT28AI=
X-Received: by 2002:a25:208b:: with SMTP id g133mr8186088ybg.211.1623343954985; 
 Thu, 10 Jun 2021 09:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-6-jason@jlekstrand.net>
 <ea36431d-521a-c1c0-59e5-a196f55c28dd@amd.com>
 <CAOFGe97+JK9-HLsVrXdvm45Qk721utwpHyy8xpqR7uRCpZm5ig@mail.gmail.com>
 <CAKMK7uGsQ3BWomCQtvrSygb-nc19LpAz2RFjsBzw-E_17tq8BA@mail.gmail.com>
 <CAOFGe947JR3tBLb-4istEX2XNU7pp4+sjgpGYGSXLWEuCcR27g@mail.gmail.com>
 <CAKMK7uFQNbOA_ijVRFrudCxNN9iqqkohq=USEG3ipcOGJHNg1g@mail.gmail.com>
In-Reply-To: <CAKMK7uFQNbOA_ijVRFrudCxNN9iqqkohq=USEG3ipcOGJHNg1g@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 11:52:23 -0500
Message-ID: <CAOFGe94_fPAQP3g5Bfyd6SMfAcWA2Hdjn=WqA_nibT6aWOEYWg@mail.gmail.com>
Subject: Re: [PATCH 5/5] DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:38 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> On Thu, Jun 10, 2021 at 6:24 PM Jason Ekstrand <jason@jlekstrand.net> wro=
te:
> >
> > On Thu, Jun 10, 2021 at 10:13 AM Daniel Vetter <daniel.vetter@ffwll.ch>=
 wrote:
> > >
> > > On Thu, Jun 10, 2021 at 3:59 PM Jason Ekstrand <jason@jlekstrand.net>=
 wrote:
> > > >
> > > > On Thu, Jun 10, 2021 at 1:51 AM Christian K=C3=B6nig
> > > > <christian.koenig@amd.com> wrote:
> > > > >
> > > > > Am 09.06.21 um 23:29 schrieb Jason Ekstrand:
> > > > > > This helper existed to handle the weird corner-cases caused by =
using
> > > > > > SLAB_TYPESAFE_BY_RCU for backing dma_fence.  Now that no one is=
 using
> > > > > > that anymore (i915 was the only real user), dma_fence_get_rcu i=
s
> > > > > > sufficient.  The one slightly annoying thing we have to deal wi=
th here
> > > > > > is that dma_fence_get_rcu_safe did an rcu_dereference as well a=
s a
> > > > > > SLAB_TYPESAFE_BY_RCU-safe dma_fence_get_rcu.  This means each c=
all site
> > > > > > ends up being 3 lines instead of 1.
> > > > >
> > > > > That's an outright NAK.
> > > > >
> > > > > The loop in dma_fence_get_rcu_safe is necessary because the under=
lying
> > > > > fence object can be replaced while taking the reference.
> > > >
> > > > Right.  I had missed a bit of that when I first read through it.  I
> > > > see the need for the loop now.  But there are some other tricky bit=
s
> > > > in there besides just the loop.
> > >
> > > I thought that's what the kref_get_unless_zero was for in
> > > dma_fence_get_rcu? Otherwise I guess I'm not seeing why still have
> > > dma_fence_get_rcu around, since that should either be a kref_get or
> > > it's just unsafe to call it ...
> >
> > AFAICT, dma_fence_get_rcu is unsafe unless you somehow know that it's
> > your fence and it's never recycled.
> >
> > Where the loop comes in is if you have someone come along, under the
> > RCU write lock or not, and swap out the pointer and unref it while
> > you're trying to fetch it.  In this case, if you just write the three
> > lines I duplicated throughout this patch, you'll end up with NULL if
> > you (partially) lose the race.  The loop exists to ensure that you get
> > either the old pointer or the new pointer and you only ever get NULL
> > if somewhere during the mess, the pointer actually gets set to NULL.
>
> It's not that easy. At least not for dma_resv.
>
> The thing is, you can't just go in and replace the write fence with
> something else. There's supposed to be some ordering here (how much we
> actually still follow that or not is a bit another question, that I'm
> trying to answer with an audit of lots of drivers), which means if you
> replace e.g. the exclusive fence, the previous fence will _not_ just
> get freed. Because the next exclusive fence needs to wait for that to
> finish first.
>
> Conceptually the refcount will _only_ go to 0 once all later
> dependencies have seen it get signalled, and once the fence itself has
> been signalled. A signalled fence might as well not exist, so if
> that's what  happened in that tiny window, then yes a legal scenario
> is the following:
>
> thread A:
> - rcu_dereference(resv->exclusive_fence);
>
> thread B:
> - dma_fence signals, retires, drops refcount to 0
> - sets the exclusive fence to NULL
> - creates a new dma_fence
> - sets the exclusive fence to that new fence
>
> thread A:
> - kref_get_unless_zero fails, we report that the exclusive fence slot is =
NULL
>
> Ofc normally we're fully pipeline, and we lazily clear slots, so no
> one ever writes the fence ptr to NULL. But conceptually it's totally
> fine, and an indistinguishable sequence of events from the point of
> view of thread A.

How is reporting that the exclusive fence is NULL ok in that scenario?
 If someone comes along and calls dma_resv_get_excl_fence(), we want
them to get either the old fence or the new fence but never NULL.
NULL would imply that the object is idle which it probably isn't in
any sort of pipelined world.

> Ergo dma_fence_get_rcu is enough. If it's not, we've screwed up really
> big time. The only reason you need _unsafe is if you have
> typesafe_by_rcu, or maybe if you yolo your fence ordering a bit much
> and break the DAG property in a few cases.
>
> > I agree with Christian that that part of dma_fence_get_rcu_safe needs
> > to stay.  I was missing that until I did my giant "let's walk through
> > the code" e-mail.
>
> Well if I'm wrong there's a _ton_ of broken code in upstream right
> now, even in dma-buf/dma-resv.c. We're using dma_fence_get_rcu a lot.

Yup.  19 times.  What I'm trying to understand is how much of that
code depends on properly catching a pointer-switch race and how much
is ok with a NULL failure mode.  This trybot seems to imply that most
things are ok with the NULL failure mode:

https://patchwork.freedesktop.org/series/91267/

Of course, as we discussed on IRC, I'm not sure how much I trust
proof-by-trybot here. :-)

> Also the timing is all backwards: get_rcu_safe was added as a fix for
> when i915 made its dma_fence typesafe_by_rcu. We didn't have any need
> for this beforehand. So I'm really not quite buying this story here
> yet you're all trying to sell me on.

Yeah, that's really concerning.  It's possible that many of the uses
of get_rcu_safe were added because someone had recycle bugs and others
were added because of pointer chase bugs and people weren't entirely
clear on which.

--Jason

> -Daniel
>
> >
> > --Jason
> >
> > > > > This is completely unrelated to SLAB_TYPESAFE_BY_RCU. See the
> > > > > dma_fence_chain usage for reference.
> > > > >
> > > > > What you can remove is the sequence number handling in dma-buf. T=
hat
> > > > > should make adding fences quite a bit quicker.
> > > >
> > > > I'll look at that and try to understand what's going on there.
> > >
> > > Hm I thought the seqlock was to make sure we have a consistent set of
> > > fences across exclusive and all shared slot. Not to protect against
> > > the fence disappearing due to typesafe_by_rcu.
> > > -Daniel
> > >
> > > > --Jason
> > > >
> > > > > Regards,
> > > > > Christian.
> > > > >
> > > > > >
> > > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > ---
> > > > > >   drivers/dma-buf/dma-fence-chain.c         |  8 ++--
> > > > > >   drivers/dma-buf/dma-resv.c                |  4 +-
> > > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  4 +-
> > > > > >   drivers/gpu/drm/i915/i915_active.h        |  4 +-
> > > > > >   drivers/gpu/drm/i915/i915_vma.c           |  4 +-
> > > > > >   include/drm/drm_syncobj.h                 |  4 +-
> > > > > >   include/linux/dma-fence.h                 | 50 --------------=
---------
> > > > > >   include/linux/dma-resv.h                  |  4 +-
> > > > > >   8 files changed, 23 insertions(+), 59 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-bu=
f/dma-fence-chain.c
> > > > > > index 7d129e68ac701..46dfc7d94d8ed 100644
> > > > > > --- a/drivers/dma-buf/dma-fence-chain.c
> > > > > > +++ b/drivers/dma-buf/dma-fence-chain.c
> > > > > > @@ -15,15 +15,17 @@ static bool dma_fence_chain_enable_signalin=
g(struct dma_fence *fence);
> > > > > >    * dma_fence_chain_get_prev - use RCU to get a reference to t=
he previous fence
> > > > > >    * @chain: chain node to get the previous node from
> > > > > >    *
> > > > > > - * Use dma_fence_get_rcu_safe to get a reference to the previo=
us fence of the
> > > > > > - * chain node.
> > > > > > + * Use rcu_dereference and dma_fence_get_rcu to get a referenc=
e to the
> > > > > > + * previous fence of the chain node.
> > > > > >    */
> > > > > >   static struct dma_fence *dma_fence_chain_get_prev(struct dma_=
fence_chain *chain)
> > > > > >   {
> > > > > >       struct dma_fence *prev;
> > > > > >
> > > > > >       rcu_read_lock();
> > > > > > -     prev =3D dma_fence_get_rcu_safe(&chain->prev);
> > > > > > +     prev =3D rcu_dereference(chain->prev);
> > > > > > +     if (prev)
> > > > > > +             prev =3D dma_fence_get_rcu(prev);
> > > > > >       rcu_read_unlock();
> > > > > >       return prev;
> > > > > >   }
> > > > > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-r=
esv.c
> > > > > > index f26c71747d43a..cfe0db3cca292 100644
> > > > > > --- a/drivers/dma-buf/dma-resv.c
> > > > > > +++ b/drivers/dma-buf/dma-resv.c
> > > > > > @@ -376,7 +376,9 @@ int dma_resv_copy_fences(struct dma_resv *d=
st, struct dma_resv *src)
> > > > > >               dst_list =3D NULL;
> > > > > >       }
> > > > > >
> > > > > > -     new =3D dma_fence_get_rcu_safe(&src->fence_excl);
> > > > > > +     new =3D rcu_dereference(src->fence_excl);
> > > > > > +     if (new)
> > > > > > +             new =3D dma_fence_get_rcu(new);
> > > > > >       rcu_read_unlock();
> > > > > >
> > > > > >       src_list =3D dma_resv_shared_list(dst);
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/driver=
s/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > > > > index 72d9b92b17547..0aeb6117f3893 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > > > > @@ -161,7 +161,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *r=
ing, struct dma_fence **f,
> > > > > >               struct dma_fence *old;
> > > > > >
> > > > > >               rcu_read_lock();
> > > > > > -             old =3D dma_fence_get_rcu_safe(ptr);
> > > > > > +             old =3D rcu_dereference(*ptr);
> > > > > > +             if (old)
> > > > > > +                     old =3D dma_fence_get_rcu(old);
> > > > > >               rcu_read_unlock();
> > > > > >
> > > > > >               if (old) {
> > > > > > diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/d=
rm/i915/i915_active.h
> > > > > > index d0feda68b874f..bd89cfc806ca5 100644
> > > > > > --- a/drivers/gpu/drm/i915/i915_active.h
> > > > > > +++ b/drivers/gpu/drm/i915/i915_active.h
> > > > > > @@ -103,7 +103,9 @@ i915_active_fence_get(struct i915_active_fe=
nce *active)
> > > > > >       struct dma_fence *fence;
> > > > > >
> > > > > >       rcu_read_lock();
> > > > > > -     fence =3D dma_fence_get_rcu_safe(&active->fence);
> > > > > > +     fence =3D rcu_dereference(active->fence);
> > > > > > +     if (fence)
> > > > > > +             fence =3D dma_fence_get_rcu(fence);
> > > > > >       rcu_read_unlock();
> > > > > >
> > > > > >       return fence;
> > > > > > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/=
i915/i915_vma.c
> > > > > > index 0f227f28b2802..ed0388d99197e 100644
> > > > > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > > > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > > > > @@ -351,7 +351,9 @@ int i915_vma_wait_for_bind(struct i915_vma =
*vma)
> > > > > >               struct dma_fence *fence;
> > > > > >
> > > > > >               rcu_read_lock();
> > > > > > -             fence =3D dma_fence_get_rcu_safe(&vma->active.exc=
l.fence);
> > > > > > +             fence =3D rcu_dereference(vma->active.excl.fence)=
;
> > > > > > +             if (fence)
> > > > > > +                     fence =3D dma_fence_get_rcu(fence);
> > > > > >               rcu_read_unlock();
> > > > > >               if (fence) {
> > > > > >                       err =3D dma_fence_wait(fence, MAX_SCHEDUL=
E_TIMEOUT);
> > > > > > diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncob=
j.h
> > > > > > index 6cf7243a1dc5e..6c45d52988bcc 100644
> > > > > > --- a/include/drm/drm_syncobj.h
> > > > > > +++ b/include/drm/drm_syncobj.h
> > > > > > @@ -105,7 +105,9 @@ drm_syncobj_fence_get(struct drm_syncobj *s=
yncobj)
> > > > > >       struct dma_fence *fence;
> > > > > >
> > > > > >       rcu_read_lock();
> > > > > > -     fence =3D dma_fence_get_rcu_safe(&syncobj->fence);
> > > > > > +     fence =3D rcu_dereference(syncobj->fence);
> > > > > > +     if (fence)
> > > > > > +             fence =3D dma_fence_get_rcu(syncobj->fence);
> > > > > >       rcu_read_unlock();
> > > > > >
> > > > > >       return fence;
> > > > > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fenc=
e.h
> > > > > > index 6ffb4b2c63715..f4a2ab2b1ae46 100644
> > > > > > --- a/include/linux/dma-fence.h
> > > > > > +++ b/include/linux/dma-fence.h
> > > > > > @@ -307,56 +307,6 @@ static inline struct dma_fence *dma_fence_=
get_rcu(struct dma_fence *fence)
> > > > > >               return NULL;
> > > > > >   }
> > > > > >
> > > > > > -/**
> > > > > > - * dma_fence_get_rcu_safe  - acquire a reference to an RCU tra=
cked fence
> > > > > > - * @fencep: pointer to fence to increase refcount of
> > > > > > - *
> > > > > > - * Function returns NULL if no refcount could be obtained, or =
the fence.
> > > > > > - * This function handles acquiring a reference to a fence that=
 may be
> > > > > > - * reallocated within the RCU grace period (such as with SLAB_=
TYPESAFE_BY_RCU),
> > > > > > - * so long as the caller is using RCU on the pointer to the fe=
nce.
> > > > > > - *
> > > > > > - * An alternative mechanism is to employ a seqlock to protect =
a bunch of
> > > > > > - * fences, such as used by struct dma_resv. When using a seqlo=
ck,
> > > > > > - * the seqlock must be taken before and checked after a refere=
nce to the
> > > > > > - * fence is acquired (as shown here).
> > > > > > - *
> > > > > > - * The caller is required to hold the RCU read lock.
> > > > > > - */
> > > > > > -static inline struct dma_fence *
> > > > > > -dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
> > > > > > -{
> > > > > > -     do {
> > > > > > -             struct dma_fence *fence;
> > > > > > -
> > > > > > -             fence =3D rcu_dereference(*fencep);
> > > > > > -             if (!fence)
> > > > > > -                     return NULL;
> > > > > > -
> > > > > > -             if (!dma_fence_get_rcu(fence))
> > > > > > -                     continue;
> > > > > > -
> > > > > > -             /* The atomic_inc_not_zero() inside dma_fence_get=
_rcu()
> > > > > > -              * provides a full memory barrier upon success (s=
uch as now).
> > > > > > -              * This is paired with the write barrier from ass=
igning
> > > > > > -              * to the __rcu protected fence pointer so that i=
f that
> > > > > > -              * pointer still matches the current fence, we kn=
ow we
> > > > > > -              * have successfully acquire a reference to it. I=
f it no
> > > > > > -              * longer matches, we are holding a reference to =
some other
> > > > > > -              * reallocated pointer. This is possible if the a=
llocator
> > > > > > -              * is using a freelist like SLAB_TYPESAFE_BY_RCU =
where the
> > > > > > -              * fence remains valid for the RCU grace period, =
but it
> > > > > > -              * may be reallocated. When using such allocators=
, we are
> > > > > > -              * responsible for ensuring the reference we get =
is to
> > > > > > -              * the right fence, as below.
> > > > > > -              */
> > > > > > -             if (fence =3D=3D rcu_access_pointer(*fencep))
> > > > > > -                     return rcu_pointer_handoff(fence);
> > > > > > -
> > > > > > -             dma_fence_put(fence);
> > > > > > -     } while (1);
> > > > > > -}
> > > > > > -
> > > > > >   #ifdef CONFIG_LOCKDEP
> > > > > >   bool dma_fence_begin_signalling(void);
> > > > > >   void dma_fence_end_signalling(bool cookie);
> > > > > > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.=
h
> > > > > > index 562b885cf9c3d..a38c021f379af 100644
> > > > > > --- a/include/linux/dma-resv.h
> > > > > > +++ b/include/linux/dma-resv.h
> > > > > > @@ -248,7 +248,9 @@ dma_resv_get_excl_unlocked(struct dma_resv =
*obj)
> > > > > >               return NULL;
> > > > > >
> > > > > >       rcu_read_lock();
> > > > > > -     fence =3D dma_fence_get_rcu_safe(&obj->fence_excl);
> > > > > > +     fence =3D rcu_dereference(obj->fence_excl);
> > > > > > +     if (fence)
> > > > > > +             fence =3D dma_fence_get_rcu(fence);
> > > > > >       rcu_read_unlock();
> > > > > >
> > > > > >       return fence;
> > > > >
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

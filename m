Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE03A3088
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3726ED8D;
	Thu, 10 Jun 2021 16:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540586ED87
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:24:45 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id m9so142027ybo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/8AI0bIcBWdSxJkjkmsbdj7wID/6D3e7kEpH+IMVbtI=;
 b=io4G8QyQL/Bfbo0rnddOTNFMHf03xuyhlooSBU4tnxAwuijX37pYxoymqTm8lVtvJG
 ih3XtNNzytiO4EDR4ECD8YPtmj5Jd1/pV8/JLkpA1k1DR2u/cTcu05WhNPicm47oRCiT
 Oo4Bk/9KgcEAutWa/OKbVIOwsa2K6lGZAnBDcfkyx17G012WkJuga6XdAkP6An7+l7UA
 72gxogEizC4RnzYhEbrE2d2YLOzMW6L9BhkYaiyjNHE9orfG24RXJQLdmEpeAHA8+rPE
 kZgNC6U/LOfPZg4S8ouxHW1HczT/2OTMAUE1l1+WrbKIXl7g8TXfPmKkn8QBYYW60vkL
 3f5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/8AI0bIcBWdSxJkjkmsbdj7wID/6D3e7kEpH+IMVbtI=;
 b=MFyiD7Yic0K1igtei3dOBWTUUW+u8tHD0IJmWF49LKD6mGhbxpqaFQL2C7sFnuKNQz
 A2EoVT0Snw8Xk3famh49H3XOl/dYEp33SHUMkEfw4fMwMSKu7N937JK68fYherTcoi+8
 CfaFa86WEgJH5qpdD0XviIMjvViobkqfRWqixMzSnON5eNCqYi+Iauzd7sWNUnTLCnj2
 F07iUeSlhCvyLUnxc4KBSncnGuF4fRAk0spExIsuumutjqoRz8K4ziCP7DUsxuybNCjD
 /zKfEZCOLhjeQQKSDXy9SVZ2Ej+EVcXwfISCVPzu+2dPL7VAwgCjkyZ9H02Z6RaynDQE
 ZP6w==
X-Gm-Message-State: AOAM533H1+8//CJSHpKy4N2KEh+pQgfEmdvALgdVqcrDZA29P91jXJws
 SfX5nHIp+090vwflCERpVSYuU+18cwG9aG2gfcZKqE2mhuA=
X-Google-Smtp-Source: ABdhPJyOs1+8y19NL3RSIvgD3O+3k846OdZobCzAoyrR0/LypkIL6oA8zKhBzPeiL0ae7L2CZqX96e+q+MkFYc52cvU=
X-Received: by 2002:a5b:392:: with SMTP id k18mr8984766ybp.180.1623342284416; 
 Thu, 10 Jun 2021 09:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-6-jason@jlekstrand.net>
 <ea36431d-521a-c1c0-59e5-a196f55c28dd@amd.com>
 <CAOFGe97+JK9-HLsVrXdvm45Qk721utwpHyy8xpqR7uRCpZm5ig@mail.gmail.com>
 <CAKMK7uGsQ3BWomCQtvrSygb-nc19LpAz2RFjsBzw-E_17tq8BA@mail.gmail.com>
In-Reply-To: <CAKMK7uGsQ3BWomCQtvrSygb-nc19LpAz2RFjsBzw-E_17tq8BA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 11:24:33 -0500
Message-ID: <CAOFGe947JR3tBLb-4istEX2XNU7pp4+sjgpGYGSXLWEuCcR27g@mail.gmail.com>
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

On Thu, Jun 10, 2021 at 10:13 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> On Thu, Jun 10, 2021 at 3:59 PM Jason Ekstrand <jason@jlekstrand.net> wro=
te:
> >
> > On Thu, Jun 10, 2021 at 1:51 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> > >
> > > Am 09.06.21 um 23:29 schrieb Jason Ekstrand:
> > > > This helper existed to handle the weird corner-cases caused by usin=
g
> > > > SLAB_TYPESAFE_BY_RCU for backing dma_fence.  Now that no one is usi=
ng
> > > > that anymore (i915 was the only real user), dma_fence_get_rcu is
> > > > sufficient.  The one slightly annoying thing we have to deal with h=
ere
> > > > is that dma_fence_get_rcu_safe did an rcu_dereference as well as a
> > > > SLAB_TYPESAFE_BY_RCU-safe dma_fence_get_rcu.  This means each call =
site
> > > > ends up being 3 lines instead of 1.
> > >
> > > That's an outright NAK.
> > >
> > > The loop in dma_fence_get_rcu_safe is necessary because the underlyin=
g
> > > fence object can be replaced while taking the reference.
> >
> > Right.  I had missed a bit of that when I first read through it.  I
> > see the need for the loop now.  But there are some other tricky bits
> > in there besides just the loop.
>
> I thought that's what the kref_get_unless_zero was for in
> dma_fence_get_rcu? Otherwise I guess I'm not seeing why still have
> dma_fence_get_rcu around, since that should either be a kref_get or
> it's just unsafe to call it ...

AFAICT, dma_fence_get_rcu is unsafe unless you somehow know that it's
your fence and it's never recycled.

Where the loop comes in is if you have someone come along, under the
RCU write lock or not, and swap out the pointer and unref it while
you're trying to fetch it.  In this case, if you just write the three
lines I duplicated throughout this patch, you'll end up with NULL if
you (partially) lose the race.  The loop exists to ensure that you get
either the old pointer or the new pointer and you only ever get NULL
if somewhere during the mess, the pointer actually gets set to NULL.

I agree with Christian that that part of dma_fence_get_rcu_safe needs
to stay.  I was missing that until I did my giant "let's walk through
the code" e-mail.

--Jason

> > > This is completely unrelated to SLAB_TYPESAFE_BY_RCU. See the
> > > dma_fence_chain usage for reference.
> > >
> > > What you can remove is the sequence number handling in dma-buf. That
> > > should make adding fences quite a bit quicker.
> >
> > I'll look at that and try to understand what's going on there.
>
> Hm I thought the seqlock was to make sure we have a consistent set of
> fences across exclusive and all shared slot. Not to protect against
> the fence disappearing due to typesafe_by_rcu.
> -Daniel
>
> > --Jason
> >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > ---
> > > >   drivers/dma-buf/dma-fence-chain.c         |  8 ++--
> > > >   drivers/dma-buf/dma-resv.c                |  4 +-
> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  4 +-
> > > >   drivers/gpu/drm/i915/i915_active.h        |  4 +-
> > > >   drivers/gpu/drm/i915/i915_vma.c           |  4 +-
> > > >   include/drm/drm_syncobj.h                 |  4 +-
> > > >   include/linux/dma-fence.h                 | 50 ------------------=
-----
> > > >   include/linux/dma-resv.h                  |  4 +-
> > > >   8 files changed, 23 insertions(+), 59 deletions(-)
> > > >
> > > > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dm=
a-fence-chain.c
> > > > index 7d129e68ac701..46dfc7d94d8ed 100644
> > > > --- a/drivers/dma-buf/dma-fence-chain.c
> > > > +++ b/drivers/dma-buf/dma-fence-chain.c
> > > > @@ -15,15 +15,17 @@ static bool dma_fence_chain_enable_signaling(st=
ruct dma_fence *fence);
> > > >    * dma_fence_chain_get_prev - use RCU to get a reference to the p=
revious fence
> > > >    * @chain: chain node to get the previous node from
> > > >    *
> > > > - * Use dma_fence_get_rcu_safe to get a reference to the previous f=
ence of the
> > > > - * chain node.
> > > > + * Use rcu_dereference and dma_fence_get_rcu to get a reference to=
 the
> > > > + * previous fence of the chain node.
> > > >    */
> > > >   static struct dma_fence *dma_fence_chain_get_prev(struct dma_fenc=
e_chain *chain)
> > > >   {
> > > >       struct dma_fence *prev;
> > > >
> > > >       rcu_read_lock();
> > > > -     prev =3D dma_fence_get_rcu_safe(&chain->prev);
> > > > +     prev =3D rcu_dereference(chain->prev);
> > > > +     if (prev)
> > > > +             prev =3D dma_fence_get_rcu(prev);
> > > >       rcu_read_unlock();
> > > >       return prev;
> > > >   }
> > > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.=
c
> > > > index f26c71747d43a..cfe0db3cca292 100644
> > > > --- a/drivers/dma-buf/dma-resv.c
> > > > +++ b/drivers/dma-buf/dma-resv.c
> > > > @@ -376,7 +376,9 @@ int dma_resv_copy_fences(struct dma_resv *dst, =
struct dma_resv *src)
> > > >               dst_list =3D NULL;
> > > >       }
> > > >
> > > > -     new =3D dma_fence_get_rcu_safe(&src->fence_excl);
> > > > +     new =3D rcu_dereference(src->fence_excl);
> > > > +     if (new)
> > > > +             new =3D dma_fence_get_rcu(new);
> > > >       rcu_read_unlock();
> > > >
> > > >       src_list =3D dma_resv_shared_list(dst);
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_fence.c
> > > > index 72d9b92b17547..0aeb6117f3893 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > > @@ -161,7 +161,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring,=
 struct dma_fence **f,
> > > >               struct dma_fence *old;
> > > >
> > > >               rcu_read_lock();
> > > > -             old =3D dma_fence_get_rcu_safe(ptr);
> > > > +             old =3D rcu_dereference(*ptr);
> > > > +             if (old)
> > > > +                     old =3D dma_fence_get_rcu(old);
> > > >               rcu_read_unlock();
> > > >
> > > >               if (old) {
> > > > diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i=
915/i915_active.h
> > > > index d0feda68b874f..bd89cfc806ca5 100644
> > > > --- a/drivers/gpu/drm/i915/i915_active.h
> > > > +++ b/drivers/gpu/drm/i915/i915_active.h
> > > > @@ -103,7 +103,9 @@ i915_active_fence_get(struct i915_active_fence =
*active)
> > > >       struct dma_fence *fence;
> > > >
> > > >       rcu_read_lock();
> > > > -     fence =3D dma_fence_get_rcu_safe(&active->fence);
> > > > +     fence =3D rcu_dereference(active->fence);
> > > > +     if (fence)
> > > > +             fence =3D dma_fence_get_rcu(fence);
> > > >       rcu_read_unlock();
> > > >
> > > >       return fence;
> > > > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915=
/i915_vma.c
> > > > index 0f227f28b2802..ed0388d99197e 100644
> > > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > > @@ -351,7 +351,9 @@ int i915_vma_wait_for_bind(struct i915_vma *vma=
)
> > > >               struct dma_fence *fence;
> > > >
> > > >               rcu_read_lock();
> > > > -             fence =3D dma_fence_get_rcu_safe(&vma->active.excl.fe=
nce);
> > > > +             fence =3D rcu_dereference(vma->active.excl.fence);
> > > > +             if (fence)
> > > > +                     fence =3D dma_fence_get_rcu(fence);
> > > >               rcu_read_unlock();
> > > >               if (fence) {
> > > >                       err =3D dma_fence_wait(fence, MAX_SCHEDULE_TI=
MEOUT);
> > > > diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
> > > > index 6cf7243a1dc5e..6c45d52988bcc 100644
> > > > --- a/include/drm/drm_syncobj.h
> > > > +++ b/include/drm/drm_syncobj.h
> > > > @@ -105,7 +105,9 @@ drm_syncobj_fence_get(struct drm_syncobj *synco=
bj)
> > > >       struct dma_fence *fence;
> > > >
> > > >       rcu_read_lock();
> > > > -     fence =3D dma_fence_get_rcu_safe(&syncobj->fence);
> > > > +     fence =3D rcu_dereference(syncobj->fence);
> > > > +     if (fence)
> > > > +             fence =3D dma_fence_get_rcu(syncobj->fence);
> > > >       rcu_read_unlock();
> > > >
> > > >       return fence;
> > > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > > index 6ffb4b2c63715..f4a2ab2b1ae46 100644
> > > > --- a/include/linux/dma-fence.h
> > > > +++ b/include/linux/dma-fence.h
> > > > @@ -307,56 +307,6 @@ static inline struct dma_fence *dma_fence_get_=
rcu(struct dma_fence *fence)
> > > >               return NULL;
> > > >   }
> > > >
> > > > -/**
> > > > - * dma_fence_get_rcu_safe  - acquire a reference to an RCU tracked=
 fence
> > > > - * @fencep: pointer to fence to increase refcount of
> > > > - *
> > > > - * Function returns NULL if no refcount could be obtained, or the =
fence.
> > > > - * This function handles acquiring a reference to a fence that may=
 be
> > > > - * reallocated within the RCU grace period (such as with SLAB_TYPE=
SAFE_BY_RCU),
> > > > - * so long as the caller is using RCU on the pointer to the fence.
> > > > - *
> > > > - * An alternative mechanism is to employ a seqlock to protect a bu=
nch of
> > > > - * fences, such as used by struct dma_resv. When using a seqlock,
> > > > - * the seqlock must be taken before and checked after a reference =
to the
> > > > - * fence is acquired (as shown here).
> > > > - *
> > > > - * The caller is required to hold the RCU read lock.
> > > > - */
> > > > -static inline struct dma_fence *
> > > > -dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
> > > > -{
> > > > -     do {
> > > > -             struct dma_fence *fence;
> > > > -
> > > > -             fence =3D rcu_dereference(*fencep);
> > > > -             if (!fence)
> > > > -                     return NULL;
> > > > -
> > > > -             if (!dma_fence_get_rcu(fence))
> > > > -                     continue;
> > > > -
> > > > -             /* The atomic_inc_not_zero() inside dma_fence_get_rcu=
()
> > > > -              * provides a full memory barrier upon success (such =
as now).
> > > > -              * This is paired with the write barrier from assigni=
ng
> > > > -              * to the __rcu protected fence pointer so that if th=
at
> > > > -              * pointer still matches the current fence, we know w=
e
> > > > -              * have successfully acquire a reference to it. If it=
 no
> > > > -              * longer matches, we are holding a reference to some=
 other
> > > > -              * reallocated pointer. This is possible if the alloc=
ator
> > > > -              * is using a freelist like SLAB_TYPESAFE_BY_RCU wher=
e the
> > > > -              * fence remains valid for the RCU grace period, but =
it
> > > > -              * may be reallocated. When using such allocators, we=
 are
> > > > -              * responsible for ensuring the reference we get is t=
o
> > > > -              * the right fence, as below.
> > > > -              */
> > > > -             if (fence =3D=3D rcu_access_pointer(*fencep))
> > > > -                     return rcu_pointer_handoff(fence);
> > > > -
> > > > -             dma_fence_put(fence);
> > > > -     } while (1);
> > > > -}
> > > > -
> > > >   #ifdef CONFIG_LOCKDEP
> > > >   bool dma_fence_begin_signalling(void);
> > > >   void dma_fence_end_signalling(bool cookie);
> > > > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > > > index 562b885cf9c3d..a38c021f379af 100644
> > > > --- a/include/linux/dma-resv.h
> > > > +++ b/include/linux/dma-resv.h
> > > > @@ -248,7 +248,9 @@ dma_resv_get_excl_unlocked(struct dma_resv *obj=
)
> > > >               return NULL;
> > > >
> > > >       rcu_read_lock();
> > > > -     fence =3D dma_fence_get_rcu_safe(&obj->fence_excl);
> > > > +     fence =3D rcu_dereference(obj->fence_excl);
> > > > +     if (fence)
> > > > +             fence =3D dma_fence_get_rcu(fence);
> > > >       rcu_read_unlock();
> > > >
> > > >       return fence;
> > >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

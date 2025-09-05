Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D64EB46212
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B730010E18A;
	Fri,  5 Sep 2025 18:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OZ8jEzSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9F510E18A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 18:18:15 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3e3aafe06a7so752652f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 11:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757096294; x=1757701094;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKjPZ6JkdfP71MZhHGFNz5JoCmbYAum19kr8H2dtmZc=;
 b=OZ8jEzSEI4zCC7dwaUWpnbArfAZY8Ff5XNITa0zy78Dwgx56agokxV9dxEms79HSsy
 eNsmcHTpoOS/QTE+L86FlUlQgtP9yBNnBHTziSruDEEJKOzGiMwTP1QSodlP0t+AR69L
 VpxnKymrpdBP3KUsg9X6XgZCd0OxFCtWfex0Ecvh+4DanVbuk2es4I6MPwMcUTVV5Rb4
 SGTItXEL67We8t3Y1RGEjDeHOpElmWJrD7VgYZR9wKx3NvAdU5Th9k9cJQ1yhni/2uFT
 8S6i3LHu4SXzBuKOFX6myNJiOlaJsure6rm2EarvKAjC0BVHrz66p+eFUjBTFB1KdMf6
 XXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757096294; x=1757701094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKjPZ6JkdfP71MZhHGFNz5JoCmbYAum19kr8H2dtmZc=;
 b=lKi3n4qOHIW0inC3nHERsWw5IphYa6vPT87tABoVYaEAJKwt5WGB20vAEyA6+csOSs
 /IPBKpR6RQLoxyumOWt5wu36vCEbOk+jq8PDKPkigaepyIKo1LEPxaNJ9sy2noBnzbSH
 IvAqGtvVDF5sK1CaQvyV/bYo07thC2FmqYW/0QSNWYjrSmuyKkwyqjAzwwyMkuXxe1Rb
 UuuvFvAsDAH+eXHTNORqpSSirmkEJ8pedFqdYqgalRn4z8g7CzMbTqTsip+szxL+AVRT
 +nTcX/mcI9pDaIeSHAlmxlgTH3nzVsk49umgXGlt35EugKcBadZCzbNHWXwvPaVaYXKN
 zhDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX41lQ1mhcJxvbx1grEgiX4b/bQjBkLH6TE8o97P3F0R8kym7LFgw5pvaVz1kIwHtO4tAAiZ5ZFkVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3EUuk5OqB2Spi7y6IicdWzOrHvde34IM6Mbjo9yqX1nyhS+ja
 aBF4TkpyX1JiwiO9j9qQyoA1THK+FywdgyZDSrJnfkKZYCxOGdkB4MuH+KISntSwRZG49GNLWw4
 mvrV8moPW5ePEvPL2wveiGg/E06JuuVI34TjxDTq7
X-Gm-Gg: ASbGncvh86r3+clAEC0juUTsgvDYhwZFkMTyRdgXPhSrASm13mBqjyn6JfsYgbHBuqg
 Pn6BT1XYNSRzk20C6VOJNhK8rOewf7B8h/uwzbQsPxiJmpW4T34vap57XEziKWweyhGbTh8ROSY
 uLkwD5Si8Vswj0MiMCXZsIablETLtsUCxPxZ1IaJNpgZNL+Fg0Qmo65lhdxB+D0N79bTABVnnjI
 4rtl+MpOQL1UTJDCN7i9uH/+ysNBhoqjypr80ACim5woPU=
X-Google-Smtp-Source: AGHT+IGlP6GVE/F3IvfvuFg3uqTuhZ7o1EtABAfnyD/mfTCM2CfW3Q+roVGtifPt0cXvnI1cRztA8nHmMv3mEeiacoo=
X-Received: by 2002:a5d:64e3:0:b0:3e0:c28a:abbb with SMTP id
 ffacd0b85a97d-3e0c28aaf62mr6872387f8f.13.1757096293550; Fri, 05 Sep 2025
 11:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
In-Reply-To: <20250905152505.005a610d@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Sep 2025 20:18:01 +0200
X-Gm-Features: Ac12FXzdSoY4H14Jq3bYOy1msq82Tum3a_ciUTVq2KqVGeVzVChh5DdTZhsb_aI
Message-ID: <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri, 05 Sep 2025 12:11:28 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > When using GPUVM in immediate mode, it is necessary to call
> > drm_gpuvm_unlink() from the fence signalling critical path. However,
> > unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> >
> > 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
> >    can't do from the fence signalling critical path.
> > 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
> >    to be unsafe to call from the fence signalling critical path.
> >
> > To solve these issues, add a deferred version of drm_gpuvm_unlink() tha=
t
> > adds the vm_bo to a deferred cleanup list, and then clean it up later.
> >
> > The new methods take the GEMs GPUVA lock internally rather than letting
> > the caller do it because it also needs to perform an operation after
> > releasing the mutex again. This is to prevent freeing the GEM while
> > holding the mutex (more info as comments in the patch). This means that
> > the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c | 167 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  include/drm/drm_gpuvm.h     |  26 +++++++
> >  2 files changed, 193 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 78a1a4f095095e9379bdf604d583f6c8b9863ccb..849b6c08f83dcba832eda37=
2bd3ce62b540e144b 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -876,6 +876,25 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, s=
pinlock_t *lock,
> >       cond_spin_unlock(lock, !!lock);
> >  }
> >
> > +/**
> > + * drm_gpuvm_bo_is_dead() - check whether this vm_bo is scheduled for =
cleanup
> > + * @vm_bo: the &drm_gpuvm_bo
> > + *
> > + * When a vm_bo is scheduled for cleanup using the bo_defer list, it i=
s not
> > + * immediately removed from the evict and extobj lists.
>
> Maybe mention that it can't be, because those lists are protected with
> the resv lock and we can't take this lock when we're in immediate mode?

Ok.

> > Therefore, anyone
> > + * iterating these lists should skip entries that are being destroyed.
> > + *
> > + * Checking the refcount without incrementing it is okay as long as th=
e lock
> > + * protecting the evict/extobj list is held for as long as you are usi=
ng the
> > + * vm_bo, because even if the refcount hits zero while you are using i=
t, freeing
> > + * the vm_bo requires taking the list's lock.
> > + */
> > +static bool
> > +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
> > +{
> > +     return !kref_read(&vm_bo->kref);
>
> I'm not too sure I like the idea of [ab]using vm_bo::kref to defer the
> vm_bo release. I get why it's done like that, but I'm wondering why we
> don't defer the release of drm_gpuva objects instead (which is really
> what's being released in va_unlink()). I can imagine drivers wanting to
> attach resources to the gpuva that can't be released in the
> dma-signalling path in the future, and if we're doing that at the gpuva
> level, we also get rid of this kref dance, since the va will hold a
> vm_bo ref until it's destroyed.
>
> Any particular reason you went for vm_bo destruction deferral instead
> of gpuva?

All of the things that were unsafe to release in the signalling path
were tied to the vm_bo, so that is why I went for vm_bo cleanup.
Another advantage is that it lets us use the same deferred logic for
the vm_bo_put() call that drops the refcount from vm_bo_obtain().

Of course if gpuvas might have resources that need deferred cleanup,
that might change the situation somewhat.


> > +}
> > +
> >  /**
> >   * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
> >   * @__vm_bo: the &drm_gpuvm_bo
> > @@ -1081,6 +1100,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const cha=
r *name,
> >       INIT_LIST_HEAD(&gpuvm->evict.list);
> >       spin_lock_init(&gpuvm->evict.lock);
> >
> > +     INIT_LIST_HEAD(&gpuvm->bo_defer.list);
> > +     spin_lock_init(&gpuvm->bo_defer.lock);
> > +
> >       kref_init(&gpuvm->kref);
> >
> >       gpuvm->name =3D name ? name : "unknown";
> > @@ -1122,6 +1144,8 @@ drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
> >                "Extobj list should be empty.\n");
> >       drm_WARN(gpuvm->drm, !list_empty(&gpuvm->evict.list),
> >                "Evict list should be empty.\n");
> > +     drm_WARN(gpuvm->drm, !list_empty(&gpuvm->bo_defer.list),
> > +              "VM BO cleanup list should be empty.\n");
> >
> >       drm_gem_object_put(gpuvm->r_obj);
> >  }
> > @@ -1217,6 +1241,9 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm=
 *gpuvm,
> >
> >       drm_gpuvm_resv_assert_held(gpuvm);
> >       list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj=
) {
> > +             if (drm_gpuvm_bo_is_dead(vm_bo))
> > +                     continue;
> > +
> >               ret =3D exec_prepare_obj(exec, vm_bo->obj, num_fences);
> >               if (ret)
> >                       break;
> > @@ -1460,6 +1487,9 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm=
, struct drm_exec *exec)
> >
> >       list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
> >                                list.entry.evict) {
> > +             if (drm_gpuvm_bo_is_dead(vm_bo))
> > +                     continue;
> > +
> >               ret =3D ops->vm_bo_validate(vm_bo, exec);
> >               if (ret)
> >                       break;
> > @@ -1560,6 +1590,7 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
> >
> >       INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
> >       INIT_LIST_HEAD(&vm_bo->list.entry.evict);
> > +     INIT_LIST_HEAD(&vm_bo->list.entry.bo_defer);
> >
> >       return vm_bo;
> >  }
> > @@ -1621,6 +1652,106 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
> >
> > +static void
> > +drm_gpuvm_bo_defer_locked(struct kref *kref)
> > +{
> > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpuv=
m_bo,
> > +                                               kref);
> > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > +
> > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > +     }
> > +
> > +     list_del(&vm_bo->list.entry.gem);
> > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
>
> I got tricked by this implicit unlock, and the conditional unlocks it
> creates in drm_gpuva_unlink_defer(). Honestly, I'd rather see this
> unlocked moved to drm_gpuva_unlink_defer() and a conditional unlock
> added to drm_gpuvm_bo_put_deferred(), because it's easier to reason
> about when the lock/unlock calls are in the same function
> (kref_put_mutex() being the equivalent of a conditional lock).

Ok. I followed the docs of kref_put_mutex() that say to unlock it from
the function.

Alice

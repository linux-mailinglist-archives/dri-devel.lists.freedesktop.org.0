Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 946BA7DCEE4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F1C10E4F8;
	Tue, 31 Oct 2023 14:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41D510E4ED
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 14:17:53 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6c61dd1c229so861584a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google; t=1698761873; x=1699366673;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uD2GQPjQ2MYhj+ZCVzZQxA9fQ7u6gUGhgjDa92ROk2Q=;
 b=FiHE6UVY0J/Akr+29e4FezIks1Rwoa+t0ghrqAw5vbyfJPviHz298PkJ8S7MnweBcO
 3IGJQmGjeGZMhqHbIw/K0VQfGOmhZ4e+nrZo/x7dHXTw9VdQtQZ076F8SzhrTXpAen3D
 X7plv2ZbaEpIlKeYGtLRl+CMD4yg9QNyiC9e85FmcLZ16mZhvqn1ZRD0e39lvDopu58n
 YYTVmVeq6deA6cahMX1YURSErgxIQwDKEW+zhWld9iVWJxQ1XdUOg72vrbTgKso+zJtJ
 hF5ym6ZlQcU9vC9PozZ6Jiurpi6bVmx9Vi6i0xM9aQ8L5RKGQcf3H5vYEzwh6Phit60u
 Tumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698761873; x=1699366673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uD2GQPjQ2MYhj+ZCVzZQxA9fQ7u6gUGhgjDa92ROk2Q=;
 b=KVo1ktN1PAr+5irRbH9tJecvoTdbe6mkQfLZqZNrPPP9DMHziwt8+33RFAVAX8nTW1
 MceauR5o3oH5MXaYDC3KT/pL2VyuqZ/oA6tBQwTNaI12V83rKmB2Csi3O+ER9hmQukUm
 PbdcMy6xexNuwVrz9ocACOlspw4Oyp+BdBYf7Qg5dLpgziEsnaaxj98wMIcdGWkbm1Gn
 ZsL3PH0dkXE+MiQn9Ap8v323eK1Jwrx5mdm6R7P0CKhXNeyL0nZDDX+hLh7rkgLxWtDu
 FObMoL4+Dq+J3qODYJ7l4ThE42vTyfE23G4rN6cXbPEC3D/gBH0U01D6Fb/BEFY6XKX0
 o4oQ==
X-Gm-Message-State: AOJu0YwjcrGkfGG+BqlCKIZprMoF1a7T9wLhFH9+VZwObBurjQrQ+DsG
 HJfckRZpQlaXEUcSOePnuHMMnb0CWg4wqNzdwfWJetL2gh8CJpYf
X-Google-Smtp-Source: AGHT+IHi6nArRv2sGs6fdSF9e2qkzEf7pWUYgrfksmBgTdrbVaCFz6WSsL0P1LYIpekYBbYg8A6ZN0TF1TOw6Jtkc/Y=
X-Received: by 2002:a05:6808:20a0:b0:3b2:f33f:3a2e with SMTP id
 s32-20020a05680820a000b003b2f33f3a2emr13725206oiw.1.1698761872857; Tue, 31
 Oct 2023 07:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
 <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
 <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
 <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
In-Reply-To: <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Tue, 31 Oct 2023 15:17:41 +0100
Message-ID: <CAP+8YyEbi=mz5WiPjZynMT5ePAXEOydxZKfm-9KT1Y_cmVPujw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000fd7603060903d199"
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000fd7603060903d199
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 3:08=E2=80=AFPM Christian K=C3=B6nig <christian.koe=
nig@amd.com>
wrote:

> Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:
>
>
>
> On Tue, Oct 31, 2023 at 2:57=E2=80=AFPM Christian K=C3=B6nig <christian.k=
oenig@amd.com>
> wrote:
>
>> Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
>> > The current amdgpu_gem_va_update_vm only tries to perform updates for
>> the
>> > BO specified in the GEM ioctl; however, when a binding is split, the
>> > adjacent bindings also need to be updated. Such updates currently ends
>> up
>> > getting deferred until next submission which causes stalls.
>>
>> Yeah, that is a necessity. The hardware simply doesn't support what you
>> try to do here in all cases.
>>
>
> What can the hardware not do here? Is this just needing to wait for TLB
> flushes before we can free pagetables, can we just delay that?
>
>
> On some hardware generations (especially Navi1x, but also everything olde=
r
> than Polaris) you can't invalidate the TLB while it is in use.
>
> For Polaris and older it just means that you don't have a guarantee that
> the shader can't access the memory any more. So delaying the free operati=
on
> helps here.
>
> But for Navi1x it's a workaround for a hardware bug. If you try to
> invalidate the TLB while it is in use you can potentially triggering memo=
ry
> accesses to random addresses.
>
> That's why we still delay TLB invalidation's to the next CS and use a new
> VMID for each submission instead of invalidating the old one.
>
> I'm currently working on changing that for Navi2x and newer (maybe Vega a=
s
> well), but this is something you can really only do on some hw generation=
s
> after validating that it works.
>

I think as long as we make sure all significant work gets done
asynchronously, doing the TLB flushing on the next submit (/submissions,
one per queue?) is fine for our purposes.

(As an aside after thinking some more I *think* we also need some work to
make these maps/unmaps (VALID->PRT and PRT->VALID) atomic, as I think it is
valid Vulkan to make these race. As such I'm speculating we'd need a bit
more reworking there too, not just a late free of the lower level
pagetables)

- Bas

>
> Regards,
> Christian.
>
>
>
>>
>> So this approach won't work in general.
>>
>> Regards,
>> Christian.
>>
>> >
>> > Introduce a new state "dirty", shared between per-VM BOs and tradition=
al
>> > BOs, containing all BOs that have pending updates in `invalids`.
>> > amdgpu_gem_va_update_vm will now simply flush any pending updates for
>> BOs
>> > in the dirty state.
>> >
>> > Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>> > ---
>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66 ++++++++++++++++++-----=
--
>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
>> >   3 files changed, 63 insertions(+), 24 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> > index a1b15d0d6c48..01d3a97248b0 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> > @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct drm_device
>> *dev, void *data,
>> >    * vital here, so they are not reported back to userspace.
>> >    */
>> >   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
>> > -                                 struct amdgpu_vm *vm,
>> > -                                 struct amdgpu_bo_va *bo_va,
>> > -                                 uint32_t operation)
>> > +                                 struct amdgpu_vm *vm)
>> >   {
>> > +     struct amdgpu_bo_va *bo_va;
>> >       int r;
>> >
>> >       if (!amdgpu_vm_ready(vm))
>> > @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct
>> amdgpu_device *adev,
>> >       if (r)
>> >               goto error;
>> >
>> > -     if (operation =3D=3D AMDGPU_VA_OP_MAP ||
>> > -         operation =3D=3D AMDGPU_VA_OP_REPLACE) {
>> > +     spin_lock(&vm->status_lock);
>> > +     while (!list_empty(&vm->dirty)) {
>> > +             bo_va =3D list_first_entry(&vm->dirty, struct amdgpu_bo_=
va,
>> > +                                      base.vm_status);
>> > +             spin_unlock(&vm->status_lock);
>> > +
>> >               r =3D amdgpu_vm_bo_update(adev, bo_va, false);
>> >               if (r)
>> >                       goto error;
>> > +             spin_lock(&vm->status_lock);
>> >       }
>> > +     spin_unlock(&vm->status_lock);
>> >
>> >       r =3D amdgpu_vm_update_pdes(adev, vm, false);
>> >
>> > @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev,
>> void *data,
>> >               break;
>> >       }
>> >       if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) &&
>> !amdgpu_vm_debug)
>> > -             amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
>> > -                                     args->operation);
>> > +             amdgpu_gem_va_update_vm(adev, &fpriv->vm);
>> >
>> >   error:
>> >       drm_exec_fini(&exec);
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> > index dd6f72e2a1d6..01d31891cd05 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> > @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct
>> amdgpu_vm_bo_base *vm_bo, bool evict
>> >       spin_unlock(&vm_bo->vm->status_lock);
>> >   }
>> >
>> > +/**
>> > + * amdgpu_vm_bo_dirty - vm_bo is dirty
>> > + *
>> > + * @vm_bo: vm_bo which is dirty
>> > + *
>> > + * State for normal and per VM BOs that are not moved, but have new
>> entries in
>> > + * bo_va->invalids.
>> > + */
>> > +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
>> > +{
>> > +     spin_lock(&vm_bo->vm->status_lock);
>> > +     list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
>> > +     spin_unlock(&vm_bo->vm->status_lock);
>> > +}
>> > +
>> >   /**
>> >    * amdgpu_vm_bo_moved - vm_bo is moved
>> >    *
>> > @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
>> >       list_for_each_entry_safe(bo_va, tmp, &vm->evicted,
>> base.eviction_status)
>> >               amdgpu_vm_bo_get_memory(bo_va, stats);
>> >
>> > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty, base.vm_status)
>> > +             amdgpu_vm_bo_get_memory(bo_va, stats);
>> > +
>> >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
>> base.vm_status)
>> >               amdgpu_vm_bo_get_memory(bo_va, stats);
>> >
>> > @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct amdgpu_device
>> *adev,
>> >                       dma_resv_unlock(resv);
>> >               spin_lock(&vm->status_lock);
>> >       }
>> > +
>> > +     while (!list_empty(&vm->dirty)) {
>> > +             bo_va =3D list_first_entry(&vm->dirty, struct amdgpu_bo_=
va,
>> > +                                      base.vm_status);
>> > +             spin_unlock(&vm->status_lock);
>> > +
>> > +             r =3D amdgpu_vm_bo_update(adev, bo_va, false);
>> > +             if (r)
>> > +                     return r;
>> > +             spin_lock(&vm->status_lock);
>> > +     }
>> >       spin_unlock(&vm->status_lock);
>> >
>> >       return 0;
>> > @@ -1476,19 +1505,16 @@ static void amdgpu_vm_bo_insert_map(struct
>> amdgpu_device *adev,
>> >                                   struct amdgpu_bo_va_mapping *mapping=
)
>> >   {
>> >       struct amdgpu_vm *vm =3D bo_va->base.vm;
>> > -     struct amdgpu_bo *bo =3D bo_va->base.bo;
>> >
>> >       mapping->bo_va =3D bo_va;
>> >       list_add(&mapping->list, &bo_va->invalids);
>> >       amdgpu_vm_it_insert(mapping, &vm->va);
>> > +     if (!bo_va->base.moved)
>> > +             amdgpu_vm_bo_dirty(&bo_va->base);
>> >
>> >       if (mapping->flags & AMDGPU_PTE_PRT)
>> >               amdgpu_vm_prt_get(adev);
>> >
>> > -     if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base.resv &&
>> > -         !bo_va->base.moved) {
>> > -             amdgpu_vm_bo_moved(&bo_va->base);
>> > -     }
>> >       trace_amdgpu_vm_bo_map(bo_va, mapping);
>> >   }
>> >
>> > @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct
>> amdgpu_device *adev,
>> >                       before->flags =3D tmp->flags;
>> >                       before->bo_va =3D tmp->bo_va;
>> >                       list_add(&before->list, &tmp->bo_va->invalids);
>> > +                     if (!tmp->bo_va->base.moved)
>> > +                             amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>> >               }
>> >
>> >               /* Remember mapping split at the end */
>> > @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct
>> amdgpu_device *adev,
>> >                       after->flags =3D tmp->flags;
>> >                       after->bo_va =3D tmp->bo_va;
>> >                       list_add(&after->list, &tmp->bo_va->invalids);
>> > +                     if (!tmp->bo_va->base.moved)
>> > +                             amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>> >               }
>> >
>> >               list_del(&tmp->list);
>> > @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct
>> amdgpu_device *adev,
>> >
>> >       /* Insert partial mapping before the range */
>> >       if (!list_empty(&before->list)) {
>> > -             struct amdgpu_bo *bo =3D before->bo_va->base.bo;
>> > -
>> >               amdgpu_vm_it_insert(before, &vm->va);
>> >               if (before->flags & AMDGPU_PTE_PRT)
>> >                       amdgpu_vm_prt_get(adev);
>> > -
>> > -             if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base=
.resv
>> &&
>> > -                 !before->bo_va->base.moved)
>> > -                     amdgpu_vm_bo_moved(&before->bo_va->base);
>> >       } else {
>> >               kfree(before);
>> >       }
>> >
>> >       /* Insert partial mapping after the range */
>> >       if (!list_empty(&after->list)) {
>> > -             struct amdgpu_bo *bo =3D after->bo_va->base.bo;
>> > -
>> >               amdgpu_vm_it_insert(after, &vm->va);
>> >               if (after->flags & AMDGPU_PTE_PRT)
>> >                       amdgpu_vm_prt_get(adev);
>> > -
>> > -             if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base=
.resv
>> &&
>> > -                 !after->bo_va->base.moved)
>> > -                     amdgpu_vm_bo_moved(&after->bo_va->base);
>> >       } else {
>> >               kfree(after);
>> >       }
>> > @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev,
>> struct amdgpu_vm *vm, int32_t xcp
>> >       INIT_LIST_HEAD(&vm->evicted);
>> >       INIT_LIST_HEAD(&vm->relocated);
>> >       INIT_LIST_HEAD(&vm->moved);
>> > +     INIT_LIST_HEAD(&vm->dirty);
>> >       INIT_LIST_HEAD(&vm->idle);
>> >       INIT_LIST_HEAD(&vm->invalidated);
>> >       spin_lock_init(&vm->status_lock);
>> > @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_v=
m
>> *vm, struct seq_file *m)
>> >   {
>> >       struct amdgpu_bo_va *bo_va, *tmp;
>> >       u64 total_idle =3D 0;
>> > +     u64 total_dirty =3D 0;
>> >       u64 total_relocated =3D 0;
>> >       u64 total_moved =3D 0;
>> >       u64 total_invalidated =3D 0;
>> >       u64 total_done =3D 0;
>> >       unsigned int total_idle_objs =3D 0;
>> > +     unsigned int total_dirty_objs =3D 0;
>> >       unsigned int total_relocated_objs =3D 0;
>> >       unsigned int total_moved_objs =3D 0;
>> >       unsigned int total_invalidated_objs =3D 0;
>> > @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm
>> *vm, struct seq_file *m)
>> >       total_idle_objs =3D id;
>> >       id =3D 0;
>> >
>> > +     seq_puts(m, "\tDirty BOs:\n");
>> > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty, base.vm_status)=
 {
>> > +             if (!bo_va->base.bo)
>> > +                     continue;
>> > +             total_dirty +=3D amdgpu_bo_print_info(id++, bo_va->base.=
bo,
>> m);
>> > +     }
>> > +     total_dirty_objs =3D id;
>> > +     id =3D 0;
>> > +
>> >       seq_puts(m, "\tRelocated BOs:\n");
>> >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
>> base.vm_status) {
>> >               if (!bo_va->base.bo)
>> > @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm
>> *vm, struct seq_file *m)
>> >
>> >       seq_printf(m, "\tTotal idle size:        %12lld\tobjs:\t%d\n",
>> total_idle,
>> >                  total_idle_objs);
>> > +     seq_printf(m, "\tTotal dirty size:       %12lld\tobjs:\t%d\n",
>> total_dirty,
>> > +                total_dirty_objs);
>> >       seq_printf(m, "\tTotal relocated size:   %12lld\tobjs:\t%d\n",
>> total_relocated,
>> >                  total_relocated_objs);
>> >       seq_printf(m, "\tTotal moved size:       %12lld\tobjs:\t%d\n",
>> total_moved,
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> > index d9ab97eabda9..f91d4fcf80b8 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> > @@ -276,6 +276,9 @@ struct amdgpu_vm {
>> >       /* per VM BOs moved, but not yet updated in the PT */
>> >       struct list_head        moved;
>> >
>> > +     /* normal and per VM BOs that are not moved, but have new PT
>> entries */
>> > +     struct list_head        dirty;
>> > +
>> >       /* All BOs of this VM not currently in the state machine */
>> >       struct list_head        idle;
>> >
>>
>>
>

--000000000000fd7603060903d199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at 3:08=E2=80=AF=
PM Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com">chr=
istian.koenig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><u></u>

 =20
  <div>
    Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:<br>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at
            2:57=E2=80=AFPM Christian K=C3=B6nig &lt;<a href=3D"mailto:chri=
stian.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am
            31.10.23 um 14:40 schrieb Tatsuyuki Ishi:<br>
            &gt; The current amdgpu_gem_va_update_vm only tries to
            perform updates for the<br>
            &gt; BO specified in the GEM ioctl; however, when a binding
            is split, the<br>
            &gt; adjacent bindings also need to be updated. Such updates
            currently ends up<br>
            &gt; getting deferred until next submission which causes
            stalls.<br>
            <br>
            Yeah, that is a necessity. The hardware simply doesn&#39;t
            support what you <br>
            try to do here in all cases.<br>
          </blockquote>
          <div><br>
          </div>
          <div>What can the hardware not do here? Is this just needing
            to wait for TLB flushes before we can free pagetables, can
            we just delay that?</div>
        </div>
      </div>
    </blockquote>
    <br>
    On some hardware generations (especially Navi1x, but also everything
    older than Polaris) you can&#39;t invalidate the TLB while it is in use=
.<br>
    <br>
    For Polaris and older it just means that you don&#39;t have a guarantee
    that the shader can&#39;t access the memory any more. So delaying the
    free operation helps here.<br>
    <br>
    But for Navi1x it&#39;s a workaround for a hardware bug. If you try to
    invalidate the TLB while it is in use you can potentially triggering
    memory accesses to random addresses.<br>
    <br>
    That&#39;s why we still delay TLB invalidation&#39;s to the next CS and=
 use
    a new VMID for each submission instead of invalidating the old one.<br>
    <br>
    I&#39;m currently working on changing that for Navi2x and newer (maybe
    Vega as well), but this is something you can really only do on some
    hw generations after validating that it works.<br></div></blockquote><d=
iv><br></div><div>I think as long as we make sure all significant work gets=
 done asynchronously, doing the TLB flushing on the next submit (/submissio=
ns, one per queue?) is fine for our purposes.</div><div><br></div><div>(As =
an aside after thinking some more I *think* we also need some work to make =
these maps/unmaps (VALID-&gt;PRT and PRT-&gt;VALID) atomic, as I think it i=
s valid Vulkan to make these race. As such I&#39;m speculating we&#39;d nee=
d a bit more reworking there too, not just a late free of the lower level p=
agetables)</div><div><br></div><div>- Bas=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>
    <br>
    Regards,<br>
    Christian. <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            So this approach won&#39;t work in general.<br>
            <br>
            Regards,<br>
            Christian.<br>
            <br>
            &gt;<br>
            &gt; Introduce a new state &quot;dirty&quot;, shared between pe=
r-VM
            BOs and traditional<br>
            &gt; BOs, containing all BOs that have pending updates in
            `invalids`.<br>
            &gt; amdgpu_gem_va_update_vm will now simply flush any
            pending updates for BOs<br>
            &gt; in the dirty state.<br>
            &gt;<br>
            &gt; Signed-off-by: Tatsuyuki Ishi &lt;<a href=3D"mailto:ishita=
tsuyuki@gmail.com" target=3D"_blank">ishitatsuyuki@gmail.com</a>&gt;<br>
            &gt; ---<br>
            &gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 +=
+++---<br>
            &gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c=C2=A0 |=
 66
            ++++++++++++++++++-------<br>
            &gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h=C2=A0 |=
=C2=A0 3 ++<br>
            &gt;=C2=A0 =C2=A03 files changed, 63 insertions(+), 24 deletion=
s(-)<br>
            &gt;<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; index a1b15d0d6c48..01d3a97248b0 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; @@ -604,10 +604,9 @@ int
            amdgpu_gem_metadata_ioctl(struct drm_device *dev, void
            *data,<br>
            &gt;=C2=A0 =C2=A0 * vital here, so they are not reported back t=
o
            userspace.<br>
            &gt;=C2=A0 =C2=A0 */<br>
            &gt;=C2=A0 =C2=A0static void amdgpu_gem_va_update_vm(struct
            amdgpu_device *adev,<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu=
_vm *vm,<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu=
_bo_va
            *bo_va,<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t oper=
ation)<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu=
_vm *vm)<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0struct amdgpu_bo_va *bo_va;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!amdgpu_vm_ready(vm))<br>
            &gt; @@ -617,12 +616,18 @@ static void
            amdgpu_gem_va_update_vm(struct amdgpu_device *adev,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto=
 error;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0if (operation =3D=3D AMDGPU_VA_OP_MAP=
 ||<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0operation =3D=3D AMDGPU=
_VA_OP_REPLACE) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;vm-&gt;status_lock);<b=
r>
            &gt; +=C2=A0 =C2=A0 =C2=A0while (!list_empty(&amp;vm-&gt;dirty)=
) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo_va =3D
            list_first_entry(&amp;vm-&gt;dirty, struct amdgpu_bo_va,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 base.vm_status);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlo=
ck(&amp;vm-&gt;status_lock);<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =
=3D amdgpu_vm_bo_update(adev, bo_va,
            false);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
r)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock=
(&amp;vm-&gt;status_lock);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm-&gt;status_lock);=
<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_vm_update_pdes(adev=
, vm, false);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct
            drm_device *dev, void *data,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0brea=
k;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!r &amp;&amp; !(args-&gt;fla=
gs &amp;
            AMDGPU_VM_DELAY_UPDATE) &amp;&amp; !amdgpu_vm_debug)<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ge=
m_va_update_vm(adev,
            &amp;fpriv-&gt;vm, bo_va,<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0args-&gt;operation);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ge=
m_va_update_vm(adev,
            &amp;fpriv-&gt;vm);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0error:<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_exec_fini(&amp;exec);<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; index dd6f72e2a1d6..01d31891cd05 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; @@ -191,6 +191,21 @@ static void
            amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo,
            bool evict<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm_bo-&gt;vm-&g=
t;status_lock);<br>
            &gt;=C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +/**<br>
            &gt; + * amdgpu_vm_bo_dirty - vm_bo is dirty<br>
            &gt; + *<br>
            &gt; + * @vm_bo: vm_bo which is dirty<br>
            &gt; + *<br>
            &gt; + * State for normal and per VM BOs that are not moved,
            but have new entries in<br>
            &gt; + * bo_va-&gt;invalids.<br>
            &gt; + */<br>
            &gt; +static void amdgpu_vm_bo_dirty(struct
            amdgpu_vm_bo_base *vm_bo)<br>
            &gt; +{<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;vm_bo-&gt;vm-&gt;statu=
s_lock);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0list_move(&amp;vm_bo-&gt;vm_status,
            &amp;vm_bo-&gt;vm-&gt;dirty);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm_bo-&gt;vm-&gt;sta=
tus_lock);<br>
            &gt; +}<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0/**<br>
            &gt;=C2=A0 =C2=A0 * amdgpu_vm_bo_moved - vm_bo is moved<br>
            &gt;=C2=A0 =C2=A0 *<br>
            &gt; @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct
            amdgpu_vm *vm,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, =
tmp,
            &amp;vm-&gt;evicted, base.eviction_status)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdg=
pu_vm_bo_get_memory(bo_va, stats);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;dirty, base.vm_status)<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm=
_bo_get_memory(bo_va, stats);<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, =
tmp,
            &amp;vm-&gt;relocated, base.vm_status)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdg=
pu_vm_bo_get_memory(bo_va, stats);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; @@ -1411,6 +1429,17 @@ int
            amdgpu_vm_handle_moved(struct amdgpu_device *adev,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dma_resv_unlock(resv);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin=
_lock(&amp;vm-&gt;status_lock);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0while (!list_empty(&amp;vm-&gt;dirty)=
) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo_va =3D
            list_first_entry(&amp;vm-&gt;dirty, struct amdgpu_bo_va,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 base.vm_status);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlo=
ck(&amp;vm-&gt;status_lock);<br>
            &gt; +<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amd=
gpu_vm_bo_update(adev, bo_va,
            false);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br=
>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return r;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock=
(&amp;vm-&gt;status_lock);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm-&gt;status_l=
ock);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
            &gt; @@ -1476,19 +1505,16 @@ static void
            amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct
            amdgpu_bo_va_mapping *mapping)<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_vm *vm =3D bo_va-&=
gt;base.vm;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0struct amdgpu_bo *bo =3D bo_va-&gt;<a=
 href=3D"http://base.bo" rel=3D"noreferrer" target=3D"_blank">base.bo</a>;<=
br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;bo_va =3D bo_va;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add(&amp;mapping-&gt;list,
            &amp;bo_va-&gt;invalids);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_it_insert(mapping, &am=
p;vm-&gt;va);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0if (!bo_va-&gt;base.moved)<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm=
_bo_dirty(&amp;bo_va-&gt;base);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mapping-&gt;flags &amp; AMDG=
PU_PTE_PRT)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdg=
pu_vm_prt_get(adev);<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0if (bo &amp;&amp; bo-&gt;tbo.base.res=
v =3D=3D
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!bo_va-&gt;base.moved) =
{<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm=
_bo_moved(&amp;bo_va-&gt;base);<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_amdgpu_vm_bo_map(bo_va, ma=
pping);<br>
            &gt;=C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; @@ -1725,6 +1751,8 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0before-&gt;flags =3D tmp-&gt;flags;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0before-&gt;bo_va =3D tmp-&gt;bo_va;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0list_add(&amp;before-&gt;list,
            &amp;tmp-&gt;bo_va-&gt;invalids);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if
            (!tmp-&gt;bo_va-&gt;base.moved)<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&gt;base);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br=
>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* R=
emember mapping split at the end */<br>
            &gt; @@ -1736,6 +1764,8 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0after-&gt;flags =3D tmp-&gt;flags;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0after-&gt;bo_va =3D tmp-&gt;bo_va;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0list_add(&amp;after-&gt;list,
            &amp;tmp-&gt;bo_va-&gt;invalids);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if
            (!tmp-&gt;bo_va-&gt;base.moved)<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&gt;base);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br=
>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list=
_del(&amp;tmp-&gt;list);<br>
            &gt; @@ -1761,30 +1791,18 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Insert partial mapping before=
 the range */<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!list_empty(&amp;before-&gt;=
list)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct am=
dgpu_bo *bo =3D
            before-&gt;bo_va-&gt;<a href=3D"http://base.bo" rel=3D"noreferr=
er" target=3D"_blank">base.bo</a>;<br>
            &gt; -<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdg=
pu_vm_it_insert(before,
            &amp;vm-&gt;va);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
before-&gt;flags &amp;
            AMDGPU_PTE_PRT)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_prt_get(adev);<br>
            &gt; -<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo &a=
mp;&amp; bo-&gt;tbo.base.resv =3D=3D
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0!before-&gt;bo_va-&gt;base.moved)<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
            =C2=A0amdgpu_vm_bo_moved(&amp;before-&gt;bo_va-&gt;base);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfre=
e(before);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Insert partial mapping after =
the range */<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!list_empty(&amp;after-&gt;l=
ist)) {<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct am=
dgpu_bo *bo =3D
            after-&gt;bo_va-&gt;<a href=3D"http://base.bo" rel=3D"noreferre=
r" target=3D"_blank">base.bo</a>;<br>
            &gt; -<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdg=
pu_vm_it_insert(after,
            &amp;vm-&gt;va);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
after-&gt;flags &amp; AMDGPU_PTE_PRT)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_prt_get(adev);<br>
            &gt; -<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo &a=
mp;&amp; bo-&gt;tbo.base.resv =3D=3D
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0!after-&gt;bo_va-&gt;base.moved)<br>
            &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
            =C2=A0amdgpu_vm_bo_moved(&amp;after-&gt;bo_va-&gt;base);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfre=
e(after);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
            &gt; @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct
            amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;evict=
ed);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;reloc=
ated);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;moved=
);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;dirty);<br=
>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;idle)=
;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;inval=
idated);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;vm-&gt;statu=
s_lock);<br>
            &gt; @@ -2648,11 +2667,13 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;=C2=A0 =C2=A0{<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_bo_va *bo_va, *tmp=
;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_idle =3D 0;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0u64 total_dirty =3D 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_relocated =3D 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_moved =3D 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_invalidated =3D 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_done =3D 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int total_idle_objs =3D=
 0;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0unsigned int total_dirty_objs =3D 0;<=
br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int total_relocated_obj=
s =3D 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int total_moved_objs =
=3D 0;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int total_invalidated_o=
bjs =3D 0;<br>
            &gt; @@ -2669,6 +2690,15 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0total_idle_objs =3D id;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D 0;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0seq_puts(m, &quot;\tDirty BOs:\n&quot=
;);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;dirty, base.vm_status) {<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bo_v=
a-&gt;<a href=3D"http://base.bo" rel=3D"noreferrer" target=3D"_blank">base.=
bo</a>)<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0continue;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total_dir=
ty +=3D amdgpu_bo_print_info(id++,
            bo_va-&gt;<a href=3D"http://base.bo" rel=3D"noreferrer" target=
=3D"_blank">base.bo</a>, m);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0total_dirty_objs =3D id;<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0id =3D 0;<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_puts(m, &quot;\tRelocated BO=
s:\n&quot;);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, =
tmp,
            &amp;vm-&gt;relocated, base.vm_status) {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
!bo_va-&gt;<a href=3D"http://base.bo" rel=3D"noreferrer" target=3D"_blank">=
base.bo</a>)<br>
            &gt; @@ -2707,6 +2737,8 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, &quot;\tTotal idle=
 size:=C2=A0 =C2=A0 =C2=A0 =C2=A0
            %12lld\tobjs:\t%d\n&quot;, total_idle,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 total_idle_objs);<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0seq_printf(m, &quot;\tTotal dirty siz=
e:=C2=A0 =C2=A0 =C2=A0
            =C2=A0%12lld\tobjs:\t%d\n&quot;, total_dirty,<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
otal_dirty_objs);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, &quot;\tTotal relo=
cated size:=C2=A0
            =C2=A0%12lld\tobjs:\t%d\n&quot;, total_relocated,<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 total_relocated_objs);<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, &quot;\tTotal move=
d size:=C2=A0 =C2=A0 =C2=A0
            =C2=A0%12lld\tobjs:\t%d\n&quot;, total_moved,<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; index d9ab97eabda9..f91d4fcf80b8 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; @@ -276,6 +276,9 @@ struct amdgpu_vm {<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* per VM BOs moved, but not yet=
 updated in the
            PT */<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 moved;<br>
            &gt;=C2=A0 =C2=A0<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0/* normal and per VM BOs that are not=
 moved, but
            have new PT entries */<br>
            &gt; +=C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dirty;<br>
            &gt; +<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* All BOs of this VM not curren=
tly in the state
            machine */<br>
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 idle;<br>
            &gt;=C2=A0 =C2=A0<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div></div>

--000000000000fd7603060903d199--

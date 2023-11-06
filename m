Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D87E1B91
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 08:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4CC10E277;
	Mon,  6 Nov 2023 07:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D39810E282;
 Mon,  6 Nov 2023 07:57:13 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d9fdc712b8fso863198276.1; 
 Sun, 05 Nov 2023 23:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699257432; x=1699862232; darn=lists.freedesktop.org;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=A7KBI+A2N1jv19VQNdDId6WktaJuia3gLngVJR+3nUQ=;
 b=QhifzaINxyzOhDn+S3a9cYIqH4VEo1ME6xzTVFWuJKFr0wvKAIzTMkWCzkoseFEkhV
 6HiCxMbbPxsMfzmHHwxwjHXW6XjI4lvXADblEW912bdakWJ6TJVGfQGrtdYb2QPnrkDe
 ww/EN7e7V9Z7dz3JLtCURGzX490rfS1Qfxonh+mI7r09k3BoWzClIQBFg8N3eN9dTcGd
 NfYWMT/fQxAyzxXNtyXLOkhAsSEt1dAvSgE73lDBgwWSrzEEWlAdv60ZdRii+0lAZLOS
 971Fuw2GA2i7+RnC5M/TIPqIYCNdJe9oAWcYoGT+xm00MyKKLgyIU/Zm6jnTgMg6YGXY
 MIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699257432; x=1699862232;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A7KBI+A2N1jv19VQNdDId6WktaJuia3gLngVJR+3nUQ=;
 b=fnZxnbkMLgTYTZel4U9/oKdkR+NDaXItxipbT5iTqT/SPpViz6HZpBu8wmpnO3tnNF
 uiYTOH26YxlQEaL6NjThc/CKziGXMmX10rQDghdBz3LJdUuwljWYNZiGdwWSneJAFXKR
 mmgzAOR3lG0+WBF3++VDA4SqU+8YtWtghkZ5MHkZ5JRq+UD6/T07+5fDtR5g2XRGpbS7
 1nOAUWJzO8Plpx8kT8kkJW5MWb6r2FVO0Fv+tr3/xEGzJd56PZfUnHKwG3Uu+iQf3vlr
 9E/US+w2l7F/lvzFH2ibKiY8EthCnevJPBuHDDY8Z6KbnDBTe8Z8//DiLmhqNSHsD44Z
 ywxA==
X-Gm-Message-State: AOJu0YwtVxOsf0h4M5j4ZrOPc6PcWhDqagDScurdTKozCKWq1XFlOl/C
 CqMbeAml5M/8aThsZqbcf0DB5YhN56Qe4Ijz
X-Google-Smtp-Source: AGHT+IHQAbjy+71/LNZ7oTXDZgesG4L77tHpgZG2o1r2sjlmhlOy3ALVC1AMd07raHwS5CnzOYdP2g==
X-Received: by 2002:a25:1189:0:b0:da6:e755:b530 with SMTP id
 131-20020a251189000000b00da6e755b530mr4234420ybr.6.1699257432105; 
 Sun, 05 Nov 2023 23:57:12 -0800 (PST)
Received: from smtpclient.apple (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 t8-20020a056a00138800b0068be4ce33easm5242979pfg.96.2023.11.05.23.57.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Nov 2023 23:57:11 -0800 (PST)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Message-Id: <7BE47209-2D0C-4E21-8CFB-418D5FA4759C@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_DDED267B-D370-4067-8D3C-231BCBAE388A"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
Date: Mon, 6 Nov 2023 16:56:57 +0900
In-Reply-To: <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
 <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
 <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
 <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_DDED267B-D370-4067-8D3C-231BCBAE388A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 31, 2023, at 23:07, Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
>=20
> Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:
>>=20
>>=20
>> On Tue, Oct 31, 2023 at 2:57=E2=80=AFPM Christian K=C3=B6nig =
<christian.koenig@amd.com <mailto:christian.koenig@amd.com>> wrote:
>>> Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
>>> > The current amdgpu_gem_va_update_vm only tries to perform updates =
for the
>>> > BO specified in the GEM ioctl; however, when a binding is split, =
the
>>> > adjacent bindings also need to be updated. Such updates currently =
ends up
>>> > getting deferred until next submission which causes stalls.
>>>=20
>>> Yeah, that is a necessity. The hardware simply doesn't support what =
you=20
>>> try to do here in all cases.
>>=20
>> What can the hardware not do here? Is this just needing to wait for =
TLB flushes before we can free pagetables, can we just delay that?
>=20
> On some hardware generations (especially Navi1x, but also everything =
older than Polaris) you can't invalidate the TLB while it is in use.
>=20
> For Polaris and older it just means that you don't have a guarantee =
that the shader can't access the memory any more. So delaying the free =
operation helps here.
>=20
> But for Navi1x it's a workaround for a hardware bug. If you try to =
invalidate the TLB while it is in use you can potentially triggering =
memory accesses to random addresses.
>=20
> That's why we still delay TLB invalidation's to the next CS and use a =
new VMID for each submission instead of invalidating the old one.

Thanks for the information. I looked into the VMID allocation logic and =
I see that if concurrent_flush is false, then we defer any flush (or =
VMID reuse that requires a flush) until that VMID is idle.

What patch #3 ends up doing is just performing the PT update right away. =
Any required TLB update is deferred by amdgpu_vm_update_range through =
the increment of tlb_seq, and amdgpu_vmid.c is responsible for doing the =
actual TLB flush in a manner that does not trigger the bug.

Can you confirm that this would be fine for the current hardware?

Tatsuyuki.

>=20
> I'm currently working on changing that for Navi2x and newer (maybe =
Vega as well), but this is something you can really only do on some hw =
generations after validating that it works.
>=20
> Regards,
> Christian.=20
>=20
>> =20
>>>=20
>>> So this approach won't work in general.
>>>=20
>>> Regards,
>>> Christian.
>>>=20
>>> >
>>> > Introduce a new state "dirty", shared between per-VM BOs and =
traditional
>>> > BOs, containing all BOs that have pending updates in `invalids`.
>>> > amdgpu_gem_va_update_vm will now simply flush any pending updates =
for BOs
>>> > in the dirty state.
>>> >
>>> > Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com =
<mailto:ishitatsuyuki@gmail.com>>
>>> > ---
>>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
>>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66 =
++++++++++++++++++-------
>>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
>>> >   3 files changed, 63 insertions(+), 24 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> > index a1b15d0d6c48..01d3a97248b0 100644
>>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> > @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct =
drm_device *dev, void *data,
>>> >    * vital here, so they are not reported back to userspace.
>>> >    */
>>> >   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
>>> > -                                 struct amdgpu_vm *vm,
>>> > -                                 struct amdgpu_bo_va *bo_va,
>>> > -                                 uint32_t operation)
>>> > +                                 struct amdgpu_vm *vm)
>>> >   {
>>> > +     struct amdgpu_bo_va *bo_va;
>>> >       int r;
>>> >  =20
>>> >       if (!amdgpu_vm_ready(vm))
>>> > @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct =
amdgpu_device *adev,
>>> >       if (r)
>>> >               goto error;
>>> >  =20
>>> > -     if (operation =3D=3D AMDGPU_VA_OP_MAP ||
>>> > -         operation =3D=3D AMDGPU_VA_OP_REPLACE) {
>>> > +     spin_lock(&vm->status_lock);
>>> > +     while (!list_empty(&vm->dirty)) {
>>> > +             bo_va =3D list_first_entry(&vm->dirty, struct =
amdgpu_bo_va,
>>> > +                                      base.vm_status);
>>> > +             spin_unlock(&vm->status_lock);
>>> > +
>>> >               r =3D amdgpu_vm_bo_update(adev, bo_va, false);
>>> >               if (r)
>>> >                       goto error;
>>> > +             spin_lock(&vm->status_lock);
>>> >       }
>>> > +     spin_unlock(&vm->status_lock);
>>> >  =20
>>> >       r =3D amdgpu_vm_update_pdes(adev, vm, false);
>>> >  =20
>>> > @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device =
*dev, void *data,
>>> >               break;
>>> >       }
>>> >       if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && =
!amdgpu_vm_debug)
>>> > -             amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
>>> > -                                     args->operation);
>>> > +             amdgpu_gem_va_update_vm(adev, &fpriv->vm);
>>> >  =20
>>> >   error:
>>> >       drm_exec_fini(&exec);
>>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> > index dd6f72e2a1d6..01d31891cd05 100644
>>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> > @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct =
amdgpu_vm_bo_base *vm_bo, bool evict
>>> >       spin_unlock(&vm_bo->vm->status_lock);
>>> >   }
>>> >  =20
>>> > +/**
>>> > + * amdgpu_vm_bo_dirty - vm_bo is dirty
>>> > + *
>>> > + * @vm_bo: vm_bo which is dirty
>>> > + *
>>> > + * State for normal and per VM BOs that are not moved, but have =
new entries in
>>> > + * bo_va->invalids.
>>> > + */
>>> > +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
>>> > +{
>>> > +     spin_lock(&vm_bo->vm->status_lock);
>>> > +     list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
>>> > +     spin_unlock(&vm_bo->vm->status_lock);
>>> > +}
>>> > +
>>> >   /**
>>> >    * amdgpu_vm_bo_moved - vm_bo is moved
>>> >    *
>>> > @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm =
*vm,
>>> >       list_for_each_entry_safe(bo_va, tmp, &vm->evicted, =
base.eviction_status)
>>> >               amdgpu_vm_bo_get_memory(bo_va, stats);
>>> >  =20
>>> > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty, =
base.vm_status)
>>> > +             amdgpu_vm_bo_get_memory(bo_va, stats);
>>> > +
>>> >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated, =
base.vm_status)
>>> >               amdgpu_vm_bo_get_memory(bo_va, stats);
>>> >  =20
>>> > @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct =
amdgpu_device *adev,
>>> >                       dma_resv_unlock(resv);
>>> >               spin_lock(&vm->status_lock);
>>> >       }
>>> > +
>>> > +     while (!list_empty(&vm->dirty)) {
>>> > +             bo_va =3D list_first_entry(&vm->dirty, struct =
amdgpu_bo_va,
>>> > +                                      base.vm_status);
>>> > +             spin_unlock(&vm->status_lock);
>>> > +
>>> > +             r =3D amdgpu_vm_bo_update(adev, bo_va, false);
>>> > +             if (r)
>>> > +                     return r;
>>> > +             spin_lock(&vm->status_lock);
>>> > +     }
>>> >       spin_unlock(&vm->status_lock);
>>> >  =20
>>> >       return 0;
>>> > @@ -1476,19 +1505,16 @@ static void amdgpu_vm_bo_insert_map(struct =
amdgpu_device *adev,
>>> >                                   struct amdgpu_bo_va_mapping =
*mapping)
>>> >   {
>>> >       struct amdgpu_vm *vm =3D bo_va->base.vm;
>>> > -     struct amdgpu_bo *bo =3D bo_va->base.bo <http://base.bo/>;
>>> >  =20
>>> >       mapping->bo_va =3D bo_va;
>>> >       list_add(&mapping->list, &bo_va->invalids);
>>> >       amdgpu_vm_it_insert(mapping, &vm->va);
>>> > +     if (!bo_va->base.moved)
>>> > +             amdgpu_vm_bo_dirty(&bo_va->base);
>>> >  =20
>>> >       if (mapping->flags & AMDGPU_PTE_PRT)
>>> >               amdgpu_vm_prt_get(adev);
>>> >  =20
>>> > -     if (bo && bo->tbo.base.resv =3D=3D =
vm->root.bo->tbo.base.resv &&
>>> > -         !bo_va->base.moved) {
>>> > -             amdgpu_vm_bo_moved(&bo_va->base);
>>> > -     }
>>> >       trace_amdgpu_vm_bo_map(bo_va, mapping);
>>> >   }
>>> >  =20
>>> > @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct =
amdgpu_device *adev,
>>> >                       before->flags =3D tmp->flags;
>>> >                       before->bo_va =3D tmp->bo_va;
>>> >                       list_add(&before->list, =
&tmp->bo_va->invalids);
>>> > +                     if (!tmp->bo_va->base.moved)
>>> > +                             =
amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>>> >               }
>>> >  =20
>>> >               /* Remember mapping split at the end */
>>> > @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct =
amdgpu_device *adev,
>>> >                       after->flags =3D tmp->flags;
>>> >                       after->bo_va =3D tmp->bo_va;
>>> >                       list_add(&after->list, =
&tmp->bo_va->invalids);
>>> > +                     if (!tmp->bo_va->base.moved)
>>> > +                             =
amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>>> >               }
>>> >  =20
>>> >               list_del(&tmp->list);
>>> > @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct =
amdgpu_device *adev,
>>> >  =20
>>> >       /* Insert partial mapping before the range */
>>> >       if (!list_empty(&before->list)) {
>>> > -             struct amdgpu_bo *bo =3D before->bo_va->base.bo =
<http://base.bo/>;
>>> > -
>>> >               amdgpu_vm_it_insert(before, &vm->va);
>>> >               if (before->flags & AMDGPU_PTE_PRT)
>>> >                       amdgpu_vm_prt_get(adev);
>>> > -
>>> > -             if (bo && bo->tbo.base.resv =3D=3D =
vm->root.bo->tbo.base.resv &&
>>> > -                 !before->bo_va->base.moved)
>>> > -                     amdgpu_vm_bo_moved(&before->bo_va->base);
>>> >       } else {
>>> >               kfree(before);
>>> >       }
>>> >  =20
>>> >       /* Insert partial mapping after the range */
>>> >       if (!list_empty(&after->list)) {
>>> > -             struct amdgpu_bo *bo =3D after->bo_va->base.bo =
<http://base.bo/>;
>>> > -
>>> >               amdgpu_vm_it_insert(after, &vm->va);
>>> >               if (after->flags & AMDGPU_PTE_PRT)
>>> >                       amdgpu_vm_prt_get(adev);
>>> > -
>>> > -             if (bo && bo->tbo.base.resv =3D=3D =
vm->root.bo->tbo.base.resv &&
>>> > -                 !after->bo_va->base.moved)
>>> > -                     amdgpu_vm_bo_moved(&after->bo_va->base);
>>> >       } else {
>>> >               kfree(after);
>>> >       }
>>> > @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device =
*adev, struct amdgpu_vm *vm, int32_t xcp
>>> >       INIT_LIST_HEAD(&vm->evicted);
>>> >       INIT_LIST_HEAD(&vm->relocated);
>>> >       INIT_LIST_HEAD(&vm->moved);
>>> > +     INIT_LIST_HEAD(&vm->dirty);
>>> >       INIT_LIST_HEAD(&vm->idle);
>>> >       INIT_LIST_HEAD(&vm->invalidated);
>>> >       spin_lock_init(&vm->status_lock);
>>> > @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct =
amdgpu_vm *vm, struct seq_file *m)
>>> >   {
>>> >       struct amdgpu_bo_va *bo_va, *tmp;
>>> >       u64 total_idle =3D 0;
>>> > +     u64 total_dirty =3D 0;
>>> >       u64 total_relocated =3D 0;
>>> >       u64 total_moved =3D 0;
>>> >       u64 total_invalidated =3D 0;
>>> >       u64 total_done =3D 0;
>>> >       unsigned int total_idle_objs =3D 0;
>>> > +     unsigned int total_dirty_objs =3D 0;
>>> >       unsigned int total_relocated_objs =3D 0;
>>> >       unsigned int total_moved_objs =3D 0;
>>> >       unsigned int total_invalidated_objs =3D 0;
>>> > @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct =
amdgpu_vm *vm, struct seq_file *m)
>>> >       total_idle_objs =3D id;
>>> >       id =3D 0;
>>> >  =20
>>> > +     seq_puts(m, "\tDirty BOs:\n");
>>> > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty, =
base.vm_status) {
>>> > +             if (!bo_va->base.bo <http://base.bo/>)
>>> > +                     continue;
>>> > +             total_dirty +=3D amdgpu_bo_print_info(id++, =
bo_va->base.bo <http://base.bo/>, m);
>>> > +     }
>>> > +     total_dirty_objs =3D id;
>>> > +     id =3D 0;
>>> > +
>>> >       seq_puts(m, "\tRelocated BOs:\n");
>>> >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated, =
base.vm_status) {
>>> >               if (!bo_va->base.bo <http://base.bo/>)
>>> > @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct =
amdgpu_vm *vm, struct seq_file *m)
>>> >  =20
>>> >       seq_printf(m, "\tTotal idle size:        =
%12lld\tobjs:\t%d\n", total_idle,
>>> >                  total_idle_objs);
>>> > +     seq_printf(m, "\tTotal dirty size:       =
%12lld\tobjs:\t%d\n", total_dirty,
>>> > +                total_dirty_objs);
>>> >       seq_printf(m, "\tTotal relocated size:   =
%12lld\tobjs:\t%d\n", total_relocated,
>>> >                  total_relocated_objs);
>>> >       seq_printf(m, "\tTotal moved size:       =
%12lld\tobjs:\t%d\n", total_moved,
>>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> > index d9ab97eabda9..f91d4fcf80b8 100644
>>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> > @@ -276,6 +276,9 @@ struct amdgpu_vm {
>>> >       /* per VM BOs moved, but not yet updated in the PT */
>>> >       struct list_head        moved;
>>> >  =20
>>> > +     /* normal and per VM BOs that are not moved, but have new PT =
entries */
>>> > +     struct list_head        dirty;
>>> > +
>>> >       /* All BOs of this VM not currently in the state machine */
>>> >       struct list_head        idle;
>>> >  =20
>>>=20
>=20


--Apple-Mail=_DDED267B-D370-4067-8D3C-231BCBAE388A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><blockquote type=3D"cite"><div>On Oct 31, =
2023, at 23:07, Christian K=C3=B6nig &lt;christian.koenig@amd.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
 =20
  <div>
    Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:<br>
    <blockquote type=3D"cite" =
cite=3D"mid:CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=3DWkBpJyJrmqZ=3DrtMA@mail.g=
mail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at
            2:57=E2=80=AFPM Christian K=C3=B6nig &lt;<a =
href=3D"mailto:christian.koenig@amd.com" moz-do-not-send=3D"true" =
class=3D"moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am
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
            Yeah, that is a necessity. The hardware simply doesn't
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
    older than Polaris) you can't invalidate the TLB while it is in =
use.<br>
    <br>
    For Polaris and older it just means that you don't have a guarantee
    that the shader can't access the memory any more. So delaying the
    free operation helps here.<br>
    <br>
    But for Navi1x it's a workaround for a hardware bug. If you try to
    invalidate the TLB while it is in use you can potentially triggering
    memory accesses to random addresses.<br>
    <br>
    That's why we still delay TLB invalidation's to the next CS and use
    a new VMID for each submission instead of invalidating the old =
one.<br></div></div></blockquote><div><br></div><div>Thanks for the =
information. I looked into the VMID allocation logic and I see that if =
concurrent_flush is false, then we defer any flush (or VMID reuse that =
requires a flush) until that VMID is idle.</div><div><br></div><div>What =
patch #3 ends up doing is just performing the PT update right away. Any =
required TLB update is deferred by amdgpu_vm_update_range through the =
increment of tlb_seq, and amdgpu_vmid.c is responsible for doing the =
actual TLB flush in a manner that does not trigger the =
bug.</div><div><br></div><div>Can you confirm that this would be fine =
for the current =
hardware?</div><div><br></div><div>Tatsuyuki.</div><br><blockquote =
type=3D"cite"><div><div>
    <br>
    I'm currently working on changing that for Navi2x and newer (maybe
    Vega as well), but this is something you can really only do on some
    hw generations after validating that it works.<br>
    <br>
    Regards,<br>
    Christian. <br>
    <br>
    <blockquote type=3D"cite" =
cite=3D"mid:CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=3DWkBpJyJrmqZ=3DrtMA@mail.g=
mail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>&nbsp;<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            So this approach won't work in general.<br>
            <br>
            Regards,<br>
            Christian.<br>
            <br>
            &gt;<br>
            &gt; Introduce a new state "dirty", shared between per-VM
            BOs and traditional<br>
            &gt; BOs, containing all BOs that have pending updates in
            `invalids`.<br>
            &gt; amdgpu_gem_va_update_vm will now simply flush any
            pending updates for BOs<br>
            &gt; in the dirty state.<br>
            &gt;<br>
            &gt; Signed-off-by: Tatsuyuki Ishi &lt;<a =
href=3D"mailto:ishitatsuyuki@gmail.com" target=3D"_blank" =
moz-do-not-send=3D"true" =
class=3D"moz-txt-link-freetext">ishitatsuyuki@gmail.com</a>&gt;<br>
            &gt; ---<br>
            &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | =
18 ++++---<br>
            &gt;&nbsp; =
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c&nbsp; | 66
            ++++++++++++++++++-------<br>
            &gt;&nbsp; =
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h&nbsp; |&nbsp; 3 ++<br>
            &gt;&nbsp; &nbsp;3 files changed, 63 insertions(+), 24 =
deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; index a1b15d0d6c48..01d3a97248b0 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
            &gt; @@ -604,10 +604,9 @@ int
            amdgpu_gem_metadata_ioctl(struct drm_device *dev, void
            *data,<br>
            &gt;&nbsp; &nbsp; * vital here, so they are not reported =
back to
            userspace.<br>
            &gt;&nbsp; &nbsp; */<br>
            &gt;&nbsp; &nbsp;static void amdgpu_gem_va_update_vm(struct
            amdgpu_device *adev,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;struct amdgpu_vm *vm,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;struct amdgpu_bo_va
            *bo_va,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;uint32_t operation)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;struct amdgpu_vm *vm)<br>
            &gt;&nbsp; &nbsp;{<br>
            &gt; +&nbsp; &nbsp; &nbsp;struct amdgpu_bo_va *bo_va;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;int r;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!amdgpu_vm_ready(vm))<br>
            &gt; @@ -617,12 +616,18 @@ static void
            amdgpu_gem_va_update_vm(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto error;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; -&nbsp; &nbsp; &nbsp;if (operation =3D=3D =
AMDGPU_VA_OP_MAP ||<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;operation =3D=3D =
AMDGPU_VA_OP_REPLACE) {<br>
            &gt; +&nbsp; &nbsp; =
&nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
            &gt; +&nbsp; &nbsp; &nbsp;while =
(!list_empty(&amp;vm-&gt;dirty)) {<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo_va =
=3D
            list_first_entry(&amp;vm-&gt;dirty, struct amdgpu_bo_va,<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; base.vm_status);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D amdgpu_vm_bo_update(adev, bo_va,
            false);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (r)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;goto error;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; +&nbsp; &nbsp; =
&nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;r =3D =
amdgpu_vm_update_pdes(adev, vm, false);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct
            drm_device *dev, void *data,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (!r &amp;&amp; =
!(args-&gt;flags &amp;
            AMDGPU_VM_DELAY_UPDATE) &amp;&amp; !amdgpu_vm_debug)<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_gem_va_update_vm(adev,
            &amp;fpriv-&gt;vm, bo_va,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
            &nbsp;args-&gt;operation);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_gem_va_update_vm(adev,
            &amp;fpriv-&gt;vm);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp;error:<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;drm_exec_fini(&amp;exec);<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; index dd6f72e2a1d6..01d31891cd05 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt; @@ -191,6 +191,21 @@ static void
            amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo,
            bool evict<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;spin_unlock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
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
            &gt; +&nbsp; &nbsp; =
&nbsp;spin_lock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
            &gt; +&nbsp; &nbsp; =
&nbsp;list_move(&amp;vm_bo-&gt;vm_status,
            &amp;vm_bo-&gt;vm-&gt;dirty);<br>
            &gt; +&nbsp; &nbsp; =
&nbsp;spin_unlock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
            &gt; +}<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp;/**<br>
            &gt;&nbsp; &nbsp; * amdgpu_vm_bo_moved - vm_bo is moved<br>
            &gt;&nbsp; &nbsp; *<br>
            &gt; @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct
            amdgpu_vm *vm,<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;evicted, base.eviction_status)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_vm_bo_get_memory(bo_va, stats);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; +&nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, =
tmp,
            &amp;vm-&gt;dirty, base.vm_status)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_vm_bo_get_memory(bo_va, stats);<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;relocated, base.vm_status)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_vm_bo_get_memory(bo_va, stats);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; @@ -1411,6 +1429,17 @@ int
            amdgpu_vm_handle_moved(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;dma_resv_unlock(resv);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; +<br>
            &gt; +&nbsp; &nbsp; &nbsp;while =
(!list_empty(&amp;vm-&gt;dirty)) {<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo_va =
=3D
            list_first_entry(&amp;vm-&gt;dirty, struct amdgpu_bo_va,<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; base.vm_status);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
            &gt; +<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D =
amdgpu_vm_bo_update(adev, bo_va,
            false);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if =
(r)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;return r;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;spin_lock(&amp;vm-&gt;status_lock);<br>
            &gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;spin_unlock(&amp;vm-&gt;status_lock);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
            &gt; @@ -1476,19 +1505,16 @@ static void
            amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;struct
            amdgpu_bo_va_mapping *mapping)<br>
            &gt;&nbsp; &nbsp;{<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_vm *vm =3D =
bo_va-&gt;base.vm;<br>
            &gt; -&nbsp; &nbsp; &nbsp;struct amdgpu_bo *bo =3D =
bo_va-&gt;<a href=3D"http://base.bo/" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">base.bo</a>;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;mapping-&gt;bo_va =3D =
bo_va;<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;list_add(&amp;mapping-&gt;list,
            &amp;bo_va-&gt;invalids);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_it_insert(mapping, =
&amp;vm-&gt;va);<br>
            &gt; +&nbsp; &nbsp; &nbsp;if (!bo_va-&gt;base.moved)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_vm_bo_dirty(&amp;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (mapping-&gt;flags &amp; =
AMDGPU_PTE_PRT)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_vm_prt_get(adev);<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; -&nbsp; &nbsp; &nbsp;if (bo &amp;&amp; =
bo-&gt;tbo.base.resv =3D=3D
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;!bo_va-&gt;base.moved) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_vm_bo_moved(&amp;bo_va-&gt;base);<br>
            &gt; -&nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;trace_amdgpu_vm_bo_map(bo_va, =
mapping);<br>
            &gt;&nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; @@ -1725,6 +1751,8 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;before-&gt;flags =3D tmp-&gt;flags;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;before-&gt;bo_va =3D tmp-&gt;bo_va;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;list_add(&amp;before-&gt;list,
            &amp;tmp-&gt;bo_va-&gt;invalids);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;if
            (!tmp-&gt;bo_va-&gt;base.moved)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;/* Remember mapping split at the end */<br>
            &gt; @@ -1736,6 +1764,8 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;after-&gt;flags =3D tmp-&gt;flags;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;after-&gt;bo_va =3D tmp-&gt;bo_va;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;list_add(&amp;after-&gt;list,
            &amp;tmp-&gt;bo_va-&gt;invalids);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;if
            (!tmp-&gt;bo_va-&gt;base.moved)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;list_del(&amp;tmp-&gt;list);<br>
            &gt; @@ -1761,30 +1791,18 @@ int
            amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Insert partial mapping =
before the range */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if =
(!list_empty(&amp;before-&gt;list)) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct =
amdgpu_bo *bo =3D
            before-&gt;bo_va-&gt;<a href=3D"http://base.bo/" =
rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">base.bo</a>;<br>
            &gt; -<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_vm_it_insert(before,
            &amp;vm-&gt;va);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (before-&gt;flags &amp;
            AMDGPU_PTE_PRT)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_prt_get(adev);<br>
            &gt; -<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo =
&amp;&amp; bo-&gt;tbo.base.resv =3D=3D
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;!before-&gt;bo_va-&gt;base.moved)<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;
            =
&nbsp;amdgpu_vm_bo_moved(&amp;before-&gt;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;} else {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;kfree(before);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Insert partial mapping =
after the range */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if =
(!list_empty(&amp;after-&gt;list)) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct =
amdgpu_bo *bo =3D
            after-&gt;bo_va-&gt;<a href=3D"http://base.bo/" =
rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">base.bo</a>;<br>
            &gt; -<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;amdgpu_vm_it_insert(after,
            &amp;vm-&gt;va);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (after-&gt;flags &amp; AMDGPU_PTE_PRT)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_prt_get(adev);<br>
            &gt; -<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo =
&amp;&amp; bo-&gt;tbo.base.resv =3D=3D
            vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;!after-&gt;bo_va-&gt;base.moved)<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;
            &nbsp;amdgpu_vm_bo_moved(&amp;after-&gt;bo_va-&gt;base);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;} else {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;kfree(after);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct
            amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;INIT_LIST_HEAD(&amp;vm-&gt;evicted);<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;INIT_LIST_HEAD(&amp;vm-&gt;relocated);<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;INIT_LIST_HEAD(&amp;vm-&gt;moved);<br>
            &gt; +&nbsp; &nbsp; =
&nbsp;INIT_LIST_HEAD(&amp;vm-&gt;dirty);<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;INIT_LIST_HEAD(&amp;vm-&gt;idle);<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;INIT_LIST_HEAD(&amp;vm-&gt;invalidated);<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;spin_lock_init(&amp;vm-&gt;status_lock);<br>
            &gt; @@ -2648,11 +2667,13 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;&nbsp; &nbsp;{<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct amdgpu_bo_va *bo_va, =
*tmp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_idle =3D 0;<br>
            &gt; +&nbsp; &nbsp; &nbsp;u64 total_dirty =3D 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_relocated =3D =
0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_moved =3D 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_invalidated =3D =
0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;u64 total_done =3D 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int total_idle_objs =
=3D 0;<br>
            &gt; +&nbsp; &nbsp; &nbsp;unsigned int total_dirty_objs =3D =
0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int =
total_relocated_objs =3D 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int total_moved_objs =
=3D 0;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;unsigned int =
total_invalidated_objs =3D 0;<br>
            &gt; @@ -2669,6 +2690,15 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;total_idle_objs =3D id;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;id =3D 0;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; +&nbsp; &nbsp; &nbsp;seq_puts(m, "\tDirty BOs:\n");<br>
            &gt; +&nbsp; &nbsp; &nbsp;list_for_each_entry_safe(bo_va, =
tmp,
            &amp;vm-&gt;dirty, base.vm_status) {<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if =
(!bo_va-&gt;<a href=3D"http://base.bo/" rel=3D"noreferrer" =
target=3D"_blank" moz-do-not-send=3D"true">base.bo</a>)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;continue;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;total_dirty +=3D amdgpu_bo_print_info(id++,
            bo_va-&gt;<a href=3D"http://base.bo/" rel=3D"noreferrer" =
target=3D"_blank" moz-do-not-send=3D"true">base.bo</a>, m);<br>
            &gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt; +&nbsp; &nbsp; &nbsp;total_dirty_objs =3D id;<br>
            &gt; +&nbsp; &nbsp; &nbsp;id =3D 0;<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_puts(m, "\tRelocated =
BOs:\n");<br>
            &gt;&nbsp; &nbsp; &nbsp; =
&nbsp;list_for_each_entry_safe(bo_va, tmp,
            &amp;vm-&gt;relocated, base.vm_status) {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (!bo_va-&gt;<a href=3D"http://base.bo/" rel=3D"noreferrer" =
target=3D"_blank" moz-do-not-send=3D"true">base.bo</a>)<br>
            &gt; @@ -2707,6 +2737,8 @@ void
            amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct
            seq_file *m)<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, "\tTotal idle =
size:&nbsp; &nbsp; &nbsp; &nbsp;
            %12lld\tobjs:\t%d\n", total_idle,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; total_idle_objs);<br>
            &gt; +&nbsp; &nbsp; &nbsp;seq_printf(m, "\tTotal dirty =
size:&nbsp; &nbsp; &nbsp;
            &nbsp;%12lld\tobjs:\t%d\n", total_dirty,<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; total_dirty_objs);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, "\tTotal =
relocated size:&nbsp;
            &nbsp;%12lld\tobjs:\t%d\n", total_relocated,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; total_relocated_objs);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;seq_printf(m, "\tTotal moved =
size:&nbsp; &nbsp; &nbsp;
            &nbsp;%12lld\tobjs:\t%d\n", total_moved,<br>
            &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; index d9ab97eabda9..f91d4fcf80b8 100644<br>
            &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
            &gt; @@ -276,6 +276,9 @@ struct amdgpu_vm {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* per VM BOs moved, but not =
yet updated in the
            PT */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; =
&nbsp; &nbsp; moved;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; +&nbsp; &nbsp; &nbsp;/* normal and per VM BOs that are =
not moved, but
            have new PT entries */<br>
            &gt; +&nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; =
&nbsp; &nbsp; dirty;<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* All BOs of this VM not =
currently in the state
            machine */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct list_head&nbsp; &nbsp; =
&nbsp; &nbsp; idle;<br>
            &gt;&nbsp; &nbsp;<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</div></blockquote></div><br></body></html>=

--Apple-Mail=_DDED267B-D370-4067-8D3C-231BCBAE388A--

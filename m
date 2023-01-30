Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BA8680C21
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 12:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFE710E0E7;
	Mon, 30 Jan 2023 11:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4690D10E0E7;
 Mon, 30 Jan 2023 11:40:53 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u12so8017350lfq.0;
 Mon, 30 Jan 2023 03:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVYpDT5q7nV67Cbcn+kM+zjlEDnpj0GzWp9wSKrywJE=;
 b=EVsNaqRtgqxnhpmUCORVvV49m4wcWx8TaAuWTzFXPink/EIQuq7J1DEOQaw+Gv/Ikx
 0bOq4GCPt7lKcNQP5yrAbG07S1cV8d06ME0i3h32cNefKFyaKT/RRVl/OO4R6lJopRwQ
 7yDXt6nRhADggXiMxYw2PrPp+CJasGpYlrjAwgrQy6fgYGyZXYj44Cn8gWDJInTgU8sF
 6UnAhUpTJTQ+WNNU5JjkkE2bXluw2QvZNcdPSn2c5L1CLUFbtk4yUBaA0DEljcQUrzms
 U2pQSjdGDAqN9oTEbhj4g3EUjLDjt7Br57IYGCgWg0oLbFc7oagXlNFZ1Mnx3u3Gk16w
 9FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVYpDT5q7nV67Cbcn+kM+zjlEDnpj0GzWp9wSKrywJE=;
 b=4sL2LW247sFhzHexxrdyRFLYw3ryoIuWT4TqOgRwuwRrb38emwjMD2D7V5P3nmtes5
 PjAGJ81f1W0S6EOBPnIm2m7/n4rwsfr9iGQTCjl1xGs8Ffysm2vHDD/ZgtSC7mH8lxnR
 tKJ6Y+74COkCImWR+J7Nz9fc2TymCnHA6rl0zNoJhY2MM82bI87Aj2wJQcd23bb86PIJ
 37uzAS46ud/3gpE7EI8J41WWXvDXKA2fFOQLDMINMcFAOHEP2estBnXALQjMv9dl8DbF
 uuUpC3njqTLezTjfUXFYxWFscftac7NC9yUXmmLkflhSFWzaifiR1EBnqwbPVkEPJ6l+
 Zzxg==
X-Gm-Message-State: AFqh2koyHYrIqYDEpZjBKSK1b6L7ZuSOwH1ZEfQnswT5aCF+5xWdIV9K
 J7skqPoYq00le9VtDNeegT/pO2LuNd6TGywZ60E=
X-Google-Smtp-Source: AMrXdXvIkuFuMyZzQtYac9twNVCDLIez1GpRbld4mTZFHndffDt/vhQseGBAjzTcV1roRZaADhj68qNncbtMWNm7MWA=
X-Received: by 2002:a05:6512:214b:b0:4d3:d4e4:9b85 with SMTP id
 s11-20020a056512214b00b004d3d4e49b85mr4443310lfr.46.1675078851367; Mon, 30
 Jan 2023 03:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20230130101230.25347-1-matthew.auld@intel.com>
 <20230130101230.25347-2-matthew.auld@intel.com>
 <e8b475e1-2c5c-ec78-a97c-0dd9df099a21@intel.com>
In-Reply-To: <e8b475e1-2c5c-ec78-a97c-0dd9df099a21@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 30 Jan 2023 11:40:23 +0000
Message-ID: <CAM0jSHN7U0RsBcouVzAko=BYbW-_-UnCti=F8sBSGC0a-vVs0g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915/ttm: audit remaining bo->resource
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Jan 2023 at 11:00, Andrzej Hajda <andrzej.hajda@intel.com> wrote=
:
>
> On 30.01.2023 11:12, Matthew Auld wrote:
> > In the near future TTM will have NULL bo->resource when the object is
> > initially created, plus after calling into pipeline-gutting. Try to
> > handle the remaining cases. In practice NULL bo->resource should be
> > taken to mean swapped-out or purged object.
> >
> > References: 516198d317d8 ("drm/i915: audit bo->resource usage v3")
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 12 +++++++++---
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  7 ++++++-
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  7 +++++--
> >   3 files changed, 20 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/=
i915/gem/i915_gem_ttm.c
> > index 4758f21c91e1..4ba1d7862ff9 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -472,7 +472,7 @@ static int i915_ttm_shrink(struct drm_i915_gem_obje=
ct *obj, unsigned int flags)
> >       struct ttm_placement place =3D {};
> >       int ret;
> >
> > -     if (!bo->ttm || bo->resource->mem_type !=3D TTM_PL_SYSTEM)
> > +     if (!bo->ttm || (bo->resource && bo->resource->mem_type !=3D TTM_=
PL_SYSTEM))
> >               return 0;
> >
> >       GEM_BUG_ON(!i915_tt->is_shmem);
> > @@ -511,7 +511,13 @@ static void i915_ttm_delete_mem_notify(struct ttm_=
buffer_object *bo)
> >   {
> >       struct drm_i915_gem_object *obj =3D i915_ttm_to_gem(bo);
> >
> > -     if (bo->resource && !i915_ttm_is_ghost_object(bo)) {
> > +     /*
> > +      * This gets called twice by ttm, so long as we have a ttm resour=
ce or
> > +      * ttm_tt then we can still safely call this. Due to pipeline-gut=
ting,
> > +      * we maybe have NULL bo->resource, but in that case we should al=
ways
> > +      * have a ttm alive (like if the pages are swapped out).
> > +      */
> > +     if ((bo->resource || bo->ttm) && !i915_ttm_is_ghost_object(bo)) {
> >               __i915_gem_object_pages_fini(obj);
> >               i915_ttm_free_cached_io_rsgt(obj);
> >       }
> > @@ -1198,7 +1204,7 @@ static void i915_ttm_unmap_virtual(struct drm_i91=
5_gem_object *obj)
> >
> >       assert_object_held_shared(obj);
> >
> > -     if (i915_ttm_cpu_maps_iomem(bo->resource)) {
> > +     if (bo->resource && i915_ttm_cpu_maps_iomem(bo->resource)) {
>
> I wonder if i915_ttm_cpu_maps_iomem couldn't handle null resource?

Yeah, seems reasonable to me.

>
>
> >               wakeref =3D intel_runtime_pm_get(&to_i915(obj->base.dev)-=
>runtime_pm);
> >
> >               /* userfault_count is protected by obj lock and rpm waker=
ef. */
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu=
/drm/i915/gem/i915_gem_ttm_move.c
> > index 76dd9e5e1a8b..72953ebadfd8 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > @@ -83,7 +83,8 @@ void i915_ttm_adjust_domains_after_move(struct drm_i9=
15_gem_object *obj)
> >   {
> >       struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> >
> > -     if (i915_ttm_cpu_maps_iomem(bo->resource) || bo->ttm->caching !=
=3D ttm_cached) {
> > +     if ((bo->resource && i915_ttm_cpu_maps_iomem(bo->resource)) ||
> > +         bo->ttm->caching !=3D ttm_cached) {
> >               obj->write_domain =3D I915_GEM_DOMAIN_WC;
> >               obj->read_domains =3D I915_GEM_DOMAIN_WC;
> >       } else {
> > @@ -711,6 +712,10 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_obje=
ct *dst,
> >
> >       assert_object_held(dst);
> >       assert_object_held(src);
> > +
> > +     if (GEM_WARN_ON(!src_bo->resource || !dst_bo->resource))
> > +             return -EINVAL;
> > +
> >       i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
> >
> >       ret =3D dma_resv_reserve_fences(src_bo->base.resv, 1);
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_ttm_pm.c
> > index 7e67742bc65e..be44e7eed892 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > @@ -53,7 +53,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_r=
egion *apply,
> >       unsigned int flags;
> >       int err =3D 0;
> >
> > -     if (bo->resource->mem_type =3D=3D I915_PL_SYSTEM || obj->ttm.back=
up)
> > +     if (!bo->resource || bo->resource->mem_type =3D=3D I915_PL_SYSTEM=
 || obj->ttm.backup)
>
> !i915_ttm_cpu_maps_iomem ?
>
> >               return 0;
> >
> >       if (pm_apply->allow_gpu && i915_gem_object_evictable(obj))
> > @@ -187,7 +187,10 @@ static int i915_ttm_restore(struct i915_gem_apply_=
to_region *apply,
> >               return err;
> >
> >       /* Content may have been swapped. */
> > -     err =3D ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> > +     if (!backup_bo->resource)
> > +             err =3D ttm_bo_validate(backup_bo, i915_ttm_sys_placement=
(), &ctx);
> > +     if (!err)
> > +             err =3D ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, =
&ctx);
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Regards
> Andrzej
>
>
> >       if (!err) {
> >               err =3D i915_gem_obj_copy_ttm(obj, backup, pm_apply->allo=
w_gpu,
> >                                           false);
>

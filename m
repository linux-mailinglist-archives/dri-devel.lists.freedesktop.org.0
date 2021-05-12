Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB8437B74C
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 09:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2BF6EB58;
	Wed, 12 May 2021 07:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895906EB56;
 Wed, 12 May 2021 07:58:57 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id q136so21341563qka.7;
 Wed, 12 May 2021 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8OckH/+JO6n92P81MQ/JXOiqCAO82wOY/hsKFSr5vJg=;
 b=K358Z9fRr4ZJncx0ivMeUXYHrkUtSiTlriusVLDzxZujX3VyfDZHZGFxh5w5OOZZ7m
 9QmB1t4WGFqyW+fYYemHhVnBkQ9YswrCaRaeof3iFKb4UbeTwxPya5t0KP5HjmSll4nJ
 1BP5S7Iepl9HgU4LDWL5oLZ8voSA+Ro79h1B3EAtn0Od8EnAuQpI21nfkzzW6Xd3Hq+Z
 UK3tcH2NdqrvycERA+HgMjWi0vxcgkfpbN/xq5MlTip0A0VuuWDQAFtAsnIjabfAx6Gb
 cQFbc9obRn/nWULn1PhxJNnv4ifrKkcuqcEK4DMnm9otOTNbiZ0U/v5P3QZ/udgM76jr
 1FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8OckH/+JO6n92P81MQ/JXOiqCAO82wOY/hsKFSr5vJg=;
 b=lEGwOV800I5Wg+Bn6YmRxTQWtEi8GhCazkAisECEhyPjG80N/4t8qVp6ljBTyAD4t0
 lCVIS5V8XjhiVZMhWNPkqyWvCqV/tZu9Oo/2DVBxIg9+fOywo0ABm/fbxSGU74fKP1nY
 C7aKAFGWZubV6oi9Pt1Zj6qdbLtXd7Qv5mJjsDiOySWid5Hb8XqVX8rTaUV/mY902sBK
 SOxz1hzBSiHQ4sW7Oc6GmnXZYlz3kwGylxUOjaWGit0RdCJAlw2UaWyTM/QJ/zIG5giX
 Si6mRLLeo/Ldm2JqTg6ePubhwGjnX7QxRiOamj5IdUgvSltBBUEJM6+p8040cCKwjimX
 dGVw==
X-Gm-Message-State: AOAM531+mT84VCEj22Ep8T4ERPWk5qcLYW4jBbsKbCGxT1ogwsRmtYnz
 lHEd1WKgkcW7iXOx8+XA0qshSCqM3voIvlZiMwHHvj8vALH4dA==
X-Google-Smtp-Source: ABdhPJzTRWW+vqWeEXYO9mBq9m3c28swLvsx+THT7xIQML5DhJx6OjTrrX1vh2tlhsOY6MNXWF5Dr8PrTnAPbkkeDYc=
X-Received: by 2002:a37:a287:: with SMTP id
 l129mr22061174qke.481.1620806336630; 
 Wed, 12 May 2021 00:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-8-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210511132525.377190-8-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 12 May 2021 08:58:30 +0100
Message-ID: <CAM0jSHOJh64y9mncdsvWukAKn5hn0a=0tW-Az678sgbLWwpJFw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915/lmem: Verify checks for lmem
 residency
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 May 2021 at 14:26, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Since objects can be migrated or evicted when not pinned or locked,
> update the checks for lmem residency or future residency so that
> the value returned is not immediately stale.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c     | 42 +++++++++++++++++++-
>  drivers/gpu/drm/i915/gem/i915_gem_object.c   | 29 ++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h   |  4 ++
>  4 files changed, 75 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index de1f13d203b5..b95def2d5af3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -11615,7 +11615,7 @@ intel_user_framebuffer_create(struct drm_device *=
dev,
>
>         /* object is backed with LMEM for discrete */
>         i915 =3D to_i915(obj->base.dev);
> -       if (HAS_LMEM(i915) && !i915_gem_object_is_lmem(obj)) {
> +       if (HAS_LMEM(i915) && !i915_gem_object_validates_to_lmem(obj)) {
>                 /* object is "remote", not in local memory */
>                 i915_gem_object_put(obj);
>                 return ERR_PTR(-EREMOTE);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i=
915/gem/i915_gem_lmem.c
> index 2b8cd15de1d9..d539dffa1554 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -23,10 +23,50 @@ i915_gem_object_lmem_io_map(struct drm_i915_gem_objec=
t *obj,
>         return io_mapping_map_wc(&obj->mm.region->iomap, offset, size);
>  }
>
> +/**
> + * i915_gem_object_validates_to_lmem - Whether the object is resident in
> + * lmem when pages are present.
> + * @obj: The object to check.
> + *
> + * Migratable objects residency may change from under us if the object i=
s
> + * not pinned or locked. This function is intended to be used to check w=
hether
> + * the object can only reside in lmem when pages are present.
> + *
> + * Return: Whether the object is always resident in lmem when pages are
> + * present.
> + */
> +bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj)
> +{
> +       struct intel_memory_region *mr =3D READ_ONCE(obj->mm.region);
> +
> +       return !i915_gem_object_migratable(obj) &&
> +               mr && (mr->type =3D=3D INTEL_MEMORY_LOCAL ||
> +                      mr->type =3D=3D INTEL_MEMORY_STOLEN_LOCAL);
> +}
> +
> +/**
> + * i915_gem_object_is_lmem - Whether the object is resident in
> + * lmem
> + * @obj: The object to check.
> + *
> + * Even if an object is allowed to migrate and change memory region,
> + * this function checks whether it will always be present in lmem when
> + * valid *or* if that's not the case, whether it's currently resident in=
 lmem.
> + * For migratable and evictable objects, the latter only makes sense whe=
n
> + * the object is locked.
> + *
> + * Return: Whether the object migratable but resident in lmem, or not
> + * migratable and will be present in lmem when valid.
> + */
>  bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
>  {
> -       struct intel_memory_region *mr =3D obj->mm.region;
> +       struct intel_memory_region *mr =3D READ_ONCE(obj->mm.region);
>
> +#ifdef CONFIG_LOCKDEP
> +       if (i915_gem_object_migratable(obj) &&
> +           i915_gem_object_evictable(obj))
> +               assert_object_held(obj);
> +#endif
>         return mr && (mr->type =3D=3D INTEL_MEMORY_LOCAL ||
>                       mr->type =3D=3D INTEL_MEMORY_STOLEN_LOCAL);
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm=
/i915/gem/i915_gem_object.c
> index c53488f391dd..0475b1c94454 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -458,6 +458,35 @@ bool i915_gem_object_evictable(struct drm_i915_gem_o=
bject *obj)
>         return pin_count =3D=3D 0;
>  }
>
> +/**
> + * i915_gem_object_migratable - Whether the object is migratable out of =
the
> + * current region.
> + * @obj: Pointer to the object.
> + *
> + * Return: Whether the object is allowed to be resident in other
> + * regions than the current while pages are present.
> + */
> +bool i915_gem_object_migratable(struct drm_i915_gem_object *obj)
> +{
> +       struct intel_memory_region *mr =3D READ_ONCE(obj->mm.region);
> +       struct intel_memory_region *placement;
> +       int i;
> +
> +       if (!mr)
> +               return false;
> +
> +       if (!obj->mm.n_placements)
> +               return false;
> +
> +       for (i =3D 0; i < obj->mm.n_placements; ++i) {
> +               placement =3D obj->mm.placements[i];
> +               if (placement !=3D mr)
> +                       return true;
> +       }

Maybe this can simply be:
return obj->mm.n_placements > 1;

?

The uAPI guarantees that mm.placements are each unique.

> +
> +       return false;
> +}
> +
>  void i915_gem_init__objects(struct drm_i915_private *i915)
>  {
>         INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index ae5930e307d5..a3ad8cf4eefd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -596,6 +596,10 @@ void __i915_gem_free_object(struct drm_i915_gem_obje=
ct *obj);
>
>  bool i915_gem_object_evictable(struct drm_i915_gem_object *obj);
>
> +bool i915_gem_object_migratable(struct drm_i915_gem_object *obj);
> +
> +bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj);
> +
>  #ifdef CONFIG_MMU_NOTIFIER
>  static inline bool
>  i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
> --
> 2.30.2
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

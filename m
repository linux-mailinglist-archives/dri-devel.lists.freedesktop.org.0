Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128153B01E4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 12:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673DA6E497;
	Tue, 22 Jun 2021 10:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7416E48C;
 Tue, 22 Jun 2021 10:55:50 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id o6so2890204qkh.4;
 Tue, 22 Jun 2021 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CRoL11pDbArCAKMVL0BaPMkzdKsbMpA4VloJGfbRwVg=;
 b=gbzWXd4/95RWD1DAsavMbFJziRdPSUzHPg2MFV4LRIvTTl+z/6/oGiF54et+4F+M1S
 3/J/tXnQVBBDq7uRwAwGf89brfp97mC/ZVGanJUZUQ9G7gKrrIvnZBSnNJuPB+NyNuMu
 ivG/y05ZnVIwi9fRzokw+nRywoONctkBwnAsnGPOURLGkOm+zZBtVsPrNuoS+KKZ7TDl
 9gQxvUwxyEc/lH/ocj/nB5koc+oAU7YkF5yvi0Nbc/yVUDS/sVZNAumEIBzMT6W6hRxq
 9RyLEY3ITqKJY8hQyglA1g49TM3sdZhN5DdhV/BhNlHrjqkKNTHxHCsX3JU8jYKWZPBI
 OIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CRoL11pDbArCAKMVL0BaPMkzdKsbMpA4VloJGfbRwVg=;
 b=OUC2uzdxo2qnkyKLehMZhpCJGkv8u7rr4hy9t/Z0Vq3j83mqe5hOGdqtAsze8AL1AC
 CqYgCDAbyD0qsTjJICLGGsPPJALxf056nIxMA5XhI5y7z+xLzyckwy2xmAVPlKNlxf7+
 suL7o1TSavq3oS3Xcd/5IpnFdn3lYKxNlIgXgciL9IVIhYf+N4Fxge6fRfyC2Au6jU61
 Di5w0ReLvzgLYyuZKSAgMLMxy8OerTEi1KsyqcRFDNU0xTgZqa3iZcMuyE5wf5/c8V/E
 V1Tz4D7UNEI52jvVTRsnAcYQfnSVy9NIB2ag9I6ttroESSlWDmAu6v8zZ5WQ+PSF62Sq
 g4mw==
X-Gm-Message-State: AOAM533W+dhG+BXMrjFHywjzYPBBLh5TL9IW9DtFBEs88706ay2SVF2S
 +U8Yw40drp6ZzUfJUoNcTZg5w5CLxsDFbbJD2PY=
X-Google-Smtp-Source: ABdhPJxovPQAuals3XWwgHv+NwEiSdGXD8OvWQpzp9t562ss0KanKWh03FYFggeI1sD+436S79X2jy4SpfTtcg3xWJE=
X-Received: by 2002:a37:4388:: with SMTP id q130mr3468485qka.460.1624359349830; 
 Tue, 22 Jun 2021 03:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
 <20210622093418.153400-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210622093418.153400-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 22 Jun 2021 11:55:23 +0100
Message-ID: <CAM0jSHOZKGZ_yGyV0HC8FNSX2yQWF95jirihMKhXE353jr-a2w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm/i915/ttm: Use TTM for system memory
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Jun 2021 at 10:34, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> For discrete, use TTM for both cached and WC system memory. That means
> we currently rely on the TTM memory accounting / shrinker. For cached
> system memory we should consider remaining shmem-backed, which can be
> implemented from our ttm_tt_populate callback. We can then also reuse our
> own very elaborate shrinker for that memory.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
> v2:
> - Fix IS_ERR_OR_NULL() check to IS_ERR() (Reported by Matthew Auld)
> v3:
> - Commit message typo fix
> v6:
> - Fix TODO:s for supporting system memory with TTM.
> - Update the object GEM region after a TTM move if compatible.
> - Add a couple of warnings for shmem on DGFX.
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  3 ++
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 51 +++++++++++++++++-----
>  drivers/gpu/drm/i915/i915_drv.h            |  3 --
>  drivers/gpu/drm/i915/intel_memory_region.c |  7 ++-
>  drivers/gpu/drm/i915/intel_memory_region.h |  8 ++++
>  5 files changed, 58 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/=
i915/gem/i915_gem_shmem.c
> index 7aa1c95c7b7d..3648ae1d6628 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -284,6 +284,7 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_o=
bject *obj,
>                                 bool needs_clflush)
>  {
>         GEM_BUG_ON(obj->mm.madv =3D=3D __I915_MADV_PURGED);
> +       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
>
>         if (obj->mm.madv =3D=3D I915_MADV_DONTNEED)
>                 obj->mm.dirty =3D false;
> @@ -302,6 +303,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_=
gem_object *obj, struct sg_
>         struct pagevec pvec;
>         struct page *page;
>
> +       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
>         __i915_gem_object_release_shmem(obj, pages, true);
>
>         i915_gem_gtt_finish_pages(obj, pages);
> @@ -560,6 +562,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i91=
5_private *dev_priv,
>         resource_size_t offset;
>         int err;
>
> +       GEM_WARN_ON(IS_DGFX(dev_priv));
>         obj =3D i915_gem_object_create_shmem(dev_priv, round_up(size, PAG=
E_SIZE));
>         if (IS_ERR(obj))
>                 return obj;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 966b292d07da..07097f150065 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -286,6 +286,25 @@ static void i915_ttm_adjust_gem_after_move(struct dr=
m_i915_gem_object *obj)
>  {
>         struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
>         unsigned int cache_level;
> +       unsigned int i;
> +
> +       /*
> +        * If object was moved to an allowable region, update the object
> +        * region to consider it migrated. Note that if it's currently no=
t
> +        * in an allowable region, it's evicted and we don't update the
> +        * object region.
> +        */
> +       if (intel_region_to_ttm_type(obj->mm.region) !=3D bo->resource->m=
em_type) {
> +               for (i =3D 0; i < obj->mm.n_placements; ++i) {
> +                       struct intel_memory_region *mr =3D obj->mm.placem=
ents[i];
> +
> +                       if (intel_region_to_ttm_type(mr) =3D=3D bo->resou=
rce->mem_type &&
> +                           mr !=3D obj->mm.region) {
> +                               intel_memory_region_put(obj->mm.region);
> +                               obj->mm.region =3D intel_memory_region_ge=
t(mr);

break;?

i915_gem_object_{init, release}_memory_region?

There is also the region_link stuff, but I guess we can nuke that?


> +                       }
> +               }
> +       }
>
>         obj->mem_flags &=3D ~(I915_BO_FLAG_STRUCT_PAGE | I915_BO_FLAG_IOM=
EM);
>
> @@ -615,13 +634,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_ob=
ject *obj)
>         /* Move to the requested placement. */
>         i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
>
> -       /*
> -        * For now we support LMEM only with TTM.
> -        * TODO: Remove with system support
> -        */
> -       GEM_BUG_ON(requested.mem_type < I915_PL_LMEM0 ||
> -                  busy[0].mem_type < I915_PL_LMEM0);
> -
>         /* First try only the requested placement. No eviction. */
>         real_num_busy =3D fetch_and_zero(&placement.num_busy_placement);
>         ret =3D ttm_bo_validate(bo, &placement, &ctx);
> @@ -635,9 +647,6 @@ static int i915_ttm_get_pages(struct drm_i915_gem_obj=
ect *obj)
>                     ret =3D=3D -EAGAIN)
>                         return ret;
>
> -               /* TODO: Remove this when we support system as TTM. */
> -               real_num_busy =3D 1;
> -
>                 /*
>                  * If the initial attempt fails, allow all accepted place=
ments,
>                  * evicting if necessary.
> @@ -872,3 +881,25 @@ int __i915_gem_ttm_object_init(struct intel_memory_r=
egion *mem,
>
>         return 0;
>  }
> +
> +static const struct intel_memory_region_ops ttm_system_region_ops =3D {
> +       .init_object =3D __i915_gem_ttm_object_init,
> +};
> +
> +struct intel_memory_region *
> +i915_gem_ttm_system_setup(struct drm_i915_private *i915,
> +                         u16 type, u16 instance)
> +{
> +       struct intel_memory_region *mr;
> +
> +       mr =3D intel_memory_region_create(i915, 0,
> +                                       totalram_pages() << PAGE_SHIFT,
> +                                       PAGE_SIZE, 0,
> +                                       type, instance,
> +                                       &ttm_system_region_ops);
> +       if (IS_ERR(mr))
> +               return mr;
> +
> +       intel_memory_region_set_name(mr, "system-ttm");
> +       return mr;
> +}
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 01e11fe38642..bfbfbae57573 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1751,9 +1751,6 @@ void i915_gem_cleanup_userptr(struct drm_i915_priva=
te *dev_priv);
>  void i915_gem_init_early(struct drm_i915_private *dev_priv);
>  void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
>
> -struct intel_memory_region *i915_gem_shmem_setup(struct drm_i915_private=
 *i915,
> -                                                u16 type, u16 instance);
> -
>  static inline void i915_gem_drain_freed_objects(struct drm_i915_private =
*i915)
>  {
>         /*
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm=
/i915/intel_memory_region.c
> index df59f884d37c..779eb2fa90b6 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -173,7 +173,12 @@ int intel_memory_regions_hw_probe(struct drm_i915_pr=
ivate *i915)
>                 instance =3D intel_region_map[i].instance;
>                 switch (type) {
>                 case INTEL_MEMORY_SYSTEM:
> -                       mem =3D i915_gem_shmem_setup(i915, type, instance=
);
> +                       if (IS_DGFX(i915))
> +                               mem =3D i915_gem_ttm_system_setup(i915, t=
ype,
> +                                                               instance)=
;
> +                       else
> +                               mem =3D i915_gem_shmem_setup(i915, type,
> +                                                          instance);
>                         break;
>                 case INTEL_MEMORY_STOLEN_LOCAL:
>                         mem =3D i915_gem_stolen_lmem_setup(i915, type, in=
stance);
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm=
/i915/intel_memory_region.h
> index 2be8433d373a..b1b9e461d53b 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -125,4 +125,12 @@ intel_memory_region_set_name(struct intel_memory_reg=
ion *mem,
>  int intel_memory_region_reserve(struct intel_memory_region *mem,
>                                 resource_size_t offset,
>                                 resource_size_t size);
> +
> +struct intel_memory_region *
> +i915_gem_ttm_system_setup(struct drm_i915_private *i915,
> +                         u16 type, u16 instance);
> +struct intel_memory_region *
> +i915_gem_shmem_setup(struct drm_i915_private *i915,
> +                    u16 type, u16 instance);
> +
>  #endif
> --
> 2.31.1
>

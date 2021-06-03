Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3F5399E0D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 11:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFF76ECEE;
	Thu,  3 Jun 2021 09:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4CD6E84A;
 Thu,  3 Jun 2021 09:48:43 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id v4so3967419qtp.1;
 Thu, 03 Jun 2021 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dSSOsIAjSoeXvheN+mVsxIwibgECqv9CPqBUuH9ed0I=;
 b=UAmWHQ/oOpxa7fk0NbJAONnXxmoo07blTHjMxfwApTfOIpPaHQcZ2F27b2cNLv0RGO
 hvY+bbYelWJRhwLWBzic0gB55D2fS5n0CJX5a1Rk3qyIgQkKKHpwKqO1mpv9gq2/yXZD
 QvkE4AVHlreR1OTecrMJHzFaSxWhcbMxIYyDMh2SoQEad6MRF4DJhhFazedE+APZB/zJ
 0Vt9AuJzc6AdhwrHsTQxfdLB1eIeBfKdT2DlcMRrTZnmG4vIjVlfb4tGHhHWrD8g8Pit
 JLyvUa2EJs2qf0d/wDEsHLuP15PLhDipTYjCYevz3wf7U49OdYhDz7RxWPAHiqCCDkZP
 3jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dSSOsIAjSoeXvheN+mVsxIwibgECqv9CPqBUuH9ed0I=;
 b=PJwcQO5v9MCzB5otrb42CmycRzlQtR3twiHDEBO4EoRHGbLRdFm6OT6JKFgtoDpe4/
 tiOsfYh7V+mE5eywj7KAxEgrKa1hmt642noX4kD32JxKbAVyTSkgYy0ErKsxoWlRf3di
 7UXpW/IYQyYa0G9fMp1xTuazNEv6HFi+WSQvt6a21XQv8zgM0F6S7C4Wtg7osjpccNFx
 52q7Vv3JIeWRgMPVVH7HErdzG7QOYFTAFhYbnLvCcpVQpMbLQZhqROPdLl0sAqSpAX1S
 YeJpQzKLFi4AZGb/cksTNboG7eeGLzuMCbpz4etegJEXV7jIG77LwaXBjQmO1ZUxUGpK
 LP/w==
X-Gm-Message-State: AOAM533CwhWrZpV+AUPNd9Hz7PTwdSR/YqJzZoW0CqeUi37RqOZdfnWZ
 P+hqd/SSHcnKjGCg6U9uCkIlOmyfDTm1dhhqilLvj5pKoyFG/w==
X-Google-Smtp-Source: ABdhPJwFmWQaQnmwql0RxeJR4wLEoltqz8xhFgdBcFzuBjvtMXLfY3skExCasCEm+V4kRpeF39e6k/rzVqHcG3OMIlI=
X-Received: by 2002:ac8:75d4:: with SMTP id z20mr27860812qtq.265.1622713722146; 
 Thu, 03 Jun 2021 02:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
 <20210602170716.280491-5-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210602170716.280491-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 3 Jun 2021 10:48:15 +0100
Message-ID: <CAM0jSHPfNhw3e9y4eD5X+Bk-i1nkZqb1Tw194mhOFNGbHZD8xw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915/ttm: Use TTM for system memory
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

On Wed, 2 Jun 2021 at 18:08, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> For discrete, use TTM for both cached and WC system memory. That means
> we currently rely on the TTM memory accounting / shrinker. For cached
> system memory we should consider remaining shmem-backed, which can be
> implemented from our ttm_tt_populate calback. We can then also reuse our
> own very elaborate shrinker for that memory.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_drv.h            |  3 ---
>  drivers/gpu/drm/i915/intel_memory_region.c |  7 ++++++-
>  drivers/gpu/drm/i915/intel_memory_region.h |  8 ++++++++
>  4 files changed, 36 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 8e1c01168c6d..42e89bf43708 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -755,3 +755,25 @@ int __i915_gem_ttm_object_init(struct intel_memory_r=
egion *mem,
>         /* i915 wants -ENXIO when out of memory region space. */
>         return (ret =3D=3D -ENOSPC) ? -ENXIO : ret;
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
> +       if (IS_ERR_OR_NULL(mr))

region_create can't return NULL.

> +               return mr;
> +
> +       intel_memory_region_set_name(mr, "system-ttm");
> +       return mr;
> +}
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 524aaeb0e842..c6cc16ccce36 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1768,9 +1768,6 @@ void i915_gem_cleanup_userptr(struct drm_i915_priva=
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
> index bd27e897d4d0..a42bb36c2aea 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -220,7 +220,12 @@ int intel_memory_regions_hw_probe(struct drm_i915_pr=
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
> index 7b5fa97c0b59..4d084424b55c 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -142,4 +142,12 @@ void intel_memory_region_unreserve(struct intel_memo=
ry_region *mem);
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
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9164B6E674D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FC210E0CE;
	Tue, 18 Apr 2023 14:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3643610E0CE;
 Tue, 18 Apr 2023 14:39:44 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-187af4a5453so311353fac.1; 
 Tue, 18 Apr 2023 07:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681828783; x=1684420783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEuHVncqqUhka1pBSMS3AZALEN9uCRe/jjmR6d6s9IA=;
 b=L069yzcBiCG1gXlb6xG6xVYHicPj7qWHwBxU9Geq8BOWBooWnT5ScmSLNuL+/td7Aa
 2+K2Q1UA1w5pGHZWBeO8mE1672qsDnx3xfIkPeYCSzd5yrqnNOUeFbz8dTVoU7FTqZNm
 0WaAghrj5DSzuRSm0WWmIZ3d2Fm+1bAafsruam4H9h9F8gHhfZ+XqGAkxKMdDn4tmLLt
 GzCucKhMDpA9LGTtt397lGGuQj7Rzkc6XBNEjXpcNtZs8cbQ2v70GqELegOiZAA02WP7
 x/PO1zsijTMa79XO96iMhTv7l9ScVFtMaXmusgyY9gma5N5wj7Z96Y8UQH9yaVSYBDNn
 hwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681828783; x=1684420783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEuHVncqqUhka1pBSMS3AZALEN9uCRe/jjmR6d6s9IA=;
 b=g9xD3K1aPKw4Q/vXxmQxjuY+0QNLUmuu7deZ56ME4PGQle9DjYkZ7abFW7sHgcjOvq
 LjsCi3qvNPVy8CYMuukWydHD6F/27k/VEE9StAL1eDAUR5f50xou0H6Q6y7ZLWV81pdu
 RZnRHrovDTpO/Mm9r03XWH5f8BAe7UO5A/DbWkjTsmTSA3uUD99Cn8xKH+vPHbvQIRSo
 8SnMEpotg/namdP2nLGOcuKJjUBsTZ5eTYbOJt+VgMi6XjtARq023Ahqf8CaF4f3pO0m
 4Q++SSh0xh6AlLjcokddP52wC9WPFKHHCBzyY66aUbvyvmmTWZ9g+3YtpmUBOIxKeuvP
 X0AQ==
X-Gm-Message-State: AAQBX9cCE5Nhjybn2AMLAvt6n6VXEO65IBT51e2gRaRCIiP/ADdEkgBT
 uwU7Lje7HMz3REkhuUJoY0IcRIHG8tcDPB8LVfg=
X-Google-Smtp-Source: AKy350bjI5KqKGxQfFxus8fP3irjszTb0pcZI2HKc9DWr1NSLpqwpZTBw8cR7x2WGa3+WG5h8Z5kNEQlR1y/XEVsSQ0=
X-Received: by 2002:a05:6870:3906:b0:187:9bf2:af63 with SMTP id
 b6-20020a056870390600b001879bf2af63mr1206730oap.5.1681828783037; Tue, 18 Apr
 2023 07:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-7-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230417155613.4143258-7-tvrtko.ursulin@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Apr 2023 07:39:32 -0700
Message-ID: <CAF6AEGuKovR_VL2UwyRddZ_d-AmZK3usC2zJ3Lb=sq-kN6EmAQ@mail.gmail.com>
Subject: Re: [RFC 6/6] drm/i915: Implement fdinfo memory stats printing
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Show how more driver specific set of memory stats could be shown,
> more specifically where object can reside in multiple regions, showing al=
l
> the supported stats, and where there is more to show than just user visib=
le
> objects.
>
> WIP...
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c     |   5 ++
>  drivers/gpu/drm/i915/i915_drm_client.c | 102 +++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_drm_client.h |   8 ++
>  drivers/gpu/drm/i915/i915_drv.h        |   2 +
>  4 files changed, 117 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 6493548c69bf..4c70206cbc27 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1806,6 +1806,11 @@ static const struct drm_driver i915_drm_driver =3D=
 {
>         .dumb_create =3D i915_gem_dumb_create,
>         .dumb_map_offset =3D i915_gem_dumb_mmap_offset,
>
> +#ifdef CONFIG_PROC_FS
> +       .query_fdinfo_memory_regions =3D i915_query_fdinfo_memory_regions=
,
> +       .query_fdinfo_memory_stats =3D i915_query_fdinfo_memory_stats,
> +#endif
> +
>         .ioctls =3D i915_ioctls,
>         .num_ioctls =3D ARRAY_SIZE(i915_ioctls),
>         .fops =3D &i915_driver_fops,
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i91=
5/i915_drm_client.c
> index c654984189f7..65857c68bdb3 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_print.h>
>
>  #include "gem/i915_gem_context.h"
> +#include "intel_memory_region.h"
>  #include "i915_drm_client.h"
>  #include "i915_file_private.h"
>  #include "i915_gem.h"
> @@ -112,4 +113,105 @@ void i915_drm_client_fdinfo(struct drm_printer *p, =
struct drm_file *file)
>         for (i =3D 0; i < ARRAY_SIZE(uabi_class_names); i++)
>                 show_client_class(p, i915, file_priv->client, i);
>  }
> +
> +char **
> +i915_query_fdinfo_memory_regions(struct drm_device *dev, unsigned int *n=
um)
> +{
> +       struct drm_i915_private *i915 =3D to_i915(dev);
> +       struct intel_memory_region *mr;
> +       enum intel_region_id id;
> +
> +       /* FIXME move to init */
> +       for_each_memory_region(mr, i915, id) {
> +               if (!i915->mm.region_names[id])
> +                       i915->mm.region_names[id] =3D mr->name;
> +       }
> +
> +       *num =3D id;
> +
> +       return i915->mm.region_names;
> +}
> +
> +static void
> +add_obj(struct drm_i915_gem_object *obj, struct drm_fdinfo_memory_stat *=
stats)
> +{
> +        struct intel_memory_region *mr;
> +       u64 sz =3D obj->base.size;
> +        enum intel_region_id id;
> +       unsigned int i;
> +
> +       if (!obj)
> +               return;
> +
> +       /* Attribute size and shared to all possible memory regions. */
> +       for (i =3D 0; i < obj->mm.n_placements; i++) {
> +               mr =3D obj->mm.placements[i];
> +               id =3D mr->id;
> +
> +               stats[id].size +=3D sz;

This implies that summing up all of the categories is not the same as
the toplevel stats that I was proposing

BR,
-R

> +               if (obj->base.handle_count > 1)
> +                       stats[id].shared +=3D sz;
> +       }
> +
> +       /* Attribute other categories to only the current region. */
> +       mr =3D obj->mm.region;
> +       if (mr)
> +               id =3D mr->id;
> +       else
> +               id =3D INTEL_REGION_SMEM;
> +
> +       if (!i915_gem_object_has_pages(obj))
> +               return;
> +
> +       stats[id].resident +=3D sz;
> +
> +       if (!dma_resv_test_signaled(obj->base.resv, dma_resv_usage_rw(tru=
e)))
> +               stats[id].active +=3D sz;
> +       else if (i915_gem_object_is_shrinkable(obj) &&
> +               obj->mm.madv =3D=3D I915_MADV_DONTNEED)
> +               stats[id].purgeable +=3D sz;
> +}
> +
> +void
> +i915_query_fdinfo_memory_stats(struct drm_file *file,
> +                              struct drm_fdinfo_memory_stat *stats)
> +{
> +       struct drm_i915_file_private *file_priv =3D file->driver_priv;
> +       struct i915_drm_client *client =3D file_priv->client;
> +       struct drm_gem_object *drm_obj;
> +       struct i915_gem_context *ctx;
> +       int id;
> +
> +       /*
> +        * FIXME - we can do this better and in fewer passes if we are to=
 start
> +        * exporting proper memory stats.
> +        */
> +
> +       /* User created objects */
> +       spin_lock(&file->table_lock);
> +       idr_for_each_entry(&file->object_idr, drm_obj, id)
> +               add_obj(to_intel_bo(drm_obj), stats);
> +       spin_unlock(&file->table_lock);
> +
> +       /* Contexts, rings, timelines, page tables, ... */
> +       rcu_read_lock();
> +       list_for_each_entry_rcu(ctx, &client->ctx_list, client_link) {
> +               struct i915_gem_engines_iter it;
> +               struct intel_context *ce;
> +
> +               for_each_gem_engine(ce, rcu_dereference(ctx->engines), it=
) {
> +                       /* FIXME races?! */
> +                       if (ce->state)
> +                               add_obj(ce->state->obj, stats);
> +                       if (ce->timeline && ce->timeline->hwsp_ggtt)
> +                               add_obj(ce->timeline->hwsp_ggtt->obj, sta=
ts);
> +                       if (ce->ring && ce->ring->vma)
> +                               add_obj(ce->ring->vma->obj, stats);
> +               }
> +
> +               /* TODO  vtx->vm page table backing objects */
> +       }
> +       rcu_read_unlock();
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i91=
5/i915_drm_client.h
> index 4c18b99e10a4..622936c51903 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -14,7 +14,10 @@
>
>  #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>
> +struct drm_device;
>  struct drm_file;
> +struct drm_fdinfo_memory_stat;
> +struct drm_gem_object;
>  struct drm_printer;
>
>  struct i915_drm_client {
> @@ -49,6 +52,11 @@ struct i915_drm_client *i915_drm_client_alloc(void);
>
>  #ifdef CONFIG_PROC_FS
>  void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file=
);
> +
> +char **i915_query_fdinfo_memory_regions(struct drm_device *dev,
> +                                       unsigned int *num);
> +void i915_query_fdinfo_memory_stats(struct drm_file *file,
> +                                   struct drm_fdinfo_memory_stat *stats)=
;
>  #endif
>
>  #endif /* !__I915_DRM_CLIENT_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index eb739fb9cdbb..b84d2f0ed2cb 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -161,6 +161,8 @@ struct i915_gem_mm {
>
>         struct intel_memory_region *regions[INTEL_REGION_UNKNOWN];
>
> +       char *region_names[INTEL_REGION_UNKNOWN];
> +
>         struct notifier_block oom_notifier;
>         struct notifier_block vmap_notifier;
>         struct shrinker shrinker;
> --
> 2.37.2
>

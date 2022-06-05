Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE89453DDB0
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 20:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7164110E260;
	Sun,  5 Jun 2022 18:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9AC10E0D0;
 Sun,  5 Jun 2022 18:32:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m26so5674576wrb.4;
 Sun, 05 Jun 2022 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4miB27bPawnBO7hdTn4tfmuZUDMiNK8Gc1NK7FWgjpo=;
 b=FnRsXJXRlazZxi0q72NdDv4eRJ3X0oVxBxX3G9sipLLR6wRFdmNbBuvXHdgt+0Co8W
 8Gmd+Rk6eN+To1FdgJ7arqnm7BkmywB1JcRqIaoy3B5n54dOyb+8w+nLL1QEl9N8PQ4q
 Z/0KlZwysqRmmHnffrbcAcz80+9yPlCnRL0y2EuIZGpbXA44lCff2T3H4dlFzrcyXgLb
 xp/dPKK8JvkxXOCzm9yT+f9XfKQU9txvnKOYMo5HcF/KeMaK9Tx/c6s9BhsuPwHtAPxF
 adgl1DuPTpbIhwW+F98T6hFk8phQL/N63pSNl9D85M6RQdrTwT4KTO/OaolSfyeit3Y+
 Pu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4miB27bPawnBO7hdTn4tfmuZUDMiNK8Gc1NK7FWgjpo=;
 b=5x9oAMQxazsyhT7BrfCHUAT908Dlxqj/6PCT6PBo/N07BxMo1xRcRBkeecIgOCP8dH
 eQTIyK81JUU4x+QJ9Ck9DYKg3j6HGT2QJi8TIL79gqpHhJ6+Eq+U7PqLQUBUn/hWUzkq
 3huWjRUwr9sXeaxXlHfVm3naBOWlUPjuJyE/jiT6arf2iuG+8+B1odi6XnByXAl1kfHl
 IAF4dhToDF5rLO+GBLfJDEs4pDUhDVcCuYhzsrrZ/1i2lUM3wtGfG4WXJiSKOFCvdToc
 KLRFsRoHQVEJIl2Jm+hnfeVlbYARjRHrCIbOsXtSq5S+Gqloc2mppAyqoQoYGjGyPgS3
 /5Rw==
X-Gm-Message-State: AOAM530ivv0vy9JwV9uDGP2X2j+nqomcyT1zId2ZnCF5HpaA/7AA7WBO
 25keNQR+VThUB0SL4Os4c/umiZMlY88W1s2lBno=
X-Google-Smtp-Source: ABdhPJyLQ/VoNnGYstE4SSQyFQKDNp3FbMvEDbzKRX319SYBzYFmygkFgs1/SBUZfckuuffZfZmUnKZy6pVSECjKVZw=
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr17573910wrw.679.1654453953012; Sun, 05
 Jun 2022 11:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-18-dmitry.osipenko@collabora.com>
 <CAKMK7uHQ+iMkXtrsCWiJL9X1AM9Xkq-wNmj=hhfnenf0r9717g@mail.gmail.com>
In-Reply-To: <CAKMK7uHQ+iMkXtrsCWiJL9X1AM9Xkq-wNmj=hhfnenf0r9717g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 5 Jun 2022 11:32:35 -0700
Message-ID: <CAF6AEGtVGW8FTuFV0Gt9jx33My3ebdbUAcYQwVGvevzByCpecw@mail.gmail.com>
Subject: Re: [PATCH v6 17/22] drm/shmem-helper: Add generic memory shrinker
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Rob Clark <robdclark@chromium.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 virtualization@lists.linux-foundation.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 5, 2022 at 9:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, 27 May 2022 at 01:55, Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
> >
> > Introduce a common DRM SHMEM shrinker framework that allows to reduce
> > code duplication among DRM drivers by replacing theirs custom shrinker
> > implementations with the generic shrinker.
> >
> > In order to start using DRM SHMEM shrinker drivers should:
> >
> > 1. Implement new evict() shmem object callback.
> > 2. Register shrinker using drm_gem_shmem_shrinker_register(drm_device).
> > 3. Use drm_gem_shmem_set_purgeable(shmem) and alike API functions to
> >    activate shrinking of shmem GEMs.
> >
> > This patch is based on a ideas borrowed from Rob's Clark MSM shrinker,
> > Thomas' Zimmermann variant of SHMEM shrinker and Intel's i915 shrinker.
> >
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>
> So I guess I get a price for being blind since forever, because this
> thing existed since at least 2013. I just stumbled over
> llist_lru.[hc], a purpose built list helper for shrinkers. I think we
> should try to adopt that so that our gpu shrinkers look more like
> shrinkers for everything else.

followup from a bit of irc discussion w/ danvet about list_lru:

* It seems to be missing a way to bail out of iteration before
  nr_to_scan is hit.. which is going to be inconvenient if you
  want to allow active bos on the LRU but bail scanning once
  you encounter the first one.

* Not sure if the numa node awareness is super useful for GEM
  bos

First issue is perhaps not too hard to fix.  But maybe a better
idea is a drm_gem_lru helper type thing which is more tailored
to GEM buffers?

BR,
-R

> Apologies for this, since I fear this might cause a bit of churn.
> Hopefully it's all contained to the list manipulation code in shmem
> helpers, I don't think this should leak any further.
> -Daniel
>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c        | 540 ++++++++++++++++--
> >  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   9 +-
> >  drivers/gpu/drm/virtio/virtgpu_drv.h          |   3 +
> >  include/drm/drm_device.h                      |   4 +
> >  include/drm/drm_gem_shmem_helper.h            |  87 ++-
> >  5 files changed, 594 insertions(+), 49 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 555fe212bd98..4cd0b5913492 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -126,6 +126,42 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> >
> > +static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
> > +{
> > +       return (shmem->madv >= 0) && shmem->evict &&
> > +               shmem->eviction_enabled && shmem->pages_use_count &&
> > +               !shmem->pages_pin_count && !shmem->base.dma_buf &&
> > +               !shmem->base.import_attach && shmem->sgt && !shmem->evicted;
> > +}
> > +
> > +static void
> > +drm_gem_shmem_update_pages_state(struct drm_gem_shmem_object *shmem)
> > +{
> > +       struct drm_gem_object *obj = &shmem->base;
> > +       struct drm_gem_shmem_shrinker *gem_shrinker = obj->dev->shmem_shrinker;
> > +
> > +       dma_resv_assert_held(shmem->base.resv);
> > +
> > +       if (!gem_shrinker || obj->import_attach)
> > +               return;
> > +
> > +       mutex_lock(&gem_shrinker->lock);
> > +
> > +       if (drm_gem_shmem_is_evictable(shmem) ||
> > +           drm_gem_shmem_is_purgeable(shmem))
> > +               list_move_tail(&shmem->madv_list, &gem_shrinker->lru_evictable);
> > +       else if (shmem->madv < 0)
> > +               list_del_init(&shmem->madv_list);
> > +       else if (shmem->evicted)
> > +               list_move_tail(&shmem->madv_list, &gem_shrinker->lru_evicted);
> > +       else if (!shmem->pages)
> > +               list_del_init(&shmem->madv_list);
> > +       else
> > +               list_move_tail(&shmem->madv_list, &gem_shrinker->lru_pinned);
> > +
> > +       mutex_unlock(&gem_shrinker->lock);
> > +}
> > +
> >  /**
> >   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
> >   * @shmem: shmem GEM object to free
> > @@ -142,6 +178,9 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >         } else {
> >                 dma_resv_lock(shmem->base.resv, NULL);
> >
> > +               /* take out shmem GEM object from the memory shrinker */
> > +               drm_gem_shmem_madvise(shmem, -1);
> > +
> >                 WARN_ON(shmem->vmap_use_count);
> >
> >                 if (shmem->sgt) {
> > @@ -150,7 +189,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >                         sg_free_table(shmem->sgt);
> >                         kfree(shmem->sgt);
> >                 }
> > -               if (shmem->pages)
> > +               if (shmem->pages_use_count)
> >                         drm_gem_shmem_put_pages(shmem);
> >
> >                 WARN_ON(shmem->pages_use_count);
> > @@ -163,18 +202,82 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
> >
> > -static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> > +/**
> > + * drm_gem_shmem_set_evictable() - Make GEM evictable by memory shrinker
> > + * @shmem: shmem GEM object
> > + *
> > + * Tell memory shrinker that this GEM can be evicted. Initially eviction is
> > + * disabled for all GEMs. If GEM was purged, then -ENOMEM is returned.
> > + *
> > + * Returns:
> > + * 0 on success or a negative error code on failure.
> > + */
> > +int drm_gem_shmem_set_evictable(struct drm_gem_shmem_object *shmem)
> > +{
> > +       dma_resv_lock(shmem->base.resv, NULL);
> > +
> > +       if (shmem->madv < 0)
> > +               return -ENOMEM;
> > +
> > +       shmem->eviction_enabled = true;
> > +
> > +       dma_resv_unlock(shmem->base.resv);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_set_evictable);
> > +
> > +/**
> > + * drm_gem_shmem_set_purgeable() - Make GEM purgeable by memory shrinker
> > + * @shmem: shmem GEM object
> > + *
> > + * Tell memory shrinker that this GEM can be purged. Initially purging is
> > + * disabled for all GEMs. If GEM was purged, then -ENOMEM is returned.
> > + *
> > + * Returns:
> > + * 0 on success or a negative error code on failure.
> > + */
> > +int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem)
> > +{
> > +       dma_resv_lock(shmem->base.resv, NULL);
> > +
> > +       if (shmem->madv < 0)
> > +               return -ENOMEM;
> > +
> > +       shmem->purge_enabled = true;
> > +
> > +       drm_gem_shmem_update_pages_state(shmem);
> > +
> > +       dma_resv_unlock(shmem->base.resv);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_set_purgeable);
> > +
> > +static int
> > +drm_gem_shmem_acquire_pages(struct drm_gem_shmem_object *shmem)
> >  {
> >         struct drm_gem_object *obj = &shmem->base;
> >         struct page **pages;
> >
> > -       if (shmem->pages_use_count++ > 0)
> > +       dma_resv_assert_held(shmem->base.resv);
> > +
> > +       if (shmem->madv < 0) {
> > +               WARN_ON(shmem->pages);
> > +               return -ENOMEM;
> > +       }
> > +
> > +       if (shmem->pages) {
> > +               WARN_ON(!shmem->evicted);
> >                 return 0;
> > +       }
> > +
> > +       if (WARN_ON(!shmem->pages_use_count))
> > +               return -EINVAL;
> >
> >         pages = drm_gem_get_pages(obj);
> >         if (IS_ERR(pages)) {
> >                 DRM_DEBUG_KMS("Failed to get pages (%ld)\n", PTR_ERR(pages));
> > -               shmem->pages_use_count = 0;
> >                 return PTR_ERR(pages);
> >         }
> >
> > @@ -193,6 +296,58 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> >         return 0;
> >  }
> >
> > +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> > +{
> > +       int err;
> > +
> > +       dma_resv_assert_held(shmem->base.resv);
> > +
> > +       if (shmem->madv < 0)
> > +               return -ENOMEM;
> > +
> > +       if (shmem->pages_use_count++ > 0) {
> > +               err = drm_gem_shmem_swap_in(shmem);
> > +               if (err)
> > +                       goto err_zero_use;
> > +
> > +               return 0;
> > +       }
> > +
> > +       err = drm_gem_shmem_acquire_pages(shmem);
> > +       if (err)
> > +               goto err_zero_use;
> > +
> > +       drm_gem_shmem_update_pages_state(shmem);
> > +
> > +       return 0;
> > +
> > +err_zero_use:
> > +       shmem->pages_use_count = 0;
> > +
> > +       return err;
> > +}
> > +
> > +static void
> > +drm_gem_shmem_release_pages(struct drm_gem_shmem_object *shmem)
> > +{
> > +       struct drm_gem_object *obj = &shmem->base;
> > +
> > +       if (!shmem->pages) {
> > +               WARN_ON(!shmem->evicted && shmem->madv >= 0);
> > +               return;
> > +       }
> > +
> > +#ifdef CONFIG_X86
> > +       if (shmem->map_wc)
> > +               set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> > +#endif
> > +
> > +       drm_gem_put_pages(obj, shmem->pages,
> > +                         shmem->pages_mark_dirty_on_put,
> > +                         shmem->pages_mark_accessed_on_put);
> > +       shmem->pages = NULL;
> > +}
> > +
> >  /*
> >   * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
> >   * @shmem: shmem GEM object
> > @@ -201,8 +356,6 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> >   */
> >  void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
> >  {
> > -       struct drm_gem_object *obj = &shmem->base;
> > -
> >         dma_resv_assert_held(shmem->base.resv);
> >
> >         if (WARN_ON_ONCE(!shmem->pages_use_count))
> > @@ -211,15 +364,9 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
> >         if (--shmem->pages_use_count > 0)
> >                 return;
> >
> > -#ifdef CONFIG_X86
> > -       if (shmem->map_wc)
> > -               set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> > -#endif
> > +       drm_gem_shmem_release_pages(shmem);
> >
> > -       drm_gem_put_pages(obj, shmem->pages,
> > -                         shmem->pages_mark_dirty_on_put,
> > -                         shmem->pages_mark_accessed_on_put);
> > -       shmem->pages = NULL;
> > +       drm_gem_shmem_update_pages_state(shmem);
> >  }
> >  EXPORT_SYMBOL(drm_gem_shmem_put_pages);
> >
> > @@ -235,11 +382,17 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
> >   */
> >  int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
> >  {
> > +       int ret;
> > +
> >         dma_resv_assert_held(shmem->base.resv);
> >
> >         WARN_ON(shmem->base.import_attach);
> >
> > -       return drm_gem_shmem_get_pages(shmem);
> > +       ret = drm_gem_shmem_get_pages(shmem);
> > +       if (!ret)
> > +               shmem->pages_pin_count++;
> > +
> > +       return ret;
> >  }
> >  EXPORT_SYMBOL(drm_gem_shmem_pin);
> >
> > @@ -257,6 +410,8 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
> >         WARN_ON(shmem->base.import_attach);
> >
> >         drm_gem_shmem_put_pages(shmem);
> > +
> > +       shmem->pages_pin_count--;
> >  }
> >  EXPORT_SYMBOL(drm_gem_shmem_unpin);
> >
> > @@ -299,7 +454,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
> >                         return 0;
> >                 }
> >
> > -               ret = drm_gem_shmem_get_pages(shmem);
> > +               ret = drm_gem_shmem_pin(shmem);
> >                 if (ret)
> >                         goto err_zero_use;
> >
> > @@ -322,7 +477,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
> >
> >  err_put_pages:
> >         if (!obj->import_attach)
> > -               drm_gem_shmem_put_pages(shmem);
> > +               drm_gem_shmem_unpin(shmem);
> >  err_zero_use:
> >         shmem->vmap_use_count = 0;
> >
> > @@ -359,7 +514,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
> >                         return;
> >
> >                 vunmap(shmem->vaddr);
> > -               drm_gem_shmem_put_pages(shmem);
> > +               drm_gem_shmem_unpin(shmem);
> >         }
> >
> >         shmem->vaddr = NULL;
> > @@ -403,41 +558,77 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
> >
> >         madv = shmem->madv;
> >
> > +       drm_gem_shmem_update_pages_state(shmem);
> > +
> >         return (madv >= 0);
> >  }
> >  EXPORT_SYMBOL(drm_gem_shmem_madvise);
> >
> > -void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
> > +/**
> > + * drm_gem_shmem_swap_in() - Moves shmem GEM back to memory and enables
> > + *                           hardware access to the memory.
> > + * @shmem: shmem GEM object
> > + *
> > + * This function moves shmem GEM back to memory if it was previously evicted
> > + * by the memory shrinker. The GEM is ready to use on success.
> > + *
> > + * Returns:
> > + * 0 on success or a negative error code on failure.
> > + */
> > +int drm_gem_shmem_swap_in(struct drm_gem_shmem_object *shmem)
> >  {
> >         struct drm_gem_object *obj = &shmem->base;
> > -       struct drm_device *dev = obj->dev;
> > +       struct sg_table *sgt;
> > +       int err;
> >
> >         dma_resv_assert_held(shmem->base.resv);
> >
> > -       WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
> > +       if (shmem->evicted) {
> > +               err = drm_gem_shmem_acquire_pages(shmem);
> > +               if (err)
> > +                       return err;
> > +
> > +               sgt = drm_gem_shmem_get_sg_table(shmem);
> > +               if (IS_ERR(sgt))
> > +                       return PTR_ERR(sgt);
> > +
> > +               err = dma_map_sgtable(obj->dev->dev, sgt,
> > +                                     DMA_BIDIRECTIONAL, 0);
> > +               if (err) {
> > +                       sg_free_table(sgt);
> > +                       kfree(sgt);
> > +                       return err;
> > +               }
> >
> > -       dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
> > -       sg_free_table(shmem->sgt);
> > -       kfree(shmem->sgt);
> > -       shmem->sgt = NULL;
> > +               shmem->sgt = sgt;
> > +               shmem->evicted = false;
> >
> > -       drm_gem_shmem_put_pages(shmem);
> > +               drm_gem_shmem_update_pages_state(shmem);
> > +       }
> >
> > -       shmem->madv = -1;
> > +       if (!shmem->pages)
> > +               return -ENOMEM;
> >
> > -       drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
> > -       drm_gem_free_mmap_offset(obj);
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_swap_in);
> >
> > -       /* Our goal here is to return as much of the memory as
> > -        * is possible back to the system as we are called from OOM.
> > -        * To do this we must instruct the shmfs to drop all of its
> > -        * backing pages, *now*.
> > -        */
> > -       shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
> > +static void drm_gem_shmem_unpin_pages(struct drm_gem_shmem_object *shmem)
> > +{
> > +       struct drm_gem_object *obj = &shmem->base;
> > +       struct drm_device *dev = obj->dev;
> >
> > -       invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
> > +       if (shmem->evicted)
> > +               return;
> > +
> > +       dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
> > +       drm_gem_shmem_release_pages(shmem);
> > +       drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
> > +
> > +       sg_free_table(shmem->sgt);
> > +       kfree(shmem->sgt);
> > +       shmem->sgt = NULL;
> >  }
> > -EXPORT_SYMBOL(drm_gem_shmem_purge);
> >
> >  /**
> >   * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
> > @@ -488,22 +679,33 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> >         vm_fault_t ret;
> >         struct page *page;
> >         pgoff_t page_offset;
> > +       bool pages_unpinned;
> > +       int err;
> >
> >         /* We don't use vmf->pgoff since that has the fake offset */
> >         page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> >
> >         dma_resv_lock(shmem->base.resv, NULL);
> >
> > -       if (page_offset >= num_pages ||
> > -           WARN_ON_ONCE(!shmem->pages) ||
> > -           shmem->madv < 0) {
> > +       /* Sanity-check that we have the pages pointer when it should present */
> > +       pages_unpinned = (shmem->evicted || shmem->madv < 0 || !shmem->pages_use_count);
> > +       WARN_ON_ONCE(!shmem->pages ^ pages_unpinned);
> > +
> > +       if (page_offset >= num_pages || (!shmem->pages && !shmem->evicted)) {
> >                 ret = VM_FAULT_SIGBUS;
> >         } else {
> > +               err = drm_gem_shmem_swap_in(shmem);
> > +               if (err) {
> > +                       ret = VM_FAULT_OOM;
> > +                       goto unlock;
> > +               }
> > +
> >                 page = shmem->pages[page_offset];
> >
> >                 ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
> >         }
> >
> > +unlock:
> >         dma_resv_unlock(shmem->base.resv);
> >
> >         return ret;
> > @@ -513,13 +715,15 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
> >  {
> >         struct drm_gem_object *obj = vma->vm_private_data;
> >         struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> > -       int ret;
> >
> >         WARN_ON(shmem->base.import_attach);
> >
> >         dma_resv_lock(shmem->base.resv, NULL);
> > -       ret = drm_gem_shmem_get_pages(shmem);
> > -       WARN_ON_ONCE(ret != 0);
> > +
> > +       if (drm_gem_shmem_get_pages(shmem))
> > +               shmem->pages_use_count++;
> > +
> > +       drm_gem_shmem_update_pages_state(shmem);
> >         dma_resv_unlock(shmem->base.resv);
> >
> >         drm_gem_vm_open(vma);
> > @@ -583,6 +787,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
> >  void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
> >                               struct drm_printer *p, unsigned int indent)
> >  {
> > +       drm_printf_indent(p, indent, "eviction_enabled=%d\n", shmem->eviction_enabled);
> > +       drm_printf_indent(p, indent, "purge_enabled=%d\n", shmem->purge_enabled);
> >         drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
> >
> >         if (shmem->base.import_attach)
> > @@ -592,7 +798,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
> >                 drm_printf_indent(p, indent, "vmap_use_count=%u\n",
> >                                   shmem->vmap_use_count);
> >
> > +       drm_printf_indent(p, indent, "evicted=%d\n", shmem->evicted);
> >         drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
> > +       drm_printf_indent(p, indent, "madv=%d\n", shmem->madv);
> >  }
> >  EXPORT_SYMBOL(drm_gem_shmem_print_info);
> >
> > @@ -667,6 +875,8 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
> >
> >         shmem->sgt = sgt;
> >
> > +       drm_gem_shmem_update_pages_state(shmem);
> > +
> >         dma_resv_unlock(shmem->base.resv);
> >
> >         return sgt;
> > @@ -717,6 +927,250 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
> >
> > +static struct drm_gem_shmem_shrinker *
> > +to_drm_shrinker(struct shrinker *shrinker)
> > +{
> > +       return container_of(shrinker, struct drm_gem_shmem_shrinker, base);
> > +}
> > +
> > +static unsigned long
> > +drm_gem_shmem_shrinker_count_objects(struct shrinker *shrinker,
> > +                                    struct shrink_control *sc)
> > +{
> > +       struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
> > +       struct drm_gem_shmem_object *shmem;
> > +       unsigned long count = 0;
> > +
> > +       if (!mutex_trylock(&gem_shrinker->lock))
> > +               return 0;
> > +
> > +       list_for_each_entry(shmem, &gem_shrinker->lru_evictable, madv_list) {
> > +               count += shmem->base.size;
> > +
> > +               if (count >= SHRINK_EMPTY)
> > +                       break;
> > +       }
> > +
> > +       mutex_unlock(&gem_shrinker->lock);
> > +
> > +       if (count >= SHRINK_EMPTY)
> > +               return SHRINK_EMPTY - 1;
> > +
> > +       return count ?: SHRINK_EMPTY;
> > +}
> > +
> > +int drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem)
> > +{
> > +       WARN_ON(!drm_gem_shmem_is_evictable(shmem));
> > +       WARN_ON(shmem->evicted);
> > +
> > +       drm_gem_shmem_unpin_pages(shmem);
> > +
> > +       shmem->evicted = true;
> > +       drm_gem_shmem_update_pages_state(shmem);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_evict);
> > +
> > +int drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
> > +{
> > +       struct drm_gem_object *obj = &shmem->base;
> > +
> > +       WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
> > +
> > +       drm_gem_shmem_unpin_pages(shmem);
> > +       drm_gem_free_mmap_offset(obj);
> > +
> > +       /* Our goal here is to return as much of the memory as
> > +        * is possible back to the system as we are called from OOM.
> > +        * To do this we must instruct the shmfs to drop all of its
> > +        * backing pages, *now*.
> > +        */
> > +       shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
> > +
> > +       invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
> > +
> > +       shmem->madv = -1;
> > +       shmem->evicted = false;
> > +       drm_gem_shmem_update_pages_state(shmem);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_purge);
> > +
> > +static unsigned long
> > +drm_gem_shmem_shrinker_run_objects_scan(struct shrinker *shrinker,
> > +                                       unsigned long nr_to_scan,
> > +                                       bool *lock_contention,
> > +                                       bool evict)
> > +{
> > +       struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
> > +       struct drm_gem_shmem_object *shmem;
> > +       struct list_head still_in_list;
> > +       struct drm_gem_object *obj;
> > +       unsigned long freed = 0;
> > +       size_t page_count;
> > +       int err;
> > +
> > +       INIT_LIST_HEAD(&still_in_list);
> > +
> > +       mutex_lock(&gem_shrinker->lock);
> > +
> > +       while (freed < nr_to_scan) {
> > +               shmem = list_first_entry_or_null(&gem_shrinker->lru_evictable,
> > +                                                typeof(*shmem), madv_list);
> > +               if (!shmem)
> > +                       break;
> > +
> > +               obj = &shmem->base;
> > +               page_count = obj->size >> PAGE_SHIFT;
> > +               list_move_tail(&shmem->madv_list, &still_in_list);
> > +
> > +               if (evict) {
> > +                       if (!drm_gem_shmem_is_evictable(shmem) ||
> > +                           get_nr_swap_pages() < page_count)
> > +                               continue;
> > +               } else {
> > +                       if (!drm_gem_shmem_is_purgeable(shmem))
> > +                               continue;
> > +               }
> > +
> > +               /*
> > +                * If it's in the process of being freed, gem_object->free()
> > +                * may be blocked on lock waiting to remove it.  So just
> > +                * skip it.
> > +                */
> > +               if (!kref_get_unless_zero(&obj->refcount))
> > +                       continue;
> > +
> > +               mutex_unlock(&gem_shrinker->lock);
> > +
> > +               /* prevent racing with job-submission code paths */
> > +               if (!dma_resv_trylock(obj->resv)) {
> > +                       *lock_contention |= true;
> > +                       goto shrinker_lock;
> > +               }
> > +
> > +               /* prevent racing with the dma-buf importing/exporting */
> > +               if (!mutex_trylock(&gem_shrinker->dev->object_name_lock)) {
> > +                       *lock_contention |= true;
> > +                       goto resv_unlock;
> > +               }
> > +
> > +               /* check whether h/w uses this object */
> > +               if (!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_WRITE))
> > +                       goto object_name_unlock;
> > +
> > +               /* re-check whether eviction status hasn't changed */
> > +               if (!drm_gem_shmem_is_evictable(shmem) &&
> > +                   !drm_gem_shmem_is_purgeable(shmem))
> > +                       goto object_name_unlock;
> > +
> > +               err = shmem->evict(shmem);
> > +               if (!err)
> > +                       freed += obj->size >> PAGE_SHIFT;
> > +
> > +object_name_unlock:
> > +               mutex_unlock(&gem_shrinker->dev->object_name_lock);
> > +resv_unlock:
> > +               dma_resv_unlock(obj->resv);
> > +shrinker_lock:
> > +               drm_gem_object_put(&shmem->base);
> > +               mutex_lock(&gem_shrinker->lock);
> > +       }
> > +
> > +       list_splice_tail(&still_in_list, &gem_shrinker->lru_evictable);
> > +
> > +       mutex_unlock(&gem_shrinker->lock);
> > +
> > +       return freed;
> > +}
> > +
> > +static unsigned long
> > +drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
> > +                                   struct shrink_control *sc)
> > +{
> > +       unsigned long nr_to_scan = sc->nr_to_scan;
> > +       bool lock_contention = false;
> > +       unsigned long freed;
> > +
> > +       /* purge as many objects as we can */
> > +       freed = drm_gem_shmem_shrinker_run_objects_scan(shrinker, nr_to_scan,
> > +                                                       &lock_contention, false);
> > +
> > +       /* evict as many objects as we can */
> > +       if (freed < nr_to_scan)
> > +               freed += drm_gem_shmem_shrinker_run_objects_scan(shrinker,
> > +                                                                nr_to_scan - freed,
> > +                                                                &lock_contention,
> > +                                                                true);
> > +
> > +       return (!freed && !lock_contention) ? SHRINK_STOP : freed;
> > +}
> > +
> > +/**
> > + * drm_gem_shmem_shrinker_register() - Register shmem shrinker
> > + * @dev: DRM device
> > + *
> > + * Returns:
> > + * 0 on success or a negative error code on failure.
> > + */
> > +int drm_gem_shmem_shrinker_register(struct drm_device *dev)
> > +{
> > +       struct drm_gem_shmem_shrinker *gem_shrinker;
> > +       int err;
> > +
> > +       if (WARN_ON(dev->shmem_shrinker))
> > +               return -EBUSY;
> > +
> > +       gem_shrinker = kzalloc(sizeof(*gem_shrinker), GFP_KERNEL);
> > +       if (!gem_shrinker)
> > +               return -ENOMEM;
> > +
> > +       gem_shrinker->base.count_objects = drm_gem_shmem_shrinker_count_objects;
> > +       gem_shrinker->base.scan_objects = drm_gem_shmem_shrinker_scan_objects;
> > +       gem_shrinker->base.seeks = DEFAULT_SEEKS;
> > +       gem_shrinker->dev = dev;
> > +
> > +       INIT_LIST_HEAD(&gem_shrinker->lru_evictable);
> > +       INIT_LIST_HEAD(&gem_shrinker->lru_evicted);
> > +       INIT_LIST_HEAD(&gem_shrinker->lru_pinned);
> > +       mutex_init(&gem_shrinker->lock);
> > +
> > +       dev->shmem_shrinker = gem_shrinker;
> > +
> > +       err = register_shrinker(&gem_shrinker->base);
> > +       if (err) {
> > +               dev->shmem_shrinker = NULL;
> > +               kfree(gem_shrinker);
> > +               return err;
> > +       }
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_shrinker_register);
> > +
> > +/**
> > + * drm_gem_shmem_shrinker_unregister() - Unregister shmem shrinker
> > + * @dev: DRM device
> > + */
> > +void drm_gem_shmem_shrinker_unregister(struct drm_device *dev)
> > +{
> > +       struct drm_gem_shmem_shrinker *gem_shrinker = dev->shmem_shrinker;
> > +
> > +       if (gem_shrinker) {
> > +               unregister_shrinker(&gem_shrinker->base);
> > +               WARN_ON(!list_empty(&gem_shrinker->lru_evictable));
> > +               WARN_ON(!list_empty(&gem_shrinker->lru_evicted));
> > +               WARN_ON(!list_empty(&gem_shrinker->lru_pinned));
> > +               mutex_destroy(&gem_shrinker->lock);
> > +               dev->shmem_shrinker = NULL;
> > +               kfree(gem_shrinker);
> > +       }
> > +}
> > +EXPORT_SYMBOL_GPL(drm_gem_shmem_shrinker_unregister);
> > +
> >  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
> >  MODULE_IMPORT_NS(DMA_BUF);
> >  MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> > index a4bedfeb2ec4..7cc32556f908 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> > @@ -15,6 +15,13 @@
> >  #include "panfrost_gem.h"
> >  #include "panfrost_mmu.h"
> >
> > +static bool panfrost_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
> > +{
> > +       return (shmem->madv > 0) &&
> > +               !shmem->pages_pin_count && shmem->sgt &&
> > +               !shmem->base.dma_buf && !shmem->base.import_attach;
> > +}
> > +
> >  static unsigned long
> >  panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
> >  {
> > @@ -27,7 +34,7 @@ panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc
> >                 return 0;
> >
> >         list_for_each_entry(shmem, &pfdev->shrinker_list, madv_list) {
> > -               if (drm_gem_shmem_is_purgeable(shmem))
> > +               if (panfrost_gem_shmem_is_purgeable(shmem))
> >                         count += shmem->base.size >> PAGE_SHIFT;
> >         }
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > index b2d93cb12ebf..81bacc7e1873 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > @@ -89,6 +89,7 @@ struct virtio_gpu_object {
> >         uint32_t hw_res_handle;
> >         bool dumb;
> >         bool created;
> > +       bool detached;
> >         bool host3d_blob, guest_blob;
> >         uint32_t blob_mem, blob_flags;
> >
> > @@ -453,6 +454,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
> >
> >  bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
> >
> > +int virtio_gpu_reattach_shmem_object(struct virtio_gpu_object *bo);
> > +
> >  int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
> >                                uint32_t *resid);
> >  /* virtgpu_prime.c */
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index 9923c7a6885e..929546cad894 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -16,6 +16,7 @@ struct drm_vblank_crtc;
> >  struct drm_vma_offset_manager;
> >  struct drm_vram_mm;
> >  struct drm_fb_helper;
> > +struct drm_gem_shmem_shrinker;
> >
> >  struct inode;
> >
> > @@ -277,6 +278,9 @@ struct drm_device {
> >         /** @vram_mm: VRAM MM memory manager */
> >         struct drm_vram_mm *vram_mm;
> >
> > +       /** @shmem_shrinker: SHMEM GEM memory shrinker */
> > +       struct drm_gem_shmem_shrinker *shmem_shrinker;
> > +
> >         /**
> >          * @switch_power_state:
> >          *
> > diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> > index 9a8983ee8abe..62c640678a91 100644
> > --- a/include/drm/drm_gem_shmem_helper.h
> > +++ b/include/drm/drm_gem_shmem_helper.h
> > @@ -6,6 +6,7 @@
> >  #include <linux/fs.h>
> >  #include <linux/mm.h>
> >  #include <linux/mutex.h>
> > +#include <linux/shrinker.h>
> >
> >  #include <drm/drm_file.h>
> >  #include <drm/drm_gem.h>
> > @@ -15,6 +16,7 @@
> >  struct dma_buf_attachment;
> >  struct drm_mode_create_dumb;
> >  struct drm_printer;
> > +struct drm_device;
> >  struct sg_table;
> >
> >  /**
> > @@ -39,12 +41,21 @@ struct drm_gem_shmem_object {
> >          */
> >         unsigned int pages_use_count;
> >
> > +       /**
> > +        * @pages_pin_count:
> > +        *
> > +        * Reference count on the pinned pages table.
> > +        * The pages can be evicted by memory shrinker
> > +        * when the count reaches zero.
> > +        */
> > +       unsigned int pages_pin_count;
> > +
> >         /**
> >          * @madv: State for madvise
> >          *
> >          * 0 is active/inuse.
> > +        * 1 is not-needed/can-be-purged
> >          * A negative value is the object is purged.
> > -        * Positive values are driver specific and not used by the helpers.
> >          */
> >         int madv;
> >
> > @@ -91,6 +102,39 @@ struct drm_gem_shmem_object {
> >          * @map_wc: map object write-combined (instead of using shmem defaults).
> >          */
> >         bool map_wc;
> > +
> > +       /**
> > +        * @eviction_enabled:
> > +        *
> > +        * The shmem pages can be evicted only if @eviction_enabled is set to true.
> > +        * Used internally by memory shrinker.
> > +        */
> > +       bool eviction_enabled;
> > +
> > +       /**
> > +        * @purge_enabled:
> > +        *
> > +        * The shmem pages can be purged only if @purge_enabled is set to true.
> > +        * Used internally by memory shrinker.
> > +        */
> > +       bool purge_enabled;
> > +
> > +       /**
> > +        * @evicted: True if shmem pages are evicted by the memory shrinker.
> > +        * Used internally by memory shrinker.
> > +        */
> > +       bool evicted;
> > +
> > +       /**
> > +        * @evict:
> > +        *
> > +        * Invoked by shmem shrinker before evicting shmem GEM from memory.
> > +        * GEM's DMA reservation is kept locked by the shrinker. This is
> > +        * optional callback that should be specified by drivers.
> > +        *
> > +        * Returns 0 on success, or -errno on error.
> > +        */
> > +       int (*evict)(struct drm_gem_shmem_object *shmem);
> >  };
> >
> >  #define to_drm_gem_shmem_obj(obj) \
> > @@ -110,14 +154,21 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
> >
> >  int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
> >
> > +int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem);
> > +int drm_gem_shmem_set_evictable(struct drm_gem_shmem_object *shmem);
> > +
> >  static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
> >  {
> > -       return (shmem->madv > 0) &&
> > -               !shmem->vmap_use_count && shmem->sgt &&
> > -               !shmem->base.dma_buf && !shmem->base.import_attach;
> > +       return (shmem->madv > 0) && shmem->evict &&
> > +               shmem->purge_enabled && shmem->pages_use_count &&
> > +               !shmem->pages_pin_count && !shmem->base.dma_buf &&
> > +               !shmem->base.import_attach && (shmem->sgt || shmem->evicted);
> >  }
> >
> > -void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
> > +int drm_gem_shmem_swap_in(struct drm_gem_shmem_object *shmem);
> > +
> > +int drm_gem_shmem_evict(struct drm_gem_shmem_object *shmem);
> > +int drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
> >
> >  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
> >  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
> > @@ -260,6 +311,32 @@ static inline int drm_gem_shmem_object_mmap(struct drm_gem_object *obj, struct v
> >         return drm_gem_shmem_mmap(shmem, vma);
> >  }
> >
> > +/**
> > + * struct drm_gem_shmem_shrinker - Generic memory shrinker for shmem GEMs
> > + */
> > +struct drm_gem_shmem_shrinker {
> > +       /** @base: Shrinker for purging shmem GEM objects */
> > +       struct shrinker base;
> > +
> > +       /** @lock: Protects @lru_* */
> > +       struct mutex lock;
> > +
> > +       /** @lru_pinned: List of pinned shmem GEM objects */
> > +       struct list_head lru_pinned;
> > +
> > +       /** @lru_evictable: List of shmem GEM objects to be evicted */
> > +       struct list_head lru_evictable;
> > +
> > +       /** @lru_evicted: List of evicted shmem GEM objects */
> > +       struct list_head lru_evicted;
> > +
> > +       /** @dev: DRM device that uses this shrinker */
> > +       struct drm_device *dev;
> > +};
> > +
> > +int drm_gem_shmem_shrinker_register(struct drm_device *dev);
> > +void drm_gem_shmem_shrinker_unregister(struct drm_device *dev);
> > +
> >  /*
> >   * Driver ops
> >   */
> > --
> > 2.35.3
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

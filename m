Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47054DCAE7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8A10E253;
	Thu, 17 Mar 2022 16:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9815B10E253
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 16:12:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n35so1775602wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pXtqp8iuAz8ol8GDqPVE/H1Hyn8eNzNnz8ekbU+Hmwo=;
 b=CPnUpNsj8Hj1XGqs2SJeL5iW/7Z/awl6wloKV6MiaYjgBco5AT8o8xWb8zFyd3bdP8
 qTSRy8fDUAuqJ4k060r14ggrCqqOATgAAH3VqLi4Bu7UNzTU5l9Y38bxX1K2tjE/Sww4
 12cHTUt2qQs3b/sNPTJHfKbKGYqg97duxbmbXph7A8zy1hDFzJRSoiuO7JYFysLydMoc
 1w09yG1VwVXqpuibHzr1d96+ViEs6sIHQpkDz/yL25/dadR3JWeh/9pRqJr4FH06PfHe
 y59mqRMXZlEB9ZkG3Npxv401QxGoxC2FYEzh+HI3J5qOUk20N87/2WNDo5tc/iw2rXX7
 LulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXtqp8iuAz8ol8GDqPVE/H1Hyn8eNzNnz8ekbU+Hmwo=;
 b=o0wBcXOtRLoFocgTXrXCsUHiSSxCePUzqi7g20GJb/OnULPeSAAqQZIN0dILx5DSzm
 +UDQug84hzllreGWYWWdsfP9EqP+i9+eruQpk2xi1LExy3DpdaGNIhYsxi4fStWxTKYt
 XjdmHnH4x7u1GfF49bgTs28T/i1QMbUio7Oph+DInbBndR0If+Q3zoGKAQtsKq8f+05u
 8QQBwRT6thKJy3qFisH6goKTPmP+Nd9pNltEw2Rh1Jr0nBaB8npC3zZO+o0IqvQyAld4
 on9Cx8k4czZtbEQ0H9l/nMu+wDfBTCgmeS+8fS/TrmM2sTrpQ7K/SE6hRspYOA6l0+Xq
 7RBw==
X-Gm-Message-State: AOAM5319NJL/lYFFJkuR79jOdXGDeDmJp8uNq0ZGizo5lUyneBbhT1DV
 dFL/Iubxj5wnm6s8fmSdwDvQP8e86AKSGfGu8Y8=
X-Google-Smtp-Source: ABdhPJz3P9FkP1bWgVUHNiTWpz4nMrwBTVKAgukRWLso36ZSA+d1U/sb4Pw2jD4jzVsQcJa+SOamChWHDIiq4zEGn2o=
X-Received: by 2002:a05:600c:35d6:b0:38c:4358:8e30 with SMTP id
 r22-20020a05600c35d600b0038c43588e30mr4756809wmq.102.1647533539863; Thu, 17
 Mar 2022 09:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-7-dmitry.osipenko@collabora.com>
 <CAF6AEGsmtM6rTJtOJwTA49cwW7wCjF53Devzodd_PzLO0EOkVw@mail.gmail.com>
 <be3b09ff-08ea-3e13-7d8c-06af6fffbd8f@collabora.com>
In-Reply-To: <be3b09ff-08ea-3e13-7d8c-06af6fffbd8f@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 09:13:00 -0700
Message-ID: <CAF6AEGv2Ob7_Zp3+m-16QExDTM9vYfAkeSuBtjWG7ukHnY73UA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/shmem-helper: Add generic memory shrinker
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 5:13 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 3/16/22 23:00, Rob Clark wrote:
> > On Mon, Mar 14, 2022 at 3:44 PM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> Introduce a common DRM SHMEM shrinker. It allows to reduce code
> >> duplication among DRM drivers, it also handles complicated lockings
> >> for the drivers. This is initial version of the shrinker that covers
> >> basic needs of GPU drivers.
> >>
> >> This patch is based on a couple ideas borrowed from Rob's Clark MSM
> >> shrinker and Thomas' Zimmermann variant of SHMEM shrinker.
> >>
> >> GPU drivers that want to use generic DRM memory shrinker must support
> >> generic GEM reservations.
> >>
> >> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c | 194 +++++++++++++++++++++++++
> >>  include/drm/drm_device.h               |   4 +
> >>  include/drm/drm_gem.h                  |  11 ++
> >>  include/drm/drm_gem_shmem_helper.h     |  25 ++++
> >>  4 files changed, 234 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> index 37009418cd28..35be2ee98f11 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -139,6 +139,9 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>  {
> >>         struct drm_gem_object *obj = &shmem->base;
> >>
> >> +       /* take out shmem GEM object from the memory shrinker */
> >> +       drm_gem_shmem_madvise(shmem, 0);
> >> +
> >>         WARN_ON(shmem->vmap_use_count);
> >>
> >>         if (obj->import_attach) {
> >> @@ -163,6 +166,42 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>  }
> >>  EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
> >>
> >> +static void drm_gem_shmem_update_purgeable_status(struct drm_gem_shmem_object *shmem)
> >> +{
> >> +       struct drm_gem_object *obj = &shmem->base;
> >> +       struct drm_gem_shmem_shrinker *gem_shrinker = obj->dev->shmem_shrinker;
> >> +       size_t page_count = obj->size >> PAGE_SHIFT;
> >> +
> >> +       if (!gem_shrinker || obj->import_attach || !obj->funcs->purge)
> >> +               return;
> >> +
> >> +       mutex_lock(&shmem->vmap_lock);
> >> +       mutex_lock(&shmem->pages_lock);
> >> +       mutex_lock(&gem_shrinker->lock);
> >> +
> >> +       if (shmem->madv < 0) {
> >> +               list_del_init(&shmem->madv_list);
> >> +               goto unlock;
> >> +       } else if (shmem->madv > 0) {
> >> +               if (!list_empty(&shmem->madv_list))
> >> +                       goto unlock;
> >> +
> >> +               WARN_ON(gem_shrinker->shrinkable_count + page_count < page_count);
> >> +               gem_shrinker->shrinkable_count += page_count;
> >> +
> >> +               list_add_tail(&shmem->madv_list, &gem_shrinker->lru);
> >> +       } else if (!list_empty(&shmem->madv_list)) {
> >> +               list_del_init(&shmem->madv_list);
> >> +
> >> +               WARN_ON(gem_shrinker->shrinkable_count < page_count);
> >> +               gem_shrinker->shrinkable_count -= page_count;
> >> +       }
> >> +unlock:
> >> +       mutex_unlock(&gem_shrinker->lock);
> >> +       mutex_unlock(&shmem->pages_lock);
> >> +       mutex_unlock(&shmem->vmap_lock);
> >> +}
> >> +
> >>  static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
> >>  {
> >>         struct drm_gem_object *obj = &shmem->base;
> >> @@ -366,6 +405,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
> >>         ret = drm_gem_shmem_vmap_locked(shmem, map);
> >>         mutex_unlock(&shmem->vmap_lock);
> >>
> >> +       drm_gem_shmem_update_purgeable_status(shmem);
> >> +
> >>         return ret;
> >>  }
> >>  EXPORT_SYMBOL(drm_gem_shmem_vmap);
> >> @@ -409,6 +450,8 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
> >>         mutex_lock(&shmem->vmap_lock);
> >>         drm_gem_shmem_vunmap_locked(shmem, map);
> >>         mutex_unlock(&shmem->vmap_lock);
> >> +
> >> +       drm_gem_shmem_update_purgeable_status(shmem);
> >>  }
> >>  EXPORT_SYMBOL(drm_gem_shmem_vunmap);
> >>
> >> @@ -451,6 +494,8 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
> >>
> >>         mutex_unlock(&shmem->pages_lock);
> >>
> >> +       drm_gem_shmem_update_purgeable_status(shmem);
> >> +
> >>         return (madv >= 0);
> >>  }
> >>  EXPORT_SYMBOL(drm_gem_shmem_madvise);
> >> @@ -763,6 +808,155 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
> >>  }
> >>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
> >>
> >> +static struct drm_gem_shmem_shrinker *
> >> +to_drm_shrinker(struct shrinker *shrinker)
> >> +{
> >> +       return container_of(shrinker, struct drm_gem_shmem_shrinker, base);
> >> +}
> >> +
> >> +static unsigned long
> >> +drm_gem_shmem_shrinker_count_objects(struct shrinker *shrinker,
> >> +                                    struct shrink_control *sc)
> >> +{
> >> +       struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
> >> +       u64 count = gem_shrinker->shrinkable_count;
> >> +
> >> +       if (count >= SHRINK_EMPTY)
> >> +               return SHRINK_EMPTY - 1;
> >> +
> >> +       return count ?: SHRINK_EMPTY;
> >> +}
> >> +
> >> +static unsigned long
> >> +drm_gem_shmem_shrinker_scan_objects(struct shrinker *shrinker,
> >> +                                   struct shrink_control *sc)
> >> +{
> >> +       struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
> >> +       struct drm_gem_shmem_object *shmem;
> >> +       struct list_head still_in_list;
> >> +       bool lock_contention = true;
> >> +       struct drm_gem_object *obj;
> >> +       unsigned long freed = 0;
> >> +
> >> +       INIT_LIST_HEAD(&still_in_list);
> >> +
> >> +       mutex_lock(&gem_shrinker->lock);
> >> +
> >> +       while (freed < sc->nr_to_scan) {
> >> +               shmem = list_first_entry_or_null(&gem_shrinker->lru,
> >> +                                                typeof(*shmem), madv_list);
> >> +               if (!shmem)
> >> +                       break;
> >> +
> >> +               obj = &shmem->base;
> >> +               list_move_tail(&shmem->madv_list, &still_in_list);
> >> +
> >> +               /*
> >> +                * If it's in the process of being freed, gem_object->free()
> >> +                * may be blocked on lock waiting to remove it.  So just
> >> +                * skip it.
> >> +                */
> >> +               if (!kref_get_unless_zero(&obj->refcount))
> >> +                       continue;
> >> +
> >> +               mutex_unlock(&gem_shrinker->lock);
> >> +
> >> +               /* prevent racing with job submission code paths */
> >> +               if (!dma_resv_trylock(obj->resv))
> >> +                       goto shrinker_lock;
> >
> > jfwiw, the trylock here is in the msm code isn't so much for madvise
> > (it is an error to submit jobs that reference DONTNEED objects), but
> > instead for the case of evicting WILLNEED but inactive objects to
> > swap.  Ie. in the case that we need to move bo's back in to memory, we
> > don't want to unpin/evict a buffer that is later on the list for the
> > same job.. msm shrinker re-uses the same scan loop for both
> > inactive_dontneed (purge) and inactive_willneed (evict)
>
> I don't see connection between the objects on the shrinker's list and
> the job's BOs. Jobs indeed must not have any objects marked as DONTNEED,
> this case should never happen in practice, but we still need to protect
> from it.

Hmm, let me try to explain with a simple example.. hopefully this makes sense.

Say you have a job with two bo's, A and B..  bo A is not backed with
memory (either hasn't been used before or was evicted.  Allocating
pages for A triggers shrinker.  But B is still on the
inactive_willneed list, however it is already locked (because we don't
want to evict B to obtain backing pages for A).

>
> > I suppose using trylock is not technically wrong, and it would be a
> > good idea if the shmem helpers supported eviction as well.  But I
> > think in the madvise/purge case if you lose the trylock then there is
> > something else bad going on.
>
> This trylock is intended for protecting job's submission path from
> racing with madvise ioctl invocation followed by immediate purging of
> BOs while job is in a process of submission, i.e. it protects from a
> use-after-free.

ahh, ok

> If you'll lose this trylock, then shrinker can't use
> dma_resv_test_signaled() reliably anymore and shrinker may purge BO
> before job had a chance to add fence to the BO's reservation.
>
> > Anyways, from the PoV of minimizing lock contention when under memory
> > pressure, this all looks good to me.
>
> Thank you. I may try to add generic eviction support to the v3.

eviction is a trickier thing to get right, I wouldn't blame you for
splitting that out into it's own patchset ;-)

You probably also would want to make it a thing that is opt-in for
drivers using the shmem helpers

BR,
-R

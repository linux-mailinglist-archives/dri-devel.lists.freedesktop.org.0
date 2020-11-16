Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C82B4CD0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0570989BD4;
	Mon, 16 Nov 2020 17:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27B289BB0;
 Mon, 16 Nov 2020 17:29:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so19614687wrt.4;
 Mon, 16 Nov 2020 09:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2rzUiv+O2rB515tRcTF7zhCppOCZFIZQrBJWwGnbzuU=;
 b=mVzVKyONwuMQFJtbj/4JuJL6V7wxm6Vg7YAtegkarbZFXHd/g0xiJ8hw/4b0DIo/2y
 t2CqJbv0pt3LmRoq378LjDtUn+7qoCUIYP66ev6Ph6+KQal+jN56jX6n13AwxrlTqGvf
 6jB3lvGGUXrCpnvT3W0MOvtqdDtGLSRllhCd5F9XxgjyNAOJM1bVhlpNOAbKQo+thkG/
 rxK5ouAWxt7M99j5pZ2NoMbEBW1JFPUscCo9wA3TFh5JUfs5b2FESETRwdl5n0eL/xW9
 cJjeJeNS9lMsZT0WETVig3q0dDt+2XmzI9kDf88WP8ES8YmB5hF7xogrRKSSrWA7/nur
 lK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2rzUiv+O2rB515tRcTF7zhCppOCZFIZQrBJWwGnbzuU=;
 b=nNZo1CloKhB8O1Y+pAbSiCHuTDhlshEYX+lSDYIuS0avoT6OXoJL8ysFqeut2tfNMS
 R14OAxoonKzH4/sA8BD/VzmsdfHRXy/HgGc8TOkn9h3v3/vZo26inizw3d45XjFK4SU2
 xqQvhN8A0SspCZSSq8ZIpN0NroFZyBFqNlz2KOTTGqx3csFQBLCIl17ZgrbA0Q0x/x0F
 I8O+vm9lPaYuWPnyLcX92fvlXI9iYEo6nyurhPg5H48qakp2dEOBNa9nYeyIji+j0bw6
 pVxm9u0IYysoEWvkT8DbFJVk5H1Qzmc0hNjbxXK4upziFrNKqqwzJUeqVZtSwfDOmCM/
 ILCQ==
X-Gm-Message-State: AOAM531jKuN1fNhs1GLn9tOklq2F4Cs5eTJ4Jmi3Uju6IsWB1dI7oVDE
 sbsht2A/ibZF4ZjQTE8X5vJXIifHEyTOhZLbrgur8EEF
X-Google-Smtp-Source: ABdhPJz26d2TFer1YuHgeDiv7jIpz6y2liL6qKnq49RRjBLmZE9f9dKqTC2tEZ5KHgA9Ih6frQMkdGezlTEtCkC516U=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr21501811wrb.132.1605547766379; 
 Mon, 16 Nov 2020 09:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20201114193010.753355-1-robdclark@gmail.com>
 <20201114193010.753355-4-robdclark@gmail.com>
 <20201116172009.GB16856@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20201116172009.GB16856@jcrouse1-lnx.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Nov 2020 09:31:12 -0800
Message-ID: <CAF6AEGswje8kYBo=8b4+BCciooTgj0ims_2LQJHXZK=n2XG9aw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/shrinker: Only iterate dontneed
 objs
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 9:20 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Sat, Nov 14, 2020 at 11:30:10AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where the GPU is mostly idle, all or nearly all buffer
> > objects will be in the inactive list.  But if the system is under memory
> > pressure (from something other than GPU), we could still get a lot of
> > shrinker calls.  Which results in traversing a list of thousands of objs
> > and in the end finding nothing to shrink.  Which isn't so efficient.
> >
> > Instead split the inactive_list into two lists, one inactive objs which
> > are shrinkable, and a second one for those that are not.  This way we
> > can avoid traversing objs which we know are not shrinker candidates.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_debugfs.c      |  3 ++-
> >  drivers/gpu/drm/msm/msm_drv.c          |  3 ++-
> >  drivers/gpu/drm/msm/msm_drv.h          |  8 +++---
> >  drivers/gpu/drm/msm/msm_gem.c          | 34 ++++++++++++++++++++------
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c |  7 +++---
> >  5 files changed, 40 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> > index 64afbed89821..85ad0babc326 100644
> > --- a/drivers/gpu/drm/msm/msm_debugfs.c
> > +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> > @@ -124,7 +124,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
> >       }
> >
> >       seq_printf(m, "Inactive Objects:\n");
> > -     msm_gem_describe_objects(&priv->inactive_list, m);
> > +     msm_gem_describe_objects(&priv->inactive_dontneed, m);
> > +     msm_gem_describe_objects(&priv->inactive_willneed, m);
> >
> >       mutex_unlock(&priv->mm_lock);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 4d808769e6ed..39a54f364aa8 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -465,7 +465,8 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
> >
> >       priv->wq = alloc_ordered_workqueue("msm", 0);
> >
> > -     INIT_LIST_HEAD(&priv->inactive_list);
> > +     INIT_LIST_HEAD(&priv->inactive_willneed);
> > +     INIT_LIST_HEAD(&priv->inactive_dontneed);
> >       mutex_init(&priv->mm_lock);
> >
> >       /* Teach lockdep about lock ordering wrt. shrinker: */
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index f869ed67b5da..ed18c5bed10f 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -175,8 +175,9 @@ struct msm_drm_private {
> >       struct msm_perf_state *perf;
> >
> >       /*
> > -      * List of inactive GEM objects.  Every bo is either in the inactive_list
> > -      * or gpu->active_list (for the gpu it is active on[1])
> > +      * Lists of inactive GEM objects.  Every bo is either in one of the
> > +      * inactive lists (depending on whether or not it is shrinkable) or
> > +      * gpu->active_list (for the gpu it is active on[1])
> >        *
> >        * These lists are protected by mm_lock.  If struct_mutex is involved, it
> >        * should be aquired prior to mm_lock.  One should *not* hold mm_lock in
> > @@ -185,7 +186,8 @@ struct msm_drm_private {
> >        * [1] if someone ever added support for the old 2d cores, there could be
> >        *     more than one gpu object
> >        */
> > -     struct list_head inactive_list;
> > +     struct list_head inactive_willneed;  /* inactive + !shrinkable */
> > +     struct list_head inactive_dontneed;  /* inactive +  shrinkable */
> >       struct mutex mm_lock;
> >
> >       struct workqueue_struct *wq;
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index 2795288b0a95..de8d2cfada24 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -17,6 +17,7 @@
> >  #include "msm_gpu.h"
> >  #include "msm_mmu.h"
> >
> > +static void update_inactive(struct msm_gem_object *msm_obj);
> >
> >  static dma_addr_t physaddr(struct drm_gem_object *obj)
> >  {
> > @@ -678,6 +679,12 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
> >
> >       madv = msm_obj->madv;
> >
> > +     /* If the obj is inactive, we might need to move it
> > +      * between inactive lists
> > +      */
> > +     if (msm_obj->active_count == 0)
> > +             update_inactive(msm_obj);
> > +
> >       msm_gem_unlock(obj);
> >
> >       return (madv != __MSM_MADV_PURGED);
> > @@ -781,19 +788,31 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
> >  void msm_gem_active_put(struct drm_gem_object *obj)
> >  {
> >       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > -     struct msm_drm_private *priv = obj->dev->dev_private;
> >
> >       might_sleep();
> >       WARN_ON(!msm_gem_is_locked(obj));
> >
> >       if (--msm_obj->active_count == 0) {
> > -             mutex_lock(&priv->mm_lock);
> > -             list_del_init(&msm_obj->mm_list);
> > -             list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> > -             mutex_unlock(&priv->mm_lock);
> > +             update_inactive(msm_obj);
> >       }
> >  }
> >
> > +static void update_inactive(struct msm_gem_object *msm_obj)
> > +{
> > +     struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> > +
> > +     mutex_lock(&priv->mm_lock);
> > +     WARN_ON(msm_obj->active_count != 0);
> > +
> > +     list_del_init(&msm_obj->mm_list);
> > +     if (msm_obj->madv == MSM_MADV_DONTNEED)
> > +             list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
> > +     else
> > +             list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
>
> Is the logic here inverted or is this just really confusing nomenclature? If it
> is correct a comment might help remind us whats happening.

Oh, whoops, yeah that is inverted

BR,
-R

> Jordan
>
> > +
> > +     mutex_unlock(&priv->mm_lock);
> > +}
> > +
> >  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
> >  {
> >       bool write = !!(op & MSM_PREP_WRITE);
> > @@ -1099,7 +1118,8 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
> >       }
> >
> >       mutex_lock(&priv->mm_lock);
> > -     list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> > +     /* Initially obj is idle, obj->madv == WILLNEED: */
> > +     list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
> >       mutex_unlock(&priv->mm_lock);
> >
> >       return obj;
> > @@ -1169,7 +1189,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
> >       msm_gem_unlock(obj);
> >
> >       mutex_lock(&priv->mm_lock);
> > -     list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> > +     list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
> >       mutex_unlock(&priv->mm_lock);
> >
> >       return obj;
> > diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > index 9d51c1eb808d..81dfa57b6a0d 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > @@ -19,7 +19,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
> >
> >       mutex_lock(&priv->mm_lock);
> >
> > -     list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> > +     list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
> >               if (!msm_gem_trylock(&msm_obj->base))
> >                       continue;
> >               if (is_purgeable(msm_obj))
> > @@ -42,7 +42,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> >
> >       mutex_lock(&priv->mm_lock);
> >
> > -     list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> > +     list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
> >               if (freed >= sc->nr_to_scan)
> >                       break;
> >               if (!msm_gem_trylock(&msm_obj->base))
> > @@ -96,7 +96,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
> >       struct msm_drm_private *priv =
> >               container_of(nb, struct msm_drm_private, vmap_notifier);
> >       struct list_head *mm_lists[] = {
> > -             &priv->inactive_list,
> > +             &priv->inactive_dontneed,
> > +             &priv->inactive_willneed,
> >               priv->gpu ? &priv->gpu->active_list : NULL,
> >               NULL,
> >       };
> > --
> > 2.28.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

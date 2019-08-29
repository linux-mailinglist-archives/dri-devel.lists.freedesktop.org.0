Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A34DA1C5B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 16:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108C06E125;
	Thu, 29 Aug 2019 14:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5D46E0F8;
 Thu, 29 Aug 2019 14:08:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y19so3595458wrd.3;
 Thu, 29 Aug 2019 07:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lx+LD9gmi2mFH3ubL57nKgJc74A4gORLLnPVNyN9R6k=;
 b=LeS3uyVZomnLDRQrWVByjs7cRgx9W+roaCfCy/hxtH8hHMWyCc6ZsSKAdZuTVDq9WD
 BWzjtJalic/EhipfpirO2uoVQNOcSTC6eI4Y7DKFD4UG6lSJYUOM1NJ3Z+/eygFg1DDi
 Win2Ugv1WExG2z6EgCtkS7PlW7cPeG3GsFxnu6foWyMFhN9BjKOjKXvCsUwxMFLpvsGf
 gbUTtqWJ6ddN23gylWSNQxR85egSsegdW/PGHA/1otbKFX65NEfdTEMI00q4aZC/pNCl
 dgYR388l3TbUh/LD6eIKEIDgf1USzAeORRBmg3KzLckk0BIWTxcJc+gsbEiJ/S18uGJp
 YWCQ==
X-Gm-Message-State: APjAAAUgyXCAO9U6Q1BqkxsfoX6UWfU7fBwU7QHWbL0KtKyMGxyLPXKw
 AWM+ECcJeyu24RGEmAFBFPDfJkWdKASIVLxOmCP/8klFojI=
X-Google-Smtp-Source: APXvYqzEbLSVerj6ycGOyCjxfbF1GwvjkHfOp34BuzKr6tald9TDj0DkwI4a1UPLXXn9bWY8eW00sDT+hPVfMchSQ6o=
X-Received: by 2002:adf:fc03:: with SMTP id i3mr6690090wrr.48.1567087678988;
 Thu, 29 Aug 2019 07:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-14-Kenny.Ho@amd.com>
 <464ad318-48dd-3f78-d82b-83a8e7175ff9@amd.com>
In-Reply-To: <464ad318-48dd-3f78-d82b-83a8e7175ff9@amd.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 29 Aug 2019 10:07:47 -0400
Message-ID: <CAOWid-dzJiqjH9+=36fFYh87OKOzToMDcJZpepOWdjoXpBSF8A@mail.gmail.com>
Subject: Re: [PATCH RFC v4 13/16] drm,
 cgroup: Allow more aggressive memory reclaim
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lx+LD9gmi2mFH3ubL57nKgJc74A4gORLLnPVNyN9R6k=;
 b=ktjA7/Hm42fxUBMBHfFyw0Rc8azuFm2ap/LABjH0/DxWcw6G/VmrgmbbJ2eiVxpgGd
 YKxAPEDL9YmScWd0sI1lxEBvfSjnPk+J2YqSMoGbGkNHcTBCfrBsO8ianpkuj1CB83KE
 lXAEmOfgp2ZKYU2Z2QeWe768VNzNjkH7Br/k6M0pj5xZ1ccop/lS7yjW82vFjngzUs/D
 aiLeUnEvS0BchjifJKwn0dw+9pdcl2Vf+MnkuNw/i/5gxwGYh6q0sAD2ujuNpN1R4tRN
 IpWIpIOcO79J+ni1k/WhdnIr1kaMmZmjPv/H4dFz4+pzDbLEWN5Uv2YUXkp94OrYt4G1
 LTAQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Ho, Kenny" <Kenny.Ho@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "jsparks@cray.com" <jsparks@cray.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lkaplan@cray.com" <lkaplan@cray.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "tj@kernel.org" <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1985058733=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1985058733==
Content-Type: multipart/alternative; boundary="0000000000007024a405914208cc"

--0000000000007024a405914208cc
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback Christian.  I am still digging into this one.
Daniel suggested leveraging the Shrinker API for the functionality of this
commit in RFC v3 but I am still trying to figure it out how/if ttm fit with
shrinker (though the idea behind the shrinker API seems fairly
straightforward as far as I understand it currently.)

Regards,
Kenny

On Thu, Aug 29, 2019 at 3:08 AM Koenig, Christian <Christian.Koenig@amd.com>
wrote:

> Am 29.08.19 um 08:05 schrieb Kenny Ho:
> > Allow DRM TTM memory manager to register a work_struct, such that, when
> > a drmcgrp is under memory pressure, memory reclaiming can be triggered
> > immediately.
> >
> > Change-Id: I25ac04e2db9c19ff12652b88ebff18b44b2706d8
> > Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c    | 49 +++++++++++++++++++++++++++++++++
> >   include/drm/drm_cgroup.h        | 16 +++++++++++
> >   include/drm/ttm/ttm_bo_driver.h |  2 ++
> >   kernel/cgroup/drm.c             | 30 ++++++++++++++++++++
> >   4 files changed, 97 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index d7e3d3128ebb..72efae694b7e 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -1590,6 +1590,46 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev,
> unsigned mem_type)
> >   }
> >   EXPORT_SYMBOL(ttm_bo_evict_mm);
> >
> > +static void ttm_bo_reclaim_wq(struct work_struct *work)
> > +{
> > +     struct ttm_operation_ctx ctx = {
> > +             .interruptible = false,
> > +             .no_wait_gpu = false,
> > +             .flags = TTM_OPT_FLAG_FORCE_ALLOC
> > +     };
> > +     struct ttm_mem_type_manager *man =
> > +         container_of(work, struct ttm_mem_type_manager, reclaim_wq);
> > +     struct ttm_bo_device *bdev = man->bdev;
> > +     struct dma_fence *fence;
> > +     int mem_type;
> > +     int ret;
> > +
> > +     for (mem_type = 0; mem_type < TTM_NUM_MEM_TYPES; mem_type++)
> > +             if (&bdev->man[mem_type] == man)
> > +                     break;
> > +
> > +     WARN_ON(mem_type >= TTM_NUM_MEM_TYPES);
> > +     if (mem_type >= TTM_NUM_MEM_TYPES)
> > +             return;
> > +
> > +     if (!drmcg_mem_pressure_scan(bdev, mem_type))
> > +             return;
> > +
> > +     ret = ttm_mem_evict_first(bdev, mem_type, NULL, &ctx, NULL);
> > +     if (ret)
> > +             return;
> > +
> > +     spin_lock(&man->move_lock);
> > +     fence = dma_fence_get(man->move);
> > +     spin_unlock(&man->move_lock);
> > +
> > +     if (fence) {
> > +             ret = dma_fence_wait(fence, false);
> > +             dma_fence_put(fence);
> > +     }
>
> Why do you want to block for the fence here? That is a rather bad idea
> and would break pipe-lining.
>
> Apart from that I don't think we should put that into TTM.
>
> Instead drmcg_register_device_mm() should get a function pointer which
> is called from a work item when the group is under pressure.
>
> TTM can then provides the function which can be called, but the actually
> registration is job of the device and not TTM.
>
> Regards,
> Christian.
>
> > +
> > +}
> > +
> >   int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> >                       unsigned long p_size)
> >   {
> > @@ -1624,6 +1664,13 @@ int ttm_bo_init_mm(struct ttm_bo_device *bdev,
> unsigned type,
> >               INIT_LIST_HEAD(&man->lru[i]);
> >       man->move = NULL;
> >
> > +     pr_err("drmcg %p type %d\n", bdev->ddev, type);
> > +
> > +     if (type <= TTM_PL_VRAM) {
> > +             INIT_WORK(&man->reclaim_wq, ttm_bo_reclaim_wq);
> > +             drmcg_register_device_mm(bdev->ddev, type,
> &man->reclaim_wq);
> > +     }
> > +
> >       return 0;
> >   }
> >   EXPORT_SYMBOL(ttm_bo_init_mm);
> > @@ -1701,6 +1748,8 @@ int ttm_bo_device_release(struct ttm_bo_device
> *bdev)
> >               man = &bdev->man[i];
> >               if (man->has_type) {
> >                       man->use_type = false;
> > +                     drmcg_unregister_device_mm(bdev->ddev, i);
> > +                     cancel_work_sync(&man->reclaim_wq);
> >                       if ((i != TTM_PL_SYSTEM) && ttm_bo_clean_mm(bdev,
> i)) {
> >                               ret = -EBUSY;
> >                               pr_err("DRM memory manager type %d is not
> clean\n",
> > diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
> > index c11df388fdf2..6d9707e1eb72 100644
> > --- a/include/drm/drm_cgroup.h
> > +++ b/include/drm/drm_cgroup.h
> > @@ -5,6 +5,7 @@
> >   #define __DRM_CGROUP_H__
> >
> >   #include <linux/cgroup_drm.h>
> > +#include <linux/workqueue.h>
> >   #include <drm/ttm/ttm_bo_api.h>
> >   #include <drm/ttm/ttm_bo_driver.h>
> >
> > @@ -25,12 +26,17 @@ struct drmcg_props {
> >       s64                     mem_bw_avg_bytes_per_us_default;
> >
> >       s64                     mem_highs_default[TTM_PL_PRIV+1];
> > +
> > +     struct work_struct      *mem_reclaim_wq[TTM_PL_PRIV];
> >   };
> >
> >   #ifdef CONFIG_CGROUP_DRM
> >
> >   void drmcg_device_update(struct drm_device *device);
> >   void drmcg_device_early_init(struct drm_device *device);
> > +void drmcg_register_device_mm(struct drm_device *dev, unsigned int type,
> > +             struct work_struct *wq);
> > +void drmcg_unregister_device_mm(struct drm_device *dev, unsigned int
> type);
> >   bool drmcg_try_chg_bo_alloc(struct drmcg *drmcg, struct drm_device
> *dev,
> >               size_t size);
> >   void drmcg_unchg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
> > @@ -53,6 +59,16 @@ static inline void drmcg_device_early_init(struct
> drm_device *device)
> >   {
> >   }
> >
> > +static inline void drmcg_register_device_mm(struct drm_device *dev,
> > +             unsigned int type, struct work_struct *wq)
> > +{
> > +}
> > +
> > +static inline void drmcg_unregister_device_mm(struct drm_device *dev,
> > +             unsigned int type)
> > +{
> > +}
> > +
> >   static inline void drmcg_try_chg_bo_alloc(struct drmcg *drmcg,
> >               struct drm_device *dev, size_t size)
> >   {
> > diff --git a/include/drm/ttm/ttm_bo_driver.h
> b/include/drm/ttm/ttm_bo_driver.h
> > index e1a805d65b83..529cef92bcf6 100644
> > --- a/include/drm/ttm/ttm_bo_driver.h
> > +++ b/include/drm/ttm/ttm_bo_driver.h
> > @@ -205,6 +205,8 @@ struct ttm_mem_type_manager {
> >        * Protected by @move_lock.
> >        */
> >       struct dma_fence *move;
> > +
> > +     struct work_struct reclaim_wq;
> >   };
> >
> >   /**
> > diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
> > index 04fb9a398740..0ea7f0619e25 100644
> > --- a/kernel/cgroup/drm.c
> > +++ b/kernel/cgroup/drm.c
> > @@ -804,6 +804,29 @@ void drmcg_device_early_init(struct drm_device *dev)
> >   }
> >   EXPORT_SYMBOL(drmcg_device_early_init);
> >
> > +void drmcg_register_device_mm(struct drm_device *dev, unsigned int type,
> > +             struct work_struct *wq)
> > +{
> > +     if (dev == NULL || type >= TTM_PL_PRIV)
> > +             return;
> > +
> > +     mutex_lock(&drmcg_mutex);
> > +     dev->drmcg_props.mem_reclaim_wq[type] = wq;
> > +     mutex_unlock(&drmcg_mutex);
> > +}
> > +EXPORT_SYMBOL(drmcg_register_device_mm);
> > +
> > +void drmcg_unregister_device_mm(struct drm_device *dev, unsigned int
> type)
> > +{
> > +     if (dev == NULL || type >= TTM_PL_PRIV)
> > +             return;
> > +
> > +     mutex_lock(&drmcg_mutex);
> > +     dev->drmcg_props.mem_reclaim_wq[type] = NULL;
> > +     mutex_unlock(&drmcg_mutex);
> > +}
> > +EXPORT_SYMBOL(drmcg_unregister_device_mm);
> > +
> >   /**
> >    * drmcg_try_chg_bo_alloc - charge GEM buffer usage for a device and
> cgroup
> >    * @drmcg: the DRM cgroup to be charged to
> > @@ -1013,6 +1036,13 @@ void drmcg_mem_track_move(struct
> ttm_buffer_object *old_bo, bool evict,
> >
> >               ddr->mem_bw_stats[DRMCG_MEM_BW_ATTR_BYTE_CREDIT]
> >                       -= move_in_bytes;
> > +
> > +             if (dev->drmcg_props.mem_reclaim_wq[new_mem_type]
> > +                     != NULL &&
> > +                     ddr->mem_stats[new_mem_type] >
> > +                             ddr->mem_highs[new_mem_type])
> > +                     schedule_work(dev->
> > +                             drmcg_props.mem_reclaim_wq[new_mem_type]);
> >       }
> >       mutex_unlock(&dev->drmcg_mutex);
> >   }
>
>

--0000000000007024a405914208cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the feedback Christian.=C2=A0 I am still diggin=
g into this one.=C2=A0 Daniel suggested leveraging the Shrinker API for the=
 functionality of this commit in RFC v3 but I am still trying to figure it =
out how/if ttm fit with shrinker (though the idea behind the shrinker API s=
eems fairly straightforward as far as I understand it currently.)<div><br><=
/div><div>Regards,</div><div>Kenny</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 29, 2019 at 3:08 AM Koe=
nig, Christian &lt;<a href=3D"mailto:Christian.Koenig@amd.com">Christian.Ko=
enig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Am 29.08.19 um 08:05 schrieb Kenny Ho:<br>
&gt; Allow DRM TTM memory manager to register a work_struct, such that, whe=
n<br>
&gt; a drmcgrp is under memory pressure, memory reclaiming can be triggered=
<br>
&gt; immediately.<br>
&gt;<br>
&gt; Change-Id: I25ac04e2db9c19ff12652b88ebff18b44b2706d8<br>
&gt; Signed-off-by: Kenny Ho &lt;<a href=3D"mailto:Kenny.Ho@amd.com" target=
=3D"_blank">Kenny.Ho@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0 =C2=A0 | 49 +++++++++++=
++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0include/drm/drm_cgroup.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 +=
++++++++++<br>
&gt;=C2=A0 =C2=A0include/drm/ttm/ttm_bo_driver.h |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0kernel/cgroup/drm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 30 ++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A04 files changed, 97 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo=
.c<br>
&gt; index d7e3d3128ebb..72efae694b7e 100644<br>
&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt; +++ b/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt; @@ -1590,6 +1590,46 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev,=
 unsigned mem_type)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0EXPORT_SYMBOL(ttm_bo_evict_mm);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void ttm_bo_reclaim_wq(struct work_struct *work)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ttm_operation_ctx ctx =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.interruptible =3D fa=
lse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.no_wait_gpu =3D fals=
e,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D TTM_OPT_FL=
AG_FORCE_ALLOC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ttm_mem_type_manager *man =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(work, struct ttm_mem_t=
ype_manager, reclaim_wq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ttm_bo_device *bdev =3D man-&gt;bdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dma_fence *fence;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int mem_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (mem_type =3D 0; mem_type &lt; TTM_NUM_MEM_TY=
PES; mem_type++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (&amp;bdev-&gt;man=
[mem_type] =3D=3D man)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WARN_ON(mem_type &gt;=3D TTM_NUM_MEM_TYPES);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mem_type &gt;=3D TTM_NUM_MEM_TYPES)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!drmcg_mem_pressure_scan(bdev, mem_type))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ttm_mem_evict_first(bdev, mem_type, NULL,=
 &amp;ctx, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;man-&gt;move_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fence =3D dma_fence_get(man-&gt;move);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;man-&gt;move_lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fence) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_fence_wai=
t(fence, false);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_fence_put(fence);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
Why do you want to block for the fence here? That is a rather bad idea <br>
and would break pipe-lining.<br>
<br>
Apart from that I don&#39;t think we should put that into TTM.<br>
<br>
Instead drmcg_register_device_mm() should get a function pointer which <br>
is called from a work item when the group is under pressure.<br>
<br>
TTM can then provides the function which can be called, but the actually <b=
r>
registration is job of the device and not TTM.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned ty=
pe,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0unsigned long p_size)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -1624,6 +1664,13 @@ int ttm_bo_init_mm(struct ttm_bo_device *bdev, =
unsigned type,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&=
amp;man-&gt;lru[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0man-&gt;move =3D NULL;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_err(&quot;drmcg %p type %d\n&quot;, bdev-&gt;d=
dev, type);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (type &lt;=3D TTM_PL_VRAM) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_WORK(&amp;man-&g=
t;reclaim_wq, ttm_bo_reclaim_wq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drmcg_register_device=
_mm(bdev-&gt;ddev, type, &amp;man-&gt;reclaim_wq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0EXPORT_SYMBOL(ttm_bo_init_mm);<br>
&gt; @@ -1701,6 +1748,8 @@ int ttm_bo_device_release(struct ttm_bo_device *=
bdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0man =3D &amp;bde=
v-&gt;man[i];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (man-&gt;has_=
type) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0man-&gt;use_type =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drmcg_unregister_device_mm(bdev-&gt;ddev, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cancel_work_sync(&amp;man-&gt;reclaim_wq);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ((i !=3D TTM_PL_SYSTEM) &amp;&amp; ttm_bo_clean_mm(bdev, i)=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EBUSY;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;DRM memory manager ty=
pe %d is not clean\n&quot;,<br>
&gt; diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h<br>
&gt; index c11df388fdf2..6d9707e1eb72 100644<br>
&gt; --- a/include/drm/drm_cgroup.h<br>
&gt; +++ b/include/drm/drm_cgroup.h<br>
&gt; @@ -5,6 +5,7 @@<br>
&gt;=C2=A0 =C2=A0#define __DRM_CGROUP_H__<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/cgroup_drm.h&gt;<br>
&gt; +#include &lt;linux/workqueue.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;drm/ttm/ttm_bo_api.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;drm/ttm/ttm_bo_driver.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -25,12 +26,17 @@ struct drmcg_props {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem_bw_avg_bytes_per_us_default;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem_highs_default[TTM_PL_PRIV+1];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct work_struct=C2=A0 =C2=A0 =C2=A0 *mem_recla=
im_wq[TTM_PL_PRIV];<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_CGROUP_DRM<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void drmcg_device_update(struct drm_device *device);<br>
&gt;=C2=A0 =C2=A0void drmcg_device_early_init(struct drm_device *device);<b=
r>
&gt; +void drmcg_register_device_mm(struct drm_device *dev, unsigned int ty=
pe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct work_struct *w=
q);<br>
&gt; +void drmcg_unregister_device_mm(struct drm_device *dev, unsigned int =
type);<br>
&gt;=C2=A0 =C2=A0bool drmcg_try_chg_bo_alloc(struct drmcg *drmcg, struct dr=
m_device *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size);<br=
>
&gt;=C2=A0 =C2=A0void drmcg_unchg_bo_alloc(struct drmcg *drmcg, struct drm_=
device *dev,<br>
&gt; @@ -53,6 +59,16 @@ static inline void drmcg_device_early_init(struct d=
rm_device *device)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static inline void drmcg_register_device_mm(struct drm_device *dev,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int type, st=
ruct work_struct *wq)<br>
&gt; +{<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void drmcg_unregister_device_mm(struct drm_device *dev,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int type)<br=
>
&gt; +{<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static inline void drmcg_try_chg_bo_alloc(struct drmcg *dr=
mcg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_devic=
e *dev, size_t size)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_=
driver.h<br>
&gt; index e1a805d65b83..529cef92bcf6 100644<br>
&gt; --- a/include/drm/ttm/ttm_bo_driver.h<br>
&gt; +++ b/include/drm/ttm/ttm_bo_driver.h<br>
&gt; @@ -205,6 +205,8 @@ struct ttm_mem_type_manager {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Protected by @move_lock.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_fence *move;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct work_struct reclaim_wq;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/**<br>
&gt; diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c<br>
&gt; index 04fb9a398740..0ea7f0619e25 100644<br>
&gt; --- a/kernel/cgroup/drm.c<br>
&gt; +++ b/kernel/cgroup/drm.c<br>
&gt; @@ -804,6 +804,29 @@ void drmcg_device_early_init(struct drm_device *d=
ev)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0EXPORT_SYMBOL(drmcg_device_early_init);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +void drmcg_register_device_mm(struct drm_device *dev, unsigned int ty=
pe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct work_struct *w=
q)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev =3D=3D NULL || type &gt;=3D TTM_PL_PRIV)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;drmcg_mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;drmcg_props.mem_reclaim_wq[type] =3D wq;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;drmcg_mutex);<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(drmcg_register_device_mm);<br>
&gt; +<br>
&gt; +void drmcg_unregister_device_mm(struct drm_device *dev, unsigned int =
type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev =3D=3D NULL || type &gt;=3D TTM_PL_PRIV)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;drmcg_mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;drmcg_props.mem_reclaim_wq[type] =3D NULL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;drmcg_mutex);<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(drmcg_unregister_device_mm);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 * drmcg_try_chg_bo_alloc - charge GEM buffer usage for a =
device and cgroup<br>
&gt;=C2=A0 =C2=A0 * @drmcg: the DRM cgroup to be charged to<br>
&gt; @@ -1013,6 +1036,13 @@ void drmcg_mem_track_move(struct ttm_buffer_obj=
ect *old_bo, bool evict,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ddr-&gt;mem_bw_s=
tats[DRMCG_MEM_BW_ATTR_BYTE_CREDIT]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-=3D move_in_bytes;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dev-&gt;drmcg_pro=
ps.mem_reclaim_wq[new_mem_type]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0!=3D NULL &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ddr-&gt;mem_stats[new_mem_type] &gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ddr-&gt;mem_highs[new_mem_type])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0schedule_work(dev-&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drmcg_props.mem_reclaim_wq[new_mem_type]=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;dev-&gt;drmcg_mutex);<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
</blockquote></div>

--0000000000007024a405914208cc--

--===============1985058733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1985058733==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F209B95A614
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3AE10E6D6;
	Wed, 21 Aug 2024 20:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HHj5Dz3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C7610E6DD;
 Wed, 21 Aug 2024 20:48:37 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1fc47aef524so97345ad.3; 
 Wed, 21 Aug 2024 13:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724273317; x=1724878117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpZRcCD/VYBwDZRN1EAlA+jug5jtsVLt5tDHDEYvDq4=;
 b=HHj5Dz3bTwQWqmiUqUOZ2DLLNcAKCPRa4F2ioZNv+Z1jBa+A2AECMc/cIohUTtzdyS
 MzrOdJFjuQMvtMv544HcTiBNX20uyctwEl0+aRMS+pCeBBik1B++GH3YtgDZ0QwgwHs2
 6jbkSEvFo5GLyPWlB9uPsytp+bV4kzAbYBRt15K8+/LxY6VqV3RVtXVwWBcQejy9ZPUZ
 RFrdnalrMt4PaUAskHjthePxZS0RmDUdrBRUpF6JDBD/pIvYqTNcEZ+iacjMDA2APWKm
 /k312BQ1X+wsbpQ/HBTQd+Z3ep9anxkbJq+Nk7UciKLmJltvhLR9Ep48NxE/BVz5uJMA
 2TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724273317; x=1724878117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kpZRcCD/VYBwDZRN1EAlA+jug5jtsVLt5tDHDEYvDq4=;
 b=LwFr8aipIYVQhPG3/oagEMzjVCpNHwVFZnf4AXu+e3rzT0P1xf7yoEDlGQ3uL0k8tF
 Mr3FL6B/diFPJj+fQbm/FxIIXTfnUEIXKKeAUdm+0XimB98UqD+5oBqzM9C/EnIcajRg
 Qu0xb6Nkec7AT3fOcAumd9v6Q6cceGBFDb2gDAWW9d5+ARnQb80iP74/i7G+qDOVm+68
 Ca1kYj1lK9A2TEk1N1KGYypTKfsyUvROHXZpSWVkB7RKmgF0Mpxwku3GhVC9pt/FVqnh
 bqw6IK/V6bf59OcgW+A37DXRXi8dilBYt9Pttham9KKTxW9krikMyMpNNygAzuAIA9XP
 wtMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcGIajXxzboZ5joR487ubK+8TKuITaQuR8iUodcO4KW9ux85fI42xyizN4oMlb87oo7FFMysg4fog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5deVYoZzs5tqPFce+zSf15auFM+hMa1NvvlWcG2YFxUCoi95D
 UedsEp2RfNNW2KEfGfsmuMK3qtHArJ+/UgvXFg2ga/ZrPUpkTg16par1vMfqopMNYi4JWPhz68l
 jX19z+GOlQsWmuypHDFpcRovS7VM=
X-Google-Smtp-Source: AGHT+IGcsNEfidKyJzWWhmHDFkaA5diH4pNh59DVu91eiKZ+6wf48Q3rhxHt/+6Y2vyMpg2PapjH9OUHGo3xE2/PyTU=
X-Received: by 2002:a17:902:e5c8:b0:1fa:ab4a:fb02 with SMTP id
 d9443c01a7336-20366dc3803mr23081605ad.0.1724273317099; Wed, 21 Aug 2024
 13:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240813135712.82611-1-tursulin@igalia.com>
 <20240813135712.82611-3-tursulin@igalia.com>
 <CADnq5_PV8+bvCutxko-La+wkvpQ0x_Rw8kXavuy4w-OrZtszkw@mail.gmail.com>
In-Reply-To: <CADnq5_PV8+bvCutxko-La+wkvpQ0x_Rw8kXavuy4w-OrZtszkw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2024 16:48:25 -0400
Message-ID: <CADnq5_MHd_hnrVqOnLKYoDjYPqTdG9ruLLkDSv+ACbY_FifVbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Use drm_print_memory_stats helper from
 fdinfo
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 21, 2024 at 4:43=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Tue, Aug 13, 2024 at 9:57=E2=80=AFAM Tvrtko Ursulin <tursulin@igalia.c=
om> wrote:
> >
> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >
> > Convert fdinfo memory stats to use the common drm_print_memory_stats
> > helper.
> >
> > This achieves alignment with the common keys as documented in
> > drm-usage-stats.rst, adding specifically drm-total- key the driver was
> > missing until now.
> >
> > Additionally I made the code stop skipping total size for objects which
> > currently do not have a backing store, and I added resident, active and
> > purgeable reporting.
> >
> > Legacy keys have been preserved, with the outlook of only potentially
> > removing only the drm-memory- when the time gets right.
> >
> > The example output now looks like this:
> >
> >  pos:   0
> >  flags: 02100002
> >  mnt_id:        24
> >  ino:   1239
> >  drm-driver:    amdgpu
> >  drm-client-id: 4
> >  drm-pdev:      0000:04:00.0
> >  pasid: 32771
> >  drm-total-cpu: 0
> >  drm-shared-cpu:        0
> >  drm-active-cpu:        0
> >  drm-resident-cpu:      0
> >  drm-purgeable-cpu:     0
>
> This looks ok to me, but I'm wondering if there is any value to
> keeping the cpu pool around in the stats?

Actually thinking about this more, I think we'd want both the old
fields and the new fields for backwards compatibility?

Alex

>
> Alex
>
>
> >  drm-total-gtt: 2392 KiB
> >  drm-shared-gtt:        0
> >  drm-active-gtt:        0
> >  drm-resident-gtt:      2392 KiB
> >  drm-purgeable-gtt:     0
> >  drm-total-vram:        44564 KiB
> >  drm-shared-vram:       31952 KiB
> >  drm-active-vram:       0
> >  drm-resident-vram:     44564 KiB
> >  drm-purgeable-vram:    0
> >  drm-memory-vram:       44564 KiB
> >  drm-memory-gtt:        2392 KiB
> >  drm-memory-cpu:        0 KiB
> >  amd-memory-visible-vram:       44564 KiB
> >  amd-evicted-vram:      0 KiB
> >  amd-evicted-visible-vram:      0 KiB
> >  amd-requested-vram:    44564 KiB
> >  amd-requested-visible-vram:    11952 KiB
> >  amd-requested-gtt:     2392 KiB
> >  drm-engine-compute:    46464671 ns
> >
> > v2:
> >  * Track purgeable via AMDGPU_GEM_CREATE_DISCARDABLE.
> >
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 48 +++++++----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 96 +++++++++++++++-------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 35 +++-----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 20 +++--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h     |  3 +-
> >  6 files changed, 122 insertions(+), 81 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_fdinfo.c
> > index c7df7fa3459f..00a4ab082459 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> > @@ -59,18 +59,21 @@ void amdgpu_show_fdinfo(struct drm_printer *p, stru=
ct drm_file *file)
> >         struct amdgpu_fpriv *fpriv =3D file->driver_priv;
> >         struct amdgpu_vm *vm =3D &fpriv->vm;
> >
> > -       struct amdgpu_mem_stats stats;
> > +       struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST + 1] =3D { };
> >         ktime_t usage[AMDGPU_HW_IP_NUM];
> > -       unsigned int hw_ip;
> > +       const char *pl_name[] =3D {
> > +               [TTM_PL_VRAM] =3D "vram",
> > +               [TTM_PL_TT] =3D "gtt",
> > +               [TTM_PL_SYSTEM] =3D "cpu",
> > +       };
> > +       unsigned int hw_ip, i;
> >         int ret;
> >
> > -       memset(&stats, 0, sizeof(stats));
> > -
> >         ret =3D amdgpu_bo_reserve(vm->root.bo, false);
> >         if (ret)
> >                 return;
> >
> > -       amdgpu_vm_get_memory(vm, &stats);
> > +       amdgpu_vm_get_memory(vm, stats, ARRAY_SIZE(stats));
> >         amdgpu_bo_unreserve(vm->root.bo);
> >
> >         amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
> > @@ -82,24 +85,35 @@ void amdgpu_show_fdinfo(struct drm_printer *p, stru=
ct drm_file *file)
> >          */
> >
> >         drm_printf(p, "pasid:\t%u\n", fpriv->vm.pasid);
> > -       drm_printf(p, "drm-memory-vram:\t%llu KiB\n", stats.vram/1024UL=
);
> > -       drm_printf(p, "drm-memory-gtt: \t%llu KiB\n", stats.gtt/1024UL)=
;
> > -       drm_printf(p, "drm-memory-cpu: \t%llu KiB\n", stats.cpu/1024UL)=
;
> > +
> > +       for (i =3D 0; i < TTM_PL_PRIV; i++)
> > +               drm_print_memory_stats(p,
> > +                                      &stats[i].drm,
> > +                                      DRM_GEM_OBJECT_RESIDENT |
> > +                                      DRM_GEM_OBJECT_PURGEABLE,
> > +                                      pl_name[i]);
> > +
> > +       /* Legacy amdgpu keys, alias to drm-resident-memory-: */
> > +       drm_printf(p, "drm-memory-vram:\t%llu KiB\n",
> > +                  stats[TTM_PL_VRAM].total/1024UL);
> > +       drm_printf(p, "drm-memory-gtt: \t%llu KiB\n",
> > +                  stats[TTM_PL_TT].total/1024UL);
> > +       drm_printf(p, "drm-memory-cpu: \t%llu KiB\n",
> > +                  stats[TTM_PL_SYSTEM].total/1024UL);
> > +
> > +       /* Amdgpu specific memory accounting keys: */
> >         drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
> > -                  stats.visible_vram/1024UL);
> > +                  stats[TTM_PL_VRAM].visible/1024UL);
> >         drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
> > -                  stats.evicted_vram/1024UL);
> > +                  stats[TTM_PL_VRAM].evicted/1024UL);
> >         drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
> > -                  stats.evicted_visible_vram/1024UL);
> > +                  stats[TTM_PL_VRAM].evicted_visible/1024UL);
> >         drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
> > -                  stats.requested_vram/1024UL);
> > +                  stats[TTM_PL_VRAM].requested/1024UL);
> >         drm_printf(p, "amd-requested-visible-vram:\t%llu KiB\n",
> > -                  stats.requested_visible_vram/1024UL);
> > +                  stats[TTM_PL_VRAM].requested_visible/1024UL);
> >         drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
> > -                  stats.requested_gtt/1024UL);
> > -       drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared=
/1024UL);
> > -       drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/1=
024UL);
> > -       drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/1=
024UL);
> > +                  stats[TTM_PL_TT].requested/1024UL);
> >
> >         for (hw_ip =3D 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
> >                 if (!usage[hw_ip])
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_object.c
> > index e32161f6b67a..7facddeab799 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > @@ -1284,54 +1284,92 @@ void amdgpu_bo_move_notify(struct ttm_buffer_ob=
ject *bo,
> >  }
> >
> >  void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> > -                         struct amdgpu_mem_stats *stats)
> > +                         struct amdgpu_mem_stats *stats,
> > +                         unsigned int sz)
> >  {
> > +       const unsigned int domain_to_pl[] =3D {
> > +               [ilog2(AMDGPU_GEM_DOMAIN_CPU)]      =3D TTM_PL_SYSTEM,
> > +               [ilog2(AMDGPU_GEM_DOMAIN_GTT)]      =3D TTM_PL_TT,
> > +               [ilog2(AMDGPU_GEM_DOMAIN_VRAM)]     =3D TTM_PL_VRAM,
> > +               [ilog2(AMDGPU_GEM_DOMAIN_GDS)]      =3D AMDGPU_PL_GDS,
> > +               [ilog2(AMDGPU_GEM_DOMAIN_GWS)]      =3D AMDGPU_PL_GWS,
> > +               [ilog2(AMDGPU_GEM_DOMAIN_OA)]       =3D AMDGPU_PL_OA,
> > +               [ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] =3D AMDGPU_PL_DOORB=
ELL,
> > +       };
> >         struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
> >         struct ttm_resource *res =3D bo->tbo.resource;
> > +       struct drm_gem_object *obj =3D &bo->tbo.base;
> >         uint64_t size =3D amdgpu_bo_size(bo);
> > -       struct drm_gem_object *obj;
> > -       bool shared;
> > +       unsigned int type;
> >
> > -       /* Abort if the BO doesn't currently have a backing store */
> > -       if (!res)
> > -               return;
> > +       if (!res) {
> > +               /*
> > +                * If no backing store use one of the preferred domain =
for basic
> > +                * stats. We take the MSB since that should give a reas=
onable
> > +                * view.
> > +                */
> > +               BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT ||
> > +                            TTM_PL_VRAM < TTM_PL_SYSTEM);
> > +               type =3D fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_=
MASK);
> > +               if (!type)
> > +                       return;
> > +               type--;
> > +               if (drm_WARN_ON_ONCE(&adev->ddev,
> > +                                    type >=3D ARRAY_SIZE(domain_to_pl)=
))
> > +                       return;
> > +               type =3D domain_to_pl[type];
> > +       } else {
> > +               type =3D res->mem_type;
> > +       }
> >
> > -       obj =3D &bo->tbo.base;
> > -       shared =3D drm_gem_object_is_shared_for_memory_stats(obj);
> > -
> > -       switch (res->mem_type) {
> > +       /* Squash some into 'cpu' to keep the legacy userspace view. */
> > +       switch (type) {
> >         case TTM_PL_VRAM:
> > -               stats->vram +=3D size;
> > -               if (amdgpu_res_cpu_visible(adev, res))
> > -                       stats->visible_vram +=3D size;
> > -               if (shared)
> > -                       stats->vram_shared +=3D size;
> > -               break;
> >         case TTM_PL_TT:
> > -               stats->gtt +=3D size;
> > -               if (shared)
> > -                       stats->gtt_shared +=3D size;
> > -               break;
> >         case TTM_PL_SYSTEM:
> > +               break;
> >         default:
> > -               stats->cpu +=3D size;
> > -               if (shared)
> > -                       stats->cpu_shared +=3D size;
> > +               type =3D TTM_PL_SYSTEM;
> >                 break;
> >         }
> >
> > +       if (drm_WARN_ON_ONCE(&adev->ddev, type >=3D sz))
> > +               return;
> > +
> > +       /* DRM stats common fields: */
> > +
> > +       stats[type].total +=3D size;
> > +       if (drm_gem_object_is_shared_for_memory_stats(obj))
> > +               stats[type].drm.shared +=3D size;
> > +       else
> > +               stats[type].drm.private +=3D size;
> > +
> > +       if (res) {
> > +               stats[type].drm.resident +=3D size;
> > +
> > +               if (!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_B=
OOKKEEP))
> > +                       stats[type].drm.active +=3D size;
> > +               else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
> > +                       stats[type].drm.purgeable +=3D size;
> > +
> > +               if (type =3D=3D TTM_PL_VRAM && amdgpu_res_cpu_visible(a=
dev, res))
> > +                       stats[type].visible +=3D size;
> > +       }
> > +
> > +       /* amdgpu specific stats: */
> > +
> >         if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
> > -               stats->requested_vram +=3D size;
> > +               stats[TTM_PL_VRAM].requested +=3D size;
> >                 if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
> > -                       stats->requested_visible_vram +=3D size;
> > +                       stats[TTM_PL_VRAM].requested_visible +=3D size;
> >
> > -               if (res->mem_type !=3D TTM_PL_VRAM) {
> > -                       stats->evicted_vram +=3D size;
> > +               if (type !=3D TTM_PL_VRAM) {
> > +                       stats[TTM_PL_VRAM].evicted +=3D size;
> >                         if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_RE=
QUIRED)
> > -                               stats->evicted_visible_vram +=3D size;
> > +                               stats[TTM_PL_VRAM].evicted_visible +=3D=
 size;
> >                 }
> >         } else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
> > -               stats->requested_gtt +=3D size;
> > +               stats[TTM_PL_TT].requested +=3D size;
> >         }
> >  }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_object.h
> > index bc42ccbde659..44774584a29f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > @@ -136,30 +136,14 @@ struct amdgpu_bo_vm {
> >  };
> >
> >  struct amdgpu_mem_stats {
> > -       /* current VRAM usage, includes visible VRAM */
> > -       uint64_t vram;
> > -       /* current shared VRAM usage, includes visible VRAM */
> > -       uint64_t vram_shared;
> > -       /* current visible VRAM usage */
> > -       uint64_t visible_vram;
> > -       /* current GTT usage */
> > -       uint64_t gtt;
> > -       /* current shared GTT usage */
> > -       uint64_t gtt_shared;
> > -       /* current system memory usage */
> > -       uint64_t cpu;
> > -       /* current shared system memory usage */
> > -       uint64_t cpu_shared;
> > -       /* sum of evicted buffers, includes visible VRAM */
> > -       uint64_t evicted_vram;
> > -       /* sum of evicted buffers due to CPU access */
> > -       uint64_t evicted_visible_vram;
> > -       /* how much userspace asked for, includes vis.VRAM */
> > -       uint64_t requested_vram;
> > -       /* how much userspace asked for */
> > -       uint64_t requested_visible_vram;
> > -       /* how much userspace asked for */
> > -       uint64_t requested_gtt;
> > +       struct drm_memory_stats drm;
> > +
> > +       uint64_t total;
> > +       uint64_t visible;
> > +       uint64_t evicted;
> > +       uint64_t evicted_visible;
> > +       uint64_t requested;
> > +       uint64_t requested_visible;
> >  };
> >
> >  static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_obj=
ect *tbo)
> > @@ -342,7 +326,8 @@ int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void =
*owner, bool intr);
> >  u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
> >  u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
> >  void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> > -                         struct amdgpu_mem_stats *stats);
> > +                         struct amdgpu_mem_stats *stats,
> > +                         unsigned int size);
> >  void amdgpu_bo_add_to_shadow_list(struct amdgpu_bo_vm *vmbo);
> >  int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow,
> >                              struct dma_fence **fence);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.h
> > index 138d80017f35..2852a6064c9a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> > @@ -34,6 +34,7 @@
> >  #define AMDGPU_PL_OA           (TTM_PL_PRIV + 2)
> >  #define AMDGPU_PL_PREEMPT      (TTM_PL_PRIV + 3)
> >  #define AMDGPU_PL_DOORBELL     (TTM_PL_PRIV + 4)
> > +#define __AMDGPU_PL_LAST       (TTM_PL_PRIV + 4)
> >
> >  #define AMDGPU_GTT_MAX_TRANSFER_SIZE   512
> >  #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS        2
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 52e6a0b3f0c8..86c3ee0e86e8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -1090,7 +1090,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *=
adev, struct amdgpu_vm *vm,
> >  }
> >
> >  static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
> > -                                   struct amdgpu_mem_stats *stats)
> > +                                   struct amdgpu_mem_stats *stats,
> > +                                   unsigned int size)
> >  {
> >         struct amdgpu_vm *vm =3D bo_va->base.vm;
> >         struct amdgpu_bo *bo =3D bo_va->base.bo;
> > @@ -1106,34 +1107,35 @@ static void amdgpu_vm_bo_get_memory(struct amdg=
pu_bo_va *bo_va,
> >             !dma_resv_trylock(bo->tbo.base.resv))
> >                 return;
> >
> > -       amdgpu_bo_get_memory(bo, stats);
> > +       amdgpu_bo_get_memory(bo, stats, size);
> >         if (!amdgpu_vm_is_bo_always_valid(vm, bo))
> >                 dma_resv_unlock(bo->tbo.base.resv);
> >  }
> >
> >  void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> > -                         struct amdgpu_mem_stats *stats)
> > +                         struct amdgpu_mem_stats *stats,
> > +                         unsigned int size)
> >  {
> >         struct amdgpu_bo_va *bo_va, *tmp;
> >
> >         spin_lock(&vm->status_lock);
> >         list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
> > -               amdgpu_vm_bo_get_memory(bo_va, stats);
> > +               amdgpu_vm_bo_get_memory(bo_va, stats, size);
> >
> >         list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_stat=
us)
> > -               amdgpu_vm_bo_get_memory(bo_va, stats);
> > +               amdgpu_vm_bo_get_memory(bo_va, stats, size);
> >
> >         list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_st=
atus)
> > -               amdgpu_vm_bo_get_memory(bo_va, stats);
> > +               amdgpu_vm_bo_get_memory(bo_va, stats, size);
> >
> >         list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status=
)
> > -               amdgpu_vm_bo_get_memory(bo_va, stats);
> > +               amdgpu_vm_bo_get_memory(bo_va, stats, size);
> >
> >         list_for_each_entry_safe(bo_va, tmp, &vm->invalidated, base.vm_=
status)
> > -               amdgpu_vm_bo_get_memory(bo_va, stats);
> > +               amdgpu_vm_bo_get_memory(bo_va, stats, size);
> >
> >         list_for_each_entry_safe(bo_va, tmp, &vm->done, base.vm_status)
> > -               amdgpu_vm_bo_get_memory(bo_va, stats);
> > +               amdgpu_vm_bo_get_memory(bo_va, stats, size);
> >         spin_unlock(&vm->status_lock);
> >  }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.h
> > index 046949c4b695..c66ec14dd3d1 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > @@ -566,7 +566,8 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
> >  void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
> >                                 struct amdgpu_vm *vm);
> >  void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> > -                         struct amdgpu_mem_stats *stats);
> > +                         struct amdgpu_mem_stats *stats,
> > +                         unsigned int size);
> >
> >  int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *v=
m,
> >                        struct amdgpu_bo_vm *vmbo, bool immediate);
> > --
> > 2.44.0
> >

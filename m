Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7018BE93D8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 16:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8799C10E0DC;
	Fri, 17 Oct 2025 14:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="WWf3FNwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E1E10E0DC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 14:40:58 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-26e68904f0eso20904165ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1760712058; x=1761316858;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMQd8txzUUmYEnaTxXJyHYDc829aT8y4vYYRDHtKtdg=;
 b=WWf3FNwxKz6yEcaDdtJrFfIADngS0ILls18jjH3im03Eh2lHh/3PRVq59bh9bcY0CY
 IjfOqwXpKk7EiDeStwcnryIQ6N1rwrY9caWnGSOKBgJvcuf4f3X/b4KBzRZw7XdvU0C2
 eqweKyLlj5HTr0OpcEn6xr/Z/dTsPciBG6vBdRMoMQ4ShoaRigQPCcjq5WBaf0EgCEnP
 xEWMhgoqveSNFnvjVbdl9ZZZkWbEMBrBqPCQxPGW2K2vHIeok499WjYM3lTAhuwcPE+L
 8zYNm1/ZluXtcKmFTpEMdlcGxhYGdpuj4DFiZkwapt4pok2B7GUQws7ZhPVIkETYxbAe
 mWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760712058; x=1761316858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMQd8txzUUmYEnaTxXJyHYDc829aT8y4vYYRDHtKtdg=;
 b=cPCMsU9t66Yuu97IyYbotLQTMLTIkndiygG9dv60rWrVagHBoIzbiSv2Qn7YFTZDv1
 cNkuQWnfTC7IwcTq36ioWNAZpKzAoDoIVvhebdO83dNJERDJzOUR31upeb0SDJlpmMHx
 PvCFM5pIww1UlyYfi5mAdLzIkzRkig+LBniaejll2CQqhH3uNHWea73omkgOr4J9nFeJ
 dOUEyYYraKpr/5D/Ji1X5c8PsxymdcfvvufcSYGxwzRR+TLspW6XSmgFSJTb6LiPd2d4
 FBJGPXODwm78EG006qcawrKI8dD1A7gLTRG0837d1ZBccJnrzQfJknP5QSXk/1szNhFp
 m2uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBCMCBfWuPCmErmzCwWsUUE1keIOjTvBpf+XSmjO8imhebi99z7JyJtwVYU2OZp/BFiQ9R5JfG3o0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn9TcZn+Iyyan6kwTji6PYhLR7dnblrS4zghGoXr/Jl7Q+Xdjw
 2RbC0cBbIRDJvOHP5NC5UwEDv0b/yL2/6uaBSedLmU4fXq2TF3JsXzESFNnkScGxKruiLAHgRVm
 sY2RTHKBVRIY8dopeELb5M+mh7QpvNi3ujMVuJ/OPEQ==
X-Gm-Gg: ASbGncuVSo4aFr3pe6fX0pFVty/yYzoCnfuvi1WjtohYHUFpMjH2yt12x1VohZ0vjkc
 lVpNTF5Ywf7rT9nBosnPGd8/3HLXDYno6w7av0WlZWMt07OweGoPlI5gdFRsslptTZHYAYg/IER
 85876ZyIaE3ku9Pk/JYaV8BIbMZ207jgQWQUS/lqwTXH6n06gR6TmN4XgHPeC5QMMTiHpwerAMz
 XDAkxyB2p6N+iwskfrTkS6uk7lzbvEjckxoqEpUuN4hgd/dqy03L7kjBtUpZ5D2VwaIJvnN
X-Google-Smtp-Source: AGHT+IFnmWgxSCzaFLM2BQjY/Jj5Ug1H0XlAqsGKQs6yPyFoO80a0ely5opCStuhQaQddxKX/rJyC9l0B7hgCL88V8Y=
X-Received: by 2002:a17:903:46c8:b0:24b:1589:5054 with SMTP id
 d9443c01a7336-290c9cc3da9mr43241205ad.23.1760712057593; Fri, 17 Oct 2025
 07:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <CAOFGe96trw17pWKv4-Bbh9bvCz8ANTwAcL-croQQw24800fLbQ@mail.gmail.com>
In-Reply-To: <CAOFGe96trw17pWKv4-Bbh9bvCz8ANTwAcL-croQQw24800fLbQ@mail.gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 17 Oct 2025 10:40:46 -0400
X-Gm-Features: AS18NWD9LDo935atn-0l5WQCUc7PnuiHXJZRMkHR-9YlempjEADlY5LCS6z2Sg4
Message-ID: <CAOFGe96pKQhuhUCzVizUndgQL80+GsS-YiiRcMiO=eHBnYAHxg@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
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

On Fri, Oct 17, 2025 at 10:32=E2=80=AFAM Faith Ekstrand <faith@gfxstrand.ne=
t> wrote:
>
> On Wed, Oct 15, 2025 at 12:04=E2=80=AFPM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Prepare things for standardizing synchronization around CPU accesses
> > of GEM buffers. This will be used to provide default
> > drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and provide
> > a way for drivers to add their own ioctls to synchronize CPU
> > writes/reads when they can't do it directly from userland.
> >
> > v2:
> > - New commit
> >
> > v3:
> > - No changes
> >
> > v4:
> > - Add Steve's R-b
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Steven Price <steven.price@arm.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 10 +++++++++
> >  include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 55 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index a1a9c828938b..a1431e4f2404 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object *obj, =
struct iosys_map *map)
> >  }
> >  EXPORT_SYMBOL(drm_gem_vunmap);
> >
> > +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t siz=
e,
> > +                enum drm_gem_object_access_flags access)
> > +{
> > +       if (obj->funcs->sync)
> > +               return obj->funcs->sync(obj, offset, size, access);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL(drm_gem_sync);
> > +
> >  /**
> >   * drm_gem_lock_reservations - Sets up the ww context and acquires
> >   * the lock on an array of GEM objects.
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 8d48d2af2649..1c33e59ab305 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -66,6 +66,33 @@ enum drm_gem_object_status {
> >         DRM_GEM_OBJECT_ACTIVE    =3D BIT(2),
> >  };
> >
> > +/**
> > + * enum drm_gem_object_status - bitmask describing GEM access types to=
 prepare for
> > + */
> > +enum drm_gem_object_access_flags {
> > +       /** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access. */
> > +       DRM_GEM_OBJECT_CPU_ACCESS =3D 0,
> > +
> > +       /** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device access. */
> > +       DRM_GEM_OBJECT_DEV_ACCESS =3D BIT(0),
> > +
> > +       /** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the entit=
y doing the access. */
> > +       DRM_GEM_OBJECT_ACCESSOR_MASK =3D BIT(0),
> > +
> > +       /** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only accesses=
. */
> > +       DRM_GEM_OBJECT_READ_ACCESS =3D BIT(1),
> > +
> > +       /** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only access=
es. */
> > +       DRM_GEM_OBJECT_WRITE_ACCESS =3D BIT(2),
> > +
> > +       /** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write accesse=
s. */
> > +       DRM_GEM_OBJECT_RW_ACCESS =3D DRM_GEM_OBJECT_READ_ACCESS |
> > +                                  DRM_GEM_OBJECT_WRITE_ACCESS,
> > +
> > +       /** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check the ac=
cess type. */
> > +       DRM_GEM_OBJECT_ACCESS_TYPE_MASK =3D DRM_GEM_OBJECT_RW_ACCESS,
> > +};
> > +
> >  /**
> >   * struct drm_gem_object_funcs - GEM object functions
> >   */
> > @@ -191,6 +218,21 @@ struct drm_gem_object_funcs {
> >          */
> >         int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *=
vma);
> >
> > +       /**
> > +        * @sync:
> > +        *
> > +        * Prepare for CPU/device access. This can involve migration of
> > +        * a buffer to the system-RAM/VRAM, or for UMA, flushing/invali=
dating
> > +        * the CPU caches. The range can be used to optimize the synchr=
onization
> > +        * when possible.
>
> This has gone in a very different direction from the version I sent
> out and the added generality makes me really nervous. The idea of sync
> involving migration and that the range is a mere hint are antithetical
> with Vulkan. It's a very GLish design that assumes that a BO is
> exclusively used by one of the CPU or the GPU at the same time. This
> simply isn't the case in modern APIs. Older DRM uAPIs (as well as
> dma-buf itself) are littered with such ioctls and we're in the process
> of deleting them all.

And yes, I realize I sent this on the patch for the hook which you
intended to plumb through to dma-buf. However, I also saw it being
propagated to an ioctl and I didn't know where else to put it that had
the relevant details.

~Faith

> If the BO needs to be migrated in order to be accessed from the CPU,
> that needs to happen on map, not on some sort of begin/end. Or better
> yet, just disallow mapping such buffers. Once the client has a map,
> they are free to access from the CPU while stuff is running on the
> GPU. They have to be careful, of course, not to cause data races, but
> accessing the same BO from the CPU and GPU or even the same range is
> totally okay if you aren't racing.
>
> As a corollary, just don't map PRIME buffers.
>
> And the range really shouldn't be just a hint. With Vulkan, clients
> are regularly sub-allocating from larger memory objects. If they ask
> to flush 64B and end up flushing 64M, that's pretty bad.
>
> All we need is something which lets us trap through to the kernel for
> CPU cache management. That's all we need and that's really all it
> should do.
>
> ~Faith
>
> > +        *
> > +        * Returns 0 on success, -errno otherwise.
> > +        *
> > +        * This callback is optional.
> > +        */
> > +       int (*sync)(struct drm_gem_object *obj, size_t offset, size_t s=
ize,
> > +                   enum drm_gem_object_access_flags access);
> > +
> >         /**
> >          * @evict:
> >          *
> > @@ -559,6 +601,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);
> >  int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
> >  void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)=
;
> >
> > +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t siz=
e,
> > +                enum drm_gem_object_access_flags access);
> > +
> >  int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_hand=
les,
> >                            int count, struct drm_gem_object ***objs_out=
);
> >  struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u3=
2 handle);
> > --
> > 2.51.0
> >

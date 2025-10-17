Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE259BEA52D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145B810E0AC;
	Fri, 17 Oct 2025 15:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="FoLDaGps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A72110E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:57:21 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-269af38418aso22532355ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1760716640; x=1761321440;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSvVehz3jWOnkI0OFSbAN6zxKe2rv7b1VhwsAyb476Q=;
 b=FoLDaGps/4w6zfU0Yanwdhzi7TYG4HIQKOLRG51mXJpAA5/p3gTotvuBmrm1chDd/5
 PjIJfOOQbsF5q16eB+8YxtQI7PqprxZUEjlQOpVjYRm88XkqK0/RcTKcrVgIxM36OkpA
 hH6SzIzrDDTZhv6FzP4Sx26ysTI5vyu92sLDdUYTkiCNYWt5Rphl6KGjcsv4/38Ew9fF
 s6Y60R0S7W/aXelcdcqPaju5YsNSZyWyvRxoF2cRU2RSSsm/AQZp79G1I0XoAQ9TNg2c
 MJ8M2anggm4QNCPDy98H9iGNlYtnIfnEzTBzGxuiWm8+2qPtgIt+2MU3xR5oWlPRhnK4
 aStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760716640; x=1761321440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSvVehz3jWOnkI0OFSbAN6zxKe2rv7b1VhwsAyb476Q=;
 b=CZw5aZZVukMs5wJWxRrPJ3CMEn0VyBBbqJmHUXn9r6+6U7A8hV+RHkhBFwUl/6Zg2C
 0xytdG3+VkJmAt7AtODdkpbnw3/Vp+CF4hUZwujlXPFBVTi0t3jUvvPUOWy/cZhc9RTQ
 TUWXZlVHK8xGGvGAwB1R6J2uVJKKG4wwPauGfp2DD44CcvWR1gY3eWp7cssd3xgjfjWf
 4Ps0W7ZJWIdogHH8kxxfVkDWZm40VRr9kYYrtofjI5wNl7v8dg4vLlY5qRRGLFlMsEpJ
 INhYwIY9em+EU4rK+8PlGrv3R8eNHAPYlKsWtLKbL/Qdy4ZOnhpCGXfVSyzkGY4+A4Sr
 GO9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiGWPyB495PoZ7M6XK+CgKAW1ww0kExXP2z3KSbiK7Ep5mOK37lRAd9xqSVHFjE1nYE2e56gQO/yg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSuzM90FhN/p+EFGJULnZ3gE+feoLdu8JNNcsG0eV52EjhO6TV
 jSRZNcHEfuC/6Q6XDEdtrwZJZIHI1MVGKxJ/lInF5SnEVWJZZEAxyUixzVvXmwl8iGtJvXFmUgG
 0fcOVcsOw8F03UyTVJoZCiRWWEIgVEEIbjxa2qEOmmsTyVLA35465Eug=
X-Gm-Gg: ASbGncvT7E+bU4UuxmerB7bOv/8Ua/n/R9eAwYMW/jKFl+e5wkc1xyBnKuRILVktVVh
 r9W+etcxtxC4SGHh3FMAOl2iKFrvCHVGMMu1F0LPMyGR/KCcKjhuY9OKFPyEbacNh1AWY6JMCWV
 xskQympim1FCER0rXzuer3Y4GEjaU6ELDxyjyeGnXEjFWRiAZgQQCiIeOSE3U7J1ieQI/npKupI
 rE6w854VihUW5yrIkCLKLAabeoqQhIAP9JWKsfbAKIxZfWaVZSuNakRxhH6dQ==
X-Google-Smtp-Source: AGHT+IFV69P1/qbJejdVyb0VrcDl56mOScGjbGTvsLvfn4SW4ZJgpSuY9B550d0Y/Ab2D0hoAMSLxwqhxI7CWrjFLw0=
X-Received: by 2002:a17:903:2309:b0:262:9c4:5470 with SMTP id
 d9443c01a7336-290caf85241mr52732355ad.28.1760716640038; Fri, 17 Oct 2025
 08:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <CAOFGe96trw17pWKv4-Bbh9bvCz8ANTwAcL-croQQw24800fLbQ@mail.gmail.com>
 <CAOFGe96pKQhuhUCzVizUndgQL80+GsS-YiiRcMiO=eHBnYAHxg@mail.gmail.com>
 <20251017172657.2690bbca@fedora>
 <CAOFGe97gKbek59Mri-+Fb4gLLkt2vJC-szc110fCYvcfRtE8iw@mail.gmail.com>
 <20251017175008.3ac142c7@fedora>
In-Reply-To: <20251017175008.3ac142c7@fedora>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 17 Oct 2025 11:57:08 -0400
X-Gm-Features: AS18NWBn3r1G9Ef32Opa-VHSyiKjl5r5LcXTooFadF1nqyiiXeILVyuUOo3eAjU
Message-ID: <CAOFGe96n+XZC_Hu7NBahA8Zw206FYXmJMC_hKfbZ2cqu453oWA@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and
 a drm_gem_sync() helper
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com, 
 Matt Coster <Matt.Coster@imgtec.com>
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

On Fri, Oct 17, 2025 at 11:50=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> +Matt for my comment on PVR having the same issue.
>
> On Fri, 17 Oct 2025 11:35:54 -0400
> Faith Ekstrand <faith@gfxstrand.net> wrote:
>
> > On Fri, Oct 17, 2025 at 11:27=E2=80=AFAM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > >
> > > On Fri, 17 Oct 2025 10:40:46 -0400
> > > Faith Ekstrand <faith@gfxstrand.net> wrote:
> > >
> > > > On Fri, Oct 17, 2025 at 10:32=E2=80=AFAM Faith Ekstrand <faith@gfxs=
trand.net> wrote:
> > > > >
> > > > > On Wed, Oct 15, 2025 at 12:04=E2=80=AFPM Boris Brezillon
> > > > > <boris.brezillon@collabora.com> wrote:
> > > > > >
> > > > > > Prepare things for standardizing synchronization around CPU acc=
esses
> > > > > > of GEM buffers. This will be used to provide default
> > > > > > drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and pr=
ovide
> > > > > > a way for drivers to add their own ioctls to synchronize CPU
> > > > > > writes/reads when they can't do it directly from userland.
> > > > > >
> > > > > > v2:
> > > > > > - New commit
> > > > > >
> > > > > > v3:
> > > > > > - No changes
> > > > > >
> > > > > > v4:
> > > > > > - Add Steve's R-b
> > > > > >
> > > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > > Reviewed-by: Steven Price <steven.price@arm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_gem.c | 10 +++++++++
> > > > > >  include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++=
++++++++
> > > > > >  2 files changed, 55 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_ge=
m.c
> > > > > > index a1a9c828938b..a1431e4f2404 100644
> > > > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > > > @@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_objec=
t *obj, struct iosys_map *map)
> > > > > >  }
> > > > > >  EXPORT_SYMBOL(drm_gem_vunmap);
> > > > > >
> > > > > > +int drm_gem_sync(struct drm_gem_object *obj, size_t offset, si=
ze_t size,
> > > > > > +                enum drm_gem_object_access_flags access)
> > > > > > +{
> > > > > > +       if (obj->funcs->sync)
> > > > > > +               return obj->funcs->sync(obj, offset, size, acce=
ss);
> > > > > > +
> > > > > > +       return 0;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL(drm_gem_sync);
> > > > > > +
> > > > > >  /**
> > > > > >   * drm_gem_lock_reservations - Sets up the ww context and acqu=
ires
> > > > > >   * the lock on an array of GEM objects.
> > > > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > > > index 8d48d2af2649..1c33e59ab305 100644
> > > > > > --- a/include/drm/drm_gem.h
> > > > > > +++ b/include/drm/drm_gem.h
> > > > > > @@ -66,6 +66,33 @@ enum drm_gem_object_status {
> > > > > >         DRM_GEM_OBJECT_ACTIVE    =3D BIT(2),
> > > > > >  };
> > > > > >
> > > > > > +/**
> > > > > > + * enum drm_gem_object_status - bitmask describing GEM access =
types to prepare for
> > > > > > + */
> > > > > > +enum drm_gem_object_access_flags {
> > > > > > +       /** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU acces=
s. */
> > > > > > +       DRM_GEM_OBJECT_CPU_ACCESS =3D 0,
> > > > > > +
> > > > > > +       /** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device ac=
cess. */
> > > > > > +       DRM_GEM_OBJECT_DEV_ACCESS =3D BIT(0),
> > > > > > +
> > > > > > +       /** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check t=
he entity doing the access. */
> > > > > > +       DRM_GEM_OBJECT_ACCESSOR_MASK =3D BIT(0),
> > > > > > +
> > > > > > +       /** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only =
accesses. */
> > > > > > +       DRM_GEM_OBJECT_READ_ACCESS =3D BIT(1),
> > > > > > +
> > > > > > +       /** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-onl=
y accesses. */
> > > > > > +       DRM_GEM_OBJECT_WRITE_ACCESS =3D BIT(2),
> > > > > > +
> > > > > > +       /** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write=
 accesses. */
> > > > > > +       DRM_GEM_OBJECT_RW_ACCESS =3D DRM_GEM_OBJECT_READ_ACCESS=
 |
> > > > > > +                                  DRM_GEM_OBJECT_WRITE_ACCESS,
> > > > > > +
> > > > > > +       /** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to chec=
k the access type. */
> > > > > > +       DRM_GEM_OBJECT_ACCESS_TYPE_MASK =3D DRM_GEM_OBJECT_RW_A=
CCESS,
> > > > > > +};
> > > > > > +
> > > > > >  /**
> > > > > >   * struct drm_gem_object_funcs - GEM object functions
> > > > > >   */
> > > > > > @@ -191,6 +218,21 @@ struct drm_gem_object_funcs {
> > > > > >          */
> > > > > >         int (*mmap)(struct drm_gem_object *obj, struct vm_area_=
struct *vma);
> > > > > >
> > > > > > +       /**
> > > > > > +        * @sync:
> > > > > > +        *
> > > > > > +        * Prepare for CPU/device access. This can involve migr=
ation of
> > > > > > +        * a buffer to the system-RAM/VRAM, or for UMA, flushin=
g/invalidating
> > > > > > +        * the CPU caches. The range can be used to optimize th=
e synchronization
> > > > > > +        * when possible.
> > > > >
> > > > > This has gone in a very different direction from the version I se=
nt
> > > > > out and the added generality makes me really nervous. The idea of=
 sync
> > > > > involving migration and that the range is a mere hint are antithe=
tical
> > > > > with Vulkan. It's a very GLish design that assumes that a BO is
> > > > > exclusively used by one of the CPU or the GPU at the same time. T=
his
> > > > > simply isn't the case in modern APIs. Older DRM uAPIs (as well as
> > > > > dma-buf itself) are littered with such ioctls and we're in the pr=
ocess
> > > > > of deleting them all.
> > > >
> > > > And yes, I realize I sent this on the patch for the hook which you
> > > > intended to plumb through to dma-buf. However, I also saw it being
> > > > propagated to an ioctl and I didn't know where else to put it that =
had
> > > > the relevant details.
> > > >
> > > > ~Faith
> > > >
> > > > > If the BO needs to be migrated in order to be accessed from the C=
PU,
> > > > > that needs to happen on map, not on some sort of begin/end. Or be=
tter
> > > > > yet, just disallow mapping such buffers. Once the client has a ma=
p,
> > > > > they are free to access from the CPU while stuff is running on th=
e
> > > > > GPU. They have to be careful, of course, not to cause data races,=
 but
> > > > > accessing the same BO from the CPU and GPU or even the same range=
 is
> > > > > totally okay if you aren't racing.
> > > > >
> > > > > As a corollary, just don't map PRIME buffers.
> > > > >
> > > > > And the range really shouldn't be just a hint. With Vulkan, clien=
ts
> > > > > are regularly sub-allocating from larger memory objects. If they =
ask
> > > > > to flush 64B and end up flushing 64M, that's pretty bad.
> > > > >
> > > > > All we need is something which lets us trap through to the kernel=
 for
> > > > > CPU cache management. That's all we need and that's really all it
> > > > > should do.
> > >
> > > Okay, so there's actually a problem with that I think, because we can=
't
> > > know how the buffer we export will be used. It can be imported by the
> > > same driver, and we're all good, but it can also be imported by a
> > > different driver, which decides to vmap or allow mmap() on it, and th=
en
> > > we have to implement the dma_buf CPU sync hooks. Unless we decide tha=
t
> > > all exported buffers should be write-combine only? This is the very
> > > reason I started hooking things up on the dma_buf side, because we're
> > > not in control of who the importer of our buffers is.
> >
> > Exported buffers should be WC-only. We could try to get creative but
> > the moment we let the lack of coherency leak to other processes,
> > potentially to other drivers, we're in a world of hurt. Even with the
> > dma-buf begin/end hooks, if it's imported into a driver that does
> > Vulkan, those hooks don't make sense and we're screwed.
>
> Well, yeah, the 'entire-buf' granularity is a problem, indeed,

If all that's being done is cache flushing, it's kind of okay. It's a
big hammer but it's okay. However, if the driver is doing literally
anything else in begin/end, it's all a lie the moment you allow that
buffer to be mapped in Vulkan. The client may be reading from the CPU
for GPU download in one subrange, writing from the CPU for GPU upload
in another subrange, and reading/writing from the GPU in another
subrange all at the same time. That's totally incompatible with the
dma-buf begin/end model.

> and
> there's no way around it with the current dma-buf API, which is why I
> prevented external bufs from being mapped (AKA not host-visible in
> Vulkan's term). But I really thought imported buffers coming from
> panthor should be mapped cached.

Yeah. So we could potentially allow WB maps if the client requests an
export via OPAQUE_FD since we know a priori that such a buffer will
only ever be re-imported into panfrost/panvk. However, I really don't
think that's a common enough case to be worth optimizing just yet.

> > And, yes, I
> > know panvk is the only Vulkan implementation you're going to see on a
> > system with an Arm GPU, but thinking about things in the general case
> > across all of DRM, exporting non-coherent memory in 2025 is just
> > cursed.
>
> Hm, okay. If that's the way to go, then we should enforce
>
>         !WB_MMAP || !PRIVATE
>
> in panthor, and fail the export of a WB_MMAP buffer in panfrost (we
> don't have a way to know that a buffer is private there).

Yeah, I'm a fan of that for now.

> I'll go and revisit the patchset to do that. I guess PVR needs fixing
> too, because I haven't seen anything to prevent `CACHED + EXPORTABLE`
> there.

Quite possible. I'm also not sure about msm, either.

~Faith

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CFA6DDEBD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FBD10E583;
	Tue, 11 Apr 2023 15:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7A610E583;
 Tue, 11 Apr 2023 15:02:22 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bb20so731977oib.12;
 Tue, 11 Apr 2023 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681225341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WJpgC9tCR8udl5BovYzFlcONxJeVE/qdJ1S1reXt5E=;
 b=VsL3u5pOE/5IW3p3ulEMJtpEvaImLs5+xtOp2Gxms1RMPA9RVBx5/L8A+UefiuApt1
 x7bVqF2L8QNuiYODEVADMlCaVMntM/anO13q5izgGfJnMTY8U7P6I5aK+oDgitnOBaEh
 qmFVeCdTutHisXuxKmbW6LXKQkpdH4j3B7twZIyDnsfwMMX7JV8V8SLPo8H+gRQ/iAzx
 lf+K3PLIgXy14Pxk4bCaqZWNTmLMvckmqaSCTTDeM9kMKEK0hMvLnKD0Qkx0+YEC/ZRC
 ITYRZKCUdpfFPzX9N2dak+kG7IbrtVZRaJ5EmYU4KFhIrs00dAShwAdv6xhPL2kRJc+n
 CakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681225341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2WJpgC9tCR8udl5BovYzFlcONxJeVE/qdJ1S1reXt5E=;
 b=ZHdEKlrop1/OEsEdhCbtKpkYpjHh4cRDNR9DcP74Y9WVaOzQSCW12Jl8covVPpjBHz
 3Z9A1vdhQUTa/v38UJ6l770DN1dFiIwlH4SecK4tmOmB0kkAMb2OREj1BvLTGwSnxulX
 tQjT10zRqdtcay0w0WMXkOwJLHbV1QYmxAPfsciwo9yEYvnZEn814JJBhT2l6cdxzOoZ
 +lsxtTYpVi5rBNhwuJivx2fzRBZ7JTouA8tvtp2ZeU4FI5DDoAd562YhDnbNnzRW+bc4
 8Tm5/4G1re9rVSKxG4OlX3qw6nyOiroYK0nrmnkD7cnRzGISPtZqmHU6o4bcXQ0ZBXq2
 O9lA==
X-Gm-Message-State: AAQBX9eY9g2pdESJHgXUpg7x66EzPWzQl+Jfq2tCqyjQwQ4NYQVbT8SP
 UCKRQMYdWbHctObZI+j7oEWDcA46AsRSJxrUr2Q=
X-Google-Smtp-Source: AKy350YwtRIiyCDeEf6JFQH53X2u6nZHWvn5d3u/Drcf/pPiALqRx7i8rjGAzsLiwjvV95U1/m3LauiEIuV3O9FcwoI=
X-Received: by 2002:a05:6808:2994:b0:384:1e6a:bf10 with SMTP id
 ex20-20020a056808299400b003841e6abf10mr2176191oib.5.1681225341294; Tue, 11
 Apr 2023 08:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <20230410210608.1873968-2-robdclark@gmail.com>
 <ZDU5vvc4V85E9hqP@phenom.ffwll.local>
In-Reply-To: <ZDU5vvc4V85E9hqP@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Apr 2023 08:02:09 -0700
Message-ID: <CAF6AEGuzfvC0v7bo_OD7mP6C9cA4mJeTvdM+i7e1hVS-Tv+AFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add fdinfo memory stats
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christopher Healy <healych@amazon.com>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, Apr 11, 2023 at 3:43=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Mon, Apr 10, 2023 at 02:06:06PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add a helper to dump memory stats to fdinfo.  For the things the drm
> > core isn't aware of, use a callback.
> >
> > v2: Fix typos, change size units to match docs, use div_u64
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Uh can't we wire this up by default? Having this as a per-driver opt-in
> sounds like we'll get maximally fragmented drm fd_info, and since that's
> uapi I don't think that's any good at all.

That is the reason for the centralized documentation of the props (and
why for this one I added a helper, rather than continuing the current
pattern of everyone rolling their own)..

We _could_ (and I had contemplated) doing this all in core if (a) we
move madv to drm_gem_object, and (b) track
drm_gem_get_pages()/drm_gem_put_pages().  I guess neither is totally
unreasonable, pretty much all the non-ttm/non-cma GEM drivers have
some form of madvise ioctl and use
drm_gem_get_pages()/drm_gem_put_pages()..

BR,
-R

> I think it's time we have
> - drm_fd_info
> - rolled out to all drivers in their fops
> - with feature checks as appropriate
> - push the driver-specific things into a drm_driver callback
>
> And I guess start peopling giving a hard time for making things needless
> driver-specifict ... there's really no reason at all this is not
> consistent across drivers.
> -Daniel
>
> > ---
> >  Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> >  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
> >  include/drm/drm_file.h                | 10 ++++
> >  3 files changed, 110 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/=
drm-usage-stats.rst
> > index b46327356e80..b5e7802532ed 100644
> > --- a/Documentation/gpu/drm-usage-stats.rst
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -105,6 +105,27 @@ object belong to this client, in the respective me=
mory region.
> >  Default unit shall be bytes with optional unit specifiers of 'KiB' or =
'MiB'
> >  indicating kibi- or mebi-bytes.
> >
> > +- drm-shared-memory: <uint> [KiB|MiB]
> > +
> > +The total size of buffers that are shared with another file (ie. have =
more
> > +than a single handle).
> > +
> > +- drm-private-memory: <uint> [KiB|MiB]
> > +
> > +The total size of buffers that are not shared with another file.
> > +
> > +- drm-resident-memory: <uint> [KiB|MiB]
> > +
> > +The total size of buffers that are resident in system memory.
> > +
> > +- drm-purgeable-memory: <uint> [KiB|MiB]
> > +
> > +The total size of buffers that are purgeable.
> > +
> > +- drm-active-memory: <uint> [KiB|MiB]
> > +
> > +The total size of buffers that are active on one or more rings.
> > +
> >  - drm-cycles-<str> <uint>
> >
> >  Engine identifier string must be the same as the one specified in the
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index a51ff8cee049..085b01842a87 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -42,6 +42,7 @@
> >  #include <drm/drm_client.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_gem.h>
> >  #include <drm/drm_print.h>
> >
> >  #include "drm_crtc_internal.h"
> > @@ -868,6 +869,84 @@ void drm_send_event(struct drm_device *dev, struct=
 drm_pending_event *e)
> >  }
> >  EXPORT_SYMBOL(drm_send_event);
> >
> > +static void print_size(struct drm_printer *p, const char *stat, size_t=
 sz)
> > +{
> > +     const char *units[] =3D {"", " KiB", " MiB"};
> > +     unsigned u;
> > +
> > +     for (u =3D 0; u < ARRAY_SIZE(units) - 1; u++) {
> > +             if (sz < SZ_1K)
> > +                     break;
> > +             sz =3D div_u64(sz, SZ_1K);
> > +     }
> > +
> > +     drm_printf(p, "%s:\t%zu%s\n", stat, sz, units[u]);
> > +}
> > +
> > +/**
> > + * drm_print_memory_stats - Helper to print standard fdinfo memory sta=
ts
> > + * @file: the DRM file
> > + * @p: the printer to print output to
> > + * @status: callback to get driver tracked object status
> > + *
> > + * Helper to iterate over GEM objects with a handle allocated in the s=
pecified
> > + * file.  The optional status callback can return additional object st=
ate which
> > + * determines which stats the object is counted against.  The callback=
 is called
> > + * under table_lock.  Racing against object status change is "harmless=
", and the
> > + * callback can expect to not race against object destruction.
> > + */
> > +void drm_print_memory_stats(struct drm_file *file, struct drm_printer =
*p,
> > +                         enum drm_gem_object_status (*status)(struct d=
rm_gem_object *))
> > +{
> > +     struct drm_gem_object *obj;
> > +     struct {
> > +             size_t shared;
> > +             size_t private;
> > +             size_t resident;
> > +             size_t purgeable;
> > +             size_t active;
> > +     } size =3D {0};
> > +     int id;
> > +
> > +     spin_lock(&file->table_lock);
> > +     idr_for_each_entry (&file->object_idr, obj, id) {
> > +             enum drm_gem_object_status s =3D 0;
> > +
> > +             if (status)
> > +                     s =3D status(obj);
> > +
> > +             if (obj->handle_count > 1) {
> > +                     size.shared +=3D obj->size;
> > +             } else {
> > +                     size.private +=3D obj->size;
> > +             }
> > +
> > +             if (s & DRM_GEM_OBJECT_RESIDENT) {
> > +                     size.resident +=3D obj->size;
> > +                     s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
> > +             }
> > +
> > +             if (s & DRM_GEM_OBJECT_ACTIVE) {
> > +                     size.active +=3D obj->size;
> > +                     s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
> > +             }
> > +
> > +             if (s & DRM_GEM_OBJECT_PURGEABLE)
> > +                     size.purgeable +=3D obj->size;
> > +     }
> > +     spin_unlock(&file->table_lock);
> > +
> > +     print_size(p, "drm-shared-memory", size.shared);
> > +     print_size(p, "drm-private-memory", size.private);
> > +
> > +     if (status) {
> > +             print_size(p, "drm-resident-memory", size.resident);
> > +             print_size(p, "drm-purgeable-memory", size.purgeable);
> > +             print_size(p, "drm-active-memory", size.active);
> > +     }
> > +}
> > +EXPORT_SYMBOL(drm_print_memory_stats);
> > +
> >  /**
> >   * mock_drm_getfile - Create a new struct file for the drm device
> >   * @minor: drm minor to wrap (e.g. #drm_device.primary)
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index 0d1f853092ab..7bd8a1374f39 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -41,6 +41,7 @@
> >  struct dma_fence;
> >  struct drm_file;
> >  struct drm_device;
> > +struct drm_printer;
> >  struct device;
> >  struct file;
> >
> > @@ -438,6 +439,15 @@ void drm_send_event_timestamp_locked(struct drm_de=
vice *dev,
> >                                    struct drm_pending_event *e,
> >                                    ktime_t timestamp);
> >
> > +enum drm_gem_object_status {
> > +     DRM_GEM_OBJECT_RESIDENT  =3D BIT(0),
> > +     DRM_GEM_OBJECT_PURGEABLE =3D BIT(1),
> > +     DRM_GEM_OBJECT_ACTIVE    =3D BIT(2),
> > +};
> > +
> > +void drm_print_memory_stats(struct drm_file *file, struct drm_printer =
*p,
> > +                         enum drm_gem_object_status (*status)(struct d=
rm_gem_object *));
> > +
> >  struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int fl=
ags);
> >
> >  #endif /* _DRM_FILE_H_ */
> > --
> > 2.39.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

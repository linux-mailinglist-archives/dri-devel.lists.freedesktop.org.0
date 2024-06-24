Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BA69155B5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 19:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1210E513;
	Mon, 24 Jun 2024 17:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iNaKr5M7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483E810E51C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 17:47:42 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso5506277a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719251260; x=1719856060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOb9gSLJ0xlleU+rm7RlY5Hz+BM/tF+SbhCCKq8yGvQ=;
 b=iNaKr5M7JDM1wD3MwaMQ8/iC098JVE/tfcLkvMbrMj5zYrMAdIhGgSXvMnnxzrqyUo
 /Jo5TtsX+VERkxqmvh2sV6KX/y8QkAInq2PoXJJVh6Uwlo3yG1HUOsILUIi8VlbzVFhE
 TCGUqjS3KpBdd6lw3xV/hX9mo3weqvEQ09IwI0aU1feu9hbI2VXhlvuCsynt271KRRmK
 ZmwoAwA6LIWRVOPR/4CxiPpIFVdi9H2fw9vzNDrZWl1CRVjRRZc+TRRHOXJydiwIebkf
 IB6cBKRkdNmf95jgUrWUZvfwVxebAqzpI5HYAZtMONHGynQ+5h9rZBH57wcMJQUNfU4k
 UJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719251260; x=1719856060;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOb9gSLJ0xlleU+rm7RlY5Hz+BM/tF+SbhCCKq8yGvQ=;
 b=QYYVn4/Q+7xwQyiyN1zaSkiUBm3mlcMLBaJwwKzlbcf5I1fl8+iw6zPhQ+Z484DUOI
 UGc2QbyFcMCE7h416KB0QPleSw5lIU+E1/rAimMx9iXkq6GTYSiaCb1PIBmBgiCT3sH7
 j5wqXNLDnmdt0q5EEnsBY7kMg9hnSHG3mPYr27nCt+fw45kau4Ji1ddE2nRtFqKBDiR2
 L4Dt5hjTLqt0KAQz1oqX/2R9FMw04V6lgdnuDZfltxviIKeBgDQVuwzzbNn8dBPp0IOl
 Pz0pdrSvyEyFuQnUrUaKYAfaPc5aU5nDcgIR1T7GACleuAx6aBysNqHHBX6Qekp9KrGE
 paKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE/RGmF88Bjz2A3daeNRUxrBwotSVf62EbWqKK4YOtEsYt6BaFN684tvEUuvVpYYHniCErx5Yqkypjcdg0efraH4XVb0yOZQToDkfgY7/T
X-Gm-Message-State: AOJu0Ywnpkt0fRUit0G7WYUUteD75rkiE8LyXbvyPF+D8BQX+BOPLjds
 gUp36ysoj1cR0xTxlpI8Na453vxGrW4BG0g1D+x2M/8CkKeYGo766sFNldHTyReT+K6hhjucfbZ
 4jL8C3//wV1eMaO/0sjo9Uk4G7oI=
X-Google-Smtp-Source: AGHT+IHDmLT6XkbgHSOTjmXW55Rq4W+NpYDNvMEVVZhKik2gn5XHtt5EBd2++dPx+QYdusQDPYH2YeYL/SSL9WXyWsI=
X-Received: by 2002:a50:8e1b:0:b0:57d:22ef:d055 with SMTP id
 4fb4d7f45d1cf-57d7004c7f9mr317161a12.24.1719251260239; Mon, 24 Jun 2024
 10:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
 <20240606005416.1172431-7-adrian.larumbe@collabora.com>
 <1c40ea3a-ac58-4fa9-a7e5-3af880effb0e@ursulin.net>
In-Reply-To: <1c40ea3a-ac58-4fa9-a7e5-3af880effb0e@ursulin.net>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 10:47:28 -0700
Message-ID: <CAF6AEGsrSH-M0UMEC5=CfK3MGx96q5ohSpQe1e+V_E127w_7Bw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/drm_file: add display of driver's internal
 memory size
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Jun 6, 2024 at 1:35=E2=80=AFAM Tvrtko Ursulin <tursulin@ursulin.net=
> wrote:
>
>
> On 06/06/2024 02:49, Adri=C3=A1n Larumbe wrote:
>
> > Some drivers must allocate a considerable amount of memory for bookkeep=
ing
> > structures and GPU's MCU-kernel shared communication regions. These are
> > often created as a result of the invocation of the driver's ioctl()
> > interface functions, so it is sensible to consider them as being owned =
by
> > the render context associated with an open drm file.
> >
> > However, at the moment drm_show_memory_stats only traverses the UM-expo=
sed
> > drm objects for which a handle exists. Private driver objects and memor=
y
> > regions, though connected to a render context, are unaccounted for in t=
heir
> > fdinfo numbers.
> >
> > Add a new drm_memory_stats 'internal' memory category.
> >
> > Because deciding what constitutes an 'internal' object and where to fin=
d
> > these are driver-dependent, calculation of this size must be done throu=
gh a
> > driver-provided function pointer, which becomes the third argument of
> > drm_show_memory_stats. Drivers which have no interest in exposing the s=
ize
> > of internal memory objects can keep passing NULL for unaltered behaviou=
r.
> >
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
>
> Please Cc people who were previously involved in defining
> drm-usage-stats.rst. I added Rob, but I am not sure if I forgot someone
> from the top of my head.
>
> Internal as a category sounds potentially useful. One reservation I have
> though is itdoes not necessarily fit with the others but is something
> semantically different from them.
>
> In i915 I had the similar desire to account for internal objects and
> have approached it by similarly tracking them outside the DRM idr but
> counting them under the existing respective categories and memory
> regions. Ie. internal objects can also be purgeable or not, etc, and can
> be backed by either system memory or device local memory.
>
> Advantage is it is more accurate in those aspect and does not require
> adding a new category.
>
> Downside of this is that 'internal' is bunched with the explicit
> userspace objects so perhaps less accurate in this other aspect.
>
> Regards,
>
> Tvrtko
>
> > ---
> >   Documentation/gpu/drm-usage-stats.rst   | 4 ++++
> >   drivers/gpu/drm/drm_file.c              | 9 +++++++--
> >   drivers/gpu/drm/msm/msm_drv.c           | 2 +-
> >   drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
> >   include/drm/drm_file.h                  | 7 ++++++-
> >   5 files changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/=
drm-usage-stats.rst
> > index 6dc299343b48..0da5ebecd232 100644
> > --- a/Documentation/gpu/drm-usage-stats.rst
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -157,6 +157,10 @@ The total size of buffers that are purgeable.
> >
> >   The total size of buffers that are active on one or more engines.
> >
> > +- drm-internal-<region>: <uint> [KiB|MiB]
> > +
> > +The total size of GEM objects that aren't exposed to user space.
> > +
> >   Implementation Details
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index 638ffa4444f5..d1c13eed8d34 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -874,9 +874,10 @@ void drm_print_memory_stats(struct drm_printer *p,
> >                           enum drm_gem_object_status supported_status,
> >                           const char *region)
> >   {
> > -     print_size(p, "total", region, stats->private + stats->shared);
> > +     print_size(p, "total", region, stats->private + stats->shared + s=
tats->internal);
> >       print_size(p, "shared", region, stats->shared);
> >       print_size(p, "active", region, stats->active);
> > +     print_size(p, "internal", region, stats->internal);
> >
> >       if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> >               print_size(p, "resident", region, stats->resident);
> > @@ -890,11 +891,12 @@ EXPORT_SYMBOL(drm_print_memory_stats);
> >    * drm_show_memory_stats - Helper to collect and show standard fdinfo=
 memory stats
> >    * @p: the printer to print output to
> >    * @file: the DRM file
> > + * @func: driver-specific function pointer to count the size of intern=
al objects
> >    *
> >    * Helper to iterate over GEM objects with a handle allocated in the =
specified
> >    * file.
> >    */
> > -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *fil=
e)
> > +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *fil=
e, internal_bos func)
> >   {
> >       struct drm_gem_object *obj;
> >       struct drm_memory_stats status =3D {};
> > @@ -940,6 +942,9 @@ void drm_show_memory_stats(struct drm_printer *p, s=
truct drm_file *file)
> >       }
> >       spin_unlock(&file->table_lock);
> >
> > +     if (func)
> > +             func(&status, file);

Seems like it would be simpler to just pass `u64 internal` to
drm_show_memory_stats() instead of a callback.

But I agree with Tvrtko's comment about being somewhat (I think?)
orthogonal to active/resident.  I guess somewhere you have a list of
internal BOs?

Perhaps another option is to pass an (optionally NULL) list of BOs to
drm_show_memory_stats() to iterate so that they can be counted as
active/resident/etc?  Or yet another alternative, pass an (optionally
NULL) `struct drm_memory_stats *` to initialize status.

BR,
-R

> > +
> >       drm_print_memory_stats(p, &status, supported_status, "memory");
> >   }
> >   EXPORT_SYMBOL(drm_show_memory_stats);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 9c33f4e3f822..f97d3cdc4f50 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -880,7 +880,7 @@ static void msm_show_fdinfo(struct drm_printer *p, =
struct drm_file *file)
> >
> >       msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
> >
> > -     drm_show_memory_stats(p, file);
> > +     drm_show_memory_stats(p, file, NULL);
> >   }
> >
> >   static const struct file_operations fops =3D {
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/=
panfrost/panfrost_drv.c
> > index ef9f6c0716d5..53640ac44e42 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -570,7 +570,7 @@ static void panfrost_show_fdinfo(struct drm_printer=
 *p, struct drm_file *file)
> >
> >       panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
> >
> > -     drm_show_memory_stats(p, file);
> > +     drm_show_memory_stats(p, file, NULL);
> >   }
> >
> >   static const struct file_operations panfrost_drm_driver_fops =3D {
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index ab230d3af138..d71a5ac50ea9 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -464,6 +464,7 @@ void drm_send_event_timestamp_locked(struct drm_dev=
ice *dev,
> >    * @resident: Total size of GEM objects backing pages
> >    * @purgeable: Total size of GEM objects that can be purged (resident=
 and not active)
> >    * @active: Total size of GEM objects active on one or more engines
> > + * @internal: Total size of GEM objects that aren't exposed to user sp=
ace
> >    *
> >    * Used by drm_print_memory_stats()
> >    */
> > @@ -473,16 +474,20 @@ struct drm_memory_stats {
> >       u64 resident;
> >       u64 purgeable;
> >       u64 active;
> > +     u64 internal;
> >   };
> >
> >   enum drm_gem_object_status;
> >
> > +typedef void (*internal_bos)(struct drm_memory_stats *status,
> > +                          struct drm_file *file);
> > +
> >   void drm_print_memory_stats(struct drm_printer *p,
> >                           const struct drm_memory_stats *stats,
> >                           enum drm_gem_object_status supported_status,
> >                           const char *region);
> >
> > -void drm_show_memory_stats(struct drm_printer *p, struct drm_file *fil=
e);
> > +void drm_show_memory_stats(struct drm_printer *p, struct drm_file *fil=
e, internal_bos func);
> >   void drm_show_fdinfo(struct seq_file *m, struct file *f);
> >
> >   struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int f=
lags);

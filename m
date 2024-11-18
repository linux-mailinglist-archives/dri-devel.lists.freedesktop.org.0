Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC599D1BBC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D8310E060;
	Mon, 18 Nov 2024 23:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ika71uiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0221710E060
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 23:14:15 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ea68cd5780so1326572a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 15:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731971655; x=1732576455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Od4hvekOGhhzwy7e0XL03SgJsIRF4LxG2zoGmgmXFic=;
 b=ika71uiL/8bvuIemsmPI7VAEYzbJsg4pj8+vrLspnCSgwmaGs0FoY/Pjztq2uA+eBC
 KF8PsvFohv1A0JIBG9xcDjKXju2vQgR4/Kgvu2q+21MiLTTC0+EUXpm74/DrolW0rNW4
 TsPJDiiho9L0qDD6I8NJRShgqItlQ79cNeY1TBe4gKjR8aFX6d7j7vERKC2hva/86Zx0
 jLQJF9ea4LxAPcKwx+k2KQyEzWW49zk5d3TCGniUbIaARsPZhtm2rNaFDKrs6DOUZ4AK
 EmT/r1pJGGXlmiqeRyHCGEElGv/bCFt+enCsjKaeEVfNwsWqM4KpU+IbCjmBH9RI2OHQ
 ThWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731971655; x=1732576455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Od4hvekOGhhzwy7e0XL03SgJsIRF4LxG2zoGmgmXFic=;
 b=BYQ9LqwIzJ/3UuxNUirLICYclM3uas+dLwm/w3pAlHGLTy0e8dZ94pVJmA2y3AfTsj
 P63yWOL27o84P0PBh46A89rhb4JcL95dBkNCEoO0NBj18GuaDEuy1uJ4l/yPbswgW1T4
 UBEIsa919MDvz43gOrHZmiDA/IMUSSTkui/uhQbqd64tT+eNdGCUYgkN9VsqqpT9sPEf
 wiLz2MFaGgzd/PHc5anglvu8WEfxuB/XZBZgY10gH0bUcHUpdfdfMRUFKs4BF9iUIwb+
 t2smgMXAdilmxqcQYPwqfB6aHBy6cGw7vvItlGJZGC7GBCQMiVFNaRusnFy+I+zR54Gs
 LfBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfEwHwa90WB0L8ut5DDaXqwuv4t3Fm9Oi/UA1C41fQlnxFfwiLYTqSn/ODANdOQYb56hX2Eki4Jjs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIvy1Hn2sMRSTrsU1DyXxP/b0Ev+/rN9NJA5MBE4kROiQ+ACEn
 e7T4+BCoOEDBH8USg15y8EuSYdg3S0sABaYMxcc9mQGKbEraV7ftFMSbgk6/8jQWR6x6BZdUSqV
 bEeZdQX2R3YvhzAzD/QsfcQKVIaE=
X-Google-Smtp-Source: AGHT+IGok+uzpfQln7cvdRMDh4esTdDX9BCo7amrdZnQe4KSrXzE7lO8/BnUHjhHiAAGVSjNwKAJmVFcObLQ7m+cqrE=
X-Received: by 2002:a17:90b:3ccd:b0:2ea:5dcf:6f5d with SMTP id
 98e67ed59e1d1-2ea5dcf7155mr8818825a91.16.1731971655317; Mon, 18 Nov 2024
 15:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20241117214110.162547-1-christian.gmeiner@gmail.com>
 <9980c54b-a3ba-4396-ac83-37e14a81f74a@igalia.com>
In-Reply-To: <9980c54b-a3ba-4396-ac83-37e14a81f74a@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 19 Nov 2024 00:14:03 +0100
Message-ID: <CAH9NwWezHA3hBFH2ED24otPki9q4BHbZaGQD5Z20UyS_kN28mA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel-dev@igalia.com, 
 Christian Gmeiner <cgmeiner@igalia.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi Maira,

>
> The patch overall LGTM, I just have one small nit.
>

Hopefully v4 will be the last iteration.

> On 17/11/24 18:41, Christian Gmeiner wrote:
> > From: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > Add a new ioctl, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, to allow
> > configuration of a global performance monitor (perfmon).
> > Use the global perfmon for all jobs to ensure consistent
> > performance tracking across submissions. This feature is
> > needed to implement a Perfetto datasources in user-space.
> >
> > Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> > ---
> > Changes in v3:
> > - Reworked commit message.
> > - Refined some code comments.
> > - Added missing v3d_perfmon_stop(..) call to v3d_perfmon_destroy_ioctl(=
..).
> >
> > Changes in v2:
> > - Reworked commit message.
> > - Removed num_perfmon counter for tracking perfmon allocations.
> > - Allowing allocation of perfmons when the global perfmon is active.
> > - Return -EAGAIN for submissions with a per job perfmon if the global p=
erfmon is active.
> > ---
> >
> > ---
> >   drivers/gpu/drm/v3d/v3d_drv.c     |  1 +
> >   drivers/gpu/drm/v3d/v3d_drv.h     |  8 ++++++
> >   drivers/gpu/drm/v3d/v3d_perfmon.c | 42 ++++++++++++++++++++++++++++++=
+
> >   drivers/gpu/drm/v3d/v3d_sched.c   | 14 ++++++++---
> >   drivers/gpu/drm/v3d/v3d_submit.c  | 10 ++++++++
> >   include/uapi/drm/v3d_drm.h        | 15 +++++++++++
> >   6 files changed, 87 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_dr=
v.c
> > index d7ff1f5fa481..3c89f0daa5b8 100644
> > --- a/drivers/gpu/drm/v3d/v3d_drv.c
> > +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> > @@ -214,6 +214,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[]=
 =3D {
> >       DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_VALUES, v3d_perfmon_get_values_=
ioctl, DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CPU, v3d_submit_cpu_ioctl, DRM_RENDE=
R_ALLOW | DRM_AUTH),
> >       DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_COUNTER, v3d_perfmon_get_counte=
r_ioctl, DRM_RENDER_ALLOW),
> > +     DRM_IOCTL_DEF_DRV(V3D_PERFMON_SET_GLOBAL, v3d_perfmon_set_global_=
ioctl, DRM_RENDER_ALLOW),
> >   };
> >
> >   static const struct drm_driver v3d_drm_driver =3D {
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_dr=
v.h
> > index cf4b23369dc4..a0d920ec2b1d 100644
> > --- a/drivers/gpu/drm/v3d/v3d_drv.h
> > +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> > @@ -179,6 +179,12 @@ struct v3d_dev {
> >               u32 num_allocated;
> >               u32 pages_allocated;
> >       } bo_stats;
> > +
> > +     /* To support a performance analysis tool in user space, we requi=
re
> > +      * a single, globally configured performance monitor (perfmon) fo=
r
> > +      * all jobs.
> > +      */
> > +     struct v3d_perfmon *global_perfmon;
> >   };
> >
> >   static inline struct v3d_dev *
> > @@ -584,6 +590,8 @@ int v3d_perfmon_get_values_ioctl(struct drm_device =
*dev, void *data,
> >                                struct drm_file *file_priv);
> >   int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
> >                                 struct drm_file *file_priv);
> > +int v3d_perfmon_set_global_ioctl(struct drm_device *dev, void *data,
> > +                              struct drm_file *file_priv);
> >
> >   /* v3d_sysfs.c */
> >   int v3d_sysfs_init(struct device *dev);
> > diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3=
d_perfmon.c
> > index 156be13ab2ef..df72171d8c80 100644
> > --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> > +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> > @@ -312,6 +312,9 @@ static int v3d_perfmon_idr_del(int id, void *elem, =
void *data)
> >       if (perfmon =3D=3D v3d->active_perfmon)
> >               v3d_perfmon_stop(v3d, perfmon, false);
> >
> > +     /* If the global perfmon is being destroyed, set it to NULL */
> > +     cmpxchg(&v3d->global_perfmon, perfmon, NULL);
> > +
> >       v3d_perfmon_put(perfmon);
> >
> >       return 0;
> > @@ -383,6 +386,7 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *de=
v, void *data,
> >   {
> >       struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> >       struct drm_v3d_perfmon_destroy *req =3D data;
> > +     struct v3d_dev *v3d =3D v3d_priv->v3d;
> >       struct v3d_perfmon *perfmon;
> >
> >       mutex_lock(&v3d_priv->perfmon.lock);
> > @@ -392,6 +396,13 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *d=
ev, void *data,
> >       if (!perfmon)
> >               return -EINVAL;
> >
> > +     /* If the active perfmon is being destroyed, stop it first */
> > +     if (perfmon =3D=3D v3d->active_perfmon)
> > +             v3d_perfmon_stop(v3d, perfmon, false);
>
> Could you please move this snippet to different patch? This snippet is a
> global fix as it can prevent NULL pointer dereferences triggered by the
> user-space. I would like to push this snippet to drm-misc-fixes.
>

Done.

> > +
> > +     /* If the global perfmon is being destroyed, set it to NULL */
> > +     cmpxchg(&v3d->global_perfmon, perfmon, NULL);
> > +
> >       v3d_perfmon_put(perfmon);
> >
> >       return 0;
> > @@ -451,3 +462,34 @@ int v3d_perfmon_get_counter_ioctl(struct drm_devic=
e *dev, void *data,
> >
> >       return 0;
> >   }
> > +
> > +int v3d_perfmon_set_global_ioctl(struct drm_device *dev, void *data,
> > +                              struct drm_file *file_priv)
> > +{
> > +     struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> > +     struct drm_v3d_perfmon_set_global *req =3D data;
> > +     struct v3d_dev *v3d =3D to_v3d_dev(dev);
> > +     struct v3d_perfmon *perfmon;
> > +
> > +     if (req->flags & ~DRM_V3D_PERFMON_CLEAR_GLOBAL)
> > +             return -EINVAL;
> > +
> > +     perfmon =3D v3d_perfmon_find(v3d_priv, req->id);
> > +     if (!perfmon)
> > +             return -EINVAL;
> > +
> > +     /* If the request is to clear the global performance monitor */
> > +     if (req->flags & DRM_V3D_PERFMON_CLEAR_GLOBAL) {
> > +             if (!v3d->global_perfmon)
> > +                     return -EINVAL;
> > +
> > +             xchg(&v3d->global_perfmon, NULL);
>
> What if v3d->global_perfmon is running?
>

It will be stopped by the next job that hits v3d_switch_perfmon(..).

> > +
> > +             return 0;
> > +     }
> > +
> > +     if (cmpxchg(&v3d->global_perfmon, NULL, perfmon))
> > +             return -EBUSY;
> > +
> > +     return 0;
> > +}
>
> [...]
>
> > diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> > index 87fc5bb0a61e..7c2ad9d0270d 100644
> > --- a/include/uapi/drm/v3d_drm.h
> > +++ b/include/uapi/drm/v3d_drm.h
> > @@ -43,6 +43,7 @@ extern "C" {
> >   #define DRM_V3D_PERFMON_GET_VALUES                0x0a
> >   #define DRM_V3D_SUBMIT_CPU                        0x0b
> >   #define DRM_V3D_PERFMON_GET_COUNTER               0x0c
> > +#define DRM_V3D_PERFMON_SET_GLOBAL                0x0d
> >
> >   #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
> >   #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
> > @@ -61,6 +62,8 @@ extern "C" {
> >   #define DRM_IOCTL_V3D_SUBMIT_CPU          DRM_IOW(DRM_COMMAND_BASE + =
DRM_V3D_SUBMIT_CPU, struct drm_v3d_submit_cpu)
> >   #define DRM_IOCTL_V3D_PERFMON_GET_COUNTER DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_V3D_PERFMON_GET_COUNTER, \
> >                                                  struct drm_v3d_perfmon=
_get_counter)
> > +#define DRM_IOCTL_V3D_PERFMON_SET_GLOBAL  DRM_IOW(DRM_COMMAND_BASE + D=
RM_V3D_PERFMON_SET_GLOBAL, \
> > +                                                struct drm_v3d_perfmon=
_set_global)
> >
> >   #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
> >   #define DRM_V3D_SUBMIT_EXTENSION              0x02
> > @@ -765,6 +768,18 @@ struct drm_v3d_perfmon_get_counter {
> >       __u8 reserved[7];
> >   };
> >
> > +#define DRM_V3D_PERFMON_CLEAR_GLOBAL    0x0001
> > +
> > +/**
> > + * struct drm_v3d_perfmon_set_global - ioctl to define a global perfor=
mance
> > + * monitor that is used for all job. If a global performance monitor i=
s
>
> s/job/jobs
>

Ah.. thanks.

> Best Regards,
> - Ma=C3=ADra
>
> > + * defined, jobs with a self-defined performance monitor are not allow=
ed.
> > + */
> > +struct drm_v3d_perfmon_set_global {
> > +     __u32 flags;
> > +     __u32 id;
> > +};
> > +
> >   #if defined(__cplusplus)
> >   }
> >   #endif
>

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

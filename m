Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2D49B84CC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0453410E92C;
	Thu, 31 Oct 2024 20:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e6GB80J1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10D10E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:59:52 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2e2ed2230d8so1060318a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 13:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730408392; x=1731013192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGab+KxLHPuFXQ9hG7daF5kjEcZZ8gRZMKHDGf/QQdc=;
 b=e6GB80J1oA7yzl51SnZVeu583qj1qSTmehoOAqgtyEmSyoGNQxkm5WRKJPoc50w6co
 UtvT5hX2BvJMCIiqADF4Gbd2PoLeA8Wg5Jx7L0nF18mW16SaPoH8NgEtw4F9ayva0HeA
 Ozwv07qV6+YQzQu/egiK57DwvVmIaiCrNzhc8BVHQbkU5P+XlKfmCg4hNOGBWUrzu/4F
 TKBEqWdwFfjVFldYMgeIzhSPpwbJw/x4xDVl0QkMPBEtYHL/HnA6AoI59Xa/AHjJBF0q
 L9MxYS1KeUejQXk9TkbEFNo7QsWsck9DtuMcfMnMN9lG71C3qFGqfUQHVodly6Ao9/HP
 ya8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730408392; x=1731013192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGab+KxLHPuFXQ9hG7daF5kjEcZZ8gRZMKHDGf/QQdc=;
 b=n6SqeyYpiyBypqkpSznkZftABM1vS3vG/Uev42EHT9ALJy3EYPkMmfSEJV2MLr7mqu
 sVYoyehCRutSIU75VHFcnsOOc5wpMe5IDzH7AO9MUlmgIbVnrVn0ld7+B2GDeOxijscV
 EhkT74yYJ8mDHJFYRK8YsFGJH4tR/ky7uVlTPUHuRuU1n5Omki652QyckWM2kMakogb2
 lVCsVebw6udLLivnV8O6NuNKzStwAAa1DWZL6OcO3eiKJ4gwaHoFFSy8JWCo+nPuw1CO
 FGVJbufeTbG5Hn7nCN/kX2JT2JP4KgdeCzUC8meLzcqrDV290BsFuAV6lziJ2BV4smPE
 gcdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlX49yYrCljBuCl+MVYw7xZzaEpbnaJx76Zqx1GfJfmOnCpf5RhXQIEVyuW8r5YsLTZ4Tgsdw4KVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycXu13GRpb18I/F5bpDxOiwUL39iw/XLlKXtU9gutGqFILEPrM
 Dv5sV7/RLGTQxhdS5f7DfshUZJt5sc5Y8PQLN5rpWG9ukS1965febbHMikkO2bRLygtheDZiBGQ
 M03phNc4FJUDVhPhvjaeJfBhQNJdzIT8u44M=
X-Google-Smtp-Source: AGHT+IE+jpP0JfCSCbQvbKZeCa03Zlrpa7LsOh+lzNCvcuY1bcZXXG8bDmJYLuycfQgzWZe4txy04PHQL3ByX8zNh18=
X-Received: by 2002:a17:90b:4a42:b0:2e2:e2f8:100 with SMTP id
 98e67ed59e1d1-2e94c531243mr1674463a91.38.1730408391666; Thu, 31 Oct 2024
 13:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241020204156.113853-1-christian.gmeiner@gmail.com>
 <c6899aa3-84cc-4288-866d-533dcb478b4c@igalia.com>
In-Reply-To: <c6899aa3-84cc-4288-866d-533dcb478b4c@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 31 Oct 2024 21:59:39 +0100
Message-ID: <CAH9NwWe7mrcV4RQTiKL+05bqbgVRTO_Nqb0iLhGcCd=6rY2LpA@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: kernel-dev@igalia.com, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Melissa Wen <mwen@igalia.com>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Christian Gmeiner <cgmeiner@igalia.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
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

Hi Andr=C3=A9

>
> Em 20/10/2024 17:41, Christian Gmeiner escreveu:
> > From: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > This patch adds a new ioctl, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, which
> > allows the configuration of a global performance monitor (perfmon).
> > The global perfmon is used for all jobs, ensuring consistent performanc=
e
> > tracking across submissions.
>
> Usually we write in the imperative form:
>
> Add a new ioctl, ...
>

I switched to imperative from v2.

> >
> > Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> > ---
> >   drivers/gpu/drm/v3d/v3d_drv.c                 |  3 ++
> >   drivers/gpu/drm/v3d/v3d_drv.h                 | 10 ++++
> >   drivers/gpu/drm/v3d/v3d_perfmon.c             | 49 ++++++++++++++++++=
+
> >   .../gpu/drm/v3d/v3d_performance_counters.h    |  6 +++
> >   drivers/gpu/drm/v3d/v3d_sched.c               | 10 +++-
> >   include/uapi/drm/v3d_drm.h                    | 15 ++++++
> >   6 files changed, 91 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_dr=
v.c
> > index d7ff1f5fa481..f1753ee2af25 100644
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
> > @@ -350,6 +351,8 @@ static int v3d_platform_drm_probe(struct platform_d=
evice *pdev)
> >       if (ret)
> >               goto drm_unregister;
> >
> > +     atomic_set(&v3d->num_perfmon, 0);
> > +
> >       return 0;
> >
> >   drm_unregister:
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_dr=
v.h
> > index cf4b23369dc4..9491d730d99f 100644
> > --- a/drivers/gpu/drm/v3d/v3d_drv.h
> > +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> > @@ -61,6 +61,8 @@ struct v3d_queue_state {
> >       struct v3d_stats stats;
> >   };
> >
> > +struct v3d_dev;
> > +
>
> Forward declarations go in the beginning of the file, along with the
> other ones:
>
> struct clk;
> struct platform_device;
> struct reset_control;
> +struct v3d_dev;
>

I am happy that I do not need this in v2 anymore.

> >   /* Performance monitor object. The perform lifetime is controlled by =
userspace
> >    * using perfmon related ioctls. A perfmon can be attached to a submi=
t_cl
> >    * request, and when this is the case, HW perf counters will be activ=
ated just
> > @@ -68,6 +70,9 @@ struct v3d_queue_state {
> >    * done. This way, only events related to a specific job will be coun=
ted.
> >    */
> >   struct v3d_perfmon {
> > +     /* Pointer back to v3d instance this perfmon belongs. */
> > +     struct v3d_dev *v3d;
> > +
> >       /* Tracks the number of users of the perfmon, when this counter r=
eaches
> >        * zero the perfmon is destroyed.
> >        */
> > @@ -179,6 +184,9 @@ struct v3d_dev {
> >               u32 num_allocated;
> >               u32 pages_allocated;
> >       } bo_stats;
> > +
> > +     /* Keep track of current number of allocated perfmons. */
> > +     atomic_t num_perfmon;
> >   };
> >
> >   static inline struct v3d_dev *
> > @@ -584,6 +592,8 @@ int v3d_perfmon_get_values_ioctl(struct drm_device =
*dev, void *data,
> >                                struct drm_file *file_priv);
> >   int v3d_perfmon_get_counter_ioctl(struct drm_device *dev, void *data,
> >                                 struct drm_file *file_priv);
> > +int v3d_perfmon_set_global_ioctl(struct drm_device *dev, void *data,
> > +                              struct drm_file *file_priv);
> >
> >   /* v3d_sysfs.c */
> >   int v3d_sysfs_init(struct device *dev);
>
> [...]
>
> > diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> > index 87fc5bb0a61e..960d392d75a3 100644
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
> > +/**
>
> Using /** means that you are writting a kernel-doc comment [1], so make
> sure to describe each struct member, otherwise it's going to generate
> build warnings with W=3D1.
>

Learned something new - thanks for sharing.

> > + * struct drm_v3d_perfmon_set_global - ioctl to define a
> > + * global performance counter that is used if a job has
> > + * not assigned one on its own.
> > + */
> > +
> > +#define DRM_V3D_PERFMON_CLEAR_GLOBAL    0x0001
>
> I would keep this define above the struct comment.
>

Sure .. have done it in v2 of the patch.

> > +struct drm_v3d_perfmon_set_global {
> > +     __u32 flags;
> > +     __u32 id;
> > +};
> > +
> >   #if defined(__cplusplus)
> >   }
> >   #endif
>
> [1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html
>

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

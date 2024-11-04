Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E7A9BB5CF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 14:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2BD10E2CE;
	Mon,  4 Nov 2024 13:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GrB7PcYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEF910E2CE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 13:21:54 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2e2bb1efe78so2914893a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 05:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730726514; x=1731331314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Fwlr0AaF9wjPiXZcT4v/0uyS6FKcGIJwRpciZvewDA=;
 b=GrB7PcYMH6kD5dAknGLacEVlWjD4vhonY5SHBjcsYsP+4P+eFKXfDGMqy/MEuM8SPe
 7tFexu0oiyxLilU/5ZgCCAcj3ja1oySf3O56DdKQeUdo8xwkvDKoORKuS5BajanNsWzF
 LTGucbz1freoaPk51DxJR2eFhnIfKMyw4dtuAoh7+mDPrF6yR+J8knFGL0BNqXvWlwgA
 lC156M6/L2wj9fcOdH3abI3UTuju3Xe17hF2FhRPlqqY+7AWB8TOR35jW9JqMx3y80tu
 F/cRG2uK2BN0FjLSFMK4JPSpqND8u0pJ/5d7aZLWOokfnoPe+DylhoDtHRpgjJ7RFmzD
 1sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730726514; x=1731331314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Fwlr0AaF9wjPiXZcT4v/0uyS6FKcGIJwRpciZvewDA=;
 b=Z9A744cumDs0HMoq9/1w+Q4QpcITesU+ybG8ZZdsj7kz6eYGuVTFXvjLNVKx59Fs7x
 yw+xOxjmNtl9oIOkGYgp0v8XqgDqmLO4RmIhqDv7R2d5xpMcf4rj7hUrX6OU3it1i4wU
 7SjaEtapH/8zNc/F6ODW3n9fHb6JZU7dEt7cmC4iz/i3a5ePZkqbrIeugnxXii6Qdxyj
 45B5B2Xxary5N2bixBr3CfaCJSAuXQNp/nGVQH65PfvQ0bRvpjTlVp3oKva+2pvQEmNL
 AmkpjM6ItEp6da2UoJ51AcbA2EiMzSxki8HpnogELLwhgVIXGmcqYBB5242RlSRqDm43
 HT2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxtemkelbt3CXrJTyKc1wnVDeNoDiSlBMYRQYoGe7+fcCH3g7CcL8BwrbfKFq3W0y+zTPjk8VDSgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeLd3Sh3IXEmS6ndcdnZ+M5tm3THhT7KkRSEH+650WRen/YSar
 dw+qIFLGDhMl6FZcbjXHwwmYpkheI37yTcdgJXK/5gL3S+J0/9eXo1Fxmm4d4D1FBAZSYiSPmw5
 et2yJ85X0ThtMLwLHHfO0Cx0Q674=
X-Google-Smtp-Source: AGHT+IHZjkq3Ie2iIyfuGufHHiIKI5Xxv0rEb6DJ4QCDY+AvB4y4PBqvaVcW2foSo8pwydHzUkD95Y0rng/FXH8j0iw=
X-Received: by 2002:a17:90b:278c:b0:2e3:bc3e:feef with SMTP id
 98e67ed59e1d1-2e93e0589dcmr22420715a91.3.1730726513505; Mon, 04 Nov 2024
 05:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20241031205140.541907-1-christian.gmeiner@gmail.com>
 <4c3eeaf2-218a-451b-aa51-f0e9f4bef0d6@igalia.com>
In-Reply-To: <4c3eeaf2-218a-451b-aa51-f0e9f4bef0d6@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 4 Nov 2024 14:21:42 +0100
Message-ID: <CAH9NwWcehP+9bekxMoxF3QdO_7j5zwNLuCmHNvd-JCCV_x85jA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
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

Hi Ma=C3=ADra,

>
> Thanks for your patch! Just some small nits.
>

Thanks for your review.

> On 31/10/24 17:51, Christian Gmeiner wrote:
> > From: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > Add a new ioctl, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, to allow
> > configuration of a global performance monitor (perfmon).
> > Use the global perfmon for all jobs to ensure consistent
> > performance tracking across submissions.
>
> I'd mention how this feature can be useful for user-space (for example,
> the implementation of a Perfetto datasource).
>

That's a great idea .. will be done in V3.

> >
> > Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > ---
> > Changes in v2:
> > - Reworked commit message.
> > - Removed num_perfmon counter for tracking perfmon allocations.
> > - Allowing allocation of perfmons when the global perfmon is active.
> > - Return -EAGAIN for submissions with a per job perfmon if the global p=
erfmon is active.
> > ---
> >   drivers/gpu/drm/v3d/v3d_drv.c     |  1 +
> >   drivers/gpu/drm/v3d/v3d_drv.h     |  8 ++++++++
> >   drivers/gpu/drm/v3d/v3d_perfmon.c | 34 ++++++++++++++++++++++++++++++=
+
> >   drivers/gpu/drm/v3d/v3d_sched.c   | 14 ++++++++++---
> >   drivers/gpu/drm/v3d/v3d_submit.c  | 10 +++++++++
> >   include/uapi/drm/v3d_drm.h        | 15 ++++++++++++++
> >   6 files changed, 79 insertions(+), 3 deletions(-)
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
> > index 156be13ab2ef..bf42303c292b 100644
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
> > @@ -451,3 +454,34 @@ int v3d_perfmon_get_counter_ioctl(struct drm_devic=
e *dev, void *data,
> >
> >       return 0;
> >   }
>
> [...]
>
> > index 87fc5bb0a61e..709724fe28e6 100644
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
> > +/*
>
> Please, use kernel-doc [1]. So, here is /**
>
> [1] https://docs.kernel.org/doc-guide/kernel-doc.html
>
> > + * struct drm_v3d_perfmon_set_global - ioctl to define a
>
> The colunm width is 80.
>
> > + * global performance counter that is used if a job has
>
> s/counter/monitor
>
> > + * not assigned one on its own.
>
> This description isn't really precise. When the global performance
> monitor is enabled, the job perfmon doesn't matter. Currently, we don't
> even allow a job perfmon to be submitted, but if we did, the global
> perfmon would be used even if the job had a perfmon.
>

I have rephrased this comment and should be more precise now.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

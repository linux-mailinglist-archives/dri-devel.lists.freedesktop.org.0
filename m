Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF59BB5E2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 14:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BEC10E08D;
	Mon,  4 Nov 2024 13:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l7suH2EI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1627110E08D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 13:24:56 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2e34a089cd3so3344258a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 05:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730726695; x=1731331495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wyMarYMRnwtVEOuz49gw8N4olzvNdp83WA83rnbeLrI=;
 b=l7suH2EIoycFHhmAJdDdTyG+Q3LaLVp7Jxf/+IuDfRrGTRB3pqx8GcG8bmZwnRdbX4
 xhyU/H9G6EMdCWAjan4Zo0A84YyQ94xLP/UzaNs5H6leeUHhVkX6ENjInIhDn3wV31FU
 Izm1sdPQmPtdeijSAYLzYKfzJwFPMQ19fiwC4JVzmjVStzF1RX2ltn01p7NNE2vbNBvn
 Xf3ke4cCPQ1tjh9gb0Vjw8IbRKJ8yvII9UV/gHHLZd5UEw2crLn2lfxH8xLoj3U9gsph
 M47PPRe99yeI0n+cFJ3VhItcAnw7k8zygl59z4/0TJ4cW0GF6jUXIlGLPKoZSGNBeM6z
 T1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730726695; x=1731331495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wyMarYMRnwtVEOuz49gw8N4olzvNdp83WA83rnbeLrI=;
 b=tzb/kFnTF7fAodZlqxET87YaR2bfTH9YApiFUEWfm/WdV2Qrzsnia4y237FPF7EokZ
 pmLvv1SDQ2z6YI8sZ3qE5ZTsqI6MgaB6/XbQrYzv5MjyxaojjbISDWz/LrB12C7wSh5p
 FnulEvS95CW/pb5kT1AJ70VdAFbQ2HxRxDMLRPzg7TSh9FBCfP0KEi5WdwE0e5Pa7cWO
 XFFXfwWUXW288t09oolZIhwYGLjr85jcvTypK0lJHUdVZLCjBsQgdzkqzmXDCPyWrGHv
 z9aJU5AxQff5172hnKFbzYlp+i3ToxJQsLCWE4gUI57j+kqqFmO5jk8NblQN5pRZtQ7N
 wGPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb9OHnhqc+SAejh7MZ2CKsZg6maNYyZ/Erc+WawwyfuVetYcqa/HxhoxSwicoApGAKsm1LwD8ZufA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUrTTbm9c+dS0bLrEegXkQJdYChx6aYd1PHXGCRqPb8TIcXyhM
 wGiYRQJBpqjLwN83ikLEPoyLagJk7t8Y/SQ3aDj9uh9o78dVzGypi+K4wayZYBaLxyVby8gi7qD
 VSjskZGJXQl8LBLaOxS72Ju0IREw=
X-Google-Smtp-Source: AGHT+IFmj6tQvhRV7bo1U++FmRbmp5zJMc0V86u/uFsYr5oXIU3pXxUqBf1Q9vQIcVZR5UoPjNgknGCYVZY6pFjhG3Q=
X-Received: by 2002:a17:90a:b30e:b0:2e2:daab:cc69 with SMTP id
 98e67ed59e1d1-2e8f105e941mr33220797a91.12.1730726695528; Mon, 04 Nov 2024
 05:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20241031205140.541907-1-christian.gmeiner@gmail.com>
 <fe4056fd-6bb5-435f-aef3-176e301824ef@igalia.com>
In-Reply-To: <fe4056fd-6bb5-435f-aef3-176e301824ef@igalia.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 4 Nov 2024 14:24:44 +0100
Message-ID: <CAH9NwWde9aUwdzZ33qaS5-8OSJ+SNVxiBJpx1OK+a_DYH=TtmQ@mail.gmail.com>
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

> On 31/10/24 17:51, Christian Gmeiner wrote:
> > From: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > Add a new ioctl, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, to allow
> > configuration of a global performance monitor (perfmon).
> > Use the global perfmon for all jobs to ensure consistent
> > performance tracking across submissions.
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
>
> [...]
>
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
> I'm reading the userspace code now and I think you need to call
> `v3d_perfmon_stop` here to make sure that the active perfmon is no
> longer the global perfmon.
>

I will add a `v3d_perfmon_stop` call to `v3d_perfmon_destroy_ioctl` as it
seems a much better place.

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

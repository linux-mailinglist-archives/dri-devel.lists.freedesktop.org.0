Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D7A72023
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 21:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DCE10E785;
	Wed, 26 Mar 2025 20:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jXPS0VBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E2F10E785
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 20:46:52 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3d5bb2ae4d3so1014395ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743022012; x=1743626812; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JhMoKQ5EpQ1pQUTEtH4nghhLWcwT/i5YVCywj3TCE4=;
 b=jXPS0VBRgEk0yv8Tdbl+zH8KF1S0nxVrHg2Zy/AqeHN36RpBBcuDMPR7+0caaafBBC
 8kmafaZYLoE7VdbED0PNb8PCjtwYziFYTx2967Ixg4Eqv3YKYN2gsNaJGbpG7L0cR5hO
 PGNEMzT6xh0xWd8rK0/QMG4qYKKkwy7Xp2oz8995HsF/SCrLkaO3yFtD+uS9BHcR5XjS
 /xthhy/qja6jLm4j9CTRD4kqrJC62FHIyLn09W+BlXMStl4STCx9r+T2BFAl98zvpifC
 uFeAx6MP4rS4ahBLXGOL+awGwoKUB9XNMVDTAEC+ksTLy07C2fOyAOuuVb8BL+ZeX5nu
 t45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743022012; x=1743626812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5JhMoKQ5EpQ1pQUTEtH4nghhLWcwT/i5YVCywj3TCE4=;
 b=QJ3z2yah7sjnhP7+vHY8bcOBxnX8vPvPUOfzoFzub5N/1VsH7614s/msPIJbz9HuR7
 aab0gwziMO33eR8nz+OVd9G9wlS4OZSsFbMa1uogNEXfXvyvP8oUbpsbwD6T1lglcEbQ
 mgvbL01Vm8b5wwlYV/+E8RYAEtt84VyC0bGVdEfCeNKdJuSzWbV4vP2ajqe1g1Q0voT/
 eo7FJaiH0eqCEeotyRo5onCWRsJUGvy8O4NCVa0QFvE1O571RJ7AoyOZ/2SI1QaUkHwL
 8eRLtlNV5/jxyS/5TVLBxMsPXONSfJ6AqVKt0Y/paU24fzi3H36zpmhhargyPE6ilvZy
 RI2Q==
X-Gm-Message-State: AOJu0YyxDfJrSkpYIEo0qmLK6+obyPC+JHDcG6xMIqC1fk6g8GqB/+OA
 yyZ8PneOtA7LSxal/c/v4zxvIcpHiLIKcJhR3fhdG4p0P2Va3RyqvBWFtK30aUEvexXlUH6gDoK
 YZEXr7qqhofgIFKsnd0v4+n9yYKo=
X-Gm-Gg: ASbGnct1SrK+xp8lejWEwiSHk/KVAiJq1+eSBWH+aeVm5kSbvACKsDdpPq061WfnizV
 0MjjSOw0j4tU/c+c5wtEYwDdPhBwcilqJc1xDCuQOKgs/ePBO0HSJVyWW16E0AdK/y2erw4ycFZ
 JsjK6vIjLPp58gHa2zaSNkHzRDAddbNWrGGwlOaKM/xuklZbAlQdQ4IzWFzzzvXtgqT2A=
X-Google-Smtp-Source: AGHT+IGLmmU7KJxynJ3JmzAzaYdjW5MSKvJRuKUzfOy/PXKBCJHqw2vGsRgic8SeuLTGlXrTd5GgP9KRL2pxFlwrF9Y=
X-Received: by 2002:a05:6e02:1fe8:b0:3d0:bd5:b863 with SMTP id
 e9e14a558f8ab-3d5cce27d98mr12686545ab.20.1743022011691; Wed, 26 Mar 2025
 13:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143903.24380-1-robdclark@gmail.com>
 <342ee079-ee0e-470d-afd2-c2870115b489@amd.com>
 <CAF6AEGu2Ax+u3QmD2VADwh4A4s5TAmP5Lq4DcYYadKP4csH-=g@mail.gmail.com>
In-Reply-To: <CAF6AEGu2Ax+u3QmD2VADwh4A4s5TAmP5Lq4DcYYadKP4csH-=g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Mar 2025 13:46:39 -0700
X-Gm-Features: AQ5f1JrBlKDKgO0ATBxgVYhh5njSw5419j_VUVoZrjO0N4Ci8VzagRd6Vn0tpUY
Message-ID: <CAF6AEGv-Zad2GF-=gDdYQdZGkJ_u+eyBFvTNK49m5+1ycaZu9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
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

On Wed, Mar 26, 2025 at 7:46=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Wed, Mar 26, 2025 at 7:41=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 26.03.25 um 15:39 schrieb Rob Clark:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add support for exporting a dma_fence fd for a specific point on a
> > > timeline.
> >
> > Looks good on first glance. What's the userspace use case?
>
> Timeline syncobj support for vtest/vpipe[1][2].. since core
> virglrender and drm native ctx works in terms of fences (since in the
> VM case, everything is a fence below the guest kernel uabi), we need
> to be able to turn a point on a timeline back into a fence fd.  (Plus
> it seemed like an odd omission from the existing uabi.)
>
> BR,
> -R
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/8=
05
>
> >
> > Regards,
> > Christian.
> >
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_syncobj.c | 8 ++++++--
> > >  include/uapi/drm/drm.h        | 2 ++
> > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_sync=
obj.c
> > > index 4f2ab8a7b50f..eb7a2dd2e261 100644
> > > --- a/drivers/gpu/drm/drm_syncobj.c
> > > +++ b/drivers/gpu/drm/drm_syncobj.c
> > > @@ -762,7 +762,7 @@ static int drm_syncobj_import_sync_file_fence(str=
uct drm_file *file_private,
> > >  }
> > >
> > >  static int drm_syncobj_export_sync_file(struct drm_file *file_privat=
e,
> > > -                                     int handle, int *p_fd)
> > > +                                     int handle, u64 point, int *p_f=
d)
> > >  {
> > >       int ret;
> > >       struct dma_fence *fence;
> > > @@ -772,7 +772,7 @@ static int drm_syncobj_export_sync_file(struct dr=
m_file *file_private,
> > >       if (fd < 0)
> > >               return fd;
> > >
> > > -     ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fen=
ce);
> > > +     ret =3D drm_syncobj_find_fence(file_private, handle, point, 0, =
&fence);
> > >       if (ret)
> > >               goto err_put_fd;
> > >
> > > @@ -882,8 +882,12 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device=
 *dev, void *data,
> > >
> > >       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FI=
LE)
> > >               return drm_syncobj_export_sync_file(file_private, args-=
>handle,
> > > +                                                 args->point,
> > >                                                   &args->fd);

Hmm, maybe I should add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE so
that userspace gets a clean error on older kernels, rather than having
the point param be silently ignored..

BR,
-R

> > >
> > > +     if (args->point)
> > > +             return -EINVAL;
> > > +
> > >       return drm_syncobj_handle_to_fd(file_private, args->handle,
> > >                                       &args->fd);
> > >  }
> > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > index 7fba37b94401..c71a8f4439f2 100644
> > > --- a/include/uapi/drm/drm.h
> > > +++ b/include/uapi/drm/drm.h
> > > @@ -912,6 +912,8 @@ struct drm_syncobj_handle {
> > >
> > >       __s32 fd;
> > >       __u32 pad;
> > > +
> > > +     __u64 point;
> > >  };
> > >
> > >  struct drm_syncobj_transfer {
> >

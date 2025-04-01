Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F325AA78004
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4442910E5F5;
	Tue,  1 Apr 2025 16:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UaBFMjxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D2510E5F5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:18:10 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3d589227978so18445075ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743524290; x=1744129090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqFXSYEwhYNvuYelKTlJfqjn2CtSSo/5QPRUsnL00Bs=;
 b=UaBFMjxlW0dGC3pcC94UZ5Cy02mFV+2NAnvCZni7iXyapIIVmMuksTQHvqU+DkUkvT
 6fbKPWvA23LopbDFBTTBUkbmGnvnfExVihCYPZZSmXDZplpi8ACbhd/wn5Vtdhro4khk
 8lBSxcZ4UnnL8Rgo/BfegB3hyCso588jHAVo0d8rzn1hYuh29HhOaZhnyhvOAejd7pBp
 pAtOW4p5d2agCtMZGVRpK4SleDQlLTBhqNtLq8xpxkpi1lduZiOvAEm4ApQ85SP7U++p
 sqJTdk+XJJAT8usq2kzpsRWt+CZbJLDtgixEj3dku0wCHDRwzHutQr3DXujliM4BkmQl
 XG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743524290; x=1744129090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dqFXSYEwhYNvuYelKTlJfqjn2CtSSo/5QPRUsnL00Bs=;
 b=YgkyqIV6nQCu8D4Xcl0lIQfgM4nR+Twdjva0YN8Yydizn2FdpJvyhljZ0B0nOAPNf1
 ucdIdxEiErM7wnNYJ7/HT4Y2U3FLzGxsZO1K1y39wul8o5YXLo5kdsmCAqWUaD3q2bAm
 nQ/PHcOPg1aLiItWKIjjqAaGmEsLc5dDg4UEewVyiU74QN+lg8ul2ZS6vN1ZMdSHIhsN
 Ee4GC+9JEp81Sr0qONm8x9si7CCk+5ctydhhYUY4wXnnU0YySLSG9Lqe19unLfrnM0p9
 FjuKPuUxn3SZFXSUUyGYM2vlHWZz6STjjbr6fGMHuuCT8yPDfv2rP7VUNwUG25doILDN
 5mow==
X-Gm-Message-State: AOJu0YwD0H/w9SB+1YtH9LTOemDZp+SxRV2frfUhFAu47dzOjAv+pMMf
 bsSLly5RP19k/s7lYxzKM8ZmAjVcwdsLqzumaL+zd439rDd6UG3EhS/26JTDFUTbkYhbI5DJERk
 O6wtpz5Zer+l0NKTahX9XPbtZRjE=
X-Gm-Gg: ASbGncvEPyHIuXqoG8QbE9RgfINUsZq4qtjAM1EHagv3jFvE4CQUEM/5pYKF1Jbr2d8
 hpSmKiNpvzf4WHxpvd3rgQhhgyH/IHHV7GATDq9y0rXPmRmS3Zj4T07AltdlKB2IHCFH5BOmrlH
 KR4Uh00e8scqFBcUj4jMAoOsSxbxy066ebdd2CW1aXvNOwOHpLUff+/89NB8e/YR7VLNgpi0Q=
X-Google-Smtp-Source: AGHT+IEB8Y1ukx7WzzSNycHm2osv0GmAeeTqv2BbGe+G8ag4TjR+T4vF4B+WdEZAuzdCZJPyEnzG046vB0c4B3SJ0tU=
X-Received: by 2002:a05:6e02:1101:b0:3d6:d147:c6a2 with SMTP id
 e9e14a558f8ab-3d6d3487727mr6919155ab.8.1743524289685; Tue, 01 Apr 2025
 09:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250331212333.16029-1-robdclark@gmail.com>
 <593b5915-7148-446a-a240-7f7939025a5f@gmail.com>
In-Reply-To: <593b5915-7148-446a-a240-7f7939025a5f@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Apr 2025 09:17:55 -0700
X-Gm-Features: AQ5f1Jr1XOgv1FGNyqKdzNaS64bxJ7dCHmN1AVvvv26tXOsRZqym_e0zrMFu_7U
Message-ID: <CAF6AEGvvTsmeESbzf0DU3171t5e+mLNLb1=J9KvTVe3BdxOOQg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5] drm/syncobj: Extend EXPORT_SYNC_FILE
 for timeline syncobjs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
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

On Tue, Apr 1, 2025 at 4:18=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 31.03.25 um 23:23 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add support for exporting a dma_fence fd for a specific point on a
> > timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> > syncobj support, as it needs a way to turn a point on a timeline back
> > into a dma_fence fd.  It also closes an odd omission from the syncobj
> > UAPI.
> >
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> > [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests=
/805
> >
> > v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> > v3: Add unstaged uabi header hunk
> > v4: Also handle IMPORT_SYNC_FILE case
> > v5: Address comments from Dmitry
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 45 +++++++++++++++++++++++++++--------
> >  include/uapi/drm/drm.h        |  4 ++++
> >  2 files changed, 39 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 4f2ab8a7b50f..b0a4c58fe726 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file=
 *file_private,
> >  }
> >
> >  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_pr=
ivate,
> > -                                           int fd, int handle)
> > +                                           int fd, int handle, u64 poi=
nt)
> >  {
> >       struct dma_fence *fence =3D sync_file_get_fence(fd);
> >       struct drm_syncobj *syncobj;
> > @@ -755,14 +755,22 @@ static int drm_syncobj_import_sync_file_fence(str=
uct drm_file *file_private,
> >               return -ENOENT;
> >       }
> >
> > -     drm_syncobj_replace_fence(syncobj, fence);
> > +     if (point) {
> > +             struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
> > +             if (!chain)
> > +                     return -ENOMEM;
> > +             drm_syncobj_add_point(syncobj, chain, fence, point);
>
> Just a nit pick but checkpatch.pl will complain about it: Empty line betw=
een declaration and code please.
>
> Maybe double check if checpatch.pl is otherwise happy with the patch.
>
> With that done feel free to add Reviewed-by: Christian K=C3=B6nig <christ=
ian.koenig@amd.com>.
>
> Let me know if I should push it to drm-misc-next.

Yes please, I've sent a v6

BR,
-R

> Regards,
> Christian.
>
> > +     } else {
> > +             drm_syncobj_replace_fence(syncobj, fence);
> > +     }
> > +
> >       dma_fence_put(fence);
> >       drm_syncobj_put(syncobj);
> >       return 0;
> >  }
> >
> >  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> > -                                     int handle, int *p_fd)
> > +                                     int handle, u64 point, int *p_fd)
> >  {
> >       int ret;
> >       struct dma_fence *fence;
> > @@ -772,7 +780,7 @@ static int drm_syncobj_export_sync_file(struct drm_=
file *file_private,
> >       if (fd < 0)
> >               return fd;
> >
> > -     ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fence=
);
> > +     ret =3D drm_syncobj_find_fence(file_private, handle, point, 0, &f=
ence);
> >       if (ret)
> >               goto err_put_fd;
> >
> > @@ -869,6 +877,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *d=
ev, void *data,
> >                                  struct drm_file *file_private)
> >  {
> >       struct drm_syncobj_handle *args =3D data;
> > +     unsigned valid_flags =3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE =
|
> > +                            DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC=
_FILE;
> > +     u64 point =3D 0;
> >
> >       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> >               return -EOPNOTSUPP;
> > @@ -876,13 +887,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device =
*dev, void *data,
> >       if (args->pad)
> >               return -EINVAL;
> >
> > -     if (args->flags !=3D 0 &&
> > -         args->flags !=3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_F=
ILE)
> > +     if (args->flags & ~valid_flags)
> >               return -EINVAL;
> >
> > +     if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
> > +             point =3D args->point;
> > +
> >       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE=
)
> >               return drm_syncobj_export_sync_file(file_private, args->h=
andle,
> > -                                                 &args->fd);
> > +                                                 point, &args->fd);
> > +
> > +     if (args->point)
> > +             return -EINVAL;
> >
> >       return drm_syncobj_handle_to_fd(file_private, args->handle,
> >                                       &args->fd);
> > @@ -893,6 +909,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *d=
ev, void *data,
> >                                  struct drm_file *file_private)
> >  {
> >       struct drm_syncobj_handle *args =3D data;
> > +     unsigned valid_flags =3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE =
|
> > +                            DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC=
_FILE;
> > +     u64 point =3D 0;
> >
> >       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> >               return -EOPNOTSUPP;
> > @@ -900,14 +919,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device =
*dev, void *data,
> >       if (args->pad)
> >               return -EINVAL;
> >
> > -     if (args->flags !=3D 0 &&
> > -         args->flags !=3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_F=
ILE)
> > +     if (args->flags & ~valid_flags)
> >               return -EINVAL;
> >
> > +     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
> > +             point =3D args->point;
> > +
> >       if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE=
)
> >               return drm_syncobj_import_sync_file_fence(file_private,
> >                                                         args->fd,
> > -                                                       args->handle);
> > +                                                       args->handle,
> > +                                                       point);
> > +
> > +     if (args->point)
> > +             return -EINVAL;
> >
> >       return drm_syncobj_fd_to_handle(file_private, args->fd,
> >                                       &args->handle);
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 7fba37b94401..e63a71d3c607 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
> >  };
> >
> >  #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
> > +#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
> >  #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
> > +#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
> >  struct drm_syncobj_handle {
> >       __u32 handle;
> >       __u32 flags;
> >
> >       __s32 fd;
> >       __u32 pad;
> > +
> > +     __u64 point;
> >  };
> >
> >  struct drm_syncobj_transfer {
>

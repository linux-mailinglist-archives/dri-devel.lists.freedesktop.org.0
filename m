Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1A0A792BE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5D10E048;
	Wed,  2 Apr 2025 16:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GVs84480";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE6D10E048
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:12:12 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3d5eb0ec2bdso77365ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743610331; x=1744215131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rK9kTwLfXEgDnRykzZWh9AEgnuJfNseTnoRiIhmpsc=;
 b=GVs84480piwR1zz8SuVsLO/vJT2Al77RdkZ7AbK04iIbC6I1ROV9Ge712aZ9Lk0fAs
 Yc5stg1bSQnXSzPdJg8T1wvWr6Ro763+s4DZv5NstOo/ZOKHyLJhkZw9UOazhoAnNFLL
 LO+2hfmdQr1d+qmLRqnjfwMN4qPJYtMdinqKBX4BIxP4mb+ukkduuOzYAyQv4QFy8CQS
 Nz1EiS8BebMqDArzmKHVz2H4d6+ct0OPJYVrgHXaKf7xEyC2EPqsS4wz1ABb4eK10sg6
 ydb3zhnOTlOVSyzBV9U8oNhD2z103qJZo178M1T7GTOgUZUVOasgbfjDIQmPvWubNb/P
 o+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743610331; x=1744215131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rK9kTwLfXEgDnRykzZWh9AEgnuJfNseTnoRiIhmpsc=;
 b=u2ftxujVbE9e/VYg19Lai6L5AXfNNw01mlaOYNq3KseL9QeoA5uQZYJLXa+B8cyouu
 GTTBCBGTmfIoWxtBCk0S5bqD3kCdVBey7qsIiutJmZSd2Ut/VSrB5ujBVNOU0v0yoac9
 XL/7vf6uxvmpnMTaCsVZiuBLnrjzM4Evh0M2KFaLBk3WzO/Lm7nff+DWTGKuGzHRSZYd
 HRpdv53Y1hdVg/CdoxPfmAdIslO2vqHo++rhcrvzg0yMlwXXU6ukDL+pdJYAGtFxl37f
 BXIkBVGp6eAVik5zhH9rzmIUyrgGdIERcNfpyMUNmfXnGv4jB8EqiFgFC5gGZUaQ8fjn
 aluw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSXT6YtDuzGN2c9k7L/bOm2Mftx86B//BYyAUKb73aIbwPXlV0N5bcrtThDyB48jpznJrjrzUdD7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXkJ4/1nr3t2JmD50VyaY2457YRgKOMv/JwQJg245V0discnAH
 lGWfFGSzvkgkdhte5gOVNX1b448io6uxaioBDZMA65qhiEe9u2YWnUBd08DDd/xuW8+q6EY3zL3
 7591sVVggQMJOT/+b6e72KwY9MSs=
X-Gm-Gg: ASbGncs3772ln27bJWPhDgtGhsDyzq7BWJzsWUpqECXciP+9cf5sGWZ6bd4R9VGvLNc
 rKABP+gqHprAKJVpMy1+WQU/3FTzgmt1bZzA1eGRpBw6slYpl1PDjCUD+7PGan00FnmMku+LiUH
 9WVA8wAxD1q+gNkMQ7AFpPZ6sYOfzMy5orcTOuhuiW6tBTRewH6rWnz+7DxvLH8o43Tno8BDI=
X-Google-Smtp-Source: AGHT+IFkYI6mSsCBU3Xd58kZsuiXhxMXIV+xUr1NKSGa56kWg9906qGj0TOjzVUzEtK07ut+ViwxdQy4wwNXDrQnrD0=
X-Received: by 2002:a05:6e02:4401:10b0:3d6:d3f7:8813 with SMTP id
 e9e14a558f8ab-3d6d3f7c3c0mr33927585ab.22.1743610331229; Wed, 02 Apr 2025
 09:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250401155758.48855-1-robdclark@gmail.com>
 <CAF6AEGsKbjq_q7ezQTn5vyAF1cjXahgbv84uYK35BJH1KBXSpw@mail.gmail.com>
 <ff614cb7-94ca-4d74-9bbb-f97c95893113@collabora.com>
 <b636faa5-ab31-41d6-b957-4dfe89a2b47d@amd.com>
In-Reply-To: <b636faa5-ab31-41d6-b957-4dfe89a2b47d@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 2 Apr 2025 09:11:59 -0700
X-Gm-Features: AQ5f1JoTRdjAnHaCZTeG_hJr4mmegr_fGINI7Zx0FF-EN5SHZjfv1OdMb7Fb8uc
Message-ID: <CAF6AEGutP-TTJjt=HrzpYooUerQ3jETYz=Mw8NEb2h3kLo=3kA@mail.gmail.com>
Subject: Re: [PATCH v6] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline
 syncobjs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
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

On Tue, Apr 1, 2025 at 11:55=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 01.04.25 um 22:46 schrieb Dmitry Osipenko:
> > On 4/1/25 23:40, Rob Clark wrote:
> >> On Tue, Apr 1, 2025 at 8:58=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Add support for exporting a dma_fence fd for a specific point on a
> >>> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> >>> syncobj support, as it needs a way to turn a point on a timeline back
> >>> into a dma_fence fd.  It also closes an odd omission from the syncobj
> >>> UAPI.
> >>>
> >>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> >>> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_reques=
ts/805
> >>>
> >>> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> >>> v3: Add unstaged uabi header hunk
> >>> v4: Also handle IMPORT_SYNC_FILE case
> >>> v5: Address comments from Dmitry
> >>> v6: checkpatch.pl nits
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_syncobj.c | 47 +++++++++++++++++++++++++++------=
--
> >>>  include/uapi/drm/drm.h        |  4 +++
> >>>  2 files changed, 41 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_sync=
obj.c
> >>> index 4f2ab8a7b50f..636cd83ca29e 100644
> >>> --- a/drivers/gpu/drm/drm_syncobj.c
> >>> +++ b/drivers/gpu/drm/drm_syncobj.c
> >>> @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_fi=
le *file_private,
> >>>  }
> >>>
> >>>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_=
private,
> >>> -                                             int fd, int handle)
> >>> +                                             int fd, int handle, u64=
 point)
> >>>  {
> >>>         struct dma_fence *fence =3D sync_file_get_fence(fd);
> >>>         struct drm_syncobj *syncobj;
> >>> @@ -755,14 +755,24 @@ static int drm_syncobj_import_sync_file_fence(s=
truct drm_file *file_private,
> >>>                 return -ENOENT;
> >>>         }
> >>>
> >>> -       drm_syncobj_replace_fence(syncobj, fence);
> >>> +       if (point) {
> >>> +               struct dma_fence_chain *chain =3D dma_fence_chain_all=
oc();
> >>> +
> >>> +               if (!chain)
> >>> +                       return -ENOMEM;
> >>> +
> >>> +               drm_syncobj_add_point(syncobj, chain, fence, point);
> >>> +       } else {
> >>> +               drm_syncobj_replace_fence(syncobj, fence);
> >>> +       }
> >>> +
> >>>         dma_fence_put(fence);
> >>>         drm_syncobj_put(syncobj);
> >>>         return 0;
> >>>  }
> >>>
> >>>  static int drm_syncobj_export_sync_file(struct drm_file *file_privat=
e,
> >>> -                                       int handle, int *p_fd)
> >>> +                                       int handle, u64 point, int *p=
_fd)
> >>>  {
> >>>         int ret;
> >>>         struct dma_fence *fence;
> >>> @@ -772,7 +782,7 @@ static int drm_syncobj_export_sync_file(struct dr=
m_file *file_private,
> >>>         if (fd < 0)
> >>>                 return fd;
> >>>
> >>> -       ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &f=
ence);
> >>> +       ret =3D drm_syncobj_find_fence(file_private, handle, point, 0=
, &fence);
> >>>         if (ret)
> >>>                 goto err_put_fd;
> >>>
> >>> @@ -869,6 +879,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device =
*dev, void *data,
> >>>                                    struct drm_file *file_private)
> >>>  {
> >>>         struct drm_syncobj_handle *args =3D data;
> >>> +       unsigned int valid_flags =3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_T=
IMELINE |
> >>> +                                  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXP=
ORT_SYNC_FILE;
> >>> +       u64 point =3D 0;
> >>>
> >>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> >>>                 return -EOPNOTSUPP;
> >>> @@ -876,13 +889,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_devic=
e *dev, void *data,
> >>>         if (args->pad)
> >>>                 return -EINVAL;
> >>>
> >>> -       if (args->flags !=3D 0 &&
> >>> -           args->flags !=3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SY=
NC_FILE)
> >>> +       if (args->flags & ~valid_flags)
> >>>                 return -EINVAL;
> >>>
> >>> +       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
> >>> +               point =3D args->point;
> >>> +
> >>>         if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_=
FILE)
> >>>                 return drm_syncobj_export_sync_file(file_private, arg=
s->handle,
> >>> -                                                   &args->fd);
> >>> +                                                   point, &args->fd)=
;
> >>> +
> >>> +       if (args->point)
> >>> +               return -EINVAL;
> >>>
> >>>         return drm_syncobj_handle_to_fd(file_private, args->handle,
> >>>                                         &args->fd);
> >>> @@ -893,6 +911,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device =
*dev, void *data,
> >>>                                    struct drm_file *file_private)
> >>>  {
> >>>         struct drm_syncobj_handle *args =3D data;
> >>> +       unsigned int valid_flags =3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_T=
IMELINE |
> >>> +                                  DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMP=
ORT_SYNC_FILE;
> >>> +       u64 point =3D 0;
> >>>
> >>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> >>>                 return -EOPNOTSUPP;
> >> oh, I suppose I should add a check for DRIVER_SYNCOBJ_TIMELINE?  I'll
> >> send a v7 a bit later
> > Christian already applied to misc-test, please rebase and make it as a
> > new patch
>
> Yeah, sorry I was a bit to quick obviously.
>
> On the other hand I don't see an immediate need for a check for DRIVER_SY=
NCOBJ_TIMELINE here.
>
> The functions should work even when the driver doesn't handle timeline sy=
ncobj on it's own.

Ok, no problem, I'll just put an explicit cap check in virglrenderer,
rather than relying on this to tell me also if the driver supports
timeline:

         struct drm_syncobj_handle args =3D {
            .handle =3D 0,   /* invalid handle */
            .flags =3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE |
                     DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE,
            .fd =3D -1,
            .point =3D 1,
         };

         errno =3D 0;
         ret =3D drmIoctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &args);

         /* ENOENT means the kernel supports
DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
          * but that we didn't provide a valid handle.  EINVAL means
the kernel does
          * not support DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE.
          */
         if (errno =3D=3D ENOENT) {
            resp[0] =3D true;
            resp[1] =3D 1;
         } else {
            assert(errno =3D=3D EINVAL);
         }


BR,
-R

> Regards,
> Christian.
>
>

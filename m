Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80FFA78360
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 22:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B06310E15B;
	Tue,  1 Apr 2025 20:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K74Z+o6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44E810E15B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 20:41:04 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-85e73f7ba09so489800439f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 13:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743540061; x=1744144861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siRhwdkGqZcq/rdLOAyWJygNm07mlGX8YXe+LkcnPjg=;
 b=K74Z+o6FM+d/pM69MsEjKeU37x9xiGt874qfxhyFNh/SHqaNxScnP06Elyt/Dfqb17
 cdQrJTABFiafo4Xhq8+NIEHWWR9xsaYGz5L373Ppg/zCvJRGe38ZJeQn9wgY45RfwNOP
 Txe+aCg/uLvfxsldAhbRvZT3EZKwUITLohwJz5YC00LmZUzsu35eSD8jZ92rulsp5XuQ
 XrV5AH7JzRxF/pvqZVhOU5WyP8gwQQPXQG59fw/BxfR2CtU1yx7IAVix7f7GITuiXNMl
 QAga2TkF5dPVbhT4HarAGdT/N/xUKISG+DANXWd3NTRtn6CExYo+kJUA0LOslR1kbHz+
 NcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743540061; x=1744144861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=siRhwdkGqZcq/rdLOAyWJygNm07mlGX8YXe+LkcnPjg=;
 b=C4ebrdJOgO+M6rUkvP8K1aXAueeEUlxGXBQLTBsy5z3dSgXJPMUZm5mh5/nsG2Ecum
 sF+swePd9kUKXhr8ozLNw+w4SenRZv3M5St7TRWngN14iQrGtjcBmChT0DHc+XdlrZ8Q
 lzqzUx3Hmq7egh/Ag9wvYCE0iP51aYoebKl/+ti2J/RL74IxN/NNmqwf8UzrLTuuJWeQ
 sm0JiXPRjqnHuYoOErZsruWjPDl5xZNQfMmgZyK4RWqjqRw4HzC5c+VkUwDPce8phsv4
 UoIEwnAoqBD3dtWLB5nuA30WeOS4DRNJEu4BrwP/WZwa3WiTwIXL3ItJHDqGDDO078w1
 rJuw==
X-Gm-Message-State: AOJu0Yw0kOfbtGSVUEjHXHXNmfaR0UAFa+rBfVQhB4O3a2V0RmOm745P
 ada7LASRsRw6Ux4QU2QnvgGCMGmu18PjYHzSbyThD4ZpK4ymMd0g2odVA1muEZxytJzR/Zg5Zaq
 u5X8DEhXc99nV3UfoWXU9NcKK8P/j9Q7W
X-Gm-Gg: ASbGncvN3ftqGQhrh871GflKlhNBH1+I3vNzIIrrcay0xg0wiG8wCCuvzi4OClR4JZU
 TtS44ti2vHnb6snIQpIWs4BGmoNxU9kqAcSWVNrbyfYbN6GDHdaZikDamQGjo7V88rQmT6RFKfV
 6fq8iSXWLFa/24YUMhlPvMUNIo3MMDxmvIVE+PTnsdnlHxWhBA5PzeVG/CJ405
X-Google-Smtp-Source: AGHT+IFLlhtX4Th4iaWF6gmgGrgmSI2sNYPTK5C3v32iqwrOki9gMq65N8YIiPUx2AS0QMSgiiHdclEstrrecxsEUTg=
X-Received: by 2002:a05:6e02:330e:b0:3d4:2ea4:6b8a with SMTP id
 e9e14a558f8ab-3d6ca680434mr58428335ab.22.1743540061217; Tue, 01 Apr 2025
 13:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250401155758.48855-1-robdclark@gmail.com>
In-Reply-To: <20250401155758.48855-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Apr 2025 13:40:49 -0700
X-Gm-Features: AQ5f1Jok8YMtfimcNM4pgU6iFDD8sQiU6mJe95HIx3itVvK4c_kQGvT5W1tTXT4
Message-ID: <CAF6AEGsKbjq_q7ezQTn5vyAF1cjXahgbv84uYK35BJH1KBXSpw@mail.gmail.com>
Subject: Re: [PATCH v6] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline
 syncobjs
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

On Tue, Apr 1, 2025 at 8:58=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add support for exporting a dma_fence fd for a specific point on a
> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> syncobj support, as it needs a way to turn a point on a timeline back
> into a dma_fence fd.  It also closes an odd omission from the syncobj
> UAPI.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/8=
05
>
> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> v3: Add unstaged uabi header hunk
> v4: Also handle IMPORT_SYNC_FILE case
> v5: Address comments from Dmitry
> v6: checkpatch.pl nits
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 47 +++++++++++++++++++++++++++--------
>  include/uapi/drm/drm.h        |  4 +++
>  2 files changed, 41 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 4f2ab8a7b50f..636cd83ca29e 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file *=
file_private,
>  }
>
>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_priv=
ate,
> -                                             int fd, int handle)
> +                                             int fd, int handle, u64 poi=
nt)
>  {
>         struct dma_fence *fence =3D sync_file_get_fence(fd);
>         struct drm_syncobj *syncobj;
> @@ -755,14 +755,24 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
>                 return -ENOENT;
>         }
>
> -       drm_syncobj_replace_fence(syncobj, fence);
> +       if (point) {
> +               struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
> +
> +               if (!chain)
> +                       return -ENOMEM;
> +
> +               drm_syncobj_add_point(syncobj, chain, fence, point);
> +       } else {
> +               drm_syncobj_replace_fence(syncobj, fence);
> +       }
> +
>         dma_fence_put(fence);
>         drm_syncobj_put(syncobj);
>         return 0;
>  }
>
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> -                                       int handle, int *p_fd)
> +                                       int handle, u64 point, int *p_fd)
>  {
>         int ret;
>         struct dma_fence *fence;
> @@ -772,7 +782,7 @@ static int drm_syncobj_export_sync_file(struct drm_fi=
le *file_private,
>         if (fd < 0)
>                 return fd;
>
> -       ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fence=
);
> +       ret =3D drm_syncobj_find_fence(file_private, handle, point, 0, &f=
ence);
>         if (ret)
>                 goto err_put_fd;
>
> @@ -869,6 +879,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev=
, void *data,
>                                    struct drm_file *file_private)
>  {
>         struct drm_syncobj_handle *args =3D data;
> +       unsigned int valid_flags =3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMEL=
INE |
> +                                  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_=
SYNC_FILE;
> +       u64 point =3D 0;
>
>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>                 return -EOPNOTSUPP;
> @@ -876,13 +889,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *d=
ev, void *data,
>         if (args->pad)
>                 return -EINVAL;
>
> -       if (args->flags !=3D 0 &&
> -           args->flags !=3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_F=
ILE)
> +       if (args->flags & ~valid_flags)
>                 return -EINVAL;
>
> +       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
> +               point =3D args->point;
> +
>         if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE=
)
>                 return drm_syncobj_export_sync_file(file_private, args->h=
andle,
> -                                                   &args->fd);
> +                                                   point, &args->fd);
> +
> +       if (args->point)
> +               return -EINVAL;
>
>         return drm_syncobj_handle_to_fd(file_private, args->handle,
>                                         &args->fd);
> @@ -893,6 +911,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev=
, void *data,
>                                    struct drm_file *file_private)
>  {
>         struct drm_syncobj_handle *args =3D data;
> +       unsigned int valid_flags =3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMEL=
INE |
> +                                  DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_=
SYNC_FILE;
> +       u64 point =3D 0;
>
>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>                 return -EOPNOTSUPP;

oh, I suppose I should add a check for DRIVER_SYNCOBJ_TIMELINE?  I'll
send a v7 a bit later

BR,
-R

> @@ -900,14 +921,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *d=
ev, void *data,
>         if (args->pad)
>                 return -EINVAL;
>
> -       if (args->flags !=3D 0 &&
> -           args->flags !=3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_F=
ILE)
> +       if (args->flags & ~valid_flags)
>                 return -EINVAL;
>
> +       if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
> +               point =3D args->point;
> +
>         if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE=
)
>                 return drm_syncobj_import_sync_file_fence(file_private,
>                                                           args->fd,
> -                                                         args->handle);
> +                                                         args->handle,
> +                                                         point);
> +
> +       if (args->point)
> +               return -EINVAL;
>
>         return drm_syncobj_fd_to_handle(file_private, args->fd,
>                                         &args->handle);
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..e63a71d3c607 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
>  };
>
>  #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
> +#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
>  #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
> +#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
>  struct drm_syncobj_handle {
>         __u32 handle;
>         __u32 flags;
>
>         __s32 fd;
>         __u32 pad;
> +
> +       __u64 point;
>  };
>
>  struct drm_syncobj_transfer {
> --
> 2.49.0
>

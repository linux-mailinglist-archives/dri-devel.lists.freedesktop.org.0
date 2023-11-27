Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C37FAC33
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDB810E314;
	Mon, 27 Nov 2023 21:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BB910E310
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:04:37 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1f9efd5303cso2453093fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119076; x=1701723876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G1HOH/Dg6HzuthSlwGOB4YTT8dmv7GPtwcvmU7YNNK8=;
 b=hpsKlTf7HzHtDciNk8br55lPZRK57myWufQpyN46dbLa0JNJVCEPQG+XSgR2N5hU8N
 9l4KhQvYFjUqR/JSknQCKp2g+a+c1X2QYwQ1Htmp3hwrK1LOvlBPls83BoHTwOyZwIie
 brhMNiEXAbZYO81RLIQS+0KymsXVdirIjrMluhE1/26/jt437yN7W/vSRi4diVG+PECM
 XQume9ATqVRYhpq0ELsEFf4dRtki8vKnvzeK4/YhG49Is5MchMZjlygWhlmTBW8yf9PW
 My6QEWliYhC2fY9p5r3TzOHHBcHxdZvbfgIzIJWuWeoemO5sRu1w5uZmVfQ9PrW6HPh/
 slOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119076; x=1701723876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G1HOH/Dg6HzuthSlwGOB4YTT8dmv7GPtwcvmU7YNNK8=;
 b=av1MnpijOzVS/zp6EbY/vYo7bkDKluJhuY7SEt+oBMGTOlRqd0nwlYyRcBzr6FSng0
 ADUsQGHcSMc5cor9E8mH5MzqbP7f7T3D7WuGTIFkMS6jxgQXhYJXrSvIuomKl+stkrTf
 M1Tn+WYrIJvTXyjUWlRyHeLvo+4E3maSLgtcKY4gmxigOd/Y+7mpHxfVsXwG3vqOSCWT
 fGQBH3va+BmjVrZWvR25/YTlSKnqLLtvzgQxas7D1VR3y4Lp1WA3AfFbR17etYd52QXH
 i4RUTw8J5uIu3IXkeY1zvB4C/2CW/rVgy/eXsGpH9cC7QjK81+HyZ6Y/EzeEaOjMl1+g
 kxFw==
X-Gm-Message-State: AOJu0YzMS0adtkVrvw1cdAicGPw1MLQ0O4AevTri8YnJE/uYoNW6x6KT
 oQHH5Zqht99PORQEX67RULp+iSR7QI7jcaGBOa4=
X-Google-Smtp-Source: AGHT+IFJHpLIg2bs4DSHKIF19mAMIEJnDujEDqgb1e49uq4NaA8/X03jSAdynFeg0j9YXEedfra3d+2suRmMNwXMuCc=
X-Received: by 2002:a05:6870:392b:b0:1f9:5e26:9509 with SMTP id
 b43-20020a056870392b00b001f95e269509mr14714082oap.22.1701119076025; Mon, 27
 Nov 2023 13:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-9-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-9-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:04:25 -0500
Message-ID: <CADnq5_Msgv+gqpmuvAQnaBhogzcqimved7DnL9jfk+w1kc47kw@mail.gmail.com>
Subject: Re: [PATCH 08/14] drm: Remove entry points for legacy ioctls
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> DRM drivers with user-space mode setting have been removed in Linux
> v6.3. [1] Now remove the ioctl entry points for these drivers. Invoking
> any of the ioctl ops will unconditionally return -EINVAL to user space.
> This has already been the behavior for kernels without CONFIG_DRM_LEGACY
> set.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/111602/ # [1]

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_ioc32.c | 610 ------------------------------------
>  drivers/gpu/drm/drm_ioctl.c |  57 ----
>  2 files changed, 667 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index c0163cb076ad8..910cadf14756e 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -37,7 +37,6 @@
>
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> -#include "drm_legacy.h"
>
>  #define DRM_IOCTL_VERSION32            DRM_IOWR(0x00, drm_version32_t)
>  #define DRM_IOCTL_GET_UNIQUE32         DRM_IOWR(0x01, drm_unique32_t)
> @@ -164,92 +163,6 @@ static int compat_drm_setunique(struct file *file, u=
nsigned int cmd,
>         return -EINVAL;
>  }
>
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -typedef struct drm_map32 {
> -       u32 offset;             /* Requested physical address (0 for SARE=
A) */
> -       u32 size;               /* Requested physical size (bytes) */
> -       enum drm_map_type type; /* Type of memory to map */
> -       enum drm_map_flags flags;       /* Flags */
> -       u32 handle;             /* User-space: "Handle" to pass to mmap()=
 */
> -       int mtrr;               /* MTRR slot used */
> -} drm_map32_t;
> -
> -static int compat_drm_getmap(struct file *file, unsigned int cmd,
> -                            unsigned long arg)
> -{
> -       drm_map32_t __user *argp =3D (void __user *)arg;
> -       drm_map32_t m32;
> -       struct drm_map map;
> -       int err;
> -
> -       if (copy_from_user(&m32, argp, sizeof(m32)))
> -               return -EFAULT;
> -
> -       map.offset =3D m32.offset;
> -       err =3D drm_ioctl_kernel(file, drm_legacy_getmap_ioctl, &map, 0);
> -       if (err)
> -               return err;
> -
> -       m32.offset =3D map.offset;
> -       m32.size =3D map.size;
> -       m32.type =3D map.type;
> -       m32.flags =3D map.flags;
> -       m32.handle =3D ptr_to_compat((void __user *)map.handle);
> -       m32.mtrr =3D map.mtrr;
> -       if (copy_to_user(argp, &m32, sizeof(m32)))
> -               return -EFAULT;
> -       return 0;
> -
> -}
> -
> -static int compat_drm_addmap(struct file *file, unsigned int cmd,
> -                            unsigned long arg)
> -{
> -       drm_map32_t __user *argp =3D (void __user *)arg;
> -       drm_map32_t m32;
> -       struct drm_map map;
> -       int err;
> -
> -       if (copy_from_user(&m32, argp, sizeof(m32)))
> -               return -EFAULT;
> -
> -       map.offset =3D m32.offset;
> -       map.size =3D m32.size;
> -       map.type =3D m32.type;
> -       map.flags =3D m32.flags;
> -
> -       err =3D drm_ioctl_kernel(file, drm_legacy_addmap_ioctl, &map,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -       if (err)
> -               return err;
> -
> -       m32.offset =3D map.offset;
> -       m32.mtrr =3D map.mtrr;
> -       m32.handle =3D ptr_to_compat((void __user *)map.handle);
> -       if (map.handle !=3D compat_ptr(m32.handle))
> -               pr_err_ratelimited("compat_drm_addmap truncated handle %p=
 for type %d offset %x\n",
> -                                  map.handle, m32.type, m32.offset);
> -
> -       if (copy_to_user(argp, &m32, sizeof(m32)))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -static int compat_drm_rmmap(struct file *file, unsigned int cmd,
> -                           unsigned long arg)
> -{
> -       drm_map32_t __user *argp =3D (void __user *)arg;
> -       struct drm_map map;
> -       u32 handle;
> -
> -       if (get_user(handle, &argp->handle))
> -               return -EFAULT;
> -       map.handle =3D compat_ptr(handle);
> -       return drm_ioctl_kernel(file, drm_legacy_rmmap_ioctl, &map, DRM_A=
UTH);
> -}
> -#endif
> -
>  typedef struct drm_client32 {
>         int idx;        /* Which client desired? */
>         int auth;       /* Is client authenticated? */
> @@ -309,501 +222,6 @@ static int compat_drm_getstats(struct file *file, u=
nsigned int cmd,
>         return 0;
>  }
>
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -typedef struct drm_buf_desc32 {
> -       int count;               /* Number of buffers of this size */
> -       int size;                /* Size in bytes */
> -       int low_mark;            /* Low water mark */
> -       int high_mark;           /* High water mark */
> -       int flags;
> -       u32 agp_start;           /* Start address in the AGP aperture */
> -} drm_buf_desc32_t;
> -
> -static int compat_drm_addbufs(struct file *file, unsigned int cmd,
> -                             unsigned long arg)
> -{
> -       drm_buf_desc32_t __user *argp =3D (void __user *)arg;
> -       drm_buf_desc32_t desc32;
> -       struct drm_buf_desc desc;
> -       int err;
> -
> -       if (copy_from_user(&desc32, argp, sizeof(drm_buf_desc32_t)))
> -               return -EFAULT;
> -
> -       desc =3D (struct drm_buf_desc){
> -               desc32.count, desc32.size, desc32.low_mark, desc32.high_m=
ark,
> -               desc32.flags, desc32.agp_start
> -       };
> -
> -       err =3D drm_ioctl_kernel(file, drm_legacy_addbufs, &desc,
> -                                  DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -       if (err)
> -               return err;
> -
> -       desc32 =3D (drm_buf_desc32_t){
> -               desc.count, desc.size, desc.low_mark, desc.high_mark,
> -               desc.flags, desc.agp_start
> -       };
> -       if (copy_to_user(argp, &desc32, sizeof(drm_buf_desc32_t)))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -static int compat_drm_markbufs(struct file *file, unsigned int cmd,
> -                              unsigned long arg)
> -{
> -       drm_buf_desc32_t b32;
> -       drm_buf_desc32_t __user *argp =3D (void __user *)arg;
> -       struct drm_buf_desc buf;
> -
> -       if (copy_from_user(&b32, argp, sizeof(b32)))
> -               return -EFAULT;
> -
> -       buf.size =3D b32.size;
> -       buf.low_mark =3D b32.low_mark;
> -       buf.high_mark =3D b32.high_mark;
> -
> -       return drm_ioctl_kernel(file, drm_legacy_markbufs, &buf,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -}
> -
> -typedef struct drm_buf_info32 {
> -       int count;              /**< Entries in list */
> -       u32 list;
> -} drm_buf_info32_t;
> -
> -static int copy_one_buf32(void *data, int count, struct drm_buf_entry *f=
rom)
> -{
> -       drm_buf_info32_t *request =3D data;
> -       drm_buf_desc32_t __user *to =3D compat_ptr(request->list);
> -       drm_buf_desc32_t v =3D {.count =3D from->buf_count,
> -                             .size =3D from->buf_size,
> -                             .low_mark =3D from->low_mark,
> -                             .high_mark =3D from->high_mark};
> -
> -       if (copy_to_user(to + count, &v, offsetof(drm_buf_desc32_t, flags=
)))
> -               return -EFAULT;
> -       return 0;
> -}
> -
> -static int drm_legacy_infobufs32(struct drm_device *dev, void *data,
> -                       struct drm_file *file_priv)
> -{
> -       drm_buf_info32_t *request =3D data;
> -
> -       return __drm_legacy_infobufs(dev, data, &request->count, copy_one=
_buf32);
> -}
> -
> -static int compat_drm_infobufs(struct file *file, unsigned int cmd,
> -                              unsigned long arg)
> -{
> -       drm_buf_info32_t req32;
> -       drm_buf_info32_t __user *argp =3D (void __user *)arg;
> -       int err;
> -
> -       if (copy_from_user(&req32, argp, sizeof(req32)))
> -               return -EFAULT;
> -
> -       if (req32.count < 0)
> -               req32.count =3D 0;
> -
> -       err =3D drm_ioctl_kernel(file, drm_legacy_infobufs32, &req32, DRM=
_AUTH);
> -       if (err)
> -               return err;
> -
> -       if (put_user(req32.count, &argp->count))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -typedef struct drm_buf_pub32 {
> -       int idx;                /**< Index into the master buffer list */
> -       int total;              /**< Buffer size */
> -       int used;               /**< Amount of buffer in use (for DMA) */
> -       u32 address;            /**< Address of buffer */
> -} drm_buf_pub32_t;
> -
> -typedef struct drm_buf_map32 {
> -       int count;              /**< Length of the buffer list */
> -       u32 virtual;            /**< Mmap'd area in user-virtual */
> -       u32 list;               /**< Buffer information */
> -} drm_buf_map32_t;
> -
> -static int map_one_buf32(void *data, int idx, unsigned long virtual,
> -                       struct drm_buf *buf)
> -{
> -       drm_buf_map32_t *request =3D data;
> -       drm_buf_pub32_t __user *to =3D compat_ptr(request->list) + idx;
> -       drm_buf_pub32_t v;
> -
> -       v.idx =3D buf->idx;
> -       v.total =3D buf->total;
> -       v.used =3D 0;
> -       v.address =3D virtual + buf->offset;
> -       if (copy_to_user(to, &v, sizeof(v)))
> -               return -EFAULT;
> -       return 0;
> -}
> -
> -static int drm_legacy_mapbufs32(struct drm_device *dev, void *data,
> -                      struct drm_file *file_priv)
> -{
> -       drm_buf_map32_t *request =3D data;
> -       void __user *v;
> -       int err =3D __drm_legacy_mapbufs(dev, data, &request->count,
> -                                   &v, map_one_buf32,
> -                                   file_priv);
> -       request->virtual =3D ptr_to_compat(v);
> -       return err;
> -}
> -
> -static int compat_drm_mapbufs(struct file *file, unsigned int cmd,
> -                             unsigned long arg)
> -{
> -       drm_buf_map32_t __user *argp =3D (void __user *)arg;
> -       drm_buf_map32_t req32;
> -       int err;
> -
> -       if (copy_from_user(&req32, argp, sizeof(req32)))
> -               return -EFAULT;
> -       if (req32.count < 0)
> -               return -EINVAL;
> -
> -       err =3D drm_ioctl_kernel(file, drm_legacy_mapbufs32, &req32, DRM_=
AUTH);
> -       if (err)
> -               return err;
> -
> -       if (put_user(req32.count, &argp->count)
> -           || put_user(req32.virtual, &argp->virtual))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -typedef struct drm_buf_free32 {
> -       int count;
> -       u32 list;
> -} drm_buf_free32_t;
> -
> -static int compat_drm_freebufs(struct file *file, unsigned int cmd,
> -                              unsigned long arg)
> -{
> -       drm_buf_free32_t req32;
> -       struct drm_buf_free request;
> -       drm_buf_free32_t __user *argp =3D (void __user *)arg;
> -
> -       if (copy_from_user(&req32, argp, sizeof(req32)))
> -               return -EFAULT;
> -
> -       request.count =3D req32.count;
> -       request.list =3D compat_ptr(req32.list);
> -       return drm_ioctl_kernel(file, drm_legacy_freebufs, &request, DRM_=
AUTH);
> -}
> -
> -typedef struct drm_ctx_priv_map32 {
> -       unsigned int ctx_id;     /**< Context requesting private mapping =
*/
> -       u32 handle;             /**< Handle of map */
> -} drm_ctx_priv_map32_t;
> -
> -static int compat_drm_setsareactx(struct file *file, unsigned int cmd,
> -                                 unsigned long arg)
> -{
> -       drm_ctx_priv_map32_t req32;
> -       struct drm_ctx_priv_map request;
> -       drm_ctx_priv_map32_t __user *argp =3D (void __user *)arg;
> -
> -       if (copy_from_user(&req32, argp, sizeof(req32)))
> -               return -EFAULT;
> -
> -       request.ctx_id =3D req32.ctx_id;
> -       request.handle =3D compat_ptr(req32.handle);
> -       return drm_ioctl_kernel(file, drm_legacy_setsareactx, &request,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -}
> -
> -static int compat_drm_getsareactx(struct file *file, unsigned int cmd,
> -                                 unsigned long arg)
> -{
> -       struct drm_ctx_priv_map req;
> -       drm_ctx_priv_map32_t req32;
> -       drm_ctx_priv_map32_t __user *argp =3D (void __user *)arg;
> -       int err;
> -
> -       if (copy_from_user(&req32, argp, sizeof(req32)))
> -               return -EFAULT;
> -
> -       req.ctx_id =3D req32.ctx_id;
> -       err =3D drm_ioctl_kernel(file, drm_legacy_getsareactx, &req, DRM_=
AUTH);
> -       if (err)
> -               return err;
> -
> -       req32.handle =3D ptr_to_compat((void __user *)req.handle);
> -       if (copy_to_user(argp, &req32, sizeof(req32)))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -typedef struct drm_ctx_res32 {
> -       int count;
> -       u32 contexts;
> -} drm_ctx_res32_t;
> -
> -static int compat_drm_resctx(struct file *file, unsigned int cmd,
> -                            unsigned long arg)
> -{
> -       drm_ctx_res32_t __user *argp =3D (void __user *)arg;
> -       drm_ctx_res32_t res32;
> -       struct drm_ctx_res res;
> -       int err;
> -
> -       if (copy_from_user(&res32, argp, sizeof(res32)))
> -               return -EFAULT;
> -
> -       res.count =3D res32.count;
> -       res.contexts =3D compat_ptr(res32.contexts);
> -       err =3D drm_ioctl_kernel(file, drm_legacy_resctx, &res, DRM_AUTH)=
;
> -       if (err)
> -               return err;
> -
> -       res32.count =3D res.count;
> -       if (copy_to_user(argp, &res32, sizeof(res32)))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -typedef struct drm_dma32 {
> -       int context;              /**< Context handle */
> -       int send_count;           /**< Number of buffers to send */
> -       u32 send_indices;         /**< List of handles to buffers */
> -       u32 send_sizes;           /**< Lengths of data to send */
> -       enum drm_dma_flags flags;                 /**< Flags */
> -       int request_count;        /**< Number of buffers requested */
> -       int request_size;         /**< Desired size for buffers */
> -       u32 request_indices;      /**< Buffer information */
> -       u32 request_sizes;
> -       int granted_count;        /**< Number of buffers granted */
> -} drm_dma32_t;
> -
> -static int compat_drm_dma(struct file *file, unsigned int cmd,
> -                         unsigned long arg)
> -{
> -       drm_dma32_t d32;
> -       drm_dma32_t __user *argp =3D (void __user *)arg;
> -       struct drm_dma d;
> -       int err;
> -
> -       if (copy_from_user(&d32, argp, sizeof(d32)))
> -               return -EFAULT;
> -
> -       d.context =3D d32.context;
> -       d.send_count =3D d32.send_count;
> -       d.send_indices =3D compat_ptr(d32.send_indices);
> -       d.send_sizes =3D compat_ptr(d32.send_sizes);
> -       d.flags =3D d32.flags;
> -       d.request_count =3D d32.request_count;
> -       d.request_indices =3D compat_ptr(d32.request_indices);
> -       d.request_sizes =3D compat_ptr(d32.request_sizes);
> -       err =3D drm_ioctl_kernel(file, drm_legacy_dma_ioctl, &d, DRM_AUTH=
);
> -       if (err)
> -               return err;
> -
> -       if (put_user(d.request_size, &argp->request_size)
> -           || put_user(d.granted_count, &argp->granted_count))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -#endif
> -
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -#if IS_ENABLED(CONFIG_AGP)
> -typedef struct drm_agp_mode32 {
> -       u32 mode;       /**< AGP mode */
> -} drm_agp_mode32_t;
> -
> -static int compat_drm_agp_enable(struct file *file, unsigned int cmd,
> -                                unsigned long arg)
> -{
> -       drm_agp_mode32_t __user *argp =3D (void __user *)arg;
> -       struct drm_agp_mode mode;
> -
> -       if (get_user(mode.mode, &argp->mode))
> -               return -EFAULT;
> -
> -       return drm_ioctl_kernel(file,  drm_legacy_agp_enable_ioctl, &mode=
,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -}
> -
> -typedef struct drm_agp_info32 {
> -       int agp_version_major;
> -       int agp_version_minor;
> -       u32 mode;
> -       u32 aperture_base;      /* physical address */
> -       u32 aperture_size;      /* bytes */
> -       u32 memory_allowed;     /* bytes */
> -       u32 memory_used;
> -
> -       /* PCI information */
> -       unsigned short id_vendor;
> -       unsigned short id_device;
> -} drm_agp_info32_t;
> -
> -static int compat_drm_agp_info(struct file *file, unsigned int cmd,
> -                              unsigned long arg)
> -{
> -       drm_agp_info32_t __user *argp =3D (void __user *)arg;
> -       drm_agp_info32_t i32;
> -       struct drm_agp_info info;
> -       int err;
> -
> -       err =3D drm_ioctl_kernel(file, drm_legacy_agp_info_ioctl, &info, =
DRM_AUTH);
> -       if (err)
> -               return err;
> -
> -       i32.agp_version_major =3D info.agp_version_major;
> -       i32.agp_version_minor =3D info.agp_version_minor;
> -       i32.mode =3D info.mode;
> -       i32.aperture_base =3D info.aperture_base;
> -       i32.aperture_size =3D info.aperture_size;
> -       i32.memory_allowed =3D info.memory_allowed;
> -       i32.memory_used =3D info.memory_used;
> -       i32.id_vendor =3D info.id_vendor;
> -       i32.id_device =3D info.id_device;
> -       if (copy_to_user(argp, &i32, sizeof(i32)))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -typedef struct drm_agp_buffer32 {
> -       u32 size;       /**< In bytes -- will round to page boundary */
> -       u32 handle;     /**< Used for binding / unbinding */
> -       u32 type;       /**< Type of memory to allocate */
> -       u32 physical;   /**< Physical used by i810 */
> -} drm_agp_buffer32_t;
> -
> -static int compat_drm_agp_alloc(struct file *file, unsigned int cmd,
> -                               unsigned long arg)
> -{
> -       drm_agp_buffer32_t __user *argp =3D (void __user *)arg;
> -       drm_agp_buffer32_t req32;
> -       struct drm_agp_buffer request;
> -       int err;
> -
> -       if (copy_from_user(&req32, argp, sizeof(req32)))
> -               return -EFAULT;
> -
> -       request.size =3D req32.size;
> -       request.type =3D req32.type;
> -       err =3D drm_ioctl_kernel(file, drm_legacy_agp_alloc_ioctl, &reque=
st,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -       if (err)
> -               return err;
> -
> -       req32.handle =3D request.handle;
> -       req32.physical =3D request.physical;
> -       if (copy_to_user(argp, &req32, sizeof(req32))) {
> -               drm_ioctl_kernel(file, drm_legacy_agp_free_ioctl, &reques=
t,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -               return -EFAULT;
> -       }
> -
> -       return 0;
> -}
> -
> -static int compat_drm_agp_free(struct file *file, unsigned int cmd,
> -                              unsigned long arg)
> -{
> -       drm_agp_buffer32_t __user *argp =3D (void __user *)arg;
> -       struct drm_agp_buffer request;
> -
> -       if (get_user(request.handle, &argp->handle))
> -               return -EFAULT;
> -
> -       return drm_ioctl_kernel(file, drm_legacy_agp_free_ioctl, &request=
,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -}
> -
> -typedef struct drm_agp_binding32 {
> -       u32 handle;     /**< From drm_agp_buffer */
> -       u32 offset;     /**< In bytes -- will round to page boundary */
> -} drm_agp_binding32_t;
> -
> -static int compat_drm_agp_bind(struct file *file, unsigned int cmd,
> -                              unsigned long arg)
> -{
> -       drm_agp_binding32_t __user *argp =3D (void __user *)arg;
> -       drm_agp_binding32_t req32;
> -       struct drm_agp_binding request;
> -
> -       if (copy_from_user(&req32, argp, sizeof(req32)))
> -               return -EFAULT;
> -
> -       request.handle =3D req32.handle;
> -       request.offset =3D req32.offset;
> -       return drm_ioctl_kernel(file, drm_legacy_agp_bind_ioctl, &request=
,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -}
> -
> -static int compat_drm_agp_unbind(struct file *file, unsigned int cmd,
> -                                unsigned long arg)
> -{
> -       drm_agp_binding32_t __user *argp =3D (void __user *)arg;
> -       struct drm_agp_binding request;
> -
> -       if (get_user(request.handle, &argp->handle))
> -               return -EFAULT;
> -
> -       return drm_ioctl_kernel(file, drm_legacy_agp_unbind_ioctl, &reque=
st,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -}
> -#endif /* CONFIG_AGP */
> -
> -typedef struct drm_scatter_gather32 {
> -       u32 size;       /**< In bytes -- will round to page boundary */
> -       u32 handle;     /**< Used for mapping / unmapping */
> -} drm_scatter_gather32_t;
> -
> -static int compat_drm_sg_alloc(struct file *file, unsigned int cmd,
> -                              unsigned long arg)
> -{
> -       drm_scatter_gather32_t __user *argp =3D (void __user *)arg;
> -       struct drm_scatter_gather request;
> -       int err;
> -
> -       if (get_user(request.size, &argp->size))
> -               return -EFAULT;
> -
> -       err =3D drm_ioctl_kernel(file, drm_legacy_sg_alloc, &request,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -       if (err)
> -               return err;
> -
> -       /* XXX not sure about the handle conversion here... */
> -       if (put_user(request.handle >> PAGE_SHIFT, &argp->handle))
> -               return -EFAULT;
> -
> -       return 0;
> -}
> -
> -static int compat_drm_sg_free(struct file *file, unsigned int cmd,
> -                             unsigned long arg)
> -{
> -       drm_scatter_gather32_t __user *argp =3D (void __user *)arg;
> -       struct drm_scatter_gather request;
> -       unsigned long x;
> -
> -       if (get_user(x, &argp->handle))
> -               return -EFAULT;
> -       request.handle =3D x << PAGE_SHIFT;
> -       return drm_ioctl_kernel(file, drm_legacy_sg_free, &request,
> -                               DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> -}
> -#endif
>  #if defined(CONFIG_X86)
>  typedef struct drm_update_draw32 {
>         drm_drawable_t handle;
> @@ -915,37 +333,9 @@ static struct {
>  #define DRM_IOCTL32_DEF(n, f) [DRM_IOCTL_NR(n##32)] =3D {.fn =3D f, .nam=
e =3D #n}
>         DRM_IOCTL32_DEF(DRM_IOCTL_VERSION, compat_drm_version),
>         DRM_IOCTL32_DEF(DRM_IOCTL_GET_UNIQUE, compat_drm_getunique),
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -       DRM_IOCTL32_DEF(DRM_IOCTL_GET_MAP, compat_drm_getmap),
> -#endif
>         DRM_IOCTL32_DEF(DRM_IOCTL_GET_CLIENT, compat_drm_getclient),
>         DRM_IOCTL32_DEF(DRM_IOCTL_GET_STATS, compat_drm_getstats),
>         DRM_IOCTL32_DEF(DRM_IOCTL_SET_UNIQUE, compat_drm_setunique),
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -       DRM_IOCTL32_DEF(DRM_IOCTL_ADD_MAP, compat_drm_addmap),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_ADD_BUFS, compat_drm_addbufs),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_MARK_BUFS, compat_drm_markbufs),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_INFO_BUFS, compat_drm_infobufs),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_MAP_BUFS, compat_drm_mapbufs),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_FREE_BUFS, compat_drm_freebufs),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_RM_MAP, compat_drm_rmmap),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_SET_SAREA_CTX, compat_drm_setsareactx),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_GET_SAREA_CTX, compat_drm_getsareactx),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_RES_CTX, compat_drm_resctx),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_DMA, compat_drm_dma),
> -#if IS_ENABLED(CONFIG_AGP)
> -       DRM_IOCTL32_DEF(DRM_IOCTL_AGP_ENABLE, compat_drm_agp_enable),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_AGP_INFO, compat_drm_agp_info),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_AGP_ALLOC, compat_drm_agp_alloc),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_AGP_FREE, compat_drm_agp_free),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_AGP_BIND, compat_drm_agp_bind),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_AGP_UNBIND, compat_drm_agp_unbind),
> -#endif
> -#endif
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -       DRM_IOCTL32_DEF(DRM_IOCTL_SG_ALLOC, compat_drm_sg_alloc),
> -       DRM_IOCTL32_DEF(DRM_IOCTL_SG_FREE, compat_drm_sg_free),
> -#endif
>  #if defined(CONFIG_X86)
>         DRM_IOCTL32_DEF(DRM_IOCTL_UPDATE_DRAW, compat_drm_update_draw),
>  #endif
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 44fda68c28aeb..e6c32f76c7452 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -42,7 +42,6 @@
>
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> -#include "drm_legacy.h"
>
>  /**
>   * DOC: getunique and setversion story
> @@ -559,21 +558,11 @@ static int drm_ioctl_permit(u32 flags, struct drm_f=
ile *file_priv)
>                 .name =3D #ioctl                  \
>         }
>
> -#if IS_ENABLED(CONFIG_DRM_LEGACY)
> -#define DRM_LEGACY_IOCTL_DEF(ioctl, _func, _flags)  DRM_IOCTL_DEF(ioctl,=
 _func, _flags)
> -#else
> -#define DRM_LEGACY_IOCTL_DEF(ioctl, _func, _flags) DRM_IOCTL_DEF(ioctl, =
drm_invalid_op, _flags)
> -#endif
> -
>  /* Ioctl table */
>  static const struct drm_ioctl_desc drm_ioctls[] =3D {
>         DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
>         DRM_IOCTL_DEF(DRM_IOCTL_GET_MAGIC, drm_getmagic, 0),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid=
,
> -                            DRM_MASTER|DRM_ROOT_ONLY),
> -
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_MAP, drm_legacy_getmap_ioctl, =
0),
>
>         DRM_IOCTL_DEF(DRM_IOCTL_GET_CLIENT, drm_getclient, 0),
>         DRM_IOCTL_DEF(DRM_IOCTL_GET_STATS, drm_getstats, 0),
> @@ -586,60 +575,14 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D=
 {
>         DRM_IOCTL_DEF(DRM_IOCTL_UNBLOCK, drm_noop, DRM_AUTH|DRM_MASTER|DR=
M_ROOT_ONLY),
>         DRM_IOCTL_DEF(DRM_IOCTL_AUTH_MAGIC, drm_authmagic, DRM_MASTER),
>
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_MAP, drm_legacy_addmap_ioctl, =
DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_MAP, drm_legacy_rmmap_ioctl, DR=
M_AUTH),
> -
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsarea=
ctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsarea=
ctx, DRM_AUTH),
> -
>         DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
>         DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
>
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AU=
TH|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH=
|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_MOD_CTX, drm_noop, DRM_AUTH|DRM_MA=
STER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_CTX, drm_legacy_getctx, DRM_AU=
TH),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SWITCH_CTX, drm_legacy_switchctx, =
DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_NEW_CTX, drm_legacy_newctx, DRM_AU=
TH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RES_CTX, drm_legacy_resctx, DRM_AU=
TH),
> -
>         DRM_IOCTL_DEF(DRM_IOCTL_ADD_DRAW, drm_noop, DRM_AUTH|DRM_MASTER|D=
RM_ROOT_ONLY),
>         DRM_IOCTL_DEF(DRM_IOCTL_RM_DRAW, drm_noop, DRM_AUTH|DRM_MASTER|DR=
M_ROOT_ONLY),
>
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_LOCK, drm_legacy_lock, DRM_AUTH),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_UNLOCK, drm_legacy_unlock, DRM_AUT=
H),
> -
>         DRM_IOCTL_DEF(DRM_IOCTL_FINISH, drm_noop, DRM_AUTH),
>
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_BUFS, drm_legacy_addbufs, DRM_=
AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_MARK_BUFS, drm_legacy_markbufs, DR=
M_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_INFO_BUFS, drm_legacy_infobufs, DR=
M_AUTH),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_MAP_BUFS, drm_legacy_mapbufs, DRM_=
AUTH),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_FREE_BUFS, drm_legacy_freebufs, DR=
M_AUTH),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_DMA, drm_legacy_dma_ioctl, DRM_AUT=
H),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_CONTROL, drm_legacy_irq_control, D=
RM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -
> -#if IS_ENABLED(CONFIG_AGP)
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ACQUIRE, drm_legacy_agp_acquir=
e_ioctl,
> -                            DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_RELEASE, drm_legacy_agp_releas=
e_ioctl,
> -                            DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ENABLE, drm_legacy_agp_enable_=
ioctl,
> -                            DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_INFO, drm_legacy_agp_info_ioct=
l, DRM_AUTH),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ALLOC, drm_legacy_agp_alloc_io=
ctl,
> -                            DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_FREE, drm_legacy_agp_free_ioct=
l,
> -                            DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_BIND, drm_legacy_agp_bind_ioct=
l,
> -                            DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_UNBIND, drm_legacy_agp_unbind_=
ioctl,
> -                            DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -#endif
> -
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SG_ALLOC, drm_legacy_sg_alloc, DRM=
_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SG_FREE, drm_legacy_sg_free, DRM_A=
UTH|DRM_MASTER|DRM_ROOT_ONLY),
> -
>         DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_wait_vblank_ioctl, DRM_U=
NLOCKED),
>
>         DRM_IOCTL_DEF(DRM_IOCTL_MODESET_CTL, drm_legacy_modeset_ctl_ioctl=
, 0),
> --
> 2.42.1
>

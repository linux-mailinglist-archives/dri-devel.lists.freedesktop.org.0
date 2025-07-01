Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C853AEED34
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 06:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187C710E4E9;
	Tue,  1 Jul 2025 04:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="YrHUnGoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5184710E261
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 04:18:51 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e81a7d90835so2173511276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 21:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1751343530; x=1751948330;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wk7zvGKhkV+yx3zdpTOdsSzHywTfuVcrCmHhaLvCWro=;
 b=YrHUnGojX8QgZfJn8rdf4Rmem5SGQ08H055H1VecrHKiDRLd/N78wyuJimiQcwioi9
 7LmCk7UAac3d+BRFPtQzxOZpIcIMUtX+OeFdtfaTG5jN3qDo71N8Gf2u26Bw2daLFtPA
 iySerz8OzmndwbHKIw+Q3tf+myAcqTHN6S1PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751343530; x=1751948330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wk7zvGKhkV+yx3zdpTOdsSzHywTfuVcrCmHhaLvCWro=;
 b=UC9BFeyw0lXRjQ3n7SBTDLqMW7ZOTnhpchP6uWYdxKHY8GFRKb/NQTYWAi4a+kgasZ
 29SdC6TqMPnknsH6xUchXST00lca6f0u5nYu9O3zb+i8qDJkMSc0/fibyQust1uRqE+V
 GQ6B+j0NpJFdgrwKtPMqcfrt7hEamchwIFYmDc3+IicFlXokkX5QE0S7H2gKefd534VG
 tkM1+p2JKtBCWH+1hvrywJWAeMhvrRfX3M7ZIKabDYJs/8rSV5jeAhDHWpQ6ZemMgOGa
 fwsf92qxcmo7k7+3NzQryedvosrk4ryfc/V965qpo5l0dK43phHOoTtefVUCUneu6io4
 2bug==
X-Gm-Message-State: AOJu0Yx/53nh1AXgnrS+Eu64ah9FriA7fPOCjyD/TsqYpYzD3fUMUP03
 hVM7BDUCd+tVrD/NChXgF9xX0SjrBxqUJI0Uh26NhFf7ct0N046tRjrGpytKuDRNNLv5DKGCFKJ
 0uHaO4asOsvoOx3OAuMnKFzmW5Z7bhOJKJ6YWXsDP
X-Gm-Gg: ASbGncv2Mxn1ZLeHXNmM3IUr/+79wxRi/IGAq8wTdPYYR+53IQ6x+DU1CsbS6Itlhhw
 1xb3HI2ZFLnkdO/X3Wij/M32qsDIIQhS/1NyZHE0r7UK0JWb/UPuregTQ1/QYfNu05JEs7wDBsd
 01jl4W1bFcx3agdHSnVfKAOtzMu1d0zUVPYz6dbOxCdMD/
X-Google-Smtp-Source: AGHT+IHclwwz5ShAm9csYDiReyxt5XKCWlVHE7Z3j2JA96jeDC0galyfLSD3GYHrTvP61dRob/4o62yuO5li0qWOxU4=
X-Received: by 2002:a05:6902:168b:b0:e87:c868:42f2 with SMTP id
 3f1490d57ef6-e87c8684665mr10224546276.6.1751343530009; Mon, 30 Jun 2025
 21:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250626201153.1714590-1-ian.forbes@broadcom.com>
 <20250626201153.1714590-2-ian.forbes@broadcom.com>
In-Reply-To: <20250626201153.1714590-2-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 1 Jul 2025 00:18:38 -0400
X-Gm-Features: Ac12FXxKRjsZn79X3R8VgMnfEvWeqTud5HLnwr-yjwDrhflEboC1V5dqYJCUaKM
Message-ID: <CABQX2QPfS_U9gA5ZNkfQWx==gQFqX4q5GZrOtS3uEPUZh0FeRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vmwgfx: Implement DRIVER_SYNCOBJ
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000003491c0638d6715d"
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

--00000000000003491c0638d6715d
Content-Type: multipart/alternative; boundary="000000000000fcc9eb0638d67057"

--000000000000fcc9eb0638d67057
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 4:12=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:

> Replace vmwgfx's ad hoc userspace fence tracking with drm_syncobj.
> They are nearly identical and it is possible to maintain compatibility
> with the old IOCTLs.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |   3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 230 ++++++------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.h   |   3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     |   2 +-
>  6 files changed, 67 insertions(+), 183 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index bc0342c58b4b..33e5e90ce63d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1582,7 +1582,8 @@ static const struct file_operations
> vmwgfx_driver_fops =3D {
>
>  static const struct drm_driver driver =3D {
>         .driver_features =3D
> -       DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM |
> DRIVER_CURSOR_HOTSPOT,
> +       DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC |
> +       DRIVER_GEM | DRIVER_CURSOR_HOTSPOT | DRIVER_SYNCOBJ,
>         .ioctls =3D vmw_ioctls,
>         .num_ioctls =3D ARRAY_SIZE(vmw_ioctls),
>         .master_set =3D vmw_master_set,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index eda5b6f8f4c4..6df5f66aecf7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -983,7 +983,7 @@ extern int vmw_execbuf_fence_commands(struct drm_file
> *file_priv,
>                                       struct vmw_fence_obj **p_fence,
>                                       uint32_t *p_handle);
>  extern int vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
> -                                       struct vmw_fpriv *vmw_fp,
> +                                       struct drm_file *,
>                                         int ret,
>                                         struct drm_vmw_fence_rep __user
>                                         *user_fence_rep,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 819704ac675d..f83c35861bf7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -14,6 +14,7 @@
>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_placement.h>
> +#include <drm/drm_syncobj.h>
>
>  #include <linux/sync_file.h>
>  #include <linux/hashtable.h>
> @@ -3859,7 +3860,7 @@ int vmw_execbuf_fence_commands(struct drm_file
> *file_priv,
>   */
>  int
>  vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
> -                           struct vmw_fpriv *vmw_fp, int ret,
> +                           struct drm_file *file_priv, int ret,
>                             struct drm_vmw_fence_rep __user
> *user_fence_rep,
>                             struct vmw_fence_obj *fence, uint32_t
> fence_handle,
>                             int32_t out_fence_fd)
> @@ -3894,7 +3895,7 @@ vmw_execbuf_copy_fence_user(struct vmw_private
> *dev_priv,
>          * handle.
>          */
>         if (unlikely(ret !=3D 0) && (fence_rep.error =3D=3D 0)) {
> -               ttm_ref_object_base_unref(vmw_fp->tfile, fence_handle);
> +               drm_syncobj_destroy(file_priv, fence_handle);
>                 VMW_DEBUG_USER("Fence copy error. Syncing.\n");
>                 (void) vmw_fence_obj_wait(fence, false, false,
>                                           VMW_FENCE_WAIT_TIMEOUT);
> @@ -4236,8 +4237,9 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>                 }
>         }
>
> -       ret =3D vmw_execbuf_copy_fence_user(dev_priv, vmw_fpriv(file_priv=
),
> ret,
> -                                   user_fence_rep, fence, handle,
> out_fence_fd);
> +       ret =3D vmw_execbuf_copy_fence_user(dev_priv, file_priv, ret,
> +                                         user_fence_rep, fence, handle,
> +                                         out_fence_fd);
>
>         if (sync_file) {
>                 if (ret) {
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> index c2294abbe753..de81d95268c3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -7,6 +7,7 @@
>
> *************************************************************************=
*/
>
>  #include "vmwgfx_drv.h"
> +#include <drm/drm_syncobj.h>
>
>  #define VMW_FENCE_WRAP (1 << 31)
>
> @@ -18,11 +19,6 @@ struct vmw_fence_manager {
>         u64 ctx;
>  };
>
> -struct vmw_user_fence {
> -       struct ttm_base_object base;
> -       struct vmw_fence_obj fence;
> -};
> -
>  /**
>   * struct vmw_event_fence_action - fence callback that delivers a DRM
> event.
>   *
> @@ -74,7 +70,7 @@ static void vmw_fence_obj_destroy(struct dma_fence *f)
>                         vmw_seqno_waiter_remove(fman->dev_priv);
>                 spin_unlock(&fman->lock);
>         }
> -       fence->destroy(fence);
> +       dma_fence_free(f);
>  }
>
>  static const char *vmw_fence_get_driver_name(struct dma_fence *f)
> @@ -156,14 +152,12 @@ void vmw_fence_manager_takedown(struct
> vmw_fence_manager *fman)
>  }
>
>  static int vmw_fence_obj_init(struct vmw_fence_manager *fman,
> -                             struct vmw_fence_obj *fence, u32 seqno,
> -                             void (*destroy) (struct vmw_fence_obj
> *fence))
> +                             struct vmw_fence_obj *fence, u32 seqno)
>  {
>         int ret =3D 0;
>
>         dma_fence_init(&fence->base, &vmw_fence_ops, &fman->lock,
>                        fman->ctx, seqno);
> -       fence->destroy =3D destroy;
>
>         spin_lock(&fman->lock);
>         if (unlikely(fman->fifo_down)) {
> @@ -239,11 +233,6 @@ int vmw_fence_obj_wait(struct vmw_fence_obj *fence,
> bool lazy,
>                 return ret;
>  }
>
> -static void vmw_fence_destroy(struct vmw_fence_obj *fence)
> -{
> -       dma_fence_free(&fence->base);
> -}
> -
>  int vmw_fence_create(struct vmw_fence_manager *fman,
>                      uint32_t seqno,
>                      struct vmw_fence_obj **p_fence)
> @@ -255,7 +244,7 @@ int vmw_fence_create(struct vmw_fence_manager *fman,
>         if (unlikely(!fence))
>                 return -ENOMEM;
>
> -       ret =3D vmw_fence_obj_init(fman, fence, seqno, vmw_fence_destroy)=
;
> +       ret =3D vmw_fence_obj_init(fman, fence, seqno);
>         if (unlikely(ret !=3D 0))
>                 goto out_err_init;
>
> @@ -267,77 +256,31 @@ int vmw_fence_create(struct vmw_fence_manager *fman=
,
>         return ret;
>  }
>
> -
> -static void vmw_user_fence_destroy(struct vmw_fence_obj *fence)
> -{
> -       struct vmw_user_fence *ufence =3D
> -               container_of(fence, struct vmw_user_fence, fence);
> -
> -       ttm_base_object_kfree(ufence, base);
> -}
> -
> -static void vmw_user_fence_base_release(struct ttm_base_object **p_base)
> -{
> -       struct ttm_base_object *base =3D *p_base;
> -       struct vmw_user_fence *ufence =3D
> -               container_of(base, struct vmw_user_fence, base);
> -       struct vmw_fence_obj *fence =3D &ufence->fence;
> -
> -       *p_base =3D NULL;
> -       vmw_fence_obj_unreference(&fence);
> -}
> -
>  int vmw_user_fence_create(struct drm_file *file_priv,
>                           struct vmw_fence_manager *fman,
>                           uint32_t seqno,
>                           struct vmw_fence_obj **p_fence,
>                           uint32_t *p_handle)
>  {
> -       struct ttm_object_file *tfile =3D vmw_fpriv(file_priv)->tfile;
> -       struct vmw_user_fence *ufence;
> +       struct drm_syncobj *ufence;
>         struct vmw_fence_obj *tmp;
>         int ret;
>
> -       ufence =3D kzalloc(sizeof(*ufence), GFP_KERNEL);
> -       if (unlikely(!ufence)) {
> -               ret =3D -ENOMEM;
> -               goto out_no_object;
> -       }
> -
> -       ret =3D vmw_fence_obj_init(fman, &ufence->fence, seqno,
> -                                vmw_user_fence_destroy);
> -       if (unlikely(ret !=3D 0)) {
> -               kfree(ufence);
> -               goto out_no_object;
> -       }
> -
> -       /*
> -        * The base object holds a reference which is freed in
> -        * vmw_user_fence_base_release.
> -        */
> -       tmp =3D vmw_fence_obj_reference(&ufence->fence);
> -
> -       ret =3D ttm_base_object_init(tfile, &ufence->base, false,
> -                                  VMW_RES_FENCE,
> -                                  &vmw_user_fence_base_release);
> -
> +       ret =3D vmw_fence_create(fman, seqno, &tmp);
> +       if (ret !=3D 0)
> +               return ret;
>
> -       if (unlikely(ret !=3D 0)) {
> -               /*
> -                * Free the base object's reference
> -                */
> +       ret =3D drm_syncobj_create(&ufence, 0, &tmp->base);
> +       if (ret !=3D 0) {
>                 vmw_fence_obj_unreference(&tmp);
> -               goto out_err;
> +               return ret;
>         }
>
> -       *p_fence =3D &ufence->fence;
> -       *p_handle =3D ufence->base.handle;
> -
> -       return 0;
> -out_err:
> -       tmp =3D &ufence->fence;
> -       vmw_fence_obj_unreference(&tmp);
> -out_no_object:
> +       ret =3D drm_syncobj_get_handle(file_priv, ufence, p_handle);
> +       drm_syncobj_put(ufence);
> +       if (ret !=3D 0)
> +               vmw_fence_obj_unreference(&tmp);
> +       *p_fence =3D tmp;
>         return ret;
>  }
>
> @@ -385,51 +328,13 @@ void vmw_fence_fifo_up(struct vmw_fence_manager
> *fman)
>         spin_unlock(&fman->lock);
>  }
>
> -
> -/**
> - * vmw_fence_obj_lookup - Look up a user-space fence object
> - *
> - * @tfile: A struct ttm_object_file identifying the caller.
> - * @handle: A handle identifying the fence object.
> - * @return: A struct vmw_user_fence base ttm object on success or
> - * an error pointer on failure.
> - *
> - * The fence object is looked up and type-checked. The caller needs
> - * to have opened the fence object first, but since that happens on
> - * creation and fence objects aren't shareable, that's not an
> - * issue currently.
> - */
> -static struct ttm_base_object *
> -vmw_fence_obj_lookup(struct ttm_object_file *tfile, u32 handle)
> -{
> -       struct ttm_base_object *base =3D ttm_base_object_lookup(tfile,
> handle);
> -
> -       if (!base) {
> -               pr_err("Invalid fence object handle 0x%08lx.\n",
> -                      (unsigned long)handle);
> -               return ERR_PTR(-EINVAL);
> -       }
> -
> -       if (base->refcount_release !=3D vmw_user_fence_base_release) {
> -               pr_err("Invalid fence object handle 0x%08lx.\n",
> -                      (unsigned long)handle);
> -               ttm_base_object_unref(&base);
> -               return ERR_PTR(-EINVAL);
> -       }
> -
> -       return base;
> -}
> -
> -
>  int vmw_fence_obj_wait_ioctl(struct drm_device *dev, void *data,
>                              struct drm_file *file_priv)
>  {
>         struct drm_vmw_fence_wait_arg *arg =3D
>             (struct drm_vmw_fence_wait_arg *)data;
>         unsigned long timeout;
> -       struct ttm_base_object *base;
>         struct vmw_fence_obj *fence;
> -       struct ttm_object_file *tfile =3D vmw_fpriv(file_priv)->tfile;
>         int ret;
>         uint64_t wait_timeout =3D ((uint64_t)arg->timeout_us * HZ);
>
> @@ -446,11 +351,10 @@ int vmw_fence_obj_wait_ioctl(struct drm_device *dev=
,
> void *data,
>                 arg->kernel_cookie =3D jiffies + wait_timeout;
>         }
>
> -       base =3D vmw_fence_obj_lookup(tfile, arg->handle);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> -
> -       fence =3D &(container_of(base, struct vmw_user_fence, base)->fenc=
e);
> +       ret =3D drm_syncobj_find_fence(file_priv, arg->handle, 0, 0,
> +                                    (struct dma_fence **)&fence);
> +       if (ret !=3D 0)
> +               return ret;
>
>         timeout =3D jiffies;
>         if (time_after_eq(timeout, (unsigned long)arg->kernel_cookie)) {
> @@ -464,14 +368,14 @@ int vmw_fence_obj_wait_ioctl(struct drm_device *dev=
,
> void *data,
>         ret =3D vmw_fence_obj_wait(fence, arg->lazy, true, timeout);
>
>  out:
> -       ttm_base_object_unref(&base);
> +       vmw_fence_obj_unreference(&fence); // from find_fence
>
>         /*
>          * Optionally unref the fence object.
>          */
>
>         if (ret =3D=3D 0 && (arg->wait_options & DRM_VMW_WAIT_OPTION_UNRE=
F))
> -               return ttm_ref_object_base_unref(tfile, arg->handle);
> +               ret =3D drm_syncobj_destroy(file_priv, arg->handle);
>         return ret;
>  }
>
> @@ -480,36 +384,33 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device
> *dev, void *data,
>  {
>         struct drm_vmw_fence_signaled_arg *arg =3D
>                 (struct drm_vmw_fence_signaled_arg *) data;
> -       struct ttm_base_object *base;
>         struct vmw_fence_obj *fence;
> -       struct ttm_object_file *tfile =3D vmw_fpriv(file_priv)->tfile;
>         struct vmw_private *dev_priv =3D vmw_priv(dev);
>
> -       base =3D vmw_fence_obj_lookup(tfile, arg->handle);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> +       int ret =3D drm_syncobj_find_fence(file_priv, arg->handle, 0, 0,
> +                                        (struct dma_fence **)&fence);
> +       if (ret !=3D 0)
> +               return ret;
>
> -       fence =3D &(container_of(base, struct vmw_user_fence, base)->fenc=
e);
>
>         arg->signaled =3D vmw_fence_obj_signaled(fence);
>
>         arg->signaled_flags =3D arg->flags;
>         arg->passed_seqno =3D
> atomic_read_acquire(&dev_priv->last_read_seqno);
>
> -       ttm_base_object_unref(&base);
> +       vmw_fence_obj_unreference(&fence); // from find_fence
>
>         return 0;
>  }
>
>
>  int vmw_fence_obj_unref_ioctl(struct drm_device *dev, void *data,
> -                             struct drm_file *file_priv)
> +                               struct drm_file *file_priv)
>  {
>         struct drm_vmw_fence_arg *arg =3D
>                 (struct drm_vmw_fence_arg *) data;
>
> -       return ttm_ref_object_base_unref(vmw_fpriv(file_priv)->tfile,
> -                                        arg->handle);
> +       return drm_syncobj_destroy(file_priv, arg->handle);
>  }
>
>  /**
> @@ -660,50 +561,34 @@ int vmw_fence_event_ioctl(struct drm_device *dev,
> void *data,
>         struct vmw_private *dev_priv =3D vmw_priv(dev);
>         struct drm_vmw_fence_event_arg *arg =3D
>                 (struct drm_vmw_fence_event_arg *) data;
> +       struct drm_syncobj  *ufence =3D NULL;
>         struct vmw_fence_obj *fence =3D NULL;
> -       struct vmw_fpriv *vmw_fp =3D vmw_fpriv(file_priv);
> -       struct ttm_object_file *tfile =3D vmw_fp->tfile;
>         struct drm_vmw_fence_rep __user *user_fence_rep =3D
> -               (struct drm_vmw_fence_rep __user *)(unsigned long)
> -               arg->fence_rep;
> -       uint32_t handle;
> +               (struct drm_vmw_fence_rep __user *)(unsigned
> long)arg->fence_rep;
> +       u32 handle =3D 0;
>         int ret;
>
>         /*
> -        * Look up an existing fence object,
> -        * and if user-space wants a new reference,
> -        * add one.
> +        * Look up an existing fence object and if user-space
> +        * wants a new reference add one.
>          */
>         if (arg->handle) {
> -               struct ttm_base_object *base =3D
> -                       vmw_fence_obj_lookup(tfile, arg->handle);
> +               ufence =3D drm_syncobj_find(file_priv, arg->handle);
> +               if (!ufence)
> +                       return -ENOENT;
>
> -               if (IS_ERR(base))
> -                       return PTR_ERR(base);
> -
> -               fence =3D &(container_of(base, struct vmw_user_fence,
> -                                      base)->fence);
> -               (void) vmw_fence_obj_reference(fence);
> +               fence =3D container_of(drm_syncobj_fence_get(ufence),
> +                                    typeof(*fence), base);
>
>                 if (user_fence_rep !=3D NULL) {
> -                       ret =3D ttm_ref_object_add(vmw_fp->tfile, base,
> -                                                NULL, false);
> -                       if (unlikely(ret !=3D 0)) {
> -                               DRM_ERROR("Failed to reference a fence "
> -                                         "object.\n");
> -                               goto out_no_ref_obj;
> +                       ret =3D drm_syncobj_get_handle(file_priv, ufence,
> &handle);
>

 This bit looks suspicious. So we're allocating a new handle here but
userspace is not aware of this handle and will never release it, so each
call to vmw_fence_event_ioctl will create another handle and increase the
refcount on the syncobj. You probably want:
if (handle)
   drm_syncobj_destroy(file_priv, handle);
executed on all paths but even then the behavior won't match the old code.
In the old code the refcount on the original handle was increased in the
new we create a new handle and if we unconditionally delete it then we're
back to the original refcount and if we don't then userspace will never
know about it and won't release it either.

z

--000000000000fcc9eb0638d67057
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 26, 2025 at 4:12=E2=80=AFPM I=
an Forbes &lt;<a href=3D"mailto:ian.forbes@broadcom.com">ian.forbes@broadco=
m.com</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_container">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Replace vmwgfx&#39;s ad h=
oc userspace fence tracking with drm_syncobj.<br>
They are nearly identical and it is possible to maintain compatibility<br>
with the old IOCTLs.<br>
<br>
Signed-off-by: Ian Forbes &lt;<a href=3D"mailto:ian.forbes@broadcom.com" ta=
rget=3D"_blank">ian.forbes@broadcom.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_drv.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
3 +-<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_drv.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
2 +-<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |=C2=A0 10 +-<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_fence.c=C2=A0 =C2=A0| 230 ++++++-------=
-----------<br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_fence.h=C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<=
br>
=C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_kms.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
2 +-<br>
=C2=A06 files changed, 67 insertions(+), 183 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/v=
mwgfx_drv.c<br>
index bc0342c58b4b..33e5e90ce63d 100644<br>
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c<br>
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c<br>
@@ -1582,7 +1582,8 @@ static const struct file_operations vmwgfx_driver_fop=
s =3D {<br>
<br>
=C2=A0static const struct drm_driver driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver_features =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC =
| DRIVER_GEM | DRIVER_CURSOR_HOTSPOT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC =
|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRIVER_GEM | DRIVER_CURSOR_HOTSPOT | DRIVER_SYN=
COBJ,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .ioctls =3D vmw_ioctls,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_ioctls =3D ARRAY_SIZE(vmw_ioctls),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .master_set =3D vmw_master_set,<br>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/v=
mwgfx_drv.h<br>
index eda5b6f8f4c4..6df5f66aecf7 100644<br>
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h<br>
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h<br>
@@ -983,7 +983,7 @@ extern int vmw_execbuf_fence_commands(struct drm_file *=
file_priv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vmw_fenc=
e_obj **p_fence,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *p_han=
dle);<br>
=C2=A0extern int vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vm=
w_fpriv *vmw_fp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dr=
m_file *,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct d=
rm_vmw_fence_rep __user<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_fe=
nce_rep,<br>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_execbuf.c<br>
index 819704ac675d..f83c35861bf7 100644<br>
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c<br>
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c<br>
@@ -14,6 +14,7 @@<br>
<br>
=C2=A0#include &lt;drm/ttm/ttm_bo.h&gt;<br>
=C2=A0#include &lt;drm/ttm/ttm_placement.h&gt;<br>
+#include &lt;drm/drm_syncobj.h&gt;<br>
<br>
=C2=A0#include &lt;linux/sync_file.h&gt;<br>
=C2=A0#include &lt;linux/hashtable.h&gt;<br>
@@ -3859,7 +3860,7 @@ int vmw_execbuf_fence_commands(struct drm_file *file_=
priv,<br>
=C2=A0 */<br>
=C2=A0int<br>
=C2=A0vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_fpriv *vmw_fp, int ret,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *file_priv, int ret,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_vmw_fence_rep __user *user_fence_rep,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct vmw_fence_obj *fence, uint32_t fence_handle=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int32_t out_fence_fd)<br>
@@ -3894,7 +3895,7 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_p=
riv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* handle.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(ret !=3D 0) &amp;&amp; (fence_rep.=
error =3D=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_ref_object_base=
_unref(vmw_fp-&gt;tfile, fence_handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_syncobj_destroy=
(file_priv, fence_handle);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMW_DEBUG_USER(&quo=
t;Fence copy error. Syncing.\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) vmw_fence_ob=
j_wait(fence, false, false,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 V=
MW_FENCE_WAIT_TIMEOUT);<br>
@@ -4236,8 +4237,9 @@ int vmw_execbuf_process(struct drm_file *file_priv,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vmw_execbuf_copy_fence_user(dev_priv, v=
mw_fpriv(file_priv), ret,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user_fence_rep, fence, =
handle, out_fence_fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vmw_execbuf_copy_fence_user(dev_priv, f=
ile_priv, ret,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0us=
er_fence_rep, fence, handle,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ou=
t_fence_fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sync_file) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_fence.c<br>
index c2294abbe753..de81d95268c3 100644<br>
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c<br>
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c<br>
@@ -7,6 +7,7 @@<br>
=C2=A0 ********************************************************************=
******/<br>
<br>
=C2=A0#include &quot;vmwgfx_drv.h&quot;<br>
+#include &lt;drm/drm_syncobj.h&gt;<br>
<br>
=C2=A0#define VMW_FENCE_WRAP (1 &lt;&lt; 31)<br>
<br>
@@ -18,11 +19,6 @@ struct vmw_fence_manager {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 ctx;<br>
=C2=A0};<br>
<br>
-struct vmw_user_fence {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_base_object base;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_fence_obj fence;<br>
-};<br>
-<br>
=C2=A0/**<br>
=C2=A0 * struct vmw_event_fence_action - fence callback that delivers a DRM=
 event.<br>
=C2=A0 *<br>
@@ -74,7 +70,7 @@ static void vmw_fence_obj_destroy(struct dma_fence *f)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 vmw_seqno_waiter_remove(fman-&gt;dev_priv);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;fm=
an-&gt;lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fence-&gt;destroy(fence);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_fence_free(f);<br>
=C2=A0}<br>
<br>
=C2=A0static const char *vmw_fence_get_driver_name(struct dma_fence *f)<br>
@@ -156,14 +152,12 @@ void vmw_fence_manager_takedown(struct vmw_fence_mana=
ger *fman)<br>
=C2=A0}<br>
<br>
=C2=A0static int vmw_fence_obj_init(struct vmw_fence_manager *fman,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_fence_obj *fence, u32 seqno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*destroy) (struct vmw_fence_obj *fence=
))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_fence_obj *fence, u32 seqno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_fence_init(&amp;fence-&gt;base, &amp;vmw_fe=
nce_ops, &amp;fman-&gt;lock,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fman-&gt;ctx, seqno);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fence-&gt;destroy =3D destroy;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;fman-&gt;lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(fman-&gt;fifo_down)) {<br>
@@ -239,11 +233,6 @@ int vmw_fence_obj_wait(struct vmw_fence_obj *fence, bo=
ol lazy,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-static void vmw_fence_destroy(struct vmw_fence_obj *fence)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dma_fence_free(&amp;fence-&gt;base);<br>
-}<br>
-<br>
=C2=A0int vmw_fence_create(struct vmw_fence_manager *fman,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uint32_t seqno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct vmw_fence_obj **p_fence)<br>
@@ -255,7 +244,7 @@ int vmw_fence_create(struct vmw_fence_manager *fman,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(!fence))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vmw_fence_obj_init(fman, fence, seqno, =
vmw_fence_destroy);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vmw_fence_obj_init(fman, fence, seqno);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(ret !=3D 0))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_err_init;<=
br>
<br>
@@ -267,77 +256,31 @@ int vmw_fence_create(struct vmw_fence_manager *fman,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
-<br>
-static void vmw_user_fence_destroy(struct vmw_fence_obj *fence)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_user_fence *ufence =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(fence,=
 struct vmw_user_fence, fence);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_base_object_kfree(ufence, base);<br>
-}<br>
-<br>
-static void vmw_user_fence_base_release(struct ttm_base_object **p_base)<b=
r>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_base_object *base =3D *p_base;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_user_fence *ufence =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(base, =
struct vmw_user_fence, base);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_fence_obj *fence =3D &amp;ufence-&gt=
;fence;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*p_base =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vmw_fence_obj_unreference(&amp;fence);<br>
-}<br>
-<br>
=C2=A0int vmw_user_fence_create(struct drm_file *file_priv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct vmw_fence_manager *fman,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint32_t seqno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct vmw_fence_obj **p_fence,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint32_t *p_handle)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_object_file *tfile =3D vmw_fpriv(fil=
e_priv)-&gt;tfile;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_user_fence *ufence;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_syncobj *ufence;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vmw_fence_obj *tmp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ufence =3D kzalloc(sizeof(*ufence), GFP_KERNEL)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!ufence)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_no_object;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vmw_fence_obj_init(fman, &amp;ufence-&g=
t;fence, seqno,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmw_user_fence_destroy);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(ret !=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(ufence);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_no_object;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The base object holds a reference which is f=
reed in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * vmw_user_fence_base_release.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D vmw_fence_obj_reference(&amp;ufence-&gt=
;fence);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_base_object_init(tfile, &amp;ufence=
-&gt;base, false,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMW_RES_FENCE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;vmw_user_fence_base_rele=
ase);<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vmw_fence_create(fman, seqno, &amp;tmp)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(ret !=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Free the base ob=
ject&#39;s reference<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_syncobj_create(&amp;ufence, 0, &amp=
;tmp-&gt;base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmw_fence_obj_unref=
erence(&amp;tmp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*p_fence =3D &amp;ufence-&gt;fence;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*p_handle =3D ufence-&gt;base.handle;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-out_err:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D &amp;ufence-&gt;fence;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0vmw_fence_obj_unreference(&amp;tmp);<br>
-out_no_object:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_syncobj_get_handle(file_priv, ufenc=
e, p_handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_syncobj_put(ufence);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmw_fence_obj_unref=
erence(&amp;tmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*p_fence =3D tmp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
@@ -385,51 +328,13 @@ void vmw_fence_fifo_up(struct vmw_fence_manager *fman=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;fman-&gt;lock);<br>
=C2=A0}<br>
<br>
-<br>
-/**<br>
- * vmw_fence_obj_lookup - Look up a user-space fence object<br>
- *<br>
- * @tfile: A struct ttm_object_file identifying the caller.<br>
- * @handle: A handle identifying the fence object.<br>
- * @return: A struct vmw_user_fence base ttm object on success or<br>
- * an error pointer on failure.<br>
- *<br>
- * The fence object is looked up and type-checked. The caller needs<br>
- * to have opened the fence object first, but since that happens on<br>
- * creation and fence objects aren&#39;t shareable, that&#39;s not an<br>
- * issue currently.<br>
- */<br>
-static struct ttm_base_object *<br>
-vmw_fence_obj_lookup(struct ttm_object_file *tfile, u32 handle)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_base_object *base =3D ttm_base_objec=
t_lookup(tfile, handle);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!base) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Invali=
d fence object handle 0x%08lx.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (unsigned long)handle);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EIN=
VAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (base-&gt;refcount_release !=3D vmw_user_fen=
ce_base_release) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Invali=
d fence object handle 0x%08lx.\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (unsigned long)handle);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_base_object_unr=
ef(&amp;base);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EIN=
VAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return base;<br>
-}<br>
-<br>
-<br>
=C2=A0int vmw_fence_obj_wait_ioctl(struct drm_device *dev, void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *file_priv)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_vmw_fence_wait_arg *arg =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct drm_vmw_fence_wait_arg *)=
data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long timeout;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_base_object *base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vmw_fence_obj *fence;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_object_file *tfile =3D vmw_fpriv(fil=
e_priv)-&gt;tfile;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t wait_timeout =3D ((uint64_t)arg-&gt;ti=
meout_us * HZ);<br>
<br>
@@ -446,11 +351,10 @@ int vmw_fence_obj_wait_ioctl(struct drm_device *dev, =
void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg-&gt;kernel_cook=
ie =3D jiffies + wait_timeout;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D vmw_fence_obj_lookup(tfile, arg-&gt;ha=
ndle);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(base))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(base=
);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D &amp;(container_of(base, struct vmw_u=
ser_fence, base)-&gt;fence);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_syncobj_find_fence(file_priv, arg-&=
gt;handle, 0, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct dma_fence **)&=
amp;fence);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout =3D jiffies;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (time_after_eq(timeout, (unsigned long)arg-&=
gt;kernel_cookie)) {<br>
@@ -464,14 +368,14 @@ int vmw_fence_obj_wait_ioctl(struct drm_device *dev, =
void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D vmw_fence_obj_wait(fence, arg-&gt;lazy,=
 true, timeout);<br>
<br>
=C2=A0out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_base_object_unref(&amp;base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vmw_fence_obj_unreference(&amp;fence); // from =
find_fence<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Optionally unref the fence object.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0 &amp;&amp; (arg-&gt;wait_optio=
ns &amp; DRM_VMW_WAIT_OPTION_UNREF))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ttm_ref_obje=
ct_base_unref(tfile, arg-&gt;handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_syncobj=
_destroy(file_priv, arg-&gt;handle);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
@@ -480,36 +384,33 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device *d=
ev, void *data,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_vmw_fence_signaled_arg *arg =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct drm_vmw_fen=
ce_signaled_arg *) data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_base_object *base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vmw_fence_obj *fence;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_object_file *tfile =3D vmw_fpriv(fil=
e_priv)-&gt;tfile;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vmw_private *dev_priv =3D vmw_priv(dev);=
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D vmw_fence_obj_lookup(tfile, arg-&gt;ha=
ndle);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(base))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(base=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D drm_syncobj_find_fence(file_priv, a=
rg-&gt;handle, 0, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct =
dma_fence **)&amp;fence);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D &amp;(container_of(base, struct vmw_u=
ser_fence, base)-&gt;fence);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg-&gt;signaled =3D vmw_fence_obj_signaled(fen=
ce);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg-&gt;signaled_flags =3D arg-&gt;flags;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg-&gt;passed_seqno =3D atomic_read_acquire(&a=
mp;dev_priv-&gt;last_read_seqno);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_base_object_unref(&amp;base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vmw_fence_obj_unreference(&amp;fence); // from =
find_fence<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
<br>
=C2=A0int vmw_fence_obj_unref_ioctl(struct drm_device *dev, void *data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *file_priv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *file_priv)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_vmw_fence_arg *arg =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct drm_vmw_fen=
ce_arg *) data;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ttm_ref_object_base_unref(vmw_fpriv(file=
_priv)-&gt;tfile,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg-&gt;=
handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_syncobj_destroy(file_priv, arg-&gt;h=
andle);<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -660,50 +561,34 @@ int vmw_fence_event_ioctl(struct drm_device *dev, voi=
d *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vmw_private *dev_priv =3D vmw_priv(dev);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_vmw_fence_event_arg *arg =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct drm_vmw_fen=
ce_event_arg *) data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_syncobj=C2=A0 *ufence =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vmw_fence_obj *fence =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vmw_fpriv *vmw_fp =3D vmw_fpriv(file_pri=
v);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_object_file *tfile =3D vmw_fp-&gt;tf=
ile;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_vmw_fence_rep __user *user_fence_rep=
 =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct drm_vmw_fen=
ce_rep __user *)(unsigned long)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arg-&gt;fence_rep;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct drm_vmw_fen=
ce_rep __user *)(unsigned long)arg-&gt;fence_rep;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 handle =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Look up an existing fence object,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and if user-space wants a new reference,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * add one.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Look up an existing fence object and if user=
-space<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * wants a new reference add one.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arg-&gt;handle) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_base_obj=
ect *base =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vmw_fence_obj_lookup(tfile, arg-&gt;handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ufence =3D drm_sync=
obj_find(file_priv, arg-&gt;handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ufence)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOENT;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(base))<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return PTR_ERR(base);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D &amp;(con=
tainer_of(base, struct vmw_user_fence,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base)-&gt;fence=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) vmw_fence_ob=
j_reference(fence);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D container=
_of(drm_syncobj_fence_get(ufence),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typeof(*fence), base);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (user_fence_rep =
!=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D ttm_ref_object_add(vmw_fp-&gt;tfile, base,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL, false);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (unlikely(ret !=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Failed to reference a=
 fence &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;object.\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_no_ref_obj;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D drm_syncobj_get_handle(file_priv, ufence, &amp;handle);<b=
r></blockquote><div><br></div><div>=C2=A0This bit looks suspicious. So we&#=
39;re allocating a new handle here but userspace is not aware of this handl=
e and will never release it, so each call to=C2=A0vmw_fence_event_ioctl wil=
l create another handle and increase the refcount on the syncobj. You proba=
bly want:</div><div>if (handle)</div><div>=C2=A0 =C2=A0drm_syncobj_destroy(=
file_priv, handle);</div><div>executed on all paths but even then the behav=
ior won&#39;t match the old code. In the old code the refcount on the origi=
nal handle was increased in the new we create a new handle and if we uncond=
itionally delete it then we&#39;re back to the original refcount and if we =
don&#39;t then userspace will never know about it and won&#39;t release it =
either.</div><div><br></div><div>z</div></div></div>

--000000000000fcc9eb0638d67057--

--00000000000003491c0638d6715d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEINVC
jaKMTVotvprbKf5Vy4iqNgIw154n6VsZqWzB9ZFKMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDcwMTA0MTg1MFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBABqtIw7rolIBI3MvhdjFe2xw9pRMCV9tmsYY3rrA
eKrbaCzJwWVCKNyovEL2WYTA9DuBfPd9AK5fgEKJHlpHDMXzNpqstv300PMdvqe9uaCObxYVvP1b
dpdfOIcATAELcxa0Any1LmFLJNWyzpuFsw75fz7+Ri6ErkuP6aV78jkNwfYkUl15DcZf9EVIgHOP
2DconlUryeT7At+kiz1KyaC7BbEMEM0XQJ1VfY/BOVasdfn9cO9LKEwAsUeN9+ZXBb2ufVSKNLp7
Gx93nZGzmeMaTTcO2Q/XZg++A8ayAY5QSoEA1QHJAqrlIsF3UK4nmCkvc1WVpMcGMxHhtszcOBI=
--00000000000003491c0638d6715d--

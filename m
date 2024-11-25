Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCD9D8D48
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 21:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E65B10E71E;
	Mon, 25 Nov 2024 20:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="B66BTMXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B54D10E71E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 20:11:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3823194a879so3478830f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 12:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732565514; x=1733170314;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tz8Jo4nrjwLZLDybb4jvu2OU9t5HI7zoNf4dwoCs/GQ=;
 b=B66BTMXIA1cFzHHgCjihOixrVu03KKkFTjcXd0DGrEkKOmchLFmArL5e3blcUGh621
 LdVgpqmwhacOYBc4xba+bU22uZpew6Ci2AW/Dog84lum8+Hr2QNeket8utIPN/30FOD4
 SxM8IwZqV/owEC9DHlQVvv90vYm3eXw5CGLUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732565514; x=1733170314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tz8Jo4nrjwLZLDybb4jvu2OU9t5HI7zoNf4dwoCs/GQ=;
 b=r640mOuLjDCOFZ01raGSpepW51aFfLzoECvP8C79UcreHS0yCPr3wDZEHASaNh8faR
 j9K6+9OKYElA0BaJhKwAJOXkjFialX77OOpXR8A2CFscjwBzflf66itcZiGRLEysCJeg
 uI2V3ukz1sEo+zota7Wf92UbHg30HH9JrNgaffdU7e0jCWXMjUq2e7pDX0AG5nz4kg1P
 48kGUz6z+qjAcPMsn3dx6/jdX2ZgnM2Yb6XM2RI2h1Z8SNm8X1UtB5Kp4ko4bHVyXtzN
 k0DmSyeFvtym5qtLt69AeGNcnaA1dA2rcHyBuXnyHzRyLDNGxPESbyvw9fje9DNvxXrm
 NvsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG2l6omX/bwrMeijVYs8lemzWhg9ZOAdAlRIaCuynwOl3QKwS7/v4b6ij+nr343HMRtH3AlUMfhes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfjG5l83xfHUL/H26QfzcVLOPlF+H4YkIlTCBRbtBDmDqBJEqE
 4CAaZ0Jlpp/flib+d/FpvcZl8t0KQAQmhs/Y4TkTG8Q3i7pPRq3oAZhNBKrOLK8vPrCxlUUA2FZ
 +h//2dtXtUdKOikfaAeBz8AoKBu21iYJ7Ic0o7dV4dQpgvZXSjw==
X-Gm-Gg: ASbGnct3YhbFv+KjbhLEownIp0t0agWcSxq+Na9IPjkSwChe0kt7VzmB2qawkF/MJtp
 lRc15HSHqmVmsPbfwvCBwwxyxMVeb49eS
X-Google-Smtp-Source: AGHT+IH+HW1ymvEAMDKvTSNYASiBcaGWVSp5/BA00mNJ5HSZS2jn+Tq3RtjRH/HnGaeCZqDhpi+xSQ2giNysned9f5Q=
X-Received: by 2002:a05:6000:2cd:b0:382:498a:9cf5 with SMTP id
 ffacd0b85a97d-38260b5ae29mr14145253f8f.14.1732565514395; Mon, 25 Nov 2024
 12:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20241121102725.4195-1-christian.koenig@amd.com>
 <20241121102725.4195-3-christian.koenig@amd.com>
In-Reply-To: <20241121102725.4195-3-christian.koenig@amd.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Mon, 25 Nov 2024 14:11:43 -0600
Message-ID: <CAO6MGtg7TJO6NL39wTLYoN0qLMk_1OqvtEHodsLA9eBViKzd6g@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/vmwgfx: use the new drm_exec object v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: zack.rusin@broadcom.com, dri-devel@lists.freedesktop.org
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

Breaks userspace command submission. Here's the log with lock debugging on.

```
[   20.438106] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
[   20.439696] WARNING: lock held when returning to user space!
[   20.441730] 6.12.0+ #11 Not tainted
[   20.442389] ------------------------------------------------
[   20.443663] gnome-shell/1853 is leaving the kernel with locks still held=
!
[   20.445519] 1 lock held by gnome-shell/1853:
[   20.446524]  #0: ffff9ae5892431a0
(reservation_ww_class_mutex){....}-{3:3}, at:
ww_mutex_trylock+0x186/0x3a0
```

Ian,

On Thu, Nov 21, 2024 at 4:27=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Basically just switching over to the new infrastructure like we did for
> other drivers as well.
>
> No intentional functional change, but only compile tested.
>
> v2: fix kerneldoc issues
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 57 +++++++++++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.h | 41 ++--------------
>  2 files changed, 60 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_validation.c
> index e7625b3f71e0..fdcc45cd4f57 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -817,6 +817,60 @@ int vmw_validation_preload_res(struct vmw_validation=
_context *ctx,
>         return 0;
>  }
>
> +/**
> + * vmw_validation_bo_reserve - Reserve buffer objects registered with a
> + * validation context
> + * @ctx: The validation context
> + * @intr: Perform waits interruptible
> + *
> + * Return: Zero on success, -ERESTARTSYS when interrupted, negative erro=
r
> + * code on failure
> + */
> +int vmw_validation_bo_reserve(struct vmw_validation_context *ctx, bool i=
ntr)
> +{
> +       struct vmw_validation_bo_node *entry;
> +       int ret;
> +
> +       drm_exec_init(&ctx->exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0,=
 0);
> +       drm_exec_until_all_locked(&ctx->exec) {
> +               list_for_each_entry(entry, &ctx->bo_list, base.head) {
> +                       ret =3D drm_exec_prepare_obj(&ctx->exec,
> +                                                  &entry->base.bo->base,=
 1);
> +                       drm_exec_retry_on_contention(&ctx->exec);
> +                       if (ret)
> +                               goto error;
> +               }
> +       }
> +       return 0;
> +
> +error:
> +       drm_exec_fini(&ctx->exec);
> +       return ret;
> +}
> +
> +/**
> + * vmw_validation_bo_fence - Unreserve and fence buffer objects register=
ed
> + * with a validation context
> + * @ctx: The validation context
> + * @fence: The fence to add
> + *
> + * This function unreserves the buffer objects previously reserved using
> + * vmw_validation_bo_reserve, and fences them with a fence object.
> + */
> +void vmw_validation_bo_fence(struct vmw_validation_context *ctx,
> +                            struct vmw_fence_obj *fence)
> +{
> +       struct vmw_validation_bo_node *entry;
> +
> +       list_for_each_entry(entry, &ctx->bo_list, base.head) {
> +               dma_resv_add_fence(entry->base.bo->base.resv, &fence->bas=
e,
> +                                  DMA_RESV_USAGE_READ);
> +       }
> +       drm_exec_fini(&ctx->exec);
> +}
> +
> +
> +
>  /**
>   * vmw_validation_bo_backoff - Unreserve buffer objects registered with =
a
>   * validation context
> @@ -842,6 +896,5 @@ void vmw_validation_bo_backoff(struct vmw_validation_=
context *ctx)
>                                 vmw_bo_dirty_release(vbo);
>                 }
>         }
> -
> -       ttm_eu_backoff_reservation(&ctx->ticket, &ctx->bo_list);
> +       drm_exec_fini(&ctx->exec);
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm=
/vmwgfx/vmwgfx_validation.h
> index 353d837907d8..55a7d8b68d5c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
> @@ -31,8 +31,7 @@
>  #include <linux/list.h>
>  #include <linux/hashtable.h>
>  #include <linux/ww_mutex.h>
> -
> -#include <drm/ttm/ttm_execbuf_util.h>
> +#include <drm/drm_exec.h>
>
>  #define VMW_RES_DIRTY_NONE 0
>  #define VMW_RES_DIRTY_SET BIT(0)
> @@ -59,7 +58,7 @@ struct vmw_validation_context {
>         struct list_head resource_ctx_list;
>         struct list_head bo_list;
>         struct list_head page_list;
> -       struct ww_acquire_ctx ticket;
> +       struct drm_exec exec;
>         struct mutex *res_mutex;
>         unsigned int merge_dups;
>         unsigned int mem_size_left;
> @@ -106,39 +105,6 @@ vmw_validation_has_bos(struct vmw_validation_context=
 *ctx)
>         return !list_empty(&ctx->bo_list);
>  }
>
> -/**
> - * vmw_validation_bo_reserve - Reserve buffer objects registered with a
> - * validation context
> - * @ctx: The validation context
> - * @intr: Perform waits interruptible
> - *
> - * Return: Zero on success, -ERESTARTSYS when interrupted, negative erro=
r
> - * code on failure
> - */
> -static inline int
> -vmw_validation_bo_reserve(struct vmw_validation_context *ctx,
> -                         bool intr)
> -{
> -       return ttm_eu_reserve_buffers(&ctx->ticket, &ctx->bo_list, intr,
> -                                     NULL);
> -}
> -
> -/**
> - * vmw_validation_bo_fence - Unreserve and fence buffer objects register=
ed
> - * with a validation context
> - * @ctx: The validation context
> - *
> - * This function unreserves the buffer objects previously reserved using
> - * vmw_validation_bo_reserve, and fences them with a fence object.
> - */
> -static inline void
> -vmw_validation_bo_fence(struct vmw_validation_context *ctx,
> -                       struct vmw_fence_obj *fence)
> -{
> -       ttm_eu_fence_buffer_objects(&ctx->ticket, &ctx->bo_list,
> -                                   (void *) fence);
> -}
> -
>  /**
>   * vmw_validation_align - Align a validation memory allocation
>   * @val: The size to be aligned
> @@ -185,6 +151,9 @@ int vmw_validation_preload_res(struct vmw_validation_=
context *ctx,
>                                unsigned int size);
>  void vmw_validation_res_set_dirty(struct vmw_validation_context *ctx,
>                                   void *val_private, u32 dirty);
> +int vmw_validation_bo_reserve(struct vmw_validation_context *ctx, bool i=
ntr);
> +void vmw_validation_bo_fence(struct vmw_validation_context *ctx,
> +                            struct vmw_fence_obj *fence);
>  void vmw_validation_bo_backoff(struct vmw_validation_context *ctx);
>
>  #endif
> --
> 2.34.1
>

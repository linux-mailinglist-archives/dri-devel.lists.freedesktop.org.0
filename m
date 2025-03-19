Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F0A683A5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 04:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7284B10E0B1;
	Wed, 19 Mar 2025 03:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="WPFIRh33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2110E0B1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:21:59 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6f754678c29so71974947b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1742354518; x=1742959318;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HhK914Zij4sE5bqLsGT+heUO+6oCYRk5RHkqQBZck3k=;
 b=WPFIRh339H0qwkLvvxiIJBe3Z0EYadq/Z74L6GKB2msDIeG8BuImjf/JpJdomNcKGq
 DTOie41j0KSYj48+B3IAUAegaGn1HGDzUKVsw676bpk5LV0IZyPZRtJJa6+u1dh+5c8T
 0fjuhh14LRKTd7cvnD8lK7sCPJKCLmNizZSP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742354518; x=1742959318;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HhK914Zij4sE5bqLsGT+heUO+6oCYRk5RHkqQBZck3k=;
 b=PiL3AALfuzFqABdp6a+1skHXXg62B/TmyRGWdfHEXq+kndt0PV/FroKw0McuI8OvdV
 EfaeK6kQHIqAXuxlTWC8g75+Set9yVsPpzplnfxqSoKu06D4ML6FwW2f8LwnlEWNj49h
 wu48PYZzMR1YnHZUweRJiGZuJbtqgIryY5LJMZBEEf9juV6CC2V7Q/zAqVw3ZDR9sTkx
 Uj5rdTgsb6E5E/1SCeNvWuxj0+2upcM5mLGMc9vQWSekCg2V6kjkBVw59xm3m8qbpoeM
 ezWA4BuqXOd1qqgkp+bQlfTHmACl/q9rzuuvca618mI2Ii2fJ33Lw4/dUIqw5jeF0yBt
 NpQw==
X-Gm-Message-State: AOJu0YzdP90YOSJfeUQRXBoRLzzaHuovAhj/YM0QBErYqQgvnRcpkZAJ
 mXqg/hVizu9rniehJJUW0XwH0LJ3ALWhA8bcQ8Ci/ni61KrtAtGCWFXJ2BBC9041tVz+AC5zpZb
 PjMdqkJSSOTl+zd8Jm7xZA4vTYdQcXOya2qft
X-Gm-Gg: ASbGncueVnGqVvvCXopLNRW/Wyw0TE7mEkW6yrItMQjCSItFfV/VI8SP1XbLD83CBkw
 ysQglpJ1XmlRsv9ISp0Bb38UmcLlW3pUetOxd9DouCaXn8tWpOMauXEdu9j/9b6GaV6p7+5ygoy
 T0qT62stTu6bpjYvmdGPCV4a5zex0=
X-Google-Smtp-Source: AGHT+IH5rL002PVgwxN468bh/ZCa9ZRJ7XDzuALkKbkIxHb5VErSC/gX12kx7MjKBp6b1VQpYr+wJr4JCsiw4sF2/QI=
X-Received: by 2002:a05:690c:7205:b0:6fb:b2de:a2bd with SMTP id
 00721157ae682-7009bf89d8fmr20665247b3.16.1742354518520; Tue, 18 Mar 2025
 20:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250131200321.193939-1-ian.forbes@broadcom.com>
In-Reply-To: <20250131200321.193939-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 18 Mar 2025 23:21:47 -0400
X-Gm-Features: AQ5f1JqG6mjbSmQvtKcecbp6zJp4wv97He2ggFtOveQHNaBgDW096Klh9pmzdvo
Message-ID: <CABQX2QM_sXt+P_L31O_XRyseGjbLJUXajnXi=Kpp+TMWSTK4iA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Switch to exclusively using GEM references
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000002b36cc0630a986ca"
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

--0000000000002b36cc0630a986ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 3:04=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> Currently we use a combination of TTM and GEM reference counting which is
> cumbersome. TTM references are used for kernel internal BOs and operation=
s
> like validation. Simply switching the ttm_bo_(get|put) calls to their
> GEM equivalents is insufficient as not all BOs are GEM BOs so we must set
> the GEM vtable for all BOs even if they are not exposed to userspace.
>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c    |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 +---
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        | 18 ++----------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c        |  3 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  8 ++++----
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    |  4 +---
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  7 +++----
>  10 files changed, 18 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 676fd84f35cc..609bf4067b07 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -36,8 +36,7 @@ static void vmw_bo_release(struct vmw_bo *vbo)
>  {
>         struct vmw_resource *res;
>
> -       WARN_ON(vbo->tbo.base.funcs &&
> -               kref_read(&vbo->tbo.base.refcount) !=3D 0);
> +       WARN_ON(kref_read(&vbo->tbo.base.refcount) !=3D 0);
>         vmw_bo_unmap(vbo);
>
>         xa_destroy(&vbo->detached_resources);
> @@ -469,6 +468,7 @@ int vmw_bo_create(struct vmw_private *vmw,
>         if (unlikely(ret !=3D 0))
>                 goto out_error;
>
> +       (*p_bo)->tbo.base.funcs =3D &vmw_gem_object_funcs;
>         return ret;
>  out_error:
>         *p_bo =3D NULL;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.h
> index e97cae2365c8..791951fe019c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -204,12 +204,12 @@ static inline void vmw_bo_unreference(struct vmw_bo=
 **buf)
>
>         *buf =3D NULL;
>         if (tmp_buf)
> -               ttm_bo_put(&tmp_buf->tbo);
> +               drm_gem_object_put(&tmp_buf->tbo.base);
>  }
>
>  static inline struct vmw_bo *vmw_bo_reference(struct vmw_bo *buf)
>  {
> -       ttm_bo_get(&buf->tbo);
> +       drm_gem_object_get(&buf->tbo.base);
>         return buf;
>  }
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_cotable.c
> index a7c07692262b..98331c4c0335 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -432,7 +432,7 @@ static int vmw_cotable_resize(struct vmw_resource *re=
s, size_t new_size)
>          * for the new COTable. Initially pin the buffer object to make s=
ure
>          * we can use tryreserve without failure.
>          */
> -       ret =3D vmw_gem_object_create(dev_priv, &bo_params, &buf);
> +       ret =3D vmw_bo_create(dev_priv, &bo_params, &buf);
>         if (ret) {
>                 DRM_ERROR("Failed initializing new cotable MOB.\n");
>                 goto out_done;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 5c1d82a73c32..81382cd58ba2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -843,9 +843,7 @@ static inline bool vmw_resource_mob_attached(const st=
ruct vmw_resource *res)
>   * GEM related functionality - vmwgfx_gem.c
>   */
>  struct vmw_bo_params;
> -int vmw_gem_object_create(struct vmw_private *vmw,
> -                         struct vmw_bo_params *params,
> -                         struct vmw_bo **p_vbo);
> +extern const struct drm_gem_object_funcs vmw_gem_object_funcs;
>  extern int vmw_gem_object_create_with_handle(struct vmw_private *dev_pri=
v,
>                                              struct drm_file *filp,
>                                              uint32_t size,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_gem.c
> index ed5015ced392..026c9b699604 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -140,7 +140,7 @@ static const struct vm_operations_struct vmw_vm_ops =
=3D {
>         .close =3D ttm_bo_vm_close,
>  };
>
> -static const struct drm_gem_object_funcs vmw_gem_object_funcs =3D {
> +const struct drm_gem_object_funcs vmw_gem_object_funcs =3D {
>         .free =3D vmw_gem_object_free,
>         .open =3D vmw_gem_object_open,
>         .close =3D vmw_gem_object_close,
> @@ -154,20 +154,6 @@ static const struct drm_gem_object_funcs vmw_gem_obj=
ect_funcs =3D {
>         .vm_ops =3D &vmw_vm_ops,
>  };
>
> -int vmw_gem_object_create(struct vmw_private *vmw,
> -                         struct vmw_bo_params *params,
> -                         struct vmw_bo **p_vbo)
> -{
> -       int ret =3D vmw_bo_create(vmw, params, p_vbo);
> -
> -       if (ret !=3D 0)
> -               goto out_no_bo;
> -
> -       (*p_vbo)->tbo.base.funcs =3D &vmw_gem_object_funcs;
> -out_no_bo:
> -       return ret;
> -}
> -
>  int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>                                       struct drm_file *filp,
>                                       uint32_t size,
> @@ -183,7 +169,7 @@ int vmw_gem_object_create_with_handle(struct vmw_priv=
ate *dev_priv,
>                 .pin =3D false
>         };
>
> -       ret =3D vmw_gem_object_create(dev_priv, &params, p_vbo);
> +       ret =3D vmw_bo_create(dev_priv, &params, p_vbo);
>         if (ret !=3D 0)
>                 goto out_no_bo;
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_mob.c
> index 7055cbefc768..d8204d4265d3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> @@ -282,8 +282,7 @@ static int vmw_otable_batch_setup(struct vmw_private =
*dev_priv,
>         }
>
>         vmw_bo_unpin_unlocked(&batch->otable_bo->tbo);
> -       ttm_bo_put(&batch->otable_bo->tbo);
> -       batch->otable_bo =3D NULL;
> +       vmw_bo_unreference(&batch->otable_bo);
>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_resource.c
> index c4d5fe5f330f..388011696941 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -347,7 +347,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource=
 *res,
>                 return 0;
>         }
>
> -       ret =3D vmw_gem_object_create(res->dev_priv, &bo_params, &gbo);
> +       ret =3D vmw_bo_create(res->dev_priv, &bo_params, &gbo);
>         if (unlikely(ret !=3D 0))
>                 goto out_no_bo;
>
> @@ -531,9 +531,9 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *tick=
et,
>         }
>
>         INIT_LIST_HEAD(&val_list);
> -       ttm_bo_get(&res->guest_memory_bo->tbo);
>         val_buf->bo =3D &res->guest_memory_bo->tbo;
>         val_buf->num_shared =3D 0;
> +       drm_gem_object_get(&val_buf->bo->base);
>         list_add_tail(&val_buf->head, &val_list);
>         ret =3D ttm_eu_reserve_buffers(ticket, &val_list, interruptible, =
NULL);
>         if (unlikely(ret !=3D 0))
> @@ -557,7 +557,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *tick=
et,
>  out_no_validate:
>         ttm_eu_backoff_reservation(ticket, &val_list);
>  out_no_reserve:
> -       ttm_bo_put(val_buf->bo);
> +       drm_gem_object_put(&val_buf->bo->base);
>         val_buf->bo =3D NULL;
>         if (guest_memory_dirty)
>                 vmw_user_bo_unref(&res->guest_memory_bo);
> @@ -619,7 +619,7 @@ vmw_resource_backoff_reservation(struct ww_acquire_ct=
x *ticket,
>         INIT_LIST_HEAD(&val_list);
>         list_add_tail(&val_buf->head, &val_list);
>         ttm_eu_backoff_reservation(ticket, &val_list);
> -       ttm_bo_put(val_buf->bo);
> +       drm_gem_object_put(&val_buf->bo->base);
>         val_buf->bo =3D NULL;
>  }
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_scrn.c
> index cee2dc70cf8c..23dc404ad623 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -445,7 +445,7 @@ vmw_sou_primary_plane_prepare_fb(struct drm_plane *pl=
ane,
>          * resume the overlays, this is preferred to failing to alloc.
>          */
>         vmw_overlay_pause_all(dev_priv);
> -       ret =3D vmw_gem_object_create(dev_priv, &bo_params, &vps->uo.buff=
er);
> +       ret =3D vmw_bo_create(dev_priv, &bo_params, &vps->uo.buffer);
>         vmw_overlay_resume_all(dev_priv);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index 896f171f8093..bc7e522d336e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -850,9 +850,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, =
void *data,
>                         .pin =3D false
>                 };
>
> -               ret =3D vmw_gem_object_create(dev_priv,
> -                                           &params,
> -                                           &res->guest_memory_bo);
> +               ret =3D vmw_bo_create(dev_priv, &params, &res->guest_memo=
ry_bo);
>                 if (unlikely(ret !=3D 0)) {
>                         vmw_resource_unreference(&res);
>                         goto out_unlock;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_validation.c
> index e7625b3f71e0..7ee93e7191c7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -262,9 +262,8 @@ int vmw_validation_add_bo(struct vmw_validation_conte=
xt *ctx,
>                                 bo_node->hash.key);
>                 }
>                 val_buf =3D &bo_node->base;
> -               val_buf->bo =3D ttm_bo_get_unless_zero(&vbo->tbo);
> -               if (!val_buf->bo)
> -                       return -ESRCH;
> +               vmw_bo_reference(vbo);
> +               val_buf->bo =3D &vbo->tbo;
>                 val_buf->num_shared =3D 0;
>                 list_add_tail(&val_buf->head, &ctx->bo_list);
>         }
> @@ -656,7 +655,7 @@ void vmw_validation_unref_lists(struct vmw_validation=
_context *ctx)
>         struct vmw_validation_res_node *val;
>
>         list_for_each_entry(entry, &ctx->bo_list, base.head) {
> -               ttm_bo_put(entry->base.bo);
> +               drm_gem_object_put(&entry->base.bo->base);
>                 entry->base.bo =3D NULL;
>         }
>
> --
> 2.45.2
>

Yea, that's probably a long time coming. As a followup it'd be good to
get rid of vmw_user_bo_ref/vmw_user_bo_unref now that they're exactly
the same as vmw_bo_reference/vmw_bo_unreference.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--0000000000002b36cc0630a986ca
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIGjf
003MvDF3/TpLyjpFFHO9IEvFJvS++gxAYIF9NjG3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDMxOTAzMjE1OFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFzbXxZpldBeJtgGCHGMQjWTarVCzTadzf9EOeR/
AQNWqAzUUiPHdFHPbbGvwq4EkO1efDpk9OKt9tnT5RlWgb/IfG1Z4nicWjo371AI+38A6+Es3EvF
cePrb9BPuSJTTXkBOJhv+liFKQMqSOzPlPsOEBhGUZftmmKDpA77qxtUNnvkm+sFEovmvkOdu37v
8JlwHG790lxXJAcWf+KQU5B53IBfmr1RpO+qvyzu0GXsMzv0JXtZrIdITQ9IxESz2mMFkmZFOs9d
YIztgVyGPGBPnZmFmt3J5cuR3Z7ZHWBrT0R3GbFxIH6Ww/3zvj7Oz8UQxgH7fE+OKAe9JEQuQX0=
--0000000000002b36cc0630a986ca--

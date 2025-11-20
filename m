Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7A6C756F7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037A610E78A;
	Thu, 20 Nov 2025 16:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="KpmUK30d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com
 [209.85.214.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D54110E78B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 16:43:04 +0000 (UTC)
Received: by mail-pl1-f227.google.com with SMTP id
 d9443c01a7336-298456bb53aso14513695ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763656984; x=1764261784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEpS+2UmIgYQnyCJdO2gZgarWG/asYABHmbrxYaLbUg=;
 b=ESQYFjMmXsECEuOYGdaiUiJridvcNUyeK+pIwwm0zBuoEPGlS4Ci/RxkTpHy4tuIRH
 19ftxR7zgcFrj0TgT8SD37c4uMTKv9pphZe1brGSzZY1B4zBlpJOv1I9nsNFjSkI+2fF
 qDcvTMJWevRggu88mhnzRl1XL2PcdHzbJt7AlkgipS5eZWT5hUhUnqdgjX8CM3X8pM1s
 uj2Vw8HdYSjhWDReVGnoTmerniUrPReEvSiBIOqU+ImF+fN94XIJrEnwM/XRMcjY/jHE
 q92W75+K9iaoTVZ8Pt4eWK7JwrqPaHHbvjK5RudGgq6ruZmU7WjJFshK0EreybBhzZpQ
 P6Qg==
X-Gm-Message-State: AOJu0YwG8Esgq8OsD0/aWWPAnXGNSm/2cpXICmVwiUJKsAzNXVyy3lkh
 8K0ssMvmm1K3y8SAx84iwvLGz2c3/YDSy5sv7uSDU1lEW/eFyb3wUOm/Bq2b+zSsX9ZTDal46D9
 hM0/6ObygxmHxZI+JjxXQrF0OAX+WlOh6dW2Xxd8OHUat9jwfAoHlQTGCak9XotWbeOqX8908n0
 OSXmwSdnAjGzkyyALVbnJTIsJGDdK8vD5Sdf2w5/7ogVkgaNBYcjei0G6t4uEEn9bt+r7JHS493
 twhImVe6cG5MKcKaUbx
X-Gm-Gg: ASbGnctz2nT5hrWxQFPXp7hS8YDTwq9Da76aXD7v6immdpilxNm4StCmGmskOTJ/IUo
 X+8Ug5B1ZqePlsHQaN+OTZQqGlgZJOQCGthrtZtTcyO6d9b8q9IE36coHjODUtIcVw2WlYI+X2G
 8l2ASgmNoypHEs8AnQn9ntwffDQPxNaV/m5ZPB+azWvL15IOqHL44Y4rXX4pZraWCgiYkJHX5eC
 FVF27oGN8/7HXGOsyO2E9R+ahjtfF1+cX2AKYlWCEItPpB017SFGg9a8Hm4pP/8w5LEnd9sWo7F
 6CRjQ+DRfNlSN9COrZNcffOoKx+Ecb9C1JzswQOW3/TBdRSIU1IJqUrWu6VvbmfaXhVWYjd9Oor
 0spbtxMbPerhmFN0RB27iO78qFGtfTeBr4aJ5+Wh/pwbUVUbk2DttKHmBIrO+SyH9t+r3wYBgAR
 Tc0gbwy4Q9bO0fVONT8JsYtwUr4mRN+wl21uewJZAYXg==
X-Google-Smtp-Source: AGHT+IGwVsCDypQwRLYG8WLp4E6vIm9m7bZvoI5p35C2h0Btixt27M7QHJM1I48QRApSqdzzrh17tHDEkGIu
X-Received: by 2002:a17:903:4b4b:b0:297:ece8:a3cb with SMTP id
 d9443c01a7336-29b5b07b7cemr48175485ad.25.1763656983832; 
 Thu, 20 Nov 2025 08:43:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-77.dlp.protect.broadcom.com. [144.49.247.77])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-29b5b1060b6sm3557665ad.10.2025.11.20.08.43.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Nov 2025 08:43:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5957abd4ddcso1268434e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1763656981; x=1764261781;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TEpS+2UmIgYQnyCJdO2gZgarWG/asYABHmbrxYaLbUg=;
 b=KpmUK30dWymH/eedkCfQ3yMbsSuANvJG8ZRXt3VAHfKd+6Wfh62eOO/Q1tOEWoYY3M
 wCGENU4pVbn9S2DbgTbXBnwLyO9UE2lHDLem0M79TjrByThZykOjsXUsb/oLXQdcoK5U
 +RswH1kUA46jKDa5eZKvkUo9oe9dgptvDxYY0=
X-Received: by 2002:a05:6512:acc:b0:595:81c1:c55 with SMTP id
 2adb3069b0e04-5969e2ae965mr1497859e87.8.1763656981076; 
 Thu, 20 Nov 2025 08:43:01 -0800 (PST)
X-Received: by 2002:a05:6512:acc:b0:595:81c1:c55 with SMTP id
 2adb3069b0e04-5969e2ae965mr1497849e87.8.1763656980521; Thu, 20 Nov 2025
 08:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20251114184702.1909989-1-ian.forbes@broadcom.com>
In-Reply-To: <20251114184702.1909989-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 20 Nov 2025 11:42:47 -0500
X-Gm-Features: AWmQ_bmBZMy_p4UQgmJu1SBnT9E-DfBrSL2e2EQbOTnmejLFE6OsoChXW5-US0o
Message-ID: <CABQX2QP=F5zFzCub1H_hhBw4Y8OpyeHDNT=uj2CeSjj77gSRcg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Move the validation duplicates hashtable
 onto the stack
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 maaz.mombasawala@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000e4e63a0644096319"
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

--000000000000e4e63a0644096319
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 1:47=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> This hashtable is only used under a lock in vmw_execbuf_process and needs
> to be cleared before vmw_execbuf_process returns otherwise bad things
> happen because the nodes that are stored in the table come from an arena
> allocator that is cleared at the end of the function.
>
> Rather than wasting time cleaning up the hashtable move it onto the stack
> so we don't have to do any cleanup.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>
> v2:
>  - remove sw_context from the validation context
>
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  9 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  3 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    |  7 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  6 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 98 ++++------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.h | 18 ++--
>  8 files changed, 32 insertions(+), 115 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index abceffea3683..3ac9eb8a2e21 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -814,13 +814,6 @@ static void vmw_write_driver_id(struct vmw_private *=
dev)
>         }
>  }
>
> -static void vmw_sw_context_init(struct vmw_private *dev_priv)
> -{
> -       struct vmw_sw_context *sw_context =3D &dev_priv->ctx;
> -
> -       hash_init(sw_context->res_ht);
> -}
> -
>  static void vmw_sw_context_fini(struct vmw_private *dev_priv)
>  {
>         struct vmw_sw_context *sw_context =3D &dev_priv->ctx;
> @@ -836,8 +829,6 @@ static int vmw_driver_load(struct vmw_private *dev_pr=
iv, u32 pci_id)
>         enum vmw_res_type i;
>         bool refuse_dma =3D false;
>
> -       vmw_sw_context_init(dev_priv);
> -
>         mutex_init(&dev_priv->cmdbuf_mutex);
>         mutex_init(&dev_priv->binding_mutex);
>         spin_lock_init(&dev_priv->resource_lock);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 62db3f3f3aa0..f7c760d72b85 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -79,7 +79,6 @@
>  #define VMW_RES_STREAM ttm_driver_type2
>  #define VMW_RES_FENCE ttm_driver_type3
>  #define VMW_RES_SHADER ttm_driver_type4
> -#define VMW_RES_HT_ORDER 12
>
>  #define MKSSTAT_CAPACITY_LOG2 5U
>  #define MKSSTAT_CAPACITY (1U << MKSSTAT_CAPACITY_LOG2)
> @@ -348,7 +347,6 @@ struct vmw_ctx_validation_info;
>
>  /**
>   * struct vmw_sw_context - Command submission context
> - * @res_ht: Pointer hash table used to find validation duplicates
>   * @kernel: Whether the command buffer originates from kernel code rathe=
r
>   * than from user-space
>   * @fp: If @kernel is false, points to the file of the client. Otherwise
> @@ -378,7 +376,6 @@ struct vmw_ctx_validation_info;
>   * @ctx: The validation context
>   */
>  struct vmw_sw_context{
> -       DECLARE_HASHTABLE(res_ht, VMW_RES_HT_ORDER);
>         bool kernel;
>         struct vmw_fpriv *fp;
>         struct drm_file *filp;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index 3057f8baa7d2..3a211baa8b88 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -4094,7 +4094,7 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>         int ret;
>         int32_t out_fence_fd =3D -1;
>         struct sync_file *sync_file =3D NULL;
> -       DECLARE_VAL_CONTEXT(val_ctx, sw_context, 1);
> +       DECLARE_VAL_CONTEXT(val_ctx, 1);
>
>         if (flags & DRM_VMW_EXECBUF_FLAG_EXPORT_FENCE_FD) {
>                 out_fence_fd =3D get_unused_fd_flags(O_CLOEXEC);
> @@ -4184,8 +4184,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>         if (unlikely(ret !=3D 0))
>                 goto out_err;
>
> -       vmw_validation_drop_ht(&val_ctx);
> -
>         ret =3D mutex_lock_interruptible(&dev_priv->binding_mutex);
>         if (unlikely(ret !=3D 0)) {
>                 ret =3D -ERESTARTSYS;
> @@ -4294,7 +4292,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
>                 __vmw_execbuf_release_pinned_bo(dev_priv, NULL);
>  out_unlock:
>         vmw_cmdbuf_res_revert(&sw_context->staged_cmd_res);
> -       vmw_validation_drop_ht(&val_ctx);
>         WARN_ON(!list_empty(&sw_context->ctx_list));
>         mutex_unlock(&dev_priv->cmdbuf_mutex);
>
> @@ -4363,7 +4360,7 @@ void __vmw_execbuf_release_pinned_bo(struct vmw_pri=
vate *dev_priv,
>  {
>         int ret =3D 0;
>         struct vmw_fence_obj *lfence =3D NULL;
> -       DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
> +       DECLARE_VAL_CONTEXT(val_ctx, 0);
>
>         if (dev_priv->pinned_bo =3D=3D NULL)
>                 goto out_unlock;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index 07f2a5ead34b..4446f25e526d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1739,7 +1739,7 @@ int vmw_du_helper_plane_update(struct vmw_du_update=
_plane *update)
>         struct drm_atomic_helper_damage_iter iter;
>         struct drm_rect clip;
>         struct drm_rect bb;
> -       DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
> +       DECLARE_VAL_CONTEXT(val_ctx, 0);
>         uint32_t reserved_size =3D 0;
>         uint32_t submit_size =3D 0;
>         uint32_t curr_size =3D 0;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_scrn.c
> index 5f5f5a94301f..4e85ba5206ae 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -1104,7 +1104,7 @@ int vmw_kms_sou_do_surface_dirty(struct vmw_private=
 *dev_priv,
>         struct vmw_framebuffer_surface *vfbs =3D
>                 container_of(framebuffer, typeof(*vfbs), base);
>         struct vmw_kms_sou_surface_dirty sdirty;
> -       DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
> +       DECLARE_VAL_CONTEXT(val_ctx, 0);
>         int ret;
>
>         if (!srf)
> @@ -1219,7 +1219,7 @@ int vmw_kms_sou_do_bo_dirty(struct vmw_private *dev=
_priv,
>                 container_of(framebuffer, struct vmw_framebuffer_bo,
>                              base)->buffer;
>         struct vmw_kms_dirty dirty;
> -       DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
> +       DECLARE_VAL_CONTEXT(val_ctx, 0);
>         int ret;
>
>         vmw_bo_placement_set(buf, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
> @@ -1327,7 +1327,7 @@ int vmw_kms_sou_readback(struct vmw_private *dev_pr=
iv,
>         struct vmw_bo *buf =3D
>                 container_of(vfb, struct vmw_framebuffer_bo, base)->buffe=
r;
>         struct vmw_kms_dirty dirty;
> -       DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
> +       DECLARE_VAL_CONTEXT(val_ctx, 0);
>         int ret;
>
>         vmw_bo_placement_set(buf, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index 37cb742ba1d9..faacfef7baa5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -566,7 +566,7 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_pri=
v,
>                 container_of(vfb, struct vmw_framebuffer_bo, base)->buffe=
r;
>         struct vmw_stdu_dirty ddirty;
>         int ret;
> -       DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
> +       DECLARE_VAL_CONTEXT(val_ctx, 0);
>
>         /*
>          * The GMR domain might seem confusing because it might seem like=
 it should
> @@ -733,7 +733,7 @@ int vmw_kms_stdu_surface_dirty(struct vmw_private *de=
v_priv,
>         struct vmw_framebuffer_surface *vfbs =3D
>                 container_of(framebuffer, typeof(*vfbs), base);
>         struct vmw_stdu_dirty sdirty;
> -       DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
> +       DECLARE_VAL_CONTEXT(val_ctx, 0);
>         int ret;
>
>         if (!srf)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_validation.c
> index 35dc94c3db39..508809712398 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -162,24 +162,13 @@ vmw_validation_find_bo_dup(struct vmw_validation_co=
ntext *ctx,
>         if (!ctx->merge_dups)
>                 return NULL;
>
> -       if (ctx->sw_context) {
> -               struct vmwgfx_hash_item *hash;
> -               unsigned long key =3D (unsigned long) vbo;
> -
> -               hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash,=
 head, key) {
> -                       if (hash->key =3D=3D key) {
> -                               bo_node =3D container_of(hash, typeof(*bo=
_node), hash);
> -                               break;
> -                       }
> -               }
> -       } else {
> -               struct  vmw_validation_bo_node *entry;
> +       struct vmwgfx_hash_item *hash;
> +       unsigned long key =3D (unsigned long)vbo;
>
> -               list_for_each_entry(entry, &ctx->bo_list, base.head) {
> -                       if (entry->base.bo =3D=3D &vbo->tbo) {
> -                               bo_node =3D entry;
> -                               break;
> -                       }
> +       hash_for_each_possible(ctx->res_ht, hash, head, key) {
> +               if (hash->key =3D=3D key) {
> +                       bo_node =3D container_of(hash, typeof(*bo_node), =
hash);
> +                       break;
>                 }
>         }
>
> @@ -204,35 +193,15 @@ vmw_validation_find_res_dup(struct vmw_validation_c=
ontext *ctx,
>         if (!ctx->merge_dups)
>                 return NULL;
>
> -       if (ctx->sw_context) {
> -               struct vmwgfx_hash_item *hash;
> -               unsigned long key =3D (unsigned long) res;
> -
> -               hash_for_each_possible_rcu(ctx->sw_context->res_ht, hash,=
 head, key) {
> -                       if (hash->key =3D=3D key) {
> -                               res_node =3D container_of(hash, typeof(*r=
es_node), hash);
> -                               break;
> -                       }
> -               }
> -       } else {
> -               struct  vmw_validation_res_node *entry;
> -
> -               list_for_each_entry(entry, &ctx->resource_ctx_list, head)=
 {
> -                       if (entry->res =3D=3D res) {
> -                               res_node =3D entry;
> -                               goto out;
> -                       }
> -               }
> +       struct vmwgfx_hash_item *hash;
> +       unsigned long key =3D (unsigned long)res;
>
> -               list_for_each_entry(entry, &ctx->resource_list, head) {
> -                       if (entry->res =3D=3D res) {
> -                               res_node =3D entry;
> -                               break;
> -                       }
> +       hash_for_each_possible(ctx->res_ht, hash, head, key) {
> +               if (hash->key =3D=3D key) {
> +                       res_node =3D container_of(hash, typeof(*res_node)=
, hash);
> +                       break;
>                 }
> -
>         }
> -out:
>         return res_node;
>  }
>
> @@ -256,10 +225,9 @@ int vmw_validation_add_bo(struct vmw_validation_cont=
ext *ctx,
>                 if (!bo_node)
>                         return -ENOMEM;
>
> -               if (ctx->sw_context) {
> +               if (ctx->merge_dups) {
>                         bo_node->hash.key =3D (unsigned long) vbo;
> -                       hash_add_rcu(ctx->sw_context->res_ht, &bo_node->h=
ash.head,
> -                               bo_node->hash.key);
> +                       hash_add(ctx->res_ht, &bo_node->hash.head, bo_nod=
e->hash.key);
>                 }
>                 val_buf =3D &bo_node->base;
>                 vmw_bo_reference(vbo);
> @@ -303,13 +271,13 @@ int vmw_validation_add_resource(struct vmw_validati=
on_context *ctx,
>                 return -ENOMEM;
>         }
>
> -       if (ctx->sw_context) {
> +       if (ctx->merge_dups) {
>                 node->hash.key =3D (unsigned long) res;
> -               hash_add_rcu(ctx->sw_context->res_ht, &node->hash.head, n=
ode->hash.key);
> +               hash_add(ctx->res_ht, &node->hash.head, node->hash.key);
>         }
>         node->res =3D vmw_resource_reference_unless_doomed(res);
>         if (!node->res) {
> -               hash_del_rcu(&node->hash.head);
> +               hash_del(&node->hash.head);
>                 return -ESRCH;

This bit looks suspicious. It looks like if ctx->merge_dups is false
and the resource is doomed then we'll try to remove an invalid node
(because it has not been added to the hash).

Other than that, it looks great.


z

--000000000000e4e63a0644096319
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIO25
Slsmd7jkDZOZ3nwTDfD4JakQogv+7zA5K2z2yV4DMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTEyMDE2NDMwMVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFIdVdP2Ns7/OoJUE0Ghd/9aCr2mbYxCKIadKcYd
/RIJxzFjIBVdqeCXFKAgqGJbMp0FffXE8pQXm6rq6CE9wV8Di9GFTYfwl8/Halh84uGcjnk5a2hF
y/BgwfOuZkfwFKAyyV+TihNJ1wMreMgrFPEW+ZYaQT78bQDhhAOp+F3H7kkda30QvPOXakNvnR9h
isyuq2El/AmX7ha41k1B2lPiCp+zeVW7zOu794OcfgEAcmaJFEIaTeXDPRUkUnU6fkiJVIcud3qS
UMUd3Z9iudhMEw3WX2phW6ai7T6KIHBb6HQBzyT5CQzVes2r1ZpvWybj7m8qzB7qThS6Vc86ePo=
--000000000000e4e63a0644096319--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A197A30E4E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 15:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5B710E6CE;
	Tue, 11 Feb 2025 14:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="AtloDSz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D0D10E6D0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 14:33:58 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-8553534922dso55649939f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 06:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1739284437; x=1739889237;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4f39/8VSkSdePjxrQ9vnt52Sc/tE5lIwtpH+eoUgoC8=;
 b=AtloDSz/Tjryl156y9wi/ZZ63mv6R0LvlXjKPD6wzCoeHe5IRRxAaoRVVO4MO0LdGj
 o3J1/y5BH9piIYYbUPZWgxHK1/1AhccK+bR2HugoQlLAx7v7IThAHheR8vajtHqq/YFM
 ddLzp3O55wcPsURGyCTn33x7ZLAf98WKiUmOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739284437; x=1739889237;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4f39/8VSkSdePjxrQ9vnt52Sc/tE5lIwtpH+eoUgoC8=;
 b=s6QkVVy5e0GqPGpfUHMAYVJor9st/oPtJDudM+RS5utVLF7o7h/hGFvumMH8a7WlM9
 Mor60doIwpWrA1MNDOtbgscFhIFqKEEnsBi+tnE4WACWSWxZZIlcevs6XftPs+bfpjGR
 1dX8xcsQwBxDP2iISD2Zg6WZCYunZAIlphMVMN0f/67ZGy9UmH6e15Gh1H7XEv1PJYYq
 uTlc7fYoC1A0wjcGAjGQ8FwH2j50abEYe9gu1OPdxDL98b2QQQvRgecf6XHZ0RKsBE+g
 oou7dpgDGdAJ9iC0Iju43ZUMjueLEpPjBbu8/P8hgZPUfbM/4S0Zx53g4L+TC8XZIEk7
 a75Q==
X-Gm-Message-State: AOJu0Yw8M50ID9EGfC0aROC6qiRQDcVhyL2OpbDR2Foj/vsN09SgAxjG
 WBW7grf5gSbrPjvD8IhuFk0du1eFwKOLEmufPDepEa1pcVV1RQkLVebWFLsTE3LoRhvpba54LwO
 3176aAiZGMchAHPwwjVpyTb2XAPs2pPhGJDCc
X-Gm-Gg: ASbGncum+FDskNAsF9e1dafXYM4EwRD4uQ9jUh91KHq+zj63xRNK0Sm4BuGvNp08o3O
 lZhdYBN4WvbvzCgQr+yC6kUtliIfMB+xSBSc50uvv8mxUeicrR7AeRQJOcO0MQK+LqHVMxQW5
X-Google-Smtp-Source: AGHT+IGgyl75u4eZ2V7EZdkDOCY/Phtd3VDVi8oCLi4HgKs+KTfQdEcvC8IJqOsls8UQ6k/5KVlY//A4uTgMgu8yfBo=
X-Received: by 2002:a05:6602:154a:b0:855:3961:49c9 with SMTP id
 ca18e2360f4ac-85539614aa9mr700934939f.6.1739284436477; Tue, 11 Feb 2025
 06:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20250115044954.2496547-1-zack.rusin@broadcom.com>
 <20250115044954.2496547-2-zack.rusin@broadcom.com>
In-Reply-To: <20250115044954.2496547-2-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Tue, 11 Feb 2025 16:33:43 +0200
X-Gm-Features: AWEUYZmtFXuh44W9J_AbbDCoX94sEJdqqn2UEqHT4FTvAD7y0Q5-Oyhk0rWSep8
Message-ID: <CAKLwHdUXzzC1nygXrJXCVEgTjqEkRc0e1csb_6-2CGydrByUNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Refactor cursor handling
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000010190a062ddeb7a6"
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

--00000000000010190a062ddeb7a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 6:50=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> Refactor cursor handling to make the code maintainable again. Over the
> last 12 years the svga device improved support for virtualized cursors
> and at the same time the drm interfaces evolved quite a bit from
> pre-atomic to current atomic ones. vmwgfx only added new code over
> the years, instead of adjusting/refactoring the paths.
>
> Export the cursor plane handling to its own file. Remove special
> handling of the legacy cursor support to make it fit within the global
> cursor plane mechanism.
>
> Finally redo dirty tracking because memcmp never worked correctly
> resulting in the cursor not being properly updated in the guest.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/Makefile              |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |   6 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |   2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 844 +++++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  81 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |   3 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |   2 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          | 838 +-----------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h          |  49 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c          |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   |  40 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c         |  10 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c         |  11 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c      |  25 +-
>  15 files changed, 1017 insertions(+), 916 deletions(-)
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
>  create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
>
> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Mak=
efile
> index 46a4ab688a7f..b168fd7fe9b3 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -10,6 +10,6 @@ vmwgfx-y :=3D vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.=
o vmwgfx_drv.o \
>             vmwgfx_simple_resource.o vmwgfx_va.o vmwgfx_blit.o \
>             vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o=
 \
>             vmwgfx_devcaps.o ttm_object.o vmwgfx_system_manager.o \
> -           vmwgfx_gem.o vmwgfx_vkms.o
> +           vmwgfx_gem.o vmwgfx_vkms.o vmwgfx_cursor_plane.o
>
>  obj-$(CONFIG_DRM_VMWGFX) :=3D vmwgfx.o
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 9b5b8c1f063b..b7766421d2f5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -887,3 +887,9 @@ struct vmw_surface *vmw_bo_surface(struct vmw_bo *vbo=
)
>                 surf =3D vmw_res_to_srf(res);
>         return surf;
>  }
> +
> +s32 vmw_bo_mobid(struct vmw_bo *vbo)
> +{
> +       WARN_ON(vbo->tbo.resource->mem_type !=3D VMW_PL_MOB);
> +       return (s32)vbo->tbo.resource->start;
> +}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.h
> index 11e330c7c7f5..e97cae2365c8 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -233,4 +233,6 @@ static inline struct vmw_bo *to_vmw_bo(struct drm_gem=
_object *gobj)
>         return container_of((gobj), struct vmw_bo, tbo.base);
>  }
>
> +s32 vmw_bo_mobid(struct vmw_bo *vbo);
> +
>  #endif // VMWGFX_BO_H
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_cursor_plane.c
> new file mode 100644
> index 000000000000..05a1ea1f83e9
> --- /dev/null
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
> @@ -0,0 +1,844 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/***********************************************************************=
***
> + *
> + * Copyright (c) 2024 Broadcom. All Rights Reserved. The term
> + * =E2=80=9CBroadcom=E2=80=9D refers to Broadcom Inc. and/or its subsidi=
aries.
> + *
> + ***********************************************************************=
***/
> +#include "vmwgfx_cursor_plane.h"
> +
> +#include "vmwgfx_bo.h"
> +#include "vmwgfx_drv.h"
> +#include "vmwgfx_kms.h"
> +#include "vmwgfx_resource_priv.h"
> +#include "vmw_surface_cache.h"
> +
> +#include "drm/drm_atomic.h"
> +#include "drm/drm_atomic_helper.h"
> +#include "drm/drm_plane.h"
> +#include <asm/page_types.h>
> +
> +#define VMW_CURSOR_SNOOP_FORMAT SVGA3D_A8R8G8B8
> +#define VMW_CURSOR_SNOOP_WIDTH 64
> +#define VMW_CURSOR_SNOOP_HEIGHT 64
> +
> +struct vmw_svga_fifo_cmd_define_cursor {
> +       u32 cmd;
> +       SVGAFifoCmdDefineAlphaCursor cursor;
> +};
> +
> +/**
> + * vmw_send_define_cursor_cmd - queue a define cursor command
> + * @dev_priv: the private driver struct
> + * @image: buffer which holds the cursor image
> + * @width: width of the mouse cursor image
> + * @height: height of the mouse cursor image
> + * @hotspotX: the horizontal position of mouse hotspot
> + * @hotspotY: the vertical position of mouse hotspot
> + */
> +static void vmw_send_define_cursor_cmd(struct vmw_private *dev_priv,
> +                                      u32 *image, u32 width, u32 height,
> +                                      u32 hotspotX, u32 hotspotY)
> +{
> +       struct vmw_svga_fifo_cmd_define_cursor *cmd;
> +       const u32 image_size =3D width * height * sizeof(*image);
> +       const u32 cmd_size =3D sizeof(*cmd) + image_size;
> +
> +       /*
> +        * Try to reserve fifocmd space and swallow any failures;
> +        * such reservations cannot be left unconsumed for long
> +        * under the risk of clogging other fifocmd users, so
> +        * we treat reservations separtely from the way we treat
> +        * other fallible KMS-atomic resources at prepare_fb
> +        */
> +       cmd =3D VMW_CMD_RESERVE(dev_priv, cmd_size);
> +
> +       if (unlikely(!cmd))
> +               return;
> +
> +       memset(cmd, 0, sizeof(*cmd));
> +
> +       memcpy(&cmd[1], image, image_size);
> +
> +       cmd->cmd =3D SVGA_CMD_DEFINE_ALPHA_CURSOR;
> +       cmd->cursor.id =3D 0;
> +       cmd->cursor.width =3D width;
> +       cmd->cursor.height =3D height;
> +       cmd->cursor.hotspotX =3D hotspotX;
> +       cmd->cursor.hotspotY =3D hotspotY;
> +
> +       vmw_cmd_commit_flush(dev_priv, cmd_size);
> +}
> +
> +static void
> +vmw_cursor_plane_update_legacy(struct vmw_private *vmw,
> +                              struct vmw_plane_state *vps)
> +{
> +       struct vmw_surface *surface =3D vmw_user_object_surface(&vps->uo)=
;
> +       s32 hotspot_x =3D vps->cursor.legacy.hotspot_x + vps->base.hotspo=
t_x;
> +       s32 hotspot_y =3D vps->cursor.legacy.hotspot_y + vps->base.hotspo=
t_y;
> +
> +       if (WARN_ON(!surface || !surface->snooper.image))
> +               return;
> +
> +       if (vps->cursor.legacy.id !=3D surface->snooper.id) {
> +               vmw_send_define_cursor_cmd(vmw, surface->snooper.image,
> +                                          vps->base.crtc_w, vps->base.cr=
tc_h,
> +                                          hotspot_x, hotspot_y);
> +               vps->cursor.legacy.id =3D surface->snooper.id;
> +       }
> +}
> +
> +static enum vmw_cursor_update_type
> +vmw_cursor_update_type(struct vmw_private *vmw, struct vmw_plane_state *=
vps)
> +{
> +       struct vmw_surface *surface =3D vmw_user_object_surface(&vps->uo)=
;
> +
> +       if (surface && surface->snooper.image)
> +               return VMW_CURSOR_UPDATE_LEGACY;
> +
> +       if (vmw->has_mob) {
> +               if ((vmw->capabilities2 & SVGA_CAP2_CURSOR_MOB) !=3D 0)
> +                       return VMW_CURSOR_UPDATE_MOB;
> +       }
> +
> +       return VMW_CURSOR_UPDATE_NONE;
> +}
> +
> +static void vmw_cursor_update_mob(struct vmw_private *vmw,
> +                                 struct vmw_plane_state *vps)
> +{
> +       SVGAGBCursorHeader *header;
> +       SVGAGBAlphaCursorHeader *alpha_header;
> +       struct vmw_bo *bo =3D vmw_user_object_buffer(&vps->uo);
> +       u32 *image =3D vmw_bo_map_and_cache(bo);
> +       const u32 image_size =3D vps->base.crtc_w * vps->base.crtc_h * si=
zeof(*image);
> +
> +       header =3D vmw_bo_map_and_cache(vps->cursor.mob);
> +       alpha_header =3D &header->header.alphaHeader;
> +
> +       memset(header, 0, sizeof(*header));
> +
> +       header->type =3D SVGA_ALPHA_CURSOR;
> +       header->sizeInBytes =3D image_size;
> +
> +       alpha_header->hotspotX =3D vps->cursor.legacy.hotspot_x + vps->ba=
se.hotspot_x;
> +       alpha_header->hotspotY =3D vps->cursor.legacy.hotspot_y + vps->ba=
se.hotspot_y;
> +       alpha_header->width =3D vps->base.crtc_w;
> +       alpha_header->height =3D vps->base.crtc_h;
> +
> +       memcpy(header + 1, image, image_size);
> +       vmw_write(vmw, SVGA_REG_CURSOR_MOBID, vmw_bo_mobid(vps->cursor.mo=
b));
> +
> +       vmw_bo_unmap(bo);
> +       vmw_bo_unmap(vps->cursor.mob);
> +}
> +
> +static u32 vmw_cursor_mob_size(enum vmw_cursor_update_type update_type,
> +                              u32 w, u32 h)
> +{
> +       switch (update_type) {
> +       case VMW_CURSOR_UPDATE_LEGACY:
> +       case VMW_CURSOR_UPDATE_NONE:
> +               return 0;
> +       case VMW_CURSOR_UPDATE_MOB:
> +               return w * h * sizeof(u32) + sizeof(SVGAGBCursorHeader);
> +       }
> +       return 0;
> +}
> +
> +static void vmw_cursor_mob_destroy(struct vmw_bo **vbo)
> +{
> +       if (!(*vbo))
> +               return;
> +
> +       ttm_bo_unpin(&(*vbo)->tbo);
> +       vmw_bo_unreference(vbo);
> +}
> +
> +/**
> + * vmw_cursor_mob_unmap - Unmaps the cursor mobs.
> + *
> + * @vps: state of the cursor plane
> + *
> + * Returns 0 on success
> + */
> +
> +static int
> +vmw_cursor_mob_unmap(struct vmw_plane_state *vps)
> +{
> +       int ret =3D 0;
> +       struct vmw_bo *vbo =3D vps->cursor.mob;
> +
> +       if (!vbo || !vbo->map.virtual)
> +               return 0;
> +
> +       ret =3D ttm_bo_reserve(&vbo->tbo, true, false, NULL);
> +       if (likely(ret =3D=3D 0)) {
> +               vmw_bo_unmap(vbo);
> +               ttm_bo_unreserve(&vbo->tbo);
> +       }
> +
> +       return ret;
> +}
> +
> +static void vmw_cursor_mob_put(struct vmw_cursor_plane *vcp,
> +                              struct vmw_plane_state *vps)
> +{
> +       u32 i;
> +
> +       if (!vps->cursor.mob)
> +               return;
> +
> +       vmw_cursor_mob_unmap(vps);
> +
> +       /* Look for a free slot to return this mob to the cache. */
> +       for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
> +               if (!vcp->cursor_mobs[i]) {
> +                       vcp->cursor_mobs[i] =3D vps->cursor.mob;
> +                       vps->cursor.mob =3D NULL;
> +                       return;
> +               }
> +       }
> +
> +       /* Cache is full: See if this mob is bigger than an existing mob.=
 */
> +       for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
> +               if (vcp->cursor_mobs[i]->tbo.base.size <
> +                   vps->cursor.mob->tbo.base.size) {
> +                       vmw_cursor_mob_destroy(&vcp->cursor_mobs[i]);
> +                       vcp->cursor_mobs[i] =3D vps->cursor.mob;
> +                       vps->cursor.mob =3D NULL;
> +                       return;
> +               }
> +       }
> +
> +       /* Destroy it if it's not worth caching. */
> +       vmw_cursor_mob_destroy(&vps->cursor.mob);
> +}
> +
> +static int vmw_cursor_mob_get(struct vmw_cursor_plane *vcp,
> +                             struct vmw_plane_state *vps)
> +{
> +       struct vmw_private *dev_priv =3D vmw_priv(vcp->base.dev);
> +       u32 size =3D vmw_cursor_mob_size(vps->cursor.update_type,
> +                                      vps->base.crtc_w, vps->base.crtc_h=
);
> +       u32 i;
> +       u32 cursor_max_dim, mob_max_size;
> +       struct vmw_fence_obj *fence =3D NULL;
> +       int ret;
> +
> +       if (!dev_priv->has_mob ||
> +           (dev_priv->capabilities2 & SVGA_CAP2_CURSOR_MOB) =3D=3D 0)
> +               return -EINVAL;
> +
> +       mob_max_size =3D vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
> +       cursor_max_dim =3D vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSI=
ON);
> +
> +       if (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
> +           vps->base.crtc_h > cursor_max_dim)
> +               return -EINVAL;
> +
> +       if (vps->cursor.mob) {
> +               if (vps->cursor.mob->tbo.base.size >=3D size)
> +                       return 0;
> +               vmw_cursor_mob_put(vcp, vps);
> +       }
> +
> +       /* Look for an unused mob in the cache. */
> +       for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
> +               if (vcp->cursor_mobs[i] &&
> +                   vcp->cursor_mobs[i]->tbo.base.size >=3D size) {
> +                       vps->cursor.mob =3D vcp->cursor_mobs[i];
> +                       vcp->cursor_mobs[i] =3D NULL;
> +                       return 0;
> +               }
> +       }
> +       /* Create a new mob if we can't find an existing one. */
> +       ret =3D vmw_bo_create_and_populate(dev_priv, size, VMW_BO_DOMAIN_=
MOB,
> +                                        &vps->cursor.mob);
> +
> +       if (ret !=3D 0)
> +               return ret;
> +
> +       /* Fence the mob creation so we are guarateed to have the mob */
> +       ret =3D ttm_bo_reserve(&vps->cursor.mob->tbo, false, false, NULL)=
;
> +       if (ret !=3D 0)
> +               goto teardown;
> +
> +       ret =3D vmw_execbuf_fence_commands(NULL, dev_priv, &fence, NULL);
> +       if (ret !=3D 0) {
> +               ttm_bo_unreserve(&vps->cursor.mob->tbo);
> +               goto teardown;
> +       }
> +
> +       dma_fence_wait(&fence->base, false);
> +       dma_fence_put(&fence->base);
> +
> +       ttm_bo_unreserve(&vps->cursor.mob->tbo);
> +
> +       return 0;
> +
> +teardown:
> +       vmw_cursor_mob_destroy(&vps->cursor.mob);
> +       return ret;
> +}
> +
> +static void vmw_cursor_update_position(struct vmw_private *dev_priv,
> +                                      bool show, int x, int y)
> +{
> +       const u32 svga_cursor_on =3D show ? SVGA_CURSOR_ON_SHOW
> +                                  : SVGA_CURSOR_ON_HIDE;
> +       u32 count;
> +
> +       spin_lock(&dev_priv->cursor_lock);
> +       if (dev_priv->capabilities2 & SVGA_CAP2_EXTRA_REGS) {
> +               vmw_write(dev_priv, SVGA_REG_CURSOR4_X, x);
> +               vmw_write(dev_priv, SVGA_REG_CURSOR4_Y, y);
> +               vmw_write(dev_priv, SVGA_REG_CURSOR4_SCREEN_ID, SVGA3D_IN=
VALID_ID);
> +               vmw_write(dev_priv, SVGA_REG_CURSOR4_ON, svga_cursor_on);
> +               vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, 1);
> +       } else if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
> +               vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, svga_cu=
rsor_on);
> +               vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
> +               vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_Y, y);
> +               count =3D vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CURSOR_CO=
UNT);
> +               vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_COUNT, ++co=
unt);
> +       } else {
> +               vmw_write(dev_priv, SVGA_REG_CURSOR_X, x);
> +               vmw_write(dev_priv, SVGA_REG_CURSOR_Y, y);
> +               vmw_write(dev_priv, SVGA_REG_CURSOR_ON, svga_cursor_on);
> +       }
> +       spin_unlock(&dev_priv->cursor_lock);
> +}
> +
> +void vmw_kms_cursor_snoop(struct vmw_surface *srf,
> +                         struct ttm_object_file *tfile,
> +                         struct ttm_buffer_object *bo,
> +                         SVGA3dCmdHeader *header)
> +{
> +       struct ttm_bo_kmap_obj map;
> +       unsigned long kmap_offset;
> +       unsigned long kmap_num;
> +       SVGA3dCopyBox *box;
> +       u32 box_count;
> +       void *virtual;
> +       bool is_iomem;
> +       struct vmw_dma_cmd {
> +               SVGA3dCmdHeader header;
> +               SVGA3dCmdSurfaceDMA dma;
> +       } *cmd;
> +       int i, ret;
> +       const struct SVGA3dSurfaceDesc *desc =3D
> +               vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
> +       const u32 image_pitch =3D VMW_CURSOR_SNOOP_WIDTH * desc->pitchByt=
esPerBlock;
> +
> +       cmd =3D container_of(header, struct vmw_dma_cmd, header);
> +
> +       /* No snooper installed, nothing to copy */
> +       if (!srf->snooper.image)
> +               return;
> +
> +       if (cmd->dma.host.face !=3D 0 || cmd->dma.host.mipmap !=3D 0) {
> +               DRM_ERROR("face and mipmap for cursors should never !=3D =
0\n");
> +               return;
> +       }
> +
> +       if (cmd->header.size < 64) {
> +               DRM_ERROR("at least one full copy box must be given\n");
> +               return;
> +       }
> +
> +       box =3D (SVGA3dCopyBox *)&cmd[1];
> +       box_count =3D (cmd->header.size - sizeof(SVGA3dCmdSurfaceDMA)) /
> +                       sizeof(SVGA3dCopyBox);
> +
> +       if (cmd->dma.guest.ptr.offset % PAGE_SIZE ||
> +           box->x !=3D 0    || box->y !=3D 0    || box->z !=3D 0    ||
> +           box->srcx !=3D 0 || box->srcy !=3D 0 || box->srcz !=3D 0 ||
> +           box->d !=3D 1    || box_count !=3D 1 ||
> +           box->w > VMW_CURSOR_SNOOP_WIDTH || box->h > VMW_CURSOR_SNOOP_=
HEIGHT) {
> +               /* TODO handle none page aligned offsets */
> +               /* TODO handle more dst & src !=3D 0 */
> +               /* TODO handle more then one copy */
> +               DRM_ERROR("Can't snoop dma request for cursor!\n");
> +               DRM_ERROR("(%u, %u, %u) (%u, %u, %u) (%ux%ux%u) %u %u\n",
> +                         box->srcx, box->srcy, box->srcz,
> +                         box->x, box->y, box->z,
> +                         box->w, box->h, box->d, box_count,
> +                         cmd->dma.guest.ptr.offset);
> +               return;
> +       }
> +
> +       kmap_offset =3D cmd->dma.guest.ptr.offset >> PAGE_SHIFT;
> +       kmap_num =3D (VMW_CURSOR_SNOOP_HEIGHT * image_pitch) >> PAGE_SHIF=
T;
> +
> +       ret =3D ttm_bo_reserve(bo, true, false, NULL);
> +       if (unlikely(ret !=3D 0)) {
> +               DRM_ERROR("reserve failed\n");
> +               return;
> +       }
> +
> +       ret =3D ttm_bo_kmap(bo, kmap_offset, kmap_num, &map);
> +       if (unlikely(ret !=3D 0))
> +               goto err_unreserve;
> +
> +       virtual =3D ttm_kmap_obj_virtual(&map, &is_iomem);
> +
> +       if (box->w =3D=3D VMW_CURSOR_SNOOP_WIDTH && cmd->dma.guest.pitch =
=3D=3D image_pitch) {
> +               memcpy(srf->snooper.image, virtual,
> +                      VMW_CURSOR_SNOOP_HEIGHT * image_pitch);
> +       } else {
> +               /* Image is unsigned pointer. */
> +               for (i =3D 0; i < box->h; i++)
> +                       memcpy(srf->snooper.image + i * image_pitch,
> +                              virtual + i * cmd->dma.guest.pitch,
> +                              box->w * desc->pitchBytesPerBlock);
> +       }
> +       srf->snooper.id++;
> +
> +       ttm_bo_kunmap(&map);
> +err_unreserve:
> +       ttm_bo_unreserve(bo);
> +}
> +
> +void vmw_cursor_plane_destroy(struct drm_plane *plane)
> +{
> +       struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
> +       u32 i;
> +
> +       vmw_cursor_update_position(vmw_priv(plane->dev), false, 0, 0);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++)
> +               vmw_cursor_mob_destroy(&vcp->cursor_mobs[i]);
> +
> +       drm_plane_cleanup(plane);
> +}
> +
> +/**
> + * vmw_cursor_mob_map - Maps the cursor mobs.
> + *
> + * @vps: plane_state
> + *
> + * Returns 0 on success
> + */
> +
> +static int
> +vmw_cursor_mob_map(struct vmw_plane_state *vps)
> +{
> +       int ret;
> +       u32 size =3D vmw_cursor_mob_size(vps->cursor.update_type,
> +                                      vps->base.crtc_w, vps->base.crtc_h=
);
> +       struct vmw_bo *vbo =3D vps->cursor.mob;
> +
> +       if (!vbo)
> +               return -EINVAL;
> +
> +       if (vbo->tbo.base.size < size)
> +               return -EINVAL;
> +
> +       if (vbo->map.virtual)
> +               return 0;
> +
> +       ret =3D ttm_bo_reserve(&vbo->tbo, false, false, NULL);
> +       if (unlikely(ret !=3D 0))
> +               return -ENOMEM;
> +
> +       vmw_bo_map_and_cache(vbo);
> +
> +       ttm_bo_unreserve(&vbo->tbo);
> +
> +       return 0;
> +}
> +
> +/**
> + * vmw_cursor_plane_cleanup_fb - Unpins the plane surface
> + *
> + * @plane: cursor plane
> + * @old_state: contains the state to clean up
> + *
> + * Unmaps all cursor bo mappings and unpins the cursor surface
> + *
> + * Returns 0 on success
> + */
> +void
> +vmw_cursor_plane_cleanup_fb(struct drm_plane *plane,
> +                           struct drm_plane_state *old_state)
> +{
> +       struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
> +       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(old_state)=
;
> +
> +       if (!vmw_user_object_is_null(&vps->uo))
> +               vmw_user_object_unmap(&vps->uo);
> +
> +       vmw_cursor_mob_unmap(vps);
> +       vmw_cursor_mob_put(vcp, vps);
> +
> +       vmw_du_plane_unpin_surf(vps);
> +       vmw_user_object_unref(&vps->uo);
> +}
> +
> +static bool
> +vmw_cursor_buffer_changed(struct vmw_plane_state *new_vps,
> +                         struct vmw_plane_state *old_vps)
> +{
> +       struct vmw_bo *new_bo =3D vmw_user_object_buffer(&new_vps->uo);
> +       struct vmw_bo *old_bo =3D vmw_user_object_buffer(&old_vps->uo);
> +       struct vmw_surface *surf;
> +       bool dirty =3D false;
> +       int ret;
> +
> +       if (new_bo !=3D old_bo)
> +               return true;
> +
> +       if (new_bo) {
> +               if (!old_bo) {
> +                       return true;
> +               } else if (new_bo->dirty) {
> +                       vmw_bo_dirty_scan(new_bo);
> +                       dirty =3D vmw_bo_is_dirty(new_bo);
> +                       if (dirty) {
> +                               surf =3D vmw_user_object_surface(&new_vps=
->uo);
> +                               if (surf)
> +                                       vmw_bo_dirty_transfer_to_res(&sur=
f->res);
> +                               else
> +                                       vmw_bo_dirty_clear(new_bo);
> +                       }
> +                       return dirty;
> +               } else if (new_bo !=3D old_bo) {
> +                       /*
> +                        * Currently unused because the top exits right a=
way.
> +                        * In most cases buffer being different will mean
> +                        * that the contents is different. For the few pe=
rcent
> +                        * of cases where that's not true the cost of doi=
ng
> +                        * the memcmp on all other seems to outweight the
> +                        * benefits. Leave the conditional to be able to
> +                        * trivially validate it by removing the initial
> +                        * if (new_bo !=3D old_bo) at the start.
> +                        */
> +                       void *old_image;
> +                       void *new_image;
> +                       bool changed =3D false;
> +                       struct ww_acquire_ctx ctx;
> +                       const u32 size =3D new_vps->base.crtc_w *
> +                                        new_vps->base.crtc_h * sizeof(u3=
2);
> +
> +                       ww_acquire_init(&ctx, &reservation_ww_class);
> +
> +                       ret =3D ttm_bo_reserve(&old_bo->tbo, false, false=
, &ctx);
> +                       if (ret !=3D 0) {
> +                               ww_acquire_fini(&ctx);
> +                               return true;
> +                       }
> +
> +                       ret =3D ttm_bo_reserve(&new_bo->tbo, false, false=
, &ctx);
> +                       if (ret !=3D 0) {
> +                               ttm_bo_unreserve(&old_bo->tbo);
> +                               ww_acquire_fini(&ctx);
> +                               return true;
> +                       }
> +
> +                       old_image =3D vmw_bo_map_and_cache(old_bo);
> +                       new_image =3D vmw_bo_map_and_cache(new_bo);
> +
> +                       if (old_image && new_image && old_image !=3D new_=
image)
> +                               changed =3D memcmp(old_image, new_image, =
size) !=3D
> +                                         0;
> +
> +                       ttm_bo_unreserve(&new_bo->tbo);
> +                       ttm_bo_unreserve(&old_bo->tbo);
> +
> +                       ww_acquire_fini(&ctx);
> +
> +                       return changed;
> +               }
> +               return false;
> +       }
> +
> +       return false;
> +}
> +
> +static bool
> +vmw_cursor_plane_changed(struct vmw_plane_state *new_vps,
> +                        struct vmw_plane_state *old_vps)
> +{
> +       if (old_vps->base.crtc_w !=3D new_vps->base.crtc_w ||
> +           old_vps->base.crtc_h !=3D new_vps->base.crtc_h)
> +               return true;
> +
> +       if (old_vps->base.hotspot_x !=3D new_vps->base.hotspot_x ||
> +           old_vps->base.hotspot_y !=3D new_vps->base.hotspot_y)
> +               return true;
> +
> +       if (old_vps->cursor.legacy.hotspot_x !=3D
> +                   new_vps->cursor.legacy.hotspot_x ||
> +           old_vps->cursor.legacy.hotspot_y !=3D
> +                   new_vps->cursor.legacy.hotspot_y)
> +               return true;
> +
> +       if (old_vps->base.fb !=3D new_vps->base.fb)
> +               return true;
> +
> +       return false;
> +}
> +
> +/**
> + * vmw_cursor_plane_prepare_fb - Readies the cursor by referencing it
> + *
> + * @plane:  display plane
> + * @new_state: info on the new plane state, including the FB
> + *
> + * Returns 0 on success
> + */
> +int vmw_cursor_plane_prepare_fb(struct drm_plane *plane,
> +                               struct drm_plane_state *new_state)
> +{
> +       struct drm_framebuffer *fb =3D new_state->fb;
> +       struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
> +       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(new_state)=
;
> +       struct vmw_plane_state *old_vps =3D vmw_plane_state_to_vps(plane-=
>state);
> +       struct vmw_private *vmw =3D vmw_priv(plane->dev);
> +       struct vmw_bo *bo =3D NULL;
> +       struct vmw_surface *surface;
> +       int ret =3D 0;
> +
> +       if (!vmw_user_object_is_null(&vps->uo)) {
> +               vmw_user_object_unmap(&vps->uo);
> +               vmw_user_object_unref(&vps->uo);
> +       }
> +
> +       if (fb) {
> +               if (vmw_framebuffer_to_vfb(fb)->bo) {
> +                       vps->uo.buffer =3D vmw_framebuffer_to_vfbd(fb)->b=
uffer;
> +                       vps->uo.surface =3D NULL;
> +               } else {
> +                       memcpy(&vps->uo, &vmw_framebuffer_to_vfbs(fb)->uo=
, sizeof(vps->uo));
> +               }
> +               vmw_user_object_ref(&vps->uo);
> +       }
> +
> +       vps->cursor.update_type =3D vmw_cursor_update_type(vmw, vps);
> +       switch (vps->cursor.update_type) {
> +       case VMW_CURSOR_UPDATE_LEGACY:
> +               surface =3D vmw_user_object_surface(&vps->uo);
> +               if (!surface || vps->cursor.legacy.id =3D=3D surface->sno=
oper.id)
> +                       vps->cursor.update_type =3D VMW_CURSOR_UPDATE_NON=
E;
> +               break;
> +       case VMW_CURSOR_UPDATE_MOB: {
> +               bo =3D vmw_user_object_buffer(&vps->uo);
> +               if (bo) {
> +                       struct ttm_operation_ctx ctx =3D { false, false }=
;
> +
> +                       ret =3D ttm_bo_reserve(&bo->tbo, true, false, NUL=
L);
> +                       if (ret !=3D 0)
> +                               return -ENOMEM;
> +
> +                       ret =3D ttm_bo_validate(&bo->tbo, &bo->placement,=
 &ctx);
> +                       if (ret !=3D 0)
> +                               return -ENOMEM;
> +
> +                       /*
> +                        * vmw_bo_pin_reserved also validates, so to skip
> +                        * the extra validation use ttm_bo_pin directly
> +                        */
> +                       if (!bo->tbo.pin_count)
> +                               ttm_bo_pin(&bo->tbo);
> +
> +                       if (vmw_framebuffer_to_vfb(fb)->bo) {
> +                               const u32 size =3D new_state->crtc_w *
> +                                                new_state->crtc_h *
> +                                                sizeof(u32);
> +
> +                               (void)vmw_bo_map_and_cache_size(bo, size)=
;
> +                       } else {
> +                               vmw_bo_map_and_cache(bo);
> +                       }
> +                       ttm_bo_unreserve(&bo->tbo);
> +               }
> +               if (!vmw_user_object_is_null(&vps->uo)) {
> +                       if (!vmw_cursor_plane_changed(vps, old_vps) &&
> +                           !vmw_cursor_buffer_changed(vps, old_vps)) {
> +                               vps->cursor.update_type =3D
> +                                       VMW_CURSOR_UPDATE_NONE;
> +                       } else {
> +                               vmw_cursor_mob_get(vcp, vps);
> +                               vmw_cursor_mob_map(vps);
> +                       }
> +               }
> +       }
> +               break;
> +       case VMW_CURSOR_UPDATE_NONE:
> +               /* do nothing */
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * vmw_cursor_plane_atomic_check - check if the new state is okay
> + *
> + * @plane: cursor plane
> + * @state: info on the new plane state
> + *
> + * This is a chance to fail if the new cursor state does not fit
> + * our requirements.
> + *
> + * Returns 0 on success
> + */
> +int vmw_cursor_plane_atomic_check(struct drm_plane *plane,
> +                                 struct drm_atomic_state *state)
> +{
> +       struct drm_plane_state *new_state =3D
> +               drm_atomic_get_new_plane_state(state, plane);
> +       struct vmw_private *vmw =3D vmw_priv(plane->dev);
> +       int ret =3D 0;
> +       struct drm_crtc_state *crtc_state =3D NULL;
> +       struct vmw_surface *surface =3D NULL;
> +       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(new_state)=
;
> +       enum vmw_cursor_update_type update_type;
> +       struct drm_framebuffer *fb =3D new_state->fb;
> +
> +       if (new_state->crtc)
> +               crtc_state =3D drm_atomic_get_new_crtc_state(new_state->s=
tate,
> +                                                          new_state->crt=
c);
> +
> +       ret =3D drm_atomic_helper_check_plane_state(new_state, crtc_state=
,
> +                                                 DRM_PLANE_NO_SCALING,
> +                                                 DRM_PLANE_NO_SCALING, t=
rue,
> +                                                 true);
> +       if (ret)
> +               return ret;
> +
> +       /* Turning off */
> +       if (!fb)
> +               return 0;
> +
> +       update_type =3D vmw_cursor_update_type(vmw, vps);
> +       if (update_type =3D=3D VMW_CURSOR_UPDATE_LEGACY) {
> +               if (new_state->crtc_w !=3D VMW_CURSOR_SNOOP_WIDTH ||
> +                   new_state->crtc_h !=3D VMW_CURSOR_SNOOP_HEIGHT) {
> +                       drm_warn(&vmw->drm,
> +                                "Invalid cursor dimensions (%d, %d)\n",
> +                                new_state->crtc_w, new_state->crtc_h);
> +                       return -EINVAL;
> +               }
> +               surface =3D vmw_user_object_surface(&vps->uo);
> +               if (!surface || !surface->snooper.image) {
> +                       drm_warn(&vmw->drm,
> +                                "surface not suitable for cursor\n");
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +void
> +vmw_cursor_plane_atomic_update(struct drm_plane *plane,
> +                              struct drm_atomic_state *state)
> +{
> +       struct drm_plane_state *new_state =3D
> +               drm_atomic_get_new_plane_state(state, plane);
> +       struct drm_plane_state *old_state =3D
> +               drm_atomic_get_old_plane_state(state, plane);
> +       struct drm_crtc *crtc =3D new_state->crtc ?: old_state->crtc;
> +       struct vmw_private *dev_priv =3D vmw_priv(plane->dev);
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(new_state)=
;
> +       s32 hotspot_x, hotspot_y, cursor_x, cursor_y;
> +
> +       /*
> +        * Hide the cursor if the new bo is null
> +        */
> +       if (vmw_user_object_is_null(&vps->uo)) {
> +               vmw_cursor_update_position(dev_priv, false, 0, 0);
> +               return;
> +       }
> +
> +       switch (vps->cursor.update_type) {
> +       case VMW_CURSOR_UPDATE_LEGACY:
> +               vmw_cursor_plane_update_legacy(dev_priv, vps);
> +               break;
> +       case VMW_CURSOR_UPDATE_MOB:
> +               vmw_cursor_update_mob(dev_priv, vps);
> +               break;
> +       case VMW_CURSOR_UPDATE_NONE:
> +               /* do nothing */
> +               break;
> +       }
> +
> +       /*
> +        * For all update types update the cursor position
> +        */
> +       cursor_x =3D new_state->crtc_x + du->set_gui_x;
> +       cursor_y =3D new_state->crtc_y + du->set_gui_y;
> +
> +       hotspot_x =3D vps->cursor.legacy.hotspot_x + new_state->hotspot_x=
;
> +       hotspot_y =3D vps->cursor.legacy.hotspot_y + new_state->hotspot_y=
;
> +
> +       vmw_cursor_update_position(dev_priv, true, cursor_x + hotspot_x,
> +                                  cursor_y + hotspot_y);
> +}
> +
> +int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
> +                               struct drm_file *file_priv)
> +{
> +       struct drm_vmw_cursor_bypass_arg *arg =3D data;
> +       struct vmw_display_unit *du;
> +       struct vmw_plane_state *vps;
> +       struct drm_crtc *crtc;
> +       int ret =3D 0;
> +
> +       mutex_lock(&dev->mode_config.mutex);
> +       if (arg->flags & DRM_VMW_CURSOR_BYPASS_ALL) {
> +               list_for_each_entry(crtc, &dev->mode_config.crtc_list, he=
ad) {
> +                       du =3D vmw_crtc_to_du(crtc);
> +                       vps =3D vmw_plane_state_to_vps(du->cursor.base.st=
ate);
> +                       vps->cursor.legacy.hotspot_x =3D arg->xhot;
> +                       vps->cursor.legacy.hotspot_y =3D arg->yhot;
> +               }
> +
> +               mutex_unlock(&dev->mode_config.mutex);
> +               return 0;
> +       }
> +
> +       crtc =3D drm_crtc_find(dev, file_priv, arg->crtc_id);
> +       if (!crtc) {
> +               ret =3D -ENOENT;
> +               goto out;
> +       }
> +
> +       du =3D vmw_crtc_to_du(crtc);
> +       vps =3D vmw_plane_state_to_vps(du->cursor.base.state);
> +       vps->cursor.legacy.hotspot_x =3D arg->xhot;
> +       vps->cursor.legacy.hotspot_y =3D arg->yhot;
> +
> +out:
> +       mutex_unlock(&dev->mode_config.mutex);
> +
> +       return ret;
> +}
> +
> +void *vmw_cursor_snooper_create(struct drm_file *file_priv,
> +                               struct vmw_surface_metadata *metadata)
> +{
> +       if (!file_priv->atomic && metadata->scanout &&
> +           metadata->num_sizes =3D=3D 1 &&
> +           metadata->sizes[0].width =3D=3D VMW_CURSOR_SNOOP_WIDTH &&
> +           metadata->sizes[0].height =3D=3D VMW_CURSOR_SNOOP_HEIGHT &&
> +           metadata->format =3D=3D VMW_CURSOR_SNOOP_FORMAT) {
> +               const struct SVGA3dSurfaceDesc *desc =3D
> +                       vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
> +               const u32 cursor_size_bytes =3D VMW_CURSOR_SNOOP_WIDTH *
> +                                             VMW_CURSOR_SNOOP_HEIGHT *
> +                                             desc->pitchBytesPerBlock;
> +               void *image =3D kzalloc(cursor_size_bytes, GFP_KERNEL);
> +
> +               if (!image) {
> +                       DRM_ERROR("Failed to allocate cursor_image\n");
> +                       return ERR_PTR(-ENOMEM);
> +               }
> +               return image;
> +       }
> +       return NULL;

If vmw_cursor_snooper_create() implies an IS_ERR ret-val check by
caller, as demonstrated in vmw_surface_define_ioctl() below,
are we sure we want to return a NULL value here and not some ERR_PTR?
A NULL could surprise some callers down the line.

> +}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_cursor_plane.h
> new file mode 100644
> index 000000000000..014a3df5e045
> --- /dev/null
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/***********************************************************************=
***
> + *
> + * Copyright (c) 2024 Broadcom. All Rights Reserved. The term
> + * =E2=80=9CBroadcom=E2=80=9D refers to Broadcom Inc. and/or its subsidi=
aries.
> + *
> + ***********************************************************************=
***/
> +
> +#ifndef VMWGFX_CURSOR_PLANE_H
> +#define VMWGFX_CURSOR_PLANE_H
> +
> +#include "device_include/svga3d_cmd.h"
> +#include "drm/drm_file.h"
> +#include "drm/drm_fourcc.h"
> +#include "drm/drm_plane.h"
> +
> +#include <linux/types.h>
> +
> +struct SVGA3dCmdHeader;
> +struct ttm_buffer_object;
> +struct vmw_bo;
> +struct vmw_cursor;
> +struct vmw_private;
> +struct vmw_surface;
> +struct vmw_user_object;
> +
> +#define vmw_plane_to_vcp(x) container_of(x, struct vmw_cursor_plane, bas=
e)
> +
> +static const u32 __maybe_unused vmw_cursor_plane_formats[] =3D {
> +       DRM_FORMAT_ARGB8888,
> +};
> +
> +enum vmw_cursor_update_type {
> +       VMW_CURSOR_UPDATE_NONE =3D 0,
> +       VMW_CURSOR_UPDATE_LEGACY,
> +       VMW_CURSOR_UPDATE_MOB,
> +};
> +
> +struct vmw_cursor_plane_state {
> +       enum vmw_cursor_update_type update_type;
> +       bool changed;
> +       bool surface_changed;
> +       struct vmw_bo *mob;
> +       struct {
> +               s32 hotspot_x;
> +               s32 hotspot_y;
> +               u32 id;
> +       } legacy;
> +};
> +
> +/**
> + * Derived class for cursor plane object
> + *
> + * @base DRM plane object
> + * @cursor.cursor_mobs Cursor mobs available for re-use
> + */
> +struct vmw_cursor_plane {
> +       struct drm_plane base;
> +
> +       struct vmw_bo *cursor_mobs[3];
> +};
> +
> +struct vmw_surface_metadata;
> +void *vmw_cursor_snooper_create(struct drm_file *file_priv,
> +                               struct vmw_surface_metadata *metadata);
> +void vmw_cursor_cmd_dma_snoop(SVGA3dCmdHeader *header,
> +                             struct vmw_surface *srf,
> +                             struct ttm_buffer_object *bo);
> +
> +void vmw_cursor_plane_destroy(struct drm_plane *plane);
> +
> +int vmw_cursor_plane_atomic_check(struct drm_plane *plane,
> +                                 struct drm_atomic_state *state);
> +void vmw_cursor_plane_atomic_update(struct drm_plane *plane,
> +                                   struct drm_atomic_state *state);
> +int vmw_cursor_plane_prepare_fb(struct drm_plane *plane,
> +                               struct drm_plane_state *new_state);
> +void vmw_cursor_plane_cleanup_fb(struct drm_plane *plane,
> +                                struct drm_plane_state *old_state);
> +
> +#endif /* VMWGFX_CURSOR_H */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 0f32471c8533..e306d70974b0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1324,9 +1324,6 @@ static void vmw_master_set(struct drm_device *dev,
>  static void vmw_master_drop(struct drm_device *dev,
>                             struct drm_file *file_priv)
>  {
> -       struct vmw_private *dev_priv =3D vmw_priv(dev);
> -
> -       vmw_kms_legacy_hotspot_clear(dev_priv);
>  }
>
>  bool vmwgfx_supported(struct vmw_private *vmw)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 5275ef632d4b..09ffb49970c9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -100,10 +100,6 @@
>  #define VMW_RES_SHADER ttm_driver_type4
>  #define VMW_RES_HT_ORDER 12
>
> -#define VMW_CURSOR_SNOOP_FORMAT SVGA3D_A8R8G8B8
> -#define VMW_CURSOR_SNOOP_WIDTH 64
> -#define VMW_CURSOR_SNOOP_HEIGHT 64
> -
>  #define MKSSTAT_CAPACITY_LOG2 5U
>  #define MKSSTAT_CAPACITY (1U << MKSSTAT_CAPACITY_LOG2)
>
> @@ -201,7 +197,7 @@ enum vmw_cmdbuf_res_type {
>  struct vmw_cmdbuf_res_manager;
>
>  struct vmw_cursor_snooper {
> -       size_t age;
> +       size_t id;
>         uint32_t *image;
>  };
>
> @@ -1050,7 +1046,6 @@ int vmw_kms_init(struct vmw_private *dev_priv);
>  int vmw_kms_close(struct vmw_private *dev_priv);
>  int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
>                                 struct drm_file *file_priv);
> -void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv);
>  void vmw_kms_cursor_snoop(struct vmw_surface *srf,
>                           struct ttm_object_file *tfile,
>                           struct ttm_buffer_object *bo,
> @@ -1067,7 +1062,6 @@ int vmw_kms_present(struct vmw_private *dev_priv,
>                     uint32_t num_clips);
>  int vmw_kms_update_layout_ioctl(struct drm_device *dev, void *data,
>                                 struct drm_file *file_priv);
> -void vmw_kms_legacy_hotspot_clear(struct vmw_private *dev_priv);
>  int vmw_kms_suspend(struct drm_device *dev);
>  int vmw_kms_resume(struct drm_device *dev);
>  void vmw_kms_lost_device(struct drm_device *dev);
> @@ -1393,8 +1387,10 @@ int vmw_mksstat_remove_all(struct vmw_private *dev=
_priv);
>         DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
>
>  /* Resource dirtying - vmwgfx_page_dirty.c */
> +bool vmw_bo_is_dirty(struct vmw_bo *vbo);
>  void vmw_bo_dirty_scan(struct vmw_bo *vbo);
>  int vmw_bo_dirty_add(struct vmw_bo *vbo);
> +void vmw_bo_dirty_clear(struct vmw_bo *vbo);
>  void vmw_bo_dirty_transfer_to_res(struct vmw_resource *res);
>  void vmw_bo_dirty_clear_res(struct vmw_resource *res);
>  void vmw_bo_dirty_release(struct vmw_bo *vbo);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index 2e52d73eba48..20ca28ddbb9f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -4512,8 +4512,6 @@ int vmw_execbuf_ioctl(struct drm_device *dev, void =
*data,
>         if (unlikely(ret !=3D 0))
>                 goto out;
>
> -       vmw_kms_cursor_post_execbuf(dev_priv);
> -
>  out:
>         if (in_fence)
>                 dma_fence_put(in_fence);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index 1912ac1cde6d..d8937f3de514 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -28,6 +28,7 @@
>  #include "vmwgfx_kms.h"
>
>  #include "vmwgfx_bo.h"
> +#include "vmwgfx_resource_priv.h"
>  #include "vmwgfx_vkms.h"
>  #include "vmw_surface_cache.h"
>
> @@ -59,474 +60,6 @@ void vmw_du_cleanup(struct vmw_display_unit *du)
>         drm_connector_cleanup(&du->connector);
>  }
>
> -/*
> - * Display Unit Cursor functions
> - */
> -
> -static int vmw_du_cursor_plane_unmap_cm(struct vmw_plane_state *vps);
> -static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
> -                                 struct vmw_plane_state *vps,
> -                                 u32 *image, u32 width, u32 height,
> -                                 u32 hotspotX, u32 hotspotY);
> -
> -struct vmw_svga_fifo_cmd_define_cursor {
> -       u32 cmd;
> -       SVGAFifoCmdDefineAlphaCursor cursor;
> -};
> -
> -/**
> - * vmw_send_define_cursor_cmd - queue a define cursor command
> - * @dev_priv: the private driver struct
> - * @image: buffer which holds the cursor image
> - * @width: width of the mouse cursor image
> - * @height: height of the mouse cursor image
> - * @hotspotX: the horizontal position of mouse hotspot
> - * @hotspotY: the vertical position of mouse hotspot
> - */
> -static void vmw_send_define_cursor_cmd(struct vmw_private *dev_priv,
> -                                      u32 *image, u32 width, u32 height,
> -                                      u32 hotspotX, u32 hotspotY)
> -{
> -       struct vmw_svga_fifo_cmd_define_cursor *cmd;
> -       const u32 image_size =3D width * height * sizeof(*image);
> -       const u32 cmd_size =3D sizeof(*cmd) + image_size;
> -
> -       /* Try to reserve fifocmd space and swallow any failures;
> -          such reservations cannot be left unconsumed for long
> -          under the risk of clogging other fifocmd users, so
> -          we treat reservations separtely from the way we treat
> -          other fallible KMS-atomic resources at prepare_fb */
> -       cmd =3D VMW_CMD_RESERVE(dev_priv, cmd_size);
> -
> -       if (unlikely(!cmd))
> -               return;
> -
> -       memset(cmd, 0, sizeof(*cmd));
> -
> -       memcpy(&cmd[1], image, image_size);
> -
> -       cmd->cmd =3D SVGA_CMD_DEFINE_ALPHA_CURSOR;
> -       cmd->cursor.id =3D 0;
> -       cmd->cursor.width =3D width;
> -       cmd->cursor.height =3D height;
> -       cmd->cursor.hotspotX =3D hotspotX;
> -       cmd->cursor.hotspotY =3D hotspotY;
> -
> -       vmw_cmd_commit_flush(dev_priv, cmd_size);
> -}
> -
> -/**
> - * vmw_cursor_update_image - update the cursor image on the provided pla=
ne
> - * @dev_priv: the private driver struct
> - * @vps: the plane state of the cursor plane
> - * @image: buffer which holds the cursor image
> - * @width: width of the mouse cursor image
> - * @height: height of the mouse cursor image
> - * @hotspotX: the horizontal position of mouse hotspot
> - * @hotspotY: the vertical position of mouse hotspot
> - */
> -static void vmw_cursor_update_image(struct vmw_private *dev_priv,
> -                                   struct vmw_plane_state *vps,
> -                                   u32 *image, u32 width, u32 height,
> -                                   u32 hotspotX, u32 hotspotY)
> -{
> -       if (vps->cursor.bo)
> -               vmw_cursor_update_mob(dev_priv, vps, image,
> -                                     vps->base.crtc_w, vps->base.crtc_h,
> -                                     hotspotX, hotspotY);
> -
> -       else
> -               vmw_send_define_cursor_cmd(dev_priv, image, width, height=
,
> -                                          hotspotX, hotspotY);
> -}
> -
> -
> -/**
> - * vmw_cursor_update_mob - Update cursor vis CursorMob mechanism
> - *
> - * Called from inside vmw_du_cursor_plane_atomic_update to actually
> - * make the cursor-image live.
> - *
> - * @dev_priv: device to work with
> - * @vps: the plane state of the cursor plane
> - * @image: cursor source data to fill the MOB with
> - * @width: source data width
> - * @height: source data height
> - * @hotspotX: cursor hotspot x
> - * @hotspotY: cursor hotspot Y
> - */
> -static void vmw_cursor_update_mob(struct vmw_private *dev_priv,
> -                                 struct vmw_plane_state *vps,
> -                                 u32 *image, u32 width, u32 height,
> -                                 u32 hotspotX, u32 hotspotY)
> -{
> -       SVGAGBCursorHeader *header;
> -       SVGAGBAlphaCursorHeader *alpha_header;
> -       const u32 image_size =3D width * height * sizeof(*image);
> -
> -       header =3D vmw_bo_map_and_cache(vps->cursor.bo);
> -       alpha_header =3D &header->header.alphaHeader;
> -
> -       memset(header, 0, sizeof(*header));
> -
> -       header->type =3D SVGA_ALPHA_CURSOR;
> -       header->sizeInBytes =3D image_size;
> -
> -       alpha_header->hotspotX =3D hotspotX;
> -       alpha_header->hotspotY =3D hotspotY;
> -       alpha_header->width =3D width;
> -       alpha_header->height =3D height;
> -
> -       memcpy(header + 1, image, image_size);
> -       vmw_write(dev_priv, SVGA_REG_CURSOR_MOBID,
> -                 vps->cursor.bo->tbo.resource->start);
> -}
> -
> -
> -static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
> -{
> -       return w * h * sizeof(u32) + sizeof(SVGAGBCursorHeader);
> -}
> -
> -/**
> - * vmw_du_cursor_plane_acquire_image -- Acquire the image data
> - * @vps: cursor plane state
> - */
> -static u32 *vmw_du_cursor_plane_acquire_image(struct vmw_plane_state *vp=
s)
> -{
> -       struct vmw_surface *surf;
> -
> -       if (vmw_user_object_is_null(&vps->uo))
> -               return NULL;
> -
> -       surf =3D vmw_user_object_surface(&vps->uo);
> -       if (surf && !vmw_user_object_is_mapped(&vps->uo))
> -               return surf->snooper.image;
> -
> -       return vmw_user_object_map(&vps->uo);
> -}
> -
> -static bool vmw_du_cursor_plane_has_changed(struct vmw_plane_state *old_=
vps,
> -                                           struct vmw_plane_state *new_v=
ps)
> -{
> -       void *old_image;
> -       void *new_image;
> -       u32 size;
> -       bool changed;
> -
> -       if (old_vps->base.crtc_w !=3D new_vps->base.crtc_w ||
> -           old_vps->base.crtc_h !=3D new_vps->base.crtc_h)
> -           return true;
> -
> -       if (old_vps->cursor.hotspot_x !=3D new_vps->cursor.hotspot_x ||
> -           old_vps->cursor.hotspot_y !=3D new_vps->cursor.hotspot_y)
> -           return true;
> -
> -       size =3D new_vps->base.crtc_w * new_vps->base.crtc_h * sizeof(u32=
);
> -
> -       old_image =3D vmw_du_cursor_plane_acquire_image(old_vps);
> -       new_image =3D vmw_du_cursor_plane_acquire_image(new_vps);
> -
> -       changed =3D false;
> -       if (old_image && new_image && old_image !=3D new_image)
> -               changed =3D memcmp(old_image, new_image, size) !=3D 0;
> -
> -       return changed;
> -}
> -
> -static void vmw_du_destroy_cursor_mob(struct vmw_bo **vbo)
> -{
> -       if (!(*vbo))
> -               return;
> -
> -       ttm_bo_unpin(&(*vbo)->tbo);
> -       vmw_bo_unreference(vbo);
> -}
> -
> -static void vmw_du_put_cursor_mob(struct vmw_cursor_plane *vcp,
> -                                 struct vmw_plane_state *vps)
> -{
> -       u32 i;
> -
> -       if (!vps->cursor.bo)
> -               return;
> -
> -       vmw_du_cursor_plane_unmap_cm(vps);
> -
> -       /* Look for a free slot to return this mob to the cache. */
> -       for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
> -               if (!vcp->cursor_mobs[i]) {
> -                       vcp->cursor_mobs[i] =3D vps->cursor.bo;
> -                       vps->cursor.bo =3D NULL;
> -                       return;
> -               }
> -       }
> -
> -       /* Cache is full: See if this mob is bigger than an existing mob.=
 */
> -       for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
> -               if (vcp->cursor_mobs[i]->tbo.base.size <
> -                   vps->cursor.bo->tbo.base.size) {
> -                       vmw_du_destroy_cursor_mob(&vcp->cursor_mobs[i]);
> -                       vcp->cursor_mobs[i] =3D vps->cursor.bo;
> -                       vps->cursor.bo =3D NULL;
> -                       return;
> -               }
> -       }
> -
> -       /* Destroy it if it's not worth caching. */
> -       vmw_du_destroy_cursor_mob(&vps->cursor.bo);
> -}
> -
> -static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
> -                                struct vmw_plane_state *vps)
> -{
> -       struct vmw_private *dev_priv =3D vmw_priv(vcp->base.dev);
> -       u32 size =3D vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.c=
rtc_h);
> -       u32 i;
> -       u32 cursor_max_dim, mob_max_size;
> -       struct vmw_fence_obj *fence =3D NULL;
> -       int ret;
> -
> -       if (!dev_priv->has_mob ||
> -           (dev_priv->capabilities2 & SVGA_CAP2_CURSOR_MOB) =3D=3D 0)
> -               return -EINVAL;
> -
> -       mob_max_size =3D vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
> -       cursor_max_dim =3D vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSI=
ON);
> -
> -       if (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
> -           vps->base.crtc_h > cursor_max_dim)
> -               return -EINVAL;
> -
> -       if (vps->cursor.bo) {
> -               if (vps->cursor.bo->tbo.base.size >=3D size)
> -                       return 0;
> -               vmw_du_put_cursor_mob(vcp, vps);
> -       }
> -
> -       /* Look for an unused mob in the cache. */
> -       for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++) {
> -               if (vcp->cursor_mobs[i] &&
> -                   vcp->cursor_mobs[i]->tbo.base.size >=3D size) {
> -                       vps->cursor.bo =3D vcp->cursor_mobs[i];
> -                       vcp->cursor_mobs[i] =3D NULL;
> -                       return 0;
> -               }
> -       }
> -       /* Create a new mob if we can't find an existing one. */
> -       ret =3D vmw_bo_create_and_populate(dev_priv, size,
> -                                        VMW_BO_DOMAIN_MOB,
> -                                        &vps->cursor.bo);
> -
> -       if (ret !=3D 0)
> -               return ret;
> -
> -       /* Fence the mob creation so we are guarateed to have the mob */
> -       ret =3D ttm_bo_reserve(&vps->cursor.bo->tbo, false, false, NULL);
> -       if (ret !=3D 0)
> -               goto teardown;
> -
> -       ret =3D vmw_execbuf_fence_commands(NULL, dev_priv, &fence, NULL);
> -       if (ret !=3D 0) {
> -               ttm_bo_unreserve(&vps->cursor.bo->tbo);
> -               goto teardown;
> -       }
> -
> -       dma_fence_wait(&fence->base, false);
> -       dma_fence_put(&fence->base);
> -
> -       ttm_bo_unreserve(&vps->cursor.bo->tbo);
> -       return 0;
> -
> -teardown:
> -       vmw_du_destroy_cursor_mob(&vps->cursor.bo);
> -       return ret;
> -}
> -
> -
> -static void vmw_cursor_update_position(struct vmw_private *dev_priv,
> -                                      bool show, int x, int y)
> -{
> -       const uint32_t svga_cursor_on =3D show ? SVGA_CURSOR_ON_SHOW
> -                                            : SVGA_CURSOR_ON_HIDE;
> -       uint32_t count;
> -
> -       spin_lock(&dev_priv->cursor_lock);
> -       if (dev_priv->capabilities2 & SVGA_CAP2_EXTRA_REGS) {
> -               vmw_write(dev_priv, SVGA_REG_CURSOR4_X, x);
> -               vmw_write(dev_priv, SVGA_REG_CURSOR4_Y, y);
> -               vmw_write(dev_priv, SVGA_REG_CURSOR4_SCREEN_ID, SVGA3D_IN=
VALID_ID);
> -               vmw_write(dev_priv, SVGA_REG_CURSOR4_ON, svga_cursor_on);
> -               vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, 1);
> -       } else if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
> -               vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, svga_cu=
rsor_on);
> -               vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
> -               vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_Y, y);
> -               count =3D vmw_fifo_mem_read(dev_priv, SVGA_FIFO_CURSOR_CO=
UNT);
> -               vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_COUNT, ++co=
unt);
> -       } else {
> -               vmw_write(dev_priv, SVGA_REG_CURSOR_X, x);
> -               vmw_write(dev_priv, SVGA_REG_CURSOR_Y, y);
> -               vmw_write(dev_priv, SVGA_REG_CURSOR_ON, svga_cursor_on);
> -       }
> -       spin_unlock(&dev_priv->cursor_lock);
> -}
> -
> -void vmw_kms_cursor_snoop(struct vmw_surface *srf,
> -                         struct ttm_object_file *tfile,
> -                         struct ttm_buffer_object *bo,
> -                         SVGA3dCmdHeader *header)
> -{
> -       struct ttm_bo_kmap_obj map;
> -       unsigned long kmap_offset;
> -       unsigned long kmap_num;
> -       SVGA3dCopyBox *box;
> -       unsigned box_count;
> -       void *virtual;
> -       bool is_iomem;
> -       struct vmw_dma_cmd {
> -               SVGA3dCmdHeader header;
> -               SVGA3dCmdSurfaceDMA dma;
> -       } *cmd;
> -       int i, ret;
> -       const struct SVGA3dSurfaceDesc *desc =3D
> -               vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
> -       const u32 image_pitch =3D VMW_CURSOR_SNOOP_WIDTH * desc->pitchByt=
esPerBlock;
> -
> -       cmd =3D container_of(header, struct vmw_dma_cmd, header);
> -
> -       /* No snooper installed, nothing to copy */
> -       if (!srf->snooper.image)
> -               return;
> -
> -       if (cmd->dma.host.face !=3D 0 || cmd->dma.host.mipmap !=3D 0) {
> -               DRM_ERROR("face and mipmap for cursors should never !=3D =
0\n");
> -               return;
> -       }
> -
> -       if (cmd->header.size < 64) {
> -               DRM_ERROR("at least one full copy box must be given\n");
> -               return;
> -       }
> -
> -       box =3D (SVGA3dCopyBox *)&cmd[1];
> -       box_count =3D (cmd->header.size - sizeof(SVGA3dCmdSurfaceDMA)) /
> -                       sizeof(SVGA3dCopyBox);
> -
> -       if (cmd->dma.guest.ptr.offset % PAGE_SIZE ||
> -           box->x !=3D 0    || box->y !=3D 0    || box->z !=3D 0    ||
> -           box->srcx !=3D 0 || box->srcy !=3D 0 || box->srcz !=3D 0 ||
> -           box->d !=3D 1    || box_count !=3D 1 ||
> -           box->w > VMW_CURSOR_SNOOP_WIDTH || box->h > VMW_CURSOR_SNOOP_=
HEIGHT) {
> -               /* TODO handle none page aligned offsets */
> -               /* TODO handle more dst & src !=3D 0 */
> -               /* TODO handle more then one copy */
> -               DRM_ERROR("Can't snoop dma request for cursor!\n");
> -               DRM_ERROR("(%u, %u, %u) (%u, %u, %u) (%ux%ux%u) %u %u\n",
> -                         box->srcx, box->srcy, box->srcz,
> -                         box->x, box->y, box->z,
> -                         box->w, box->h, box->d, box_count,
> -                         cmd->dma.guest.ptr.offset);
> -               return;
> -       }
> -
> -       kmap_offset =3D cmd->dma.guest.ptr.offset >> PAGE_SHIFT;
> -       kmap_num =3D (VMW_CURSOR_SNOOP_HEIGHT*image_pitch) >> PAGE_SHIFT;
> -
> -       ret =3D ttm_bo_reserve(bo, true, false, NULL);
> -       if (unlikely(ret !=3D 0)) {
> -               DRM_ERROR("reserve failed\n");
> -               return;
> -       }
> -
> -       ret =3D ttm_bo_kmap(bo, kmap_offset, kmap_num, &map);
> -       if (unlikely(ret !=3D 0))
> -               goto err_unreserve;
> -
> -       virtual =3D ttm_kmap_obj_virtual(&map, &is_iomem);
> -
> -       if (box->w =3D=3D VMW_CURSOR_SNOOP_WIDTH && cmd->dma.guest.pitch =
=3D=3D image_pitch) {
> -               memcpy(srf->snooper.image, virtual,
> -                      VMW_CURSOR_SNOOP_HEIGHT*image_pitch);
> -       } else {
> -               /* Image is unsigned pointer. */
> -               for (i =3D 0; i < box->h; i++)
> -                       memcpy(srf->snooper.image + i * image_pitch,
> -                              virtual + i * cmd->dma.guest.pitch,
> -                              box->w * desc->pitchBytesPerBlock);
> -       }
> -
> -       srf->snooper.age++;
> -
> -       ttm_bo_kunmap(&map);
> -err_unreserve:
> -       ttm_bo_unreserve(bo);
> -}
> -
> -/**
> - * vmw_kms_legacy_hotspot_clear - Clear legacy hotspots
> - *
> - * @dev_priv: Pointer to the device private struct.
> - *
> - * Clears all legacy hotspots.
> - */
> -void vmw_kms_legacy_hotspot_clear(struct vmw_private *dev_priv)
> -{
> -       struct drm_device *dev =3D &dev_priv->drm;
> -       struct vmw_display_unit *du;
> -       struct drm_crtc *crtc;
> -
> -       drm_modeset_lock_all(dev);
> -       drm_for_each_crtc(crtc, dev) {
> -               du =3D vmw_crtc_to_du(crtc);
> -
> -               du->hotspot_x =3D 0;
> -               du->hotspot_y =3D 0;
> -       }
> -       drm_modeset_unlock_all(dev);
> -}
> -
> -void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv)
> -{
> -       struct drm_device *dev =3D &dev_priv->drm;
> -       struct vmw_display_unit *du;
> -       struct drm_crtc *crtc;
> -
> -       mutex_lock(&dev->mode_config.mutex);
> -
> -       list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -               du =3D vmw_crtc_to_du(crtc);
> -               if (!du->cursor_surface ||
> -                   du->cursor_age =3D=3D du->cursor_surface->snooper.age=
 ||
> -                   !du->cursor_surface->snooper.image)
> -                       continue;
> -
> -               du->cursor_age =3D du->cursor_surface->snooper.age;
> -               vmw_send_define_cursor_cmd(dev_priv,
> -                                          du->cursor_surface->snooper.im=
age,
> -                                          VMW_CURSOR_SNOOP_WIDTH,
> -                                          VMW_CURSOR_SNOOP_HEIGHT,
> -                                          du->hotspot_x + du->core_hotsp=
ot_x,
> -                                          du->hotspot_y + du->core_hotsp=
ot_y);
> -       }
> -
> -       mutex_unlock(&dev->mode_config.mutex);
> -}
> -
> -
> -void vmw_du_cursor_plane_destroy(struct drm_plane *plane)
> -{
> -       struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
> -       u32 i;
> -
> -       vmw_cursor_update_position(vmw_priv(plane->dev), false, 0, 0);
> -
> -       for (i =3D 0; i < ARRAY_SIZE(vcp->cursor_mobs); i++)
> -               vmw_du_destroy_cursor_mob(&vcp->cursor_mobs[i]);
> -
> -       drm_plane_cleanup(plane);
> -}
> -
>
>  void vmw_du_primary_plane_destroy(struct drm_plane *plane)
>  {
> @@ -574,262 +107,6 @@ vmw_du_plane_cleanup_fb(struct drm_plane *plane,
>  }
>
>
> -/**
> - * vmw_du_cursor_plane_map_cm - Maps the cursor mobs.
> - *
> - * @vps: plane_state
> - *
> - * Returns 0 on success
> - */
> -
> -static int
> -vmw_du_cursor_plane_map_cm(struct vmw_plane_state *vps)
> -{
> -       int ret;
> -       u32 size =3D vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.c=
rtc_h);
> -       struct ttm_buffer_object *bo;
> -
> -       if (!vps->cursor.bo)
> -               return -EINVAL;
> -
> -       bo =3D &vps->cursor.bo->tbo;
> -
> -       if (bo->base.size < size)
> -               return -EINVAL;
> -
> -       if (vps->cursor.bo->map.virtual)
> -               return 0;
> -
> -       ret =3D ttm_bo_reserve(bo, false, false, NULL);
> -       if (unlikely(ret !=3D 0))
> -               return -ENOMEM;
> -
> -       vmw_bo_map_and_cache(vps->cursor.bo);
> -
> -       ttm_bo_unreserve(bo);
> -
> -       if (unlikely(ret !=3D 0))
> -               return -ENOMEM;
> -
> -       return 0;
> -}
> -
> -
> -/**
> - * vmw_du_cursor_plane_unmap_cm - Unmaps the cursor mobs.
> - *
> - * @vps: state of the cursor plane
> - *
> - * Returns 0 on success
> - */
> -
> -static int
> -vmw_du_cursor_plane_unmap_cm(struct vmw_plane_state *vps)
> -{
> -       int ret =3D 0;
> -       struct vmw_bo *vbo =3D vps->cursor.bo;
> -
> -       if (!vbo || !vbo->map.virtual)
> -               return 0;
> -
> -       ret =3D ttm_bo_reserve(&vbo->tbo, true, false, NULL);
> -       if (likely(ret =3D=3D 0)) {
> -               vmw_bo_unmap(vbo);
> -               ttm_bo_unreserve(&vbo->tbo);
> -       }
> -
> -       return ret;
> -}
> -
> -
> -/**
> - * vmw_du_cursor_plane_cleanup_fb - Unpins the plane surface
> - *
> - * @plane: cursor plane
> - * @old_state: contains the state to clean up
> - *
> - * Unmaps all cursor bo mappings and unpins the cursor surface
> - *
> - * Returns 0 on success
> - */
> -void
> -vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
> -                              struct drm_plane_state *old_state)
> -{
> -       struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
> -       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(old_state)=
;
> -
> -       if (!vmw_user_object_is_null(&vps->uo))
> -               vmw_user_object_unmap(&vps->uo);
> -
> -       vmw_du_cursor_plane_unmap_cm(vps);
> -       vmw_du_put_cursor_mob(vcp, vps);
> -
> -       vmw_du_plane_unpin_surf(vps);
> -       vmw_user_object_unref(&vps->uo);
> -}
> -
> -
> -/**
> - * vmw_du_cursor_plane_prepare_fb - Readies the cursor by referencing it
> - *
> - * @plane:  display plane
> - * @new_state: info on the new plane state, including the FB
> - *
> - * Returns 0 on success
> - */
> -int
> -vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
> -                              struct drm_plane_state *new_state)
> -{
> -       struct drm_framebuffer *fb =3D new_state->fb;
> -       struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
> -       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(new_state)=
;
> -       struct vmw_bo *bo =3D NULL;
> -       int ret =3D 0;
> -
> -       if (!vmw_user_object_is_null(&vps->uo)) {
> -               vmw_user_object_unmap(&vps->uo);
> -               vmw_user_object_unref(&vps->uo);
> -       }
> -
> -       if (fb) {
> -               if (vmw_framebuffer_to_vfb(fb)->bo) {
> -                       vps->uo.buffer =3D vmw_framebuffer_to_vfbd(fb)->b=
uffer;
> -                       vps->uo.surface =3D NULL;
> -               } else {
> -                       memcpy(&vps->uo, &vmw_framebuffer_to_vfbs(fb)->uo=
, sizeof(vps->uo));
> -               }
> -               vmw_user_object_ref(&vps->uo);
> -       }
> -
> -       bo =3D vmw_user_object_buffer(&vps->uo);
> -       if (bo) {
> -               struct ttm_operation_ctx ctx =3D {false, false};
> -
> -               ret =3D ttm_bo_reserve(&bo->tbo, true, false, NULL);
> -               if (ret !=3D 0)
> -                       return -ENOMEM;
> -
> -               ret =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
> -               if (ret !=3D 0)
> -                       return -ENOMEM;
> -
> -               vmw_bo_pin_reserved(bo, true);
> -               if (vmw_framebuffer_to_vfb(fb)->bo) {
> -                       const u32 size =3D new_state->crtc_w * new_state-=
>crtc_h * sizeof(u32);
> -
> -                       (void)vmw_bo_map_and_cache_size(bo, size);
> -               } else {
> -                       vmw_bo_map_and_cache(bo);
> -               }
> -               ttm_bo_unreserve(&bo->tbo);
> -       }
> -
> -       if (!vmw_user_object_is_null(&vps->uo)) {
> -               vmw_du_get_cursor_mob(vcp, vps);
> -               vmw_du_cursor_plane_map_cm(vps);
> -       }
> -
> -       return 0;
> -}
> -
> -
> -void
> -vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
> -                                 struct drm_atomic_state *state)
> -{
> -       struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
> -                                                                        =
  plane);
> -       struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_st=
ate(state,
> -                                                                        =
  plane);
> -       struct drm_crtc *crtc =3D new_state->crtc ?: old_state->crtc;
> -       struct vmw_private *dev_priv =3D vmw_priv(crtc->dev);
> -       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> -       struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(new_state)=
;
> -       struct vmw_plane_state *old_vps =3D vmw_plane_state_to_vps(old_st=
ate);
> -       struct vmw_bo *old_bo =3D NULL;
> -       struct vmw_bo *new_bo =3D NULL;
> -       struct ww_acquire_ctx ctx;
> -       s32 hotspot_x, hotspot_y;
> -       int ret;
> -
> -       hotspot_x =3D du->hotspot_x + new_state->hotspot_x;
> -       hotspot_y =3D du->hotspot_y + new_state->hotspot_y;
> -
> -       du->cursor_surface =3D vmw_user_object_surface(&vps->uo);
> -
> -       if (vmw_user_object_is_null(&vps->uo)) {
> -               vmw_cursor_update_position(dev_priv, false, 0, 0);
> -               return;
> -       }
> -
> -       vps->cursor.hotspot_x =3D hotspot_x;
> -       vps->cursor.hotspot_y =3D hotspot_y;
> -
> -       if (du->cursor_surface)
> -               du->cursor_age =3D du->cursor_surface->snooper.age;
> -
> -       ww_acquire_init(&ctx, &reservation_ww_class);
> -
> -       if (!vmw_user_object_is_null(&old_vps->uo)) {
> -               old_bo =3D vmw_user_object_buffer(&old_vps->uo);
> -               ret =3D ttm_bo_reserve(&old_bo->tbo, false, false, &ctx);
> -               if (ret !=3D 0)
> -                       return;
> -       }
> -
> -       if (!vmw_user_object_is_null(&vps->uo)) {
> -               new_bo =3D vmw_user_object_buffer(&vps->uo);
> -               if (old_bo !=3D new_bo) {
> -                       ret =3D ttm_bo_reserve(&new_bo->tbo, false, false=
, &ctx);
> -                       if (ret !=3D 0) {
> -                               if (old_bo) {
> -                                       ttm_bo_unreserve(&old_bo->tbo);
> -                                       ww_acquire_fini(&ctx);
> -                               }
> -                               return;
> -                       }
> -               } else {
> -                       new_bo =3D NULL;
> -               }
> -       }
> -       if (!vmw_du_cursor_plane_has_changed(old_vps, vps)) {
> -               /*
> -                * If it hasn't changed, avoid making the device do extra
> -                * work by keeping the old cursor active.
> -                */
> -               struct vmw_cursor_plane_state tmp =3D old_vps->cursor;
> -               old_vps->cursor =3D vps->cursor;
> -               vps->cursor =3D tmp;
> -       } else {
> -               void *image =3D vmw_du_cursor_plane_acquire_image(vps);
> -               if (image)
> -                       vmw_cursor_update_image(dev_priv, vps, image,
> -                                               new_state->crtc_w,
> -                                               new_state->crtc_h,
> -                                               hotspot_x, hotspot_y);
> -       }
> -
> -       if (new_bo)
> -               ttm_bo_unreserve(&new_bo->tbo);
> -       if (old_bo)
> -               ttm_bo_unreserve(&old_bo->tbo);
> -
> -       ww_acquire_fini(&ctx);
> -
> -       du->cursor_x =3D new_state->crtc_x + du->set_gui_x;
> -       du->cursor_y =3D new_state->crtc_y + du->set_gui_y;
> -
> -       vmw_cursor_update_position(dev_priv, true,
> -                                  du->cursor_x + hotspot_x,
> -                                  du->cursor_y + hotspot_y);
> -
> -       du->core_hotspot_x =3D hotspot_x - du->hotspot_x;
> -       du->core_hotspot_y =3D hotspot_y - du->hotspot_y;
> -}
> -
> -
>  /**
>   * vmw_du_primary_plane_atomic_check - check if the new state is okay
>   *
> @@ -873,66 +150,6 @@ int vmw_du_primary_plane_atomic_check(struct drm_pla=
ne *plane,
>         return ret;
>  }
>
> -
> -/**
> - * vmw_du_cursor_plane_atomic_check - check if the new state is okay
> - *
> - * @plane: cursor plane
> - * @state: info on the new plane state
> - *
> - * This is a chance to fail if the new cursor state does not fit
> - * our requirements.
> - *
> - * Returns 0 on success
> - */
> -int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
> -                                    struct drm_atomic_state *state)
> -{
> -       struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
> -                                                                        =
  plane);
> -       int ret =3D 0;
> -       struct drm_crtc_state *crtc_state =3D NULL;
> -       struct vmw_surface *surface =3D NULL;
> -       struct drm_framebuffer *fb =3D new_state->fb;
> -
> -       if (new_state->crtc)
> -               crtc_state =3D drm_atomic_get_new_crtc_state(new_state->s=
tate,
> -                                                          new_state->crt=
c);
> -
> -       ret =3D drm_atomic_helper_check_plane_state(new_state, crtc_state=
,
> -                                                 DRM_PLANE_NO_SCALING,
> -                                                 DRM_PLANE_NO_SCALING,
> -                                                 true, true);
> -       if (ret)
> -               return ret;
> -
> -       /* Turning off */
> -       if (!fb)
> -               return 0;
> -
> -       /* A lot of the code assumes this */
> -       if (new_state->crtc_w !=3D 64 || new_state->crtc_h !=3D 64) {
> -               DRM_ERROR("Invalid cursor dimensions (%d, %d)\n",
> -                         new_state->crtc_w, new_state->crtc_h);
> -               return -EINVAL;
> -       }
> -
> -       if (!vmw_framebuffer_to_vfb(fb)->bo) {
> -               surface =3D vmw_user_object_surface(&vmw_framebuffer_to_v=
fbs(fb)->uo);
> -
> -               WARN_ON(!surface);
> -
> -               if (!surface ||
> -                   (!surface->snooper.image && !surface->res.guest_memor=
y_bo)) {
> -                       DRM_ERROR("surface not suitable for cursor\n");
> -                       return -EINVAL;
> -               }
> -       }
> -
> -       return 0;
> -}
> -
> -
>  int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
>                              struct drm_atomic_state *state)
>  {
> @@ -1076,7 +293,7 @@ vmw_du_plane_duplicate_state(struct drm_plane *plane=
)
>         vps->pinned =3D 0;
>         vps->cpp =3D 0;
>
> -       memset(&vps->cursor, 0, sizeof(vps->cursor));
> +       vps->cursor.mob =3D NULL;
>
>         /* Each ref counted resource needs to be acquired again */
>         vmw_user_object_ref(&vps->uo);
> @@ -1375,6 +592,7 @@ static void vmw_framebuffer_bo_destroy(struct drm_fr=
amebuffer *framebuffer)
>         struct vmw_framebuffer_bo *vfbd =3D
>                 vmw_framebuffer_to_vfbd(framebuffer);
>
> +       vmw_bo_dirty_release(vfbd->buffer);
>         drm_framebuffer_cleanup(framebuffer);
>         vmw_bo_unreference(&vfbd->buffer);
>
> @@ -1505,6 +723,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(str=
uct drm_device *dev,
>         struct vmw_private *dev_priv =3D vmw_priv(dev);
>         struct vmw_framebuffer *vfb =3D NULL;
>         struct vmw_user_object uo =3D {0};
> +       struct vmw_bo *bo;
> +       struct vmw_surface *surface;
>         int ret;
>
>         /* returns either a bo or surface */
> @@ -1534,6 +754,8 @@ static struct drm_framebuffer *vmw_kms_fb_create(str=
uct drm_device *dev,
>         }
>
>  err_out:
> +       bo =3D vmw_user_object_buffer(&uo);
> +       surface =3D vmw_user_object_surface(&uo);
>         /* vmw_user_object_lookup takes one ref so does new_fb */
>         vmw_user_object_unref(&uo);
>
> @@ -1542,6 +764,14 @@ static struct drm_framebuffer *vmw_kms_fb_create(st=
ruct drm_device *dev,
>                 return ERR_PTR(ret);
>         }
>
> +       ttm_bo_reserve(&bo->tbo, false, false, NULL);
> +       ret =3D vmw_bo_dirty_add(bo);
> +       if (!ret && surface && surface->res.func->dirty_alloc) {
> +               surface->res.coherent =3D true;
> +               ret =3D surface->res.func->dirty_alloc(&surface->res);
> +       }
> +       ttm_bo_unreserve(&bo->tbo);
> +
>         return &vfb->base;
>  }
>
> @@ -1974,44 +1204,6 @@ int vmw_kms_close(struct vmw_private *dev_priv)
>         return ret;
>  }
>
> -int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
> -                               struct drm_file *file_priv)
> -{
> -       struct drm_vmw_cursor_bypass_arg *arg =3D data;
> -       struct vmw_display_unit *du;
> -       struct drm_crtc *crtc;
> -       int ret =3D 0;
> -
> -       mutex_lock(&dev->mode_config.mutex);
> -       if (arg->flags & DRM_VMW_CURSOR_BYPASS_ALL) {
> -
> -               list_for_each_entry(crtc, &dev->mode_config.crtc_list, he=
ad) {
> -                       du =3D vmw_crtc_to_du(crtc);
> -                       du->hotspot_x =3D arg->xhot;
> -                       du->hotspot_y =3D arg->yhot;
> -               }
> -
> -               mutex_unlock(&dev->mode_config.mutex);
> -               return 0;
> -       }
> -
> -       crtc =3D drm_crtc_find(dev, file_priv, arg->crtc_id);
> -       if (!crtc) {
> -               ret =3D -ENOENT;
> -               goto out;
> -       }
> -
> -       du =3D vmw_crtc_to_du(crtc);
> -
> -       du->hotspot_x =3D arg->xhot;
> -       du->hotspot_y =3D arg->yhot;
> -
> -out:
> -       mutex_unlock(&dev->mode_config.mutex);
> -
> -       return ret;
> -}
> -
>  int vmw_kms_write_svga(struct vmw_private *vmw_priv,
>                         unsigned width, unsigned height, unsigned pitch,
>                         unsigned bpp, unsigned depth)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.h
> index 4eab581883e2..9668b5149aa5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -29,12 +29,13 @@
>  #ifndef VMWGFX_KMS_H_
>  #define VMWGFX_KMS_H_
>
> +#include "vmwgfx_cursor_plane.h"
> +#include "vmwgfx_drv.h"
> +
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_probe_helper.h>
>
> -#include "vmwgfx_drv.h"
> -
>  /**
>   * struct vmw_du_update_plane - Closure structure for vmw_du_helper_plan=
e_update
>   * @plane: Plane which is being updated.
> @@ -235,16 +236,11 @@ static const uint32_t __maybe_unused vmw_primary_pl=
ane_formats[] =3D {
>         DRM_FORMAT_XRGB1555,
>  };
>
> -static const uint32_t __maybe_unused vmw_cursor_plane_formats[] =3D {
> -       DRM_FORMAT_ARGB8888,
> -};
> -
>
>  #define vmw_crtc_state_to_vcs(x) container_of(x, struct vmw_crtc_state, =
base)
>  #define vmw_plane_state_to_vps(x) container_of(x, struct vmw_plane_state=
, base)
>  #define vmw_connector_state_to_vcs(x) \
>                 container_of(x, struct vmw_connector_state, base)
> -#define vmw_plane_to_vcp(x) container_of(x, struct vmw_cursor_plane, bas=
e)
>
>  /**
>   * Derived class for crtc state object
> @@ -255,11 +251,6 @@ struct vmw_crtc_state {
>         struct drm_crtc_state base;
>  };
>
> -struct vmw_cursor_plane_state {
> -       struct vmw_bo *bo;
> -       s32 hotspot_x;
> -       s32 hotspot_y;
> -};
>
>  /**
>   * Derived class for plane state object
> @@ -283,7 +274,6 @@ struct vmw_plane_state {
>         /* For CPU Blit */
>         unsigned int cpp;
>
> -       bool surf_mapped;
>         struct vmw_cursor_plane_state cursor;
>  };
>
> @@ -317,17 +307,6 @@ struct vmw_connector_state {
>         int gui_y;
>  };
>
> -/**
> - * Derived class for cursor plane object
> - *
> - * @base DRM plane object
> - * @cursor.cursor_mobs Cursor mobs available for re-use
> - */
> -struct vmw_cursor_plane {
> -       struct drm_plane base;
> -
> -       struct vmw_bo *cursor_mobs[3];
> -};
>
>  /**
>   * Base class display unit.
> @@ -343,17 +322,6 @@ struct vmw_display_unit {
>         struct drm_plane primary;
>         struct vmw_cursor_plane cursor;
>
> -       struct vmw_surface *cursor_surface;
> -       size_t cursor_age;
> -
> -       int cursor_x;
> -       int cursor_y;
> -
> -       int hotspot_x;
> -       int hotspot_y;
> -       s32 core_hotspot_x;
> -       s32 core_hotspot_y;
> -
>         unsigned unit;
>
>         /*
> @@ -403,8 +371,6 @@ struct vmw_display_unit {
>   */
>  void vmw_du_init(struct vmw_display_unit *du);
>  void vmw_du_cleanup(struct vmw_display_unit *du);
> -void vmw_du_crtc_save(struct drm_crtc *crtc);
> -void vmw_du_crtc_restore(struct drm_crtc *crtc);
>  int vmw_du_crtc_gamma_set(struct drm_crtc *crtc,
>                            u16 *r, u16 *g, u16 *b,
>                            uint32_t size,
> @@ -460,19 +426,10 @@ void vmw_kms_create_implicit_placement_property(str=
uct vmw_private *dev_priv);
>
>  /* Universal Plane Helpers */
>  void vmw_du_primary_plane_destroy(struct drm_plane *plane);
> -void vmw_du_cursor_plane_destroy(struct drm_plane *plane);
>
>  /* Atomic Helpers */
>  int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
>                                       struct drm_atomic_state *state);
> -int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
> -                                    struct drm_atomic_state *state);
> -void vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
> -                                      struct drm_atomic_state *state);
> -int vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
> -                                  struct drm_plane_state *new_state);
> -void vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
> -                            struct drm_plane_state *old_state);
>  void vmw_du_plane_cleanup_fb(struct drm_plane *plane,
>                              struct drm_plane_state *old_state);
>  void vmw_du_plane_reset(struct drm_plane *plane);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_ldu.c
> index f0b429525467..c23c9195f0dc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> @@ -372,7 +372,7 @@ static const struct drm_plane_funcs vmw_ldu_plane_fun=
cs =3D {
>  static const struct drm_plane_funcs vmw_ldu_cursor_funcs =3D {
>         .update_plane =3D drm_atomic_helper_update_plane,
>         .disable_plane =3D drm_atomic_helper_disable_plane,
> -       .destroy =3D vmw_du_cursor_plane_destroy,
> +       .destroy =3D vmw_cursor_plane_destroy,
>         .reset =3D vmw_du_plane_reset,
>         .atomic_duplicate_state =3D vmw_du_plane_duplicate_state,
>         .atomic_destroy_state =3D vmw_du_plane_destroy_state,
> @@ -383,10 +383,10 @@ static const struct drm_plane_funcs vmw_ldu_cursor_=
funcs =3D {
>   */
>  static const struct
>  drm_plane_helper_funcs vmw_ldu_cursor_plane_helper_funcs =3D {
> -       .atomic_check =3D vmw_du_cursor_plane_atomic_check,
> -       .atomic_update =3D vmw_du_cursor_plane_atomic_update,
> -       .prepare_fb =3D vmw_du_cursor_plane_prepare_fb,
> -       .cleanup_fb =3D vmw_du_cursor_plane_cleanup_fb,
> +       .atomic_check =3D vmw_cursor_plane_atomic_check,
> +       .atomic_update =3D vmw_cursor_plane_atomic_update,
> +       .prepare_fb =3D vmw_cursor_plane_prepare_fb,
> +       .cleanup_fb =3D vmw_cursor_plane_cleanup_fb,
>  };
>
>  static const struct
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_page_dirty.c
> index 74ff2812d66a..f37ab334dfdd 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> @@ -71,6 +71,11 @@ struct vmw_bo_dirty {
>         unsigned long bitmap[];
>  };
>
> +bool vmw_bo_is_dirty(struct vmw_bo *vbo)
> +{
> +       return vbo->dirty && (vbo->dirty->start < vbo->dirty->end);
> +}
> +
>  /**
>   * vmw_bo_dirty_scan_pagetable - Perform a pagetable scan for dirty bits
>   * @vbo: The buffer object to scan
> @@ -341,6 +346,41 @@ void vmw_bo_dirty_transfer_to_res(struct vmw_resourc=
e *res)
>                 dirty->end =3D res_start;
>  }
>
> +void vmw_bo_dirty_clear(struct vmw_bo *vbo)
> +{
> +       struct vmw_bo_dirty *dirty =3D vbo->dirty;
> +       pgoff_t start, cur, end;
> +       unsigned long res_start =3D 0;
> +       unsigned long res_end =3D vbo->tbo.base.size;
> +
> +       WARN_ON_ONCE(res_start & ~PAGE_MASK);
> +       res_start >>=3D PAGE_SHIFT;
> +       res_end =3D DIV_ROUND_UP(res_end, PAGE_SIZE);
> +
> +       if (res_start >=3D dirty->end || res_end <=3D dirty->start)
> +               return;
> +
> +       cur =3D max(res_start, dirty->start);
> +       res_end =3D max(res_end, dirty->end);
> +       while (cur < res_end) {
> +               unsigned long num;
> +
> +               start =3D find_next_bit(&dirty->bitmap[0], res_end, cur);
> +               if (start >=3D res_end)
> +                       break;
> +
> +               end =3D find_next_zero_bit(&dirty->bitmap[0], res_end, st=
art + 1);
> +               cur =3D end + 1;
> +               num =3D end - start;
> +               bitmap_clear(&dirty->bitmap[0], start, num);
> +       }
> +
> +       if (res_start <=3D dirty->start && res_end > dirty->start)
> +               dirty->start =3D res_end;
> +       if (res_start < dirty->end && res_end >=3D dirty->end)
> +               dirty->end =3D res_start;
> +}
> +
>  /**
>   * vmw_bo_dirty_clear_res - Clear a resource's dirty region from
>   * its backing mob.
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_scrn.c
> index 32029d80b72b..6149a9c981da 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -764,7 +764,7 @@ static const struct drm_plane_funcs vmw_sou_plane_fun=
cs =3D {
>  static const struct drm_plane_funcs vmw_sou_cursor_funcs =3D {
>         .update_plane =3D drm_atomic_helper_update_plane,
>         .disable_plane =3D drm_atomic_helper_disable_plane,
> -       .destroy =3D vmw_du_cursor_plane_destroy,
> +       .destroy =3D vmw_cursor_plane_destroy,
>         .reset =3D vmw_du_plane_reset,
>         .atomic_duplicate_state =3D vmw_du_plane_duplicate_state,
>         .atomic_destroy_state =3D vmw_du_plane_destroy_state,
> @@ -775,10 +775,10 @@ static const struct drm_plane_funcs vmw_sou_cursor_=
funcs =3D {
>   */
>  static const struct
>  drm_plane_helper_funcs vmw_sou_cursor_plane_helper_funcs =3D {
> -       .atomic_check =3D vmw_du_cursor_plane_atomic_check,
> -       .atomic_update =3D vmw_du_cursor_plane_atomic_update,
> -       .prepare_fb =3D vmw_du_cursor_plane_prepare_fb,
> -       .cleanup_fb =3D vmw_du_cursor_plane_cleanup_fb,
> +       .atomic_check =3D vmw_cursor_plane_atomic_check,
> +       .atomic_update =3D vmw_cursor_plane_atomic_update,
> +       .prepare_fb =3D vmw_cursor_plane_prepare_fb,
> +       .cleanup_fb =3D vmw_cursor_plane_cleanup_fb,
>  };
>
>  static const struct
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index f5d2ed1b0a72..20aab725e53a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -1482,7 +1482,7 @@ static const struct drm_plane_funcs vmw_stdu_plane_=
funcs =3D {
>  static const struct drm_plane_funcs vmw_stdu_cursor_funcs =3D {
>         .update_plane =3D drm_atomic_helper_update_plane,
>         .disable_plane =3D drm_atomic_helper_disable_plane,
> -       .destroy =3D vmw_du_cursor_plane_destroy,
> +       .destroy =3D vmw_cursor_plane_destroy,
>         .reset =3D vmw_du_plane_reset,
>         .atomic_duplicate_state =3D vmw_du_plane_duplicate_state,
>         .atomic_destroy_state =3D vmw_du_plane_destroy_state,
> @@ -1494,10 +1494,10 @@ static const struct drm_plane_funcs vmw_stdu_curs=
or_funcs =3D {
>   */
>  static const struct
>  drm_plane_helper_funcs vmw_stdu_cursor_plane_helper_funcs =3D {
> -       .atomic_check =3D vmw_du_cursor_plane_atomic_check,
> -       .atomic_update =3D vmw_du_cursor_plane_atomic_update,
> -       .prepare_fb =3D vmw_du_cursor_plane_prepare_fb,
> -       .cleanup_fb =3D vmw_du_cursor_plane_cleanup_fb,
> +       .atomic_check =3D vmw_cursor_plane_atomic_check,
> +       .atomic_update =3D vmw_cursor_plane_atomic_update,
> +       .prepare_fb =3D vmw_cursor_plane_prepare_fb,
> +       .cleanup_fb =3D vmw_cursor_plane_cleanup_fb,
>  };
>
>  static const struct
> @@ -1584,6 +1584,7 @@ static int vmw_stdu_init(struct vmw_private *dev_pr=
iv, unsigned unit)
>         }
>
>         drm_plane_helper_add(&cursor->base, &vmw_stdu_cursor_plane_helper=
_funcs);
> +       drm_plane_enable_fb_damage_clips(&cursor->base);
>
>         ret =3D drm_connector_init(dev, connector, &vmw_stdu_connector_fu=
ncs,
>                                  DRM_MODE_CONNECTOR_VIRTUAL);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index 5721c74da3e0..c9eeaea3e557 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -27,6 +27,7 @@
>   ***********************************************************************=
***/
>
>  #include "vmwgfx_bo.h"
> +#include "vmwgfx_cursor_plane.h"
>  #include "vmwgfx_drv.h"
>  #include "vmwgfx_resource_priv.h"
>  #include "vmwgfx_so.h"
> @@ -818,25 +819,11 @@ int vmw_surface_define_ioctl(struct drm_device *dev=
, void *data,
>                 }
>         }
>         res->guest_memory_size =3D cur_bo_offset;
> -       if (!file_priv->atomic &&
> -           metadata->scanout &&
> -           metadata->num_sizes =3D=3D 1 &&
> -           metadata->sizes[0].width =3D=3D VMW_CURSOR_SNOOP_WIDTH &&
> -           metadata->sizes[0].height =3D=3D VMW_CURSOR_SNOOP_HEIGHT &&
> -           metadata->format =3D=3D VMW_CURSOR_SNOOP_FORMAT) {
> -               const struct SVGA3dSurfaceDesc *desc =3D
> -                       vmw_surface_get_desc(VMW_CURSOR_SNOOP_FORMAT);
> -               const u32 cursor_size_bytes =3D VMW_CURSOR_SNOOP_WIDTH *
> -                                             VMW_CURSOR_SNOOP_HEIGHT *
> -                                             desc->pitchBytesPerBlock;
> -               srf->snooper.image =3D kzalloc(cursor_size_bytes, GFP_KER=
NEL);
> -               if (!srf->snooper.image) {
> -                       DRM_ERROR("Failed to allocate cursor_image\n");
> -                       ret =3D -ENOMEM;
> -                       goto out_no_copy;
> -               }
> -       } else {
> -               srf->snooper.image =3D NULL;
> +
> +       srf->snooper.image =3D vmw_cursor_snooper_create(file_priv, metad=
ata);
> +       if (IS_ERR(srf->snooper.image)) {
> +               ret =3D PTR_ERR(srf->snooper.image);
> +               goto out_no_copy;
>         }
>
>         if (drm_is_primary_client(file_priv))
> --
> 2.43.0
>


LGTM, with one remark -- see the one inlined comment above.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

--00000000000010190a062ddeb7a6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
aB4epDaANYRhU8JHkxW+iknr9YlBD7/vaR0b3f0xscNO0KR2RbRxBd7ldJIaA7T83cwnqXXOVzGm
mrHMSsP6TfmqvfoSrZWNOxf3+aFjexRg0I13QVFNW1nYTYYAjBRsito6675X5s3qynY48fFTvTN+
C1mZTTJwBSMD6E8bazTZhq8x8qEz678juqIw9KzVn5lRMf1X7qjByj4MPB0CAwEAAaOCAdwwggHY
MA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYB
BQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNV
HSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBBBgNV
HR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
My5jcmwwJgYDVR0RBB8wHYEbbWFydGluLmtyYXN0ZXZAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoG
CCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSk9QW5
tnlW331MiMXmPO7S77wBdjANBgkqhkiG9w0BAQsFAAOCAgEAUqNCJy3ZYS+BtXtQDl8fFRt6ETrX
F0uFFdSZRPCSQ5FAFJziQU9YLymmRYnNlmw1+NGCkImoavvCiQeqCcy5+L2iGa6MbGlkYVFtQc26
uBJbRIDJ7Dj5GZiNou67hIQvYsLDudJM/TGQe2dtv2JYPpaysa7cKJZB08ZniVKvSqc+ZAbpi7ld
CrtzlZU9Bq2dJEwrU7fm1MvzV8KbNndChku/zlxh4dVijiNGEI3Y1FIKfzL5eq+rTZnQBOzbxdwH
aJ96//5ej4kM/Bl3IB2EvAM7DTttpUNI4C/udXLNKhTCKFdgfeo4K7+49VMOMk8ZbEeKkiA0W1SP
GeLqPoKhzbwN+aagS0c9GFlE01Zmtqvlgkgwv3EQjI47QvK8KsQCyjTYmckxYT+OAhmL7ai5P+jm
R+KlxSCyDOg3+E4KjQnnXzYsEnuXw+olduPLcCE29LM26pHrAOxbc4YarhC0vYbemNruZdZxIca/
/XGY8l7LXKbVw/RUcoVDTjcQ5QO2y6wm9YFSf6tKtXkbxMz6KNmNeuYloos1Y9YO6eUK5VU5owyD
OcXk6j4USOkI67pbnbzE9DzgeYcEZr3i2N5qxmqoMTs5FkZdPQbrI2b/PjXb9zqpUlL8QQ7b0tgN
X9+qyhUml9AcGonyzWyK+KoiW2d8gS0x1lrsD4/jV149/usxggJkMIICYAIBATBiMFIxCzAJBgNV
BAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdD
QyBSNiBTTUlNRSBDQSAyMDIzAgw5cEYo72FZtNYe5cwwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIP84AJtn3d3PtPXWvUBo8K6t+UAx47CH39ag9sRrgQ/RMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDIxMTE0MzM1N1owaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAO+rLq
ttI85/fDGfIFV4ut9Hgz65TV9caKGbVIONS+gQvtbLk5pmwgBKTCDzzyCfe4NqED5uIIpOBDD/CJ
BQd6RjMYEg7TPFvro3z0cbddsh4VCOX+Pb+5E3cnAU6AXAHVn6hg12kQo3Vx5I8KJpVm6hyaSyMO
2bDimo03ug/PJPJgOsd3G6aIma/7n/NdMaMhkiqElHhufK4SDwtEbY8w9btgCLjwg/FJTi9c8iez
oB2balY/dt37UVEFI9c4F60A8zgnpYqVyoqwjdjrZmxfRa3PEtKzZoA0lddMjxZHwhi5Bk9sRLtL
+cKyjHjFCAU7C9YGMRayfAh3vOs0l3av
--00000000000010190a062ddeb7a6--

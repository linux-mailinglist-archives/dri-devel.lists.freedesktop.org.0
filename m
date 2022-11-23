Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B76365D7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 17:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82E710E5B4;
	Wed, 23 Nov 2022 16:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AC010E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:29:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3F36B821BF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01B4C43149
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669220971;
 bh=MguXA3OZ3nq6x5wGVCkNVArvUVXHM/8Y/JvUt5srLEM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XaJtVRaea4FVWw94t7rvrw3rr9lCHt+C1XpCMUIlzO/ReAo7nxCN6jPHIwkEBqwaf
 U2kXxYdlLTzFC+L8z81bD0OJOv27lv6UrCC0YwSk/vV/G+znfPsI/mRLQ3COYrcNth
 NES1zBogFj6e3NKONVcPIirpK9BTY2fCBHsQPuVIV9brz6xpx7OxjlUMG0ji4Jy3uY
 RjwTj0ClAR/Iy7ce7O+Q7iYtEocD+g4yLlfiqfmpjurLz3mnG4DsWY857wfkNLLWtG
 M1f+KzBSaoEhoafpN809wTqSTyKN6VStcwdwdCVi/ryPuOxTkIO5shI6+VYtjyUFxf
 JLJIhyBD8IQtg==
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso21440901fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:29:31 -0800 (PST)
X-Gm-Message-State: ANoB5plrEQG4NmE7azrOEpsuRKeSNxhYAmTqCEenIpbz3jQdKDnKKZi0
 dN2qcGLjMDhOeNKUXY5jg415WhVMknYyOnuOXA==
X-Google-Smtp-Source: AA0mqf5pPTCS6OY91uwq+XYyXWu4R2p9p/JoUH/PiEjxmNe/9cc7amRWtBysjV86b6BSH93XudoaUkZqu0sjP7zZUYc=
X-Received: by 2002:a05:6870:4b4b:b0:131:be7a:3415 with SMTP id
 ls11-20020a0568704b4b00b00131be7a3415mr5015697oab.269.1669220970821; Wed, 23
 Nov 2022 08:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20221116193335.36320-1-greenjustin@google.com>
In-Reply-To: <20221116193335.36320-1-greenjustin@google.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 24 Nov 2022 00:29:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-jxaARVwSPZVYtEtJ4-hmpE8JeXQ0=HfiNo6vHVt8FZg@mail.gmail.com>
Message-ID: <CAAOTY_-jxaARVwSPZVYtEtJ4-hmpE8JeXQ0=HfiNo6vHVt8FZg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: Justin Green <greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2022=E5=B9=B411=E6=9C=881=
7=E6=97=A5 =E9=80=B1=E5=9B=9B =E5=87=8C=E6=99=A83:33=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Justin Green <greenjustin@chromium.org>
>
> Tested on MT8195 and confirmed both correct video output and improved DRA=
M
> bandwidth performance.

I've break this patch into two patches and apply to mediatek-drm-next
[1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> v5:
> * Removed some dead defines.
> * Refactored mtk_ovl_set_afbc().
>
> v4:
> * Move modifier validation to format_mod_supported function.
> * Add modifiers to drm_universal_plane_init() call.
> * Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying =
on
>   DRM_FORMAT_LINEAR being equal to 0.
> * Gate AFBC control bit writes on device compatibility.
>
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>   AFBC.
> * Minor code cleanups.
>
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 57 +++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 74 +++++++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  8 +++
>  3 files changed, 134 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 002b0f6cae1a..5a59e7b99c5d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -29,17 +29,22 @@
>  #define DISP_REG_OVL_DATAPATH_CON              0x0024
>  #define OVL_LAYER_SMI_ID_EN                            BIT(0)
>  #define OVL_BGCLR_SEL_IN                               BIT(2)
> +#define OVL_LAYER_AFBC_EN(n)                           BIT(4+n)
>  #define DISP_REG_OVL_ROI_BGCLR                 0x0028
>  #define DISP_REG_OVL_SRC_CON                   0x002c
>  #define DISP_REG_OVL_CON(n)                    (0x0030 + 0x20 * (n))
>  #define DISP_REG_OVL_SRC_SIZE(n)               (0x0038 + 0x20 * (n))
>  #define DISP_REG_OVL_OFFSET(n)                 (0x003c + 0x20 * (n))
> +#define DISP_REG_OVL_PITCH_MSB(n)              (0x0040 + 0x20 * (n))
> +#define OVL_PITCH_MSB_2ND_SUBBUF                       BIT(16)
>  #define DISP_REG_OVL_PITCH(n)                  (0x0044 + 0x20 * (n))
>  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
>  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
>  #define DISP_REG_OVL_ADDR_MT2701               0x0040
>  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
>  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20=
 * (n))
> +#define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x20=
 * (n) + 0x04)
> +#define DISP_REG_OVL_HDR_PITCH(ovl, n)         ((ovl)->data->addr + 0x20=
 * (n) + 0x08)
>
>  #define GMC_THRESHOLD_BITS     16
>  #define GMC_THRESHOLD_HIGH     ((1 << GMC_THRESHOLD_BITS) / 4)
> @@ -67,6 +72,7 @@ struct mtk_disp_ovl_data {
>         unsigned int layer_nr;
>         bool fmt_rgb565_is_0;
>         bool smi_id_en;
> +       bool supports_afbc;
>  };
>
>  /*
> @@ -172,7 +178,14 @@ void mtk_ovl_stop(struct device *dev)
>                 reg =3D reg & ~OVL_LAYER_SMI_ID_EN;
>                 writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON=
);
>         }
> +}
>
> +static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ovl, struct cmdq_pkt *=
cmdq_pkt,
> +                            int idx, bool enabled)
> +{
> +       mtk_ddp_write_mask(cmdq_pkt, enabled ? OVL_LAYER_AFBC_EN(idx) : 0=
,
> +                           &ovl->cmdq_reg, ovl->regs,
> +                           DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(=
idx));
>  }
>
>  void mtk_ovl_config(struct device *dev, unsigned int w,
> @@ -310,11 +323,23 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
>         struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
>         struct mtk_plane_pending_state *pending =3D &state->pending;
>         unsigned int addr =3D pending->addr;
> -       unsigned int pitch =3D pending->pitch & 0xffff;
> +       unsigned int hdr_addr =3D pending->hdr_addr;
> +       unsigned int pitch =3D pending->pitch;
> +       unsigned int hdr_pitch =3D pending->hdr_pitch;
>         unsigned int fmt =3D pending->format;
>         unsigned int offset =3D (pending->y << 16) | pending->x;
>         unsigned int src_size =3D (pending->height << 16) | pending->widt=
h;
>         unsigned int con;
> +       bool is_afbc =3D pending->modifier !=3D DRM_FORMAT_MOD_LINEAR;
> +       union overlay_pitch {
> +               struct split_pitch {
> +                       u16 lsb;
> +                       u16 msb;
> +               } split_pitch;
> +               u32 pitch;
> +       } overlay_pitch;
> +
> +       overlay_pitch.pitch =3D pitch;
>
>         if (!pending->enable) {
>                 mtk_ovl_layer_off(dev, idx, cmdq_pkt);
> @@ -335,9 +360,12 @@ void mtk_ovl_layer_config(struct device *dev, unsign=
ed int idx,
>                 addr +=3D pending->pitch - 1;
>         }
>
> +       if (ovl->data->supports_afbc)
> +               mtk_ovl_set_afbc(ovl, cmdq_pkt, idx, is_afbc);
> +
>         mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
>                               DISP_REG_OVL_CON(idx));
> -       mtk_ddp_write_relaxed(cmdq_pkt, pitch, &ovl->cmdq_reg, ovl->regs,
> +       mtk_ddp_write_relaxed(cmdq_pkt, overlay_pitch.split_pitch.lsb, &o=
vl->cmdq_reg, ovl->regs,
>                               DISP_REG_OVL_PITCH(idx));
>         mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->re=
gs,
>                               DISP_REG_OVL_SRC_SIZE(idx));
> @@ -346,6 +374,20 @@ void mtk_ovl_layer_config(struct device *dev, unsign=
ed int idx,
>         mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
>                               DISP_REG_OVL_ADDR(ovl, idx));
>
> +       if (is_afbc) {
> +               mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg,=
 ovl->regs,
> +                                     DISP_REG_OVL_HDR_ADDR(ovl, idx));
> +               mtk_ddp_write_relaxed(cmdq_pkt,
> +                                     OVL_PITCH_MSB_2ND_SUBBUF | overlay_=
pitch.split_pitch.msb,
> +                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> +               mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg=
, ovl->regs,
> +                                     DISP_REG_OVL_HDR_PITCH(ovl, idx));
> +       } else {
> +               mtk_ddp_write_relaxed(cmdq_pkt,
> +                                     overlay_pitch.split_pitch.msb,
> +                                     &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
> +       }
> +
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
>  }
>
> @@ -492,6 +534,15 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_=
driver_data =3D {
>         .smi_id_en =3D true,
>  };
>
> +static const struct mtk_disp_ovl_data mt8195_ovl_driver_data =3D {
> +       .addr =3D DISP_REG_OVL_ADDR_MT8173,
> +       .gmc_bits =3D 10,
> +       .layer_nr =3D 4,
> +       .fmt_rgb565_is_0 =3D true,
> +       .smi_id_en =3D true,
> +       .supports_afbc =3D true,
> +};
> +
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
>         { .compatible =3D "mediatek,mt2701-disp-ovl",
>           .data =3D &mt2701_ovl_driver_data},
> @@ -505,6 +556,8 @@ static const struct of_device_id mtk_disp_ovl_driver_=
dt_match[] =3D {
>           .data =3D &mt8192_ovl_driver_data},
>         { .compatible =3D "mediatek,mt8192-disp-ovl-2l",
>           .data =3D &mt8192_ovl_2l_driver_data},
> +       { .compatible =3D "mediatek,mt8195-disp-ovl",
> +         .data =3D &mt8195_ovl_driver_data},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index 5c0d9ce69931..07092e27ff24 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <linux/align.h>
>
>  #include "mtk_drm_crtc.h"
>  #include "mtk_drm_ddp_comp.h"
> @@ -33,6 +34,14 @@ static const u32 formats[] =3D {
>         DRM_FORMAT_YUYV,
>  };
>
> +static const u64 modifiers[] =3D {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +                               AFBC_FORMAT_MOD_SPLIT |
> +                               AFBC_FORMAT_MOD_SPARSE),
> +       DRM_FORMAT_MOD_INVALID,
> +};
> +
>  static void mtk_plane_reset(struct drm_plane *plane)
>  {
>         struct mtk_plane_state *state;
> @@ -52,6 +61,7 @@ static void mtk_plane_reset(struct drm_plane *plane)
>
>         state->base.plane =3D plane;
>         state->pending.format =3D DRM_FORMAT_RGB565;
> +       state->pending.modifier =3D DRM_FORMAT_MOD_LINEAR;
>  }
>
>  static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plan=
e *plane)
> @@ -72,6 +82,32 @@ static struct drm_plane_state *mtk_plane_duplicate_sta=
te(struct drm_plane *plane
>         return &state->base;
>  }
>
> +static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
> +                                          uint32_t format,
> +                                          uint64_t modifier)
> +{
> +       if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
> +               return true;
> +
> +       if (modifier !=3D DRM_FORMAT_MOD_ARM_AFBC(
> +                               AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +                               AFBC_FORMAT_MOD_SPLIT |
> +                               AFBC_FORMAT_MOD_SPARSE))
> +               return false;
> +
> +       if (format !=3D DRM_FORMAT_XRGB8888 &&
> +           format !=3D DRM_FORMAT_ARGB8888 &&
> +           format !=3D DRM_FORMAT_BGRX8888 &&
> +           format !=3D DRM_FORMAT_BGRA8888 &&
> +           format !=3D DRM_FORMAT_ABGR8888 &&
> +           format !=3D DRM_FORMAT_XBGR8888 &&
> +           format !=3D DRM_FORMAT_RGB888 &&
> +           format !=3D DRM_FORMAT_BGR888)
> +               return false;
> +
> +       return true;
> +}
> +
>  static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
>                                         struct drm_plane_state *state)
>  {
> @@ -120,21 +156,52 @@ static void mtk_plane_update_new_state(struct drm_p=
lane_state *new_state,
>         struct drm_gem_object *gem;
>         struct mtk_drm_gem_obj *mtk_gem;
>         unsigned int pitch, format;
> +       u64 modifier;
>         dma_addr_t addr;
> +       dma_addr_t hdr_addr =3D 0;
> +       unsigned int hdr_pitch =3D 0;
>
>         gem =3D fb->obj[0];
>         mtk_gem =3D to_mtk_gem_obj(gem);
>         addr =3D mtk_gem->dma_addr;
>         pitch =3D fb->pitches[0];
>         format =3D fb->format->format;
> +       modifier =3D fb->modifier;
>
> -       addr +=3D (new_state->src.x1 >> 16) * fb->format->cpp[0];
> -       addr +=3D (new_state->src.y1 >> 16) * pitch;
> +       if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR) {
> +               addr +=3D (new_state->src.x1 >> 16) * fb->format->cpp[0];
> +               addr +=3D (new_state->src.y1 >> 16) * pitch;
> +       } else {
> +               int width_in_blocks =3D ALIGN(fb->width, AFBC_DATA_BLOCK_=
WIDTH)
> +                                     / AFBC_DATA_BLOCK_WIDTH;
> +               int height_in_blocks =3D ALIGN(fb->height, AFBC_DATA_BLOC=
K_HEIGHT)
> +                                      / AFBC_DATA_BLOCK_HEIGHT;
> +               int x_offset_in_blocks =3D (new_state->src.x1 >> 16) / AF=
BC_DATA_BLOCK_WIDTH;
> +               int y_offset_in_blocks =3D (new_state->src.y1 >> 16) / AF=
BC_DATA_BLOCK_HEIGHT;
> +               int hdr_size;
> +
> +               hdr_pitch =3D width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
> +               pitch =3D width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
> +                       AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
> +
> +               hdr_size =3D ALIGN(hdr_pitch * height_in_blocks, AFBC_HEA=
DER_ALIGNMENT);
> +
> +               hdr_addr =3D addr + hdr_pitch * y_offset_in_blocks +
> +                          AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
> +               /* The data plane is offset by 1 additional block. */
> +               addr =3D addr + hdr_size +
> +                      pitch * y_offset_in_blocks +
> +                      AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
> +                      fb->format->cpp[0] * (x_offset_in_blocks + 1);
> +       }
>
>         mtk_plane_state->pending.enable =3D true;
>         mtk_plane_state->pending.pitch =3D pitch;
> +       mtk_plane_state->pending.hdr_pitch =3D hdr_pitch;
>         mtk_plane_state->pending.format =3D format;
> +       mtk_plane_state->pending.modifier =3D modifier;
>         mtk_plane_state->pending.addr =3D addr;
> +       mtk_plane_state->pending.hdr_addr =3D hdr_addr;
>         mtk_plane_state->pending.x =3D new_state->dst.x1;
>         mtk_plane_state->pending.y =3D new_state->dst.y1;
>         mtk_plane_state->pending.width =3D drm_rect_width(&new_state->dst=
);
> @@ -173,6 +240,7 @@ static const struct drm_plane_funcs mtk_plane_funcs =
=3D {
>         .reset =3D mtk_plane_reset,
>         .atomic_duplicate_state =3D mtk_plane_duplicate_state,
>         .atomic_destroy_state =3D mtk_drm_plane_destroy_state,
> +       .format_mod_supported =3D mtk_plane_format_mod_supported,
>  };
>
>  static int mtk_plane_atomic_check(struct drm_plane *plane,
> @@ -254,7 +322,7 @@ int mtk_plane_init(struct drm_device *dev, struct drm=
_plane *plane,
>
>         err =3D drm_universal_plane_init(dev, plane, possible_crtcs,
>                                        &mtk_plane_funcs, formats,
> -                                      ARRAY_SIZE(formats), NULL, type, N=
ULL);
> +                                      ARRAY_SIZE(formats), modifiers, ty=
pe, NULL);
>         if (err) {
>                 DRM_ERROR("failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.h
> index 2d5ec66e3df1..8f39011cdbfc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -10,12 +10,20 @@
>  #include <drm/drm_crtc.h>
>  #include <linux/types.h>
>
> +#define AFBC_DATA_BLOCK_WIDTH 32
> +#define AFBC_DATA_BLOCK_HEIGHT 8
> +#define AFBC_HEADER_BLOCK_SIZE 16
> +#define AFBC_HEADER_ALIGNMENT 1024
> +
>  struct mtk_plane_pending_state {
>         bool                            config;
>         bool                            enable;
>         dma_addr_t                      addr;
> +       dma_addr_t                      hdr_addr;
>         unsigned int                    pitch;
> +       unsigned int                    hdr_pitch;
>         unsigned int                    format;
> +       unsigned long long              modifier;
>         unsigned int                    x;
>         unsigned int                    y;
>         unsigned int                    width;
> --
> 2.38.1.431.g37b22c650d-goog
>

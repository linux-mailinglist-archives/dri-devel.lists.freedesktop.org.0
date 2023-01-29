Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A7C67FC3D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 02:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8CF10E048;
	Sun, 29 Jan 2023 01:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF9410E048
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 01:59:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0751B60C55
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 01:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D195AC433A4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674957583;
 bh=ap5WFd6Yu65yTuISGxhjz7XM37ibl6TltzN6c5Lzmtk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S/TKDaRFljK9MVMqMJxsFjTiCpp7MkTSP6yHR/CZn6bTtxHZUV0fzUz8l7pZnV8xr
 RBP08ddhR65gdz4iu/dtytcD4FVPXI+RS6t8tdh1gQeIaNNTEK6n0xtSpHJ+t5L3OQ
 +/7P6rmd9jNphD2VFS2Q8xH8Nkw2cuuR1EyplThBHuYP4uO21uVUImCaqS0Hmy6HxL
 RglLK1dlSnNFEpycVVNpU7fx97E4vA1FQpQtVrUkwvaVsa0pFZkkiOudY2lvRQlER7
 EPR4nEiuHsf3ihtifWK4deljck+bY/Xib9jlYlfP5+W0wDJpwVdJOyJOOEXBXKTYJL
 TBx41kTLtyn8g==
Received: by mail-lf1-f41.google.com with SMTP id o20so14171547lfk.5
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 17:59:43 -0800 (PST)
X-Gm-Message-State: AFqh2kr3YLHogc47djLTvjC46PZzHWLBhkpJd5Mtm3xrDR0GvXStVxR1
 ZOYKPLJc00vLRoCwUA2CRhTFVYPUt7pCBlrpYw==
X-Google-Smtp-Source: AMrXdXupElCpyQ8SHmZy/iNBfqkvDPjGygZBdugijzPVbWzkmAfvBxtLwsUdFq15HYKT7UWw14JNS/C//XH1eLSkDRg=
X-Received: by 2002:a05:6512:1043:b0:4ca:f9e4:c410 with SMTP id
 c3-20020a056512104300b004caf9e4c410mr2569231lfb.97.1674957581710; Sat, 28 Jan
 2023 17:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20230127230123.941930-1-greenjustin@google.com>
In-Reply-To: <20230127230123.941930-1-greenjustin@google.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 29 Jan 2023 09:59:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_99kTb39LFanSaTp13oMNhFSv+wE5oO7EtPVZWKSHqZzw@mail.gmail.com>
Message-ID: <CAAOTY_99kTb39LFanSaTp13oMNhFSv+wE5oO7EtPVZWKSHqZzw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Add support for AR30 and BA30
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
 Justin Green <greenjustin@google.com>, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B41=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=887:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.
>
> Tested using "modetest -P" on an MT8195.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
> v2:
>  * Rebase and resolve merge conflicts with the AFBC patch.
> v3:
>  * Moved 10-bit support detection to mtk_disk_ovl.c
>
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 37 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 10 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 37 ++++++++++++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  2 +-
>  7 files changed, 84 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 33e61a136bbc..b75139da3032 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -96,6 +96,7 @@ void mtk_ovl_register_vblank_cb(struct device *dev,
>  void mtk_ovl_unregister_vblank_cb(struct device *dev);
>  void mtk_ovl_enable_vblank(struct device *dev);
>  void mtk_ovl_disable_vblank(struct device *dev);
> +int mtk_ovl_supports_10bit(struct device *dev);
>
>  void mtk_rdma_bypass_shadow(struct device *dev);
>  int mtk_rdma_clk_enable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 84daeaffab6a..412a749a509e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -41,6 +41,7 @@
>  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
>  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
>  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> +#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
>  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
>  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20=
 * (n))
>  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x20=
 * (n) + 0x04)
> @@ -61,6 +62,10 @@
>                                         0 : OVL_CON_CLRFMT_RGB)
>  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ? \
>                                         OVL_CON_CLRFMT_RGB : 0)
> +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> +#define OVL_CON_CLRFMT_8_BIT                   0x00
> +#define OVL_CON_CLRFMT_10_BIT                  0x01
>  #define        OVL_CON_AEN             BIT(8)
>  #define        OVL_CON_ALPHA           0xff
>  #define        OVL_CON_VIRT_FLIP       BIT(9)
> @@ -73,6 +78,7 @@ struct mtk_disp_ovl_data {
>         bool fmt_rgb565_is_0;
>         bool smi_id_en;
>         bool supports_afbc;
> +       bool supports_10bit;
>  };
>
>  /*
> @@ -188,6 +194,26 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ov=
l, struct cmdq_pkt *cmdq_pkt
>                            DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(i=
dx));
>  }
>
> +static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 forma=
t,
> +                                 struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +       unsigned int reg;
> +       unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
> +
> +       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> +       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> +
> +       if (format =3D=3D DRM_FORMAT_RGBA1010102 ||
> +           format =3D=3D DRM_FORMAT_BGRA1010102 ||
> +           format =3D=3D DRM_FORMAT_ARGB2101010)
> +               bit_depth =3D OVL_CON_CLRFMT_10_BIT;
> +
> +       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> +
> +       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg, ovl->regs, DISP_REG_=
OVL_CLRFMT_EXT);
> +}
> +
>  void mtk_ovl_config(struct device *dev, unsigned int w,
>                     unsigned int h, unsigned int vrefresh,
>                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -216,6 +242,13 @@ unsigned int mtk_ovl_supported_rotations(struct devi=
ce *dev)
>                DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>  }
>
> +int mtk_ovl_supports_10bit(struct device *dev)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +
> +       return ovl->data->supports_10bit;
> +}
> +
>  int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
>                         struct mtk_plane_state *mtk_state)
>  {
> @@ -302,9 +335,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_=
ovl *ovl, unsigned int fmt)
>                 return OVL_CON_CLRFMT_ARGB8888;
>         case DRM_FORMAT_BGRX8888:
>         case DRM_FORMAT_BGRA8888:
> +       case DRM_FORMAT_BGRA1010102:
>                 return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
>         case DRM_FORMAT_XRGB8888:
>         case DRM_FORMAT_ARGB8888:
> +       case DRM_FORMAT_ARGB2101010:
>                 return OVL_CON_CLRFMT_RGBA8888;
>         case DRM_FORMAT_XBGR8888:
>         case DRM_FORMAT_ABGR8888:
> @@ -388,6 +423,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigne=
d int idx,
>                                       &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
>         }
>
> +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
>  }
>
> @@ -541,6 +577,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driv=
er_data =3D {
>         .fmt_rgb565_is_0 =3D true,
>         .smi_id_en =3D true,
>         .supports_afbc =3D true,
> +       .supports_10bit =3D true,
>  };
>
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 112615817dcb..9f162c9b504a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -856,7 +856,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_d=
evice *drm_dev,
>                                 BIT(pipe),
>                                 mtk_drm_crtc_plane_type(mtk_crtc->layer_n=
r,
>                                                         num_planes),
> -                               mtk_ddp_comp_supported_rotations(comp));
> +                               mtk_ddp_comp_supported_rotations(comp),
> +                               mtk_ddp_comp_supports_10bit(comp));
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 6b6d5335c834..708963c613d3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -359,6 +359,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl =3D {
>         .layer_config =3D mtk_ovl_layer_config,
>         .bgclr_in_on =3D mtk_ovl_bgclr_in_on,
>         .bgclr_in_off =3D mtk_ovl_bgclr_in_off,
> +       .supports_10bit =3D mtk_ovl_supports_10bit,
>  };
>
>  static const struct mtk_ddp_comp_funcs ddp_postmask =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 2d0052c23dcb..18ec5dca2337 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -71,6 +71,7 @@ struct mtk_ddp_comp_funcs {
>         void (*bgclr_in_off)(struct device *dev);
>         void (*ctm_set)(struct device *dev,
>                         struct drm_crtc_state *state);
> +       int (*supports_10bit)(struct device *dev);
>  };
>
>  struct mtk_ddp_comp {
> @@ -151,6 +152,15 @@ unsigned int mtk_ddp_comp_supported_rotations(struct=
 mtk_ddp_comp *comp)
>         return 0;
>  }
>
> +static inline
> +int mtk_ddp_comp_supports_10bit(struct mtk_ddp_comp *comp)
> +{
> +       if (comp->funcs && comp->funcs->supports_10bit)
> +               return comp->funcs->supports_10bit;
> +
> +        return 0;
> +}
> +
>  static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *co=
mp)
>  {
>         if (comp->funcs && comp->funcs->layer_nr)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index d54fbf34b000..e94a07cdda32 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -19,7 +19,7 @@
>  #include "mtk_drm_gem.h"
>  #include "mtk_drm_plane.h"
>
> -static const u32 formats[] =3D {
> +static const u32 default_formats[] =3D {
>         DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_ARGB8888,
>         DRM_FORMAT_BGRX8888,
> @@ -41,6 +41,22 @@ static const u64 modifiers[] =3D {
>         DRM_FORMAT_MOD_INVALID,
>  };
>
> +static const u32 formats_with_10bit_cap[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_ARGB2101010,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_BGRA1010102,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};

I would like to move formats_with_10bit_cap[] & formats[] to ovl/rdma
driver and rename formats[] to formats_mt8173[] and rename
formats_with_10bit_cap[] to formats_mt8195[].
And change comp->funcs->supports_10bit() to comp->funcs->get_formats().

Regards,
Chun-Kuang.

> +
>  static void mtk_plane_reset(struct drm_plane *plane)
>  {
>         struct mtk_plane_state *state;
> @@ -315,13 +331,24 @@ static const struct drm_plane_helper_funcs mtk_plan=
e_helper_funcs =3D {
>
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
> -                  unsigned int supported_rotations)
> +                  unsigned int supported_rotations, bool supports_10bit)
>  {
>         int err;
>
> -       err =3D drm_universal_plane_init(dev, plane, possible_crtcs,
> -                                      &mtk_plane_funcs, formats,
> -                                      ARRAY_SIZE(formats), modifiers, ty=
pe, NULL);
> +       if (supports_10bit) {
> +               err =3D drm_universal_plane_init(dev, plane, possible_crt=
cs,
> +                                              &mtk_plane_funcs,
> +                                              formats_with_10bit_cap,
> +                                              ARRAY_SIZE(formats_with_10=
bit_cap),
> +                                              modifiers, type, NULL);
> +       } else {
> +               err =3D drm_universal_plane_init(dev, plane, possible_crt=
cs,
> +                                              &mtk_plane_funcs,
> +                                              default_formats,
> +                                              ARRAY_SIZE(default_formats=
),
> +                                              modifiers, type, NULL);
> +       }
> +
>         if (err) {
>                 DRM_ERROR("failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.h
> index 8f39011cdbfc..d3e6f29a1e25 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -48,6 +48,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
>
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
> -                  unsigned int supported_rotations);
> +                  unsigned int supported_rotations, bool supports_10bit)=
;
>
>  #endif
> --
> 2.39.1.456.gfc5497dd1b-goog
>

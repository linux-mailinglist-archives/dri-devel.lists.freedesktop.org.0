Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2746820B5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 01:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1229D10E2F4;
	Tue, 31 Jan 2023 00:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A701110E2F4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 00:28:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ABD59B8188E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 00:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B99C433A4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 00:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675124909;
 bh=CMwB5QvkIpYBXIiR0xHnYKNha/t6F1XVVe2tNYhF+EU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fiWUXoWQLBoi/gJAr/wOsZPeCNX+VH4niP0abyeGHBuHv94gPsUsVTv70EbfZbRMz
 5h3JdURdQ3WuthTmYE/cs0Vd5yUczFZ/IFta/wz5c6sJF021M+hQInLGVHQM/bObJP
 Rr/gtmv2mHkOb4cZYlPPyyt7r4uinCIxxfSlDDYaXzFJsYP7Fl45bgVE8uCKamIzH2
 YDDkMdGYc3yP9odruwg8G+cENjAuLHuZMzaaqSt6TZk9FGB1xfUDOI8zeEhS1aDCEe
 2dmXIeoujmnYZJAOue1HP/ixSsJmGRGCjv+VeTHD8BcMFf0hr1+scbb6fAvvuE33Kr
 EV4q6UxEvPT/A==
Received: by mail-lf1-f46.google.com with SMTP id f34so21753374lfv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 16:28:29 -0800 (PST)
X-Gm-Message-State: AFqh2kpOrflvjqkaQ2jRtsBecdqRF92y05xudOgyMosP9BgN5RDxTDyN
 /Qb0P84fPX4I3ESlXtWdLaAoGQbg5s5ZWql1Fg==
X-Google-Smtp-Source: AMrXdXvBs7ygQxY3XzH6HX2V+bK+Bt+GLBjuvcfqdkgyOA8OoYQ8N8wyg4SpKzRkMlff4gvClpJK/HobLrRviPe4DKg=
X-Received: by 2002:a05:6512:3d24:b0:4cd:24e8:911c with SMTP id
 d36-20020a0565123d2400b004cd24e8911cmr5061706lfv.209.1675124907560; Mon, 30
 Jan 2023 16:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20230130203619.1925974-1-greenjustin@chromium.org>
In-Reply-To: <20230130203619.1925974-1-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 31 Jan 2023 08:28:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-hs5h4rn0tirJkS7M=15C6TS1VSAKAK_obLC2ZQudiwA@mail.gmail.com>
Message-ID: <CAAOTY_-hs5h4rn0tirJkS7M=15C6TS1VSAKAK_obLC2ZQudiwA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/mediatek: Add support for AR30 and BA30
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

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B41=E6=9C=8831=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=884:36=E5=AF=AB=E9=81=93=EF=BC=
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
> v4:
>  * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
> v5:
>  * Minor style adjustments per checkpatch.pl
>
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 75 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 27 ++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 28 +++-----
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
>  8 files changed, 146 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 33e61a136bbc..6ad22ce75b81 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -96,6 +96,8 @@ void mtk_ovl_register_vblank_cb(struct device *dev,
>  void mtk_ovl_unregister_vblank_cb(struct device *dev);
>  void mtk_ovl_enable_vblank(struct device *dev);
>  void mtk_ovl_disable_vblank(struct device *dev);
> +const u32 *mtk_ovl_get_formats(struct device *dev);
> +size_t mtk_ovl_get_num_formats(struct device *dev);
>
>  void mtk_rdma_bypass_shadow(struct device *dev);
>  int mtk_rdma_clk_enable(struct device *dev);
> @@ -122,4 +124,6 @@ void mtk_mdp_rdma_start(struct device *dev, struct cm=
dq_pkt *cmdq_pkt);
>  void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>  void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cf=
g,
>                          struct cmdq_pkt *cmdq_pkt);
> +const u32 *mtk_rdma_get_formats(struct device *dev);
> +size_t mtk_rdma_get_num_formats(struct device *dev);
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 84daeaffab6a..1db70a77560f 100644
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
> @@ -61,11 +62,45 @@
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
>  #define        OVL_CON_HORZ_FLIP       BIT(10)
>
> +static const u32 formats_mt8173[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};
> +
> +static const u32 formats_mt8195[] =3D {
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
> +
>  struct mtk_disp_ovl_data {
>         unsigned int addr;
>         unsigned int gmc_bits;
> @@ -73,6 +108,7 @@ struct mtk_disp_ovl_data {
>         bool fmt_rgb565_is_0;
>         bool smi_id_en;
>         bool supports_afbc;
> +       bool supports_10bit;

For different SoC, the supported formats may be numerous combination,
so I would like to place the formats directly in private date. That
means

const u32 formats;
size_t num_formats

>  };
>
>  /*
> @@ -188,6 +224,26 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ov=
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
> @@ -216,6 +272,21 @@ unsigned int mtk_ovl_supported_rotations(struct devi=
ce *dev)
>                DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>  }
>
> +const u32 *mtk_ovl_get_formats(struct device *dev)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +
> +       return ovl->data->supports_10bit ? formats_mt8195 : formats_mt817=
3;
> +}
> +
> +size_t mtk_ovl_get_num_formats(struct device *dev)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +
> +       return ovl->data->supports_10bit ? ARRAY_SIZE(formats_mt8195)
> +               : ARRAY_SIZE(formats_mt8173);
> +}
> +
>  int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
>                         struct mtk_plane_state *mtk_state)
>  {
> @@ -302,9 +373,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_=
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
> @@ -388,6 +461,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigne=
d int idx,
>                                       &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
>         }
>
> +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
>  }
>
> @@ -541,6 +615,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driv=
er_data =3D {
>         .fmt_rgb565_is_0 =3D true,
>         .smi_id_en =3D true,
>         .supports_afbc =3D true,
> +       .supports_10bit =3D true,
>  };
>
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index 0ec2e4049e07..7937f6fef3b4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -54,8 +54,23 @@
>
>  #define RDMA_MEM_GMC                           0x40402020
>
> +static const u32 formats_mt8173[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};
> +
>  struct mtk_disp_rdma_data {
>         unsigned int fifo_size;
> +       bool supports_10bit;
>  };
>
>  /*
> @@ -262,6 +277,17 @@ void mtk_rdma_layer_config(struct device *dev, unsig=
ned int idx,
>
>  }
>
> +// TODO: Add support for 10 bit mode.

/* ... */

Does mt8195 rdma support 10 bits mode? If yes, why not implement it in
this patch? If no, I think it's not necessary to comment this.

> +const u32 *mtk_rdma_get_formats(struct device *dev)
> +{
> +       return formats_mt8173;
> +}
> +
> +size_t mtk_rdma_get_num_formats(struct device *dev)
> +{
> +       return ARRAY_SIZE(formats_mt8173);
> +}
> +
>  static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
>                               void *data)
>  {
> @@ -372,6 +398,7 @@ static const struct mtk_disp_rdma_data mt8183_rdma_dr=
iver_data =3D {
>
>  static const struct mtk_disp_rdma_data mt8195_rdma_driver_data =3D {
>         .fifo_size =3D 1920,
> +       .supports_10bit =3D true,
>  };
>
>  static const struct of_device_id mtk_disp_rdma_driver_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 112615817dcb..2ba01c484228 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -856,7 +856,9 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_d=
evice *drm_dev,
>                                 BIT(pipe),
>                                 mtk_drm_crtc_plane_type(mtk_crtc->layer_n=
r,
>                                                         num_planes),
> -                               mtk_ddp_comp_supported_rotations(comp));
> +                               mtk_ddp_comp_supported_rotations(comp),
> +                               mtk_ddp_comp_get_formats(comp),
> +                               mtk_ddp_comp_get_num_formats(comp));
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 6b6d5335c834..4a4c1928f83d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -359,6 +359,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl =3D {
>         .layer_config =3D mtk_ovl_layer_config,
>         .bgclr_in_on =3D mtk_ovl_bgclr_in_on,
>         .bgclr_in_off =3D mtk_ovl_bgclr_in_off,
> +       .get_formats =3D mtk_ovl_get_formats,
> +       .get_num_formats =3D mtk_ovl_get_num_formats,
>  };
>
>  static const struct mtk_ddp_comp_funcs ddp_postmask =3D {
> @@ -381,6 +383,8 @@ static const struct mtk_ddp_comp_funcs ddp_rdma =3D {
>         .disable_vblank =3D mtk_rdma_disable_vblank,
>         .layer_nr =3D mtk_rdma_layer_nr,
>         .layer_config =3D mtk_rdma_layer_config,
> +       .get_formats =3D mtk_rdma_get_formats,
> +       .get_num_formats =3D mtk_rdma_get_num_formats,
>  };
>
>  static const struct mtk_ddp_comp_funcs ddp_ufoe =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 2d0052c23dcb..782c4a44f675 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -71,6 +71,8 @@ struct mtk_ddp_comp_funcs {
>         void (*bgclr_in_off)(struct device *dev);
>         void (*ctm_set)(struct device *dev,
>                         struct drm_crtc_state *state);
> +       const u32 *(*get_formats)(struct device *dev);
> +       size_t (*get_num_formats)(struct device *dev);

I think you have do two things in this patch. One is adding ddp
component interface to get formats. Another one is mt8195 ovl support
10 bits format. So break this patch into two patches.

Regards,
Chun-Kuang.

>  };
>
>  struct mtk_ddp_comp {
> @@ -151,6 +153,24 @@ unsigned int mtk_ddp_comp_supported_rotations(struct=
 mtk_ddp_comp *comp)
>         return 0;
>  }
>
> +static inline
> +const u32 *mtk_ddp_comp_get_formats(struct mtk_ddp_comp *comp)
> +{
> +       if (comp->funcs && comp->funcs->get_formats)
> +               return comp->funcs->get_formats(comp->dev);
> +
> +       return NULL;
> +}
> +
> +static inline
> +size_t mtk_ddp_comp_get_num_formats(struct mtk_ddp_comp *comp)
> +{
> +       if (comp->funcs && comp->funcs->get_num_formats)
> +               return comp->funcs->get_num_formats(comp->dev);
> +
> +       return 0;
> +}
> +
>  static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *co=
mp)
>  {
>         if (comp->funcs && comp->funcs->layer_nr)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index d54fbf34b000..03e63c29111e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -19,20 +19,6 @@
>  #include "mtk_drm_gem.h"
>  #include "mtk_drm_plane.h"
>
> -static const u32 formats[] =3D {
> -       DRM_FORMAT_XRGB8888,
> -       DRM_FORMAT_ARGB8888,
> -       DRM_FORMAT_BGRX8888,
> -       DRM_FORMAT_BGRA8888,
> -       DRM_FORMAT_ABGR8888,
> -       DRM_FORMAT_XBGR8888,
> -       DRM_FORMAT_RGB888,
> -       DRM_FORMAT_BGR888,
> -       DRM_FORMAT_RGB565,
> -       DRM_FORMAT_UYVY,
> -       DRM_FORMAT_YUYV,
> -};
> -
>  static const u64 modifiers[] =3D {
>         DRM_FORMAT_MOD_LINEAR,
>         DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> @@ -315,13 +301,21 @@ static const struct drm_plane_helper_funcs mtk_plan=
e_helper_funcs =3D {
>
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
> -                  unsigned int supported_rotations)
> +                  unsigned int supported_rotations, const u32 *formats,
> +                  size_t num_formats)
>  {
>         int err;
>
> +       if (!formats || !num_formats) {
> +               DRM_ERROR("no pixel formats for plane\n");
> +               return -EINVAL;
> +       }
> +
>         err =3D drm_universal_plane_init(dev, plane, possible_crtcs,
> -                                      &mtk_plane_funcs, formats,
> -                                      ARRAY_SIZE(formats), modifiers, ty=
pe, NULL);
> +                                      &mtk_plane_funcs,
> +                                      formats, num_formats,
> +                                      modifiers, type, NULL);
> +
>         if (err) {
>                 DRM_ERROR("failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.h
> index 8f39011cdbfc..99aff7da0831 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -48,6 +48,7 @@ to_mtk_plane_state(struct drm_plane_state *state)
>
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
> -                  unsigned int supported_rotations);
> +                  unsigned int supported_rotations, const u32 *formats,
> +                  size_t num_formats);
>
>  #endif
> --
> 2.39.1.456.gfc5497dd1b-goog
>

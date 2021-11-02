Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74454439E5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 00:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3236E10C;
	Tue,  2 Nov 2021 23:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DD66E10C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:38:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 681A8610C8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635896334;
 bh=HBdLiIBc0CYjptwKDqaSHQh8QL5up7+lqoM4nl0FJzw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=my5h9a5eiOnklko2Cb92Sd4RORK+Jux0xRSCUW4mViJtTx70zR10ygGOeFkLrD0c8
 RKMJ5tbrxaatbPLhUH6IBM+lw1ls20RL0WhzJg9hOmqUFcr/4XtkJKNL+Xg8xIEOSf
 KgL/x82kVIMlOp7IBiQs1Aw8dJ0SapkycOPxcTXk1eE5jedqY3bAiRcZ8MLkxiyKsY
 IWnjV0BW0hckhJO0Csk5AeNzPgcG7DHKsH0lxfMKBKehqKGfjq5lGxxiSHLXiFfk3X
 fEHVTcljHFyun0eEyWsl26e0yEcS/d4SSUZgsnkrHh6PBL9gW5RHkSLNT1O33lO6KO
 VsP641ecj89tw==
Received: by mail-ed1-f50.google.com with SMTP id 5so2978641edw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 16:38:54 -0700 (PDT)
X-Gm-Message-State: AOAM5309VRy/mnQ5/ys4C4dNf5et0MF4T0VppnyciR+L/g6Z+cPPyaaE
 FzLMvE5KzyclYz0GWQxf4hoWR4/rF8L/W5WSNw==
X-Google-Smtp-Source: ABdhPJw5AjLdv20UVRKPfUVwxYSPVMBE5IjvtZtJVB8f2kJVtDmuU6dA2HuHGsR+CIf8zASCkpF3jUqUcJeSK2yNTO4=
X-Received: by 2002:a05:6402:144f:: with SMTP id
 d15mr46115983edx.43.1635896332735; 
 Tue, 02 Nov 2021 16:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-13-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-13-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 3 Nov 2021 07:38:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8-3jhubwOAyqn-Zya=t_KjXgkf-znxmY8PCxbT2oH0DQ@mail.gmail.com>
Message-ID: <CAAOTY_8-3jhubwOAyqn-Zya=t_KjXgkf-znxmY8PCxbT2oH0DQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/20] drm/mediatek: add display MDP RDMA support for
 MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add MDP_RDMA driver for MT8195. MDP_RDMA is the DMA engine of
> the ovl_adaptor component.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile       |   3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |   7 +
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 316 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.h |  20 ++
>  4 files changed, 345 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index a38e88e82d12..6e604a933ed0 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -13,7 +13,8 @@ mediatek-drm-y :=3D mtk_disp_aal.o \
>                   mtk_drm_gem.o \
>                   mtk_drm_plane.o \
>                   mtk_dsi.o \
> -                 mtk_dpi.o
> +                 mtk_dpi.o \
> +                 mtk_mdp_rdma.o
>
>  obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index a33b13fe2b6e..b3a372cab0bd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -8,6 +8,7 @@
>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  #include "mtk_drm_plane.h"
> +#include "mtk_mdp_rdma.h"
>
>  int mtk_aal_clk_enable(struct device *dev);
>  void mtk_aal_clk_disable(struct device *dev);
> @@ -106,4 +107,10 @@ void mtk_rdma_enable_vblank(struct device *dev,
>                             void *vblank_cb_data);
>  void mtk_rdma_disable_vblank(struct device *dev);
>
> +int mtk_mdp_rdma_clk_enable(struct device *dev);
> +void mtk_mdp_rdma_clk_disable(struct device *dev);
> +void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> +void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> +void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cf=
g,
> +                        struct cmdq_pkt *cmdq_pkt);
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/me=
diatek/mtk_mdp_rdma.c
> new file mode 100644
> index 000000000000..d7926e43e77e
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_disp_drv.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_mdp_rdma.h"
> +
> +#define MDP_RDMA_EN                    0x000
> +#define FLD_ROT_ENABLE                         BIT(0)
> +#define MDP_RDMA_RESET                 0x008
> +#define MDP_RDMA_CON                   0x020
> +#define FLD_OUTPUT_10B                         BIT(5)
> +#define FLD_SIMPLE_MODE                                BIT(4)
> +#define MDP_RDMA_GMCIF_CON             0x028
> +#define FLD_COMMAND_DIV                                BIT(0)
> +#define FLD_EXT_PREULTRA_EN                    BIT(3)
> +#define FLD_RD_REQ_TYPE                                GENMASK(7, 4)
> +#define VAL_RD_REQ_TYPE_BURST_8_ACCESS         7
> +#define FLD_ULTRA_EN                           GENMASK(13, 12)
> +#define VAL_ULTRA_EN_ENABLE                    1
> +#define FLD_PRE_ULTRA_EN                       GENMASK(17, 16)
> +#define VAL_PRE_ULTRA_EN_ENABLE                        1
> +#define FLD_EXT_ULTRA_EN                       BIT(18)
> +#define MDP_RDMA_SRC_CON               0x030
> +#define FLD_OUTPUT_ARGB                                BIT(25)
> +#define FLD_BIT_NUMBER                         GENMASK(19, 18)
> +#define FLD_SWAP                               BIT(14)
> +#define FLD_UNIFORM_CONFIG                     BIT(17)
> +#define RDMA_INPUT_10BIT                       BIT(18)
> +#define FLD_SRC_FORMAT                         GENMASK(3, 0)
> +#define MDP_RDMA_COMP_CON              0x038
> +#define FLD_AFBC_EN                            BIT(22)
> +#define FLD_AFBC_YUV_TRANSFORM                 BIT(21)
> +#define FLD_UFBDC_EN                           BIT(12)
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE  0x060
> +#define FLD_MF_BKGD_WB                         GENMASK(22, 0)
> +#define MDP_RDMA_MF_SRC_SIZE           0x070
> +#define FLD_MF_SRC_H                           GENMASK(30, 16)
> +#define FLD_MF_SRC_W                           GENMASK(14, 0)
> +#define MDP_RDMA_MF_CLIP_SIZE          0x078
> +#define FLD_MF_CLIP_H                          GENMASK(30, 16)
> +#define FLD_MF_CLIP_W                          GENMASK(14, 0)
> +#define MDP_RDMA_SRC_OFFSET_0          0x118
> +#define FLD_SRC_OFFSET_0                       GENMASK(31, 0)
> +#define MDP_RDMA_TRANSFORM_0           0x200
> +#define FLD_INT_MATRIX_SEL                     GENMASK(27, 23)
> +#define FLD_TRANS_EN                           BIT(16)
> +#define MDP_RDMA_SRC_BASE_0            0xf00
> +#define FLD_SRC_BASE_0                         GENMASK(31, 0)
> +
> +#define RDMA_CSC_FULL709_TO_RGB                        5
> +#define RDMA_CSC_BT601_TO_RGB                  6
> +
> +enum rdma_format {
> +       RDMA_INPUT_FORMAT_RGB565 =3D 0,
> +       RDMA_INPUT_FORMAT_RGB888 =3D 1,
> +       RDMA_INPUT_FORMAT_RGBA8888 =3D 2,
> +       RDMA_INPUT_FORMAT_ARGB8888 =3D 3,
> +       RDMA_INPUT_FORMAT_UYVY =3D 4,
> +       RDMA_INPUT_FORMAT_YUY2 =3D 5,
> +       RDMA_INPUT_FORMAT_Y8 =3D 7,
> +       RDMA_INPUT_FORMAT_YV12 =3D 8,
> +       RDMA_INPUT_FORMAT_UYVY_3PL =3D 9,
> +       RDMA_INPUT_FORMAT_NV12 =3D 12,
> +       RDMA_INPUT_FORMAT_UYVY_2PL =3D 13,
> +       RDMA_INPUT_FORMAT_Y410 =3D 14
> +};
> +
> +struct mtk_mdp_rdma {
> +       void __iomem            *regs;
> +       struct clk              *clk;
> +       struct cmdq_client_reg  cmdq_reg;
> +};
> +
> +static unsigned int rdma_fmt_convert(unsigned int fmt)
> +{
> +       switch (fmt) {
> +       default:
> +       case DRM_FORMAT_RGB565:
> +               return RDMA_INPUT_FORMAT_RGB565;
> +       case DRM_FORMAT_BGR565:
> +               return RDMA_INPUT_FORMAT_RGB565 | FLD_SWAP;
> +       case DRM_FORMAT_RGB888:
> +               return RDMA_INPUT_FORMAT_RGB888;
> +       case DRM_FORMAT_BGR888:
> +               return RDMA_INPUT_FORMAT_RGB888 | FLD_SWAP;
> +       case DRM_FORMAT_RGBX8888:
> +       case DRM_FORMAT_RGBA8888:
> +               return RDMA_INPUT_FORMAT_ARGB8888;
> +       case DRM_FORMAT_BGRX8888:
> +       case DRM_FORMAT_BGRA8888:
> +               return RDMA_INPUT_FORMAT_ARGB8888 | FLD_SWAP;
> +       case DRM_FORMAT_XRGB8888:
> +       case DRM_FORMAT_ARGB8888:
> +               return RDMA_INPUT_FORMAT_RGBA8888;
> +       case DRM_FORMAT_XBGR8888:
> +       case DRM_FORMAT_ABGR8888:
> +               return RDMA_INPUT_FORMAT_RGBA8888 | FLD_SWAP;
> +       case DRM_FORMAT_ABGR2101010:
> +               return RDMA_INPUT_FORMAT_RGBA8888 | FLD_SWAP | RDMA_INPUT=
_10BIT;
> +       case DRM_FORMAT_ARGB2101010:
> +               return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_10BIT;
> +       case DRM_FORMAT_RGBA1010102:
> +               return RDMA_INPUT_FORMAT_ARGB8888 | FLD_SWAP | RDMA_INPUT=
_10BIT;
> +       case DRM_FORMAT_BGRA1010102:
> +               return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_10BIT;
> +       case DRM_FORMAT_UYVY:
> +               return RDMA_INPUT_FORMAT_UYVY;
> +       case DRM_FORMAT_YUYV:
> +               return RDMA_INPUT_FORMAT_YUY2;
> +       }
> +}
> +
> +static unsigned int rdma_color_convert(unsigned int color_encoding)
> +{
> +       switch (color_encoding) {
> +       default:
> +       case DRM_COLOR_YCBCR_BT709:
> +               return RDMA_CSC_FULL709_TO_RGB;
> +       case DRM_COLOR_YCBCR_BT601:
> +               return RDMA_CSC_BT601_TO_RGB;
> +       }
> +}
> +
> +static void mtk_mdp_rdma_fifo_config(struct device *dev, struct cmdq_pkt=
 *cmdq_pkt)
> +{
> +       struct mtk_mdp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write_mask(cmdq_pkt, FLD_EXT_ULTRA_EN | VAL_PRE_ULTRA_EN_=
ENABLE << 16 |
> +                          VAL_ULTRA_EN_ENABLE << 12 | VAL_RD_REQ_TYPE_BU=
RST_8_ACCESS << 4 |
> +                          FLD_EXT_PREULTRA_EN | FLD_COMMAND_DIV, &priv->=
cmdq_reg,
> +                          priv->regs, MDP_RDMA_GMCIF_CON, FLD_EXT_ULTRA_=
EN |
> +                          FLD_PRE_ULTRA_EN | FLD_ULTRA_EN | FLD_RD_REQ_T=
YPE |
> +                          FLD_EXT_PREULTRA_EN | FLD_COMMAND_DIV);
> +}
> +
> +void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_mdp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write_mask(cmdq_pkt, FLD_ROT_ENABLE, &priv->cmdq_reg,
> +                          priv->regs, MDP_RDMA_EN, FLD_ROT_ENABLE);
> +}
> +
> +void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_mdp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg,
> +                          priv->regs, MDP_RDMA_EN, FLD_ROT_ENABLE);
> +       mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs, MDP_RDMA_=
RESET);
> +       mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, MDP_RDMA_=
RESET);
> +}
> +
> +void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cf=
g,
> +                        struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_mdp_rdma *priv =3D dev_get_drvdata(dev);
> +       const struct drm_format_info *fmt_info =3D drm_format_info(cfg->f=
mt);
> +       bool csc_enable =3D fmt_info->is_yuv ? true : false;
> +       unsigned int src_pitch_y =3D cfg->pitch;
> +       unsigned int offset_y =3D 0;
> +
> +       mtk_mdp_rdma_fifo_config(dev, cmdq_pkt);
> +
> +       mtk_ddp_write_mask(cmdq_pkt, FLD_UNIFORM_CONFIG, &priv->cmdq_reg,=
 priv->regs,
> +                          MDP_RDMA_SRC_CON, FLD_UNIFORM_CONFIG);
> +       mtk_ddp_write_mask(cmdq_pkt, rdma_fmt_convert(cfg->fmt), &priv->c=
mdq_reg, priv->regs,
> +                          MDP_RDMA_SRC_CON, FLD_SWAP | FLD_SRC_FORMAT | =
FLD_BIT_NUMBER);
> +
> +       if (!csc_enable && fmt_info->has_alpha)
> +               mtk_ddp_write_mask(cmdq_pkt, FLD_OUTPUT_ARGB, &priv->cmdq=
_reg,
> +                                  priv->regs, MDP_RDMA_SRC_CON, FLD_OUTP=
UT_ARGB);
> +       else
> +               mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->re=
gs,
> +                                  MDP_RDMA_SRC_CON, FLD_OUTPUT_ARGB);
> +
> +       mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, &priv->cmdq_reg, priv->r=
egs,
> +                          MDP_RDMA_SRC_BASE_0, FLD_SRC_BASE_0);
> +
> +       mtk_ddp_write_mask(cmdq_pkt, src_pitch_y, &priv->cmdq_reg, priv->=
regs,
> +                          MDP_RDMA_MF_BKGD_SIZE_IN_BYTE, FLD_MF_BKGD_WB)=
;
> +
> +       mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, MDP_=
RDMA_COMP_CON,
> +                          FLD_AFBC_YUV_TRANSFORM | FLD_UFBDC_EN | FLD_AF=
BC_EN);
> +       mtk_ddp_write_mask(cmdq_pkt, FLD_OUTPUT_10B, &priv->cmdq_reg, pri=
v->regs,
> +                          MDP_RDMA_CON, FLD_OUTPUT_10B);
> +       mtk_ddp_write_mask(cmdq_pkt, FLD_SIMPLE_MODE, &priv->cmdq_reg, pr=
iv->regs,
> +                          MDP_RDMA_CON, FLD_SIMPLE_MODE);
> +       if (csc_enable)
> +               mtk_ddp_write_mask(cmdq_pkt, rdma_color_convert(cfg->colo=
r_encoding) << 23,
> +                                  &priv->cmdq_reg, priv->regs, MDP_RDMA_=
TRANSFORM_0,
> +                                  FLD_INT_MATRIX_SEL);
> +       mtk_ddp_write_mask(cmdq_pkt, csc_enable << 16, &priv->cmdq_reg, p=
riv->regs,
> +                          MDP_RDMA_TRANSFORM_0, FLD_TRANS_EN);
> +
> +       offset_y  =3D cfg->x_left * fmt_info->cpp[0] + cfg->y_top * src_p=
itch_y;
> +
> +       mtk_ddp_write_mask(cmdq_pkt, offset_y, &priv->cmdq_reg, priv->reg=
s,
> +                          MDP_RDMA_SRC_OFFSET_0, FLD_SRC_OFFSET_0);
> +       mtk_ddp_write_mask(cmdq_pkt, cfg->width, &priv->cmdq_reg, priv->r=
egs,
> +                          MDP_RDMA_MF_SRC_SIZE, FLD_MF_SRC_W);
> +       mtk_ddp_write_mask(cmdq_pkt, cfg->height << 16, &priv->cmdq_reg, =
priv->regs,
> +                          MDP_RDMA_MF_SRC_SIZE, FLD_MF_SRC_H);
> +       mtk_ddp_write_mask(cmdq_pkt, cfg->width, &priv->cmdq_reg, priv->r=
egs,
> +                          MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_W);
> +       mtk_ddp_write_mask(cmdq_pkt, cfg->height << 16, &priv->cmdq_reg, =
priv->regs,
> +                          MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
> +}
> +
> +int mtk_mdp_rdma_clk_enable(struct device *dev)
> +{
> +       struct mtk_mdp_rdma *rdma =3D dev_get_drvdata(dev);
> +
> +       clk_prepare_enable(rdma->clk);
> +       return 0;
> +}
> +
> +void mtk_mdp_rdma_clk_disable(struct device *dev)
> +{
> +       struct mtk_mdp_rdma *rdma =3D dev_get_drvdata(dev);
> +
> +       clk_disable_unprepare(rdma->clk);
> +}
> +
> +static int mtk_mdp_rdma_bind(struct device *dev, struct device *master,
> +                            void *data)
> +{
> +       return 0;
> +}
> +
> +static void mtk_mdp_rdma_unbind(struct device *dev, struct device *maste=
r,
> +                               void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_mdp_rdma_component_ops =3D {
> +       .bind   =3D mtk_mdp_rdma_bind,
> +       .unbind =3D mtk_mdp_rdma_unbind,
> +};
> +
> +static int mtk_mdp_rdma_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *res;
> +       struct mtk_mdp_rdma *priv;
> +       int ret =3D 0;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       priv->regs =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(priv->regs)) {
> +               dev_err(dev, "failed to ioremap rdma\n");
> +               return PTR_ERR(priv->regs);
> +       }
> +
> +       priv->clk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(priv->clk)) {
> +               dev_err(dev, "failed to get rdma clk\n");
> +               return PTR_ERR(priv->clk);
> +       }
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       ret =3D cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
> +       if (ret)
> +               dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +       platform_set_drvdata(pdev, priv);
> +
> +       pm_runtime_enable(dev);
> +
> +       ret =3D component_add(dev, &mtk_mdp_rdma_component_ops);
> +       if (ret !=3D 0) {
> +               pm_runtime_disable(dev);
> +               dev_err(dev, "Failed to add component: %d\n", ret);
> +       }
> +       return ret;
> +}
> +
> +static int mtk_mdp_rdma_remove(struct platform_device *pdev)
> +{
> +       component_del(&pdev->dev, &mtk_mdp_rdma_component_ops);
> +       pm_runtime_disable(&pdev->dev);
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_mdp_rdma_driver_dt_match[] =3D {
> +       { .compatible =3D "mediatek,mt8195-vdo1-rdma", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mdp_rdma_driver_dt_match);
> +
> +struct platform_driver mtk_mdp_rdma_driver =3D {
> +       .probe =3D mtk_mdp_rdma_probe,
> +       .remove =3D mtk_mdp_rdma_remove,
> +       .driver =3D {
> +               .name =3D "mediatek-mdp-rdma",
> +               .owner =3D THIS_MODULE,
> +               .of_match_table =3D mtk_mdp_rdma_driver_dt_match,
> +       },
> +};
> +module_platform_driver(mtk_mdp_rdma_driver);
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h b/drivers/gpu/drm/me=
diatek/mtk_mdp_rdma.h
> new file mode 100644
> index 000000000000..9943ee3aac31
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_MDP_RDMA_H__
> +#define __MTK_MDP_RDMA_H__
> +
> +struct mtk_mdp_rdma_cfg {
> +       unsigned int    pitch;
> +       unsigned int    addr0;
> +       unsigned int    width;
> +       unsigned int    height;
> +       unsigned int    x_left;
> +       unsigned int    y_top;
> +       int             fmt;
> +       int             color_encoding;
> +};
> +
> +#endif // __MTK_MDP_RDMA_H__
> --
> 2.18.0
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12B3CCBA5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 01:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1F989EAE;
	Sun, 18 Jul 2021 23:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB2889EAE
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 23:56:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3510F61181
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 23:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626652606;
 bh=PPyXCFnwWGjgnslXDWjVRtpFzsDdize3jpWh2L/DS1g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VYx9FF20gN+u4qly8uZzcNGIfb2PK8qmKtJY8z4exk/1xL5pSntsT/wWR7E3X4PuJ
 sLONgEFFs3lPORs3nq0Rdq7yjCC7gQ7+AHXujG3C4+6p7YM4rwHjkcSbGBL8ah1Ucp
 okElXpUlh4Qri9lLhwDe1hHjGAQZ6Vr5dlFpuS25zaqwBHGbHs4rSKcu7UBmJ0EBHV
 tzAViZFdY4yxu3AQ8FkriMrboZFBxYAS2Vlsy0uZ6LhlOeiIJC5v3nsP4OesnJ0syz
 WkSwKNfxfioz+TgrqTNT90OPATX1qtWzePxjIiTalVQvEsApSDllg5obgCdbll97bP
 e+coImRP+96mQ==
Received: by mail-ej1-f51.google.com with SMTP id nd37so25454475ejc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 16:56:46 -0700 (PDT)
X-Gm-Message-State: AOAM533ufNa5sQjjomk8uJwKLIsOhJ36nwkHO1KYEx3b9bchNnuOfUzZ
 IK7MYKPW+7FATp9Uy7dVT4iGeaQ1fiW/UF4j/A==
X-Google-Smtp-Source: ABdhPJzCMIRNdxlHhPFOLWKWnaI/gsxXIm4SbALU6rxb5XdQ/dAAg4T9Mq6d80jYgGfkNehDqjuev2w99XoHDtwxJ8w=
X-Received: by 2002:a17:906:4745:: with SMTP id
 j5mr24501724ejs.75.1626652604539; 
 Sun, 18 Jul 2021 16:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
 <20210717090408.28283-7-nancy.lin@mediatek.com>
In-Reply-To: <20210717090408.28283-7-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 19 Jul 2021 07:56:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY__1iiptUgYy2G4BOyYEkqLVO3BRWhMru0p=aB3JcBzd_A@mail.gmail.com>
Message-ID: <CAAOTY__1iiptUgYy2G4BOyYEkqLVO3BRWhMru0p=aB3JcBzd_A@mail.gmail.com>
Subject: Re: [PATCH v1 06/10] drm/mediatek: add ETHDR support for MT8195
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

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=8817=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=885:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add ETHDR module files:
> ETHDR is designed for HDR video and graphics conversion in the external
> display path. It handles multiple HDR input types and performs tone
> mapping, color space/color format conversion, and then combines
> different layers, output the required HDR or SDR signal to the
> subsequent display path.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  11 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  drivers/gpu/drm/mediatek/mtk_ethdr.c        | 537 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h        |  20 +
>  8 files changed, 584 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 27c89847d43b..fcce08710cef 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -13,7 +13,8 @@ mediatek-drm-y :=3D mtk_disp_ccorr.o \
>                   mtk_drm_gem.o \
>                   mtk_drm_plane.o \
>                   mtk_dsi.o \
> -                 mtk_dpi.o
> +                 mtk_dpi.o \
> +                 mtk_ethdr.o
>
>  obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 3e27ce7fef57..7227ffbc3eae 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -105,4 +105,12 @@ void mtk_rdma_enable_vblank(struct device *dev,
>                             void *vblank_cb_data);
>  void mtk_rdma_disable_vblank(struct device *dev);
>
> +int mtk_ethdr_clk_enable(struct device *dev);
> +void mtk_ethdr_clk_disable(struct device *dev);
> +void mtk_ethdr_config(struct device *dev, unsigned int w,
> +                     unsigned int h, unsigned int vrefresh,
> +                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_ethdr_start(struct device *dev);
> +void mtk_ethdr_stop(struct device *dev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 9125d0f6352f..3fa86f12feb4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -355,6 +355,14 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe =3D =
{
>         .start =3D mtk_ufoe_start,
>  };
>
> +static const struct mtk_ddp_comp_funcs ddp_ethdr =3D {
> +       .clk_enable =3D mtk_ethdr_clk_enable,
> +       .clk_disable =3D mtk_ethdr_clk_disable,
> +       .config =3D mtk_ethdr_config,
> +       .start =3D mtk_ethdr_start,
> +       .stop =3D mtk_ethdr_stop,
> +};
> +
>  static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] =3D {
>         [MTK_DISP_OVL] =3D "ovl",
>         [MTK_DISP_OVL_2L] =3D "ovl-2l",
> @@ -363,6 +371,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_C=
OMP_TYPE_MAX] =3D {
>         [MTK_DISP_COLOR] =3D "color",
>         [MTK_DISP_CCORR] =3D "ccorr",
>         [MTK_DISP_AAL] =3D "aal",
> +       [MTK_DISP_ETHDR] =3D "ethdr",
>         [MTK_DISP_GAMMA] =3D "gamma",
>         [MTK_DISP_DITHER] =3D "dither",
>         [MTK_DISP_UFOE] =3D "ufoe",
> @@ -399,6 +408,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matche=
s[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_DSI1]    =3D { MTK_DSI,            1, &ddp_dsi },
>         [DDP_COMPONENT_DSI2]    =3D { MTK_DSI,            2, &ddp_dsi },
>         [DDP_COMPONENT_DSI3]    =3D { MTK_DSI,            3, &ddp_dsi },
> +       [DDP_COMPONENT_ETHDR]   =3D { MTK_DISP_ETHDR,     0, &ddp_ethdr},
>         [DDP_COMPONENT_GAMMA]   =3D { MTK_DISP_GAMMA,     0, &ddp_gamma }=
,
>         [DDP_COMPONENT_MERGE0]  =3D { MTK_DISP_MERGE,     0, &ddp_merge }=
,
>         [DDP_COMPONENT_MERGE1]  =3D { MTK_DISP_MERGE,     1, &ddp_merge }=
,
> @@ -536,6 +546,7 @@ int mtk_ddp_comp_init(struct device_node *node, struc=
t mtk_ddp_comp *comp,
>             type =3D=3D MTK_DISP_CCORR ||
>             type =3D=3D MTK_DISP_COLOR ||
>             type =3D=3D MTK_DISP_DSC ||
> +           type =3D=3D MTK_DISP_ETHDR ||
>             type =3D=3D MTK_DISP_GAMMA ||
>             type =3D=3D MTK_DISP_MERGE ||
>             type =3D=3D MTK_DISP_OVL ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 0afd78c0bc92..f55efba6e744 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -36,6 +36,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_BLS,
>         MTK_DISP_DSC,
>         MTK_DISP_MERGE,
> +       MTK_DISP_ETHDR,
>         MTK_DDP_COMP_TYPE_MAX,
>  };
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 11c25daf05d8..ace958a34bb5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -480,6 +480,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_PWM },
>         { .compatible =3D "mediatek,mt8173-disp-od",
>           .data =3D (void *)MTK_DISP_OD },
> +       { .compatible =3D "mediatek,mt8195-disp-ethdr",
> +         .data =3D (void *)MTK_DISP_ETHDR },
>         { }
>  };
>
> @@ -567,6 +569,7 @@ static int mtk_drm_probe(struct platform_device *pdev=
)
>                 if (comp_type =3D=3D MTK_DISP_CCORR ||
>                     comp_type =3D=3D MTK_DISP_COLOR ||
>                     comp_type =3D=3D MTK_DISP_DSC ||
> +                   comp_type =3D=3D MTK_DISP_ETHDR ||
>                     comp_type =3D=3D MTK_DISP_GAMMA ||
>                     comp_type =3D=3D MTK_DISP_MERGE ||
>                     comp_type =3D=3D MTK_DISP_OVL ||
> @@ -676,6 +679,7 @@ static struct platform_driver * const mtk_drm_drivers=
[] =3D {
>         &mtk_dpi_driver,
>         &mtk_drm_platform_driver,
>         &mtk_dsi_driver,
> +       &mtk_ethdr_driver,
>  };
>
>  static int __init mtk_drm_init(void)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.h
> index c4d802a43531..c87ebb5309d0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -55,5 +55,6 @@ extern struct platform_driver mtk_disp_dsc_driver;
>  extern struct platform_driver mtk_disp_merge_driver;
>  extern struct platform_driver mtk_dpi_driver;
>  extern struct platform_driver mtk_dsi_driver;
> +extern struct platform_driver mtk_ethdr_driver;
>
>  #endif /* MTK_DRM_DRV_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/media=
tek/mtk_ethdr.c
> new file mode 100644
> index 000000000000..ceadb28169b8
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -0,0 +1,537 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_ethdr.h"
> +
> +#define MIX_EN         0xc
> +#define MIX_RST                0x14
> +#define MIX_ROI_SIZE   0x18
> +#define MIX_DATAPATH_CON       0x1c
> +#define MIX_ROI_BGCLR  0x20
> +#define MIX_SRC_CON    0x24
> +#define MIX_L0_CON     0x28
> +#define MIX_L0_SRC_SIZE        0x30
> +#define MIX_L0_OFFSET  0x34
> +#define MIX_L1_CON     0x40
> +#define MIX_L1_SRC_SIZE        0x48
> +#define MIX_L1_OFFSET  0x4c
> +#define MIX_L2_CON     0x58
> +#define MIX_L2_SRC_SIZE        0x60
> +#define MIX_L2_OFFSET  0x64
> +#define MIX_L3_CON     0x70
> +#define MIX_L3_SRC_SIZE        0x78
> +#define MIX_L3_OFFSET  0x7c
> +#define MIX_FUNC_DCM0  0x120
> +#define MIX_FUNC_DCM1  0x124
> +
> +#define HDR_VDO_FE_0804_HDR_DM_FE      0x804
> +#define HDR_VDO_FE_081C_HDR_DM_FE      0x81c
> +#define HDR_VDO_FE_09EC_HDR_DM_FE      0x9ec
> +#define HDR_VDO_FE_0618_HDR_TOP_FE     0x618
> +#define HDR_VDO_FE_061C_HDR_TOP_FE     0x61c
> +#define HDR_VDO_FE_06D0_HDR_TOP_FE     0x6d0
> +#define HDR_VDO_FE_0634_HDR_TOP_FE     0x634
> +
> +#define HDR_GFX_FE_0100_GFX_DV_WP      0x100
> +#define HDR_GFX_FE_012C_GFX_DV_WP      0x12c
> +#define HDR_GFX_FE_0134_GFX_DV_WP      0x134
> +#define HDR_GFX_FE_0138_GFX_DV_WP      0x138
> +#define HDR_GFX_FE_013C_GFX_DV_WP      0x13c
> +#define HDR_GFX_FE_0140_GFX_DV_WP      0x140
> +#define HDR_GFX_FE_0144_GFX_DV_WP      0x144
> +#define HDR_GFX_FE_0148_GFX_DV_WP      0x148
> +#define HDR_GFX_FE_014C_GFX_DV_WP      0x14c
> +#define HDR_GFX_FE_0150_GFX_DV_WP      0x150
> +#define HDR_GFX_FE_0154_GFX_DV_WP      0x154
> +#define HDR_GFX_FE_0204_GFX_HDR_FE     0x204
> +#define HDR_GFX_FE_021C_GFX_HDR_FE     0x21c
> +#define HDR_GFX_FE_03EC_GFX_HDR_FE     0x3ec
> +
> +#define HDR_VDO_BE_0204_VDO_DM_BE      0x204
> +#define HDR_VDO_BE_0320_VDO_DM_BE      0x320
> +#define HDR_VDO_BE_03C8_VDO_DM_BE      0x3c8
> +
> +#define VDO1_CONFIG_SW0_RST_B 0x1d0
> +#define VDO1_CONFIG_SW1_RST_B 0x1d4
> +       #define HDR_ASYNC_RESET_BIT (BIT(19) | BIT(20) | BIT(21) | BIT(22=
) | BIT(23))
> +#define VDO1_CONFIG_HDR_BE_ASYNC_CFG_WD 0xe70
> +#define VDO1_CONFIG_HDR_TOP_CFG 0xd00
> +       #define HDR_ALPHA_SEL_MIXER_IN1 BIT(20)
> +       #define HDR_ALPHA_SEL_MIXER_IN2 BIT(21)
> +       #define HDR_ALPHA_SEL_MIXER_IN3 BIT(22)
> +       #define HDR_ALPHA_SEL_MIXER_IN4 BIT(23)
> +#define VDO1_CONFIG_MIXER_IN1_ALPHA 0xd30
> +#define VDO1_CONFIG_MIXER_IN2_ALPHA 0xd34
> +#define VDO1_CONFIG_MIXER_IN3_ALPHA 0xd38
> +#define VDO1_CONFIG_MIXER_IN4_ALPHA 0xd3c
> +#define VDO1_CONFIG_MIXER_IN4_PAD   0xd4c
> +
> +#define        MIXER_ALPHA_AEN         BIT(8)
> +#define        MIXER_ALPHA             0xff
> +#define ETHDR_CLK_NUM          13
> +
> +enum mtk_ethdr_comp_id {
> +       ETHDR_MIXER,
> +       ETHDR_VDO_FE0,
> +       ETHDR_VDO_FE1,
> +       ETHDR_GFX_FE0,
> +       ETHDR_GFX_FE1,
> +       ETHDR_VDO_BE,
> +       ETHDR_ADL_DS,
> +       ETHDR_ID_MAX
> +};
> +
> +struct mtk_ethdr_comp {
> +       struct device *dev;
> +       void __iomem *regs;
> +       struct cmdq_client_reg cmdq_base;
> +};
> +
> +struct mtk_ethdr {
> +       void __iomem *top_regs;
> +       struct cmdq_client_reg top_cmdq_base;
> +       struct mtk_ethdr_comp ethdr_comp[ETHDR_ID_MAX];
> +       struct clk_bulk_data ethdr_clk[ETHDR_CLK_NUM];
> +};
> +
> +static const char * const ethdr_comp_str[] =3D {
> +       "ETHDR_MIXER",
> +       "ETHDR_VDO_FE0",
> +       "ETHDR_VDO_FE1",
> +       "ETHDR_GFX_FE0",
> +       "ETHDR_GFX_FE1",
> +       "ETHDR_VDO_BE",
> +       "ETHDR_ADL_DS",
> +       "ETHDR_ID_MAX"
> +};
> +
> +static const char * const ethdr_clk_str[] =3D {
> +       "ethdr_top",
> +       "mixer",
> +       "vdo_fe0",
> +       "vdo_fe1",
> +       "gfx_fe0",
> +       "gfx_fe1",
> +       "vdo_be",
> +       "adl_ds",
> +       "vdo_fe0_async",
> +       "vdo_fe1_async",
> +       "gfx_fe0_async",
> +       "gfx_fe1_async",
> +       "vdo_be_async",
> +};
> +
> +static const unsigned int alpha_source_sel[] =3D {
> +       HDR_ALPHA_SEL_MIXER_IN1,
> +       HDR_ALPHA_SEL_MIXER_IN2,
> +       HDR_ALPHA_SEL_MIXER_IN3,
> +       HDR_ALPHA_SEL_MIXER_IN4,
> +};
> +
> +void mtk_ethdr_layer_on(struct device *dev, unsigned int idx,
> +                       struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       dev_dbg(dev, "%s+ idx:%d", __func__, idx);
> +
> +       if (idx < 4)
> +               mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base,
> +                                  mixer->regs, MIX_SRC_CON, BIT(idx));
> +}
> +
> +void mtk_ethdr_layer_off(struct device *dev, unsigned int idx,
> +                        struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       dev_dbg(dev, "%s+ idx:%d", __func__, idx);
> +
> +       switch (idx) {
> +       case 0:
> +               mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L0_SRC_SIZE, ~0);
> +               break;
> +       case 1:
> +               mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L1_SRC_SIZE, ~0);
> +               break;
> +       case 2:
> +               mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L2_SRC_SIZE, ~0);
> +               break;
> +       case 3:
> +               mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L3_SRC_SIZE, ~0);
> +               break;
> +       default:
> +               dev_dbg(dev, "%s Wrong layer ID\n", __func__);
> +               break;
> +       }

Why not just

               mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
                                  mixer->regs, MIX_SRC_CON, BIT(idx));

> +}
> +
> +void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
> +                           struct mtk_plane_state *state,
> +                           struct cmdq_pkt *cmdq_pkt)

Because ethdr has layers and vblank interrupt, I think ethdr should be
part of pseudo ovl, so squash these two into one.

> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +       struct mtk_plane_pending_state *pending =3D &state->pending;
> +       unsigned int src_size =3D (pending->height << 16) | pending->widt=
h;
> +       unsigned int offset =3D (pending->y << 16) | pending->x;
> +       unsigned int alpha_con =3D 0;
> +       unsigned int fmt =3D 0;
> +
> +       fmt =3D state->pending.format;

fmt is useless, so remove.

> +
> +       if (state->base.fb && state->base.fb->format->has_alpha) {
> +               alpha_con =3D MIXER_ALPHA_AEN | MIXER_ALPHA;
> +               mtk_ddp_write_mask(cmdq_pkt, 0, &priv->top_cmdq_base, pri=
v->top_regs,
> +                                  VDO1_CONFIG_HDR_TOP_CFG, alpha_source_=
sel[idx]);

Set vdosys1 register in vdosys1 driver, and vdosys1 driver provide
interface for this driver to use.

> +       } else {
> +               mtk_ddp_write_mask(cmdq_pkt, ~0, &priv->top_cmdq_base, pr=
iv->top_regs,
> +                                  VDO1_CONFIG_HDR_TOP_CFG, alpha_source_=
sel[idx]);
> +       }
> +
> +       switch (idx) {
> +       case 0:
> +               mtk_ddp_write_mask(cmdq_pkt, src_size, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L0_SRC_SIZE, ~0);

#define MIX_L_SRC_SIZE(n)  (0x30 + 0x18 * (n))

And you could get rid of this switch case.

> +               mtk_ddp_write_mask(cmdq_pkt, offset, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L0_OFFSET, ~0);
> +               mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base=
,
> +                                  mixer->regs, MIX_L0_CON, 0x1ff);
> +               break;
> +       case 1:
> +               mtk_ddp_write_mask(cmdq_pkt, src_size, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L1_SRC_SIZE, ~0);
> +               mtk_ddp_write_mask(cmdq_pkt, offset, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L1_OFFSET, ~0);
> +               mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base=
,
> +                                  mixer->regs, MIX_L1_CON, 0x1ff);
> +               break;
> +       case 2:
> +               mtk_ddp_write_mask(cmdq_pkt, src_size, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L2_SRC_SIZE, ~0);
> +               mtk_ddp_write_mask(cmdq_pkt, offset, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L2_OFFSET, ~0);
> +               mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base=
,
> +                                  mixer->regs, MIX_L2_CON, 0x1ff);
> +               break;
> +       case 3:
> +               mtk_ddp_write_mask(cmdq_pkt, src_size, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L3_SRC_SIZE, ~0);
> +               mtk_ddp_write_mask(cmdq_pkt, offset, &mixer->cmdq_base,
> +                                  mixer->regs, MIX_L3_OFFSET, ~0);
> +               mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base=
,
> +                                  mixer->regs, MIX_L3_CON, 0x1ff);
> +               break;
> +       default:
> +               dev_dbg(dev, "%s Wrong layer ID\n", __func__);
> +               break;
> +       }
> +}
> +
> +void mtk_ethdr_config(struct device *dev, unsigned int w,
> +                     unsigned int h, unsigned int vrefresh,
> +                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
> +       mtk_ddp_write_mask(cmdq_pkt, (h << 16) | (w / 2), &priv->top_cmdq=
_base,
> +                          priv->top_regs, VDO1_CONFIG_HDR_BE_ASYNC_CFG_W=
D, ~0);
> +       mtk_ddp_write_mask(cmdq_pkt, 0, &priv->top_cmdq_base,
> +                          priv->top_regs, VDO1_CONFIG_MIXER_IN4_PAD, ~0)=
;
> +       mtk_ddp_write_mask(cmdq_pkt, (h << 16 | w), &mixer->cmdq_base,
> +                          mixer->regs, MIX_ROI_SIZE, ~0);

      mtk_ddp_write(cmdq_pkt, (h << 16 | w), &mixer->cmdq_base,
                         mixer->regs, MIX_ROI_SIZE);

> +       mtk_ddp_write_mask(cmdq_pkt, 0x01000100, &priv->top_cmdq_base,
> +                          priv->top_regs, VDO1_CONFIG_MIXER_IN1_ALPHA, ~=
0);
> +       mtk_ddp_write_mask(cmdq_pkt, 0x01000100, &priv->top_cmdq_base,
> +                          priv->top_regs, VDO1_CONFIG_MIXER_IN2_ALPHA, ~=
0);
> +       mtk_ddp_write_mask(cmdq_pkt, 0x01000100, &priv->top_cmdq_base,
> +                          priv->top_regs, VDO1_CONFIG_MIXER_IN3_ALPHA, ~=
0);
> +       mtk_ddp_write_mask(cmdq_pkt, 0x01000100, &priv->top_cmdq_base,
> +                          priv->top_regs, VDO1_CONFIG_MIXER_IN4_ALPHA, ~=
0);
> +}
> +
> +void mtk_ethdr_start(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *vdo_fe0 =3D &priv->ethdr_comp[ETHDR_VDO_FE=
0];
> +       struct mtk_ethdr_comp *vdo_fe1 =3D &priv->ethdr_comp[ETHDR_VDO_FE=
1];
> +       struct mtk_ethdr_comp *gfx_fe0 =3D &priv->ethdr_comp[ETHDR_GFX_FE=
0];
> +       struct mtk_ethdr_comp *gfx_fe1 =3D &priv->ethdr_comp[ETHDR_GFX_FE=
1];
> +       struct mtk_ethdr_comp *vdo_be =3D &priv->ethdr_comp[ETHDR_VDO_BE]=
;
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       mtk_ddp_write_mask(NULL, 0xfd, &vdo_fe0->cmdq_base, vdo_fe0->regs=
,
> +                          HDR_VDO_FE_0804_HDR_DM_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x80, &vdo_fe0->cmdq_base, vdo_fe0->regs=
,
> +                          HDR_VDO_FE_09EC_HDR_DM_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x12e, &vdo_fe0->cmdq_base, vdo_fe0->reg=
s,
> +                          HDR_VDO_FE_081C_HDR_DM_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x0, &vdo_fe0->cmdq_base, vdo_fe0->regs,
> +                          HDR_VDO_FE_0618_HDR_TOP_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x2, &vdo_fe0->cmdq_base, vdo_fe0->regs,
> +                          HDR_VDO_FE_061C_HDR_TOP_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x8001, &vdo_fe0->cmdq_base, vdo_fe0->re=
gs,
> +                          HDR_VDO_FE_06D0_HDR_TOP_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x8000, &vdo_fe0->cmdq_base, vdo_fe0->re=
gs,
> +                          HDR_VDO_FE_0634_HDR_TOP_FE, ~0);

Explain what these value mean.

> +
> +       mtk_ddp_write_mask(NULL, 0xfd, &vdo_fe1->cmdq_base, vdo_fe1->regs=
,
> +                          HDR_VDO_FE_0804_HDR_DM_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x80, &vdo_fe1->cmdq_base, vdo_fe1->regs=
,
> +                          HDR_VDO_FE_09EC_HDR_DM_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x12e, &vdo_fe1->cmdq_base, vdo_fe1->reg=
s,
> +                          HDR_VDO_FE_081C_HDR_DM_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x0, &vdo_fe1->cmdq_base, vdo_fe1->regs,
> +                          HDR_VDO_FE_0618_HDR_TOP_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x2, &vdo_fe1->cmdq_base, vdo_fe1->regs,
> +                          HDR_VDO_FE_061C_HDR_TOP_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x8001, &vdo_fe1->cmdq_base, vdo_fe1->re=
gs,
> +                          HDR_VDO_FE_06D0_HDR_TOP_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x8000, &vdo_fe1->cmdq_base, vdo_fe1->re=
gs,
> +                          HDR_VDO_FE_0634_HDR_TOP_FE, ~0);
> +
> +       mtk_ddp_write_mask(NULL, 0x8001, &gfx_fe0->cmdq_base, gfx_fe0->re=
gs,
> +                          HDR_GFX_FE_0100_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0xe030, &gfx_fe0->cmdq_base, gfx_fe0->re=
gs,
> +                          HDR_GFX_FE_012C_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1c0, &gfx_fe0->cmdq_base, gfx_fe0->reg=
s,
> +                          HDR_GFX_FE_0134_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1e69, &gfx_fe0->cmdq_base, gfx_fe0->re=
gs,
> +                          HDR_GFX_FE_0138_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1fd7, &gfx_fe0->cmdq_base, gfx_fe0->re=
gs,
> +                          HDR_GFX_FE_013C_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0xba, &gfx_fe0->cmdq_base, gfx_fe0->regs=
,
> +                          HDR_GFX_FE_0140_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x275, &gfx_fe0->cmdq_base, gfx_fe0->reg=
s,
> +                          HDR_GFX_FE_0144_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x3f, &gfx_fe0->cmdq_base, gfx_fe0->regs=
,
> +                          HDR_GFX_FE_0148_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1f99, &gfx_fe0->cmdq_base, gfx_fe0->re=
gs,
> +                          HDR_GFX_FE_014C_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1ea6, &gfx_fe0->cmdq_base, gfx_fe0->re=
gs,
> +                          HDR_GFX_FE_0150_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1c2, &gfx_fe0->cmdq_base, gfx_fe0->reg=
s,
> +                          HDR_GFX_FE_0154_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0xfd, &gfx_fe0->cmdq_base, gfx_fe0->regs=
,
> +                          HDR_GFX_FE_0204_GFX_HDR_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x80, &gfx_fe0->cmdq_base, gfx_fe0->regs=
,
> +                          HDR_GFX_FE_03EC_GFX_HDR_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x20, &gfx_fe0->cmdq_base, gfx_fe0->regs=
,
> +                          HDR_GFX_FE_021C_GFX_HDR_FE, ~0);
> +
> +       mtk_ddp_write_mask(NULL, 0x8001, &gfx_fe1->cmdq_base, gfx_fe1->re=
gs,
> +                          HDR_GFX_FE_0100_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0xe030, &gfx_fe1->cmdq_base, gfx_fe1->re=
gs,
> +                          HDR_GFX_FE_012C_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1c0, &gfx_fe1->cmdq_base, gfx_fe1->reg=
s,
> +                          HDR_GFX_FE_0134_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1e69, &gfx_fe1->cmdq_base, gfx_fe1->re=
gs,
> +                          HDR_GFX_FE_0138_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1fd7, &gfx_fe1->cmdq_base, gfx_fe1->re=
gs,
> +                          HDR_GFX_FE_013C_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0xba, &gfx_fe1->cmdq_base, gfx_fe1->regs=
,
> +                          HDR_GFX_FE_0140_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x275, &gfx_fe1->cmdq_base, gfx_fe1->reg=
s,
> +                          HDR_GFX_FE_0144_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x3f, &gfx_fe1->cmdq_base, gfx_fe1->regs=
,
> +                          HDR_GFX_FE_0148_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1f99, &gfx_fe1->cmdq_base, gfx_fe1->re=
gs,
> +                          HDR_GFX_FE_014C_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1ea6, &gfx_fe1->cmdq_base, gfx_fe1->re=
gs,
> +                          HDR_GFX_FE_0150_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0x1c2, &gfx_fe1->cmdq_base, gfx_fe1->reg=
s,
> +                          HDR_GFX_FE_0154_GFX_DV_WP, ~0);
> +       mtk_ddp_write_mask(NULL, 0xfd, &gfx_fe1->cmdq_base, gfx_fe1->regs=
,
> +                          HDR_GFX_FE_0204_GFX_HDR_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x80, &gfx_fe1->cmdq_base, gfx_fe1->regs=
,
> +                          HDR_GFX_FE_03EC_GFX_HDR_FE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x20, &gfx_fe1->cmdq_base, gfx_fe1->regs=
,
> +                          HDR_GFX_FE_021C_GFX_HDR_FE, ~0);
> +
> +       mtk_ddp_write_mask(NULL, 0x7e, &vdo_be->cmdq_base, vdo_be->regs,
> +                          HDR_VDO_BE_0204_VDO_DM_BE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x00, &vdo_be->cmdq_base, vdo_be->regs,
> +                          HDR_VDO_BE_0320_VDO_DM_BE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x01, &vdo_be->cmdq_base, vdo_be->regs,
> +                          HDR_VDO_BE_03C8_VDO_DM_BE, ~0);
> +
> +       mtk_ddp_write_mask(NULL, 0xffffffff, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_FUNC_DCM0, ~0);
> +       mtk_ddp_write_mask(NULL, 0xffffffff, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_FUNC_DCM1, ~0);
> +       mtk_ddp_write_mask(NULL, 0x00000888, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_DATAPATH_CON, ~0);
> +       mtk_ddp_write_mask(NULL, 0x000021ff, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_L0_CON, ~0);
> +       mtk_ddp_write_mask(NULL, 0x000021ff, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_L1_CON, ~0);
> +       mtk_ddp_write_mask(NULL, 0x000021ff, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_L2_CON, ~0);
> +       mtk_ddp_write_mask(NULL, 0x000021ff, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_L3_CON, ~0);
> +       mtk_ddp_write_mask(NULL, 0x0, &mixer->cmdq_base, mixer->regs,
> +                          MIX_L0_SRC_SIZE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x0, &mixer->cmdq_base, mixer->regs,
> +                          MIX_L1_SRC_SIZE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x0, &mixer->cmdq_base, mixer->regs,
> +                          MIX_L2_SRC_SIZE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x0, &mixer->cmdq_base, mixer->regs,
> +                          MIX_L3_SRC_SIZE, ~0);
> +       mtk_ddp_write_mask(NULL, 0x0fa50001, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_SRC_CON, ~0);
> +       mtk_ddp_write_mask(NULL, 0xFF000000, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_ROI_BGCLR, ~0);
> +       mtk_ddp_write_mask(NULL, 0x00000001, &mixer->cmdq_base, mixer->re=
gs,
> +                          MIX_EN, ~0);

I think only the latest setting is about start, move other setting to confi=
g.


> +}
> +
> +void mtk_ethdr_stop(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       mtk_ddp_write_mask(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_E=
N, ~0);
> +       mtk_ddp_write_mask(NULL, 1, &mixer->cmdq_base, mixer->regs, MIX_R=
ST, ~0);
> +       mtk_ddp_write_mask(NULL, 0, &priv->top_cmdq_base, priv->top_regs,
> +                          VDO1_CONFIG_SW1_RST_B, HDR_ASYNC_RESET_BIT);
> +       mtk_ddp_write_mask(NULL, 0, &priv->top_cmdq_base, priv->top_regs,
> +                          VDO1_CONFIG_SW0_RST_B, BIT(29));
> +       mtk_ddp_write_mask(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_R=
ST, ~0);
> +       mtk_ddp_write_mask(NULL, HDR_ASYNC_RESET_BIT, &priv->top_cmdq_bas=
e,
> +                          priv->top_regs, VDO1_CONFIG_SW1_RST_B,
> +                          HDR_ASYNC_RESET_BIT);
> +       mtk_ddp_write_mask(NULL, BIT(29), &priv->top_cmdq_base, priv->top=
_regs,
> +                          VDO1_CONFIG_SW0_RST_B, BIT(29));

Make vdosys1 a reset controller like [1].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5153=
55

Regards,
Chun-Kuang.

> +}
> +
> +int mtk_ethdr_clk_enable(struct device *dev)
> +{
> +       int i, ret;
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +
> +       ret =3D clk_bulk_prepare_enable(ETHDR_CLK_NUM, priv->ethdr_clk);
> +       if (ret)
> +               dev_err(dev,
> +                       "ethdr_clk prepare enable failed\n");
> +       return ret;
> +}
> +
> +void mtk_ethdr_clk_disable(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       int i;
> +
> +       clk_bulk_disable_unprepare(ETHDR_CLK_NUM, priv->ethdr_clk);
> +}
> +
> +static int mtk_ethdr_bind(struct device *dev, struct device *master,
> +                         void *data)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct drm_device *drm_dev =3D data;
> +       struct mtk_drm_private *drm_private =3D drm_dev->dev_private;
> +       struct device *mmsys_dev =3D drm_private->mmsys_dev;
> +
> +       priv->top_regs =3D of_iomap(mmsys_dev->of_node, 0);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       if (cmdq_dev_get_client_reg(mmsys_dev, &priv->top_cmdq_base, 0))
> +               dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +       return 0;
> +}
> +
> +static void mtk_ethdr_unbind(struct device *dev, struct device *master, =
void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_ethdr_component_ops =3D {
> +       .bind   =3D mtk_ethdr_bind,
> +       .unbind =3D mtk_ethdr_unbind,
> +};
> +
> +static int mtk_ethdr_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct mtk_ethdr *priv;
> +       int ret;
> +       int i;
> +
> +       dev_info(dev, "%s+\n", __func__);
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ETHDR_ID_MAX; i++) {
> +               priv->ethdr_comp[i].dev =3D dev;
> +               priv->ethdr_comp[i].regs =3D of_iomap(dev->of_node, i);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +               ret =3D cmdq_dev_get_client_reg(dev,
> +                                             &priv->ethdr_comp[i].cmdq_b=
ase, i);
> +               if (ret)
> +                       dev_dbg(dev, "get mediatek,gce-client-reg fail!\n=
");
> +#endif
> +               dev_info(dev, "[DRM]regs:0x%x, node:%s\n",
> +                        priv->ethdr_comp[i].regs, ethdr_comp_str[i]);
> +       }
> +
> +       for (i =3D 0; i < ETHDR_CLK_NUM; i++)
> +               priv->ethdr_clk[i].id =3D ethdr_clk_str[i];
> +       ret =3D devm_clk_bulk_get_optional(dev, ETHDR_CLK_NUM, priv->ethd=
r_clk);
> +       if (ret)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       ret =3D component_add(dev, &mtk_ethdr_component_ops);
> +       if (ret)
> +               dev_notice(dev, "Failed to add component: %d\n", ret);
> +
> +       dev_info(dev, "%s-\n", __func__);
> +
> +       return ret;
> +}
> +
> +static int mtk_ethdr_remove(struct platform_device *pdev)
> +{
> +       component_del(&pdev->dev, &mtk_ethdr_component_ops);
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_ethdr_driver_dt_match[] =3D {
> +       { .compatible =3D "mediatek,mt8195-disp-ethdr"},
> +       {},
> +};
> +
> +MODULE_DEVICE_TABLE(of, mtk_ethdr_driver_dt_match);
> +
> +struct platform_driver mtk_ethdr_driver =3D {
> +       .probe =3D mtk_ethdr_probe,
> +       .remove =3D mtk_ethdr_remove,
> +       .driver =3D {
> +                       .name =3D "mediatek-disp-ethdr",
> +                       .owner =3D THIS_MODULE,
> +                       .of_match_table =3D mtk_ethdr_driver_dt_match,
> +               },
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.h b/drivers/gpu/drm/media=
tek/mtk_ethdr.h
> new file mode 100644
> index 000000000000..c8fc0581a632
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_DISP_ETHDR_H__
> +#define __MTK_DISP_ETHDR_H__
> +
> +#include <linux/uaccess.h>
> +#include <drm/mediatek_drm.h>
> +
> +void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
> +                           struct mtk_plane_state *state,
> +                           struct cmdq_pkt *cmdq_pkt);
> +void mtk_ethdr_layer_on(struct device *dev, unsigned int idx,
> +                       struct cmdq_pkt *cmdq_pkt);
> +void mtk_ethdr_layer_off(struct device *dev, unsigned int idx,
> +                        struct cmdq_pkt *cmdq_pkt);
> +#endif
> +
> --
> 2.18.0
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D044DE81
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 00:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872016E3F4;
	Thu, 11 Nov 2021 23:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470776E3F4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 23:30:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AFF061267
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 23:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636673440;
 bh=JW2zVEW02q9WUuSCtTgCqIwxTHEFuiV9SAw6mM9yJkY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bFtZi5nv1qs9H9qTxlYsR3bsOsknLXYPUiJbGFUKCBMiIgbQnpizlfYvTWEHpO3Pv
 g2GHrB/5c7uIHszyp3BHA0F62xcN8oe2IR95W8ocJ9BYu8LkPEmT/MTf0Gpma9fa2g
 cZ2S1W+ixSl4fRwDbmOcY9IX9i2+kGmtDX9pcMUKnyWWWJ5w5/QVryW81lLqZy8Nwy
 eJpsAtYr3mpyZT4Yadt/4rJsXtPqxJauSmOu0budEDp/TW2Bume83qM2dRbEN8Ns7w
 9wlrTm4ouAf4S0c5Y7rUlmIIsxsPliqs7UfujwRQ9ynWlUnsw40o/UabUZc8CysPR5
 +kU/608x0cW2w==
Received: by mail-ed1-f41.google.com with SMTP id c8so29993857ede.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 15:30:40 -0800 (PST)
X-Gm-Message-State: AOAM53126aHgPafxNTzSo2h2syladX0oHlRP83h6IrUn6VoQCF37KywI
 cIPIk4YpLs03I9LCFL9d1boY1xKP81hgz7doOA==
X-Google-Smtp-Source: ABdhPJxThRMuDZJSZILKXaghJvvaj+LESdfActeaftmPnhOasX8Mw9tmMEbyTJ9dM4OAAm/BHTrnh8SqOpvA7ixb5Jc=
X-Received: by 2002:a17:906:c152:: with SMTP id
 dp18mr13645979ejc.241.1636673438381; 
 Thu, 11 Nov 2021 15:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-21-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-21-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 12 Nov 2021 07:30:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8zqBxL=1B5whFMUW+WTizhOYZn7+ms=6hCww0KfqBQXw@mail.gmail.com>
Message-ID: <CAAOTY_8zqBxL=1B5whFMUW+WTizhOYZn7+ms=6hCww0KfqBQXw@mail.gmail.com>
Subject: Re: [PATCH v7 20/20] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
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
> Add driver data of mt8195 vdosys1 to mediatek-drm and the sub driver.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c   |  4 ++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 13 ++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 30 +++++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 56 ++++++++++++++++-----
>  5 files changed, 78 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> index dff2797a2f68..d64846c38fe1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -8,6 +8,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>
>  #include "mtk_drm_ddp_comp.h"
> @@ -79,6 +80,9 @@ void mtk_merge_stop(struct device *dev)
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>
>         mtk_merge_stop_cmdq(dev, NULL);
> +
> +       if (priv->async_clk)
> +               device_reset_optional(dev);

Separate this to an merge patch.

>  }
>
>  void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 25580106a2c4..d41bd8201371 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -876,15 +876,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                 node =3D priv->comp_node[comp_id];
>                 comp =3D &priv->ddp_comp[comp_id];
>
> -               if (!node) {
> -                       dev_info(dev,
> -                                "Not creating crtc %d because component =
%d is disabled or missing\n",
> -                                crtc_i, comp_id);
> -                       return 0;
> -               }
> -
> -               if (!comp->dev) {
> -                       dev_err(dev, "Component %pOF not initialized\n", =
node);
> +               if (!node && !comp->dev) {
> +                       dev_err(dev,
> +                               "Not creating crtc %d because component %=
d is disabled, missing or not initialized\n",
> +                               crtc_i, comp_id);

Why do this? If this is necessary, separate this to an independent patch.

>                         return -ENODEV;
>                 }
>         }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index eb9835102d79..279087ae889b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -385,6 +385,18 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe =3D =
{
>         .start =3D mtk_ufoe_start,
>  };
>
> +static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor =3D {
> +       .clk_enable =3D mtk_ovl_adaptor_clk_enable,
> +       .clk_disable =3D mtk_ovl_adaptor_clk_disable,
> +       .config =3D mtk_ovl_adaptor_config,
> +       .start =3D mtk_ovl_adaptor_start,
> +       .stop =3D mtk_ovl_adaptor_stop,
> +       .layer_nr =3D mtk_ovl_adaptor_layer_nr,
> +       .layer_config =3D mtk_ovl_adaptor_layer_config,
> +       .enable_vblank =3D mtk_ovl_adaptor_enable_vblank,
> +       .disable_vblank =3D mtk_ovl_adaptor_disable_vblank,
> +};

Separate this to an ovl_adaptor patch.

> +
>  static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] =3D {
>         [MTK_DISP_AAL] =3D "aal",
>         [MTK_DISP_BLS] =3D "bls",
> @@ -398,6 +410,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_C=
OMP_TYPE_MAX] =3D {
>         [MTK_DISP_OD] =3D "od",
>         [MTK_DISP_OVL] =3D "ovl",
>         [MTK_DISP_OVL_2L] =3D "ovl-2l",
> +       [MTK_DISP_OVL_ADAPTOR] =3D "ovl_adaptor",
>         [MTK_DISP_POSTMASK] =3D "postmask",
>         [MTK_DISP_PWM] =3D "pwm",
>         [MTK_DISP_RDMA] =3D "rdma",
> @@ -443,6 +456,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matche=
s[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_OVL_2L0]         =3D { MTK_DISP_OVL_2L,    0, &ddp=
_ovl },
>         [DDP_COMPONENT_OVL_2L1]         =3D { MTK_DISP_OVL_2L,    1, &ddp=
_ovl },
>         [DDP_COMPONENT_OVL_2L2]         =3D { MTK_DISP_OVL_2L,    2, &ddp=
_ovl },
> +       [DDP_COMPONENT_OVL_ADAPTOR]     =3D { MTK_DISP_OVL_ADAPTOR,      =
 0, &ddp_ovl_adaptor },
>         [DDP_COMPONENT_POSTMASK0]       =3D { MTK_DISP_POSTMASK,  0, &ddp=
_postmask },
>         [DDP_COMPONENT_PWM0]            =3D { MTK_DISP_PWM,       0, NULL=
 },
>         [DDP_COMPONENT_PWM1]            =3D { MTK_DISP_PWM,       1, NULL=
 },
> @@ -548,12 +562,17 @@ int mtk_ddp_comp_init(struct device_node *node, str=
uct mtk_ddp_comp *comp,
>
>         comp->id =3D comp_id;
>         comp->funcs =3D mtk_ddp_matches[comp_id].funcs;
> -       comp_pdev =3D of_find_device_by_node(node);
> -       if (!comp_pdev) {
> -               DRM_INFO("Waiting for device %s\n", node->full_name);
> -               return -EPROBE_DEFER;
> +       /* Not all drm components have a DTS device node, such as ovl_ada=
ptor,
> +        * which is the drm bring up sub driver
> +        */
> +       if (node) {
> +               comp_pdev =3D of_find_device_by_node(node);
> +               if (!comp_pdev) {
> +                       DRM_INFO("Waiting for device %s\n", node->full_na=
me);
> +                       return -EPROBE_DEFER;
> +               }
> +               comp->dev =3D &comp_pdev->dev;

Separate this to an ovl_adaptor patch.

>         }
> -       comp->dev =3D &comp_pdev->dev;
>
>         /* Only DMA capable components need the LARB property */
>         if (type =3D=3D MTK_DISP_OVL ||
> @@ -573,6 +592,7 @@ int mtk_ddp_comp_init(struct device_node *node, struc=
t mtk_ddp_comp *comp,
>             type =3D=3D MTK_DISP_MERGE ||
>             type =3D=3D MTK_DISP_OVL ||
>             type =3D=3D MTK_DISP_OVL_2L ||
> +           type =3D=3D MTK_DISP_OVL_ADAPTOR ||
>             type =3D=3D MTK_DISP_PWM ||
>             type =3D=3D MTK_DISP_RDMA ||
>             type =3D=3D MTK_DPI ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 221e2e3a3c8d..5e1404dc20c4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_OD,
>         MTK_DISP_OVL,
>         MTK_DISP_OVL_2L,
> +       MTK_DISP_OVL_ADAPTOR,
>         MTK_DISP_POSTMASK,
>         MTK_DISP_PWM,
>         MTK_DISP_RDMA,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index eedf10ed30c8..778aec81a0de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -190,6 +190,12 @@ static const enum mtk_ddp_comp_id mt8195_mtk_ddp_mai=
n[] =3D {
>         DDP_COMPONENT_DP_INTF0,
>  };
>
> +static const enum mtk_ddp_comp_id mt8195_mtk_ddp_ext[] =3D {
> +       DDP_COMPONENT_OVL_ADAPTOR,
> +       DDP_COMPONENT_MERGE5,
> +       DDP_COMPONENT_DP_INTF1,
> +};
> +
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =3D {
>         .main_path =3D mt2701_mtk_ddp_main,
>         .main_len =3D ARRAY_SIZE(mt2701_mtk_ddp_main),
> @@ -262,6 +268,13 @@ static const struct mtk_mmsys_driver_data mt8195_vdo=
sys0_driver_data =3D {
>         .mmsys_dev_num =3D 2,
>  };
>
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data =3D=
 {
> +       .ext_path =3D mt8195_mtk_ddp_ext,
> +       .ext_len =3D ARRAY_SIZE(mt8195_mtk_ddp_ext),
> +       .mmsys_id =3D 1,
> +       .mmsys_dev_num =3D 2,
> +};
> +
>  static const struct of_device_id mtk_drm_of_ids[] =3D {
>         { .compatible =3D "mediatek,mt2701-mmsys",
>           .data =3D &mt2701_mmsys_driver_data},
> @@ -279,6 +292,8 @@ static const struct of_device_id mtk_drm_of_ids[] =3D=
 {
>           .data =3D &mt8192_mmsys_driver_data},
>         { .compatible =3D "mediatek,mt8195-vdosys0",
>           .data =3D &mt8195_vdosys0_driver_data},
> +       { .compatible =3D "mediatek,mt8195-vdosys1",
> +         .data =3D &mt8195_vdosys1_driver_data},
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> @@ -362,9 +377,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>         struct mtk_drm_private *private =3D drm->dev_private;
>         struct mtk_drm_private *priv_n;
> -       struct platform_device *pdev;
> -       struct device_node *np =3D NULL;
> -       struct device *dma_dev;
> +       struct device *dma_dev =3D NULL;
>         int ret, i, j;
>
>         ret =3D drmm_mode_config_init(drm);
> @@ -406,8 +419,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                                 if (ret)
>                                         goto err_component_unbind;
>
> -                               if (!np)
> -                                       np =3D priv_n->comp_node[priv_n->=
data->main_path[0]];
> +                               if (!dma_dev)
> +                                       dma_dev =3D priv_n->ddp_comp[priv=
_n->data->main_path[0]].dev;
>
>                                 continue;
>                         } else if (i =3D=3D 1 && priv_n->data->ext_len) {
> @@ -416,8 +429,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                                 if (ret)
>                                         goto err_component_unbind;
>
> -                               if (!np)
> -                                       np =3D priv_n->comp_node[priv_n->=
data->ext_path[0]];
> +                               if (!dma_dev)
> +                                       dma_dev =3D priv_n->ddp_comp[priv=
_n->data->ext_path[0]].dev;

Separate this to an independent patch.

>
>                                 continue;
>                         } else if (i =3D=3D 2 && priv_n->data->third_len)=
 {
> @@ -426,8 +439,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                                 if (ret)
>                                         goto err_component_unbind;
>
> -                               if (!np)
> -                                       np =3D priv_n->comp_node[priv_n->=
data->third_path[0]];
> +                               if (!dma_dev)
> +                                       dma_dev =3D priv_n->ddp_comp[priv=
_n->data->third_path[0]].dev;
>
>                                 continue;
>                         }
> @@ -435,14 +448,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         }
>
>         /* Use OVL device for all DMA memory allocations */
> -       pdev =3D of_find_device_by_node(np);
> -       if (!pdev) {
> +       if (!dma_dev) {
>                 ret =3D -ENODEV;
>                 dev_err(drm->dev, "Need at least one OVL device\n");
>                 goto err_component_unbind;
>         }
>
> -       dma_dev =3D &pdev->dev;
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->dma_dev =3D dma_dev;
>
> @@ -521,6 +532,11 @@ static int compare_of(struct device *dev, void *data=
)
>         return dev->of_node =3D=3D data;
>  }
>
> +static int compare_dev(struct device *dev, void *data)
> +{
> +       return dev =3D=3D (struct device *)data;
> +}
> +
>  static int mtk_drm_bind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> @@ -709,6 +725,7 @@ static int mtk_drm_probe(struct platform_device *pdev=
)
>         struct mtk_drm_private *private;
>         struct device_node *node;
>         struct component_match *match =3D NULL;
> +       struct platform_device *ovl_adaptor;
>         int ret;
>         int i;
>
> @@ -734,6 +751,19 @@ static int mtk_drm_probe(struct platform_device *pde=
v)
>                 return -ENODEV;
>         }
>
> +       /* Bringup ovl_adaptor */
> +       if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_OVL_ADAPTOR)) =
{
> +               ovl_adaptor =3D platform_device_register_data(dev, "media=
tek-disp-ovl-adaptor",
> +                                                           PLATFORM_DEVI=
D_AUTO,
> +                                                           (void *)priva=
te->mmsys_dev,
> +                                                           sizeof(*priva=
te->mmsys_dev));
> +               private->ddp_comp[DDP_COMPONENT_OVL_ADAPTOR].dev =3D &ovl=
_adaptor->dev;
> +               private->comp_node[DDP_COMPONENT_OVL_ADAPTOR] =3D ovl_ada=
ptor->dev.of_node;
> +               mtk_ddp_comp_init(NULL, &private->ddp_comp[DDP_COMPONENT_=
OVL_ADAPTOR],
> +                                 DDP_COMPONENT_OVL_ADAPTOR);
> +               component_match_add(dev, &match, compare_dev, &ovl_adapto=
r->dev);
> +       }

Separate this to an ovl_adaptor patch.

Regards,
Chun-Kuang.

> +
>         /* Iterate over sibling DISP function blocks */
>         for_each_child_of_node(phandle->parent, node) {
>                 const struct of_device_id *of_id;
> @@ -787,6 +817,7 @@ static int mtk_drm_probe(struct platform_device *pdev=
)
>                     comp_type =3D=3D MTK_DISP_MERGE ||
>                     comp_type =3D=3D MTK_DISP_OVL ||
>                     comp_type =3D=3D MTK_DISP_OVL_2L ||
> +                   comp_type =3D=3D MTK_DISP_OVL_ADAPTOR ||
>                     comp_type =3D=3D MTK_DISP_RDMA ||
>                     comp_type =3D=3D MTK_DPI ||
>                     comp_type =3D=3D MTK_DSI) {
> @@ -889,6 +920,7 @@ static struct platform_driver * const mtk_drm_drivers=
[] =3D {
>         &mtk_disp_color_driver,
>         &mtk_disp_gamma_driver,
>         &mtk_disp_merge_driver,
> +       &mtk_disp_ovl_adaptor_driver,
>         &mtk_disp_ovl_driver,
>         &mtk_disp_rdma_driver,
>         &mtk_dpi_driver,
> --
> 2.18.0
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A348A454193
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 08:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31206E4A1;
	Wed, 17 Nov 2021 07:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF386E4A1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 07:04:09 +0000 (UTC)
X-UUID: ef851fe17b8e4fd193653d4016fe7de3-20211117
X-UUID: ef851fe17b8e4fd193653d4016fe7de3-20211117
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1859975004; Wed, 17 Nov 2021 15:04:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 17 Nov 2021 15:04:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Nov 2021 15:04:04 +0800
Message-ID: <853c36b7b4c8dfbf2856b7283219dd3aae363ae9.camel@mediatek.com>
Subject: Re: [PATCH v7 20/20] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 17 Nov 2021 15:04:04 +0800
In-Reply-To: <CAAOTY_8zqBxL=1B5whFMUW+WTizhOYZn7+ms=6hCww0KfqBQXw@mail.gmail.com>
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-21-nancy.lin@mediatek.com>
 <CAAOTY_8zqBxL=1B5whFMUW+WTizhOYZn7+ms=6hCww0KfqBQXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
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
Cc: DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David
 Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Thanks for the review.

On Fri, 2021-11-12 at 07:30 +0800, Chun-Kuang Hu wrote:
> Hi, Nancy:
> 
> Nancy.Lin <nancy.lin@mediatek.com> 於 2021年10月29日 週五 下午3:52寫道：
> > 
> > Add driver data of mt8195 vdosys1 to mediatek-drm and the sub
> > driver.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c   |  4 ++
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 13 ++---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 30 +++++++++--
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 56 ++++++++++++++++-
> > ----
> >  5 files changed, 78 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > index dff2797a2f68..d64846c38fe1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/reset.h>
> >  #include <linux/soc/mediatek/mtk-cmdq.h>
> > 
> >  #include "mtk_drm_ddp_comp.h"
> > @@ -79,6 +80,9 @@ void mtk_merge_stop(struct device *dev)
> >         struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > 
> >         mtk_merge_stop_cmdq(dev, NULL);
> > +
> > +       if (priv->async_clk)
> > +               device_reset_optional(dev);
> 
> Separate this to an merge patch.
> 
OK.
> >  }
> > 
> >  void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt
> > *cmdq_pkt)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 25580106a2c4..d41bd8201371 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -876,15 +876,10 @@ int mtk_drm_crtc_create(struct drm_device
> > *drm_dev,
> >                 node = priv->comp_node[comp_id];
> >                 comp = &priv->ddp_comp[comp_id];
> > 
> > -               if (!node) {
> > -                       dev_info(dev,
> > -                                "Not creating crtc %d because
> > component %d is disabled or missing\n",
> > -                                crtc_i, comp_id);
> > -                       return 0;
> > -               }
> > -
> > -               if (!comp->dev) {
> > -                       dev_err(dev, "Component %pOF not
> > initialized\n", node);
> > +               if (!node && !comp->dev) {
> > +                       dev_err(dev,
> > +                               "Not creating crtc %d because
> > component %d is disabled, missing or not initialized\n",
> > +                               crtc_i, comp_id);
> 
> Why do this? If this is necessary, separate this to an independent
> patch.

This is a necessary modification for ovl_adaptor component. Ovl_adaptor
is brought up by drm driver, no dts device node for it. To modify the
check missing component logic.
> 
> >                         return -ENODEV;
> >                 }
> >         }
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index eb9835102d79..279087ae889b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -385,6 +385,18 @@ static const struct mtk_ddp_comp_funcs
> > ddp_ufoe = {
> >         .start = mtk_ufoe_start,
> >  };
> > 
> > +static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
> > +       .clk_enable = mtk_ovl_adaptor_clk_enable,
> > +       .clk_disable = mtk_ovl_adaptor_clk_disable,
> > +       .config = mtk_ovl_adaptor_config,
> > +       .start = mtk_ovl_adaptor_start,
> > +       .stop = mtk_ovl_adaptor_stop,
> > +       .layer_nr = mtk_ovl_adaptor_layer_nr,
> > +       .layer_config = mtk_ovl_adaptor_layer_config,
> > +       .enable_vblank = mtk_ovl_adaptor_enable_vblank,
> > +       .disable_vblank = mtk_ovl_adaptor_disable_vblank,
> > +};
> 
> Separate this to an ovl_adaptor patch.
> 
OK
> > +
> >  static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX]
> > = {
> >         [MTK_DISP_AAL] = "aal",
> >         [MTK_DISP_BLS] = "bls",
> > @@ -398,6 +410,7 @@ static const char * const
> > mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
> >         [MTK_DISP_OD] = "od",
> >         [MTK_DISP_OVL] = "ovl",
> >         [MTK_DISP_OVL_2L] = "ovl-2l",
> > +       [MTK_DISP_OVL_ADAPTOR] = "ovl_adaptor",
> >         [MTK_DISP_POSTMASK] = "postmask",
> >         [MTK_DISP_PWM] = "pwm",
> >         [MTK_DISP_RDMA] = "rdma",
> > @@ -443,6 +456,7 @@ static const struct mtk_ddp_comp_match
> > mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> >         [DDP_COMPONENT_OVL_2L0]         = { MTK_DISP_OVL_2L,    0,
> > &ddp_ovl },
> >         [DDP_COMPONENT_OVL_2L1]         = { MTK_DISP_OVL_2L,    1,
> > &ddp_ovl },
> >         [DDP_COMPONENT_OVL_2L2]         = { MTK_DISP_OVL_2L,    2,
> > &ddp_ovl },
> > +       [DDP_COMPONENT_OVL_ADAPTOR]     = {
> > MTK_DISP_OVL_ADAPTOR,       0, &ddp_ovl_adaptor },
> >         [DDP_COMPONENT_POSTMASK0]       = { MTK_DISP_POSTMASK,  0,
> > &ddp_postmask },
> >         [DDP_COMPONENT_PWM0]            = { MTK_DISP_PWM,       0,
> > NULL },
> >         [DDP_COMPONENT_PWM1]            = { MTK_DISP_PWM,       1,
> > NULL },
> > @@ -548,12 +562,17 @@ int mtk_ddp_comp_init(struct device_node
> > *node, struct mtk_ddp_comp *comp,
> > 
> >         comp->id = comp_id;
> >         comp->funcs = mtk_ddp_matches[comp_id].funcs;
> > -       comp_pdev = of_find_device_by_node(node);
> > -       if (!comp_pdev) {
> > -               DRM_INFO("Waiting for device %s\n", node-
> > >full_name);
> > -               return -EPROBE_DEFER;
> > +       /* Not all drm components have a DTS device node, such as
> > ovl_adaptor,
> > +        * which is the drm bring up sub driver
> > +        */
> > +       if (node) {
> > +               comp_pdev = of_find_device_by_node(node);
> > +               if (!comp_pdev) {
> > +                       DRM_INFO("Waiting for device %s\n", node-
> > >full_name);
> > +                       return -EPROBE_DEFER;
> > +               }
> > +               comp->dev = &comp_pdev->dev;
> 
> Separate this to an ovl_adaptor patch.
> 
OK
> >         }
> > -       comp->dev = &comp_pdev->dev;
> > 
> >         /* Only DMA capable components need the LARB property */
> >         if (type == MTK_DISP_OVL ||
> > @@ -573,6 +592,7 @@ int mtk_ddp_comp_init(struct device_node *node,
> > struct mtk_ddp_comp *comp,
> >             type == MTK_DISP_MERGE ||
> >             type == MTK_DISP_OVL ||
> >             type == MTK_DISP_OVL_2L ||
> > +           type == MTK_DISP_OVL_ADAPTOR ||
> >             type == MTK_DISP_PWM ||
> >             type == MTK_DISP_RDMA ||
> >             type == MTK_DPI ||
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index 221e2e3a3c8d..5e1404dc20c4 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
> >         MTK_DISP_OD,
> >         MTK_DISP_OVL,
> >         MTK_DISP_OVL_2L,
> > +       MTK_DISP_OVL_ADAPTOR,
> >         MTK_DISP_POSTMASK,
> >         MTK_DISP_PWM,
> >         MTK_DISP_RDMA,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index eedf10ed30c8..778aec81a0de 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -190,6 +190,12 @@ static const enum mtk_ddp_comp_id
> > mt8195_mtk_ddp_main[] = {
> >         DDP_COMPONENT_DP_INTF0,
> >  };
> > 
> > +static const enum mtk_ddp_comp_id mt8195_mtk_ddp_ext[] = {
> > +       DDP_COMPONENT_OVL_ADAPTOR,
> > +       DDP_COMPONENT_MERGE5,
> > +       DDP_COMPONENT_DP_INTF1,
> > +};
> > +
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > = {
> >         .main_path = mt2701_mtk_ddp_main,
> >         .main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
> > @@ -262,6 +268,13 @@ static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data = {
> >         .mmsys_dev_num = 2,
> >  };
> > 
> > +static const struct mtk_mmsys_driver_data
> > mt8195_vdosys1_driver_data = {
> > +       .ext_path = mt8195_mtk_ddp_ext,
> > +       .ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
> > +       .mmsys_id = 1,
> > +       .mmsys_dev_num = 2,
> > +};
> > +
> >  static const struct of_device_id mtk_drm_of_ids[] = {
> >         { .compatible = "mediatek,mt2701-mmsys",
> >           .data = &mt2701_mmsys_driver_data},
> > @@ -279,6 +292,8 @@ static const struct of_device_id
> > mtk_drm_of_ids[] = {
> >           .data = &mt8192_mmsys_driver_data},
> >         { .compatible = "mediatek,mt8195-vdosys0",
> >           .data = &mt8195_vdosys0_driver_data},
> > +       { .compatible = "mediatek,mt8195-vdosys1",
> > +         .data = &mt8195_vdosys1_driver_data},
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> > @@ -362,9 +377,7 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >  {
> >         struct mtk_drm_private *private = drm->dev_private;
> >         struct mtk_drm_private *priv_n;
> > -       struct platform_device *pdev;
> > -       struct device_node *np = NULL;
> > -       struct device *dma_dev;
> > +       struct device *dma_dev = NULL;
> >         int ret, i, j;
> > 
> >         ret = drmm_mode_config_init(drm);
> > @@ -406,8 +419,8 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >                                 if (ret)
> >                                         goto err_component_unbind;
> > 
> > -                               if (!np)
> > -                                       np = priv_n-
> > >comp_node[priv_n->data->main_path[0]];
> > +                               if (!dma_dev)
> > +                                       dma_dev = priv_n-
> > >ddp_comp[priv_n->data->main_path[0]].dev;
> > 
> >                                 continue;
> >                         } else if (i == 1 && priv_n->data->ext_len) 
> > {
> > @@ -416,8 +429,8 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >                                 if (ret)
> >                                         goto err_component_unbind;
> > 
> > -                               if (!np)
> > -                                       np = priv_n-
> > >comp_node[priv_n->data->ext_path[0]];
> > +                               if (!dma_dev)
> > +                                       dma_dev = priv_n-
> > >ddp_comp[priv_n->data->ext_path[0]].dev;
> 
> Separate this to an independent patch.
> 
OK.
> > 
> >                                 continue;
> >                         } else if (i == 2 && priv_n->data-
> > >third_len) {
> > @@ -426,8 +439,8 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >                                 if (ret)
> >                                         goto err_component_unbind;
> > 
> > -                               if (!np)
> > -                                       np = priv_n-
> > >comp_node[priv_n->data->third_path[0]];
> > +                               if (!dma_dev)
> > +                                       dma_dev = priv_n-
> > >ddp_comp[priv_n->data->third_path[0]].dev;
> > 
> >                                 continue;
> >                         }
> > @@ -435,14 +448,12 @@ static int mtk_drm_kms_init(struct drm_device
> > *drm)
> >         }
> > 
> >         /* Use OVL device for all DMA memory allocations */
> > -       pdev = of_find_device_by_node(np);
> > -       if (!pdev) {
> > +       if (!dma_dev) {
> >                 ret = -ENODEV;
> >                 dev_err(drm->dev, "Need at least one OVL
> > device\n");
> >                 goto err_component_unbind;
> >         }
> > 
> > -       dma_dev = &pdev->dev;
> >         for (i = 0; i < private->data->mmsys_dev_num; i++)
> >                 private->all_drm_private[i]->dma_dev = dma_dev;
> > 
> > @@ -521,6 +532,11 @@ static int compare_of(struct device *dev, void
> > *data)
> >         return dev->of_node == data;
> >  }
> > 
> > +static int compare_dev(struct device *dev, void *data)
> > +{
> > +       return dev == (struct device *)data;
> > +}
> > +
> >  static int mtk_drm_bind(struct device *dev)
> >  {
> >         struct mtk_drm_private *private = dev_get_drvdata(dev);
> > @@ -709,6 +725,7 @@ static int mtk_drm_probe(struct platform_device
> > *pdev)
> >         struct mtk_drm_private *private;
> >         struct device_node *node;
> >         struct component_match *match = NULL;
> > +       struct platform_device *ovl_adaptor;
> >         int ret;
> >         int i;
> > 
> > @@ -734,6 +751,19 @@ static int mtk_drm_probe(struct
> > platform_device *pdev)
> >                 return -ENODEV;
> >         }
> > 
> > +       /* Bringup ovl_adaptor */
> > +       if (mtk_drm_find_mmsys_comp(private,
> > DDP_COMPONENT_OVL_ADAPTOR)) {
> > +               ovl_adaptor = platform_device_register_data(dev,
> > "mediatek-disp-ovl-adaptor",
> > +                                                           PLATFOR
> > M_DEVID_AUTO,
> > +                                                           (void
> > *)private->mmsys_dev,
> > +                                                           sizeof(
> > *private->mmsys_dev));
> > +               private->ddp_comp[DDP_COMPONENT_OVL_ADAPTOR].dev =
> > &ovl_adaptor->dev;
> > +               private->comp_node[DDP_COMPONENT_OVL_ADAPTOR] =
> > ovl_adaptor->dev.of_node;
> > +               mtk_ddp_comp_init(NULL, &private-
> > >ddp_comp[DDP_COMPONENT_OVL_ADAPTOR],
> > +                                 DDP_COMPONENT_OVL_ADAPTOR);
> > +               component_match_add(dev, &match, compare_dev,
> > &ovl_adaptor->dev);
> > +       }
> 
> Separate this to an ovl_adaptor patch.
> 
> Regards,
> Chun-Kuang.
> 
OK.

Regards,
Nancy.
> > +
> >         /* Iterate over sibling DISP function blocks */
> >         for_each_child_of_node(phandle->parent, node) {
> >                 const struct of_device_id *of_id;
> > @@ -787,6 +817,7 @@ static int mtk_drm_probe(struct platform_device
> > *pdev)
> >                     comp_type == MTK_DISP_MERGE ||
> >                     comp_type == MTK_DISP_OVL ||
> >                     comp_type == MTK_DISP_OVL_2L ||
> > +                   comp_type == MTK_DISP_OVL_ADAPTOR ||
> >                     comp_type == MTK_DISP_RDMA ||
> >                     comp_type == MTK_DPI ||
> >                     comp_type == MTK_DSI) {
> > @@ -889,6 +920,7 @@ static struct platform_driver * const
> > mtk_drm_drivers[] = {
> >         &mtk_disp_color_driver,
> >         &mtk_disp_gamma_driver,
> >         &mtk_disp_merge_driver,
> > +       &mtk_disp_ovl_adaptor_driver,
> >         &mtk_disp_ovl_driver,
> >         &mtk_disp_rdma_driver,
> >         &mtk_dpi_driver,
> > --
> > 2.18.0
> > 


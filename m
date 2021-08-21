Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C33F3CC4
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 01:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7436F89FE8;
	Sat, 21 Aug 2021 23:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E56389FE8
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 23:48:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D5316127A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 23:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629589685;
 bh=UH1h2GTw2EvdGfybb+5hNue1TdJNwIaZ7H6SBz9dYpU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CjPDNbp3UMlMaQ0GqP9c7I4SrhcydcAF6B68ucfqbA4mRKCUNZBp/kDKeLxdYVOKL
 i+AsoDIvRiwHkt+VxkWJ4tmbjUn8o/FNzChdZr3daT2dcNMyXW6Z83TO3DDR+Opviv
 nGX23s+Ju0scLOC1ETZEz0RVrxdCOR/2OWdFLeJGQeqnPi6f+qAaz885WdAYbSHCY+
 dgqbe3x9J9IQ/c3xnBZHIib3rittLn7G42Dx5rCg3WAq0lWxw9i1a8ABA0cRT1Pd3I
 GUBrYLlZFkYaCVCYHBmj0FcZkmwXAzYWHARi89a2/5lxrv5ecaoO9D2gFyBJu/lPl3
 Cj21WZaUM8tvg==
Received: by mail-ed1-f44.google.com with SMTP id bo19so19769769edb.9
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 16:48:05 -0700 (PDT)
X-Gm-Message-State: AOAM5305yr5FSzBRjD0IJRZL7pYAsRKewmLwoWQEjc5H3XD4/GnjZwo4
 ztuyTSSwfooHYeHvEUKFjZtGhIfYTksuqh5IAA==
X-Google-Smtp-Source: ABdhPJxxLS7KPX1NAlxaYV+1Do53aH+UdpDwzs1bjp5I6c91YMQbsJQNm5+hE6bT3oZ/Z8lJjWg2GZRFfI+M8BvP2pw=
X-Received: by 2002:a05:6402:b64:: with SMTP id
 cb4mr29433421edb.49.1629589683849; 
 Sat, 21 Aug 2021 16:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-14-nancy.lin@mediatek.com>
In-Reply-To: <20210818091847.8060-14-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Aug 2021 07:47:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-WUWzThnddWNwMzd=BTBsbFRfMs4ABKJk6huADHUWrgQ@mail.gmail.com>
Message-ID: <CAAOTY_-WUWzThnddWNwMzd=BTBsbFRfMs4ABKJk6huADHUWrgQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] drm/mediatek: add ovl_adaptor support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add ovl_adaptor driver for MT8195.
> Ovl_adaptor is an encapsulated module and designed for simplified
> DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
> an ETHDR. Two RDMAs merge into one layer, so this module support 4
> layers.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile             |   3 +-
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 528 ++++++++++++++++++
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.h   |  19 +
>  3 files changed, 549 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 38ec2354a894..f04ac86c9593 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -13,7 +13,8 @@ mediatek-drm-y :=3D mtk_disp_ccorr.o \
>                   mtk_drm_plane.o \
>                   mtk_dsi.o \
>                   mtk_dpi.o \
> -                 mtk_mdp_rdma.o
> +                 mtk_mdp_rdma.o \
> +                 mtk_disp_ovl_adaptor.o

Alphabetic order.

>
>  obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gp=
u/drm/mediatek/mtk_disp_ovl_adaptor.c
> new file mode 100644
> index 000000000000..8222ec5ff799
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -0,0 +1,528 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +#include <linux/component.h>

Alphabetic order.

> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_drv.h"
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_disp_drv.h"
> +#include "mtk_disp_ovl_adaptor.h"
> +
> +#define DISP_MERGE_ENABLE      0x0
> +       #define MERGE_ENABLE BIT(0)

I would like

#define DISP_MERGE_ENABLE      0x0
#define MERGE_ENABLE                           BIT(0)

> +#define DISP_MERGE_CFG_0       0x10
> +#define DISP_MERGE_CFG_1       0x14
> +#define DISP_MERGE_CFG_4       0x20
> +#define DISP_MERGE_CFG_5       0x24
> +#define DISP_MERGE_CFG_10      0x38
> +       #define CFG_10_NO_SWAP 0
> +#define DISP_MERGE_CFG_12      0x40
> +       #define CFG12_10_10_1PI_2PO_BUF_MODE 6
> +       #define CFG12_11_10_1PI_2PO_MERGE 18
> +#define DISP_MERGE_CFG_24      0x70
> +#define DISP_MERGE_CFG_25      0x74
> +#define DISP_MERGE_CFG_26      0x78
> +#define DISP_MERGE_CFG_27      0x7c
> +#define DISP_MERGE_MUTE_0      0xf00
> +
> +#define MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH 1920
> +#define MTK_OVL_ADAPTOR_LAYER_NUM 4
> +
> +enum mtk_ovl_adaptor_comp_type {
> +       OVL_ADAPTOR_TYPE_RDMA =3D 0,
> +       OVL_ADAPTOR_TYPE_MERGE,
> +       OVL_ADAPTOR_TYPE_NUM,
> +};
> +
> +enum mtk_ovl_adaptor_comp_id {
> +       OVL_ADAPTOR_MDP_RDMA0,
> +       OVL_ADAPTOR_MDP_RDMA1,
> +       OVL_ADAPTOR_MDP_RDMA2,
> +       OVL_ADAPTOR_MDP_RDMA3,
> +       OVL_ADAPTOR_MDP_RDMA4,
> +       OVL_ADAPTOR_MDP_RDMA5,
> +       OVL_ADAPTOR_MDP_RDMA6,
> +       OVL_ADAPTOR_MDP_RDMA7,
> +       OVL_ADAPTOR_MERGE0,
> +       OVL_ADAPTOR_MERGE1,
> +       OVL_ADAPTOR_MERGE2,
> +       OVL_ADAPTOR_MERGE3,
> +       OVL_ADAPTOR_ID_MAX
> +};
> +
> +struct ovl_adaptor_comp_match {
> +       enum mtk_ovl_adaptor_comp_type type;
> +       int alias_id;
> +};
> +
> +struct ovl_adaptor_merge_config {
> +       unsigned int fmt;
> +       unsigned int merge_mode;
> +       unsigned int in_w[2];
> +       unsigned int out_w[2];
> +       unsigned int in_h;
> +};
> +
> +struct mtk_ovl_adaptor_comp {
> +       struct device *dev;
> +       struct clk *clks[2];
> +       struct cmdq_client_reg cmdq_base;
> +       void __iomem *regs;
> +};

keep only dev, other value should be moved to dev private data.

> +
> +struct mtk_disp_ovl_adaptor {
> +       struct mtk_ovl_adaptor_comp ovl_adaptor_comp[OVL_ADAPTOR_ID_MAX];
> +       struct device *mmsys_dev;
> +};
> +
> +static const char * const ovl_adaptor_comp_str[] =3D {
> +       "OVL_ADAPTOR_MDP_RDMA0",
> +       "OVL_ADAPTOR_MDP_RDMA1",
> +       "OVL_ADAPTOR_MDP_RDMA2",
> +       "OVL_ADAPTOR_MDP_RDMA3",
> +       "OVL_ADAPTOR_MDP_RDMA4",
> +       "OVL_ADAPTOR_MDP_RDMA5",
> +       "OVL_ADAPTOR_MDP_RDMA6",
> +       "OVL_ADAPTOR_MDP_RDMA7",
> +       "OVL_ADAPTOR_MERGE0",
> +       "OVL_ADAPTOR_MERGE1",
> +       "OVL_ADAPTOR_MERGE2",
> +       "OVL_ADAPTOR_MERGE3",
> +       "OVL_ADAPTOR_ID_MAX"
> +};
> +
> +static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] =3D {
> +       [OVL_ADAPTOR_TYPE_RDMA] =3D "vdo1_rdma",
> +       [OVL_ADAPTOR_TYPE_MERGE] =3D "merge",
> +};
> +
> +static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_M=
AX] =3D {
> +       [OVL_ADAPTOR_MDP_RDMA0] =3D       { OVL_ADAPTOR_TYPE_RDMA, 0 },
> +       [OVL_ADAPTOR_MDP_RDMA1] =3D       { OVL_ADAPTOR_TYPE_RDMA, 1 },
> +       [OVL_ADAPTOR_MDP_RDMA2] =3D       { OVL_ADAPTOR_TYPE_RDMA, 2 },
> +       [OVL_ADAPTOR_MDP_RDMA3] =3D       { OVL_ADAPTOR_TYPE_RDMA, 3 },
> +       [OVL_ADAPTOR_MDP_RDMA4] =3D       { OVL_ADAPTOR_TYPE_RDMA, 4 },
> +       [OVL_ADAPTOR_MDP_RDMA5] =3D       { OVL_ADAPTOR_TYPE_RDMA, 5 },
> +       [OVL_ADAPTOR_MDP_RDMA6] =3D       { OVL_ADAPTOR_TYPE_RDMA, 6 },
> +       [OVL_ADAPTOR_MDP_RDMA7] =3D       { OVL_ADAPTOR_TYPE_RDMA, 7 },
> +       [OVL_ADAPTOR_MERGE0] =3D  { OVL_ADAPTOR_TYPE_MERGE, 1 },
> +       [OVL_ADAPTOR_MERGE1] =3D  { OVL_ADAPTOR_TYPE_MERGE, 2 },
> +       [OVL_ADAPTOR_MERGE2] =3D  { OVL_ADAPTOR_TYPE_MERGE, 3 },
> +       [OVL_ADAPTOR_MERGE3] =3D  { OVL_ADAPTOR_TYPE_MERGE, 4 },
> +};
> +
> +static void mtk_ovl_adaptor_merge_config(struct mtk_ovl_adaptor_comp *co=
mp,
> +                                        struct ovl_adaptor_merge_config =
*merge_cfg,
> +                                        struct cmdq_pkt *cmdq_pkt)
> +{
> +       switch (merge_cfg->merge_mode) {
> +       case 6:
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[0]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_0);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->out_w[0]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_4);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[0]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_24);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[0]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_25);
> +               break;
> +       case 18:
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[0]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_0);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[1]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_1);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->out_w[0]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_4);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[0]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_24);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[1]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_25);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[0]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_26);
> +               mtk_ddp_write(cmdq_pkt, (merge_cfg->in_h << 16 | merge_cf=
g->in_w[1]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_27);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       mtk_ddp_write(cmdq_pkt, merge_cfg->merge_mode, &comp->cmdq_base,
> +                     comp->regs, DISP_MERGE_CFG_12);
> +       mtk_ddp_write(cmdq_pkt, CFG_10_NO_SWAP, &comp->cmdq_base,
> +                     comp->regs, DISP_MERGE_CFG_10);
> +       mtk_ddp_write_mask(cmdq_pkt, 1, &comp->cmdq_base, comp->regs,
> +                          DISP_MERGE_ENABLE, MERGE_ENABLE);

Move this function to merge driver.

> +}
> +
> +void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
> +                                 struct mtk_plane_state *state,
> +                                 struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       struct mtk_plane_pending_state *pending =3D &state->pending;
> +       struct ovl_adaptor_merge_config merge_cfg =3D {0};
> +       struct mtk_mdp_rdma_cfg rdma_config =3D {0};
> +       struct mtk_ovl_adaptor_comp *rdma_l;
> +       struct mtk_ovl_adaptor_comp *rdma_r;
> +       struct mtk_ovl_adaptor_comp *merge;
> +       const struct drm_format_info *fmt_info =3D drm_format_info(pendin=
g->format);
> +       bool use_dual_pipe =3D false;
> +
> +       dev_dbg(dev, "%s+ idx:%d, enable:%d, fmt:0x%x\n", __func__, idx,
> +               pending->enable, pending->format);
> +       dev_dbg(dev, "addr 0x%lx, fb w:%d, {%d,%d,%d,%d}\n",
> +               pending->addr, (pending->pitch / fmt_info->cpp[0]),
> +               pending->x, pending->y, pending->width, pending->height);
> +
> +       rdma_l =3D &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 +=
 2 * idx];
> +       rdma_r =3D &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 +=
 2 * idx + 1];
> +       merge =3D &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx=
];
> +
> +       if (!pending->enable) {
> +               mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merg=
e->regs,
> +                                  DISP_MERGE_ENABLE, MERGE_ENABLE);

Ditto.

> +               mtk_mdp_rdma_stop(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_b=
ase);
> +               mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_b=
ase);
> +               return;
> +       }
> +
> +       if (pending->width > MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH)
> +               use_dual_pipe =3D true;
> +
> +       merge_cfg.out_w[0] =3D pending->width;
> +       merge_cfg.in_h =3D pending->height;
> +       merge_cfg.fmt =3D pending->format;
> +       if (use_dual_pipe) {
> +               merge_cfg.merge_mode =3D CFG12_11_10_1PI_2PO_MERGE;
> +               merge_cfg.in_w[0] =3D (pending->width / 2) + ((pending->w=
idth / 2) % 2);
> +               merge_cfg.in_w[1] =3D (pending->width / 2) - ((pending->w=
idth / 2) % 2);

merge_cfg.in_w[1] =3D pending->width - merge_cfg.in_w[0];

> +       } else {
> +               merge_cfg.merge_mode =3D CFG12_10_10_1PI_2PO_BUF_MODE;
> +               merge_cfg.in_w[0] =3D pending->width;
> +       }
> +       mtk_ovl_adaptor_merge_config(merge, &merge_cfg, cmdq_pkt);
> +
> +       mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_A=
SYNC_WIDTH,
> +                            idx, pending->width / 2, cmdq_pkt);
> +       mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_A=
SYNC_HEIGHT,
> +                            idx, pending->height, cmdq_pkt);
> +
> +       rdma_config.source_width =3D pending->pitch / fmt_info->cpp[0];
> +       rdma_config.csc_enable =3D fmt_info->is_yuv ? true : false;
> +       rdma_config.profile =3D RDMA_CSC_FULL709_TO_RGB;
> +       rdma_config.width =3D merge_cfg.in_w[0];
> +       rdma_config.height =3D pending->height;
> +       rdma_config.addr0 =3D pending->addr;
> +       rdma_config.pitch =3D pending->pitch;
> +       rdma_config.fmt =3D pending->format;
> +       mtk_mdp_rdma_config(rdma_l->regs, &rdma_config, cmdq_pkt, &rdma_l=
->cmdq_base);
> +
> +       rdma_config.x_left =3D merge_cfg.in_w[0];
> +       rdma_config.width =3D merge_cfg.in_w[1];
> +       mtk_mdp_rdma_config(rdma_r->regs, &rdma_config, cmdq_pkt, &rdma_r=
->cmdq_base);
> +
> +       mtk_ddp_write_mask(cmdq_pkt, 0x1, &merge->cmdq_base, merge->regs,
> +                          DISP_MERGE_ENABLE, MERGE_ENABLE);
> +       mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merge->regs,
> +                          DISP_MERGE_MUTE_0, 0x1);

Move this to merge driver.

> +
> +       mtk_mdp_rdma_start(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_base);
> +       if (use_dual_pipe)
> +               mtk_mdp_rdma_start(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_=
base);
> +       else
> +               mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_b=
ase);
> +}
> +
> +void mtk_ovl_adaptor_stop(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       struct mtk_ovl_adaptor_comp *rdma_l;
> +       struct mtk_ovl_adaptor_comp *rdma_r;
> +       struct mtk_ovl_adaptor_comp *merge;
> +       unsigned int reg;
> +       u32 i;
> +
> +       for (i =3D 0; i < MTK_OVL_ADAPTOR_LAYER_NUM; i++) {
> +               rdma_l =3D &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP=
_RDMA0 + 2 * i];
> +               rdma_r =3D &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP=
_RDMA0 + 2 * i + 1];
> +               merge =3D &ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERG=
E0 + i];
> +
> +               mtk_mdp_rdma_stop(rdma_l->regs, NULL, &rdma_l->cmdq_base)=
;
> +               mtk_mdp_rdma_stop(rdma_r->regs, NULL, &rdma_r->cmdq_base)=
;
> +
> +               reg =3D readl(merge->regs + DISP_MERGE_ENABLE);
> +               reg =3D reg & ~MERGE_ENABLE;
> +               writel_relaxed(reg, merge->regs + DISP_MERGE_ENABLE);

Ditto.

> +
> +               device_reset_optional(merge->dev);
> +       }
> +}
> +
> +int mtk_ovl_adaptor_clk_enable(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       struct mtk_ovl_adaptor_comp *comp;
> +       int ret;
> +       int i;
> +       int j;
> +
> +       for (i =3D OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_ID_MAX; i++) {
> +               comp =3D &ovl_adaptor->ovl_adaptor_comp[i];
> +               if (!comp->dev)
> +                       continue;
> +
> +               /* Need to power on for private rdma devices */
> +               if (i < OVL_ADAPTOR_MERGE0) {
> +                       ret =3D pm_runtime_get_sync(comp->dev);
> +                       if (ret < 0)
> +                               dev_err(dev,
> +                                       "Failed to power on, err %d-%s\n"=
,
> +                                       ret, ovl_adaptor_comp_str[i]);

undo previos pm_runtime_get_sync() and return error.

> +               }
> +
> +               for (j =3D 0; j < ARRAY_SIZE(comp->clks); j++) {
> +                       if (IS_ERR(comp->clks[j]))
> +                               break;
> +
> +                       ret =3D clk_prepare_enable(comp->clks[j]);
> +                       if (ret)
> +                               dev_err(dev,
> +                                       "Failed to enable clock %d, err %=
d-%s\n",
> +                                       i, ret, ovl_adaptor_comp_str[i]);

undo and previous job and return error.

> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +void mtk_ovl_adaptor_clk_disable(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       struct mtk_ovl_adaptor_comp *comp;
> +       int ret;
> +       int i;
> +       int j;
> +
> +       for (i =3D OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_ID_MAX; i++) {
> +               comp =3D &ovl_adaptor->ovl_adaptor_comp[i];
> +               if (!comp->dev)
> +                       continue;
> +
> +               for (j =3D 0; i < ARRAY_SIZE(comp->clks); j++) {
> +                       if (IS_ERR(comp->clks[j]))
> +                               break;
> +                       clk_disable_unprepare(comp->clks[j]);
> +               }
> +
> +               /* Need to power off for private rdma devices */
> +               if (i < OVL_ADAPTOR_MERGE0) {
> +                       ret =3D pm_runtime_put(comp->dev);
> +                       if (ret < 0)
> +                               dev_err(dev,
> +                                       "Failed to power off, err-%s\n",
> +                                       ret, ovl_adaptor_comp_str[i]);
> +               }
> +       }
> +}
> +
> +static int ovl_adaptor_comp_get_id(struct device *dev, struct device_nod=
e *node,
> +                                  enum mtk_ovl_adaptor_comp_type type)
> +{
> +       int alias_id =3D of_alias_get_id(node, private_comp_stem[type]);
> +       int ret;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(comp_matches); i++)
> +               if (comp_matches[i].type =3D=3D type &&
> +                   comp_matches[i].alias_id =3D=3D alias_id)
> +                       return i;
> +
> +       dev_err(dev, "Failed to get id. type: %d, alias: %d\n", type, ali=
as_id);
> +       return -EINVAL;
> +}
> +
> +static int private_comp_init(struct device *dev, struct device_node *nod=
e,
> +                            struct mtk_ovl_adaptor_comp *comp,
> +                            enum mtk_ovl_adaptor_comp_id id)
> +{
> +       struct platform_device *comp_pdev;
> +       int ret;
> +       int i;
> +
> +       if (id < 0 || id >=3D OVL_ADAPTOR_ID_MAX) {
> +               dev_err(dev, "Invalid component id %d\n", id);
> +               return -EINVAL;
> +       }
> +
> +       comp_pdev =3D of_find_device_by_node(node);
> +       if (!comp_pdev) {
> +               dev_warn(dev, "can't find platform device of node:%s\n",
> +                        node->name);
> +               return -ENODEV;
> +       }
> +       comp->dev =3D &comp_pdev->dev;
> +       comp->regs =3D of_iomap(node, 0);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(comp->clks); i++) {
> +               comp->clks[i] =3D of_clk_get(node, i);
> +               if (IS_ERR(comp->clks[i]))
> +                       break;
> +       }
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       ret =3D cmdq_dev_get_client_reg(comp->dev, &comp->cmdq_base, 0);
> +       if (ret)
> +               dev_info(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +
> +       if (id < OVL_ADAPTOR_MERGE0)
> +               pm_runtime_enable(comp->dev);
> +
> +       dev_info(dev, "[DRM]regs:0x%p, node:%s\n", comp->regs, ovl_adapto=
r_comp_str[id]);
> +
> +       return 0;
> +}
> +
> +static int mtk_disp_ovl_adaptor_comp_probe(struct platform_device *pdev)
> +{
> +       return 0;
> +}
> +
> +static int mtk_disp_ovl_adaptor_comp_remove(struct platform_device *pdev=
)
> +{
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] =3D {
> +       {
> +               .compatible =3D "mediatek,mt8195-vdo1-rdma",
> +               .data =3D (void *)OVL_ADAPTOR_TYPE_RDMA,
> +       }, {
> +               .compatible =3D "mediatek,mt8195-vdo1-merge",
> +               .data =3D (void *)OVL_ADAPTOR_TYPE_MERGE,
> +       },
> +       {},
> +};
> +
> +static struct platform_driver mtk_disp_ovl_adaptor_comp_driver =3D {
> +       .probe          =3D mtk_disp_ovl_adaptor_comp_probe,
> +       .remove         =3D mtk_disp_ovl_adaptor_comp_remove,
> +       .driver =3D {
> +               .name   =3D "mediatek-disp-ovl-adaptor-comp",
> +               .owner  =3D THIS_MODULE,
> +               .of_match_table =3D mtk_ovl_adaptor_comp_dt_ids,
> +       },
> +};
> +module_platform_driver(mtk_disp_ovl_adaptor_comp_driver);
> +
> +static int ovl_adaptor_comp_init(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *priv =3D dev_get_drvdata(dev);
> +       struct device_node *node, *parent;
> +       int i, ret;
> +
> +       parent =3D dev->parent->of_node->parent;
> +
> +       for_each_child_of_node(parent, node) {
> +               const struct of_device_id *of_id;
> +               enum mtk_ovl_adaptor_comp_type type;
> +               struct mtk_ovl_adaptor_comp *comp;
> +               int id;
> +
> +               of_id =3D of_match_node(mtk_ovl_adaptor_comp_dt_ids, node=
);
> +               if (!of_id)
> +                       continue;
> +
> +               if (!of_device_is_available(node)) {
> +                       dev_info(dev, "Skipping disabled component %pOF\n=
",
> +                                node);
> +                       continue;
> +               }
> +
> +               type =3D (enum mtk_ovl_adaptor_comp_type)of_id->data;
> +               id =3D ovl_adaptor_comp_get_id(dev, node, type);
> +               if (id < 0) {
> +                       dev_warn(dev, "Skipping unknown component %pOF\n"=
,
> +                                node);
> +                       continue;
> +               }
> +
> +               ret =3D private_comp_init(dev, node, &priv->ovl_adaptor_c=
omp[id], id);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id ovl_adaptor_driver_dt_match[] =3D {
> +       { .compatible =3D "mediatek,mt8195-disp-ethdr"},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_disp_ovl_adaptor_driver_dt_match);
> +
> +static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
> +{
> +       struct mtk_disp_ovl_adaptor *priv;
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *phandle =3D dev->parent->of_node;
> +       const struct of_device_id *of_id;
> +       int ret;
> +       int i;
> +
> +       dev_info(dev, "%s+\n", __func__);
> +
> +       of_id =3D of_match_node(ovl_adaptor_driver_dt_match, phandle);
> +       if (!of_id)
> +               return -ENODEV;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->mmsys_dev =3D pdev->dev.platform_data;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       ret =3D ovl_adaptor_comp_init(dev);
> +       if (ret) {
> +               dev_notice(dev, "ovl_adaptor comp init fail\n");
> +               return ret;
> +       }
> +
> +       dev_info(dev, "%s-\n", __func__);
> +       return ret;
> +}
> +
> +static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(&pde=
v->dev);
> +       int i;
> +
> +       for (i =3D OVL_ADAPTOR_MDP_RDMA0; i < OVL_ADAPTOR_MERGE0; i++)
> +               pm_runtime_disable(ovl_adaptor->ovl_adaptor_comp[i].dev);
> +
> +       return 0;
> +}
> +
> +struct platform_driver mtk_disp_ovl_adaptor_driver =3D {
> +       .probe =3D mtk_disp_ovl_adaptor_probe,
> +       .remove =3D mtk_disp_ovl_adaptor_remove,
> +       .driver =3D {
> +                       .name =3D "mediatek-disp-ovl-adaptor",
> +                       .owner =3D THIS_MODULE,
> +               },
> +};
> +module_platform_driver(mtk_disp_ovl_adaptor_driver);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h b/drivers/gp=
u/drm/mediatek/mtk_disp_ovl_adaptor.h
> new file mode 100644
> index 000000000000..7d757be1f491
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_DISP_OVL_ADAPTOR_H__
> +#define __MTK_DISP_OVL_ADAPTOR_H__
> +
> +#include <drm/mediatek_drm.h>
> +
> +void mtk_ovl_adaptor_stop(struct device *dev);
> +int mtk_ovl_adaptor_clk_enable(struct device *dev);
> +void mtk_ovl_adaptor_clk_disable(struct device *dev);
> +void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
> +                                 struct mtk_plane_state *state,
> +                                 struct cmdq_pkt *cmdq_pkt);
> +
> +#endif
> +
> --
> 2.18.0
>

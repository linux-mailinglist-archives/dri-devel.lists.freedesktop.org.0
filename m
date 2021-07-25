Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746963D4AE5
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 03:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A8A6E1A4;
	Sun, 25 Jul 2021 01:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECBF6E1A4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 01:58:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1419D60F25
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 01:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627178286;
 bh=PUD8eq+V9uJ6zSP71W2DLXQnvSTfY7Xj/QTaV+ogIFE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TAkt3fQzSyMfLGJmKf3cRUE9A7c8c2txSdQLTPiluEmDsJ6OS1dC95flT7eummfPg
 A2x9QV+LqJpH2uSY/JptMdmugxdvsoEvqQPtt3NEjJbCDly8xuviKOgNsYNBFUwldn
 v80SoaWPgEYNsmo9ec58jYMY1TZ2Yr2zVzTT+RRHv1R0smGcuoA4ZzXHwgpNnev/eJ
 rjK1kgcoRNC3pQRStGQXCA4x9I3YfEx82OhW3YvReKw6TztsymiQ6ywzEVm4avNmL3
 6omiNxVJRDqtELibQZD9q0+78C2qXve3GY4142hR9InaqBpSoqOHTzFop2qJu64jYh
 Cvhyw7013rYeA==
Received: by mail-ed1-f52.google.com with SMTP id x14so1943654edr.12
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 18:58:06 -0700 (PDT)
X-Gm-Message-State: AOAM5303Nhh+2hZJW8FbNKqj4touWR9CK8pdoUnb+FlbW+QN1yHkernG
 BzXz5abZt/jpHhWzhGMNilsXURf9AMIbLcl+4Q==
X-Google-Smtp-Source: ABdhPJxp+p9HRJa1eCsABX5Fz3PhGAavmQXuE/hFTpsu011VX6VoWOqTSkbQxEiCZ55jgmL0rSOq4phjFbRyr2tbjGo=
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr13671509edx.303.1627178284344; 
 Sat, 24 Jul 2021 18:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-13-nancy.lin@mediatek.com>
In-Reply-To: <20210722094551.15255-13-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 25 Jul 2021 09:57:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__sGTV0uAr4-yZe0Hgf92R8Gyqus1wLOYLbzCjLWj8iCA@mail.gmail.com>
Message-ID: <CAAOTY__sGTV0uAr4-yZe0Hgf92R8Gyqus1wLOYLbzCjLWj8iCA@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/mediatek: add pseudo ovl support for MT8195
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

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=8822=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add pseudo ovl module files:

My English is not good. The word 'pseudo' seems like 'looks like but
indeed not the same'.
I think the 'real' ovl also has rdma and mixer inside it, so I prefer
to treat these two ovl as different kind of ovl, not a real one and a
pseudo one.
Does I misunderstanding the word 'pseudo'?

> Pseudo ovl is an encapsulated module and designed for simplified
> DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
> an ETHDR. Two RDMAs merge into one layer, so this module support 4
> layers.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile             |   4 +-
>  .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.c    | 593 ++++++++++++++++++
>  .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.h    |  23 +
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 456 ++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       | 109 ++++
>  drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h   | 160 +++++

Seperate mtk_dmp_rdma driver to an independent patch.

>  6 files changed, 1344 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 27c89847d43b..31613564f499 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -13,7 +13,9 @@ mediatek-drm-y :=3D mtk_disp_ccorr.o \
>                   mtk_drm_gem.o \
>                   mtk_drm_plane.o \
>                   mtk_dsi.o \
> -                 mtk_dpi.o
> +                 mtk_dpi.o \
> +                 mtk_disp_pseudo_ovl.o \
> +                 mtk_mdp_rdma.o
>
>  obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c b/drivers/gpu=
/drm/mediatek/mtk_disp_pseudo_ovl.c
> new file mode 100644
> index 000000000000..0446fa99dd0a
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
> @@ -0,0 +1,593 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +#include <linux/component.h>
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
> +#include "mtk_mdp_rdma.h"
> +#include "mtk_disp_pseudo_ovl.h"
> +
> +#define DISP_MERGE_ENABLE      0x0
> +       #define MERGE_ENABLE BIT(0)
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
> +#define MTK_PSEUDO_OVL_SINGLE_PIPE_MAX_WIDTH 1920

Which hardware has this limitation? I would like this naming to
reflect which hardware has this limitation.

> +
> +enum mtk_pseudo_ovl_comp_type {
> +       PSEUDO_OVL_TYPE_RDMA =3D 0,
> +       PSEUDO_OVL_TYPE_MERGE,
> +       PSEUDO_OVL_TYPE_NUM,
> +};
> +
> +enum mtk_pseudo_ovl_comp_id {
> +       PSEUDO_OVL_RDMA_BASE =3D 0,
> +       PSEUDO_OVL_MDP_RDMA0 =3D PSEUDO_OVL_RDMA_BASE,

I think you could directly use PSEUDO_OVL_MDP_RDMA0 and remove
PSEUDO_OVL_RDMA_BASE.

> +       PSEUDO_OVL_MDP_RDMA1,
> +       PSEUDO_OVL_MDP_RDMA2,
> +       PSEUDO_OVL_MDP_RDMA3,
> +       PSEUDO_OVL_MDP_RDMA4,
> +       PSEUDO_OVL_MDP_RDMA5,
> +       PSEUDO_OVL_MDP_RDMA6,
> +       PSEUDO_OVL_MDP_RDMA7,
> +       PSEUDO_OVL_MERGE_BASE,
> +       PSEUDO_OVL_MERGE0 =3D PSEUDO_OVL_MERGE_BASE,

Ditto.

> +       PSEUDO_OVL_MERGE1,
> +       PSEUDO_OVL_MERGE2,
> +       PSEUDO_OVL_MERGE3,
> +       PSEUDO_OVL_ID_MAX
> +};
> +
> +struct pseudo_ovl_data {
> +       unsigned int layer_nr;
> +       struct mtk_mdp_rdma_fifo fifo;
> +};
> +
> +struct pseudo_ovl_comp_match {
> +       enum mtk_pseudo_ovl_comp_type type;
> +       int alias_id;
> +};
> +
> +struct pseudo_ovl_merge_config {
> +       unsigned int fmt;
> +       unsigned int merge_mode;
> +       unsigned int in_w[2];
> +       unsigned int out_w[2];
> +       unsigned int in_h;
> +};
> +
> +struct mtk_pseudo_ovl_comp {
> +       struct device *dev;
> +       struct clk *clks[2];
> +       struct cmdq_client_reg cmdq_base;
> +       void __iomem *regs;
> +};
> +
> +struct mtk_disp_pseudo_ovl {
> +       struct mtk_pseudo_ovl_comp pseudo_ovl_comp[PSEUDO_OVL_ID_MAX];
> +       const struct pseudo_ovl_data *data;
> +       struct device *mmsys_dev;
> +};
> +
> +static const char * const pseudo_ovl_comp_str[] =3D {
> +       "PSEUDO_OVL_MDP_RDMA0",
> +       "PSEUDO_OVL_MDP_RDMA1",
> +       "PSEUDO_OVL_MDP_RDMA2",
> +       "PSEUDO_OVL_MDP_RDMA3",
> +       "PSEUDO_OVL_MDP_RDMA4",
> +       "PSEUDO_OVL_MDP_RDMA5",
> +       "PSEUDO_OVL_MDP_RDMA6",
> +       "PSEUDO_OVL_MDP_RDMA7",
> +       "PSEUDO_OVL_MERGE0",
> +       "PSEUDO_OVL_MERGE1",
> +       "PSEUDO_OVL_MERGE2",
> +       "PSEUDO_OVL_MERGE3",
> +       "PSEUDO_OVL_ID_MAX"
> +};
> +
> +static const char * const private_comp_stem[PSEUDO_OVL_TYPE_NUM] =3D {
> +       [PSEUDO_OVL_TYPE_RDMA] =3D "vdo1_rdma",
> +       [PSEUDO_OVL_TYPE_MERGE] =3D "merge",
> +};
> +
> +static const struct pseudo_ovl_comp_match comp_matches[PSEUDO_OVL_ID_MAX=
] =3D {
> +       [PSEUDO_OVL_MDP_RDMA0] =3D        { PSEUDO_OVL_TYPE_RDMA, 0 },
> +       [PSEUDO_OVL_MDP_RDMA1] =3D        { PSEUDO_OVL_TYPE_RDMA, 1 },
> +       [PSEUDO_OVL_MDP_RDMA2] =3D        { PSEUDO_OVL_TYPE_RDMA, 2 },
> +       [PSEUDO_OVL_MDP_RDMA3] =3D        { PSEUDO_OVL_TYPE_RDMA, 3 },
> +       [PSEUDO_OVL_MDP_RDMA4] =3D        { PSEUDO_OVL_TYPE_RDMA, 4 },
> +       [PSEUDO_OVL_MDP_RDMA5] =3D        { PSEUDO_OVL_TYPE_RDMA, 5 },
> +       [PSEUDO_OVL_MDP_RDMA6] =3D        { PSEUDO_OVL_TYPE_RDMA, 6 },
> +       [PSEUDO_OVL_MDP_RDMA7] =3D        { PSEUDO_OVL_TYPE_RDMA, 7 },
> +       [PSEUDO_OVL_MERGE0] =3D   { PSEUDO_OVL_TYPE_MERGE, 1 },
> +       [PSEUDO_OVL_MERGE1] =3D   { PSEUDO_OVL_TYPE_MERGE, 2 },
> +       [PSEUDO_OVL_MERGE2] =3D   { PSEUDO_OVL_TYPE_MERGE, 3 },
> +       [PSEUDO_OVL_MERGE3] =3D   { PSEUDO_OVL_TYPE_MERGE, 4 },
> +};
> +
> +static int mtk_pseudo_ovl_fifo_setting(struct mtk_disp_pseudo_ovl *pseud=
o_ovl,
> +                                      struct cmdq_pkt *handle)
> +{
> +       struct mtk_pseudo_ovl_comp *rdma =3D NULL;
> +       const struct pseudo_ovl_data *data =3D pseudo_ovl->data;
> +       const struct mtk_mdp_rdma_fifo *fifo =3D &data->fifo;
> +       int i;
> +
> +       for (i =3D PSEUDO_OVL_MDP_RDMA0; i <=3D PSEUDO_OVL_MDP_RDMA7; i++=
) {
> +               rdma =3D &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_BAS=
E + i];
> +               mtk_mdp_rdma_fifo_config(rdma->regs, handle, &rdma->cmdq_=
base, fifo);
> +       }
> +
> +       return 0;
> +}
> +
> +static void mtk_pseudo_ovl_merge_config(struct mtk_pseudo_ovl_comp *comp=
,
> +                                       struct pseudo_ovl_merge_config *m=
erge_cfg,
> +                                       struct cmdq_pkt *cmdq_pkt)
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
g->out_w[1]),
> +                             &comp->cmdq_base, comp->regs, DISP_MERGE_CF=
G_5);
> +               break;
> +       }
> +
> +       mtk_ddp_write(cmdq_pkt, merge_cfg->merge_mode, &comp->cmdq_base,
> +                     comp->regs, DISP_MERGE_CFG_12);
> +       mtk_ddp_write(cmdq_pkt, CFG_10_NO_SWAP, &comp->cmdq_base,
> +                     comp->regs, DISP_MERGE_CFG_10);
> +       mtk_ddp_write_mask(cmdq_pkt, 1, &comp->cmdq_base, comp->regs,
> +                          DISP_MERGE_ENABLE, MERGE_ENABLE);
> +}
> +
> +void mtk_pseudo_ovl_layer_config(struct device *dev, unsigned int idx,
> +                                struct mtk_plane_state *state,
> +                                struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_pseudo_ovl *pseudo_ovl =3D dev_get_drvdata(dev);
> +       struct mtk_plane_pending_state *pending =3D &state->pending;
> +       struct pseudo_ovl_merge_config merge_cfg =3D {0};
> +       struct mtk_mdp_rdma_cfg rdma_config =3D {0};
> +       struct mtk_pseudo_ovl_comp *rdma_l;
> +       struct mtk_pseudo_ovl_comp *rdma_r;
> +       struct mtk_pseudo_ovl_comp *merge;
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
> +       rdma_l =3D &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_BASE + 2 =
* idx];
> +       rdma_r =3D &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_BASE + 2 =
* idx + 1];
> +       merge =3D &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_MERGE_BASE + id=
x];
> +
> +       if (!pending->enable) {
> +               mtk_ddp_write_mask(cmdq_pkt, 0x0, &merge->cmdq_base, merg=
e->regs,
> +                                  DISP_MERGE_ENABLE, MERGE_ENABLE);
> +               mtk_mdp_rdma_stop(rdma_l->regs, cmdq_pkt, &rdma_l->cmdq_b=
ase);
> +               mtk_mdp_rdma_stop(rdma_r->regs, cmdq_pkt, &rdma_r->cmdq_b=
ase);
> +               return;
> +       }
> +
> +       if (pending->width > MTK_PSEUDO_OVL_SINGLE_PIPE_MAX_WIDTH)
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
> +       } else {
> +               merge_cfg.merge_mode =3D CFG12_10_10_1PI_2PO_BUF_MODE;
> +               merge_cfg.in_w[0] =3D pending->width;
> +       }
> +
> +       mtk_pseudo_ovl_merge_config(merge, &merge_cfg, cmdq_pkt);
> +
> +       mtk_mmsys_ddp_config(pseudo_ovl->mmsys_dev, MMSYS_CONFIG_MERGE_AS=
YNC_WIDTH,
> +                            idx, pending->width / 2, cmdq_pkt);
> +       mtk_mmsys_ddp_config(pseudo_ovl->mmsys_dev, MMSYS_CONFIG_MERGE_AS=
YNC_HEIGHT,
> +                            idx, pending->height, cmdq_pkt);
> +
> +       rdma_config.source_width =3D pending->pitch / fmt_info->cpp[0];
> +       rdma_config.csc_enable =3D fmt_info->is_yuv ? true : false;
> +       rdma_config.profile =3D RDMA_CSC_FULL709_TO_RGB;
> +       rdma_config.encode_type =3D RDMA_ENCODE_NONE;
> +       rdma_config.block_size =3D RDMA_BLOCK_NONE;
> +       rdma_config.width =3D merge_cfg.in_w[0];
> +       rdma_config.height =3D pending->height;
> +       rdma_config.addr0 =3D pending->addr;
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
> +void mtk_pseudo_ovl_config(struct device *dev, unsigned int w, unsigned =
int h,
> +                          unsigned int vrefresh, unsigned int bpc,
> +                          struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_pseudo_ovl *pseudo_ovl =3D dev_get_drvdata(dev);
> +
> +       dev_info(dev, "%s w:%d, h:%d\n", __func__, w, h);
> +
> +       mtk_pseudo_ovl_fifo_setting(pseudo_ovl, cmdq_pkt);
> +}
> +
> +void mtk_pseudo_ovl_start(struct device *dev)
> +{
> +}
> +
> +void mtk_pseudo_ovl_stop(struct device *dev)
> +{
> +       struct mtk_disp_pseudo_ovl *pseudo_ovl =3D dev_get_drvdata(dev);
> +       struct mtk_pseudo_ovl_comp *rdma_l;
> +       struct mtk_pseudo_ovl_comp *rdma_r;
> +       struct mtk_pseudo_ovl_comp *merge;
> +       unsigned int reg;
> +       u32 i;
> +
> +       for (i =3D 0; i < pseudo_ovl->data->layer_nr; i++) {
> +               rdma_l =3D &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_B=
ASE + 2 * i];
> +               rdma_r =3D &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_RDMA_B=
ASE + 2 * i + 1];
> +               merge =3D &pseudo_ovl->pseudo_ovl_comp[PSEUDO_OVL_MERGE_B=
ASE + i];
> +
> +               mtk_mdp_rdma_stop(rdma_l->regs, NULL, &rdma_l->cmdq_base)=
;
> +               mtk_mdp_rdma_stop(rdma_r->regs, NULL, &rdma_r->cmdq_base)=
;
> +
> +               reg =3D readl(merge->regs + DISP_MERGE_ENABLE);
> +               reg =3D reg & ~MERGE_ENABLE;
> +               writel_relaxed(reg, merge->regs + DISP_MERGE_ENABLE);
> +
> +               device_reset_optional(merge->dev);
> +       }
> +}
> +
> +int mtk_pseudo_ovl_clk_enable(struct device *dev)
> +{
> +       struct mtk_disp_pseudo_ovl *pseudo_ovl =3D dev_get_drvdata(dev);
> +       struct mtk_pseudo_ovl_comp *comp;
> +       int ret;
> +       int i;
> +       int j;
> +
> +       for (i =3D PSEUDO_OVL_MDP_RDMA0; i < PSEUDO_OVL_ID_MAX; i++) {
> +               comp =3D &pseudo_ovl->pseudo_ovl_comp[i];
> +               if (!comp->dev)
> +                       continue;
> +
> +               /* Need to power on for private rdma devices */
> +               if (i < PSEUDO_OVL_MERGE_BASE) {
> +                       ret =3D pm_runtime_get_sync(comp->dev);
> +                       if (ret < 0)
> +                               dev_err(dev,
> +                                       "Failed to power on, err %d-%s\n"=
,
> +                                       ret, pseudo_ovl_comp_str[i]);
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
> +                                       i, ret, pseudo_ovl_comp_str[i]);
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +void mtk_pseudo_ovl_clk_disable(struct device *dev)
> +{
> +       struct mtk_disp_pseudo_ovl *pseudo_ovl =3D dev_get_drvdata(dev);
> +       struct mtk_pseudo_ovl_comp *comp;
> +       int ret;
> +       int i;
> +       int j;
> +
> +       for (i =3D PSEUDO_OVL_MDP_RDMA0; i < PSEUDO_OVL_ID_MAX; i++) {
> +               comp =3D &pseudo_ovl->pseudo_ovl_comp[i];
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
> +               if (i < PSEUDO_OVL_MERGE_BASE) {
> +                       ret =3D pm_runtime_put(comp->dev);
> +                       if (ret < 0)
> +                               dev_err(dev,
> +                                       "Failed to power off, err-%s\n",
> +                                       ret, pseudo_ovl_comp_str[i]);
> +               }
> +       }
> +}
> +
> +static int pseudo_ovl_comp_get_id(struct device *dev, struct device_node=
 *node,
> +                                 enum mtk_pseudo_ovl_comp_type type)
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
> +                            struct mtk_pseudo_ovl_comp *comp,
> +                            enum mtk_pseudo_ovl_comp_id id)
> +{
> +       struct platform_device *comp_pdev;
> +       int ret;
> +       int i;
> +
> +       if (id < 0 || id >=3D PSEUDO_OVL_ID_MAX) {
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
> +       if (id < PSEUDO_OVL_MERGE_BASE)
> +               pm_runtime_enable(comp->dev);
> +
> +       dev_info(dev, "[DRM]regs:0x%p, node:%s\n", comp->regs, pseudo_ovl=
_comp_str[id]);
> +
> +       return 0;
> +}
> +
> +static int mtk_disp_pseudo_ovl_comp_probe(struct platform_device *pdev)
> +{
> +       return 0;
> +}
> +
> +static int mtk_disp_pseudo_ovl_comp_remove(struct platform_device *pdev)
> +{
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_pseudo_ovl_comp_dt_ids[] =3D {
> +       {
> +               .compatible =3D "mediatek,mt8195-vdo1-rdma",
> +               .data =3D (void *)PSEUDO_OVL_TYPE_RDMA,
> +       }, {
> +               .compatible =3D "mediatek,mt8195-vdo1-merge",
> +               .data =3D (void *)PSEUDO_OVL_TYPE_MERGE,
> +       },
> +       {},
> +};
> +
> +static struct platform_driver mtk_disp_pseudo_ovl_comp_driver =3D {
> +       .probe          =3D mtk_disp_pseudo_ovl_comp_probe,
> +       .remove         =3D mtk_disp_pseudo_ovl_comp_remove,
> +       .driver =3D {
> +               .name   =3D "mediatek-disp-pseudo-ovl-comp",
> +               .owner  =3D THIS_MODULE,
> +               .of_match_table =3D mtk_pseudo_ovl_comp_dt_ids,
> +       },
> +};
> +module_platform_driver(mtk_disp_pseudo_ovl_comp_driver);
> +
> +static int pseudo_ovl_comp_init(struct device *dev)
> +{
> +       struct mtk_disp_pseudo_ovl *priv =3D dev_get_drvdata(dev);
> +       struct device_node *node, *parent;
> +       int i, ret;
> +
> +       parent =3D dev->parent->of_node->parent;
> +
> +       for_each_child_of_node(parent, node) {
> +               const struct of_device_id *of_id;
> +               enum mtk_pseudo_ovl_comp_type type;
> +               struct mtk_pseudo_ovl_comp *comp;
> +               int id;
> +
> +               of_id =3D of_match_node(mtk_pseudo_ovl_comp_dt_ids, node)=
;
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
> +               type =3D (enum mtk_pseudo_ovl_comp_type)of_id->data;
> +               id =3D pseudo_ovl_comp_get_id(dev, node, type);
> +               if (id < 0) {
> +                       dev_warn(dev, "Skipping unknown component %pOF\n"=
,
> +                                node);
> +                       continue;
> +               }
> +
> +               ret =3D private_comp_init(dev, node, &priv->pseudo_ovl_co=
mp[id], id);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct pseudo_ovl_data mt8195_pseudo_ovl_driver_data =3D {
> +       .layer_nr =3D 4,
> +       .fifo.read_request_type =3D 7,
> +       .fifo.command_div =3D 1,
> +       .fifo.ext_preutra_en =3D 1,
> +       .fifo.ultra_en =3D 0,
> +       .fifo.pre_ultra_en =3D 1,
> +       .fifo.ext_ultra_en =3D 1,
> +       .fifo.extrd_arb_max_0 =3D 3,
> +       .fifo.buf_resv_size_0 =3D 0,
> +       .fifo.issue_req_th_0 =3D 0,
> +       .fifo.ultra_h_con_0 =3D 156,
> +       .fifo.ultra_l_con_0 =3D 104,
> +};

Now only support one SoC, so remove driver data and change these to
definition instead of variable.

> +
> +static const struct of_device_id pseudo_ovl_driver_dt_match[] =3D {
> +       { .compatible =3D "mediatek,mt8195-disp-ethdr",
> +         .data =3D &mt8195_pseudo_ovl_driver_data},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_disp_pseudo_ovl_driver_dt_match);
> +
> +static int mtk_disp_pseudo_ovl_probe(struct platform_device *pdev)
> +{
> +       struct mtk_disp_pseudo_ovl *priv;
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *phandle =3D dev->parent->of_node;
> +       const struct of_device_id *of_id;
> +       int ret;
> +       int i;
> +
> +       dev_info(dev, "%s+\n", __func__);
> +
> +       of_id =3D of_match_node(pseudo_ovl_driver_dt_match, phandle);
> +       if (!of_id)
> +               return -ENODEV;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->mmsys_dev =3D pdev->dev.platform_data;
> +
> +       priv->data =3D of_id->data;
> +       platform_set_drvdata(pdev, priv);
> +
> +       ret =3D pseudo_ovl_comp_init(dev);
> +       if (ret) {
> +               dev_notice(dev, "pseudo_ovl comp init fail\n");
> +               return ret;
> +       }
> +
> +       dev_info(dev, "%s-\n", __func__);
> +       return ret;
> +}
> +
> +static int mtk_disp_pseudo_ovl_remove(struct platform_device *pdev)
> +{
> +       struct mtk_disp_pseudo_ovl *pseudo_ovl =3D dev_get_drvdata(&pdev-=
>dev);
> +       int i;
> +
> +       for (i =3D PSEUDO_OVL_MDP_RDMA0; i < PSEUDO_OVL_MERGE_BASE; i++)
> +               pm_runtime_disable(pseudo_ovl->pseudo_ovl_comp[i].dev);
> +
> +       return 0;
> +}
> +
> +struct platform_driver mtk_disp_pseudo_ovl_driver =3D {
> +       .probe =3D mtk_disp_pseudo_ovl_probe,
> +       .remove =3D mtk_disp_pseudo_ovl_remove,
> +       .driver =3D {
> +                       .name =3D "mediatek-disp-pseudo-ovl",
> +                       .owner =3D THIS_MODULE,
> +               },
> +};
> +module_platform_driver(mtk_disp_pseudo_ovl_driver);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.h b/drivers/gpu=
/drm/mediatek/mtk_disp_pseudo_ovl.h
> new file mode 100644
> index 000000000000..b3fe1e1702b8
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_DISP_PSEUDO_OVL_H__
> +#define __MTK_DISP_PSEUDO_OVL_H__
> +
> +#include <drm/mediatek_drm.h>
> +
> +void mtk_pseudo_ovl_start(struct device *dev);
> +void mtk_pseudo_ovl_stop(struct device *dev);
> +int mtk_pseudo_ovl_clk_enable(struct device *dev);
> +void mtk_pseudo_ovl_clk_disable(struct device *dev);
> +void mtk_pseudo_ovl_config(struct device *dev, unsigned int w, unsigned =
int h,
> +                          unsigned int vrefresh, unsigned int bpc,
> +                          struct cmdq_pkt *cmdq_pkt);
> +void mtk_pseudo_ovl_layer_config(struct device *dev, unsigned int idx,
> +                                struct mtk_plane_state *state,
> +                                struct cmdq_pkt *cmdq_pkt);
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/me=
diatek/mtk_mdp_rdma.c
> new file mode 100644
> index 000000000000..81d3cc4872eb
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -0,0 +1,456 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include "mtk_drm_drv.h"
> +#include "mtk_mdp_reg_rdma.h"
> +#include "mtk_mdp_rdma.h"
> +
> +#define RDMA_INPUT_SWAP                BIT(14)
> +#define RDMA_INPUT_10BIT       BIT(18)
> +#define IRQ_INT_EN_ALL \
> +       (REG_FLD_MASK(FLD_UNDERRUN_INT_EN) |\
> +        REG_FLD_MASK(FLD_REG_UPDATE_INT_EN) |\
> +        REG_FLD_MASK(FLD_FRAME_COMPLETE_INT_EN))
> +
> +static unsigned int rdma_get_y_pitch(unsigned int fmt, unsigned int widt=
h)
> +{
> +       switch (fmt) {
> +       default:
> +       case DRM_FORMAT_RGB565:
> +       case DRM_FORMAT_BGR565:
> +               return 2 * width;
> +       case DRM_FORMAT_RGB888:
> +       case DRM_FORMAT_BGR888:
> +               return 3 * width;
> +       case DRM_FORMAT_RGBX8888:
> +       case DRM_FORMAT_RGBA8888:
> +       case DRM_FORMAT_BGRX8888:
> +       case DRM_FORMAT_BGRA8888:
> +       case DRM_FORMAT_XRGB8888:
> +       case DRM_FORMAT_ARGB8888:
> +       case DRM_FORMAT_XBGR8888:
> +       case DRM_FORMAT_ABGR8888:
> +       case DRM_FORMAT_ARGB2101010:
> +       case DRM_FORMAT_ABGR2101010:
> +       case DRM_FORMAT_RGBA1010102:
> +       case DRM_FORMAT_BGRA1010102:
> +               return 4 * width;
> +       case DRM_FORMAT_UYVY:
> +       case DRM_FORMAT_YUYV:
> +               return 2 * width;
> +       case DRM_FORMAT_NV12:
> +       case DRM_FORMAT_NV21:
> +               return 1 * width;
> +       }
> +}
> +
> +static unsigned int rdma_get_uv_pitch(unsigned int fmt, unsigned int wid=
th)
> +{
> +       switch (fmt) {
> +       default:
> +               return 0;
> +       case DRM_FORMAT_NV12:
> +       case DRM_FORMAT_NV21:
> +               return 4 * width;
> +       }
> +}
> +
> +static unsigned int rdma_get_block_h(unsigned int mode)
> +{
> +       switch (mode) {
> +       default:
> +               return 0;
> +       case RDMA_BLOCK_8x8:
> +       case RDMA_BLOCK_16x8:
> +       case RDMA_BLOCK_32x8:
> +               return 8;
> +       case RDMA_BLOCK_8x16:
> +       case RDMA_BLOCK_16x16:
> +       case RDMA_BLOCK_32x16:
> +               return 16;
> +       case RDMA_BLOCK_8x32:
> +       case RDMA_BLOCK_16x32:
> +       case RDMA_BLOCK_32x32:
> +               return 32;
> +       }
> +}
> +
> +static unsigned int rdma_get_horizontal_shift_uv(unsigned int fmt)
> +{
> +       switch (fmt) {
> +       default:
> +               return 0;
> +       case DRM_FORMAT_NV12:
> +       case DRM_FORMAT_NV21:
> +               return 1;
> +       }
> +}
> +
> +static unsigned int rdma_get_vertical_shift_uv(unsigned int fmt)
> +{
> +       switch (fmt) {
> +       default:
> +               return 0;
> +       case DRM_FORMAT_NV12:
> +       case DRM_FORMAT_NV21:
> +               return 1;
> +       }
> +}
> +
> +static unsigned int rdma_get_bits_per_pixel_y(unsigned int fmt)
> +{
> +       switch (fmt) {
> +       default:
> +       case DRM_FORMAT_RGB565:
> +       case DRM_FORMAT_BGR565:
> +               return 16;
> +       case DRM_FORMAT_RGB888:
> +       case DRM_FORMAT_BGR888:
> +               return 24;
> +       case DRM_FORMAT_RGBX8888:
> +       case DRM_FORMAT_RGBA8888:
> +       case DRM_FORMAT_BGRX8888:
> +       case DRM_FORMAT_BGRA8888:
> +       case DRM_FORMAT_XRGB8888:
> +       case DRM_FORMAT_ARGB8888:
> +       case DRM_FORMAT_XBGR8888:
> +       case DRM_FORMAT_ABGR8888:
> +               return 32;
> +       case DRM_FORMAT_UYVY:
> +       case DRM_FORMAT_YUYV:
> +               return 16;
> +       case DRM_FORMAT_NV12:
> +       case DRM_FORMAT_NV21:
> +               return 8;
> +       }
> +}
> +
> +static unsigned int rdma_get_bits_per_pixel_uv(unsigned int fmt)
> +{
> +       switch (fmt) {
> +       default:
> +               return 0;
> +       case DRM_FORMAT_NV12:
> +       case DRM_FORMAT_NV21:
> +               return 16;
> +       }
> +}
> +
> +static bool with_alpha(uint32_t format)
> +{
> +       const struct drm_format_info *fmt_info =3D drm_format_info(format=
);
> +
> +       return fmt_info->has_alpha;
> +}
> +
> +static unsigned int rdma_fmt_convert(unsigned int fmt)
> +{
> +       switch (fmt) {
> +       default:
> +       case DRM_FORMAT_RGB565:
> +               return RDMA_INPUT_FORMAT_RGB565;
> +       case DRM_FORMAT_BGR565:
> +               return RDMA_INPUT_FORMAT_RGB565 | RDMA_INPUT_SWAP;
> +       case DRM_FORMAT_RGB888:
> +               return RDMA_INPUT_FORMAT_RGB888;
> +       case DRM_FORMAT_BGR888:
> +               return RDMA_INPUT_FORMAT_RGB888 | RDMA_INPUT_SWAP;
> +       case DRM_FORMAT_RGBX8888:
> +       case DRM_FORMAT_RGBA8888:
> +               return RDMA_INPUT_FORMAT_ARGB8888;
> +       case DRM_FORMAT_BGRX8888:
> +       case DRM_FORMAT_BGRA8888:
> +               return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_SWAP;
> +       case DRM_FORMAT_XRGB8888:
> +       case DRM_FORMAT_ARGB8888:
> +               return RDMA_INPUT_FORMAT_RGBA8888;
> +       case DRM_FORMAT_XBGR8888:
> +       case DRM_FORMAT_ABGR8888:
> +               return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_SWAP;
> +       case DRM_FORMAT_ABGR2101010:
> +               return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_SWAP |
> +                               RDMA_INPUT_10BIT;
> +       case DRM_FORMAT_ARGB2101010:
> +               return RDMA_INPUT_FORMAT_RGBA8888 | RDMA_INPUT_10BIT;
> +       case DRM_FORMAT_RGBA1010102:
> +               return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_SWAP |
> +                               RDMA_INPUT_10BIT;
> +       case DRM_FORMAT_BGRA1010102:
> +               return RDMA_INPUT_FORMAT_ARGB8888 | RDMA_INPUT_10BIT;
> +       case DRM_FORMAT_UYVY:
> +               return RDMA_INPUT_FORMAT_UYVY;
> +       case DRM_FORMAT_YUYV:
> +               return RDMA_INPUT_FORMAT_YUY2;
> +       }
> +}
> +
> +void mtk_mdp_rdma_start(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
> +                       struct cmdq_client_reg *cmdq_base)
> +{
> +       unsigned int inten =3D IRQ_INT_EN_ALL;
> +
> +       mtk_ddp_write_mask(cmdq_pkt, inten, cmdq_base, base,
> +                          MDP_RDMA_INTERRUPT_ENABLE, IRQ_INT_EN_ALL);

Why do you enable rdma interrupt?

> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_ROT_ENABLE, 1), cmdq=
_base,
> +                          base, MDP_RDMA_EN, REG_FLD_MASK(FLD_ROT_ENABLE=
));
> +}
> +
> +void mtk_mdp_rdma_stop(void __iomem *base, struct cmdq_pkt *cmdq_pkt,
> +                      struct cmdq_client_reg *cmdq_base)
> +{
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_ROT_ENABLE, 0), cmdq=
_base,
> +                          base, MDP_RDMA_EN, REG_FLD_MASK(FLD_ROT_ENABLE=
));
> +       mtk_ddp_write_mask(cmdq_pkt, 0, cmdq_base, base,
> +                          MDP_RDMA_INTERRUPT_ENABLE, IRQ_INT_EN_ALL);
> +       mtk_ddp_write_mask(cmdq_pkt, 0, cmdq_base, base,
> +                          MDP_RDMA_INTERRUPT_STATUS, IRQ_INT_EN_ALL);
> +       mtk_ddp_write_mask(cmdq_pkt, 1, cmdq_base, base, MDP_RDMA_RESET, =
~0);
> +       mtk_ddp_write_mask(cmdq_pkt, 0, cmdq_base, base, MDP_RDMA_RESET, =
~0);
> +}
> +
> +void mtk_mdp_rdma_fifo_config(void __iomem *base, struct cmdq_pkt *cmdq_=
pkt,
> +                             struct cmdq_client_reg *cmdq_base,
> +                             const struct mtk_mdp_rdma_fifo *fifo)

Why do you pass fifo config from ovl to rdma?
I think just rdma know how to set these fifo parameter.

> +{
> +       int reg;
> +       int reg_val;
> +       int reg_mask;
> +
> +       reg =3D MDP_RDMA_GMCIF_CON;
> +       reg_val =3D REG_FLD_VAL(FLD_RD_REQ_TYPE, fifo->read_request_type)=
 |
> +                 REG_FLD_VAL(FLD_COMMAND_DIV, fifo->command_div) |
> +                 REG_FLD_VAL(FLD_EXT_PREULTRA_EN, fifo->ext_preutra_en) =
|
> +                 REG_FLD_VAL(FLD_ULTRA_EN, fifo->ultra_en) |
> +                 REG_FLD_VAL(PRE_ULTRA_EN, fifo->pre_ultra_en) |
> +                 REG_FLD_VAL(FLD_EXT_ULTRA_EN, fifo->ext_ultra_en);
> +       reg_mask =3D REG_FLD_MASK(FLD_RD_REQ_TYPE) |
> +                  REG_FLD_MASK(FLD_COMMAND_DIV) |
> +                  REG_FLD_MASK(FLD_EXT_PREULTRA_EN) |
> +                  REG_FLD_MASK(FLD_ULTRA_EN) |
> +                  REG_FLD_MASK(PRE_ULTRA_EN) |
> +                  REG_FLD_MASK(FLD_EXT_ULTRA_EN);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_DMA_CON_0;
> +       reg_val =3D REG_FLD_VAL(FLD_EXTRD_ARB_MAX, fifo->extrd_arb_max_0)=
 |
> +                 REG_FLD_VAL(FLD_BUF_RESV_SIZE, fifo->buf_resv_size_0) |
> +                 REG_FLD_VAL(FLD_ISSUE_REQ_TH, fifo->issue_req_th_0);
> +       reg_mask =3D REG_FLD_MASK(FLD_EXTRD_ARB_MAX) |
> +                  REG_FLD_MASK(FLD_BUF_RESV_SIZE) |
> +                  REG_FLD_MASK(FLD_ISSUE_REQ_TH);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_UTRA_H_CON_0;
> +       reg_val =3D REG_FLD_VAL(FLD_PREUTRA_H_OFS_0, fifo->ultra_h_con_0)=
;
> +       reg_mask =3D REG_FLD_MASK(FLD_PREUTRA_H_OFS_0);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_UTRA_L_CON_0;
> +       reg_val =3D REG_FLD_VAL(FLD_PREUTRA_L_OFS_0, fifo->ultra_l_con_0)=
;
> +       reg_mask =3D REG_FLD_MASK(FLD_PREUTRA_L_OFS_0);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_DMABUF_CON_1;
> +       reg_val =3D REG_FLD_VAL(FLD_EXTRD_ARB_MAX_1, 0) |
> +                 REG_FLD_VAL(FLD_BUF_RESV_SIZE_1, 0) |
> +                 REG_FLD_VAL(FLD_ISSUE_REQ_TH_1, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_EXTRD_ARB_MAX_1) |
> +                  REG_FLD_MASK(FLD_BUF_RESV_SIZE_1) |
> +                  REG_FLD_MASK(FLD_ISSUE_REQ_TH_1);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_ULTRA_TH_HIGH_CON_1;
> +       reg_val =3D REG_FLD_VAL(FLD_PRE_ULTRA_TH_HIGH_OFS_1, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_PRE_ULTRA_TH_HIGH_OFS_1);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_ULTRA_TH_LOW_CON_1;
> +       reg_val =3D REG_FLD_VAL(FLD_PRE_ULTRA_TH_LOW_OFS_1, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_PRE_ULTRA_TH_LOW_OFS_1);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_DMABUF_CON_2;
> +       reg_val =3D REG_FLD_VAL(FLD_EXTRD_ARB_MAX_2, 0) |
> +                 REG_FLD_VAL(FLD_BUF_RESV_SIZE_2, 0) |
> +                 REG_FLD_VAL(FLD_ISSUE_REQ_TH_2, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_EXTRD_ARB_MAX_2) |
> +                  REG_FLD_MASK(FLD_BUF_RESV_SIZE_2) |
> +                  REG_FLD_MASK(FLD_ISSUE_REQ_TH_2);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_UTRA_H_CON_2;
> +       reg_val =3D REG_FLD_VAL(FLD_PRE_ULTRA_TH_HIGH_OFS_2, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_PRE_ULTRA_TH_HIGH_OFS_2);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_ULTRA_TH_LOW_CON_2;
> +       reg_val =3D REG_FLD_VAL(FLD_PRE_ULTRA_TH_LOW_OFS_2, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_PRE_ULTRA_TH_LOW_OFS_2);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_DMABUF_CON_3;
> +       reg_val =3D REG_FLD_VAL(FLD_EXTRD_ARB_MAX_3, 0) |
> +                 REG_FLD_VAL(FLD_BUF_RESV_SIZE_3, 0) |
> +                 REG_FLD_VAL(FLD_ISSUE_REQ_TH_3, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_EXTRD_ARB_MAX_3) |
> +                  REG_FLD_MASK(FLD_BUF_RESV_SIZE_3) |
> +                  REG_FLD_MASK(FLD_ISSUE_REQ_TH_3);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_UTRA_H_CON_3;
> +       reg_val =3D REG_FLD_VAL(FLD_PRE_ULTRA_TH_HIGH_OFS_3, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_PRE_ULTRA_TH_HIGH_OFS_3);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +
> +       reg =3D MDP_RDMA_ULTRA_TH_LOW_CON_3;
> +       reg_val =3D REG_FLD_VAL(FLD_PRE_ULTRA_TH_LOW_OFS_3, 0);
> +       reg_mask =3D REG_FLD_MASK(FLD_PRE_ULTRA_TH_LOW_OFS_3);
> +       mtk_ddp_write_mask(cmdq_pkt, reg_val, cmdq_base, base, reg, reg_m=
ask);
> +}
> +
> +void mtk_mdp_rdma_config(void __iomem *base, struct mtk_mdp_rdma_cfg *cf=
g,
> +                        struct cmdq_pkt *cmdq_pkt,
> +                        struct cmdq_client_reg *cmdq_base)
> +{
> +       unsigned int src_pitch_uv =3D rdma_get_uv_pitch(cfg->fmt, cfg->so=
urce_width);
> +       unsigned int src_pitch_y =3D rdma_get_y_pitch(cfg->fmt, cfg->sour=
ce_width);

This is got from mtk_plane_atomic_update().

> +       unsigned int h_shift_uv =3D rdma_get_horizontal_shift_uv(cfg->fmt=
);
> +       unsigned int v_shift_uv =3D rdma_get_vertical_shift_uv(cfg->fmt);
> +       unsigned int bpp_uv =3D rdma_get_bits_per_pixel_uv(cfg->fmt);
> +       unsigned int block_h =3D rdma_get_block_h(cfg->block_size);

block_h =3D 0;

> +       unsigned int bpp_y =3D rdma_get_bits_per_pixel_y(cfg->fmt);

drm_format_info().

> +       unsigned int y_start_line =3D 0;
> +       unsigned int offset_y =3D 0;
> +       unsigned int offset_u =3D 0;
> +       unsigned int offset_v =3D 0;
> +
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_UNIFORM_CONFIG, 1),
> +                          cmdq_base, base, MDP_RDMA_SRC_CON,
> +                          REG_FLD_MASK(FLD_UNIFORM_CONFIG));
> +       mtk_ddp_write_mask(cmdq_pkt, rdma_fmt_convert(cfg->fmt), cmdq_bas=
e,
> +                          base, MDP_RDMA_SRC_CON, REG_FLD_MASK(FLD_SWAP)=
 |
> +                          REG_FLD_MASK(FLD_SRC_FORMAT) |
> +                          REG_FLD_MASK(FLD_BIT_NUMBER));
> +
> +       if (!cfg->csc_enable && with_alpha(cfg->fmt))
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_ARGB,=
 1),
> +                                  cmdq_base, base, MDP_RDMA_SRC_CON,
> +                                  REG_FLD_MASK(FLD_OUTPUT_ARGB));
> +       else
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_ARGB,=
 0),
> +                                  cmdq_base, base, MDP_RDMA_SRC_CON,
> +                                  REG_FLD_MASK(FLD_OUTPUT_ARGB));
> +
> +       mtk_ddp_write_mask(cmdq_pkt, cfg->addr0, cmdq_base, base,
> +                          MDP_RDMA_SRC_BASE_0, REG_FLD_MASK(FLD_SRC_BASE=
_0));
> +       mtk_ddp_write_mask(cmdq_pkt, cfg->addr1, cmdq_base, base,
> +                          MDP_RDMA_SRC_BASE_1, REG_FLD_MASK(FLD_SRC_BASE=
_1));
> +       mtk_ddp_write_mask(cmdq_pkt, cfg->addr2, cmdq_base, base,
> +                          MDP_RDMA_SRC_BASE_2, REG_FLD_MASK(FLD_SRC_BASE=
_2));
> +
> +       mtk_ddp_write_mask(cmdq_pkt, src_pitch_y, cmdq_base, base,
> +                          MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
> +                          REG_FLD_MASK(FLD_MF_BKGD_WB));
> +       mtk_ddp_write_mask(cmdq_pkt, src_pitch_uv, cmdq_base, base,
> +                          MDP_RDMA_SF_BKGD_SIZE_IN_BYTE,
> +                          REG_FLD_MASK(FLD_SF_BKGD_WB));
> +
> +       if (cfg->encode_type =3D=3D RDMA_ENCODE_AFBC) {

Never be here, so remove.

> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_BKGD_WP, =
cfg->source_width),
> +                                  cmdq_base, base, MDP_RDMA_MF_BKGD_SIZE=
_IN_PIXEL,
> +                                  REG_FLD_MASK(FLD_MF_BKGD_WP));
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_BKGD_HP, cfg=
->height),
> +                                  cmdq_base, base, MDP_RDMA_MF_BKGD_H_SI=
ZE_IN_PIXEL,
> +                                  REG_FLD_MASK(FLD_BKGD_HP));
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_YUV_TRA=
NSFORM, 1),
> +                                  cmdq_base, base, MDP_RDMA_COMP_CON,
> +                                  REG_FLD_MASK(FLD_AFBC_YUV_TRANSFORM));
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_UFBDC_EN, 1)=
, cmdq_base,
> +                                  base, MDP_RDMA_COMP_CON, REG_FLD_MASK(=
FLD_UFBDC_EN));
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_EN, 1),=
 cmdq_base,
> +                                  base, MDP_RDMA_COMP_CON, REG_FLD_MASK(=
FLD_AFBC_EN));
> +       } else {
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_YUV_TRA=
NSFORM, 0),
> +                                  cmdq_base, base, MDP_RDMA_COMP_CON,
> +                                  REG_FLD_MASK(FLD_AFBC_YUV_TRANSFORM));
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_UFBDC_EN, 0)=
, cmdq_base,
> +                                  base, MDP_RDMA_COMP_CON, REG_FLD_MASK(=
FLD_UFBDC_EN));
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_AFBC_EN, 0),=
 cmdq_base,
> +                                  base, MDP_RDMA_COMP_CON, REG_FLD_MASK(=
FLD_AFBC_EN));
> +       }
> +
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_OUTPUT_10B, 1), cmdq=
_base,
> +                          base, MDP_RDMA_CON, REG_FLD_MASK(FLD_OUTPUT_10=
B));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SIMPLE_MODE, 1), cmd=
q_base,
> +                          base, MDP_RDMA_CON, REG_FLD_MASK(FLD_SIMPLE_MO=
DE));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_TRANS_EN, cfg->csc_e=
nable),
> +                          cmdq_base, base, MDP_RDMA_TRANSFORM_0,
> +                          REG_FLD_MASK(FLD_TRANS_EN));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_INT_MATRIX_SEL, cfg-=
>profile),
> +                          cmdq_base, base, MDP_RDMA_TRANSFORM_0,
> +                          REG_FLD_MASK(FLD_INT_MATRIX_SEL));
> +
> +       if (cfg->block_size =3D=3D RDMA_BLOCK_NONE) {
> +               y_start_line =3D cfg->y_top;
> +
> +               offset_y  =3D (cfg->x_left * bpp_y >> 3) + y_start_line *=
 src_pitch_y;
> +               offset_u  =3D ((cfg->x_left >> h_shift_uv) * bpp_uv >> 3)=
 +
> +                           (y_start_line >> v_shift_uv) * src_pitch_uv;
> +               offset_v  =3D ((cfg->x_left >> h_shift_uv) * bpp_uv >> 3)=
 +
> +                           (y_start_line >> v_shift_uv) * src_pitch_uv;
> +       } else {

Never be here, so remove.

> +               offset_y =3D (cfg->x_left * block_h * bpp_y >> 3) +
> +                          (cfg->y_top) * src_pitch_y;
> +               offset_u =3D ((cfg->x_left >> h_shift_uv) * (block_h >> v=
_shift_uv) *
> +                          bpp_uv >> 3) + (cfg->y_top) * src_pitch_uv;
> +               offset_v =3D ((cfg->x_left >> h_shift_uv) * (block_h >> v=
_shift_uv) *
> +                          bpp_uv >> 3) + (cfg->y_top) * src_pitch_uv;
> +       }
> +
> +       if (cfg->encode_type =3D=3D RDMA_ENCODE_AFBC) {

Never be here, so remove.

> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_W=
P, cfg->x_left),
> +                                  cmdq_base, base, MDP_RDMA_SRC_OFFSET_W=
P,
> +                                  REG_FLD_MASK(FLD_SRC_OFFSET_WP));
> +
> +               mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_H=
P, cfg->y_top),
> +                                  cmdq_base, base, MDP_RDMA_SRC_OFFSET_H=
P,
> +                                  REG_FLD_MASK(FLD_SRC_OFFSET_HP));
> +       }
> +
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_0, offset=
_y),
> +                          cmdq_base, base, MDP_RDMA_SRC_OFFSET_0,
> +                          REG_FLD_MASK(FLD_SRC_OFFSET_0));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_1, offset=
_u),
> +                          cmdq_base, base, MDP_RDMA_SRC_OFFSET_1,
> +                          REG_FLD_MASK(FLD_SRC_OFFSET_1));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_SRC_OFFSET_2, offset=
_v),
> +                          cmdq_base, base, MDP_RDMA_SRC_OFFSET_2,
> +                          REG_FLD_MASK(FLD_SRC_OFFSET_2));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_SRC_W, cfg->width=
),
> +                          cmdq_base, base, MDP_RDMA_MF_SRC_SIZE,
> +                          REG_FLD_MASK(FLD_MF_SRC_W));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_SRC_H, cfg->heigh=
t),
> +                          cmdq_base, base, MDP_RDMA_MF_SRC_SIZE,
> +                          REG_FLD_MASK(FLD_MF_SRC_H));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_CLIP_W, cfg->widt=
h),
> +                          cmdq_base, base, MDP_RDMA_MF_CLIP_SIZE,
> +                          REG_FLD_MASK(FLD_MF_CLIP_W));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_CLIP_H, cfg->heig=
ht),
> +                          cmdq_base, base, MDP_RDMA_MF_CLIP_SIZE,
> +                          REG_FLD_MASK(FLD_MF_CLIP_H));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_OFFSET_W_1, 0),
> +                          cmdq_base, base, MDP_RDMA_MF_OFFSET_1,
> +                          REG_FLD_MASK(FLD_MF_OFFSET_W_1));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_MF_OFFSET_H_1, 0),
> +                          cmdq_base, base, MDP_RDMA_MF_OFFSET_1,
> +                          REG_FLD_MASK(FLD_MF_OFFSET_H_1));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_LINE_THRESHOLD, cfg-=
>height),
> +                          cmdq_base, base, MDP_RDMA_TARGET_LINE,
> +                          REG_FLD_MASK(FLD_LINE_THRESHOLD));
> +       mtk_ddp_write_mask(cmdq_pkt, REG_FLD_VAL(FLD_TARGET_LINE_EN, 1),
> +                          cmdq_base, base, MDP_RDMA_TARGET_LINE,
> +                          REG_FLD_MASK(FLD_TARGET_LINE_EN));
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h b/drivers/gpu/drm/me=
diatek/mtk_mdp_rdma.h
> new file mode 100644
> index 000000000000..c16bfb716610
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_MDP_RDMA_H__
> +#define __MTK_MDP_RDMA_H__
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
> +enum rdma_profile {
> +       RDMA_CSC_RGB_TO_JPEG =3D 0,
> +       RDMA_CSC_RGB_TO_FULL709 =3D 1,
> +       RDMA_CSC_RGB_TO_BT601 =3D 2,
> +       RDMA_CSC_RGB_TO_BT709 =3D 3,
> +       RDMA_CSC_JPEG_TO_RGB =3D 4,
> +       RDMA_CSC_FULL709_TO_RGB =3D 5,
> +       RDMA_CSC_BT601_TO_RGB =3D 6,
> +       RDMA_CSC_BT709_TO_RGB =3D 7,
> +       RDMA_CSC_JPEG_TO_BT601 =3D 8,
> +       RDMA_CSC_JPEG_TO_BT709 =3D 9,
> +       RDMA_CSC_BT601_TO_JPEG =3D 10,
> +       RDMA_CSC_BT709_TO_BT601 =3D 11,
> +       RDMA_CSC_BT601_TO_BT709 =3D 12
> +};
> +
> +enum rdma_encode {
> +       RDMA_ENCODE_NONE =3D 0,
> +       RDMA_ENCODE_AFBC =3D 1,
> +       RDMA_ENCODE_HYFBC =3D 2,
> +       RDMA_ENCODE_UFO_DCP =3D 3
> +};
> +
> +enum rdma_block {
> +       RDMA_BLOCK_NONE =3D 0,
> +       RDMA_BLOCK_8x8 =3D 1,
> +       RDMA_BLOCK_8x16 =3D 2,
> +       RDMA_BLOCK_8x32 =3D 3,
> +       RDMA_BLOCK_16x8 =3D 4,
> +       RDMA_BLOCK_16x16 =3D 5,
> +       RDMA_BLOCK_16x32 =3D 6,
> +       RDMA_BLOCK_32x8 =3D 7,
> +       RDMA_BLOCK_32x16 =3D 8,
> +       RDMA_BLOCK_32x32 =3D 9
> +};
> +
> +struct mtk_mdp_rdma_cfg {
> +       enum rdma_encode encode_type;
> +       enum rdma_block block_size;
> +       enum rdma_profile profile;
> +       unsigned int source_width;
> +       unsigned int addr0;
> +       unsigned int addr1;
> +       unsigned int addr2;
> +       unsigned int width;
> +       unsigned int height;
> +       unsigned int x_left;
> +       unsigned int y_top;
> +       bool csc_enable;
> +       int fmt;
> +};
> +
> +struct mtk_mdp_rdma_fifo {
> +       int read_request_type;
> +       int command_div;
> +       int ext_preutra_en;
> +       int ultra_en;
> +       int pre_ultra_en;
> +       int ext_ultra_en;
> +       int extrd_arb_max_0;
> +       int buf_resv_size_0;
> +       int issue_req_th_0;
> +       int ultra_h_con_0;
> +       int ultra_l_con_0;
> +};

Move rdma internal definition in .c file.

> +
> +void mtk_mdp_rdma_start(void __iomem *base,
> +                       struct cmdq_pkt *cmdq_pkt,
> +                       struct cmdq_client_reg *cmdq_base);
> +
> +void mtk_mdp_rdma_stop(void __iomem *base,
> +                      struct cmdq_pkt *cmdq_pkt,
> +                      struct cmdq_client_reg *cmdq_base);
> +
> +void mtk_mdp_rdma_fifo_config(void __iomem *base,
> +                             struct cmdq_pkt *cmdq_pkt,
> +                             struct cmdq_client_reg *cmdq_base,
> +                             const struct mtk_mdp_rdma_fifo *fifo);
> +
> +void mtk_mdp_rdma_config(void __iomem *base,
> +                        struct mtk_mdp_rdma_cfg *cfg,
> +                        struct cmdq_pkt *cmdq_pkt,
> +                        struct cmdq_client_reg *cmdq_base);

Move these prototype to mtk_disp_drv.h

> +
> +#endif // __MTK_MDP_RDMA_H__
> +
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h b/drivers/gpu/dr=
m/mediatek/mtk_mdp_reg_rdma.h
> new file mode 100644
> index 000000000000..08abd9f39bd8
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h
> @@ -0,0 +1,160 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __MDP_RDMA_REGS_H__
> +#define __MDP_RDMA_REGS_H__
> +
> +#define REG_FLD(width, shift) \
> +       ((unsigned int)((((width) & 0xff) << 16) | ((shift) & 0xff)))
> +
> +#define REG_FLD_WIDTH(field) ((unsigned int)(((field) >> 16) & 0xff))
> +
> +#define REG_FLD_SHIFT(field) ((unsigned int)((field) & 0xff))
> +
> +#define REG_FLD_MASK(field) \
> +       ((unsigned int)((1ULL << REG_FLD_WIDTH(field)) - 1) \
> +        << REG_FLD_SHIFT(field))
> +
> +#define REG_FLD_VAL(field, val) \
> +       (((val) << REG_FLD_SHIFT(field)) & REG_FLD_MASK(field))
> +
> +#define MDP_RDMA_EN                                            0x000
> +#define FLD_ROT_ENABLE                            REG_FLD(1, 0)
> +
> +#define MDP_RDMA_RESET                                         0x008
> +
> +#define MDP_RDMA_INTERRUPT_ENABLE                              0x010
> +#define FLD_UNDERRUN_INT_EN                       REG_FLD(1, 2)
> +#define FLD_REG_UPDATE_INT_EN                     REG_FLD(1, 1)
> +#define FLD_FRAME_COMPLETE_INT_EN                 REG_FLD(1, 0)
> +
> +#define MDP_RDMA_INTERRUPT_STATUS                              0x018
> +
> +#define MDP_RDMA_CON                                           0x020
> +#define FLD_OUTPUT_10B                            REG_FLD(1, 5)
> +#define FLD_SIMPLE_MODE                           REG_FLD(1, 4)
> +
> +#define MDP_RDMA_GMCIF_CON                                     0x028
> +#define FLD_EXT_ULTRA_EN                          REG_FLD(1, 18)
> +#define PRE_ULTRA_EN                              REG_FLD(2, 16)
> +#define FLD_ULTRA_EN                              REG_FLD(2, 12)
> +#define FLD_RD_REQ_TYPE                           REG_FLD(4, 4)
> +#define FLD_EXT_PREULTRA_EN                       REG_FLD(1, 3)
> +#define FLD_COMMAND_DIV                           REG_FLD(1, 0)
> +
> +#define MDP_RDMA_SRC_CON                                       0x030
> +#define FLD_OUTPUT_ARGB                           REG_FLD(1, 25)
> +#define FLD_BIT_NUMBER                            REG_FLD(2, 18)
> +#define FLD_UNIFORM_CONFIG                        REG_FLD(1, 17)
> +#define FLD_SWAP                                  REG_FLD(1, 14)
> +#define FLD_SRC_FORMAT                            REG_FLD(4, 0)
> +
> +#define MDP_RDMA_COMP_CON                                      0x038
> +#define FLD_AFBC_EN                               REG_FLD(1, 22)
> +#define FLD_AFBC_YUV_TRANSFORM                    REG_FLD(1, 21)
> +#define FLD_UFBDC_EN                              REG_FLD(1, 12)
> +
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE                          0x060
> +#define FLD_MF_BKGD_WB                            REG_FLD(23, 0)
> +
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_PIXEL                         0x068
> +#define FLD_MF_BKGD_WP                            REG_FLD(23, 0)
> +
> +#define MDP_RDMA_MF_SRC_SIZE                                   0x070
> +#define FLD_MF_SRC_H                              REG_FLD(15, 16)
> +#define FLD_MF_SRC_W                              REG_FLD(15, 0)
> +
> +#define MDP_RDMA_MF_CLIP_SIZE                                  0x078
> +#define FLD_MF_CLIP_H                             REG_FLD(15, 16)
> +#define FLD_MF_CLIP_W                             REG_FLD(15, 0)
> +
> +#define MDP_RDMA_MF_OFFSET_1                                   0x080
> +#define FLD_MF_OFFSET_H_1                         REG_FLD(6, 16)
> +#define FLD_MF_OFFSET_W_1                         REG_FLD(5, 0)
> +
> +#define MDP_RDMA_SF_BKGD_SIZE_IN_BYTE                          0x090
> +#define FLD_SF_BKGD_WB                            REG_FLD(23, 0)
> +
> +#define MDP_RDMA_MF_BKGD_H_SIZE_IN_PIXEL                       0x098
> +#define FLD_BKGD_HP                               REG_FLD(23, 0)
> +
> +#define MDP_RDMA_TARGET_LINE                                   0x0a0
> +#define FLD_LINE_THRESHOLD                        REG_FLD(15, 17)
> +#define FLD_TARGET_LINE_EN                        REG_FLD(1, 16)
> +
> +#define MDP_RDMA_SRC_OFFSET_0                                  0x118
> +#define FLD_SRC_OFFSET_0                          REG_FLD(32, 0)
> +
> +#define MDP_RDMA_SRC_OFFSET_1                                  0x120
> +#define FLD_SRC_OFFSET_1                          REG_FLD(32, 0)
> +
> +#define MDP_RDMA_SRC_OFFSET_2                                  0x128
> +#define FLD_SRC_OFFSET_2                          REG_FLD(32, 0)
> +
> +#define MDP_RDMA_SRC_OFFSET_WP                                 0x148
> +#define FLD_SRC_OFFSET_WP                         REG_FLD(32, 0)
> +
> +#define MDP_RDMA_SRC_OFFSET_HP                                 0x150
> +#define FLD_SRC_OFFSET_HP                         REG_FLD(32, 0)
> +
> +#define MDP_RDMA_TRANSFORM_0                                   0x200
> +#define FLD_INT_MATRIX_SEL                        REG_FLD(5, 23)
> +#define FLD_TRANS_EN                              REG_FLD(1, 16)
> +
> +#define MDP_RDMA_DMA_CON_0                                     0x240
> +#define FLD_EXTRD_ARB_MAX                         REG_FLD(4, 24)
> +#define FLD_BUF_RESV_SIZE                         REG_FLD(8, 16)
> +#define FLD_ISSUE_REQ_TH                          REG_FLD(8, 0)
> +
> +#define MDP_RDMA_UTRA_H_CON_0                                  0x248
> +#define FLD_PREUTRA_H_OFS_0                       REG_FLD(10, 10)
> +
> +#define MDP_RDMA_UTRA_L_CON_0                                  0x250
> +#define FLD_PREUTRA_L_OFS_0                       REG_FLD(10, 10)
> +
> +#define MDP_RDMA_DMABUF_CON_1                                  0x258
> +#define FLD_EXTRD_ARB_MAX_1                       REG_FLD(4, 24)
> +#define FLD_BUF_RESV_SIZE_1                       REG_FLD(7, 16)
> +#define FLD_ISSUE_REQ_TH_1                        REG_FLD(7, 0)
> +
> +#define MDP_RDMA_ULTRA_TH_HIGH_CON_1                           0x260
> +#define FLD_PRE_ULTRA_TH_HIGH_OFS_1               REG_FLD(10, 10)
> +
> +#define MDP_RDMA_ULTRA_TH_LOW_CON_1                            0x268
> +#define FLD_PRE_ULTRA_TH_LOW_OFS_1                REG_FLD(10, 10)
> +
> +#define MDP_RDMA_DMABUF_CON_2                                  0x270
> +#define FLD_EXTRD_ARB_MAX_2                       REG_FLD(4, 24)
> +#define FLD_BUF_RESV_SIZE_2                       REG_FLD(6, 16)
> +#define FLD_ISSUE_REQ_TH_2                        REG_FLD(6, 0)
> +
> +#define MDP_RDMA_UTRA_H_CON_2                                  0x278
> +#define FLD_PRE_ULTRA_TH_HIGH_OFS_2               REG_FLD(10, 10)
> +
> +#define MDP_RDMA_ULTRA_TH_LOW_CON_2                            0x280
> +#define FLD_PRE_ULTRA_TH_LOW_OFS_2                REG_FLD(10, 10)
> +
> +#define MDP_RDMA_DMABUF_CON_3                                  0x288
> +#define FLD_EXTRD_ARB_MAX_3                       REG_FLD(4, 24)
> +#define FLD_BUF_RESV_SIZE_3                       REG_FLD(6, 16)
> +#define FLD_ISSUE_REQ_TH_3                        REG_FLD(6, 0)
> +
> +#define MDP_RDMA_UTRA_H_CON_3                                  0x290
> +#define FLD_PRE_ULTRA_TH_HIGH_OFS_3               REG_FLD(10, 10)
> +
> +#define MDP_RDMA_ULTRA_TH_LOW_CON_3                            0x298
> +#define FLD_PRE_ULTRA_TH_LOW_OFS_3                REG_FLD(10, 10)
> +
> +#define MDP_RDMA_SRC_BASE_0                                    0xf00
> +#define FLD_SRC_BASE_0                            REG_FLD(32, 0)
> +
> +#define MDP_RDMA_SRC_BASE_1                                    0xf08
> +#define FLD_SRC_BASE_1                            REG_FLD(32, 0)
> +
> +#define MDP_RDMA_SRC_BASE_2                                    0xf10
> +#define FLD_SRC_BASE_2                            REG_FLD(32, 0)
> +
> +#endif /* __MDP_RDMA_REGS_H__ */

Only one file need these, so move register definiton in .c file.

Regards,
Chun-Kuang.

> +
> --
> 2.18.0
>

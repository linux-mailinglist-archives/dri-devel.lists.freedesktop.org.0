Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0048445D04
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 01:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6B73BA0;
	Fri,  5 Nov 2021 00:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE5B73BA0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 00:29:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE4766121E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636072181;
 bh=CvjcQ7XK7i6yh2o1K7eyu7uvRHKzuTx/XidgDTgoEUw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MwNBezLzsst9bHspGhzMV+B2+j+NiYHTstSs8InX7sAybcWLXMTXz2+7fDD4HCYlk
 e8fV+Noe5hzbI/iwfkeLV8R+AQw2lHo9AdEWYy6GNFQzhQR0jg7pHHcD2KyolxUgdn
 lw81uw9tB7S24ZzcTcMn/04/woDHA6WXmtS23B10uMwY3ZBnI1azDuTSKIeKKjERQ9
 H6rcOLZvrlQJmb9scOZ5VGkMzYL77hhPToBBHmyAX4/cTISMYi6ddpfP510UK+gaLz
 xZVXiQrA0pIgwdGGOrfPDGIelsw4vqpjtGhnn/aEYmpxvSDkBFKj5QsqcjDtU15YgB
 r/jKsRfhKsIag==
Received: by mail-ed1-f49.google.com with SMTP id r12so27258708edt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 17:29:41 -0700 (PDT)
X-Gm-Message-State: AOAM530G+r7PjlmtUBQRKb6uNo8lgPq4T6fcFh7+xWEamZSHKXT2aw/B
 F01vWRR6ErInww61BWyxurmeKSHXtA1GV72llQ==
X-Google-Smtp-Source: ABdhPJz66rY3E5aI+LA/+bLz0cgAc4Xn9Kq5/YKeKBeiWVwRPHR9ewBgK1GcNo7W2Fp0KzSw4CIxx763QRSC7VnUYbg=
X-Received: by 2002:a05:6402:128a:: with SMTP id
 w10mr65106879edv.272.1636072180185; 
 Thu, 04 Nov 2021 17:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-19-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-19-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 5 Nov 2021 08:29:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ojDoZdxnibGTYRgKYZeHS6+jUbWK7bBFLKwrt7AUkig@mail.gmail.com>
Message-ID: <CAAOTY_8ojDoZdxnibGTYRgKYZeHS6+jUbWK7bBFLKwrt7AUkig@mail.gmail.com>
Subject: Re: [PATCH v7 18/20] drm/mediatek: add ovl_adaptor support for MT8195
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
> Add ovl_adaptor driver for MT8195.
> Ovl_adaptor is an encapsulated module and designed for simplified
> DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
> an ETHDR. Two RDMAs merge into one layer, so this module support 4
> layers.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile             |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  16 +
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 436 ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
>  4 files changed, 454 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index fb158a1e7f06..3abd27d7c91d 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -6,6 +6,7 @@ mediatek-drm-y :=3D mtk_disp_aal.o \
>                   mtk_disp_gamma.o \
>                   mtk_disp_merge.o \
>                   mtk_disp_ovl.o \
> +                 mtk_disp_ovl_adaptor.o \
>                   mtk_disp_rdma.o \
>                   mtk_drm_crtc.o \
>                   mtk_drm_ddp_comp.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 224a710bb537..cd9827402626 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -112,6 +112,22 @@ void mtk_rdma_enable_vblank(struct device *dev,
>                             void *vblank_cb_data);
>  void mtk_rdma_disable_vblank(struct device *dev);
>
> +int mtk_ovl_adaptor_clk_enable(struct device *dev);
> +void mtk_ovl_adaptor_clk_disable(struct device *dev);
> +void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
> +                           unsigned int h, unsigned int vrefresh,
> +                           unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
> +                                 struct mtk_plane_state *state,
> +                                 struct cmdq_pkt *cmdq_pkt);
> +void mtk_ovl_adaptor_enable_vblank(struct device *dev,
> +                                  void (*vblank_cb)(void *),
> +                                  void *vblank_cb_data);
> +void mtk_ovl_adaptor_disable_vblank(struct device *dev);
> +void mtk_ovl_adaptor_start(struct device *dev);
> +void mtk_ovl_adaptor_stop(struct device *dev);
> +unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
> +
>  int mtk_mdp_rdma_clk_enable(struct device *dev);
>  void mtk_mdp_rdma_clk_disable(struct device *dev);
>  void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gp=
u/drm/mediatek/mtk_disp_ovl_adaptor.c
> new file mode 100644
> index 000000000000..148322597fa8
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_of.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_disp_drv.h"
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_ethdr.h"
> +
> +#define MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH 1920
> +#define MTK_OVL_ADAPTOR_LAYER_NUM 4
> +
> +enum mtk_ovl_adaptor_comp_type {
> +       OVL_ADAPTOR_TYPE_RDMA =3D 0,
> +       OVL_ADAPTOR_TYPE_MERGE,
> +       OVL_ADAPTOR_TYPE_ETHDR,
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
> +       OVL_ADAPTOR_ETHDR0,
> +       OVL_ADAPTOR_ID_MAX
> +};
> +
> +struct ovl_adaptor_comp_match {
> +       enum mtk_ovl_adaptor_comp_type type;
> +       int alias_id;
> +};
> +
> +struct mtk_disp_ovl_adaptor {
> +       struct device *ovl_adaptor_comp[OVL_ADAPTOR_ID_MAX];
> +       struct device *mmsys_dev;
> +};
> +
> +static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] =3D {
> +       [OVL_ADAPTOR_TYPE_RDMA]         =3D "vdo1_rdma",
> +       [OVL_ADAPTOR_TYPE_MERGE]        =3D "merge",
> +       [OVL_ADAPTOR_TYPE_ETHDR]        =3D "ethdr",
> +};
> +
> +static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_M=
AX] =3D {
> +       [OVL_ADAPTOR_MDP_RDMA0] =3D { OVL_ADAPTOR_TYPE_RDMA, 0 },
> +       [OVL_ADAPTOR_MDP_RDMA1] =3D { OVL_ADAPTOR_TYPE_RDMA, 1 },
> +       [OVL_ADAPTOR_MDP_RDMA2] =3D { OVL_ADAPTOR_TYPE_RDMA, 2 },
> +       [OVL_ADAPTOR_MDP_RDMA3] =3D { OVL_ADAPTOR_TYPE_RDMA, 3 },
> +       [OVL_ADAPTOR_MDP_RDMA4] =3D { OVL_ADAPTOR_TYPE_RDMA, 4 },
> +       [OVL_ADAPTOR_MDP_RDMA5] =3D { OVL_ADAPTOR_TYPE_RDMA, 5 },
> +       [OVL_ADAPTOR_MDP_RDMA6] =3D { OVL_ADAPTOR_TYPE_RDMA, 6 },
> +       [OVL_ADAPTOR_MDP_RDMA7] =3D { OVL_ADAPTOR_TYPE_RDMA, 7 },
> +       [OVL_ADAPTOR_MERGE0]    =3D { OVL_ADAPTOR_TYPE_MERGE, 1 },
> +       [OVL_ADAPTOR_MERGE1]    =3D { OVL_ADAPTOR_TYPE_MERGE, 2 },
> +       [OVL_ADAPTOR_MERGE2]    =3D { OVL_ADAPTOR_TYPE_MERGE, 3 },
> +       [OVL_ADAPTOR_MERGE3]    =3D { OVL_ADAPTOR_TYPE_MERGE, 4 },
> +       [OVL_ADAPTOR_ETHDR0]    =3D { OVL_ADAPTOR_TYPE_ETHDR, 0 },
> +};
> +
> +void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
> +                                 struct mtk_plane_state *state,
> +                                 struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       struct mtk_plane_pending_state *pending =3D &state->pending;
> +       struct mtk_mdp_rdma_cfg rdma_config =3D {0};
> +       struct device *rdma_l;
> +       struct device *rdma_r;
> +       struct device *merge;
> +       struct device *ethdr;
> +       const struct drm_format_info *fmt_info =3D drm_format_info(pendin=
g->format);
> +       bool use_dual_pipe =3D false;
> +       unsigned int align_width;
> +       unsigned int l_w =3D 0;
> +       unsigned int r_w =3D 0;
> +
> +       dev_dbg(dev, "%s+ idx:%d, enable:%d, fmt:0x%x\n", __func__, idx,
> +               pending->enable, pending->format);
> +       dev_dbg(dev, "addr 0x%lx, fb w:%d, {%d,%d,%d,%d}\n",
> +               pending->addr, (pending->pitch / fmt_info->cpp[0]),
> +               pending->x, pending->y, pending->width, pending->height);
> +
> +       rdma_l =3D ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + =
2 * idx];
> +       rdma_r =3D ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + =
2 * idx + 1];
> +       merge =3D ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx]=
;
> +       ethdr =3D ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
> +
> +       if (!pending->enable) {
> +               mtk_merge_stop_cmdq(merge, cmdq_pkt);
> +               mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
> +               mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
> +               mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
> +               return;
> +       }
> +
> +       /* ETHDR is in 1T2P domain, width needs to be 2 pixels align */
> +       align_width =3D ALIGN_DOWN(pending->width, 2);
> +
> +       if (align_width > MTK_OVL_ADAPTOR_RDMA_MAX_WIDTH)
> +               use_dual_pipe =3D true;
> +
> +       if (use_dual_pipe) {
> +               l_w =3D (align_width / 2) + ((pending->width / 2) % 2);
> +               r_w =3D align_width - l_w;
> +       } else {
> +               l_w =3D align_width;
> +       }
> +       mtk_merge_advance_config(merge, l_w, r_w, pending->height, 0, 0, =
cmdq_pkt);
> +       mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_A=
SYNC_WIDTH,
> +                            idx, align_width / 2, cmdq_pkt);
> +       mtk_mmsys_ddp_config(ovl_adaptor->mmsys_dev, MMSYS_CONFIG_MERGE_A=
SYNC_HEIGHT,
> +                            idx, pending->height, cmdq_pkt);
> +
> +       rdma_config.width =3D l_w;
> +       rdma_config.height =3D pending->height;
> +       rdma_config.addr0 =3D pending->addr;
> +       rdma_config.pitch =3D pending->pitch;
> +       rdma_config.fmt =3D pending->format;
> +       rdma_config.color_encoding =3D pending->color_encoding;
> +       mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);
> +
> +       if (use_dual_pipe) {
> +               rdma_config.x_left =3D l_w;
> +               rdma_config.width =3D r_w;
> +               mtk_mdp_rdma_config(rdma_r, &rdma_config, cmdq_pkt);
> +       }
> +
> +       mtk_merge_start_cmdq(merge, cmdq_pkt);
> +
> +       mtk_mdp_rdma_start(rdma_l, cmdq_pkt);
> +       if (use_dual_pipe)
> +               mtk_mdp_rdma_start(rdma_r, cmdq_pkt);
> +       else
> +               mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
> +
> +       mtk_ethdr_layer_config(ethdr, idx, state, cmdq_pkt);
> +}
> +
> +void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
> +                           unsigned int h, unsigned int vrefresh,
> +                           unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +
> +       mtk_ethdr_config(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0=
], w, h,
> +                        vrefresh, bpc, cmdq_pkt);
> +}
> +
> +void mtk_ovl_adaptor_start(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +
> +       mtk_ethdr_start(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]=
);
> +}
> +
> +void mtk_ovl_adaptor_stop(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +
> +       mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0])=
;
> +}
> +
> +int mtk_ovl_adaptor_clk_enable(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       struct device *comp;
> +       int ret;
> +       int i;
> +
> +       for (i =3D 0; i < OVL_ADAPTOR_MERGE0; i++) {
> +               comp =3D ovl_adaptor->ovl_adaptor_comp[i];
> +               ret =3D pm_runtime_get_sync(comp);
> +               if (ret) {
> +                       dev_err(dev, "Failed to enable power domain %d, e=
rr %d\n", i, ret);
> +                       goto pwr_err;
> +               }
> +       }
> +
> +       for (i =3D 0; i < OVL_ADAPTOR_ID_MAX; i++) {
> +               comp =3D ovl_adaptor->ovl_adaptor_comp[i];
> +
> +               if (i < OVL_ADAPTOR_MERGE0)
> +                       ret =3D mtk_mdp_rdma_clk_enable(comp);
> +               else if (i < OVL_ADAPTOR_ETHDR0)
> +                       ret =3D mtk_merge_clk_enable(comp);
> +               else
> +                       ret =3D mtk_ethdr_clk_enable(comp);
> +               if (ret) {
> +                       dev_err(dev, "Failed to enable clock %d, err %d\n=
", i, ret);
> +                       goto clk_err;
> +               }
> +       }
> +
> +       return ret;
> +
> +clk_err:
> +       while (--i >=3D 0) {
> +               comp =3D ovl_adaptor->ovl_adaptor_comp[i];
> +               if (i < OVL_ADAPTOR_MERGE0)
> +                       mtk_mdp_rdma_clk_disable(comp);
> +               else if (i < OVL_ADAPTOR_ETHDR0)
> +                       mtk_merge_clk_disable(comp);
> +               else
> +                       mtk_ethdr_clk_disable(comp);
> +       }
> +       i =3D OVL_ADAPTOR_MDP_RDMA7;
> +
> +pwr_err:
> +       while (i-- >=3D 0)
> +               pm_runtime_put(ovl_adaptor->ovl_adaptor_comp[i]);
> +
> +       return ret;
> +}
> +
> +void mtk_ovl_adaptor_clk_disable(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       struct device *comp;
> +       int i;
> +
> +       for (i =3D 0; i < OVL_ADAPTOR_ID_MAX; i++) {
> +               comp =3D ovl_adaptor->ovl_adaptor_comp[i];
> +
> +               if (i < OVL_ADAPTOR_MERGE0) {
> +                       mtk_mdp_rdma_clk_disable(comp);
> +                       pm_runtime_put(comp);
> +               } else if (i < OVL_ADAPTOR_ETHDR0) {
> +                       mtk_merge_clk_disable(comp);
> +               } else {
> +                       mtk_ethdr_clk_disable(comp);
> +               }
> +       }
> +}
> +
> +unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev)
> +{
> +       return MTK_OVL_ADAPTOR_LAYER_NUM;
> +}
> +
> +void mtk_ovl_adaptor_enable_vblank(struct device *dev, void (*vblank_cb)=
(void *),
> +                                  void *vblank_cb_data)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +
> +       mtk_ethdr_enable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR=
_ETHDR0],
> +                               vblank_cb, vblank_cb_data);
> +}
> +
> +void mtk_ovl_adaptor_disable_vblank(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +
> +       mtk_ethdr_disable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTO=
R_ETHDR0]);
> +}
> +
> +static int ovl_adaptor_comp_get_id(struct device *dev, struct device_nod=
e *node,
> +                                  enum mtk_ovl_adaptor_comp_type type)
> +{
> +       int alias_id =3D of_alias_get_id(node, private_comp_stem[type]);
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
> +static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] =3D {
> +       {
> +               .compatible =3D "mediatek,mt8195-vdo1-rdma",
> +               .data =3D (void *)OVL_ADAPTOR_TYPE_RDMA,
> +       }, {
> +               .compatible =3D "mediatek,mt8195-disp-merge",
> +               .data =3D (void *)OVL_ADAPTOR_TYPE_MERGE,
> +       }, {
> +               .compatible =3D "mediatek,mt8195-disp-ethdr",
> +               .data =3D (void *)OVL_ADAPTOR_TYPE_ETHDR,
> +       },
> +       {},
> +};
> +
> +static int compare_of(struct device *dev, void *data)
> +{
> +       return dev->of_node =3D=3D data;
> +}
> +
> +static int ovl_adaptor_comp_init(struct device *dev, struct component_ma=
tch **match)
> +{
> +       struct mtk_disp_ovl_adaptor *priv =3D dev_get_drvdata(dev);
> +       struct device_node *node, *parent;
> +       struct platform_device *comp_pdev;
> +
> +       parent =3D dev->parent->parent->of_node->parent;
> +
> +       for_each_child_of_node(parent, node) {
> +               const struct of_device_id *of_id;
> +               enum mtk_ovl_adaptor_comp_type type;
> +               int id;
> +
> +               of_id =3D of_match_node(mtk_ovl_adaptor_comp_dt_ids, node=
);
> +               if (!of_id)
> +                       continue;
> +
> +               if (!of_device_is_available(node)) {
> +                       dev_dbg(dev, "Skipping disabled component %pOF\n"=
,
> +                               node);
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
> +               comp_pdev =3D of_find_device_by_node(node);
> +               if (!comp_pdev)
> +                       return -EPROBE_DEFER;
> +
> +               priv->ovl_adaptor_comp[id] =3D &comp_pdev->dev;
> +
> +               drm_of_component_match_add(dev, match, compare_of, node);
> +               dev_dbg(dev, "Adding component match for %pOF\n", node);
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_disp_ovl_adaptor_comp_bind(struct device *dev, struct dev=
ice *master,
> +                                         void *data)
> +{
> +       return 0;
> +}
> +
> +static void mtk_disp_ovl_adaptor_comp_unbind(struct device *dev, struct =
device *master,
> +                                            void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_disp_ovl_adaptor_comp_ops =3D {
> +       .bind   =3D mtk_disp_ovl_adaptor_comp_bind,
> +       .unbind =3D mtk_disp_ovl_adaptor_comp_unbind,
> +};
> +
> +static int mtk_disp_ovl_adaptor_master_bind(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *priv =3D dev_get_drvdata(dev);
> +
> +       component_bind_all(dev, priv->mmsys_dev);
> +       return 0;
> +}
> +
> +static void mtk_disp_ovl_adaptor_master_unbind(struct device *dev)
> +{
> +}
> +
> +static const struct component_master_ops mtk_disp_ovl_adaptor_master_ops=
 =3D {
> +       .bind           =3D mtk_disp_ovl_adaptor_master_bind,
> +       .unbind         =3D mtk_disp_ovl_adaptor_master_unbind,
> +};
> +
> +static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
> +{
> +       struct mtk_disp_ovl_adaptor *priv;
> +       struct device *dev =3D &pdev->dev;
> +       struct component_match *match =3D NULL;
> +       int ret;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       ret =3D ovl_adaptor_comp_init(dev, &match);
> +       if (ret < 0)
> +               return ret;
> +
> +       priv->mmsys_dev =3D pdev->dev.platform_data;
> +
> +       component_master_add_with_match(dev, &mtk_disp_ovl_adaptor_master=
_ops, match);
> +
> +       pm_runtime_enable(dev);
> +
> +       ret =3D component_add(dev, &mtk_disp_ovl_adaptor_comp_ops);
> +       if (ret !=3D 0) {
> +               pm_runtime_disable(dev);
> +               dev_err(dev, "Failed to add component: %d\n", ret);
> +       }
> +
> +       return ret;
> +}
> +
> +static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
> +{

component_master_del(). Except this

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>


> +       component_del(&pdev->dev, &mtk_disp_ovl_adaptor_comp_ops);
> +       pm_runtime_disable(&pdev->dev);
> +       return 0;
> +}
> +
> +struct platform_driver mtk_disp_ovl_adaptor_driver =3D {
> +       .probe          =3D mtk_disp_ovl_adaptor_probe,
> +       .remove         =3D mtk_disp_ovl_adaptor_remove,
> +       .driver         =3D {
> +               .name   =3D "mediatek-disp-ovl-adaptor",
> +               .owner  =3D THIS_MODULE,
> +       },
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.h
> index a58cebd01d35..1ad9f7edfcc7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -51,6 +51,7 @@ extern struct platform_driver mtk_disp_ccorr_driver;
>  extern struct platform_driver mtk_disp_color_driver;
>  extern struct platform_driver mtk_disp_gamma_driver;
>  extern struct platform_driver mtk_disp_merge_driver;
> +extern struct platform_driver mtk_disp_ovl_adaptor_driver;
>  extern struct platform_driver mtk_disp_ovl_driver;
>  extern struct platform_driver mtk_disp_rdma_driver;
>  extern struct platform_driver mtk_dpi_driver;
> --
> 2.18.0
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7049FE1A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 17:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A5310E48C;
	Fri, 28 Jan 2022 16:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6670E10E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:34:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C19FDB824EA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2CAC36AE3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643387671;
 bh=vKBJqy3HgSyoQ3Szu6K6a4NfdLf+ztljFywvbKYyDgg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cHj+EtmHQvt0dtQaFbWX4vq+C5Cv4L/AEIDvGjyxEz/pqmD2NVhCupOcsjEfXG8MA
 frmRpaigGKUUH6R7rntbgCkw3T7XQDp3zNK4vmFTDaeXHxchjicsMf5O3Et7Sk3ibv
 cInHQ3wlpVK2wrLxekxevlPickRXlJUmNkasKjFE3ZO3JqPkeQN4V5buTTnek7Yd8q
 j5poeCM9aClvFIqp20DqDa8GMLtddf9xwth/I939TS/cnAVuZYsLXkYU4tLwejvFSV
 RdNBNlECk+BZMW+VWoRIUB5IDd/IaJLqDj5GHWPk5zSyHNAHBzLqq5zTNGgvX/LOif
 U0YnKEKfh8fZA==
Received: by mail-ed1-f46.google.com with SMTP id w25so10058809edt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 08:34:31 -0800 (PST)
X-Gm-Message-State: AOAM531GgSCUTTMrVJT2H4dmlGHpDszs8W3+m8VWmEwPRugCb1ZWcn9C
 M6u0DEb3VliocpwOTj6eB1P9jE8XBTvX1UO5tw==
X-Google-Smtp-Source: ABdhPJwpSggw7SdLa1FbKIZONU5K+W023Jtjz05zG88sY8zQp5+Q0ssZTlDRL2c2nppnnyauteddq6HH5n7jFN6IIxg=
X-Received: by 2002:a05:6402:4401:: with SMTP id
 y1mr8955863eda.215.1643387669820; 
 Fri, 28 Jan 2022 08:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
 <20220128120718.30545-4-yongqiang.niu@mediatek.com>
In-Reply-To: <20220128120718.30545-4-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 29 Jan 2022 00:34:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-c8CoPpT=4E9iR0fDiWfg9my=B7Oz1r4Vro80uHaGszg@mail.gmail.com>
Message-ID: <CAAOTY_-c8CoPpT=4E9iR0fDiWfg9my=B7Oz1r4Vro80uHaGszg@mail.gmail.com>
Subject: Re: [PATCH v1, 3/4] drm/mediatek: split postmask component
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2022=E5=B9=B41=E6=9C=
=8828=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:07=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> add postmask private data for differnt soc support
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile            |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h      |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 155 +++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  |  30 +---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c       |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   1 +
>  6 files changed, 170 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 29098d7c8307..f26fe646ee2a 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -5,6 +5,7 @@ mediatek-drm-y :=3D mtk_disp_aal.o \
>                   mtk_disp_color.o \
>                   mtk_disp_gamma.o \
>                   mtk_disp_ovl.o \
> +                 mtk_disp_postmask.o \
>                   mtk_disp_rdma.o \
>                   mtk_drm_crtc.o \
>                   mtk_drm_ddp_comp.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 86c3068894b1..f4c21195c3ea 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -81,6 +81,14 @@ void mtk_ovl_enable_vblank(struct device *dev,
>                            void *vblank_cb_data);
>  void mtk_ovl_disable_vblank(struct device *dev);
>
> +int mtk_postmask_clk_enable(struct device *dev);
> +void mtk_postmask_clk_disable(struct device *dev);
> +void mtk_postmask_config(struct device *dev, unsigned int w,
> +                               unsigned int h, unsigned int vrefresh,
> +                               unsigned int bpc, struct cmdq_pkt *cmdq_p=
kt);
> +void mtk_postmask_start(struct device *dev);
> +void mtk_postmask_stop(struct device *dev);
> +
>  void mtk_rdma_bypass_shadow(struct device *dev);
>  int mtk_rdma_clk_enable(struct device *dev);
>  void mtk_rdma_clk_disable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_postmask.c b/drivers/gpu/d=
rm/mediatek/mtk_disp_postmask.c
> new file mode 100644
> index 000000000000..fc04b445c2ed
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.

2022

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_disp_drv.h"
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_POSTMASK_EN                       0x0000
> +#define POSTMASK_EN                                    BIT(0)
> +#define DISP_POSTMASK_CFG                      0x0020
> +#define POSTMASK_RELAY_MODE                            BIT(0)
> +#define DISP_POSTMASK_SIZE                     0x0030

I think you should 'move' these definition not 'copy' them, so
remember to remove them in mtk_drm_ddp_comp.c

Regards,
Chun-Kuang.

> +
> +struct mtk_disp_postmask_data {
> +       u32 reserved;
> +};
> +
> +/*
> + * struct mtk_disp_postmask - DISP_POSTMASK driver structure
> + */
> +struct mtk_disp_postmask {
> +       struct clk *clk;
> +       void __iomem *regs;
> +       struct cmdq_client_reg cmdq_reg;
> +       const struct mtk_disp_postmask_data *data;
> +};
> +

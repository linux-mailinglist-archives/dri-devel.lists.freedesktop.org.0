Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C863F2FCB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911A66EAA7;
	Fri, 20 Aug 2021 15:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE4E6EAA7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 15:43:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AECB061152
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629474194;
 bh=KUtRnL73K/9xrkHi7H1uCy+hezs+TnAMyJn8DRFGGFk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HI26+GBZTPG4lx8vIvyFk6wWVHIAdNZfJAcBXvbm3JRdQpFeXxkVEHX+q5TXe7/Q4
 syO6iaqSeJ2GfDX5MIAGvzqHfaYeuBc+fitZZzLZ6DqTXG0vb0GSGg5J88H2Zoazl1
 1qZ1UdTWIeSDp3FUDvIf5V1GCZtYwFejAHvcSw4PVGtvhVCBeddS00agJpmZ7I3B0z
 v8HsHlAOCTJMx7m5TQDrEgEUgIvnvcOSgvty2z50QW6zqA3TS8k7mcBUFOwmk0crn9
 vNdXgEUolAGhBwcuT9VZv6IBZdMuT+FWeEfu1xrpBeLlE2KoPPgh1iWx/ksklZ2iqa
 JLrUgoY6JkB0Q==
Received: by mail-ed1-f44.google.com with SMTP id g21so14602630edw.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 08:43:14 -0700 (PDT)
X-Gm-Message-State: AOAM532bxxzikpooeu8AyPcB5Ew/zMGBI0/7XoWMMmLRM6TeYCAo3htK
 jtOvdS0ot+ePdBDXtjtQSmP2iy2nJL3W2gQIIQ==
X-Google-Smtp-Source: ABdhPJx/liJcPr64dlq4NzL8S8iTfHyVg04A/MmFQW6DsB6dGldfaC1PigGp/oa3UmnZwXpfnGYPUZTGFl4ZbQT7xrQ=
X-Received: by 2002:aa7:c548:: with SMTP id s8mr23853936edr.162.1629474193192; 
 Fri, 20 Aug 2021 08:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-13-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-13-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 20 Aug 2021 23:43:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9+2CvcSxZByqxVM18hLQfE0rt5zf2JLxCYrd8O1_UCAg@mail.gmail.com>
Message-ID: <CAAOTY_9+2CvcSxZByqxVM18hLQfE0rt5zf2JLxCYrd8O1_UCAg@mail.gmail.com>
Subject: Re: [PATCH v8 12/13] drm/mediatek: add MERGE support for mediatek-drm
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 singo.chang@mediatek.com, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=881=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add MERGE engine file:
> MERGE module is used to merge two slice-per-line inputs
> into one side-by-side output.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 268 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  16 ++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  7 files changed, 297 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index dc54a7a69005..538e0087a44c 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -3,6 +3,7 @@
>  mediatek-drm-y :=3D mtk_disp_ccorr.o \
>                   mtk_disp_color.o \
>                   mtk_disp_gamma.o \
> +                 mtk_disp_merge.o \
>                   mtk_disp_ovl.o \
>                   mtk_disp_rdma.o \
>                   mtk_drm_crtc.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index cafd9df2d63b..f407cd9d873e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -46,6 +46,14 @@ void mtk_gamma_set_common(void __iomem *regs, struct d=
rm_crtc_state *state);
>  void mtk_gamma_start(struct device *dev);
>  void mtk_gamma_stop(struct device *dev);
>
> +int mtk_merge_clk_enable(struct device *dev);
> +void mtk_merge_clk_disable(struct device *dev);
> +void mtk_merge_config(struct device *dev, unsigned int width,
> +                     unsigned int height, unsigned int vrefresh,
> +                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_start(struct device *dev);
> +void mtk_merge_stop(struct device *dev);
> +
>  void mtk_ovl_bgclr_in_on(struct device *dev);
>  void mtk_ovl_bgclr_in_off(struct device *dev);
>  void mtk_ovl_bypass_shadow(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> new file mode 100644
> index 000000000000..ebcb646bde9c
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_disp_drv.h"
> +
> +#define DISP_REG_MERGE_CTRL            0x000
> +#define MERGE_EN                               1
> +#define DISP_REG_MERGE_CFG_0           0x010
> +#define DISP_REG_MERGE_CFG_4           0x020
> +#define DISP_REG_MERGE_CFG_10          0x038
> +/* no swap */
> +#define SWAP_MODE                              0
> +#define FLD_SWAP_MODE                          GENMASK(4, 0)
> +#define DISP_REG_MERGE_CFG_12          0x040
> +#define CFG_10_10_1PI_2PO_BUF_MODE             6
> +#define CFG_10_10_2PI_2PO_BUF_MODE             8
> +#define FLD_CFG_MERGE_MODE                     GENMASK(4, 0)
> +#define DISP_REG_MERGE_CFG_24          0x070
> +#define DISP_REG_MERGE_CFG_25          0x074
> +#define DISP_REG_MERGE_CFG_36          0x0a0
> +#define ULTRA_EN                               1

You could use FLD_ULTRA_EN for this.

> +#define PREULTRA_EN                            1
> +#define HALT_FOR_DVFS_EN                       0

You could just not set this.

> +#define FLD_ULTRA_EN                           GENMASK(0, 0)

#define FLD_ULTRA_EN BIT(0)

Regards,
Chun-Kuang.

> +#define FLD_PREULTRA_EN                                GENMASK(4, 4)
> +#define FLD_HALT_FOR_DVFS_EN                   GENMASK(8, 8)
> +#define DISP_REG_MERGE_CFG_37          0x0a4
> +/* 0: Off, 1: SRAM0, 2: SRAM1, 3: SRAM0 + SRAM1 */
> +#define BUFFER_MODE                            3
> +#define FLD_BUFFER_MODE                                GENMASK(1, 0)
> +#define DISP_REG_MERGE_CFG_38                  0x0a8
> +#define FLD_VDE_BLOCK_ULTRA                    GENMASK(0, 0)
> +#define FLD_VALID_TH_BLOCK_ULTRA               GENMASK(4, 4)
> +#define FLD_ULTRA_FIFO_VALID_TH                        GENMASK(31, 16)
> +#define DISP_REG_MERGE_CFG_39          0x0ac
> +#define FLD_NVDE_FORCE_PREULTRA                        GENMASK(8, 8)
> +#define FLD_NVALID_TH_FORCE_PREULTRA           GENMASK(12, 12)
> +#define FLD_PREULTRA_FIFO_VALID_TH             GENMASK(31, 16)

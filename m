Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81A41E7C0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 08:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF726E507;
	Fri,  1 Oct 2021 06:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728676E507
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 06:47:10 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so10340336otb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Croa0ikRg9ed7rFOcCt98+2kFoVofysMYP5kvf8qbog=;
 b=fA5rnPSNUkYrQXNp3FXg4tEGdE2X9USp4E5HWLMS9HhTrbz7m1xj2vWuBF3H85WG2B
 5WJON+ymoXJtw2bXKL+yULUfTvp/3V3f1/PNRiFnp9yHKPbRE69BoN68dTCu8XXT7owr
 RvgHLiJd+59LDmAoF/gMf+4tKrC7HgWvZVecRFGY6YD9GBo7DVXEeXTDhzvwt4m7C3ap
 01Yc7v8JsSt37Aol28hML1XV8o9tPrhnRHcOGg7r8qwtkSxjXlr4kba9YkwQvdgl36p4
 1O2WNHWXA4WFAl3Rra6FJAY5Cw6MTA+EowWwnFPTTkW5FCfE8DzXaJ5EgqkwL01vyzlf
 4xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Croa0ikRg9ed7rFOcCt98+2kFoVofysMYP5kvf8qbog=;
 b=o3HO9y//NT6/eaPyRphFjRS23C3wB59LuMDForHEROaxwQwjL+KlwqeMc5oEKx33O6
 Ll9d9zFMwChCOtzoVpBaJPXQL4V9uIz+8ChdrePOU+GjavbVJpOqwX0rseIJ4dvAtqtd
 3f0RpzGPdTbtyhLIyMFYxZakU6mbveOluJGOL6HWOEjAsn+85S2LB2T7IBxAyTC1jgML
 OT9by9i8rliR2ysvHer4yvoVclEB+scwAv+ZOZ6y4bcUyfBF1y7dIE0MsuGE8AJz10Il
 u0oelQyV6v2Xek11XxhHqA9B/PubFm5ltdURA6+jYdgxoBePAtqeXzGd6dE37VjspgJZ
 cEGQ==
X-Gm-Message-State: AOAM532eC9YWcwBOIXoPfYtbUtjX+3auCnlSNUFbkt7917qciltvn0SL
 mJIz0J/z6vKB3NmLAchgQckiNsCzMyqdsYqX8zI=
X-Google-Smtp-Source: ABdhPJwyAvuHVKGewNwRCIDt87Kj/ThUttEmpLFrhQaYhgZQQzhGmQs83LQwjcJqZTMUntD3DPp4Ix9FvG/r6NGxUKc=
X-Received: by 2002:a9d:369:: with SMTP id 96mr2980930otv.150.1633070829661;
 Thu, 30 Sep 2021 23:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210930135944.6125-1-yongqiang.niu@mediatek.com>
 <20210930135944.6125-3-yongqiang.niu@mediatek.com>
In-Reply-To: <20210930135944.6125-3-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 1 Oct 2021 08:46:58 +0200
Message-ID: <CAFqH_53w6LkdMM4fPEFt_nwgRs9MRFkbi9yMjK9B7TqV4e8wng@mail.gmail.com>
Subject: Re: [PATCH v9,
 2/2] soc: mediatek: mmsys: Add mt8192 mmsys routing table
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Yongqiang,

This patch already have my reviewed tag but I just noticed a small nit


Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 30
de set. 2021 a les 16:00:
>
> mt8192 has different routing registers than mt8183
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  drivers/soc/mediatek/mt8192-mmsys.h | 77 +++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c    | 11 +++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
>
> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
> new file mode 100644
> index 000000000000..7ea1531ee8af
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8192_MMSYS_H
> +#define __SOC_MEDIATEK_MT8192_MMSYS_H
> +
> +#define MT8192_MMSYS_OVL_MOUT_EN               0xf04
> +#define MT8192_DISP_OVL1_2L_MOUT_EN            0xf08
> +#define MT8192_DISP_OVL0_2L_MOUT_EN            0xf18
> +#define MT8192_DISP_OVL0_MOUT_EN               0xf1c
> +#define MT8192_DISP_RDMA0_SEL_IN               0xf2c
> +#define MT8192_DISP_RDMA0_SOUT_SEL             0xf30
> +#define MT8192_DISP_CCORR0_SOUT_SEL            0xf34
> +#define MT8192_DISP_AAL0_SEL_IN                        0xf38
> +#define MT8192_DISP_DITHER0_MOUT_EN            0xf3c
> +#define MT8192_DISP_DSI0_SEL_IN                        0xf40
> +#define MT8192_DISP_OVL2_2L_MOUT_EN            0xf4c
> +
> +#define MT8192_DISP_OVL0_GO_BLEND                      BIT(0)
> +#define MT8192_DITHER0_MOUT_IN_DSI0                    BIT(0)
> +#define MT8192_OVL0_MOUT_EN_DISP_RDMA0                 BIT(0)
> +#define MT8192_OVL2_2L_MOUT_EN_RDMA4                   BIT(0)
> +#define MT8192_DISP_OVL0_GO_BG                         BIT(1)
> +#define MT8192_DISP_OVL0_2L_GO_BLEND                   BIT(2)
> +#define MT8192_DISP_OVL0_2L_GO_BG                      BIT(3)
> +#define MT8192_OVL1_2L_MOUT_EN_RDMA1                   BIT(4)
> +#define MT8192_OVL0_MOUT_EN_OVL0_2L                    BIT(4)
> +#define MT8192_RDMA0_SEL_IN_OVL0_2L                    0x3
> +#define MT8192_RDMA0_SOUT_COLOR0                       0x1
> +#define MT8192_CCORR0_SOUT_AAL0                                0x1
> +#define MT8192_AAL0_SEL_IN_CCORR0                      0x1
> +#define MT8192_DSI0_SEL_IN_DITHER0                     0x1
> +
> +static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
> +               MT8192_OVL0_MOUT_EN_DISP_RDMA0
> +       }, {
> +               DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
> +               MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_EN_RDMA4,
> +               MT8192_OVL2_2L_MOUT_EN_RDMA4
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_IN_DSI0,
> +               MT8192_DITHER0_MOUT_IN_DSI0
> +       }, {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L,
> +               MT8192_RDMA0_SEL_IN_OVL0_2L
> +       }, {
> +               DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
> +               MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0,
> +               MT8192_AAL0_SEL_IN_CCORR0
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
> +               MT8192_DSI0_SEL_IN_DITHER0
> +       }, {
> +               DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +               MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,
> +               MT8192_RDMA0_SOUT_COLOR0
> +       }, {
> +               DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
> +               MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0,
> +               MT8192_CCORR0_SOUT_AAL0
> +       }, {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> +               MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_GO_BG,
> +               MT8192_DISP_OVL0_GO_BG,
> +       }, {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_2L_GO_BLEND,
> +               MT8192_DISP_OVL0_2L_GO_BLEND,
> +       }
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8192_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a78e88f27b62..6e97d1468183 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -14,6 +14,7 @@
>  #include "mt8167-mmsys.h"
>  #include "mt8183-mmsys.h"
>  #include "mt8365-mmsys.h"
> +#include "mt8192-mmsys.h"
>
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>         .clk_driver = "clk-mt2701-mm",
> @@ -59,6 +60,12 @@ static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>         .num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
> +       .clk_driver = "clk-mt8192-mm",
> +       .routes = mmsys_mt8192_routing_table,
> +       .num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
> +};
> +

For better readability it would be nice if you put this structure by
SoC order. That's before mt8365 struct and after mt8183 struct.

>  struct mtk_mmsys {
>         void __iomem *regs;
>         const struct mtk_mmsys_driver_data *data;
> @@ -171,6 +178,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>                 .compatible = "mediatek,mt8365-mmsys",
>                 .data = &mt8365_mmsys_driver_data,
>         },
> +       {
> +               .compatible = "mediatek,mt8192-mmsys",
> +               .data = &mt8192_mmsys_driver_data,
> +       },

The same here,  for better readability would be nice if you put this
fields by SoC order. That's before mt8365 fields and after mt8183
fields.

Thanks,
  Enric

>         { }
>  };
>
> --
> 2.25.1
>

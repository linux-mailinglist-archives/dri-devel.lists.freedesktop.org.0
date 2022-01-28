Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1549FDD0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 17:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AF810F1DB;
	Fri, 28 Jan 2022 16:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AF410F1A9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:16:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED5AC61EFC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD30EC36AE2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643386600;
 bh=twyXXahotKEoQfmaYn1h+KsXQwihA+utJqMl4tH15xw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EKhz84YKGeYvLYJAh9FKwsG+aQ5RnBr38r/qXMsLK0n1hI+7A15jXcgdAWsZ5BGQY
 8jK90V47bmRw1jhW1tiU4cVDvkmR4C8Q9W4IdkAJLKKhY3z/tncG+pSaz4i+JJgCYB
 1ksPqmKGnVrdMFjK7BdAm1TUFKmswNNmEmvFB/6rgP3JUePnKrI1OntoOc6wlXwZin
 oMW66Uev9vG71z6NjvA2HIyOEoULKTpQlCYw7dHBQnW0LycrPLL+B/B1wRjm//3/rp
 5EpoCACAStTDt48U0ThBQKTFLW2koPLcbmrVFiZzrcnN+cUhgsnzvU66TJG8hWThW7
 mcyUCOab/Y+jQ==
Received: by mail-ed1-f54.google.com with SMTP id b13so10913112edn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 08:16:40 -0800 (PST)
X-Gm-Message-State: AOAM53220XQi8ThEGG0cvfoVQzbSHf4j0HNZdUoh43NSPghrY+k4tHN+
 Mnxodof0yAuQowijjO33eqp+yGewJQ+Hn+eiRQ==
X-Google-Smtp-Source: ABdhPJwGpnjATrAeAngi76DFgmj/fwwOS16yT8Wf6ZJqCxqqPJvUVz6TtZPtDgZbsbXMHnLQcDmGxUKSLksz+XyTO90=
X-Received: by 2002:aa7:dac5:: with SMTP id x5mr8757587eds.254.1643386599011; 
 Fri, 28 Jan 2022 08:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
 <20220128120718.30545-2-yongqiang.niu@mediatek.com>
In-Reply-To: <20220128120718.30545-2-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 29 Jan 2022 00:16:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-V2A5SqQ5XGh54QfLYAtue1_Uita=J0osdFC1hLnRP2g@mail.gmail.com>
Message-ID: <CAAOTY_-V2A5SqQ5XGh54QfLYAtue1_Uita=J0osdFC1hLnRP2g@mail.gmail.com>
Subject: Re: [PATCH v1,
 1/4] soc: mediatek: mmsys: Add mt8186 mmsys routing table
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
> mt8186 routing registers is different with other Soc
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8186-mmsys.h | 113 ++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c    |  11 +++
>  2 files changed, 124 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h
>
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/m=
t8186-mmsys.h
> new file mode 100644
> index 000000000000..7de329f2d729
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> +#define __SOC_MEDIATEK_MT8186_MMSYS_H
> +
> +#define MT8186_MMSYS_OVL_CON                   0xF04
> +#define MT8186_MMSYS_OVL0_CON_MASK                     0x3
> +#define MT8186_MMSYS_OVL0_2L_CON_MASK                  0xC
> +#define MT8186_OVL0_GO_BLEND                           BIT(0)
> +#define MT8186_OVL0_GO_BG                              BIT(1)
> +#define MT8186_OVL0_2L_GO_BLEND                                BIT(2)
> +#define MT8186_OVL0_2L_GO_BG                           BIT(3)
> +#define MT8186_DISP_RDMA0_SOUT_SEL             0xF0C
> +#define MT8186_RDMA0_SOUT_SEL_MASK                     0xF
> +#define MT8186_RDMA0_SOUT_TO_DSI0                      (0)
> +#define MT8186_RDMA0_SOUT_TO_COLOR0                    (1)
> +#define MT8186_RDMA0_SOUT_TO_DPI0                      (2)
> +#define MT8186_DISP_OVL0_2L_MOUT_EN            0xF14
> +#define MT8186_OVL0_2L_MOUT_EN_MASK                    0xF
> +#define MT8186_OVL0_2L_MOUT_TO_RDMA0                   BIT(0)
> +#define MT8186_OVL0_2L_MOUT_TO_RDMA1                   BIT(3)
> +#define MT8186_DISP_OVL0_MOUT_EN               0xF18
> +#define MT8186_OVL0_MOUT_EN_MASK                       0xF
> +#define MT8186_OVL0_MOUT_TO_RDMA0                      BIT(0)
> +#define MT8186_OVL0_MOUT_TO_RDMA1                      BIT(3)
> +#define MT8186_DISP_DITHER0_MOUT_EN            0xF20
> +#define MT8186_DITHER0_MOUT_EN_MASK                    0xF
> +#define MT8186_DITHER0_MOUT_TO_DSI0                    BIT(0)
> +#define MT8186_DITHER0_MOUT_TO_RDMA1                   BIT(2)
> +#define MT8186_DITHER0_MOUT_TO_DPI0                    BIT(3)
> +#define MT8186_DISP_RDMA0_SEL_IN               0xF28
> +#define MT8186_RDMA0_SEL_IN_MASK                       0xF
> +#define MT8186_RDMA0_FROM_OVL0                         0
> +#define MT8186_RDMA0_FROM_OVL0_2L                      2
> +#define MT8186_DISP_DSI0_SEL_IN                        0xF30
> +#define MT8186_DSI0_SEL_IN_MASK                                0xF
> +#define MT8186_DSI0_FROM_RDMA0                         0
> +#define MT8186_DSI0_FROM_DITHER0                       1
> +#define MT8186_DSI0_FROM_RDMA1                         2
> +#define MT8186_DISP_RDMA1_MOUT_EN              0xF3C
> +#define MT8186_RDMA1_MOUT_EN_MASK                      0xF
> +#define MT8186_RDMA1_MOUT_TO_DPI0_SEL                  BIT(0)
> +#define MT8186_RDMA1_MOUT_TO_DSI0_SEL                  BIT(2)
> +#define MT8186_DISP_RDMA1_SEL_IN               0xF40
> +#define MT8186_RDMA1_SEL_IN_MASK                       0xF
> +#define MT8186_RDMA1_FROM_OVL0                         0
> +#define MT8186_RDMA1_FROM_OVL0_2L                      2
> +#define MT8186_RDMA1_FROM_DITHER0                      3
> +#define MT8186_DISP_DPI0_SEL_IN                        0xF44
> +#define MT8186_DPI0_SEL_IN_MASK                                0xF
> +#define MT8186_DPI0_FROM_RDMA1                         0
> +#define MT8186_DPI0_FROM_DITHER0                       1
> +#define MT8186_DPI0_FROM_RDMA0                         2
> +
> +static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] =3D {
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +               MT8186_DISP_OVL0_MOUT_EN, MT8186_OVL0_MOUT_EN_MASK,
> +               MT8186_OVL0_MOUT_TO_RDMA0
> +       },
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +               MT8186_DISP_RDMA0_SEL_IN, MT8186_RDMA0_SEL_IN_MASK,
> +               MT8186_RDMA0_FROM_OVL0
> +       },
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +               MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_CON_MASK,
> +               MT8186_OVL0_GO_BLEND
> +       },
> +       {
> +               DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +               MT8186_DISP_RDMA0_SOUT_SEL, MT8186_RDMA0_SOUT_SEL_MASK,
> +               MT8186_RDMA0_SOUT_TO_COLOR0
> +       },
> +       {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8186_DISP_DITHER0_MOUT_EN, MT8186_DITHER0_MOUT_EN_MASK,
> +               MT8186_DITHER0_MOUT_TO_DSI0,
> +       },
> +       {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8186_DISP_DSI0_SEL_IN, MT8186_DSI0_SEL_IN_MASK,
> +               MT8186_DSI0_FROM_DITHER0
> +       },
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +               MT8186_DISP_OVL0_2L_MOUT_EN, MT8186_OVL0_2L_MOUT_EN_MASK,
> +               MT8186_OVL0_2L_MOUT_TO_RDMA1
> +       },
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +               MT8186_DISP_RDMA1_SEL_IN, MT8186_RDMA1_SEL_IN_MASK,
> +               MT8186_RDMA1_FROM_OVL0_2L
> +       },
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +               MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_2L_CON_MASK,
> +               MT8186_OVL0_2L_GO_BLEND
> +       },
> +       {
> +               DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +               MT8186_DISP_RDMA1_MOUT_EN, MT8186_RDMA1_MOUT_EN_MASK,
> +               MT8186_RDMA1_MOUT_TO_DPI0_SEL
> +       },
> +       {
> +               DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +               MT8186_DISP_DPI0_SEL_IN, MT8186_DPI0_SEL_IN_MASK,
> +               MT8186_DPI0_FROM_RDMA1
> +       },
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8186_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 1e448f1ffefb..0da25069ffb3 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -15,6 +15,7 @@
>  #include "mtk-mmsys.h"
>  #include "mt8167-mmsys.h"
>  #include "mt8183-mmsys.h"
> +#include "mt8186-mmsys.h"
>  #include "mt8192-mmsys.h"
>  #include "mt8365-mmsys.h"
>
> @@ -56,6 +57,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys=
_driver_data =3D {
>         .num_routes =3D ARRAY_SIZE(mmsys_mt8183_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data =3D {
> +       .clk_driver =3D "clk-mt8186-mm",
> +       .routes =3D mmsys_mt8186_routing_table,
> +       .num_routes =3D ARRAY_SIZE(mmsys_mt8186_routing_table),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =3D {
>         .clk_driver =3D "clk-mt8192-mm",
>         .routes =3D mmsys_mt8192_routing_table,
> @@ -242,6 +249,10 @@ static const struct of_device_id of_match_mtk_mmsys[=
] =3D {
>                 .compatible =3D "mediatek,mt8183-mmsys",
>                 .data =3D &mt8183_mmsys_driver_data,
>         },
> +       {
> +               .compatible =3D "mediatek,mt8186-mmsys",

Add "mediatek,mt8186-mmsys" to binding document.

Regards,
Chun-Kuang.

> +               .data =3D &mt8186_mmsys_driver_data,
> +       },
>         {
>                 .compatible =3D "mediatek,mt8192-mmsys",
>                 .data =3D &mt8192_mmsys_driver_data,
> --
> 2.25.1
>

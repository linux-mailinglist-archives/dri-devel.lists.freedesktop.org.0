Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BDF3DEFB4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 16:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A976E870;
	Tue,  3 Aug 2021 14:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC12C6E870
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 14:06:05 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 a5-20020a05683012c5b029036edcf8f9a6so20809974otq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9LHsCD6sz9wNhH1vtkCQf1FqbNJPwvaCAE0YJ0j2R7w=;
 b=VkVA03WnvIbU0w5pAkJxucEhOVmMyPIGopV+A5nTR9MbOLToC0njzoLMEveUubTb00
 5n43SlXrmkzTVH2FxxhHBnE8cMEXpFC91Tj8Q7YFfDvxgsMNGyhR5Mdyw4vYwsen9ZGO
 UQpWB0FivMf8gerZ9TlcnsnwAh+yNwZq26EBgOkZlGCwKUjN9uDuONWhoaek4AHadkb6
 4EhelpCPYNmwBwYFBokq6Fb8qWTKdXVQokT2/+Aebyd4dz9NgbpJ9gqNkxDDdWAEo0WV
 4EPre3e9tdQrCnJ9zz2xBPaPYF3mhVfDxCZv2ea7VeZbuaPAXwZ9iQjV4sqEtQkNJaR5
 lmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9LHsCD6sz9wNhH1vtkCQf1FqbNJPwvaCAE0YJ0j2R7w=;
 b=kcx0SFcvVDfUaJ6j2DbCuOsVcqEbvBS7yGKZ4o8wJHLFPfITZmJxbQWoLeuv0SN+hO
 y2J7p85DBzHbfWESrrFv8R+yVtTA7allu6/m8OvK4OAz9hZRXTlqlGzbcORbGHQFtaDH
 GjOEmtYbjUhdswLCap2BoxMOoc8Vibq5jn47K6L26csA3E8RV6i6XohaYP6HCVHWe78H
 f8ncFkRkIZNxqXEMLN7W9BKVqx9hx4K0GchKZnx0qsCplu2UBzCEqvykQcs5o8ndmd0w
 N6F1NGcsBNO28PxLrIfjN0B5OPz6ARDCJ8Kd7f6ZoHo9aGuyC2e7F3zxwCfBuKwwlWWD
 eKHg==
X-Gm-Message-State: AOAM531VlCURI5ocseV/HYIKz2dd5yXu+lq4zcA38FE5NA4nS9rpSNpS
 2YG46LJ7XKM82uECeLzhkFO84UHsfQ236b00BoA=
X-Google-Smtp-Source: ABdhPJyq0t9mj746XFxQEg/6h07dFt3yj6h2kE9c/bL6DGsWC0yDBuUvcbX9JdQPNtK2bJ/ItJgUIgD1m8JMTA7+XfM=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr15976408otb.281.1627999564866; 
 Tue, 03 Aug 2021 07:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
 <1627894773-23872-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1627894773-23872-3-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 3 Aug 2021 16:05:53 +0200
Message-ID: <CAFqH_50eD=KihDrE3Vi0w+qEh6USF-sZTD+ZBjUeCiwXz4HD8Q@mail.gmail.com>
Subject: Re: [PATCH v8,
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
 Hsin-Yi Wang <hsinyi@chromium.org>
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

Hi Yongqiang,

Thank you for your patch

Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dl., 2
d=E2=80=99ag. 2021 a les 11:00:
>
> mt8192 has different routing registers than mt8183
>

... than mt8183 and other Mediatek SoC's I guess ;-)

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
   Enric


> ---
>  drivers/soc/mediatek/mt8192-mmsys.h | 67 +++++++++++++++++++++++++++++++=
++++++
>  drivers/soc/mediatek/mtk-mmsys.c    | 11 ++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
>
> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/m=
t8192-mmsys.h
> new file mode 100644
> index 0000000..0e4b233
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
> @@ -0,0 +1,67 @@
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
> +static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] =3D {
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDM=
A0,
> +       }, {
> +               DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
> +               MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_EN_RDMA4
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_IN_DSI0
> +       }, {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L
> +       }, {
> +               DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
> +               MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0
> +       }, {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
> +       }, {
> +               DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +               MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0
> +       }, {
> +               DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
> +               MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0
> +       }, {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> +               MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_GO_BG,
> +       }, {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_2L_GO_BLEND,
> +       }
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8192_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 080660e..de7b122 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -13,6 +13,7 @@
>  #include "mtk-mmsys.h"
>  #include "mt8167-mmsys.h"
>  #include "mt8183-mmsys.h"
> +#include "mt8192-mmsys.h"
>
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =3D {
>         .clk_driver =3D "clk-mt2701-mm",
> @@ -52,6 +53,12 @@
>         .num_routes =3D ARRAY_SIZE(mmsys_mt8183_routing_table),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =3D {
> +       .clk_driver =3D "clk-mt8192-mm",
> +       .routes =3D mmsys_mt8192_routing_table,
> +       .num_routes =3D ARRAY_SIZE(mmsys_mt8192_routing_table),
> +};
> +
>  struct mtk_mmsys {
>         void __iomem *regs;
>         const struct mtk_mmsys_driver_data *data;
> @@ -157,6 +164,10 @@ static int mtk_mmsys_probe(struct platform_device *p=
dev)
>                 .compatible =3D "mediatek,mt8183-mmsys",
>                 .data =3D &mt8183_mmsys_driver_data,
>         },
> +       {
> +               .compatible =3D "mediatek,mt8192-mmsys",
> +               .data =3D &mt8192_mmsys_driver_data,
> +       },
>         { }
>  };
>
> --
> 1.8.1.1.dirty
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F7B49FDD3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 17:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB1210F231;
	Fri, 28 Jan 2022 16:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A8210F231
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:17:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EC4C61F00
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421F8C340F0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643386647;
 bh=nxlbZsy8Q2SWe4ga/LjTbDUaRa0eP0r7WRbq2+PkVTY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RuD7sdvoMr8QES3FX3rcpoeDNwdSeUFh+KgUSLBbBnwUafMuhGbKt4ORG1zA2Jhc5
 tRlHNjal9W7TDfURiSmz/y13RRHv62GwB5XUc0+XpkUzlYQ+0w3OIGF1DiD09fAfuu
 H7+0LKem2Abml7fczXH9hmZpi7XOX5HhLaD+3hRaXrHk5/jqNnsIURjaALX42JyY/1
 5kwGuByVxdOWIi/TO59MBMrxbSmpJ/SYJetO3WYE6tk77vDVU3oMsWVfj8gIwywmLN
 jpdxHNTvz1+dRBNPqF6QooLBCDaOtnqYvxknH/4bAgebDaZq6hF+MLlxBhmgupZESO
 InfSyk+Huhipg==
Received: by mail-ej1-f45.google.com with SMTP id jx6so17846302ejb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 08:17:27 -0800 (PST)
X-Gm-Message-State: AOAM530f+NDMind/ia0DIH6QI7aIlAJbfq/IOkiIAxNQmFaHTww19XzE
 9W2Y3cv5Y6LBD15xB/e7WgqCmUMXlJr11G8bFw==
X-Google-Smtp-Source: ABdhPJzz/zS18PKPnGfN2lJ5LGsaFhGr63+K2uD0+MpyUIjLiLR/MhzdXve5JhwlZTgH8V40vRYcpsvrvhSVcEIyRXs=
X-Received: by 2002:a17:907:a089:: with SMTP id
 hu9mr7611025ejc.680.1643386645417; 
 Fri, 28 Jan 2022 08:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
 <20220128120718.30545-3-yongqiang.niu@mediatek.com>
In-Reply-To: <20220128120718.30545-3-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 29 Jan 2022 00:17:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qXrE+5ej2YUFCqrMmuNvRzcQtnyJPoSUD5O9N5fgs1A@mail.gmail.com>
Message-ID: <CAAOTY_-qXrE+5ej2YUFCqrMmuNvRzcQtnyJPoSUD5O9N5fgs1A@mail.gmail.com>
Subject: Re: [PATCH v1, 2/4] soc: mediatek: add mtk mutex support for MT8186
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
> Add mtk mutex support for MT8186 SoC.
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 45 ++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-=
mutex.c
> index 2ca55bb5a8be..ebd95fd0f36e 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -26,6 +26,23 @@
>
>  #define INT_MUTEX                              BIT(1)
>
> +#define MT8186_MUTEX_MOD_DISP_OVL0             0
> +#define MT8186_MUTEX_MOD_DISP_OVL0_2L          1
> +#define MT8186_MUTEX_MOD_DISP_RDMA0            2
> +#define MT8186_MUTEX_MOD_DISP_COLOR0           4
> +#define MT8186_MUTEX_MOD_DISP_CCORR0           5
> +#define MT8186_MUTEX_MOD_DISP_AAL0             7
> +#define MT8186_MUTEX_MOD_DISP_GAMMA0           8
> +#define MT8186_MUTEX_MOD_DISP_POSTMASK0                9
> +#define MT8186_MUTEX_MOD_DISP_DITHER0          10
> +#define MT8186_MUTEX_MOD_DISP_RDMA1            17
> +
> +#define MT8186_MUTEX_SOF_SINGLE_MODE 0
> +#define MT8186_MUTEX_SOF_DSI0 1
> +#define MT8186_MUTEX_SOF_DPI0 2
> +#define MT8186_MUTEX_EOF_DSI0 (MT8186_MUTEX_SOF_DSI0 << 6)
> +#define MT8186_MUTEX_EOF_DPI0 (MT8186_MUTEX_SOF_DPI0 << 6)
> +
>  #define MT8167_MUTEX_MOD_DISP_PWM              1
>  #define MT8167_MUTEX_MOD_DISP_OVL0             6
>  #define MT8167_MUTEX_MOD_DISP_OVL1             7
> @@ -226,6 +243,19 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPO=
NENT_ID_MAX] =3D {
>         [DDP_COMPONENT_WDMA0] =3D MT8183_MUTEX_MOD_DISP_WDMA0,
>  };
>
> +static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] =3D {
> +       [DDP_COMPONENT_AAL0] =3D MT8186_MUTEX_MOD_DISP_AAL0,
> +       [DDP_COMPONENT_CCORR] =3D MT8186_MUTEX_MOD_DISP_CCORR0,
> +       [DDP_COMPONENT_COLOR0] =3D MT8186_MUTEX_MOD_DISP_COLOR0,
> +       [DDP_COMPONENT_DITHER] =3D MT8186_MUTEX_MOD_DISP_DITHER0,
> +       [DDP_COMPONENT_GAMMA] =3D MT8186_MUTEX_MOD_DISP_GAMMA0,
> +       [DDP_COMPONENT_OVL0] =3D MT8186_MUTEX_MOD_DISP_OVL0,
> +       [DDP_COMPONENT_OVL_2L0] =3D MT8186_MUTEX_MOD_DISP_OVL0_2L,
> +       [DDP_COMPONENT_POSTMASK0] =3D MT8186_MUTEX_MOD_DISP_POSTMASK0,
> +       [DDP_COMPONENT_RDMA0] =3D MT8186_MUTEX_MOD_DISP_RDMA0,
> +       [DDP_COMPONENT_RDMA1] =3D MT8186_MUTEX_MOD_DISP_RDMA1,
> +};
> +
>  static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_AAL0] =3D MT8192_MUTEX_MOD_DISP_AAL0,
>         [DDP_COMPONENT_CCORR] =3D MT8192_MUTEX_MOD_DISP_CCORR0,
> @@ -264,6 +294,12 @@ static const unsigned int mt8183_mutex_sof[MUTEX_SOF=
_DSI3 + 1] =3D {
>         [MUTEX_SOF_DPI0] =3D MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI=
0,
>  };
>
> +static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] =3D {
> +       [MUTEX_SOF_SINGLE_MODE] =3D MUTEX_SOF_SINGLE_MODE,
> +       [MUTEX_SOF_DSI0] =3D MT8186_MUTEX_SOF_DSI0 | MT8186_MUTEX_EOF_DSI=
0,
> +       [MUTEX_SOF_DPI0] =3D MT8186_MUTEX_SOF_DPI0 | MT8186_MUTEX_EOF_DPI=
0,
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data =3D {
>         .mutex_mod =3D mt2701_mutex_mod,
>         .mutex_sof =3D mt2712_mutex_sof,
> @@ -301,6 +337,13 @@ static const struct mtk_mutex_data mt8183_mutex_driv=
er_data =3D {
>         .no_clk =3D true,
>  };
>
> +static const struct mtk_mutex_data mt8186_mutex_driver_data =3D {
> +       .mutex_mod =3D mt8186_mutex_mod,
> +       .mutex_sof =3D mt8186_mutex_sof,
> +       .mutex_mod_reg =3D MT8183_MUTEX0_MOD0,
> +       .mutex_sof_reg =3D MT8183_MUTEX0_SOF0,
> +};
> +
>  static const struct mtk_mutex_data mt8192_mutex_driver_data =3D {
>         .mutex_mod =3D mt8192_mutex_mod,
>         .mutex_sof =3D mt8183_mutex_sof,
> @@ -540,6 +583,8 @@ static const struct of_device_id mutex_driver_dt_matc=
h[] =3D {
>           .data =3D &mt8173_mutex_driver_data},
>         { .compatible =3D "mediatek,mt8183-disp-mutex",
>           .data =3D &mt8183_mutex_driver_data},
> +       { .compatible =3D "mediatek,mt8186-disp-mutex",

Add "mediatek,mt8186-disp-mutex" to binding document.

Regards,
Chun-Kuang.

> +       .data =3D &mt8186_mutex_driver_data},
>         { .compatible =3D "mediatek,mt8192-disp-mutex",
>           .data =3D &mt8192_mutex_driver_data},
>         {},
> --
> 2.25.1
>

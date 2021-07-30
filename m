Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F353DC17B
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 01:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5636E4CF;
	Fri, 30 Jul 2021 23:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7D6E4CF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 23:12:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA2A060F3A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 23:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627686731;
 bh=2z+8NiOD0PsDLOMtm7HEjTbuJVpHU6ddRaJfri7FY7E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c+xZEAwkAfCaXB84thTOnK86azedcbGJZg6LgZnAp0RXRuu5qxOpA1XZeyxpkVP/e
 QHnJLu08FsLbt2pQkxE8kIW/m5RyTjgNPxiikaYG39JsLQSvNy7VekH2/T/moSEQxf
 IqmgB2Af5lPnEB9v0i+IckkVfs4tT2txdBijXxUWh+C5oqJprX5t8L1dd+i3mEw/TB
 3MegHBaQx0XMlGGqhjIvoOYSy2UqWSYctzcoWh7X1jDThcNMXO3TyqbdbbgWxlK/HD
 B7CZubJEO9D/27XR+wVvcXVbCsAoClo/QzxRrPWFp7cEjqYgqvAHHcsLqFVwK3PyqH
 bcPZEHDKNNuNA==
Received: by mail-ed1-f54.google.com with SMTP id d6so7714257edt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 16:12:10 -0700 (PDT)
X-Gm-Message-State: AOAM531TDZhSJkz8KxyxVEXaCTQsEr+odpJhdgQGK3/K+Y9A1ZAZnQbJ
 lb+0kr22ODsLMhgpkKYqp1P2k07RsMB97eXdlA==
X-Google-Smtp-Source: ABdhPJwzMUJR/ZabYWlF1LL28gEzoZTiGoDGAkO52lFCgwbh2C5iQsYAwy8BvnfSHaRhz0LxKs1qVHrJ3BJ0P0YrXfQ=
X-Received: by 2002:aa7:c6d3:: with SMTP id b19mr5393041eds.303.1627686729430; 
 Fri, 30 Jul 2021 16:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <20210729170737.21424-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210729170737.21424-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 31 Jul 2021 07:11:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-54wi6Ujvynyex30wY7vn_sV_=R5T3CBj77iYCCGQvGg@mail.gmail.com>
Message-ID: <CAAOTY_-54wi6Ujvynyex30wY7vn_sV_=R5T3CBj77iYCCGQvGg@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] drm/mediatek: add DSC support for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=883=
0=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:07=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add DSC into mtk_drm_ddp_comp to support for mt8195.
>
> DSC is designed for real-time systems with real-time compression,
> transmission, decompression and display.
> The DSC standard is a specification of the algorithms used for
> compressing and decompressing image display streams, including
> the specification of the syntax and semantics of the compressed
> video bit stream.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is base on [1]
>
> [1]add mt8195 SoC DRM binding
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5195=
97
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 46 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  2 +
>  3 files changed, 49 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e17fc4..6f4a9b8c9914 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -65,6 +65,12 @@
>  #define DITHER_ADD_LSHIFT_G(x)                 (((x) & 0x7) << 4)
>  #define DITHER_ADD_RSHIFT_G(x)                 (((x) & 0x7) << 0)
>
> +#define DISP_REG_DSC_CON                       0x0000
> +#define DSC_EN                                 BIT(0)
> +#define DSC_DUAL_INOUT                         BIT(2)
> +#define DSC_BYPASS                             BIT(4)
> +#define DSC_UFOE_SEL                           BIT(16)
> +
>  struct mtk_ddp_comp_dev {
>         struct clk *clk;
>         void __iomem *regs;
> @@ -246,6 +252,35 @@ static void mtk_dither_stop(struct device *dev)
>         writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
>  }
>
> +static void mtk_dsc_config(struct device *dev, unsigned int w,
> +                          unsigned int h, unsigned int vrefresh,
> +                          unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       /* dsc bypass mode */
> +       mtk_ddp_write_mask(cmdq_pkt, DSC_BYPASS, &priv->cmdq_reg, priv->r=
egs,
> +                          DISP_REG_DSC_CON, DSC_BYPASS);
> +       mtk_ddp_write_mask(cmdq_pkt, DSC_UFOE_SEL, &priv->cmdq_reg, priv-=
>regs,
> +                          DISP_REG_DSC_CON, DSC_UFOE_SEL);
> +       mtk_ddp_write_mask(cmdq_pkt, DSC_DUAL_INOUT, &priv->cmdq_reg, pri=
v->regs,
> +                          DISP_REG_DSC_CON, DSC_DUAL_INOUT);
> +}
> +
> +static void mtk_dsc_start(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel_relaxed(DSC_EN, &priv->regs + DISP_REG_DSC_CON);
> +}
> +
> +static void mtk_dsc_stop(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel_relaxed(0x0, priv->regs + DISP_REG_DSC_CON);
> +}
> +
>  static const struct mtk_ddp_comp_funcs ddp_aal =3D {
>         .clk_enable =3D mtk_ddp_clk_enable,
>         .clk_disable =3D mtk_ddp_clk_disable,
> @@ -284,6 +319,14 @@ static const struct mtk_ddp_comp_funcs ddp_dpi =3D {
>         .stop =3D mtk_dpi_stop,
>  };
>
> +static const struct mtk_ddp_comp_funcs ddp_dsc =3D {
> +       .clk_enable =3D mtk_ddp_clk_enable,
> +       .clk_disable =3D mtk_ddp_clk_disable,
> +       .config =3D mtk_dsc_config,
> +       .start =3D mtk_dsc_start,
> +       .stop =3D mtk_dsc_stop,
> +};
> +
>  static const struct mtk_ddp_comp_funcs ddp_dsi =3D {
>         .start =3D mtk_dsi_ddp_start,
>         .stop =3D mtk_dsi_ddp_stop,
> @@ -356,6 +399,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_C=
OMP_TYPE_MAX] =3D {
>         [MTK_DISP_MUTEX] =3D "mutex",
>         [MTK_DISP_OD] =3D "od",
>         [MTK_DISP_BLS] =3D "bls",
> +       [MTK_DISP_DSC] =3D "dsc",

Would you please send a patch to make alphabetic order then apply this patc=
h?

>  };
>
>  struct mtk_ddp_comp_match {
> @@ -374,6 +418,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matche=
s[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_DITHER]  =3D { MTK_DISP_DITHER,    0, &ddp_dither =
},
>         [DDP_COMPONENT_DPI0]    =3D { MTK_DPI,            0, &ddp_dpi },
>         [DDP_COMPONENT_DPI1]    =3D { MTK_DPI,            1, &ddp_dpi },
> +       [DDP_COMPONENT_DSC0]    =3D { MTK_DISP_DSC,       0, &ddp_dsc },
> +       [DDP_COMPONENT_DSC1]    =3D { MTK_DISP_DSC,       1, &ddp_dsc },
>         [DDP_COMPONENT_DSI0]    =3D { MTK_DSI,            0, &ddp_dsi },
>         [DDP_COMPONENT_DSI1]    =3D { MTK_DSI,            1, &ddp_dsi },
>         [DDP_COMPONENT_DSI2]    =3D { MTK_DSI,            2, &ddp_dsi },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5..661fb620e266 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -34,6 +34,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_MUTEX,
>         MTK_DISP_OD,
>         MTK_DISP_BLS,
> +       MTK_DISP_DSC,

Ditto.

>         MTK_DDP_COMP_TYPE_MAX,
>  };
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index d6f6d1bdad85..0f6bb4bdc58a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -446,6 +446,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_GAMMA, },
>         { .compatible =3D "mediatek,mt8183-disp-dither",
>           .data =3D (void *)MTK_DISP_DITHER },
> +       { .compatible =3D "mediatek,mt8195-disp-dsc",
> +         .data =3D (void *)MTK_DISP_DSC },

I would like you move this patch before the patch "add mediatek-drm of
vdosys0 support for mt8195" and move this part into that patch.

Regards,
Chun-Kuang.

>         { .compatible =3D "mediatek,mt8173-disp-ufoe",
>           .data =3D (void *)MTK_DISP_UFOE },
>         { .compatible =3D "mediatek,mt2701-dsi",
> --
> 2.18.0
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCAC41C7C5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 17:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4816EAAE;
	Wed, 29 Sep 2021 15:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7816E6EAAB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:02:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4249261381
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927751;
 bh=Rb95LMWh47lkI8s7wGkPcaV802n1stSCehSdkA9PaKQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b2BAWnzigUFYS8ma8wnKErATKxLO76Y+JO3w3uqo8nECuOFS9jZ643EOmOZUqIcmN
 P1Ait9augX74jUzBSNNS1MiJ0wHG4JB06zwKkJ+dx7DP1oq0fPMqxnV22mkYtwAA+8
 01S7eI/nDuGQovQS39DNt+S/Ypew0MTyo8zburaXYdFVUgQ5qK8HuNRGRWt6dHdile
 T3ll8XFgdMUT54TArdtLqsd+iC1WnRg7uxwdCaBrfy2Jib0IrdFf/W9mB5x/spLQ2t
 0XDXme4Nc+2m9MpP7owRqRwf8jA02pjuuUEQRSgEAIODU+rllEIIAGB2naDr9kpvOP
 ZE04CqgddjCJQ==
Received: by mail-ed1-f43.google.com with SMTP id bd28so9722496edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:02:31 -0700 (PDT)
X-Gm-Message-State: AOAM530c5sg3Gom3nvNallJVznL4BG86EdPa0xDukMVTpzuIH83tjmR2
 6JLCobUFHkEAef9MN9/mVmL0LjpvmuuOYoa8sQ==
X-Google-Smtp-Source: ABdhPJyGD4yUBeiN1FcgHZNJPxHnMI+9p1Py2c2bPEOLqdFuGORbP46IfgPD+pii/BFPuHFgoaHj6wzTgcL3LStrTuA=
X-Received: by 2002:a17:906:3181:: with SMTP id 1mr210402ejy.388.1632927663938; 
 Wed, 29 Sep 2021 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-15-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-15-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 23:00:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__-O8PEZ0oo0wUTUeknEXSfkbmD5SSrnN6JCtn98k5U7A@mail.gmail.com>
Message-ID: <CAAOTY__-O8PEZ0oo0wUTUeknEXSfkbmD5SSrnN6JCtn98k5U7A@mail.gmail.com>
Subject: Re: [PATCH v11 14/16] drm/mediatek: add DSC support for mediatek-drm
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Moudy Ho <moudy.ho@mediatek.com>, roy-cw.yeh@mediatek.com, 
 Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=882=
1=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:52=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> DSC is designed for real-time systems with real-time compression,
> transmission, decompression and display.
> The DSC standard is a specification of the algorithms used for
> compressing and decompressing image display streams, including
> the specification of the syntax and semantics of the compressed
> video bit stream.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> rebase on series [1]
>
> [1] drm/mediatek: add support for mediatek SOC MT8192
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5294=
89
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 47 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 23c03e550658..ce6c90b9edef 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -40,6 +40,12 @@
>  #define DITHER_LSB_ERR_SHIFT_G(x)              (((x) & 0x7) << 12)
>  #define DITHER_ADD_LSHIFT_G(x)                 (((x) & 0x7) << 4)
>
> +#define DISP_REG_DSC_CON                       0x0000
> +#define DSC_EN                                 BIT(0)
> +#define DSC_DUAL_INOUT                         BIT(2)
> +#define DSC_BYPASS                             BIT(4)
> +#define DSC_UFOE_SEL                           BIT(16)
> +
>  #define DISP_REG_OD_EN                         0x0000
>  #define DISP_REG_OD_CFG                                0x0020
>  #define OD_RELAYMODE                           BIT(0)
> @@ -181,6 +187,36 @@ static void mtk_dither_set(struct device *dev, unsig=
ned int bpc,
>                               DISP_DITHERING, cmdq_pkt);
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
> +       /* write with mask to reserve the value set in mtk_dsc_config */
> +       mtk_ddp_write_mask(NULL, DSC_EN, &priv->cmdq_reg, priv->regs, DIS=
P_REG_DSC_CON, DSC_EN);
> +}
> +
> +static void mtk_dsc_stop(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel_relaxed(0x0, priv->regs + DISP_REG_DSC_CON);
> +}
> +
>  static void mtk_od_config(struct device *dev, unsigned int w,
>                           unsigned int h, unsigned int vrefresh,
>                           unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -270,6 +306,14 @@ static const struct mtk_ddp_comp_funcs ddp_dpi =3D {
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
> @@ -339,6 +383,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_C=
OMP_TYPE_MAX] =3D {
>         [MTK_DISP_CCORR] =3D "ccorr",
>         [MTK_DISP_COLOR] =3D "color",
>         [MTK_DISP_DITHER] =3D "dither",
> +       [MTK_DISP_DSC] =3D "dsc",
>         [MTK_DISP_GAMMA] =3D "gamma",
>         [MTK_DISP_MUTEX] =3D "mutex",
>         [MTK_DISP_OD] =3D "od",
> @@ -369,6 +414,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matche=
s[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_DITHER]          =3D { MTK_DISP_DITHER,    0, &ddp=
_dither },
>         [DDP_COMPONENT_DPI0]            =3D { MTK_DPI,            0, &ddp=
_dpi },
>         [DDP_COMPONENT_DPI1]            =3D { MTK_DPI,            1, &ddp=
_dpi },
> +       [DDP_COMPONENT_DSC0]            =3D { MTK_DISP_DSC,       0, &ddp=
_dsc },
> +       [DDP_COMPONENT_DSC1]            =3D { MTK_DISP_DSC,       1, &ddp=
_dsc },
>         [DDP_COMPONENT_DSI0]            =3D { MTK_DSI,            0, &ddp=
_dsi },
>         [DDP_COMPONENT_DSI1]            =3D { MTK_DSI,            1, &ddp=
_dsi },
>         [DDP_COMPONENT_DSI2]            =3D { MTK_DSI,            2, &ddp=
_dsi },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 4c6a98662305..5e6ff12f16ad 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -23,6 +23,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_CCORR,
>         MTK_DISP_COLOR,
>         MTK_DISP_DITHER,
> +       MTK_DISP_DSC,
>         MTK_DISP_GAMMA,
>         MTK_DISP_MUTEX,
>         MTK_DISP_OD,
> --
> 2.18.0
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E87C3E2E7C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 18:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766AA6EBA8;
	Fri,  6 Aug 2021 16:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD9A6EC25
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 16:44:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32C8D611C5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628268298;
 bh=e6X1ejwYZJz4g3C27Hjs+C3V2Vy3DAlSFQ2JXBSZHTk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a9R90Nys5zg5vtrNMBHsxczVTZSWE8M4ycFto2fwIiaRzJUj7FcCKnUZM+oqUVvVX
 vh/yul99sWSpBxbYGp79DxmzekqC1H32cOGQAEapKw1kwjQJ6Nso4hF0XKqXGaTBvK
 lp42eeL/XCTjH9u8MtHOe2ucDxdURZybJIaiujGDWkBBbFMLIiUamotO1gS82twfD9
 x1rRkB4U9m3kfTauuj7YrsACWqF1H9hiCPXW+YAS02EVvzpS01laML6BCKuSqcMy1S
 rS+jSpxGpMWyR2gtkmTGllgGZaAqMrW50ATo1jUN4sVaRjwTO3+e//NqN6bHRDCnal
 ZkA2KrKyCnoYQ==
Received: by mail-ed1-f42.google.com with SMTP id x90so13858114ede.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 09:44:58 -0700 (PDT)
X-Gm-Message-State: AOAM532h/hG++BT0TLQp/VMCPGRIfRiXqtPljCGDmll/o8gklLmITeZ7
 uFR3dFf9v4b9tKUXujXFx65tuybVHV/1N1TKDg==
X-Google-Smtp-Source: ABdhPJx8PC4LSe4V79gmNRXayd6w51FyJXtXNEdbxlemDTImQ7LpkaVI/JfW14TesAoCEmev1PZPE3vh8bt886U1/uo=
X-Received: by 2002:a05:6402:718:: with SMTP id
 w24mr13982683edx.49.1628268296679; 
 Fri, 06 Aug 2021 09:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210805205226.24880-1-jason-jh.lin@mediatek.com>
 <20210805205226.24880-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210805205226.24880-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 7 Aug 2021 00:44:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY__f9TmyUaZe8O5aAfebftJc2B7BWchhZ8DWk+SWKTDF-w@mail.gmail.com>
Message-ID: <CAAOTY__f9TmyUaZe8O5aAfebftJc2B7BWchhZ8DWk+SWKTDF-w@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] drm/mediatek: add DSC support for mediatek-drm
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, 
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=884:52=E5=AF=AB=E9=81=93=EF=BC=
=9A
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
> [1] dt-bindings: mediatek: add mediatek, dsc.yaml for mt8195 SoC binding
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210805171346.=
24249-4-jason-jh.lin@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 62 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>  2 files changed, 63 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 328ee19f931e..24c7b004fe4d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -43,6 +43,12 @@
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
> @@ -209,6 +215,35 @@ static void mtk_dither_set(struct device *dev, unsig=
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
>  static void mtk_od_config(struct device *dev, unsigned int w,
>                           unsigned int h, unsigned int vrefresh,
>                           unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -272,6 +307,14 @@ static const struct mtk_ddp_comp_funcs ddp_dpi =3D {
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
> @@ -286,6 +329,14 @@ static const struct mtk_ddp_comp_funcs ddp_gamma =3D=
 {
>         .stop =3D mtk_gamma_stop,
>  };
>
> +static const struct mtk_ddp_comp_funcs ddp_merge =3D {
> +       .clk_enable =3D mtk_merge_clk_enable,
> +       .clk_disable =3D mtk_merge_clk_disable,
> +       .start =3D mtk_merge_start,
> +       .stop =3D mtk_merge_stop,
> +       .config =3D mtk_merge_config,
> +};

Move the merge modification to the patch of merge.

> +
>  static const struct mtk_ddp_comp_funcs ddp_od =3D {
>         .clk_enable =3D mtk_ddp_clk_enable,
>         .clk_disable =3D mtk_ddp_clk_disable,
> @@ -333,7 +384,9 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_C=
OMP_TYPE_MAX] =3D {
>         [MTK_DISP_CCORR] =3D "ccorr",
>         [MTK_DISP_COLOR] =3D "color",
>         [MTK_DISP_DITHER] =3D "dither",
> +       [MTK_DISP_DSC] =3D "dsc",
>         [MTK_DISP_GAMMA] =3D "gamma",
> +       [MTK_DISP_MERGE] =3D "merge",

Ditto.

>         [MTK_DISP_MUTEX] =3D "mutex",
>         [MTK_DISP_OD] =3D "od",
>         [MTK_DISP_OVL] =3D "ovl",
> @@ -362,11 +415,19 @@ static const struct mtk_ddp_comp_match mtk_ddp_matc=
hes[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_DITHER]  =3D { MTK_DISP_DITHER,    0, &ddp_dither =
},
>         [DDP_COMPONENT_DPI0]    =3D { MTK_DPI,            0, &ddp_dpi },
>         [DDP_COMPONENT_DPI1]    =3D { MTK_DPI,            1, &ddp_dpi },
> +       [DDP_COMPONENT_DSC0]    =3D { MTK_DISP_DSC,       0, &ddp_dsc },
> +       [DDP_COMPONENT_DSC1]    =3D { MTK_DISP_DSC,       1, &ddp_dsc },
>         [DDP_COMPONENT_DSI0]    =3D { MTK_DSI,            0, &ddp_dsi },
>         [DDP_COMPONENT_DSI1]    =3D { MTK_DSI,            1, &ddp_dsi },
>         [DDP_COMPONENT_DSI2]    =3D { MTK_DSI,            2, &ddp_dsi },
>         [DDP_COMPONENT_DSI3]    =3D { MTK_DSI,            3, &ddp_dsi },
>         [DDP_COMPONENT_GAMMA]   =3D { MTK_DISP_GAMMA,     0, &ddp_gamma }=
,
> +       [DDP_COMPONENT_MERGE0]  =3D { MTK_DISP_MERGE,     0, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE1]  =3D { MTK_DISP_MERGE,     1, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE2]  =3D { MTK_DISP_MERGE,     2, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE3]  =3D { MTK_DISP_MERGE,     3, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE4]  =3D { MTK_DISP_MERGE,     4, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE5]  =3D { MTK_DISP_MERGE,     5, &ddp_merge }=
,

Ditto.

>         [DDP_COMPONENT_OD0]     =3D { MTK_DISP_OD,        0, &ddp_od },
>         [DDP_COMPONENT_OD1]     =3D { MTK_DISP_OD,        1, &ddp_od },
>         [DDP_COMPONENT_OVL0]    =3D { MTK_DISP_OVL,       0, &ddp_ovl },
> @@ -497,6 +558,7 @@ int mtk_ddp_comp_init(struct device_node *node, struc=
t mtk_ddp_comp *comp,
>             type =3D=3D MTK_DISP_CCORR ||
>             type =3D=3D MTK_DISP_COLOR ||
>             type =3D=3D MTK_DISP_GAMMA ||
> +           type =3D=3D MTK_DISP_MERGE ||

Ditto.

Regards,
Chun-Kuang.

>             type =3D=3D MTK_DISP_OVL ||
>             type =3D=3D MTK_DISP_OVL_2L ||
>             type =3D=3D MTK_DISP_PWM ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index d317b944df66..560be6bc9d0e 100644
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

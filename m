Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E33F2388
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 01:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A596E82D;
	Thu, 19 Aug 2021 23:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7966E82D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 23:14:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCB66610CF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629414883;
 bh=MnMKoiEsPI8MxcU9wOGQK/b3k2bojlD0gEpNceWtW6Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g9sFQNge2zIpwuH4EaVuY26gpUjzm/FnsJmJsmFIr3WFQ+BwIHwI/4xgtpMzsLHru
 9Nu5kuvwhoqS4J2I384gygQeYzlDhKWjrVUzBH+TJI32Asdz2+EOeMmsCYmHSHAa6C
 lmugKpd3SAOBUHg91LGg7pSvv0aZ8piqzTyrQn8+riNUhsvDw39TWEkhZ0wedmzvsN
 2rNUAI5eTekNOtHJcgd9pWkwtxJUE+0CpHfo6TktdxqyX8qNwRuJ/mmYX/K/1hfwkQ
 pGzgeKNvzvkY4DCWDRqXq+BGVW1SRmy+i9um1qTuCGIPNL1VkORhmAV7+YmCWJ88n8
 Ri7fAh7CTHvIg==
Received: by mail-ej1-f43.google.com with SMTP id b10so16117668eju.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 16:14:42 -0700 (PDT)
X-Gm-Message-State: AOAM532XvyVSo5S5hjKjfT3VjBf1x2o2JMK22nulzqZQAf8eZhfGQozT
 ouhsOtyP/ibJlsNC9XfPBQ9b0u4mQBiEqyk+Xg==
X-Google-Smtp-Source: ABdhPJxBeBbSlod7NbTY61UJVAZhUOOrCl37GDHQ5RSq/gL+auKHlIurBrNcPYSL/LU+04gBLht4HDvsQh7nMVxzfVQ=
X-Received: by 2002:a17:906:455:: with SMTP id
 e21mr18757363eja.310.1629414881386; 
 Thu, 19 Aug 2021 16:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-11-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-11-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 20 Aug 2021 07:14:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__k28K1LeH-ctavFi9GE9p32kL6K3sxhA0TW54XPsEB-w@mail.gmail.com>
Message-ID: <CAAOTY__k28K1LeH-ctavFi9GE9p32kL6K3sxhA0TW54XPsEB-w@mail.gmail.com>
Subject: Re: [PATCH v8 10/13] drm/mediatek: adjust to the alphabetic order for
 mediatek-drm
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
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:24=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Adjust to the alphabetic order for the define, function, struct
> and array in mediatek-drm driver
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 133 ++++++++++----------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  22 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  76 +++++------
>  3 files changed, 115 insertions(+), 116 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 93beb980414f..28bc42fd0b8a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -20,17 +20,9 @@
>  #include "mtk_drm_ddp_comp.h"
>  #include "mtk_drm_crtc.h"
>
> -#define DISP_REG_OD_EN                         0x0000
> -#define DISP_REG_OD_CFG                                0x0020
> -#define DISP_REG_OD_SIZE                       0x0030
> -#define DISP_REG_DITHER_5                      0x0114
> -#define DISP_REG_DITHER_7                      0x011c
> -#define DISP_REG_DITHER_15                     0x013c
> -#define DISP_REG_DITHER_16                     0x0140
> -
> -#define DISP_REG_UFO_START                     0x0000
>
>  #define DISP_REG_AAL_EN                                0x0000
> +#define AAL_EN                                 BIT(0)
>  #define DISP_REG_AAL_SIZE                      0x0030
>
>  #define DISP_REG_DITHER_EN                     0x0000
> @@ -38,23 +30,29 @@
>  #define DISP_REG_DITHER_CFG                    0x0020
>  #define DITHER_RELAY_MODE                      BIT(0)
>  #define DITHER_ENGINE_EN                       BIT(1)
> -#define DISP_REG_DITHER_SIZE                   0x0030
> -
> -#define OD_RELAYMODE                           BIT(0)
> -
> -#define UFO_BYPASS                             BIT(2)
> -
> -#define AAL_EN                                 BIT(0)
>
>  #define DISP_DITHERING                         BIT(2)
> +#define DISP_REG_DITHER_SIZE                   0x0030
> +#define DISP_REG_DITHER_5                      0x0114
> +#define DISP_REG_DITHER_7                      0x011c
> +#define DISP_REG_DITHER_15                     0x013c
>  #define DITHER_LSB_ERR_SHIFT_R(x)              (((x) & 0x7) << 28)
>  #define DITHER_ADD_LSHIFT_R(x)                 (((x) & 0x7) << 20)
>  #define DITHER_NEW_BIT_MODE                    BIT(0)
> +#define DISP_REG_DITHER_16                     0x0140
>  #define DITHER_LSB_ERR_SHIFT_B(x)              (((x) & 0x7) << 28)
>  #define DITHER_ADD_LSHIFT_B(x)                 (((x) & 0x7) << 20)
>  #define DITHER_LSB_ERR_SHIFT_G(x)              (((x) & 0x7) << 12)
>  #define DITHER_ADD_LSHIFT_G(x)                 (((x) & 0x7) << 4)
>
> +#define DISP_REG_OD_EN                         0x0000
> +#define DISP_REG_OD_CFG                                0x0020
> +#define OD_RELAYMODE                           BIT(0)
> +#define DISP_REG_OD_SIZE                       0x0030
> +
> +#define DISP_REG_UFO_START                     0x0000
> +#define UFO_BYPASS                             BIT(2)
> +
>  struct mtk_ddp_comp_dev {
>         struct clk *clk;
>         void __iomem *regs;
> @@ -106,20 +104,6 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, u=
nsigned int value,
>  #endif
>  }
>
> -static int mtk_ddp_clk_enable(struct device *dev)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       return clk_prepare_enable(priv->clk);
> -}
> -
> -static void mtk_ddp_clk_disable(struct device *dev)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       clk_disable_unprepare(priv->clk);
> -}
> -

I would like to place the same group together. mtk_ddp_clk_enable()
and mtk_ddp_clk_disable() are common function not belong to any sub
driver. So I would like keep these function here.

Regards,
Chun-Kuang.

>  void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *c=
mdq_reg,
>                            unsigned int bpc, unsigned int cfg,
>                            unsigned int dither_en, struct cmdq_pkt *cmdq_=
pkt)
> @@ -146,38 +130,19 @@ void mtk_dither_set_common(void __iomem *regs, stru=
ct cmdq_client_reg *cmdq_reg,
>         }
>  }
>
> -static void mtk_dither_set(struct device *dev, unsigned int bpc,
> -                   unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, cfg,
> -                             DISP_DITHERING, cmdq_pkt);
> -}
> -
> -static void mtk_od_config(struct device *dev, unsigned int w,
> -                         unsigned int h, unsigned int vrefresh,
> -                         unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_REG_OD_SIZE);
> -       mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs=
, DISP_REG_OD_CFG);
> -       mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
> -}
>
> -static void mtk_od_start(struct device *dev)
> +static int mtk_ddp_clk_enable(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel(1, priv->regs + DISP_REG_OD_EN);
> +       return clk_prepare_enable(priv->clk);
>  }
>
> -static void mtk_ufoe_start(struct device *dev)
> +static void mtk_ddp_clk_disable(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
> +       clk_disable_unprepare(priv->clk);
>  }
>
>  static void mtk_aal_config(struct device *dev, unsigned int w,
> @@ -237,6 +202,40 @@ static void mtk_dither_stop(struct device *dev)
>         writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
>  }
>
> +static void mtk_dither_set(struct device *dev, unsigned int bpc,
> +                          unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, cfg,
> +                             DISP_DITHERING, cmdq_pkt);
> +}
> +
> +static void mtk_od_config(struct device *dev, unsigned int w,
> +                         unsigned int h, unsigned int vrefresh,
> +                         unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_REG_OD_SIZE);
> +       mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs=
, DISP_REG_OD_CFG);
> +       mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
> +}
> +
> +static void mtk_od_start(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel(1, priv->regs + DISP_REG_OD_EN);
> +}
> +
> +static void mtk_ufoe_start(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
> +}
> +
>  static const struct mtk_ddp_comp_funcs ddp_aal =3D {
>         .clk_enable =3D mtk_ddp_clk_enable,
>         .clk_disable =3D mtk_ddp_clk_disable,
> @@ -331,22 +330,22 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe =3D=
 {
>  };
>
>  static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] =3D {
> +       [MTK_DISP_AAL] =3D "aal",
> +       [MTK_DISP_BLS] =3D "bls",
> +       [MTK_DISP_CCORR] =3D "ccorr",
> +       [MTK_DISP_COLOR] =3D "color",
> +       [MTK_DISP_DITHER] =3D "dither",
> +       [MTK_DISP_GAMMA] =3D "gamma",
> +       [MTK_DISP_MUTEX] =3D "mutex",
> +       [MTK_DISP_OD] =3D "od",
>         [MTK_DISP_OVL] =3D "ovl",
>         [MTK_DISP_OVL_2L] =3D "ovl-2l",
> +       [MTK_DISP_PWM] =3D "pwm",
>         [MTK_DISP_RDMA] =3D "rdma",
> -       [MTK_DISP_WDMA] =3D "wdma",
> -       [MTK_DISP_COLOR] =3D "color",
> -       [MTK_DISP_CCORR] =3D "ccorr",
> -       [MTK_DISP_AAL] =3D "aal",
> -       [MTK_DISP_GAMMA] =3D "gamma",
> -       [MTK_DISP_DITHER] =3D "dither",
>         [MTK_DISP_UFOE] =3D "ufoe",
> -       [MTK_DSI] =3D "dsi",
> +       [MTK_DISP_WDMA] =3D "wdma",
>         [MTK_DPI] =3D "dpi",
> -       [MTK_DISP_PWM] =3D "pwm",
> -       [MTK_DISP_MUTEX] =3D "mutex",
> -       [MTK_DISP_OD] =3D "od",
> -       [MTK_DISP_BLS] =3D "bls",
> +       [MTK_DSI] =3D "dsi",
>  };
>
>  struct mtk_ddp_comp_match {
> @@ -500,12 +499,12 @@ int mtk_ddp_comp_init(struct device_node *node, str=
uct mtk_ddp_comp *comp,
>             type =3D=3D MTK_DISP_CCORR ||
>             type =3D=3D MTK_DISP_COLOR ||
>             type =3D=3D MTK_DISP_GAMMA ||
> -           type =3D=3D MTK_DPI ||
> -           type =3D=3D MTK_DSI ||
>             type =3D=3D MTK_DISP_OVL ||
>             type =3D=3D MTK_DISP_OVL_2L ||
>             type =3D=3D MTK_DISP_PWM ||
> -           type =3D=3D MTK_DISP_RDMA)
> +           type =3D=3D MTK_DISP_RDMA ||
> +           type =3D=3D MTK_DPI ||
> +           type =3D=3D MTK_DSI)
>                 return 0;
>
>         priv =3D devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5..d317b944df66 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -18,22 +18,22 @@ struct mtk_plane_state;
>  struct drm_crtc_state;
>
>  enum mtk_ddp_comp_type {
> -       MTK_DISP_OVL,
> -       MTK_DISP_OVL_2L,
> -       MTK_DISP_RDMA,
> -       MTK_DISP_WDMA,
> -       MTK_DISP_COLOR,
> +       MTK_DISP_AAL,
> +       MTK_DISP_BLS,
>         MTK_DISP_CCORR,
> +       MTK_DISP_COLOR,
>         MTK_DISP_DITHER,
> -       MTK_DISP_AAL,
>         MTK_DISP_GAMMA,
> -       MTK_DISP_UFOE,
> -       MTK_DSI,
> -       MTK_DPI,
> -       MTK_DISP_PWM,
>         MTK_DISP_MUTEX,
>         MTK_DISP_OD,
> -       MTK_DISP_BLS,
> +       MTK_DISP_OVL,
> +       MTK_DISP_OVL_2L,
> +       MTK_DISP_PWM,
> +       MTK_DISP_RDMA,
> +       MTK_DISP_UFOE,
> +       MTK_DISP_WDMA,
> +       MTK_DPI,
> +       MTK_DSI,
>         MTK_DDP_COMP_TYPE_MAX,
>  };
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index b46bdb8985da..a95dc1006b82 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -396,50 +396,20 @@ static const struct component_master_ops mtk_drm_op=
s =3D {
>  };
>
>  static const struct of_device_id mtk_ddp_comp_dt_ids[] =3D {
> -       { .compatible =3D "mediatek,mt2701-disp-ovl",
> -         .data =3D (void *)MTK_DISP_OVL },
> -       { .compatible =3D "mediatek,mt8173-disp-ovl",
> -         .data =3D (void *)MTK_DISP_OVL },
> -       { .compatible =3D "mediatek,mt8183-disp-ovl",
> -         .data =3D (void *)MTK_DISP_OVL },
> -       { .compatible =3D "mediatek,mt8183-disp-ovl-2l",
> -         .data =3D (void *)MTK_DISP_OVL_2L },
> -       { .compatible =3D "mediatek,mt2701-disp-rdma",
> -         .data =3D (void *)MTK_DISP_RDMA },
> -       { .compatible =3D "mediatek,mt8173-disp-rdma",
> -         .data =3D (void *)MTK_DISP_RDMA },
> -       { .compatible =3D "mediatek,mt8183-disp-rdma",
> -         .data =3D (void *)MTK_DISP_RDMA },
> -       { .compatible =3D "mediatek,mt8173-disp-wdma",
> -         .data =3D (void *)MTK_DISP_WDMA },
> +       { .compatible =3D "mediatek,mt8173-disp-aal",
> +         .data =3D (void *)MTK_DISP_AAL},
>         { .compatible =3D "mediatek,mt8183-disp-ccorr",
>           .data =3D (void *)MTK_DISP_CCORR },
>         { .compatible =3D "mediatek,mt2701-disp-color",
>           .data =3D (void *)MTK_DISP_COLOR },
>         { .compatible =3D "mediatek,mt8173-disp-color",
>           .data =3D (void *)MTK_DISP_COLOR },
> -       { .compatible =3D "mediatek,mt8173-disp-aal",
> -         .data =3D (void *)MTK_DISP_AAL},
> +       { .compatible =3D "mediatek,mt8183-disp-dither",
> +         .data =3D (void *)MTK_DISP_DITHER },
>         { .compatible =3D "mediatek,mt8173-disp-gamma",
>           .data =3D (void *)MTK_DISP_GAMMA, },
>         { .compatible =3D "mediatek,mt8183-disp-gamma",
>           .data =3D (void *)MTK_DISP_GAMMA, },
> -       { .compatible =3D "mediatek,mt8183-disp-dither",
> -         .data =3D (void *)MTK_DISP_DITHER },
> -       { .compatible =3D "mediatek,mt8173-disp-ufoe",
> -         .data =3D (void *)MTK_DISP_UFOE },
> -       { .compatible =3D "mediatek,mt2701-dsi",
> -         .data =3D (void *)MTK_DSI },
> -       { .compatible =3D "mediatek,mt8173-dsi",
> -         .data =3D (void *)MTK_DSI },
> -       { .compatible =3D "mediatek,mt8183-dsi",
> -         .data =3D (void *)MTK_DSI },
> -       { .compatible =3D "mediatek,mt2701-dpi",
> -         .data =3D (void *)MTK_DPI },
> -       { .compatible =3D "mediatek,mt8173-dpi",
> -         .data =3D (void *)MTK_DPI },
> -       { .compatible =3D "mediatek,mt8183-dpi",
> -         .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt2701-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt2712-disp-mutex",
> @@ -448,12 +418,42 @@ static const struct of_device_id mtk_ddp_comp_dt_id=
s[] =3D {
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8183-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
> +       { .compatible =3D "mediatek,mt8173-disp-od",
> +         .data =3D (void *)MTK_DISP_OD },
> +       { .compatible =3D "mediatek,mt2701-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8173-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8183-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8183-disp-ovl-2l",
> +         .data =3D (void *)MTK_DISP_OVL_2L },
>         { .compatible =3D "mediatek,mt2701-disp-pwm",
>           .data =3D (void *)MTK_DISP_BLS },
>         { .compatible =3D "mediatek,mt8173-disp-pwm",
>           .data =3D (void *)MTK_DISP_PWM },
> -       { .compatible =3D "mediatek,mt8173-disp-od",
> -         .data =3D (void *)MTK_DISP_OD },
> +       { .compatible =3D "mediatek,mt2701-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8173-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8183-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8173-disp-ufoe",
> +         .data =3D (void *)MTK_DISP_UFOE },
> +       { .compatible =3D "mediatek,mt8173-disp-wdma",
> +         .data =3D (void *)MTK_DISP_WDMA },
> +       { .compatible =3D "mediatek,mt2701-dpi",
> +         .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt8173-dpi",
> +         .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt8183-dpi",
> +         .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt2701-dsi",
> +         .data =3D (void *)MTK_DSI },
> +       { .compatible =3D "mediatek,mt8173-dsi",
> +         .data =3D (void *)MTK_DSI },
> +       { .compatible =3D "mediatek,mt8183-dsi",
> +         .data =3D (void *)MTK_DSI },
>         { }
>  };
>
> @@ -542,8 +542,8 @@ static int mtk_drm_probe(struct platform_device *pdev=
)
>                     comp_type =3D=3D MTK_DISP_OVL ||
>                     comp_type =3D=3D MTK_DISP_OVL_2L ||
>                     comp_type =3D=3D MTK_DISP_RDMA ||
> -                   comp_type =3D=3D MTK_DSI ||
> -                   comp_type =3D=3D MTK_DPI) {
> +                   comp_type =3D=3D MTK_DPI ||
> +                   comp_type =3D=3D MTK_DSI) {
>                         dev_info(dev, "Adding component match for %pOF\n"=
,
>                                  node);
>                         drm_of_component_match_add(dev, &match, compare_o=
f,
> --
> 2.18.0
>

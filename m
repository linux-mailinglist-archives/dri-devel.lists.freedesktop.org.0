Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498B241C7BB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 17:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6886EAAA;
	Wed, 29 Sep 2021 15:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ACC6EAAA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:01:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0873D60F23
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927699;
 bh=rYBFGv7qSyTv5wi9JgWVnDBxvU3BGi6tG2sJeczPbYI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fJ6zusPeaUaxTT3TiOdHNB/tStDC7us9sWEJPXOy9V+ZNzHZBXd+u6Bv0n+ir/jJ8
 8xbkaD9noKdRRuM49pQeBNuKCVr+Xno51y9fkUjqf1F5+Od5YA07KZqI1VLJQEIQZy
 KqNasMTPyNvfNDGGgIFe16K8mtR6+u9NZbuRe+tyZnDnQG3KIZ/28U09bp53KXewFk
 lJT1nZfJsUjXZIYM4OQFqXROhYm/Xaix8jGZSsxtbv2Ix6LIWEu2u84/fkgHJx4TUN
 QZqe2eIdQS4iW+263fQxfGilS2IVMs1AIGOvg6AegwislvL26TB/YoLe6uPkxWJmYk
 RCkdhF9UnxRbQ==
Received: by mail-ed1-f45.google.com with SMTP id v18so9698581edc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:01:38 -0700 (PDT)
X-Gm-Message-State: AOAM532xpZB8c7hcu0zOteHouulv6otF7Mv+L1toLE8+SvYXygCOAyKq
 pelKmIXO4T477c2eNNIE6kZcy5bYJj0CF84Teg==
X-Google-Smtp-Source: ABdhPJzdpvAX8aH0GEcMrtbFORS8sjBOPw9mYBRc/9PB2zhTqtDL+HEWnh7TgAaLp2YffMUi1vtwZt6wC78xKVDfGJs=
X-Received: by 2002:a50:9d49:: with SMTP id j9mr390660edk.39.1632927608090;
 Wed, 29 Sep 2021 08:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-14-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-14-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:59:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9drkUHzjhygDo7cVJyy4Hzq4sdFV9NnOM+E74PRkoKMA@mail.gmail.com>
Message-ID: <CAAOTY_9drkUHzjhygDo7cVJyy4Hzq4sdFV9NnOM+E74PRkoKMA@mail.gmail.com>
Subject: Re: [PATCH v11 13/16] drm/mediatek: adjust to the alphabetic order
 for mediatek-drm
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
> Adjust to the alphabetic order for the define, function, struct
> and array in mediatek-drm driver

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
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 126 ++++++++++----------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  24 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 120 +++++++++----------
>  3 files changed, 134 insertions(+), 136 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index b46bc0f5d1a5..23c03e550658 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -20,26 +20,30 @@
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
>  #define DISP_REG_DITHER_EN                     0x0000
>  #define DITHER_EN                              BIT(0)
>  #define DISP_REG_DITHER_CFG                    0x0020
>  #define DITHER_RELAY_MODE                      BIT(0)
>  #define DITHER_ENGINE_EN                       BIT(1)
> +#define DISP_DITHERING                         BIT(2)
>  #define DISP_REG_DITHER_SIZE                   0x0030
> +#define DISP_REG_DITHER_5                      0x0114
> +#define DISP_REG_DITHER_7                      0x011c
> +#define DISP_REG_DITHER_15                     0x013c
> +#define DITHER_LSB_ERR_SHIFT_R(x)              (((x) & 0x7) << 28)
> +#define DITHER_ADD_LSHIFT_R(x)                 (((x) & 0x7) << 20)
> +#define DITHER_NEW_BIT_MODE                    BIT(0)
> +#define DISP_REG_DITHER_16                     0x0140
> +#define DITHER_LSB_ERR_SHIFT_B(x)              (((x) & 0x7) << 28)
> +#define DITHER_ADD_LSHIFT_B(x)                 (((x) & 0x7) << 20)
> +#define DITHER_LSB_ERR_SHIFT_G(x)              (((x) & 0x7) << 12)
> +#define DITHER_ADD_LSHIFT_G(x)                 (((x) & 0x7) << 4)
>
> +#define DISP_REG_OD_EN                         0x0000
> +#define DISP_REG_OD_CFG                                0x0020
>  #define OD_RELAYMODE                           BIT(0)
> -
> -#define UFO_BYPASS                             BIT(2)
> +#define DISP_REG_OD_SIZE                       0x0030
>
>  #define DISP_REG_POSTMASK_EN                   0x0000
>  #define POSTMASK_EN                            BIT(0)
> @@ -47,14 +51,8 @@
>  #define POSTMASK_RELAY_MODE                    BIT(0)
>  #define DISP_REG_POSTMASK_SIZE                 0x0030
>
> -#define DISP_DITHERING                         BIT(2)
> -#define DITHER_LSB_ERR_SHIFT_R(x)              (((x) & 0x7) << 28)
> -#define DITHER_ADD_LSHIFT_R(x)                 (((x) & 0x7) << 20)
> -#define DITHER_NEW_BIT_MODE                    BIT(0)
> -#define DITHER_LSB_ERR_SHIFT_B(x)              (((x) & 0x7) << 28)
> -#define DITHER_ADD_LSHIFT_B(x)                 (((x) & 0x7) << 20)
> -#define DITHER_LSB_ERR_SHIFT_G(x)              (((x) & 0x7) << 12)
> -#define DITHER_ADD_LSHIFT_G(x)                 (((x) & 0x7) << 4)
> +#define DISP_REG_UFO_START                     0x0000
> +#define UFO_BYPASS                             BIT(2)
>
>  struct mtk_ddp_comp_dev {
>         struct clk *clk;
> @@ -147,8 +145,35 @@ void mtk_dither_set_common(void __iomem *regs, struc=
t cmdq_client_reg *cmdq_reg,
>         }
>  }
>
> +static void mtk_dither_config(struct device *dev, unsigned int w,
> +                             unsigned int h, unsigned int vrefresh,
> +                             unsigned int bpc, struct cmdq_pkt *cmdq_pkt=
)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,=
 DISP_REG_DITHER_SIZE);
> +       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv-=
>regs,
> +                     DISP_REG_DITHER_CFG);
> +       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_=
DITHER_CFG,
> +                             DITHER_ENGINE_EN, cmdq_pkt);
> +}
> +
> +static void mtk_dither_start(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
> +}
> +
> +static void mtk_dither_stop(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
> +}
> +
>  static void mtk_dither_set(struct device *dev, unsigned int bpc,
> -                   unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
> +                          unsigned int cfg, struct cmdq_pkt *cmdq_pkt)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> @@ -174,13 +199,6 @@ static void mtk_od_start(struct device *dev)
>         writel(1, priv->regs + DISP_REG_OD_EN);
>  }
>
> -static void mtk_ufoe_start(struct device *dev)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
> -}
> -
>  static void mtk_postmask_config(struct device *dev, unsigned int w,
>                         unsigned int h, unsigned int vrefresh,
>                         unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -207,31 +225,11 @@ static void mtk_postmask_stop(struct device *dev)
>         writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
>  }
>
> -static void mtk_dither_config(struct device *dev, unsigned int w,
> -                             unsigned int h, unsigned int vrefresh,
> -                             unsigned int bpc, struct cmdq_pkt *cmdq_pkt=
)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,=
 DISP_REG_DITHER_SIZE);
> -       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv-=
>regs,
> -                     DISP_REG_DITHER_CFG);
> -       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_=
DITHER_CFG,
> -                             DITHER_ENGINE_EN, cmdq_pkt);
> -}
> -
> -static void mtk_dither_start(struct device *dev)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
> -}
> -
> -static void mtk_dither_stop(struct device *dev)
> +static void mtk_ufoe_start(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
> +       writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
>  }
>
>  static const struct mtk_ddp_comp_funcs ddp_aal =3D {
> @@ -336,23 +334,23 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe =3D=
 {
>  };
>
>  static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] =3D {
> -       [MTK_DISP_OVL] =3D "ovl",
> -       [MTK_DISP_OVL_2L] =3D "ovl-2l",
> -       [MTK_DISP_RDMA] =3D "rdma",
> -       [MTK_DISP_WDMA] =3D "wdma",
> -       [MTK_DISP_COLOR] =3D "color",
> -       [MTK_DISP_CCORR] =3D "ccorr",
>         [MTK_DISP_AAL] =3D "aal",
> -       [MTK_DISP_GAMMA] =3D "gamma",
> +       [MTK_DISP_BLS] =3D "bls",
> +       [MTK_DISP_CCORR] =3D "ccorr",
> +       [MTK_DISP_COLOR] =3D "color",
>         [MTK_DISP_DITHER] =3D "dither",
> -       [MTK_DISP_UFOE] =3D "ufoe",
> -       [MTK_DSI] =3D "dsi",
> -       [MTK_DPI] =3D "dpi",
> -       [MTK_DISP_PWM] =3D "pwm",
> +       [MTK_DISP_GAMMA] =3D "gamma",
>         [MTK_DISP_MUTEX] =3D "mutex",
>         [MTK_DISP_OD] =3D "od",
> -       [MTK_DISP_BLS] =3D "bls",
> +       [MTK_DISP_OVL] =3D "ovl",
> +       [MTK_DISP_OVL_2L] =3D "ovl-2l",
>         [MTK_DISP_POSTMASK] =3D "postmask",
> +       [MTK_DISP_PWM] =3D "pwm",
> +       [MTK_DISP_RDMA] =3D "rdma",
> +       [MTK_DISP_UFOE] =3D "ufoe",
> +       [MTK_DISP_WDMA] =3D "wdma",
> +       [MTK_DPI] =3D "dpi",
> +       [MTK_DSI] =3D "dsi",
>  };
>
>  struct mtk_ddp_comp_match {
> @@ -510,12 +508,12 @@ int mtk_ddp_comp_init(struct device_node *node, str=
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
> index cd1dec6b4cdf..4c6a98662305 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -18,23 +18,23 @@ struct mtk_plane_state;
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
> -       MTK_DISP_POSTMASK,
> -       MTK_DISP_PWM,
>         MTK_DISP_MUTEX,
>         MTK_DISP_OD,
> -       MTK_DISP_BLS,
> +       MTK_DISP_OVL,
> +       MTK_DISP_OVL_2L,
> +       MTK_DISP_POSTMASK,
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
> index fa86485b4b9a..56ff8c57ef8f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -423,32 +423,14 @@ static const struct component_master_ops mtk_drm_op=
s =3D {
>  };
>
>  static const struct of_device_id mtk_ddp_comp_dt_ids[] =3D {
> -       { .compatible =3D "mediatek,mt2701-disp-ovl",
> -         .data =3D (void *)MTK_DISP_OVL },
> -       { .compatible =3D "mediatek,mt8167-disp-ovl",
> -         .data =3D (void *)MTK_DISP_OVL },
> -       { .compatible =3D "mediatek,mt8173-disp-ovl",
> -         .data =3D (void *)MTK_DISP_OVL },
> -       { .compatible =3D "mediatek,mt8183-disp-ovl",
> -         .data =3D (void *)MTK_DISP_OVL },
> -       { .compatible =3D "mediatek,mt8183-disp-ovl-2l",
> -         .data =3D (void *)MTK_DISP_OVL_2L },
> -       { .compatible =3D "mediatek,mt8192-disp-ovl",
> -         .data =3D (void *)MTK_DISP_OVL },
> -       { .compatible =3D "mediatek,mt8192-disp-ovl-2l",
> -         .data =3D (void *)MTK_DISP_OVL_2L },
> -       { .compatible =3D "mediatek,mt2701-disp-rdma",
> -         .data =3D (void *)MTK_DISP_RDMA },
> -       { .compatible =3D "mediatek,mt8167-disp-rdma",
> -         .data =3D (void *)MTK_DISP_RDMA },
> -       { .compatible =3D "mediatek,mt8173-disp-rdma",
> -         .data =3D (void *)MTK_DISP_RDMA },
> -       { .compatible =3D "mediatek,mt8183-disp-rdma",
> -         .data =3D (void *)MTK_DISP_RDMA },
> -       { .compatible =3D "mediatek,mt8192-disp-rdma",
> -         .data =3D (void *)MTK_DISP_RDMA },
> -       { .compatible =3D "mediatek,mt8173-disp-wdma",
> -         .data =3D (void *)MTK_DISP_WDMA },
> +       { .compatible =3D "mediatek,mt8167-disp-aal",
> +         .data =3D (void *)MTK_DISP_AAL},
> +       { .compatible =3D "mediatek,mt8173-disp-aal",
> +         .data =3D (void *)MTK_DISP_AAL},
> +       { .compatible =3D "mediatek,mt8183-disp-aal",
> +         .data =3D (void *)MTK_DISP_AAL},
> +       { .compatible =3D "mediatek,mt8192-disp-aal",
> +         .data =3D (void *)MTK_DISP_AAL},
>         { .compatible =3D "mediatek,mt8167-disp-ccorr",
>           .data =3D (void *)MTK_DISP_CCORR },
>         { .compatible =3D "mediatek,mt8183-disp-ccorr",
> @@ -461,40 +443,16 @@ static const struct of_device_id mtk_ddp_comp_dt_id=
s[] =3D {
>           .data =3D (void *)MTK_DISP_COLOR },
>         { .compatible =3D "mediatek,mt8173-disp-color",
>           .data =3D (void *)MTK_DISP_COLOR },
> -       { .compatible =3D "mediatek,mt8167-disp-aal",
> -         .data =3D (void *)MTK_DISP_AAL},
> -       { .compatible =3D "mediatek,mt8173-disp-aal",
> -         .data =3D (void *)MTK_DISP_AAL},
> -       { .compatible =3D "mediatek,mt8183-disp-aal",
> -         .data =3D (void *)MTK_DISP_AAL},
> -       { .compatible =3D "mediatek,mt8192-disp-aal",
> -         .data =3D (void *)MTK_DISP_AAL},
> +       { .compatible =3D "mediatek,mt8167-disp-dither",
> +         .data =3D (void *)MTK_DISP_DITHER },
> +       { .compatible =3D "mediatek,mt8183-disp-dither",
> +         .data =3D (void *)MTK_DISP_DITHER },
>         { .compatible =3D "mediatek,mt8167-disp-gamma",
>           .data =3D (void *)MTK_DISP_GAMMA, },
>         { .compatible =3D "mediatek,mt8173-disp-gamma",
>           .data =3D (void *)MTK_DISP_GAMMA, },
>         { .compatible =3D "mediatek,mt8183-disp-gamma",
>           .data =3D (void *)MTK_DISP_GAMMA, },
> -       { .compatible =3D "mediatek,mt8167-disp-dither",
> -         .data =3D (void *)MTK_DISP_DITHER },
> -       { .compatible =3D "mediatek,mt8183-disp-dither",
> -         .data =3D (void *)MTK_DISP_DITHER },
> -       { .compatible =3D "mediatek,mt8173-disp-ufoe",
> -         .data =3D (void *)MTK_DISP_UFOE },
> -       { .compatible =3D "mediatek,mt2701-dsi",
> -         .data =3D (void *)MTK_DSI },
> -       { .compatible =3D "mediatek,mt8167-dsi",
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
> @@ -507,16 +465,58 @@ static const struct of_device_id mtk_ddp_comp_dt_id=
s[] =3D {
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8192-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
> +       { .compatible =3D "mediatek,mt8173-disp-od",
> +         .data =3D (void *)MTK_DISP_OD },
> +       { .compatible =3D "mediatek,mt2701-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8167-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8173-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8183-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8192-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8183-disp-ovl-2l",
> +         .data =3D (void *)MTK_DISP_OVL_2L },
> +       { .compatible =3D "mediatek,mt8192-disp-ovl-2l",
> +         .data =3D (void *)MTK_DISP_OVL_2L },
> +       { .compatible =3D "mediatek,mt8192-disp-postmask",
> +         .data =3D (void *)MTK_DISP_POSTMASK },
>         { .compatible =3D "mediatek,mt2701-disp-pwm",
>           .data =3D (void *)MTK_DISP_BLS },
>         { .compatible =3D "mediatek,mt8167-disp-pwm",
>           .data =3D (void *)MTK_DISP_PWM },
>         { .compatible =3D "mediatek,mt8173-disp-pwm",
>           .data =3D (void *)MTK_DISP_PWM },
> -       { .compatible =3D "mediatek,mt8173-disp-od",
> -         .data =3D (void *)MTK_DISP_OD },
> -       { .compatible =3D "mediatek,mt8192-disp-postmask",
> -         .data =3D (void *)MTK_DISP_POSTMASK },
> +       { .compatible =3D "mediatek,mt2701-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8167-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8173-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8183-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8192-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8173-disp-ufoe",
> +         .data =3D (void *)MTK_DISP_UFOE },
> +       { .compatible =3D "mediatek,mt8173-disp-wdma",
> +         .data =3D (void *)MTK_DISP_WDMA },
> +       { .compatible =3D "mediatek,mt2701-dpi",
> +         .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt8167-dsi",
> +         .data =3D (void *)MTK_DSI },
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
> @@ -610,8 +610,8 @@ static int mtk_drm_probe(struct platform_device *pdev=
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

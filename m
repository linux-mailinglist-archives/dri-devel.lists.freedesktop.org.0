Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4203E4796
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD8F89C25;
	Mon,  9 Aug 2021 14:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2824E89C25
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:35:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8028F6105A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628519706;
 bh=hIK4mgBs/RprEhECquKI5Xejuw4RT3uMWqENATiDbbg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ra74GV5le/q2C7ofmWY5akDjLwTZadxjRPUe1way68FEjRRV+isiQJIh9SlSDxQID
 Tts4gpPy7Bw8q2jxCtc0eD1e+iNfAA88u4y0Te36oNyIA1wVKvpkR73CBroEs4TNtI
 2v5LIhHMOSP0OU7+N2ZOh57Tzcv+kGeMaw5LSBu/+Frtbat1rrPP4weGnybvYyKdYK
 x+5GOYnlZar89nPpkLnodegtETn4ZYxqLZLU9ytzRlScJs0fZaLuNa7XcBPb2VaQtd
 XjRPN9R4Ah75NhLKFPAG87Rx6UapxmeMAcDrkc1LQ7oMD58XoFscMk6peESvCOOzrI
 PuCRo3dTd6BkQ==
Received: by mail-ej1-f44.google.com with SMTP id h9so8523441ejs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:35:06 -0700 (PDT)
X-Gm-Message-State: AOAM530yTIyz908rot4MI5TpDq/W57BX61RQsQjheA8jsi/Dqww8r5Nw
 x2/Bfj+PTmzj0WEKklhKGSj13+sLafZdkpBx9Q==
X-Google-Smtp-Source: ABdhPJzqCIHg8FwcI7hpUTb1z1+YanrufvhWdQ+OlS2RaJLXJZlEtS2zj8canPSPiPdFwUriGESgKQ3GLVro7YuOTu4=
X-Received: by 2002:a17:907:2bc8:: with SMTP id
 gv8mr5927018ejc.310.1628519704800; 
 Mon, 09 Aug 2021 07:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210805205226.24880-1-jason-jh.lin@mediatek.com>
 <20210805205226.24880-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20210805205226.24880-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 22:34:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9EajkTgyjV2F3K+S-Y=yZUbRg2maE34e73=FOnJsgjRg@mail.gmail.com>
Message-ID: <CAAOTY_9EajkTgyjV2F3K+S-Y=yZUbRg2maE34e73=FOnJsgjRg@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] drm/mediatek: adjust to the alphabetic order for
 mediatek-drm
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
> 1. Adjust to the alphabetic order for the define, function, struct
>    and array in mediatek-drm driver
> 2. Remove the unsed define in mtk_drm_ddp_comp.c

Separate the 2nd part to another patch.

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 180 +++++++++-----------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  22 +--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  76 ++++-----
>  3 files changed, 133 insertions(+), 145 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e17fc4..328ee19f931e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -20,50 +20,36 @@
>  #include "mtk_drm_ddp_comp.h"
>  #include "mtk_drm_crtc.h"
>
> -#define DISP_OD_EN                             0x0000
> -#define DISP_OD_INTEN                          0x0008
> -#define DISP_OD_INTSTA                         0x000c
> -#define DISP_OD_CFG                            0x0020
> -#define DISP_OD_SIZE                           0x0030
> -#define DISP_DITHER_5                          0x0114
> -#define DISP_DITHER_7                          0x011c
> -#define DISP_DITHER_15                         0x013c
> -#define DISP_DITHER_16                         0x0140
> -
> -#define DISP_REG_UFO_START                     0x0000
> -
> -#define DISP_AAL_EN                            0x0000
> -#define DISP_AAL_SIZE                          0x0030
> +#define DISP_REG_AAL_EN                                0x0000
> +#define AAL_EN                                 BIT(0)
> +#define DISP_REG_AAL_SIZE                      0x0030
>
> -#define DISP_DITHER_EN                         0x0000
> +#define DISP_REG_DITHER_EN                     0x0000

I think we should not change the register name just for alphabetic
order. We list the register in the order of its address.
If you have another reason to change register name, add another patch
to do this.

Regards,
Chun-Kuang.

>  #define DITHER_EN                              BIT(0)
> -#define DISP_DITHER_CFG                                0x0020
> +#define DISP_REG_DITHER_CFG                    0x0020
>  #define DITHER_RELAY_MODE                      BIT(0)
>  #define DITHER_ENGINE_EN                       BIT(1)
> -#define DISP_DITHER_SIZE                       0x0030
> -
> -#define LUT_10BIT_MASK                         0x03ff
> -
> -#define OD_RELAYMODE                           BIT(0)
> -
> -#define UFO_BYPASS                             BIT(2)
> -
> -#define AAL_EN                                 BIT(0)
> -
>  #define DISP_DITHERING                         BIT(2)
> +#define DISP_REG_DITHER_SIZE                   0x0030
> +#define DISP_REG_DITHER_5                      0x0114
> +#define DISP_REG_DITHER_7                      0x011c
> +#define DISP_REG_DITHER_15                     0x013c
>  #define DITHER_LSB_ERR_SHIFT_R(x)              (((x) & 0x7) << 28)
> -#define DITHER_OVFLW_BIT_R(x)                  (((x) & 0x7) << 24)
>  #define DITHER_ADD_LSHIFT_R(x)                 (((x) & 0x7) << 20)
> -#define DITHER_ADD_RSHIFT_R(x)                 (((x) & 0x7) << 16)
>  #define DITHER_NEW_BIT_MODE                    BIT(0)
> +#define DISP_REG_DITHER_16                     0x0140
>  #define DITHER_LSB_ERR_SHIFT_B(x)              (((x) & 0x7) << 28)
> -#define DITHER_OVFLW_BIT_B(x)                  (((x) & 0x7) << 24)
>  #define DITHER_ADD_LSHIFT_B(x)                 (((x) & 0x7) << 20)
> -#define DITHER_ADD_RSHIFT_B(x)                 (((x) & 0x7) << 16)
>  #define DITHER_LSB_ERR_SHIFT_G(x)              (((x) & 0x7) << 12)
> -#define DITHER_OVFLW_BIT_G(x)                  (((x) & 0x7) << 8)
>  #define DITHER_ADD_LSHIFT_G(x)                 (((x) & 0x7) << 4)
> -#define DITHER_ADD_RSHIFT_G(x)                 (((x) & 0x7) << 0)
> +
> +#define DISP_REG_OD_EN                         0x0000
> +#define DISP_REG_OD_CFG                                0x0020
> +#define OD_RELAYMODE                           BIT(0)
> +#define DISP_REG_OD_SIZE                       0x0030
> +
> +#define DISP_REG_UFO_START                     0x0000
> +#define UFO_BYPASS                             BIT(2)
>
>  struct mtk_ddp_comp_dev {
>         struct clk *clk;
> @@ -116,20 +102,6 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, u=
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
>  void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *c=
mdq_reg,
>                            unsigned int bpc, unsigned int cfg,
>                            unsigned int dither_en, struct cmdq_pkt *cmdq_=
pkt)
> @@ -139,55 +111,35 @@ void mtk_dither_set_common(void __iomem *regs, stru=
ct cmdq_client_reg *cmdq_reg,
>                 return;
>
>         if (bpc >=3D MTK_MIN_BPC) {
> -               mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5)=
;
> -               mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7)=
;
> +               mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_REG_DITHE=
R_5);
> +               mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_REG_DITHE=
R_7);
>                 mtk_ddp_write(cmdq_pkt,
>                               DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
>                               DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
>                               DITHER_NEW_BIT_MODE,
> -                             cmdq_reg, regs, DISP_DITHER_15);
> +                             cmdq_reg, regs, DISP_REG_DITHER_15);
>                 mtk_ddp_write(cmdq_pkt,
>                               DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
>                               DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
>                               DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
>                               DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> -                             cmdq_reg, regs, DISP_DITHER_16);
> +                             cmdq_reg, regs, DISP_REG_DITHER_16);
>                 mtk_ddp_write(cmdq_pkt, dither_en, cmdq_reg, regs, cfg);
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
 DISP_OD_SIZE);
> -       mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs=
, DISP_OD_CFG);
> -       mtk_dither_set(dev, bpc, DISP_OD_CFG, cmdq_pkt);
> -}
> -
> -static void mtk_od_start(struct device *dev)
> +static int mtk_ddp_clk_enable(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel(1, priv->regs + DISP_OD_EN);
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
> @@ -196,7 +148,7 @@ static void mtk_aal_config(struct device *dev, unsign=
ed int w,
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_AAL_SIZE);
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_REG_AAL_SIZE);
>  }
>
>  static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state =
*state)
> @@ -210,14 +162,14 @@ static void mtk_aal_start(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel(AAL_EN, priv->regs + DISP_AAL_EN);
> +       writel(AAL_EN, priv->regs + DISP_REG_AAL_EN);
>  }
>
>  static void mtk_aal_stop(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
> +       writel_relaxed(0x0, priv->regs + DISP_REG_AAL_EN);
>  }
>
>  static void mtk_dither_config(struct device *dev, unsigned int w,
> @@ -226,9 +178,11 @@ static void mtk_dither_config(struct device *dev, un=
signed int w,
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,=
 DISP_DITHER_SIZE);
> -       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv-=
>regs, DISP_DITHER_CFG);
> -       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITH=
ER_CFG,
> +       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_DITHER_SIZE);
> +       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv-=
>regs,
> +                     DISP_REG_DITHER_CFG);
> +       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_=
DITHER_CFG,
>                               DITHER_ENGINE_EN, cmdq_pkt);
>  }
>
> @@ -236,14 +190,48 @@ static void mtk_dither_start(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel(DITHER_EN, priv->regs + DISP_DITHER_EN);
> +       writel(DITHER_EN, priv->regs + DISP_REG_DITHER_EN);
>  }
>
>  static void mtk_dither_stop(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
> +       writel_relaxed(0x0, priv->regs + DISP_REG_DITHER_EN);
> +}
> +
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
>  }
>
>  static const struct mtk_ddp_comp_funcs ddp_aal =3D {
> @@ -340,22 +328,22 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe =3D=
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
> @@ -509,12 +497,12 @@ int mtk_ddp_comp_init(struct device_node *node, str=
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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D53F1C7D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 17:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710876E99E;
	Thu, 19 Aug 2021 15:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4E16E99E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 15:17:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80F0660F11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629386258;
 bh=X6JA5+e74txWXGC9S13CmRQ9Ky6tdI+bAZlM2hq4IdI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YOtzpTYWAyW8KmFzHPv6q3hO3Yu5sLXQDx5Fq/tlzwdEBM7/JoEYY83AOBayeCsWT
 tK7TDvapGimCohv1F28t2ANaa7efa0dZbdGYnLCXSHAvbIMg2KyhAXoHwxXUlfcxmO
 HRgxPvgFedeVw57n70E8XkwYhFab0iGmpxNAPccoa0BENX//UWK4TY9w0nYIxi5pGV
 Ekl5zQ6ZKSfwssq+R26t1laAgY6REgY7bAQ7eYoOdevToQta8aHYyt1a7eSscBF3mY
 X17yJZDgCcvwXYCWwyADZ3zBGvJqST3fvzGOkovmRwu3Mf5peFK+2nl+OYPLf6paq9
 4WgkLNGuiEgvA==
Received: by mail-ed1-f44.google.com with SMTP id b7so9429913edu.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:17:38 -0700 (PDT)
X-Gm-Message-State: AOAM5303GJ0Io4pjYAMC2tAGjUGNyeopQ3ZzCldyn2yz7rHAuU1yyLJC
 v54gRz8guVZ8iVKMbwGX8fm+L9h6BRoV6My4OQ==
X-Google-Smtp-Source: ABdhPJwMZHeHyQr6YC2AB3rrBYIljr1DHkKV2ITc8O7ut3zrP7xMIFTkSZUB/B8GMmGKPm8vqLnU3Mydllg3jHqkURM=
X-Received: by 2002:a05:6402:2889:: with SMTP id
 eg9mr17306628edb.38.1629386257014; 
 Thu, 19 Aug 2021 08:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-10-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-10-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 19 Aug 2021 23:17:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__WFzVdNcS_dorSs+-H-C=wY6pd4T6R30hGBCJVtSbrdg@mail.gmail.com>
Message-ID: <CAAOTY__WFzVdNcS_dorSs+-H-C=wY6pd4T6R30hGBCJVtSbrdg@mail.gmail.com>
Subject: Re: [PATCH v8 09/13] drm/mediatek: rename the define of register
 offset
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
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add DISP_REG prefix for the define of register offset to
> make the difference from the define of register value.
>

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 57 +++++++++++----------
>  1 file changed, 29 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index aaa7450b3e2b..93beb980414f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -20,25 +20,25 @@
>  #include "mtk_drm_ddp_comp.h"
>  #include "mtk_drm_crtc.h"
>
> -#define DISP_OD_EN                             0x0000
> -#define DISP_OD_CFG                            0x0020
> -#define DISP_OD_SIZE                           0x0030
> -#define DISP_DITHER_5                          0x0114
> -#define DISP_DITHER_7                          0x011c
> -#define DISP_DITHER_15                         0x013c
> -#define DISP_DITHER_16                         0x0140
> +#define DISP_REG_OD_EN                         0x0000
> +#define DISP_REG_OD_CFG                                0x0020
> +#define DISP_REG_OD_SIZE                       0x0030
> +#define DISP_REG_DITHER_5                      0x0114
> +#define DISP_REG_DITHER_7                      0x011c
> +#define DISP_REG_DITHER_15                     0x013c
> +#define DISP_REG_DITHER_16                     0x0140
>
>  #define DISP_REG_UFO_START                     0x0000
>
> -#define DISP_AAL_EN                            0x0000
> -#define DISP_AAL_SIZE                          0x0030
> +#define DISP_REG_AAL_EN                                0x0000
> +#define DISP_REG_AAL_SIZE                      0x0030
>
> -#define DISP_DITHER_EN                         0x0000
> +#define DISP_REG_DITHER_EN                     0x0000
>  #define DITHER_EN                              BIT(0)
> -#define DISP_DITHER_CFG                                0x0020
> +#define DISP_REG_DITHER_CFG                    0x0020
>  #define DITHER_RELAY_MODE                      BIT(0)
>  #define DITHER_ENGINE_EN                       BIT(1)
> -#define DISP_DITHER_SIZE                       0x0030
> +#define DISP_REG_DITHER_SIZE                   0x0030
>
>  #define OD_RELAYMODE                           BIT(0)
>
> @@ -129,19 +129,19 @@ void mtk_dither_set_common(void __iomem *regs, stru=
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
> @@ -161,16 +161,16 @@ static void mtk_od_config(struct device *dev, unsig=
ned int w,
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_OD_SIZE);
> -       mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs=
, DISP_OD_CFG);
> -       mtk_dither_set(dev, bpc, DISP_OD_CFG, cmdq_pkt);
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_REG_OD_SIZE);
> +       mtk_ddp_write(cmdq_pkt, OD_RELAYMODE, &priv->cmdq_reg, priv->regs=
, DISP_REG_OD_CFG);
> +       mtk_dither_set(dev, bpc, DISP_REG_OD_CFG, cmdq_pkt);
>  }
>
>  static void mtk_od_start(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel(1, priv->regs + DISP_OD_EN);
> +       writel(1, priv->regs + DISP_REG_OD_EN);
>  }
>
>  static void mtk_ufoe_start(struct device *dev)
> @@ -186,7 +186,7 @@ static void mtk_aal_config(struct device *dev, unsign=
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
> @@ -200,14 +200,14 @@ static void mtk_aal_start(struct device *dev)
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
> @@ -216,9 +216,10 @@ static void mtk_dither_config(struct device *dev, un=
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
> +       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,=
 DISP_REG_DITHER_SIZE);
> +       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv-=
>regs,
> +                     DISP_REG_DITHER_CFG);
> +       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_=
DITHER_CFG,
>                               DITHER_ENGINE_EN, cmdq_pkt);
>  }
>
> @@ -226,14 +227,14 @@ static void mtk_dither_start(struct device *dev)
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
>  }
>
>  static const struct mtk_ddp_comp_funcs ddp_aal =3D {
> --
> 2.18.0
>

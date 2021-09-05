Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5989E400DEE
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 06:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6C389E69;
	Sun,  5 Sep 2021 04:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEBD89E69
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:20:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1366961039
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630815627;
 bh=Q1rrbt4PNvVf6BTflJKNru3bgmt/WMTLufhJBqL4l24=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qbt9CLYZhD93BYZUSFhugRl/aLVIXGy9QS+bGTma6D5n2TcnMRzeOp2k+o9iRHE+/
 TM8hbA6RQVogNrf0Lo8jwRhi1I6alVB7w+dqt8eMr/cQXpxSTL0ZkkkhOWA86QDI53
 Tzf9ZbEDDsDYFhCaLDGyyVwAJgS9DB1le0PgDTa/+l1RlZYqojID9pFhjmOrd1lJJo
 mpSB5XMxu46H76h2d+/3Kz/6Diww6V9y1GzYXoCdSTOEOvqlKZzjJ0mWM7eq+KQYJl
 NDijY0kayGBdl3PGVwK0789d/XhqYaIuqxVd6bkiWVqBLNYkH6wVUq2eRn/QuVl+zD
 rWl7yN+15gvaA==
Received: by mail-ej1-f51.google.com with SMTP id ia27so6346060ejc.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 21:20:26 -0700 (PDT)
X-Gm-Message-State: AOAM532S47f6SL0iBv/430Ja+eGweCgIcBd29cO/NoaILg3RkebJQH8Y
 U3iQma7igokXpzP0N/6YurW3XYr2HWQOQGhfyQ==
X-Google-Smtp-Source: ABdhPJxed5RGanQNDFaESDjcDhcHbuVONG17N5+WfAqpi1LyfvZa7WzPxHSs5g0ujPzWIoy0reAKlLNp3d4nSfpJCTI=
X-Received: by 2002:a17:906:84d0:: with SMTP id
 f16mr7263312ejy.6.1630815625571; 
 Sat, 04 Sep 2021 21:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-11-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-11-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Sep 2021 12:20:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8fhy5cnBck_26nZEvDzb=js1BqnP+fsi=qrHA+8hr+sw@mail.gmail.com>
Message-ID: <CAAOTY_8fhy5cnBck_26nZEvDzb=js1BqnP+fsi=qrHA+8hr+sw@mail.gmail.com>
Subject: Re: [PATCH v9 10/14] drm/mediatek: rename the define of register
 offset
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, fshao@chromium.org, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=882=
5=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8810:48=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add DISP_REG prefix for the define of register offset to
> make the difference from the define of register value.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> rebase on [1] series
> [1] drm/mediatek: Separate aal module
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5164=
63
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 47 +++++++++++----------
>  1 file changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 484080a0defa..0b5ca9025b3a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -20,22 +20,22 @@
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
> @@ -124,19 +124,19 @@ void mtk_dither_set_common(void __iomem *regs, stru=
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
> @@ -156,16 +156,16 @@ static void mtk_od_config(struct device *dev, unsig=
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
> @@ -181,9 +181,10 @@ static void mtk_dither_config(struct device *dev, un=
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
> @@ -191,14 +192,14 @@ static void mtk_dither_start(struct device *dev)
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

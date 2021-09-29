Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512BD41C7B1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 17:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C0B6EAAC;
	Wed, 29 Sep 2021 15:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE5D6EAAB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:00:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 724DA61406
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927656;
 bh=BdXjKV+aFenS6POtFw0SsKJoSLiKnxoBURopvY9ieNM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mFL+i1xFYpAflB6ulPaG2cgGZTmY1x2Zh6qtW7lQkELAj3t2xfb69tmAoqMgWV1mQ
 0qAntVqVWchIEKszQxczoIbeSIkSWN5tdSAsEZ/sB+16EcFi6gbWxPajeASYREMk9D
 j7vTp3e3WScj0lHVTSgBj7dspWGd0ki8e8i0S3JzfJEj07h4pEjZwCAa5mPLwQ03hV
 pPEAWJ667ZlHH2PSzCA2pIoeMeM1n34ysXDz2MEEaKlDXtqq930pgSvYmYTf4OHMoV
 MPo5GlU9ExHlylLQBEX0T84MTAt1gkeFXMYfzzQT8fHyKyrICA88vVyLSzZfLDPCQw
 gShwFPdi3Z5YA==
Received: by mail-ed1-f51.google.com with SMTP id v18so9692031edc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:00:56 -0700 (PDT)
X-Gm-Message-State: AOAM531DjzFd7GgHrOnzHKD5GVjqgXxjsYfiUiDJoRJQBt54Wm7rT3Ps
 /UmlEcZriFlT1hHfrbLsK/U6vEiHGAZ6pKvrEQ==
X-Google-Smtp-Source: ABdhPJxmLCN5qNAcn3IGKwUxanXEyv2YpPaqzQeK8QMrZJFI1LfT/BrZIEWpi/kj7mchlgBzDo9vmU8KnFrDN0dBNo0=
X-Received: by 2002:a50:e081:: with SMTP id f1mr413699edl.65.1632927575524;
 Wed, 29 Sep 2021 07:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-13-jason-jh.lin@mediatek.com>
In-Reply-To: <20210921155218.10387-13-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:59:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-0=B5GN2evtJcJMguGYnFw5LtEk-LJ=_o_Fb3m840g5w@mail.gmail.com>
Message-ID: <CAAOTY_-0=B5GN2evtJcJMguGYnFw5LtEk-LJ=_o_Fb3m840g5w@mail.gmail.com>
Subject: Re: [PATCH v11 12/16] drm/mediatek: rename the define of register
 offset
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
> Add DISP_REG prefix for the define of register offset to
> make the difference from the define of register value.

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
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 61 +++++++++++----------
>  1 file changed, 31 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 839ffae3019c..b46bc0f5d1a5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -20,32 +20,32 @@
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
>  #define UFO_BYPASS                             BIT(2)
>
> -#define DISP_POSTMASK_EN                       0x0000
> +#define DISP_REG_POSTMASK_EN                   0x0000
>  #define POSTMASK_EN                            BIT(0)
> -#define DISP_POSTMASK_CFG                      0x0020
> +#define DISP_REG_POSTMASK_CFG                  0x0020
>  #define POSTMASK_RELAY_MODE                    BIT(0)
> -#define DISP_POSTMASK_SIZE                     0x0030
> +#define DISP_REG_POSTMASK_SIZE                 0x0030
>
>  #define DISP_DITHERING                         BIT(2)
>  #define DITHER_LSB_ERR_SHIFT_R(x)              (((x) & 0x7) << 28)
> @@ -130,19 +130,19 @@ void mtk_dither_set_common(void __iomem *regs, stru=
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
> @@ -162,16 +162,16 @@ static void mtk_od_config(struct device *dev, unsig=
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
> @@ -188,23 +188,23 @@ static void mtk_postmask_config(struct device *dev,=
 unsigned int w,
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
>         mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> -                     DISP_POSTMASK_SIZE);
> +                     DISP_REG_POSTMASK_SIZE);
>         mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
> -                     priv->regs, DISP_POSTMASK_CFG);
> +                     priv->regs, DISP_REG_POSTMASK_CFG);
>  }
>
>  static void mtk_postmask_start(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
> +       writel(POSTMASK_EN, priv->regs + DISP_REG_POSTMASK_EN);
>  }
>
>  static void mtk_postmask_stop(struct device *dev)
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
> +       writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
>  }
>
>  static void mtk_dither_config(struct device *dev, unsigned int w,
> @@ -213,9 +213,10 @@ static void mtk_dither_config(struct device *dev, un=
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
> @@ -223,14 +224,14 @@ static void mtk_dither_start(struct device *dev)
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

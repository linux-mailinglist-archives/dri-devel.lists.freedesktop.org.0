Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA1400E1E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 06:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E31589ECB;
	Sun,  5 Sep 2021 04:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7256C89ECB
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:28:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E68360FE6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 04:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630816112;
 bh=oXF2m8ZN/+qfmgExG/IQX/SByhUyc1c6YLDBAKpYt6o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a06pf4x+7/IFm9agBQ0z2F+ILrKQMCf0XUrNrrupuHFu2uwPbUl92zHUcteO63GQM
 jlPjzHXZJcqiDTrqxT9iB5VEHVnE0mATTxbqY6/kbyu1k3LIRDqtnjL03/NNWmCoSk
 OoSFdDcsiZr32uH3ad0beJUCSns8n1F8zMfRKhGg69zTiIolbc+vG2PiTgeRKYKxdy
 djPukVK+DzbSyzvOCv5kjUYuvNZO5zYijrsfTeegga8Xcat8Q0fJnV5X8qETfrzV4t
 Sy6NWcXGc16eR3YTRdx5rWIdyPzanqPaVSqAujd2vIDAoY0JMPlrmLts6p4bV6ZMCs
 QrvlUY/NiYfOw==
Received: by mail-ej1-f47.google.com with SMTP id n27so6387785eja.5
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 21:28:32 -0700 (PDT)
X-Gm-Message-State: AOAM532R1YGrjbzWvCrPo76ghIxY4Mg1PeQ0YkGXM88TJXL02Fl1kKcJ
 1dMk+3MkFsLeHh1PwA6EIWI2QCcRt0mhigc5Bw==
X-Google-Smtp-Source: ABdhPJxENNixysusXbSBhuNA84yWBKYK1t4rBhOx+OYKgpiPg4tes+GHj4Xv3atowVusUcE7eqSgQppFSdE/CcHpQgM=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr7289338ejd.241.1630816110765; 
 Sat, 04 Sep 2021 21:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
 <20210825144833.7757-13-jason-jh.lin@mediatek.com>
In-Reply-To: <20210825144833.7757-13-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Sep 2021 12:28:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8EZKJ48Oq6g9uL_cakyuaMmT7h0VqG=QORYVOxqzYriw@mail.gmail.com>
Message-ID: <CAAOTY_8EZKJ48Oq6g9uL_cakyuaMmT7h0VqG=QORYVOxqzYriw@mail.gmail.com>
Subject: Re: [PATCH v9 12/14] drm/mediatek: add DSC support for mediatek-drm
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
> rebase on [1] series
> [1] drm/mediatek: Separate aal module
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5164=
63
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 47 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index ef0d2066fae1..0e3ecf97a6fb 100644
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
> @@ -175,6 +181,36 @@ static void mtk_dither_set(struct device *dev, unsig=
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
> @@ -238,6 +274,14 @@ static const struct mtk_ddp_comp_funcs ddp_dpi =3D {
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
> @@ -299,6 +343,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_C=
OMP_TYPE_MAX] =3D {
>         [MTK_DISP_CCORR] =3D "ccorr",
>         [MTK_DISP_COLOR] =3D "color",
>         [MTK_DISP_DITHER] =3D "dither",
> +       [MTK_DISP_DSC] =3D "dsc",
>         [MTK_DISP_GAMMA] =3D "gamma",
>         [MTK_DISP_MUTEX] =3D "mutex",
>         [MTK_DISP_OD] =3D "od",
> @@ -328,6 +373,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matche=
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

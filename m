Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA04451A88
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 00:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8C66E578;
	Mon, 15 Nov 2021 23:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338B76E578
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:36:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFB7561A40
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019406;
 bh=cctpZu5Y6zldBTQH9BYecYmoFJAIKu/tEYPP+N2ifkg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BUm+Or9GZUEVDVDQzn5Avd+95mdVhm4Ue+D7E4a+p7ajRCd5/l6Ays9aEhEEd8+Gg
 thA2uLAZJD9ZVWzlqZvL/WFoGabVcwiynnUswgq40HjdebxPBO+XwPoQhDa6wey8rJ
 zrrr/oLf7UjiMhWh7+3f0uSpgbnTofAjQLfpck/naZHMhtCvwsfMmhDMEB+e7srKqO
 k0Rdc5GNWGFGIQPC4ZJ9oh++gp9Rq/XyTpzNfVynSZBEU/5rJxDQLuBGyx2yr/8Utv
 fnG6HhVuGI2AMXi7ZdPmPLwMlw8uv5D+NBZxqc7AeXUMy9EO1MVcPDJV7fnDwCnHbD
 UtbAx+QWfJyWQ==
Received: by mail-ed1-f41.google.com with SMTP id w1so13072625edc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 15:36:46 -0800 (PST)
X-Gm-Message-State: AOAM530hzA+WTPJchD9crYlRc0960Kh94zF6CXsR+XVYMGKX0+LLHpNw
 nHoRC6BO/XHukca+bimIZ21KGoCE4imwgrKijA==
X-Google-Smtp-Source: ABdhPJxBF8uXp/soiWJMvx1BBMQh38TTql9xsdOjCMlzFG/WKZ34mL89epAie4tWiEUIrY4Yg2UkZ8zuSWFa0MXJF2Y=
X-Received: by 2002:aa7:c415:: with SMTP id j21mr3624586edq.357.1637019405373; 
 Mon, 15 Nov 2021 15:36:45 -0800 (PST)
MIME-Version: 1.0
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-3-yongqiang.niu@mediatek.com>
In-Reply-To: <20210930155222.5861-3-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 16 Nov 2021 07:36:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9R+=VPXMLEo0QTuzJSePyVNi6hmHUoCe8ctbKYKLDU1g@mail.gmail.com>
Message-ID: <CAAOTY_9R+=VPXMLEo0QTuzJSePyVNi6hmHUoCe8ctbKYKLDU1g@mail.gmail.com>
Subject: Re: [PATCH v10, 2/5] drm/mediatek: add component POSTMASK
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:52=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> This patch add component POSTMASK.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  2 files changed, 73 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 4a2abcf3e5f9..89170ad825fd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -62,6 +62,12 @@
>  #define DITHER_ADD_LSHIFT_G(x)                 (((x) & 0x7) << 4)
>  #define DITHER_ADD_RSHIFT_G(x)                 (((x) & 0x7) << 0)
>
> +#define DISP_POSTMASK_EN                       0x0000
> +#define POSTMASK_EN                                    BIT(0)
> +#define DISP_POSTMASK_CFG                      0x0020
> +#define POSTMASK_RELAY_MODE                            BIT(0)
> +#define DISP_POSTMASK_SIZE                     0x0030
> +
>  struct mtk_ddp_comp_dev {
>         struct clk *clk;
>         void __iomem *regs;
> @@ -214,6 +220,32 @@ static void mtk_dither_stop(struct device *dev)
>         writel_relaxed(0x0, priv->regs + DISP_DITHER_EN);
>  }
>
> +static void mtk_postmask_config(struct device *dev, unsigned int w,
> +                               unsigned int h, unsigned int vrefresh,
> +                               unsigned int bpc, struct cmdq_pkt *cmdq_p=
kt)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +                     DISP_POSTMASK_SIZE);
> +       mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
> +                     priv->regs, DISP_POSTMASK_CFG);
> +}
> +
> +static void mtk_postmask_start(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
> +}
> +
> +static void mtk_postmask_stop(struct device *dev)
> +{
> +       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> +
> +       writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
> +}
> +
>  static const struct mtk_ddp_comp_funcs ddp_aal =3D {
>         .clk_enable =3D mtk_aal_clk_enable,
>         .clk_disable =3D mtk_aal_clk_disable,
> @@ -289,6 +321,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl =3D {
>         .bgclr_in_off =3D mtk_ovl_bgclr_in_off,
>  };
>
> +static const struct mtk_ddp_comp_funcs ddp_postmask =3D {
> +       .clk_enable =3D mtk_ddp_clk_enable,
> +       .clk_disable =3D mtk_ddp_clk_disable,
> +       .config =3D mtk_postmask_config,
> +       .start =3D mtk_postmask_start,
> +       .stop =3D mtk_postmask_stop,
> +};
> +
>  static const struct mtk_ddp_comp_funcs ddp_rdma =3D {
>         .clk_enable =3D mtk_rdma_clk_enable,
>         .clk_disable =3D mtk_rdma_clk_disable,
> @@ -324,6 +364,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_C=
OMP_TYPE_MAX] =3D {
>         [MTK_DISP_MUTEX] =3D "mutex",
>         [MTK_DISP_OD] =3D "od",
>         [MTK_DISP_BLS] =3D "bls",
> +       [MTK_DISP_POSTMASK] =3D "postmask",
>  };
>
>  struct mtk_ddp_comp_match {
> @@ -333,36 +374,37 @@ struct mtk_ddp_comp_match {
>  };
>
>  static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_=
MAX] =3D {
> -       [DDP_COMPONENT_AAL0]    =3D { MTK_DISP_AAL,       0, &ddp_aal },
> -       [DDP_COMPONENT_AAL1]    =3D { MTK_DISP_AAL,       1, &ddp_aal },
> -       [DDP_COMPONENT_BLS]     =3D { MTK_DISP_BLS,       0, NULL },
> -       [DDP_COMPONENT_CCORR]   =3D { MTK_DISP_CCORR,     0, &ddp_ccorr }=
,
> -       [DDP_COMPONENT_COLOR0]  =3D { MTK_DISP_COLOR,     0, &ddp_color }=
,
> -       [DDP_COMPONENT_COLOR1]  =3D { MTK_DISP_COLOR,     1, &ddp_color }=
,
> -       [DDP_COMPONENT_DITHER]  =3D { MTK_DISP_DITHER,    0, &ddp_dither =
},
> -       [DDP_COMPONENT_DPI0]    =3D { MTK_DPI,            0, &ddp_dpi },
> -       [DDP_COMPONENT_DPI1]    =3D { MTK_DPI,            1, &ddp_dpi },
> -       [DDP_COMPONENT_DSI0]    =3D { MTK_DSI,            0, &ddp_dsi },
> -       [DDP_COMPONENT_DSI1]    =3D { MTK_DSI,            1, &ddp_dsi },
> -       [DDP_COMPONENT_DSI2]    =3D { MTK_DSI,            2, &ddp_dsi },
> -       [DDP_COMPONENT_DSI3]    =3D { MTK_DSI,            3, &ddp_dsi },
> -       [DDP_COMPONENT_GAMMA]   =3D { MTK_DISP_GAMMA,     0, &ddp_gamma }=
,
> -       [DDP_COMPONENT_OD0]     =3D { MTK_DISP_OD,        0, &ddp_od },
> -       [DDP_COMPONENT_OD1]     =3D { MTK_DISP_OD,        1, &ddp_od },
> -       [DDP_COMPONENT_OVL0]    =3D { MTK_DISP_OVL,       0, &ddp_ovl },
> -       [DDP_COMPONENT_OVL1]    =3D { MTK_DISP_OVL,       1, &ddp_ovl },
> -       [DDP_COMPONENT_OVL_2L0] =3D { MTK_DISP_OVL_2L,    0, &ddp_ovl },
> -       [DDP_COMPONENT_OVL_2L1] =3D { MTK_DISP_OVL_2L,    1, &ddp_ovl },
> -       [DDP_COMPONENT_OVL_2L2] =3D { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> -       [DDP_COMPONENT_PWM0]    =3D { MTK_DISP_PWM,       0, NULL },
> -       [DDP_COMPONENT_PWM1]    =3D { MTK_DISP_PWM,       1, NULL },
> -       [DDP_COMPONENT_PWM2]    =3D { MTK_DISP_PWM,       2, NULL },
> -       [DDP_COMPONENT_RDMA0]   =3D { MTK_DISP_RDMA,      0, &ddp_rdma },
> -       [DDP_COMPONENT_RDMA1]   =3D { MTK_DISP_RDMA,      1, &ddp_rdma },
> -       [DDP_COMPONENT_RDMA2]   =3D { MTK_DISP_RDMA,      2, &ddp_rdma },
> -       [DDP_COMPONENT_UFOE]    =3D { MTK_DISP_UFOE,      0, &ddp_ufoe },
> -       [DDP_COMPONENT_WDMA0]   =3D { MTK_DISP_WDMA,      0, NULL },
> -       [DDP_COMPONENT_WDMA1]   =3D { MTK_DISP_WDMA,      1, NULL },
> +       [DDP_COMPONENT_AAL0]            =3D { MTK_DISP_AAL,       0, &ddp=
_aal },
> +       [DDP_COMPONENT_AAL1]            =3D { MTK_DISP_AAL,       1, &ddp=
_aal },
> +       [DDP_COMPONENT_BLS]             =3D { MTK_DISP_BLS,       0, NULL=
 },
> +       [DDP_COMPONENT_CCORR]           =3D { MTK_DISP_CCORR,     0, &ddp=
_ccorr },
> +       [DDP_COMPONENT_COLOR0]          =3D { MTK_DISP_COLOR,     0, &ddp=
_color },
> +       [DDP_COMPONENT_COLOR1]          =3D { MTK_DISP_COLOR,     1, &ddp=
_color },
> +       [DDP_COMPONENT_DITHER]          =3D { MTK_DISP_DITHER,    0, &ddp=
_dither },
> +       [DDP_COMPONENT_DPI0]            =3D { MTK_DPI,            0, &ddp=
_dpi },
> +       [DDP_COMPONENT_DPI1]            =3D { MTK_DPI,            1, &ddp=
_dpi },
> +       [DDP_COMPONENT_DSI0]            =3D { MTK_DSI,            0, &ddp=
_dsi },
> +       [DDP_COMPONENT_DSI1]            =3D { MTK_DSI,            1, &ddp=
_dsi },
> +       [DDP_COMPONENT_DSI2]            =3D { MTK_DSI,            2, &ddp=
_dsi },
> +       [DDP_COMPONENT_DSI3]            =3D { MTK_DSI,            3, &ddp=
_dsi },
> +       [DDP_COMPONENT_GAMMA]           =3D { MTK_DISP_GAMMA,     0, &ddp=
_gamma },
> +       [DDP_COMPONENT_OD0]             =3D { MTK_DISP_OD,        0, &ddp=
_od },
> +       [DDP_COMPONENT_OD1]             =3D { MTK_DISP_OD,        1, &ddp=
_od },
> +       [DDP_COMPONENT_OVL0]            =3D { MTK_DISP_OVL,       0, &ddp=
_ovl },
> +       [DDP_COMPONENT_OVL1]            =3D { MTK_DISP_OVL,       1, &ddp=
_ovl },
> +       [DDP_COMPONENT_OVL_2L0]         =3D { MTK_DISP_OVL_2L,    0, &ddp=
_ovl },
> +       [DDP_COMPONENT_OVL_2L1]         =3D { MTK_DISP_OVL_2L,    1, &ddp=
_ovl },
> +       [DDP_COMPONENT_OVL_2L2]         =3D { MTK_DISP_OVL_2L,    2, &ddp=
_ovl },
> +       [DDP_COMPONENT_POSTMASK0]       =3D { MTK_DISP_POSTMASK,  0, &ddp=
_postmask },
> +       [DDP_COMPONENT_PWM0]            =3D { MTK_DISP_PWM,       0, NULL=
 },
> +       [DDP_COMPONENT_PWM1]            =3D { MTK_DISP_PWM,       1, NULL=
 },
> +       [DDP_COMPONENT_PWM2]            =3D { MTK_DISP_PWM,       2, NULL=
 },
> +       [DDP_COMPONENT_RDMA0]           =3D { MTK_DISP_RDMA,      0, &ddp=
_rdma },
> +       [DDP_COMPONENT_RDMA1]           =3D { MTK_DISP_RDMA,      1, &ddp=
_rdma },
> +       [DDP_COMPONENT_RDMA2]           =3D { MTK_DISP_RDMA,      2, &ddp=
_rdma },
> +       [DDP_COMPONENT_UFOE]            =3D { MTK_DISP_UFOE,      0, &ddp=
_ufoe },
> +       [DDP_COMPONENT_WDMA0]           =3D { MTK_DISP_WDMA,      0, NULL=
 },
> +       [DDP_COMPONENT_WDMA1]           =3D { MTK_DISP_WDMA,      1, NULL=
 },
>  };
>
>  static bool mtk_drm_find_comp_in_ddp(struct device *dev,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5..cd1dec6b4cdf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_UFOE,
>         MTK_DSI,
>         MTK_DPI,
> +       MTK_DISP_POSTMASK,
>         MTK_DISP_PWM,
>         MTK_DISP_MUTEX,
>         MTK_DISP_OD,
> --
> 2.25.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F263F1C63
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 17:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06746E8F1;
	Thu, 19 Aug 2021 15:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33936E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 15:13:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B713C60200
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 15:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629385989;
 bh=avFafS+0hpaQQk6mPHzThozV0RH3dmHPb8yaXz1JGwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i69PXwz2rsr0LHo/0K4y57GaS3qaE5cFbAle0K5eTdzLJWxG6MXNxxr4b3huPF882
 Xg/4SN4yeUVi8xZzY0UYodh89abEDfWPsjCX1Ia7Yy6mOA9Mog7JYGhp/ZTfXVYvC3
 vfWUtyJEFeurJ0kk+ofxkoukl7Z5w8zazNFcJKncsRtMcS/LdwPVc1YzMhAuYPkBm5
 yYSI3LwtVJ2DSZ2toxaa/OI1zTTrjOaBZSYsc4/nkArPTHd731EVIOSKkjUe1fdY0+
 uoiIOdhC4jixSdSoo4rMxD/SIZBJAyFG8J6ybshmBs+8nvPztidQU1mCdFr7DNgyBk
 W5XkbSJwmLQZQ==
Received: by mail-ej1-f54.google.com with SMTP id x11so13776222ejv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:13:09 -0700 (PDT)
X-Gm-Message-State: AOAM531wo9MmaOUW739Eo7aXyjiCv5Bqa07GoVhKYY45zSR4e3CCRvrI
 L/XUtMaoeRiseCAfq3S4wvqoKNnfSx85bgPHIQ==
X-Google-Smtp-Source: ABdhPJy9KEn3xJr+m8zgK+vV+5SYjTxpCaVDiDJ5yRtF2PmthQY0gfJ9m6z+ks6IwnNF07Dg9yz5smlUQKp2ssdX798=
X-Received: by 2002:a17:906:b18e:: with SMTP id
 w14mr16322744ejy.63.1629385988239; 
 Thu, 19 Aug 2021 08:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-8-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 19 Aug 2021 23:12:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8xGRJmFaEEsZoJs22zfqm+CO0pFesThwK6K0bknNBtoQ@mail.gmail.com>
Message-ID: <CAAOTY_8xGRJmFaEEsZoJs22zfqm+CO0pFesThwK6K0bknNBtoQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/13] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
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
> Add mtk-mutex support for mt8195 vdosys0.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 98 +++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-=
mutex.c
> index 2e4bcc300576..c177156ee2fa 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -17,6 +17,9 @@
>  #define MT8183_MUTEX0_MOD0                     0x30
>  #define MT8183_MUTEX0_SOF0                     0x2c
>
> +#define MT8195_DISP_MUTEX0_MOD0                        0x30
> +#define MT8195_DISP_MUTEX0_SOF                 0x2c
> +
>  #define DISP_REG_MUTEX_EN(n)                   (0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)                      (0x24 + 0x20 * (n))
>  #define DISP_REG_MUTEX_RST(n)                  (0x28 + 0x20 * (n))
> @@ -67,6 +70,36 @@
>  #define MT8173_MUTEX_MOD_DISP_PWM1             24
>  #define MT8173_MUTEX_MOD_DISP_OD               25
>
> +#define MT8195_MUTEX_MOD_DISP_OVL0             0
> +#define MT8195_MUTEX_MOD_DISP_WDMA0            1
> +#define MT8195_MUTEX_MOD_DISP_RDMA0            2
> +#define MT8195_MUTEX_MOD_DISP_COLOR0           3
> +#define MT8195_MUTEX_MOD_DISP_CCORR0           4
> +#define MT8195_MUTEX_MOD_DISP_AAL0             5
> +#define MT8195_MUTEX_MOD_DISP_GAMMA0           6
> +#define MT8195_MUTEX_MOD_DISP_DITHER0          7
> +#define MT8195_MUTEX_MOD_DISP_DSI0             8
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0  9
> +#define MT8195_MUTEX_MOD_DISP_OVL1             10
> +#define MT8195_MUTEX_MOD_DISP_WDMA1            11
> +#define MT8195_MUTEX_MOD_DISP_RDMA1            12
> +#define MT8195_MUTEX_MOD_DISP_COLOR1           13
> +#define MT8195_MUTEX_MOD_DISP_CCORR1           14
> +#define MT8195_MUTEX_MOD_DISP_AAL1             15
> +#define MT8195_MUTEX_MOD_DISP_GAMMA1           16
> +#define MT8195_MUTEX_MOD_DISP_DITHER1          17
> +#define MT8195_MUTEX_MOD_DISP_DSI1             18
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1  19
> +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE                20
> +#define MT8195_MUTEX_MOD_DISP_DP_INTF0         21
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0   22
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1   23
> +#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2   24
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3   25
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4   26
> +#define MT8195_MUTEX_MOD_DISP_PWM0             27
> +#define MT8195_MUTEX_MOD_DISP_PWM1             28
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2             10
>  #define MT2712_MUTEX_MOD_DISP_OVL0             11
>  #define MT2712_MUTEX_MOD_DISP_OVL1             12
> @@ -101,12 +134,27 @@
>  #define MT2712_MUTEX_SOF_DSI3                  6
>  #define MT8167_MUTEX_SOF_DPI0                  2
>  #define MT8167_MUTEX_SOF_DPI1                  3
> +
>  #define MT8183_MUTEX_SOF_DSI0                  1
>  #define MT8183_MUTEX_SOF_DPI0                  2
>
>  #define MT8183_MUTEX_EOF_DSI0                  (MT8183_MUTEX_SOF_DSI0 <<=
 6)
>  #define MT8183_MUTEX_EOF_DPI0                  (MT8183_MUTEX_SOF_DPI0 <<=
 6)
>
> +#define MT8195_MUTEX_SOF_DSI0                  1
> +#define MT8195_MUTEX_SOF_DSI1                  2
> +#define MT8195_MUTEX_SOF_DP_INTF0              3
> +#define MT8195_MUTEX_SOF_DP_INTF1              4
> +#define MT8195_MUTEX_SOF_DPI0                  6 /* for HDMI_TX */
> +#define MT8195_MUTEX_SOF_DPI1                  5 /* for digital video ou=
t */
> +
> +#define MT8195_MUTEX_EOF_DSI0                  (MT8195_MUTEX_SOF_DSI0 <<=
 7)
> +#define MT8195_MUTEX_EOF_DSI1                  (MT8195_MUTEX_SOF_DSI1 <<=
 7)
> +#define MT8195_MUTEX_EOF_DP_INTF0              (MT8195_MUTEX_SOF_DP_INTF=
0 << 7)
> +#define MT8195_MUTEX_EOF_DP_INTF1              (MT8195_MUTEX_SOF_DP_INTF=
1 << 7)
> +#define MT8195_MUTEX_EOF_DPI0                  (MT8195_MUTEX_SOF_DPI0 <<=
 7)
> +#define MT8195_MUTEX_EOF_DPI1                  (MT8195_MUTEX_SOF_DPI1 <<=
 7)
> +
>  struct mtk_mutex {
>         int id;
>         bool claimed;
> @@ -120,6 +168,9 @@ enum mtk_mutex_sof_id {
>         MUTEX_SOF_DPI1,
>         MUTEX_SOF_DSI2,
>         MUTEX_SOF_DSI3,
> +       MUTEX_SOF_DP_INTF0,
> +       MUTEX_SOF_DP_INTF1,
> +       DDP_MUTEX_SOF_MAX,
>  };
>
>  struct mtk_mutex_data {
> @@ -214,7 +265,23 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPO=
NENT_ID_MAX] =3D {
>         [DDP_COMPONENT_WDMA0] =3D MT8183_MUTEX_MOD_DISP_WDMA0,
>  };
>
> -static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] =3D {
> +static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] =3D {
> +       [DDP_COMPONENT_OVL0] =3D MT8195_MUTEX_MOD_DISP_OVL0,
> +       [DDP_COMPONENT_WDMA0] =3D MT8195_MUTEX_MOD_DISP_WDMA0,
> +       [DDP_COMPONENT_RDMA0] =3D MT8195_MUTEX_MOD_DISP_RDMA0,
> +       [DDP_COMPONENT_COLOR0] =3D MT8195_MUTEX_MOD_DISP_COLOR0,
> +       [DDP_COMPONENT_CCORR] =3D MT8195_MUTEX_MOD_DISP_CCORR0,
> +       [DDP_COMPONENT_AAL0] =3D MT8195_MUTEX_MOD_DISP_AAL0,
> +       [DDP_COMPONENT_GAMMA] =3D MT8195_MUTEX_MOD_DISP_GAMMA0,
> +       [DDP_COMPONENT_DITHER] =3D MT8195_MUTEX_MOD_DISP_DITHER0,
> +       [DDP_COMPONENT_MERGE0] =3D MT8195_MUTEX_MOD_DISP_VPP_MERGE,
> +       [DDP_COMPONENT_DSC0] =3D MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
> +       [DDP_COMPONENT_DSI0] =3D MT8195_MUTEX_MOD_DISP_DSI0,
> +       [DDP_COMPONENT_PWM0] =3D MT8195_MUTEX_MOD_DISP_PWM0,
> +       [DDP_COMPONENT_DP_INTF0] =3D MT8195_MUTEX_MOD_DISP_DP_INTF0,
> +};
> +
> +static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] =3D {
>         [MUTEX_SOF_SINGLE_MODE] =3D MUTEX_SOF_SINGLE_MODE,
>         [MUTEX_SOF_DSI0] =3D MUTEX_SOF_DSI0,
>         [MUTEX_SOF_DSI1] =3D MUTEX_SOF_DSI1,
> @@ -224,7 +291,7 @@ static const unsigned int mt2712_mutex_sof[MUTEX_SOF_=
DSI3 + 1] =3D {
>         [MUTEX_SOF_DSI3] =3D MUTEX_SOF_DSI3,
>  };
>
> -static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] =3D {
> +static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] =3D {
>         [MUTEX_SOF_SINGLE_MODE] =3D MUTEX_SOF_SINGLE_MODE,
>         [MUTEX_SOF_DSI0] =3D MUTEX_SOF_DSI0,
>         [MUTEX_SOF_DPI0] =3D MT8167_MUTEX_SOF_DPI0,
> @@ -232,12 +299,24 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SO=
F_DSI3 + 1] =3D {
>  };
>
>  /* Add EOF setting so overlay hardware can receive frame done irq */
> -static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] =3D {
> +static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] =3D {
>         [MUTEX_SOF_SINGLE_MODE] =3D MUTEX_SOF_SINGLE_MODE,
>         [MUTEX_SOF_DSI0] =3D MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
>         [MUTEX_SOF_DPI0] =3D MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI=
0,
>  };
>
> +static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] =3D {
> +       [MUTEX_SOF_SINGLE_MODE] =3D MUTEX_SOF_SINGLE_MODE,
> +       [MUTEX_SOF_DSI0] =3D MT8195_MUTEX_SOF_DSI0 | MT8195_MUTEX_EOF_DSI=
0,
> +       [MUTEX_SOF_DSI1] =3D MT8195_MUTEX_SOF_DSI1 | MT8195_MUTEX_EOF_DSI=
1,
> +       [MUTEX_SOF_DPI0] =3D MT8195_MUTEX_SOF_DPI0 | MT8195_MUTEX_EOF_DPI=
0,
> +       [MUTEX_SOF_DPI1] =3D MT8195_MUTEX_SOF_DPI1 | MT8195_MUTEX_EOF_DPI=
1,
> +       [MUTEX_SOF_DP_INTF0] =3D
> +               MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
> +       [MUTEX_SOF_DP_INTF1] =3D
> +               MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,

Why do you or EOF?

Regards,
Chun-Kuang.

> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data =3D {
>         .mutex_mod =3D mt2701_mutex_mod,
>         .mutex_sof =3D mt2712_mutex_sof,
> @@ -275,6 +354,13 @@ static const struct mtk_mutex_data mt8183_mutex_driv=
er_data =3D {
>         .no_clk =3D true,
>  };
>
> +static const struct mtk_mutex_data mt8195_mutex_driver_data =3D {
> +       .mutex_mod =3D mt8195_mutex_mod,
> +       .mutex_sof =3D mt8195_mutex_sof,
> +       .mutex_mod_reg =3D MT8195_DISP_MUTEX0_MOD0,
> +       .mutex_sof_reg =3D MT8195_DISP_MUTEX0_SOF,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>         struct mtk_mutex_ctx *mtx =3D dev_get_drvdata(dev);
> @@ -347,6 +433,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>         case DDP_COMPONENT_DPI1:
>                 sof_id =3D MUTEX_SOF_DPI1;
>                 break;
> +       case DDP_COMPONENT_DP_INTF0:
> +               sof_id =3D MUTEX_SOF_DP_INTF0;
> +               break;

How about MUTEX_SOF_DP_INTF1?

>         default:
>                 if (mtx->data->mutex_mod[id] < 32) {
>                         offset =3D DISP_REG_MUTEX_MOD(mtx->data->mutex_mo=
d_reg,
> @@ -386,6 +475,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>         case DDP_COMPONENT_DSI3:
>         case DDP_COMPONENT_DPI0:
>         case DDP_COMPONENT_DPI1:
> +       case DDP_COMPONENT_DP_INTF0:

Ditto.

Regards,
Chun-Kuang.

>                 writel_relaxed(MUTEX_SOF_SINGLE_MODE,
>                                mtx->regs +
>                                DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_re=
g,
> @@ -507,6 +597,8 @@ static const struct of_device_id mutex_driver_dt_matc=
h[] =3D {
>           .data =3D &mt8173_mutex_driver_data},
>         { .compatible =3D "mediatek,mt8183-disp-mutex",
>           .data =3D &mt8183_mutex_driver_data},
> +       { .compatible =3D "mediatek,mt8195-disp-mutex",
> +         .data =3D &mt8195_mutex_driver_data},
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> --
> 2.18.0
>

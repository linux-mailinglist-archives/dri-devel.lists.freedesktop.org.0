Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1120C413E76
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 02:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4459A6E822;
	Wed, 22 Sep 2021 00:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AA66E822
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 00:09:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01143611ED
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 00:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632269387;
 bh=1a66pSxy/5DYewUE9DxUujAGENUyliHK+uWYJu4Waio=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SLSwrZAdEa1xMAE44CxZ+I9rs9SgUCnoeNLleuCng7mnuJuNpLNRhOUR9MjcKCtAC
 7kZYLV6RponsJrl4LEZmw1PeVOgioVeRePCateMP/2TGZ2PEf6uOdTT3JqWn2XGPHd
 EgU2BWrfBik4dPboO0cek8MZNKX1U3avM/jJaKSlHqeI1b8CFHzA8LB+DFud9amxkD
 /IR+CAEqHB5aHO/GMb7CiL/2JpeUxfic+JqP2pFJs8ZBGOwRgghvvj2t3rAhP/BX9D
 FMOqhE2CEQZPNu7j7g2909cL+udh8zcAKXWxu4MEcuJTOqTled6SAgk16zRWdJ67Uv
 qSYc4eWy5sa3Q==
Received: by mail-ed1-f54.google.com with SMTP id r5so2847720edi.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 17:09:46 -0700 (PDT)
X-Gm-Message-State: AOAM532p0WjeFYYpP0Id56zk34CSsXjz5BlcOWR1lm9ZUgvSXNeZuLQo
 TXSxxg86rotcUGnw4tKDc4FnIwyg6qu8yL371A==
X-Google-Smtp-Source: ABdhPJyLIzQqC3k+/4UTtyrlez4QeiKl9I3uzh6CkUwoTRl4JIT4shmUFbNo1XwZQMWVvU1W+ZwFluzjZdISN+rrgn8=
X-Received: by 2002:aa7:c617:: with SMTP id h23mr38512887edq.357.1632269385407; 
 Tue, 21 Sep 2021 17:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-14-nancy.lin@mediatek.com>
In-Reply-To: <20210906071539.12953-14-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 22 Sep 2021 08:09:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-MUv8Ey0MSFgdK6vuwrg2UaY52PQua=a9cSrZgRz+ZLQ@mail.gmail.com>
Message-ID: <CAAOTY_-MUv8Ey0MSFgdK6vuwrg2UaY52PQua=a9cSrZgRz+ZLQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/16] drm/mediatek: add ETHDR support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> ETHDR is a part of ovl_adaptor.
> ETHDR is designed for HDR video and graphics conversion in the external
> display path. It handles multiple HDR input types and performs tone
> mapping, color space/color format conversion, and then combine
> different layers, output the required HDR or SDR signal to the
> subsequent display path.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile    |   1 +
>  drivers/gpu/drm/mediatek/mtk_ethdr.c | 424 +++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h |  25 ++
>  3 files changed, 450 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h

[snip]

> +
> +void mtk_ethdr_disable_vblank(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +       priv->vblank_cb =3D NULL;
> +       priv->vblank_cb_data =3D NULL;
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +
> +       writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
> +}
> +
> +static irqreturn_t mtk_ethdr_irq_handler(int irq, void *dev_id)
> +{
> +       struct mtk_ethdr *priv =3D dev_id;
> +       unsigned long flags;
> +
> +       writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTSTA);
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +       if (!priv->vblank_cb) {
> +               spin_unlock_irqrestore(&priv->lock, flags);
> +               return IRQ_NONE;
> +       }
> +
> +       priv->vblank_cb(priv->vblank_cb_data);
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
> +                           struct mtk_plane_state *state,
> +                           struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +       struct mtk_plane_pending_state *pending =3D &state->pending;
> +       unsigned int offset =3D (pending->y << 16) | pending->x;

unsigned int offset =3D (pending->x & 1) << 31 |  pending->y << 16 | pendin=
g->x;

So you don't need x_offset_odd.

> +       unsigned int mixer_pad_mode =3D MIXER_INx_MODE_BYPASS;
> +       unsigned int alpha_con =3D 0;
> +       unsigned int fmt =3D 0;
> +       bool x_offset_odd =3D false;
> +
> +       dev_dbg(dev, "%s+ idx:%d", __func__, idx);
> +
> +       if (idx >=3D 4)
> +               return;
> +
> +       if (!pending->enable) {
> +               mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs=
, MIX_L_SRC_SIZE(idx));
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_=
IN_MODE,
> +                                    idx + 1, MIXER_INx_MODE_BYPASS, cmdq=
_pkt);
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_=
IN_BIWIDTH,
> +                                    idx + 1, 0, cmdq_pkt);
> +               return;
> +       }
> +
> +       if (pending->x % 2) {
> +               x_offset_odd =3D true;
> +               mixer_pad_mode =3D MIXER_INx_MODE_EVEN_EXTEND;
> +       }
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_MODE,
> +                            idx + 1, mixer_pad_mode, cmdq_pkt);
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_BIWID=
TH,
> +                            idx + 1, pending->width / 2 - 1, cmdq_pkt);
> +
> +       if (state->base.fb && state->base.fb->format->has_alpha) {
> +               alpha_con =3D MIXER_ALPHA_AEN | MIXER_ALPHA;
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_AL=
PHA_SEL,
> +                                    idx + 1, 0, cmdq_pkt);
> +       } else {
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_AL=
PHA_SEL,
> +                                    idx + 1, 1, cmdq_pkt);
> +       }
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA=
_ODD, idx + 1,
> +                            DEFAULT_9BIT_ALPHA, cmdq_pkt);
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA=
_EVEN, idx + 1,
> +                            DEFAULT_9BIT_ALPHA, cmdq_pkt);
> +
> +       mtk_ddp_write(cmdq_pkt, (pending->height << 16) | pending->width,=
 &mixer->cmdq_base,

mtk_ddp_write(cmdq_pkt, pending->height << 16 | pending->width,
&mixer->cmdq_base,

> +                     mixer->regs, MIX_L_SRC_SIZE(idx));
> +       mtk_ddp_write(cmdq_pkt, (x_offset_odd << 31) | offset, &mixer->cm=
dq_base,
> +                     mixer->regs, MIX_L_SRC_OFFSET(idx));
> +       mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base, mixer-=
>regs, MIX_L_SRC_CON(idx),
> +                          0x1ff);
> +       mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base, mixer->=
regs, MIX_SRC_CON,
> +                          BIT(idx));
> +}
> +
> +void mtk_ethdr_config(struct device *dev, unsigned int w,
> +                     unsigned int h, unsigned int vrefresh,
> +                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *vdo_fe0 =3D &priv->ethdr_comp[ETHDR_VDO_FE=
0];
> +       struct mtk_ethdr_comp *vdo_fe1 =3D &priv->ethdr_comp[ETHDR_VDO_FE=
1];
> +       struct mtk_ethdr_comp *gfx_fe0 =3D &priv->ethdr_comp[ETHDR_GFX_FE=
0];
> +       struct mtk_ethdr_comp *gfx_fe1 =3D &priv->ethdr_comp[ETHDR_GFX_FE=
1];
> +       struct mtk_ethdr_comp *vdo_be =3D &priv->ethdr_comp[ETHDR_VDO_BE]=
;
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe0->cmd=
q_base,
> +                     vdo_fe0->regs, HDR_VDO_FE_0804_HDR_DM_FE);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe1->cmd=
q_base,
> +                     vdo_fe1->regs, HDR_VDO_FE_0804_HDR_DM_FE);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe0->cmd=
q_base,
> +                     gfx_fe0->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe1->cmd=
q_base,
> +                     gfx_fe1->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_VDO_BE_0204_BYPASS_ALL, &vdo_be->cmdq=
_base,
> +                     vdo_be->regs, HDR_VDO_BE_0204_VDO_DM_BE);
> +
> +       mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer->cmdq_base, m=
ixer->regs, MIX_FUNC_DCM0);
> +       mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer->cmdq_base, m=
ixer->regs, MIX_FUNC_DCM1);
> +       mtk_ddp_write(cmdq_pkt, (h << 16 | w), &mixer->cmdq_base, mixer->=
regs, MIX_ROI_SIZE);

mtk_ddp_write(cmdq_pkt, h << 16 | w, &mixer->cmdq_base, mixer->regs,
MIX_ROI_SIZE);

> +       mtk_ddp_write(cmdq_pkt, BGCLR_BLACK, &mixer->cmdq_base, mixer->re=
gs, MIX_ROI_BGCLR);
> +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, m=
ixer->regs,
> +                     MIX_L_SRC_CON(0));
> +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, m=
ixer->regs,
> +                     MIX_L_SRC_CON(1));
> +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, m=
ixer->regs,
> +                     MIX_L_SRC_CON(2));
> +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, m=
ixer->regs,
> +                     MIX_L_SRC_CON(3));
> +       mtk_ddp_write(cmdq_pkt, 0x0, &mixer->cmdq_base, mixer->regs, MIX_=
L_SRC_SIZE(0));
> +       mtk_ddp_write(cmdq_pkt, OUTPUT_NO_RND | SOURCE_RGB_SEL | BACKGROU=
ND_RELAY,
> +                     &mixer->cmdq_base, mixer->regs, MIX_DATAPATH_CON);
> +       mtk_ddp_write_mask(cmdq_pkt, MIX_SRC_L0_EN, &mixer->cmdq_base, mi=
xer->regs,
> +                          MIX_SRC_CON, MIX_SRC_L0_EN);

       mtk_ddp_write_mask(cmdq_pkt, BIT(0), &mixer->cmdq_base,
mixer->regs, MIX_SRC_CON,
                          BIT(0));

Why do you enable layer 0?

> +
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_W=
IDTH, 0,
> +                            w / 2, cmdq_pkt);
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_H=
EIGHT, 0,
> +                            h, cmdq_pkt);
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_CH_SW=
AP, 4, 0, cmdq_pkt);
> +}
> +
> +void mtk_ethdr_start(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       writel(1, mixer->regs + MIX_EN);
> +}
> +
> +void mtk_ethdr_stop(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       writel(0, mixer->regs + MIX_EN);
> +       writel(1, mixer->regs + MIX_RST);
> +       reset_control_reset(devm_reset_control_array_get(dev, true, true)=
);
> +       writel(0, mixer->regs + MIX_RST);
> +}
> +
> +int mtk_ethdr_clk_enable(struct device *dev)
> +{
> +       int ret;
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +
> +       ret =3D clk_bulk_prepare_enable(ETHDR_CLK_NUM, priv->ethdr_clk);
> +       if (ret)
> +               dev_err(dev,
> +                       "ethdr_clk prepare enable failed\n");
> +       return ret;
> +}
> +
> +void mtk_ethdr_clk_disable(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +
> +       clk_bulk_disable_unprepare(ETHDR_CLK_NUM, priv->ethdr_clk);
> +}
> +
> +static int mtk_ethdr_bind(struct device *dev, struct device *master,
> +                         void *data)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct platform_device *ovl_adaptor;
> +       struct drm_device *drm_dev =3D data;
> +       struct mtk_drm_private *drm_private =3D drm_dev->dev_private;
> +
> +       priv->mmsys_dev =3D drm_private->mmsys_dev;
> +
> +       /* Bring up ovl adaptor rdma and merge */
> +       ovl_adaptor =3D platform_device_register_data(dev, "mediatek-disp=
-ovl-adaptor",
> +                                                   PLATFORM_DEVID_NONE, =
(void *)priv->mmsys_dev,
> +                                                   sizeof(*priv->mmsys_d=
ev));

I would like that mtk drm driver bring up ovl adaptor and ovl adaptor
bring up ethdr, rdma and merge. In another SoC, edhdr may be not
related to ovl.

Regards,
Chun-Kuang.

> +       if (IS_ERR(ovl_adaptor))
> +               return PTR_ERR(ovl_adaptor);
> +
> +       priv->ovl_adaptor_dev =3D &ovl_adaptor->dev;
> +
> +       return 0;
> +}
> +
> +static void mtk_ethdr_unbind(struct device *dev, struct device *master, =
void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_ethdr_component_ops =3D {
> +       .bind   =3D mtk_ethdr_bind,
> +       .unbind =3D mtk_ethdr_unbind,
> +};
> +

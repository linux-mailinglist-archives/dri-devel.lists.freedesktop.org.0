Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C964364FB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 17:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7976E3F7;
	Thu, 21 Oct 2021 15:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5B76E3F7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 15:03:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8672610EA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 15:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634828579;
 bh=354AyE25dL1XtXeR8/8dQ24k+emZT+yZVpIpnoYgOjs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iG8w7y89QtGyFFtVU54d1JBDWb34sv76WxUJR+xhuTmPhW1jounopdS5nxpDWjF6V
 QzhaFDvesCFnnjkK5s5d47K4Ka+Epv/PEW/B3jyPNn7tlU/L0ejeo0tv9mZatBtKn5
 +MvO/sDYImD3TIToyyiMP7IB6GtUlMpA93ZahnbHMYmcpxF+yOQbe7E9VUdF6eiVNA
 sNklzt6OcB7R5sEspbx5ywNNpqq+Vy/CYQ1fzUjYyuSOPzj8Y3ZLvJP1gbWRL4BY1y
 nPznA+FRXISYH8mYmwdTBftdrt8qSucFSkHA+yYaUcNHUd3ZqoDSzqXgcbhgS1tGcu
 xUG+HglJDNfjw==
Received: by mail-ed1-f46.google.com with SMTP id y12so22850eda.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 08:02:59 -0700 (PDT)
X-Gm-Message-State: AOAM5300y3ccIBCeECGN56t4PgbVYyRKktej/YLRatM5zrAkFba8PH8z
 Hx0phjuX4TWN0eehfJJvIYUapUcYj7ONFgLJTw==
X-Google-Smtp-Source: ABdhPJw1PQs1wXpFb+Jl50DepGnq+SF+oV2vOKTVmMer0r5r3iEWh0BIX/kLnEz2n5caZMcnV1e/DVpyuyhS7Ksw/zo=
X-Received: by 2002:a17:906:f85b:: with SMTP id
 ks27mr8063631ejb.430.1634828575851; 
 Thu, 21 Oct 2021 08:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-13-nancy.lin@mediatek.com>
In-Reply-To: <20211004062140.29803-13-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 21 Oct 2021 23:02:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-wwXHMq4fB9wNGub=Sh-Ep3aOJJPaNTch2zebhZzEvkA@mail.gmail.com>
Message-ID: <CAAOTY_-wwXHMq4fB9wNGub=Sh-Ep3aOJJPaNTch2zebhZzEvkA@mail.gmail.com>
Subject: Re: [PATCH v6 12/16] drm/mediatek: add display merge api support for
 MT8195
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

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add merge new API.
> 1. Vdosys1 merge1~merge4 support HW mute function, so add unmute API.
> 2. Add merge new advance config API. The original merge API is
>    mtk_ddp_comp_funcs function prototype. The API interface parameters
>    cannot be modified, so add a new config API for extension.
> 3. Add merge enable/disable API for cmdq support. The ovl_adaptor merges
>    are configured with each drm plane update. Need to enable/disable
>    merge with cmdq making sure all the settings taken effect in the
>    same vblank.

Separate this patch into three patches.

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  6 ++
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 86 ++++++++++++++++++++---
>  2 files changed, 82 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index b3a372cab0bd..2446ad0a4977 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -63,6 +63,12 @@ void mtk_merge_config(struct device *dev, unsigned int=
 width,
>                       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  void mtk_merge_start(struct device *dev);
>  void mtk_merge_stop(struct device *dev);
> +void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsi=
gned int r_w,
> +                             unsigned int h, unsigned int vrefresh, unsi=
gned int bpc,
> +                             struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_unmute(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_enable(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_disable(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>
>  void mtk_ovl_bgclr_in_on(struct device *dev);
>  void mtk_ovl_bgclr_in_off(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> index b05e1df79c3d..696bb948352b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -17,6 +17,7 @@
>  #define DISP_REG_MERGE_CTRL            0x000
>  #define MERGE_EN                               1
>  #define DISP_REG_MERGE_CFG_0           0x010
> +#define DISP_REG_MERGE_CFG_1           0x014
>  #define DISP_REG_MERGE_CFG_4           0x020
>  #define DISP_REG_MERGE_CFG_10          0x038
>  /* no swap */
> @@ -25,9 +26,12 @@
>  #define DISP_REG_MERGE_CFG_12          0x040
>  #define CFG_10_10_1PI_2PO_BUF_MODE             6
>  #define CFG_10_10_2PI_2PO_BUF_MODE             8
> +#define CFG_11_10_1PI_2PO_MERGE                        18
>  #define FLD_CFG_MERGE_MODE                     GENMASK(4, 0)
>  #define DISP_REG_MERGE_CFG_24          0x070
>  #define DISP_REG_MERGE_CFG_25          0x074
> +#define DISP_REG_MERGE_CFG_26          0x078
> +#define DISP_REG_MERGE_CFG_27          0x07c
>  #define DISP_REG_MERGE_CFG_36          0x0a0
>  #define ULTRA_EN                               BIT(0)
>  #define PREULTRA_EN                            BIT(4)
> @@ -54,26 +58,52 @@
>  #define FLD_PREULTRA_TH_LOW                    GENMASK(15, 0)
>  #define FLD_PREULTRA_TH_HIGH                   GENMASK(31, 16)
>
> +#define DISP_REG_MERGE_MUTE_0          0xf00
> +
>  struct mtk_disp_merge {
>         void __iomem *regs;
>         struct clk *clk;
>         struct clk *async_clk;
>         struct cmdq_client_reg          cmdq_reg;
>         bool                            fifo_en;
> +       bool                            mute_support;

Align indent of members.

>  };
>
>  void mtk_merge_start(struct device *dev)
> +{
> +       mtk_merge_enable(dev, NULL);
> +}
> +
> +void mtk_merge_stop(struct device *dev)
>  {
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>
> -       writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> +       mtk_merge_disable(dev, NULL);
>  }
>
> -void mtk_merge_stop(struct device *dev)
> +void mtk_merge_enable(struct device *dev, struct cmdq_pkt *cmdq_pkt)

The difference of mtk_merge_enable() and mtk_merge_start() is cmdq
support, but the naming make them so different. So I would like this
function name to be mtk_merge_start_cmdq().

> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CTRL);
> +}
> +
> +void mtk_merge_disable(struct device *dev, struct cmdq_pkt *cmdq_pkt)

Ditto.

>  {
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>
> -       writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> +       mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CTRL);
> +}
> +
> +void mtk_merge_unmute(struct device *dev, struct cmdq_pkt *cmdq_pkt)

I'm not sure whether it's worth to have this function. It seems that
mtk_merge_enable() imply mtk_merge_unmute(). So I would like to move
this function into mtk_merge_enable().
And I would like to mute in mtk_merge_disable() to let register be restored=
.

Regards,
Chun-Kuang.

> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       if (priv->mute_support)
> +               mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
> +                             DISP_REG_MERGE_MUTE_0);
>  }
>
>  static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
> @@ -98,12 +128,19 @@ static void mtk_merge_fifo_setting(struct mtk_disp_m=
erge *priv,
>  void mtk_merge_config(struct device *dev, unsigned int w,
>                       unsigned int h, unsigned int vrefresh,
>                       unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       mtk_merge_advance_config(dev, w, 0, h, vrefresh, bpc, cmdq_pkt);
> +}
> +
> +void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsi=
gned int r_w,
> +                             unsigned int h, unsigned int vrefresh, unsi=
gned int bpc,
> +                             struct cmdq_pkt *cmdq_pkt)
>  {
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>         unsigned int mode =3D CFG_10_10_1PI_2PO_BUF_MODE;
>
> -       if (!h || !w) {
> -               dev_err(dev, "%s: input width(%d) or height(%d) is invali=
d\n", __func__, w, h);
> +       if (!h || !l_w) {
> +               dev_err(dev, "%s: input width(%d) or height(%d) is invali=
d\n", __func__, l_w, h);
>                 return;
>         }
>
> @@ -112,14 +149,41 @@ void mtk_merge_config(struct device *dev, unsigned =
int w,
>                 mode =3D CFG_10_10_2PI_2PO_BUF_MODE;
>         }
>
> -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +       if (r_w)
> +               mode =3D CFG_11_10_1PI_2PO_MERGE;
> +
> +       mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->reg=
s,
>                       DISP_REG_MERGE_CFG_0);
> -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +       mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->reg=
s,
> +                     DISP_REG_MERGE_CFG_1);
> +       mtk_ddp_write(cmdq_pkt, h << 16 | (l_w + r_w), &priv->cmdq_reg, p=
riv->regs,
>                       DISP_REG_MERGE_CFG_4);
> -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +       /*
> +        * DISP_REG_MERGE_CFG_24 is merge SRAM0 w/h
> +        * DISP_REG_MERGE_CFG_25 is merge SRAM1 w/h.
> +        * If r_w > 0, the merge is in merge mode (input0 and input1 merg=
e together),
> +        * the input0 goes to SRAM0, and input1 goes to SRAM1.
> +        * If r_w =3D 0, the merge is in buffer mode, the input goes thro=
ugh SRAM0 and
> +        * then to SRAM1. Both SRAM0 and SRAM1 are set to the same size.
> +        */
> +       mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->reg=
s,
>                       DISP_REG_MERGE_CFG_24);
> -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> -                     DISP_REG_MERGE_CFG_25);
> +       if (r_w)
> +               mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, p=
riv->regs,
> +                             DISP_REG_MERGE_CFG_25);
> +       else
> +               mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, p=
riv->regs,
> +                             DISP_REG_MERGE_CFG_25);
> +
> +       /*
> +        * DISP_REG_MERGE_CFG_26 and DISP_REG_MERGE_CFG_27 is only used i=
n LR merge.
> +        * Only take effect when the merge is setting to merge mode.
> +        */
> +       mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->reg=
s,
> +                     DISP_REG_MERGE_CFG_26);
> +       mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->reg=
s,
> +                     DISP_REG_MERGE_CFG_27);
> +
>         mtk_ddp_write_mask(cmdq_pkt, SWAP_MODE, &priv->cmdq_reg, priv->re=
gs,
>                            DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
>         mtk_ddp_write_mask(cmdq_pkt, mode, &priv->cmdq_reg, priv->regs,
> @@ -205,6 +269,8 @@ static int mtk_disp_merge_probe(struct platform_devic=
e *pdev)
>         priv->fifo_en =3D of_property_read_bool(dev->of_node,
>                                               "mediatek,merge-fifo-en");
>
> +       priv->mute_support =3D of_property_read_bool(dev->of_node,
> +                                                  "mediatek,merge-mute")=
;
>         platform_set_drvdata(pdev, priv);
>
>         ret =3D component_add(dev, &mtk_disp_merge_component_ops);
> --
> 2.18.0
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C640600E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 01:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494876E93F;
	Thu,  9 Sep 2021 23:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5446E93F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 23:29:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE2946113E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 23:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631230181;
 bh=c7PZP9OU4TV8gKIYBTvY73B9gUxE/oqC6FOy7RDKUZg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jLRtIsV1kQsFMLm+ajDMzQj1i4Ab6HS8J8EIh0W23XPAUgbbF+DRLFmpwSIzMCF21
 Ah/qHFL/SaBJYNMoqgNPSX1MBcHNsdOmmUlGqGeGRR6yxh27dsH2thLCvImMIMniVZ
 Qmc3HGUDPBMIjlDXDU5R1DtObvmspYd5Xe4TW92YGPsy4E8bSnwrTWSDz/elLph8N9
 HfVeNm4mkYf9M19FNbRhFcAYJiLuZNCiwyx5/QTF2I+0wDtatV4VHeXQ82oATox3W8
 GzgAss7EuG2d1V76/4aRZOakZ9t67hCNLe0ysU1h//RsSF5jPD+qhU3F6oEJtC0ybT
 B5mTWsS9DJurg==
Received: by mail-ej1-f45.google.com with SMTP id bt14so425254ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 16:29:41 -0700 (PDT)
X-Gm-Message-State: AOAM533DtHlMi6ogBG40OsNWcaEDIwe6f/Bg8AnWVzZ6MZebhI+yBfbI
 brLLutUnaZEZrYzpSmeBMME8b0N/Vchw4dG0Vg==
X-Google-Smtp-Source: ABdhPJz/RyZoZp7ph8/QXW0oeB6qjUlSmSS+C/ApF7CgBMgUSex7ePaklNElwjcJNmn5LyPsqWW5qy7/iskFxvxR0HA=
X-Received: by 2002:a17:906:3181:: with SMTP id
 1mr6182118ejy.388.1631230180289; 
 Thu, 09 Sep 2021 16:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-13-nancy.lin@mediatek.com>
In-Reply-To: <20210906071539.12953-13-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 10 Sep 2021 07:29:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8s+YgVSQ2LnyCf8qC0ADumk1HCRYft3p3hct6j9E3cjA@mail.gmail.com>
Message-ID: <CAAOTY_8s+YgVSQ2LnyCf8qC0ADumk1HCRYft3p3hct6j9E3cjA@mail.gmail.com>
Subject: Re: [PATCH v5 12/16] drm/mediatek: add display merge api support for
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

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:15=E5=AF=AB=E9=81=93=EF=BC=9A
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
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  6 ++
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 74 ++++++++++++++++++++---
>  2 files changed, 70 insertions(+), 10 deletions(-)
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
> index b05e1df79c3d..41bff6d3a8da 100644
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
> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CTRL);
> +}
> +
> +void mtk_merge_disable(struct device *dev, struct cmdq_pkt *cmdq_pkt)
>  {
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>
> -       writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> +       mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CTRL);
> +}
> +
> +void mtk_merge_unmute(struct device *dev, struct cmdq_pkt *cmdq_pkt)
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
> @@ -112,14 +149,29 @@ void mtk_merge_config(struct device *dev, unsigned =
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

If DISP_REG_MERGE_CFG_25 is to set r_w, why when r_w =3D 0, then set l_w?

> +
> +       mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->reg=
s,
> +                     DISP_REG_MERGE_CFG_26);

Before this patch, DISP_REG_MERGE_CFG_26 is not set to l_w, why?

Regards,
Chun-Kuang.

> +       mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->reg=
s,
> +                     DISP_REG_MERGE_CFG_27);
> +
>         mtk_ddp_write_mask(cmdq_pkt, SWAP_MODE, &priv->cmdq_reg, priv->re=
gs,
>                            DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
>         mtk_ddp_write_mask(cmdq_pkt, mode, &priv->cmdq_reg, priv->regs,
> @@ -205,6 +257,8 @@ static int mtk_disp_merge_probe(struct platform_devic=
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

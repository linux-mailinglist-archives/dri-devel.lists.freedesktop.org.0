Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9094439F3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 00:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D56737EF;
	Tue,  2 Nov 2021 23:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E1373913
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:43:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAEDC61050
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635896600;
 bh=rjkyupiwa6bOBYeCG4z2w+qvLPFqsxOGa5Bz3BJ9Htw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T7Dxl6zyxTTzDLERkohLcC6jSK4t3TpvoIvJNaHbsiUxzNwz8mXgrTo69Rwnzh/bW
 3WImCbicAEmxv2Bw85Ll6ICkbyM7pS25EzNgLN8kXuRClAJaVJhIdzo1jtxpY/7uNB
 yJbFuDhnapzYBxHAhjTcmbOu++zpMq2P/uEOAfWohooNR0Jsc53lOE9Zzdjbm6tklC
 tA6ttuuppwenVXG8zVAyJXN0QXhcQsS7q7Fh6DgiEcpg8jbosYtofn1n60pLXDUjv5
 AFo/0gBASf1/XVo3OP5XjkIARQZfuK9qWsmpq4xaBY0DKyf3qyg+FeJ2cFj5eIu0pK
 X/qzpK+YH6PkQ==
Received: by mail-ed1-f46.google.com with SMTP id o8so3067445edc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 16:43:20 -0700 (PDT)
X-Gm-Message-State: AOAM531Fgj4zsyYAks0aKa7IEzYsCnTeafaq7v1b2rSo5zchBgP9Icoq
 cqt1IBt+H2OGGRWbyq475b7SBA4OMlC178BzFg==
X-Google-Smtp-Source: ABdhPJzbG+a/250u3oAnc6OpJYLgdHWDE4cRVJ9m1ahLo5a4FyKxYE/kuceRaCL3LDm/EP05WzeW9GGliwhZ+WY9wE4=
X-Received: by 2002:a17:907:9612:: with SMTP id
 gb18mr14273201ejc.205.1635896599107; 
 Tue, 02 Nov 2021 16:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-14-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-14-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 3 Nov 2021 07:43:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY__MGbnQHvwX+EEEnZD+XpU_m2Yb-2i4L3-J4APBJ6-+hw@mail.gmail.com>
Message-ID: <CAAOTY__MGbnQHvwX+EEEnZD+XpU_m2Yb-2i4L3-J4APBJ6-+hw@mail.gmail.com>
Subject: Re: [PATCH v7 13/20] drm/mediatek: add display merge advance config
 API for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add merge new advance config API. The original merge API is
> mtk_ddp_comp_funcs function prototype. The API interface parameters
> cannot be modified, so add a new config API for extension. This is
> the preparation for ovl_adaptor merge control.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 ++
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 52 ++++++++++++++++++++---
>  2 files changed, 48 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index b3a372cab0bd..c2de53a5892e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -63,6 +63,9 @@ void mtk_merge_config(struct device *dev, unsigned int =
width,
>                       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  void mtk_merge_start(struct device *dev);
>  void mtk_merge_stop(struct device *dev);
> +void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsi=
gned int r_w,
> +                             unsigned int h, unsigned int vrefresh, unsi=
gned int bpc,
> +                             struct cmdq_pkt *cmdq_pkt);
>
>  void mtk_ovl_bgclr_in_on(struct device *dev);
>  void mtk_ovl_bgclr_in_off(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> index 470ebc4b5296..558e0cb2a297 100644
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
> @@ -98,12 +102,19 @@ static void mtk_merge_fifo_setting(struct mtk_disp_m=
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
> @@ -112,14 +123,41 @@ void mtk_merge_config(struct device *dev, unsigned =
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
> --
> 2.18.0
>

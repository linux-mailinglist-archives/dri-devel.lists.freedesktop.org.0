Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F05402CD8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 18:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A39988F0A;
	Tue,  7 Sep 2021 16:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968B388F0A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 16:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70A1261104
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631032208;
 bh=/i//j1fOwb+XWtxuMbanMqqYVLUzNfmK+qoMX+CZRPA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mkZu7pmXbunqidV6Z4TfVTgG0f4GSI5hVnMQOaf9tX6yhq4GqTta9ha6MZUZRx+tI
 HPMDGM5KOeI03HKlMwXRCJdZOtGzGtrWe58CYs5V6TtP5i+i21nmPnAR6Gfe/BzqiQ
 /aB4b9JyWuM5XjJ+Qa4AnukeCL6S/6Rzsslye/t6iSlTifwkna0bOgVDnpHrOq2fNP
 grNJ/VVOKspovDWPFV+janTR2jIRhWqCSLSBhTWCwtjTUX25yyEtVbi+PC3XOZaI3V
 /lElVXr4ZxuQjwE3xuH3ta9bNs5FFpPVRBieujtlxvbs8CVlC3I/yZnAl2ApWGS3Qs
 TEJ/T0PlQjiew==
Received: by mail-ej1-f49.google.com with SMTP id bt14so20853204ejb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 09:30:08 -0700 (PDT)
X-Gm-Message-State: AOAM533oxASfoH2OX7RSy4ZDdBeZX2tM1lINnGLYnpEYdvmP77/am2cJ
 nw8E92suiPItCk8fjZAzNdXtb5qvxZFyL7b6Bw==
X-Google-Smtp-Source: ABdhPJzLkwddxnUcVX7bVwwUpGSHGMnvVQjKfrWTpYvJ7hWPLwru5ku9P/Cjopdi8PWOnTY9S83DeW/a1j3JAydcmCc=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr19791012ejd.241.1631032206943; 
 Tue, 07 Sep 2021 09:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-9-nancy.lin@mediatek.com>
In-Reply-To: <20210906071539.12953-9-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 8 Sep 2021 00:29:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8aQkx55C=mqK-4bULpG_biHkq4brBF2SDdtbpnhP3Rvw@mail.gmail.com>
Message-ID: <CAAOTY_8aQkx55C=mqK-4bULpG_biHkq4brBF2SDdtbpnhP3Rvw@mail.gmail.com>
Subject: Re: [PATCH v5 08/16] soc: mediatek: add cmdq support of mtk-mmsys
 config API for mt8195 vdosys1
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
> Add cmdq support for mtk-mmsys config API.
> The mmsys config register settings need to take effect with the other
> HW settings(like OVL_ADAPTOR...) at the same vblanking time.
>
> If we use CPU to write the mmsys reg, we can't guarantee all the
> settings can be written in the same vblanking time.
> Cmdq is used for this purpose. We prepare all the related HW settings
> in one cmdq packet. The first command in the packet is "wait stream done"=
,
> and then following with all the HW settings. After the cmdq packet is
> flush to GCE HW. The GCE waits for the "stream done event" to coming
> and then starts flushing all the HW settings. This can guarantee all
> the settings flush in the same vblanking.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c       | 28 +++++++++++++++++++++-----
>  include/linux/soc/mediatek/mtk-mmsys.h |  6 +++++-
>  2 files changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 3a38b8269c71..060065501b8a 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -81,6 +81,7 @@ struct mtk_mmsys {
>         const struct mtk_mmsys_driver_data *data;
>         spinlock_t lock; /* protects mmsys_sw_rst_b reg */
>         struct reset_controller_dev rcdev;
> +       struct cmdq_client_reg cmdq_base;
>  };
>
>  void mtk_mmsys_ddp_connect(struct device *dev,
> @@ -174,7 +175,7 @@ static const struct reset_control_ops mtk_mmsys_reset=
_ops =3D {
>  };
>
>  void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type=
 config,
> -                         u32 id, u32 val)
> +                         u32 id, u32 val, struct cmdq_pkt *cmdq_pkt)
>  {
>         struct mtk_mmsys *mmsys =3D dev_get_drvdata(dev);
>         const struct mtk_mmsys_config *mmsys_config =3D mmsys->data->conf=
ig;
> @@ -197,10 +198,20 @@ void mtk_mmsys_ddp_config(struct device *dev, enum =
mtk_mmsys_config_type config,
>         mask =3D mmsys_config[i].mask;
>         reg_val =3D val << mmsys_config[i].shift;
>
> -       u32 tmp =3D readl(mmsys->regs + offset);
> -
> -       tmp =3D (tmp & ~mask) | reg_val;
> -       writel(tmp, mmsys->regs + offset);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       if (cmdq_pkt && mmsys->cmdq_base.size) {
> +               cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> +                                   mmsys->cmdq_base.offset + offset, reg=
_val,
> +                                   mask);
> +       } else {
> +#endif
> +               u32 tmp =3D readl(mmsys->regs + offset);
> +
> +               tmp =3D (tmp & ~mask) | reg_val;
> +               writel(tmp, mmsys->regs + offset);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       }
> +#endif
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
>
> @@ -236,6 +247,13 @@ static int mtk_mmsys_probe(struct platform_device *p=
dev)
>         }
>
>         mmsys->data =3D of_device_get_match_data(&pdev->dev);
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       ret =3D cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);

Define mediatek,gce-client-reg in binding document first.

Regards,
Chun-Kuang.

> +       if (ret)
> +               dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> +#endif
> +
>         platform_set_drvdata(pdev, mmsys);
>
>         clks =3D platform_device_register_data(&pdev->dev, mmsys->data->c=
lk_driver,
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/m=
ediatek/mtk-mmsys.h
> index ef2a6d9a834b..9705d242849a 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -6,6 +6,10 @@
>  #ifndef __MTK_MMSYS_H
>  #define __MTK_MMSYS_H
>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/mtk-cmdq-mailbox.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
>  enum mtk_ddp_comp_id;
>  struct device;
>
> @@ -75,6 +79,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>                               enum mtk_ddp_comp_id next);
>
>  void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type=
 config,
> -                         u32 id, u32 val);
> +                         u32 id, u32 val, struct cmdq_pkt *cmdq_pkt);
>
>  #endif /* __MTK_MMSYS_H */
> --
> 2.18.0
>

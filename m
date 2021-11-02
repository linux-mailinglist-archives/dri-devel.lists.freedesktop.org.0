Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EAE4439FE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 00:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAB77391A;
	Tue,  2 Nov 2021 23:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1217391A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:47:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70317610C8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 23:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635896834;
 bh=nEopyOSaG+F7cUNl+J272O3aX05gPbA/iGiQNQSOXQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WQd/yedrhXL/w7xGknqaP+3TAHDlk9wFfkEp4ulJhz74fdYiFq66V0AW3/Pk9z4i0
 3pIa8LG8YVyYYBT2+Cu7TBo/qm4Q40ydm/xhFmCnMt7Po9XkUi1rxcyacY6iP69ljI
 xdxSQmxSWJxltt4KytlOjlQI7mdelgrKsXWTZGqH4uMH4xQuP4pqu2UesvXZ/idiRO
 OlYs5PCxvlGeYSfu7FaKJJW6xf61izqETUfZ6WMCM8Aa6OtBD58mlmykGjau6OPFQl
 8M2LlADmI4Eiqwjy2OzWsQikrheW6jqaOMQywt7wapzw45AdQ5ao+wTY7BOHIoQlRV
 ApUl2vOURr74g==
Received: by mail-ed1-f41.google.com with SMTP id g10so3135809edj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 16:47:14 -0700 (PDT)
X-Gm-Message-State: AOAM531iqYEok+iwxWsZiljyp8GVs/qEJrucC1yKibAUfG1vg7onzHHR
 Kv8pZKC3YtMyoiIxphSB0gwNezrxrISJZGtNeQ==
X-Google-Smtp-Source: ABdhPJxBiOibpDHQ08BfqQjtssw7YcznWcjtqEDuz39aK2iQGGhleb3+Sr7g1j30TSs3MWReyiMD7sLDakaftm6tVag=
X-Received: by 2002:a17:907:6ea6:: with SMTP id
 sh38mr51589752ejc.388.1635896832841; 
 Tue, 02 Nov 2021 16:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-16-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-16-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 3 Nov 2021 07:47:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9-RmnC7DBWYd2OrXqvJkP43Ny0T-JqMhQE2PAde7Dbpg@mail.gmail.com>
Message-ID: <CAAOTY_9-RmnC7DBWYd2OrXqvJkP43Ny0T-JqMhQE2PAde7Dbpg@mail.gmail.com>
Subject: Re: [PATCH v7 15/20] drm/mediatek: add display merge mute/unmute
 support for MT8195
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
> Add merge mute/unmute setting for MT8195.
> MT8195 Vdosys1 merge1~merge4 support HW mute function.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> index 92c81ce24a49..dff2797a2f68 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -58,12 +58,15 @@
>  #define FLD_PREULTRA_TH_LOW                    GENMASK(15, 0)
>  #define FLD_PREULTRA_TH_HIGH                   GENMASK(31, 16)
>
> +#define DISP_REG_MERGE_MUTE_0          0xf00
> +
>  struct mtk_disp_merge {
> -       void __iomem *regs;
> -       struct clk *clk;
> -       struct clk *async_clk;
> -       struct cmdq_client_reg          cmdq_reg;
> -       bool                            fifo_en;
> +       void __iomem            *regs;
> +       struct clk              *clk;
> +       struct clk              *async_clk;
> +       struct cmdq_client_reg  cmdq_reg;
> +       bool                    fifo_en;
> +       bool                    mute_support;
>  };
>
>  void mtk_merge_start(struct device *dev)
> @@ -82,6 +85,10 @@ void mtk_merge_start_cmdq(struct device *dev, struct c=
mdq_pkt *cmdq_pkt)
>  {
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>
> +       if (priv->mute_support)
> +               mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
> +                             DISP_REG_MERGE_MUTE_0);
> +
>         mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
>                       DISP_REG_MERGE_CTRL);
>  }
> @@ -90,6 +97,10 @@ void mtk_merge_stop_cmdq(struct device *dev, struct cm=
dq_pkt *cmdq_pkt)
>  {
>         struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
>
> +       if (priv->mute_support)
> +               mtk_ddp_write(cmdq_pkt, 0x1, &priv->cmdq_reg, priv->regs,
> +                             DISP_REG_MERGE_MUTE_0);
> +
>         mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
>                       DISP_REG_MERGE_CTRL);
>  }
> @@ -264,6 +275,8 @@ static int mtk_disp_merge_probe(struct platform_devic=
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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9963E4729
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96A789856;
	Mon,  9 Aug 2021 14:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748489856
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:05:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B60AF6101D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628517940;
 bh=B16BkVOlzvMofRNxZCCPfBpfJWKgMemm4c5pHZIX5uE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P/rj+RsZilC5qcXQ/+8k1PaWasOHfI6V7uARzwTxsJxOtKgBnRiawROZavf8ARIk1
 VfkoxdO3tgLoju+FV2uKH1olUAnunxOnd4esoz/i7R801K0z0AjzorDn5c+Zn1Ovu3
 pEyJ9FVykcNU+88fLz9pHKHfKtMQsYpGjlIX3Y75Z+ZsStwbhFkZ3RpmwWpdgrs4i9
 AoO0HEgbca8ZtVyNsTjos3Kg3/jNHrI3DvMxBjbOrvH/JttZSlZmR3pqVvOeWrxHGi
 5OPdYG/jTQRpPN/r5Hi+T/wOBDhpbg/SHcZ3ljwR1q7tT2iDlxNqudcW//kF7Qgaee
 7OKfeKQXXRkIQ==
Received: by mail-ed1-f54.google.com with SMTP id g21so24802879edb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:05:40 -0700 (PDT)
X-Gm-Message-State: AOAM532kQ9hfinI1TQyiuEz+UHfV4ykwSsjuIZpagwQM/lstOInx4Wv6
 U47oSyWNlzfxPOMet3hPsCEu57ENO7xNaqnhAg==
X-Google-Smtp-Source: ABdhPJzq3vGkwq0LwxmantDeoehWwnPrH+tI1JJ76dOOXmOZpmtTgTRuHk9cLXTrSQ0qQJPtXQG+i+a4FW+Oe+pp8Ms=
X-Received: by 2002:a05:6402:648:: with SMTP id
 u8mr30935144edx.162.1628517939275; 
 Mon, 09 Aug 2021 07:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-6-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-6-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 22:05:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-9zscXmC83oDkk-JZvnooZbiqtei+R2+c=VhBJ7xW84A@mail.gmail.com>
Message-ID: <CAAOTY_-9zscXmC83oDkk-JZvnooZbiqtei+R2+c=VhBJ7xW84A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/mediatek: Add support for main DDP path on
 MT8167
To: Fabien Parent <fparent@baylibre.com>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
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

Hi, Fabien:

Fabien Parent <fparent@baylibre.com> =E6=96=BC 2020=E5=B9=B410=E6=9C=8823=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:31=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add the main (DSI) drm display path for MT8167.
>

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>
> Changelog:
>
> V2: No change
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 38 ++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 59c85c63b7cc..3952435093fe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -112,6 +112,17 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_thi=
rd[] =3D {
>         DDP_COMPONENT_PWM2,
>  };
>
> +static enum mtk_ddp_comp_id mt8167_mtk_ddp_main[] =3D {
> +       DDP_COMPONENT_OVL0,
> +       DDP_COMPONENT_COLOR0,
> +       DDP_COMPONENT_CCORR,
> +       DDP_COMPONENT_AAL0,
> +       DDP_COMPONENT_GAMMA,
> +       DDP_COMPONENT_DITHER,
> +       DDP_COMPONENT_RDMA0,
> +       DDP_COMPONENT_DSI0,
> +};
> +
>  static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] =3D {
>         DDP_COMPONENT_OVL0,
>         DDP_COMPONENT_COLOR0,
> @@ -163,6 +174,11 @@ static const struct mtk_mmsys_driver_data mt8173_mms=
ys_driver_data =3D {
>         .ext_len =3D ARRAY_SIZE(mt8173_mtk_ddp_ext),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data =3D {
> +       .main_path =3D mt8167_mtk_ddp_main,
> +       .main_len =3D ARRAY_SIZE(mt8167_mtk_ddp_main),
> +};
> +
>  static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>         struct mtk_drm_private *private =3D drm->dev_private;
> @@ -401,26 +417,42 @@ static const struct component_master_ops mtk_drm_op=
s =3D {
>  static const struct of_device_id mtk_ddp_comp_dt_ids[] =3D {
>         { .compatible =3D "mediatek,mt2701-disp-ovl",
>           .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8167-disp-ovl",
> +         .data =3D (void *)MTK_DISP_OVL },
>         { .compatible =3D "mediatek,mt8173-disp-ovl",
>           .data =3D (void *)MTK_DISP_OVL },
>         { .compatible =3D "mediatek,mt2701-disp-rdma",
>           .data =3D (void *)MTK_DISP_RDMA },
> +       { .compatible =3D "mediatek,mt8167-disp-rdma",
> +         .data =3D (void *)MTK_DISP_RDMA },
>         { .compatible =3D "mediatek,mt8173-disp-rdma",
>           .data =3D (void *)MTK_DISP_RDMA },
>         { .compatible =3D "mediatek,mt8173-disp-wdma",
>           .data =3D (void *)MTK_DISP_WDMA },
> +       { .compatible =3D "mediatek,mt8167-disp-ccorr",
> +         .data =3D (void *)MTK_DISP_CCORR },
>         { .compatible =3D "mediatek,mt2701-disp-color",
>           .data =3D (void *)MTK_DISP_COLOR },
> +       { .compatible =3D "mediatek,mt8167-disp-color",
> +         .data =3D (void *)MTK_DISP_COLOR },
>         { .compatible =3D "mediatek,mt8173-disp-color",
>           .data =3D (void *)MTK_DISP_COLOR },
> +       { .compatible =3D "mediatek,mt8167-disp-aal",
> +         .data =3D (void *)MTK_DISP_AAL},
>         { .compatible =3D "mediatek,mt8173-disp-aal",
>           .data =3D (void *)MTK_DISP_AAL},
> +       { .compatible =3D "mediatek,mt8167-disp-gamma",
> +         .data =3D (void *)MTK_DISP_GAMMA, },
>         { .compatible =3D "mediatek,mt8173-disp-gamma",
>           .data =3D (void *)MTK_DISP_GAMMA, },
> +       { .compatible =3D "mediatek,mt8167-disp-dither",
> +         .data =3D (void *)MTK_DISP_DITHER },
>         { .compatible =3D "mediatek,mt8173-disp-ufoe",
>           .data =3D (void *)MTK_DISP_UFOE },
>         { .compatible =3D "mediatek,mt2701-dsi",
>           .data =3D (void *)MTK_DSI },
> +       { .compatible =3D "mediatek,mt8167-dsi",
> +         .data =3D (void *)MTK_DSI },
>         { .compatible =3D "mediatek,mt8173-dsi",
>           .data =3D (void *)MTK_DSI },
>         { .compatible =3D "mediatek,mt2701-dpi",
> @@ -431,10 +463,14 @@ static const struct of_device_id mtk_ddp_comp_dt_id=
s[] =3D {
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt2712-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
> +       { .compatible =3D "mediatek,mt8167-disp-mutex",
> +         .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8173-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt2701-disp-pwm",
>           .data =3D (void *)MTK_DISP_BLS },
> +       { .compatible =3D "mediatek,mt8167-disp-pwm",
> +         .data =3D (void *)MTK_DISP_PWM },
>         { .compatible =3D "mediatek,mt8173-disp-pwm",
>           .data =3D (void *)MTK_DISP_PWM },
>         { .compatible =3D "mediatek,mt8173-disp-od",
> @@ -449,6 +485,8 @@ static const struct of_device_id mtk_drm_of_ids[] =3D=
 {
>           .data =3D &mt7623_mmsys_driver_data},
>         { .compatible =3D "mediatek,mt2712-mmsys",
>           .data =3D &mt2712_mmsys_driver_data},
> +       { .compatible =3D "mediatek,mt8167-mmsys",
> +         .data =3D &mt8167_mmsys_driver_data},
>         { .compatible =3D "mediatek,mt8173-mmsys",
>           .data =3D &mt8173_mmsys_driver_data},
>         { }
> --
> 2.28.0
>

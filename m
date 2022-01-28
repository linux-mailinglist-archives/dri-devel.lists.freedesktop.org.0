Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E291649FDE1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 17:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52F010EB51;
	Fri, 28 Jan 2022 16:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE07810EAA4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:19:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 498AC61F0A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3ACC36AE5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643386754;
 bh=fD5y5+RxVxJbAjwnRL0Gcjwy+JCQgKkKiJKWB/hr9ZE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pLdiMamXFvznn4sfU/OlT6PQxSNkbq+I43t+cnGnSl7rkHbBeeBrS4xj5vw5Wwier
 ibfbYtHEtY571/HHJfN5HYd1lYYQCy0xeeBHSHv3oJ02Xb9RfGwXEVnNij4EVuCjIA
 VMD/Qymv6iZSHwLAQn17GO/tVfVeYZxDhRvjraH7Oorby/URhtViJzsCzZfsyUkZk/
 WXVK267uhRyS018W5FNSQwgipjO7fFvLZgnQcnmwfpXhiOzebPUK35NKyyyBIPh6oW
 3waTT2LyyiVQ1xhjTasJt5hBl3prjkaTvsgk0djjvr0Q/xSWeuslNX+ITRPx1NFx/m
 f3YEZLInNlHew==
Received: by mail-ej1-f46.google.com with SMTP id j2so17536212ejk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 08:19:14 -0800 (PST)
X-Gm-Message-State: AOAM531wfG/RmkOrRhu2a/rNJraSf0GAKfULzO9M7/vt6mVojNKNCw5x
 kOti8VlWkAvl9VYyraQ4LmUsvlHDmuFOgjxnaA==
X-Google-Smtp-Source: ABdhPJzaVNhN4Lp5kRT0pDrdXP2bqgeUBcLYAhm9wcVbdADCPGfdi9izUodQ5zDtyd7TY5wC8q/EJOif3CkwqnT/Bp0=
X-Received: by 2002:a17:907:a089:: with SMTP id
 hu9mr7617781ejc.680.1643386752416; 
 Fri, 28 Jan 2022 08:19:12 -0800 (PST)
MIME-Version: 1.0
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
 <20220128120718.30545-5-yongqiang.niu@mediatek.com>
In-Reply-To: <20220128120718.30545-5-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 29 Jan 2022 00:19:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8uF1TY9TsP3wUW6gw9M21F9Op9wRc9GDX7edbSa8sQeQ@mail.gmail.com>
Message-ID: <CAAOTY_8uF1TY9TsP3wUW6gw9M21F9Op9wRc9GDX7edbSa8sQeQ@mail.gmail.com>
Subject: Re: [PATCH v1, 4/4] drm/mediatek: add mt8186 display support
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

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2022=E5=B9=B41=E6=9C=
=8828=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:07=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 39 ++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6efb423ccc92..754b1be25d0d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -158,6 +158,24 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext=
[] =3D {
>         DDP_COMPONENT_DPI0,
>  };
>
> +static const enum mtk_ddp_comp_id mt8186_mtk_ddp_main[] =3D {
> +       DDP_COMPONENT_OVL0,
> +       DDP_COMPONENT_RDMA0,
> +       DDP_COMPONENT_COLOR0,
> +       DDP_COMPONENT_CCORR,
> +       DDP_COMPONENT_AAL0,
> +       DDP_COMPONENT_GAMMA,
> +       DDP_COMPONENT_POSTMASK0,
> +       DDP_COMPONENT_DITHER,
> +       DDP_COMPONENT_DSI0,
> +};
> +
> +static const enum mtk_ddp_comp_id mt8186_mtk_ddp_ext[] =3D {
> +       DDP_COMPONENT_OVL_2L0,
> +       DDP_COMPONENT_RDMA1,
> +       DDP_COMPONENT_DPI0,
> +};
> +
>  static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] =3D {
>         DDP_COMPONENT_OVL0,
>         DDP_COMPONENT_OVL_2L0,
> @@ -221,6 +239,13 @@ static const struct mtk_mmsys_driver_data mt8183_mms=
ys_driver_data =3D {
>         .ext_len =3D ARRAY_SIZE(mt8183_mtk_ddp_ext),
>  };
>
> +static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data =3D {
> +       .main_path =3D mt8186_mtk_ddp_main,
> +       .main_len =3D ARRAY_SIZE(mt8186_mtk_ddp_main),
> +       .ext_path =3D mt8186_mtk_ddp_ext,
> +       .ext_len =3D ARRAY_SIZE(mt8186_mtk_ddp_ext),
> +};
> +
>  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =3D {
>         .main_path =3D mt8192_mtk_ddp_main,
>         .main_len =3D ARRAY_SIZE(mt8192_mtk_ddp_main),
> @@ -463,6 +488,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8183-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
> +       { .compatible =3D "mediatek,mt8186-disp-mutex",
> +         .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8192-disp-mutex",
>           .data =3D (void *)MTK_DISP_MUTEX },
>         { .compatible =3D "mediatek,mt8173-disp-od",
> @@ -475,14 +502,20 @@ static const struct of_device_id mtk_ddp_comp_dt_id=
s[] =3D {
>           .data =3D (void *)MTK_DISP_OVL },
>         { .compatible =3D "mediatek,mt8183-disp-ovl",
>           .data =3D (void *)MTK_DISP_OVL },
> +       { .compatible =3D "mediatek,mt8186-disp-ovl",

Add "mediatek,mt8186-disp-ovl" to binding document.

> +         .data =3D (void *)MTK_DISP_OVL },
>         { .compatible =3D "mediatek,mt8192-disp-ovl",
>           .data =3D (void *)MTK_DISP_OVL },
>         { .compatible =3D "mediatek,mt8183-disp-ovl-2l",
>           .data =3D (void *)MTK_DISP_OVL_2L },
> +       { .compatible =3D "mediatek,mt8186-disp-ovl-2l",

Ditto.

> +         .data =3D (void *)MTK_DISP_OVL_2L },
>         { .compatible =3D "mediatek,mt8192-disp-ovl-2l",
>           .data =3D (void *)MTK_DISP_OVL_2L },
>         { .compatible =3D "mediatek,mt8192-disp-postmask",
>           .data =3D (void *)MTK_DISP_POSTMASK },
> +       { .compatible =3D "mediatek,mt8186-disp-postmask",

Ditto.

> +         .data =3D (void *)MTK_DISP_POSTMASK},
>         { .compatible =3D "mediatek,mt2701-disp-pwm",
>           .data =3D (void *)MTK_DISP_BLS },
>         { .compatible =3D "mediatek,mt8167-disp-pwm",
> @@ -511,12 +544,16 @@ static const struct of_device_id mtk_ddp_comp_dt_id=
s[] =3D {
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8183-dpi",
>           .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt8186-dpi",

Ditto.

> +         .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt2701-dsi",
>           .data =3D (void *)MTK_DSI },
>         { .compatible =3D "mediatek,mt8173-dsi",
>           .data =3D (void *)MTK_DSI },
>         { .compatible =3D "mediatek,mt8183-dsi",
>           .data =3D (void *)MTK_DSI },
> +       { .compatible =3D "mediatek,mt8186-dsi",

Ditto.

Regards,
Chun-Kuang.

> +         .data =3D (void *)MTK_DSI },
>         { }
>  };
>
> @@ -533,6 +570,8 @@ static const struct of_device_id mtk_drm_of_ids[] =3D=
 {
>           .data =3D &mt8173_mmsys_driver_data},
>         { .compatible =3D "mediatek,mt8183-mmsys",
>           .data =3D &mt8183_mmsys_driver_data},
> +       { .compatible =3D "mediatek,mt8186-mmsys",
> +         .data =3D &mt8186_mmsys_driver_data},
>         { .compatible =3D "mediatek,mt8192-mmsys",
>           .data =3D &mt8192_mmsys_driver_data},
>         { }
> --
> 2.25.1
>

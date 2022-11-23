Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52864636368
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7480210E213;
	Wed, 23 Nov 2022 15:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCAA10E213
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:25:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 963E461D9C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08234C433D6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669217131;
 bh=RtxS3m8RidOG39tfzw7d4tVjWi8ImaOggtUBMDmGKOk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oSorEMc2dHiBGtYNXsHTl12w2fVInFgukQW47xG4DnuHpRzcTKx1etSLqVxA6vqSA
 TDUM6TIDXCPOGEYOUegUztFeCKhCJ7D5AB2WLgvgQodZZxcw43EahjgiLYwJ23PhzV
 HC0Yl39AFe2iVN2gziTKruIIV3fHzFv+xMkdDDtuZfXPSZFCi1nyIvlz9AgCAxDj2E
 XSJioyc4k1+SagJVRkJJCkI4kF7ylP/mm8UJnqeJmbiXAUQBPfHKI6Rq/2EybrwxQf
 ijVZsNtZnWCo3Hc+gUdfTK04/8uswxdt+DilpEgrCSLJ3OAf643WTsZu1vnKRg4xxv
 th7OBfjaluPoQ==
Received: by mail-ot1-f46.google.com with SMTP id
 w26-20020a056830061a00b0066c320f5b49so11410126oti.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 07:25:30 -0800 (PST)
X-Gm-Message-State: ANoB5pnzEiY1segVCPLu1MYNYNi9UUOf1vBeNm8TcsDTCa52/QsQe/8I
 6DVd3M36Al7fDrxmT4OXFummGfDVgN7X+bx1iw==
X-Google-Smtp-Source: AA0mqf49fnswLYy6SsiK1Ro9HFjY4CW9aK/5sATEF6GPDJi3Wc2i0C/TiO825btUhwszzmrdBBQ9RzCdpGxBDCNpAIY=
X-Received: by 2002:a05:6830:d87:b0:66d:8b98:683f with SMTP id
 bv7-20020a0568300d8700b0066d8b98683fmr15490045otb.40.1669217130091; Wed, 23
 Nov 2022 07:25:30 -0800 (PST)
MIME-Version: 1.0
References: <1666266353-16670-1-git-send-email-xinlei.lee@mediatek.com>
 <1666266353-16670-3-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1666266353-16670-3-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Nov 2022 23:25:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9+VWN3S3=BRMXaEf5A5G_AVaDa=V2v3AVXT=3O-DrJEQ@mail.gmail.com>
Message-ID: <CAAOTY_9+VWN3S3=BRMXaEf5A5G_AVaDa=V2v3AVXT=3O-DrJEQ@mail.gmail.com>
Subject: Re: [PATCH v2,2/2] drm: mediatek: Add mt8188 dpi compatibles and
 platform data
To: xinlei.lee@mediatek.com
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Xinlei:

<xinlei.lee@mediatek.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=8820=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A7:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: xinlei lee <xinlei.lee@mediatek.com>
>
> For MT8188, the vdosys0 only supports 1T1P mode, so we need to add the co=
mpatible for mt8188 edp-intf.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

>
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c     | 17 +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 508a6d9..02c2a00 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -929,6 +929,20 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .csc_enable_bit =3D CSC_ENABLE,
>  };
>
> +static const struct mtk_dpi_conf mt8188_dpintf_conf =3D {
> +       .cal_factor =3D mt8195_dpintf_calculate_factor,
> +       .max_clock_khz =3D 600000,
> +       .output_fmts =3D mt8195_output_fmts,
> +       .num_output_fmts =3D ARRAY_SIZE(mt8195_output_fmts),
> +       .pixels_per_iter =3D 4,
> +       .input_2pixel =3D false,
> +       .dimension_mask =3D DPINTF_HPW_MASK,
> +       .hvsize_mask =3D DPINTF_HSIZE_MASK,
> +       .channel_swap_shift =3D DPINTF_CH_SWAP,
> +       .yuv422_en_bit =3D DPINTF_YUV422_EN,
> +       .csc_enable_bit =3D DPINTF_CSC_ENABLE,
> +};
> +
>  static const struct mtk_dpi_conf mt8192_conf =3D {
>         .cal_factor =3D mt8183_calculate_factor,
>         .reg_h_fre_con =3D 0xe0,
> @@ -1079,6 +1093,9 @@ static const struct of_device_id mtk_dpi_of_ids[] =
=3D {
>         { .compatible =3D "mediatek,mt8183-dpi",
>           .data =3D &mt8183_conf,
>         },
> +       { .compatible =3D "mediatek,mt8188-dp-intf",
> +         .data =3D &mt8188_dpintf_conf,
> +       },
>         { .compatible =3D "mediatek,mt8192-dpi",
>           .data =3D &mt8192_conf,
>         },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 91f58db..950bd04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -631,6 +631,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8183-dpi",
>           .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt8188-dp-intf",
> +         .data =3D (void *)MTK_DP_INTF },
>         { .compatible =3D "mediatek,mt8192-dpi",
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8195-dp-intf",
> --
> 2.6.4
>

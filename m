Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C714BD3A4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 03:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1471110E196;
	Mon, 21 Feb 2022 02:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E331C10E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:32:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B3BC61113
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4972EC340FC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645410766;
 bh=0jsRD7cxJXC7LM6Gajfxrs8QV4QjeNnPnIXPYuhllT8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FBn02HELnb62R3PHfzhqu3w2/puH9BB71lmp1+JbMtBTQK4iXpp5Gptu5EwUi318o
 axZsZkzxdbnzyd9f4uv7KJJI7MLzGyVAyCThWAj/0SFLgpq6o50spxLTs50HPIqYLg
 CvQbZJmL25f+qYa3avYEiu/660iUkBWV1kHsbiyqJJ2JhkjhUPKuj5zosFy+97WMff
 P6aLZHJVws3yYjudmyiqb1GQ1qSRD6d57rdpB3oM1WSIBmRH3Kwq4MnycwPUnw/KVm
 VMrHL9g31epieHaV/9oDCKO/NSnvsd4+PuPoAmoK85dyjnFTA/6Kca+R7jwh8IHbLa
 yXON4TfoDr1Gg==
Received: by mail-ej1-f52.google.com with SMTP id hw13so29175190ejc.9
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 18:32:46 -0800 (PST)
X-Gm-Message-State: AOAM530twAnb/s2F1WOpWIRUUJRntqmW4qYzaZ3Mc5PF4dnzcEZeha/X
 W+CjFAizzxebi7NXsCA/9gB4O7KlMT6P/Qw3Yg==
X-Google-Smtp-Source: ABdhPJz2uuAFArWvpdO16hER5PM32Ny9J4D8AGVlqgdAATHBKDTbcCog+Sa1GoLGAIMj8A8YCPDI1915gwsrWyH6h64=
X-Received: by 2002:a17:906:2a11:b0:69f:286a:66a7 with SMTP id
 j17-20020a1709062a1100b0069f286a66a7mr14222076eje.680.1645410764208; Sun, 20
 Feb 2022 18:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-8-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-8-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 10:32:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-5g4fXVTOETDxbn2Cp3MVjFs-Sh9NT1NepfEXUhdJQEw@mail.gmail.com>
Message-ID: <CAAOTY_-5g4fXVTOETDxbn2Cp3MVjFs-Sh9NT1NepfEXUhdJQEw@mail.gmail.com>
Subject: Re: [PATCH v8 07/19] drm/mediatek: dpi: implement a swap_input toggle
 in board config
To: Guillaume Ranquet <granquet@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-phy@lists.infradead.org, deller@gmx.de,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=88=
18=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Adds a bit of flexibility to support boards without swap_input support
>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 545a1337cc899..454f8563efae4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -126,6 +126,7 @@ struct mtk_dpi_conf {
>         const u32 *output_fmts;
>         u32 num_output_fmts;
>         bool is_ck_de_pol;
> +       bool swap_input_support;
>         const struct mtk_dpi_yc_limit *limit;
>  };
>
> @@ -378,18 +379,21 @@ static void mtk_dpi_config_color_format(struct mtk_=
dpi *dpi,
>             (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
>                 mtk_dpi_config_yuv422_enable(dpi, false);
>                 mtk_dpi_config_csc_enable(dpi, true);
> -               mtk_dpi_config_swap_input(dpi, false);
> +               if (dpi->conf->swap_input_support)
> +                       mtk_dpi_config_swap_input(dpi, false);
>                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP=
_BGR);
>         } else if ((format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
>                    (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
>                 mtk_dpi_config_yuv422_enable(dpi, true);
>                 mtk_dpi_config_csc_enable(dpi, true);
> -               mtk_dpi_config_swap_input(dpi, true);
> +               if (dpi->conf->swap_input_support)
> +                       mtk_dpi_config_swap_input(dpi, true);

In MT8173, MT2701, MT8183, MT8192, YCBCR_444 would not swap but
YCBCR_422 would swap. But In MT8195, both YCBCR_444 and YCBCR_422
would not swap, So I think one of these format would be abnormal in
MT8195, right? Or would you provide more information about how this
swap work?

Regards,
Chun-Kuang.

>                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP=
_RGB);
>         } else {
>                 mtk_dpi_config_yuv422_enable(dpi, false);
>                 mtk_dpi_config_csc_enable(dpi, false);
> -               mtk_dpi_config_swap_input(dpi, false);
> +               if (dpi->conf->swap_input_support)
> +                       mtk_dpi_config_swap_input(dpi, false);
>                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP=
_RGB);
>         }
>  }
> @@ -808,6 +812,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
>         .output_fmts =3D mt8173_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
>         .is_ck_de_pol =3D true,
> +       .swap_input_support =3D true,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -819,6 +824,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
>         .output_fmts =3D mt8173_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
>         .is_ck_de_pol =3D true,
> +       .swap_input_support =3D true,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -829,6 +835,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .output_fmts =3D mt8183_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
>         .is_ck_de_pol =3D true,
> +       .swap_input_support =3D true,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -839,6 +846,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .output_fmts =3D mt8173_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
>         .is_ck_de_pol =3D true,
> +       .swap_input_support =3D true,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> --
> 2.34.1
>

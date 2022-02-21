Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901F84BD3DA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 03:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3519B10E28F;
	Mon, 21 Feb 2022 02:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99D410E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:43:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6223161134
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75920C36AE7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645411413;
 bh=fr9WRLrW4coExEzj2Kuaw9OBpeHu4mj+MkxXimcnkCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tHGeFe5kGxavBagXfuqMvZGtm9XDhRHHf+F/OYh1gQbFsj115H1fn7bAF3Gy/ZjSV
 tKvXiYAod5rP1da37lvbUbVcupqxjUDf9xRGMcPJE7PGqzqDVLfqGRbd/+GORMiP4O
 Gxe/IimKdeCkmmB86sCgXl8gg7pWab1VGJvjWP0unJ8jiqE949Ywbxs0mCtnjxBB/k
 zlWlE8hjtFtl02/DkLFkYhaG2nIaCaH/9rZIKqdhJdyRcVEkz3xlJLGRyDMHXsDD04
 Q+qfu4OFlOx6hK+6w9Stp1ZngsaT7szHesbaI/vsJaIb1ezjuwYbrropLb71RNgIzV
 eZXH4RvJ2WmPQ==
Received: by mail-ej1-f45.google.com with SMTP id hw13so29226914ejc.9
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 18:43:33 -0800 (PST)
X-Gm-Message-State: AOAM533EbtCGB38NKvygIm2thQvpNRTp3t37llb+VCkzZ4lTISyktQnu
 scwKfwSLptyx9j2HDMv1YWTMYH92m9t4q+oN7A==
X-Google-Smtp-Source: ABdhPJwOzYdjdfRguJrzoCzdajK1FOiYj6KmzNtAScRDhOVtID8EpaZbeIyGY8zVQWhRYhYShCXwM4IhUMsXpmbxZhY=
X-Received: by 2002:a17:906:b348:b0:6cf:5b66:2f80 with SMTP id
 cd8-20020a170906b34800b006cf5b662f80mr13893213ejb.638.1645411411757; Sun, 20
 Feb 2022 18:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-10-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-10-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 10:43:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8zj3PxdZ-CftM8jE+0T-vmck1UMH9tNYN6YL5MuaTdQw@mail.gmail.com>
Message-ID: <CAAOTY_8zj3PxdZ-CftM8jE+0T-vmck1UMH9tNYN6YL5MuaTdQw@mail.gmail.com>
Subject: Re: [PATCH v8 09/19] drm/mediatek: dpi: move dimension_mask to board
 config
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
> Add flexibility by moving the dimension mask to board config

Replace 'board' with 'SoC'.

>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 8ca3455ed64ee..0d3acd08ea358 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -129,6 +129,8 @@ struct mtk_dpi_conf {
>         bool swap_input_support;
>         // Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no =
shift)
>         u32 dimension_mask;
> +       // Mask used for HSIZE and VSIZE (no shift)

/* ... */

Regards,
Chun-Kuang.

> +       u32 hvsize_mask;
>         const struct mtk_dpi_yc_limit *limit;
>  };
>
> @@ -243,8 +245,10 @@ static void mtk_dpi_config_interface(struct mtk_dpi =
*dpi, bool inter)
>
>  static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 h=
eight)
>  {
> -       mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
> -       mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
> +       mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
> +                    dpi->conf->hvsize_mask << HSIZE);
> +       mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
> +                    dpi->conf->hvsize_mask << VSIZE);
>  }
>
>  static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
> @@ -816,6 +820,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
>         .is_ck_de_pol =3D true,
>         .swap_input_support =3D true,
>         .dimension_mask =3D HPW_MASK,
> +       .hvsize_mask =3D HSIZE_MASK,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -829,6 +834,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
>         .is_ck_de_pol =3D true,
>         .swap_input_support =3D true,
>         .dimension_mask =3D HPW_MASK,
> +       .hvsize_mask =3D HSIZE_MASK,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -841,6 +847,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .is_ck_de_pol =3D true,
>         .swap_input_support =3D true,
>         .dimension_mask =3D HPW_MASK,
> +       .hvsize_mask =3D HSIZE_MASK,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -853,6 +860,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .is_ck_de_pol =3D true,
>         .swap_input_support =3D true,
>         .dimension_mask =3D HPW_MASK,
> +       .hvsize_mask =3D HSIZE_MASK,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> --
> 2.34.1
>

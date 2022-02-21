Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5CA4BD434
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 04:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F2410E2D4;
	Mon, 21 Feb 2022 03:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927910E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:33:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A85D361168
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888C6C340F1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645414396;
 bh=jX3lfdiLUVCw6uNnO03H95weJLMzcQ7bp4tg8jLdSxI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BLvFy+oyFgpf1kjBC/6XOK8zM/GyfV2FnY64eMuTKKhzMfcc/w5DNoaKvlvpwYmx6
 yfmZoqnpPDxjVzzvGFoYT9dbG7eXxV9HzaU0s0cp/kAEu01pH28hsO2K5+cHXJrdha
 B3TPihjH1j7pWgNUiN8StjCdP5qrH0XX7D0RHO/3JN9DiZegbQr/4SlF0rj1vYejdi
 6kGU4Jbyal+kPlaC+x+D9IRUOpbxg2AZTQ3sXFzo2dWxD8JDpR/jAXq7JzMoj6bktT
 OqtzEj61wIzP1F5vuKrfUkx/mdAmdYkvsjiJH+1oHdA4sOslPgguI4lounlgquuAGE
 PcI2bP1F/rMbQ==
Received: by mail-ej1-f41.google.com with SMTP id vz16so29701404ejb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 19:33:16 -0800 (PST)
X-Gm-Message-State: AOAM533LAgR4bWEqQT+ag+G7ZviLSGpevWm2XeV7V200YIsQBE/RvJR/
 pEnXjPWFz+jHkqO8bqYj4CWkRP3zxJS/EPZefA==
X-Google-Smtp-Source: ABdhPJyH+8NQ9JObbRrNfFEeuU51f6EKV59HjEwkk77My7ZD/4unjxWgtNqhunLC4/YWgzTsjkYV7tCd1S4zNzS1W3o=
X-Received: by 2002:a17:906:79c4:b0:6cf:5489:da57 with SMTP id
 m4-20020a17090679c400b006cf5489da57mr14515037ejo.48.1645414394846; Sun, 20
 Feb 2022 19:33:14 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-13-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-13-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 11:33:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__3K=2ommcNcfow7kKkOQpL7D0_YuqNBB9rQWjhz7e_DA@mail.gmail.com>
Message-ID: <CAAOTY__3K=2ommcNcfow7kKkOQpL7D0_YuqNBB9rQWjhz7e_DA@mail.gmail.com>
Subject: Re: [PATCH v8 12/19] drm/mediatek: dpi: move the csc_enable bit to
 board config
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
> Add flexibility by moving the csc_enable bit to board config

After replace 'board' with 'SoC',

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index fcf88dcd8b89d..be99399faf1bb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -133,6 +133,7 @@ struct mtk_dpi_conf {
>         u32 hvsize_mask;
>         u32 channel_swap_shift;
>         u32 yuv422_en_bit;
> +       u32 csc_enable_bit;
>         const struct mtk_dpi_yc_limit *limit;
>  };
>
> @@ -363,7 +364,8 @@ static void mtk_dpi_config_yuv422_enable(struct mtk_d=
pi *dpi, bool enable)
>
>  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
>  {
> -       mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENABLE);
> +       mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit : 0=
,
> +                    dpi->conf->csc_enable_bit);
>  }
>
>  static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
> @@ -827,6 +829,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
>         .hvsize_mask =3D HSIZE_MASK,
>         .channel_swap_shift =3D CH_SWAP,
>         .yuv422_en_bit =3D YUV422_EN,
> +       .csc_enable_bit =3D CSC_ENABLE,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -843,6 +846,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
>         .hvsize_mask =3D HSIZE_MASK,
>         .channel_swap_shift =3D CH_SWAP,
>         .yuv422_en_bit =3D YUV422_EN,
> +       .csc_enable_bit =3D CSC_ENABLE,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -858,6 +862,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .hvsize_mask =3D HSIZE_MASK,
>         .channel_swap_shift =3D CH_SWAP,
>         .yuv422_en_bit =3D YUV422_EN,
> +       .csc_enable_bit =3D CSC_ENABLE,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -873,6 +878,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .hvsize_mask =3D HSIZE_MASK,
>         .channel_swap_shift =3D CH_SWAP,
>         .yuv422_en_bit =3D YUV422_EN,
> +       .csc_enable_bit =3D CSC_ENABLE,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> --
> 2.34.1
>

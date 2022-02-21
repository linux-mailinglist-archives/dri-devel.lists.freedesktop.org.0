Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BEE4BD430
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 04:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D2E10E298;
	Mon, 21 Feb 2022 03:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1512D10E295
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:32:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94D256114B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DA8C340E9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645414327;
 bh=sVhTO4V/J+PBVK3PUU1n0L77FQqMLHWUGIXArEdj6Hk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QTXZLcV2g1mwDd3vhOiWDK2QPhJNGx0C/4w+pFX51DjAnQJjO5fF/sHze6pHGH81Y
 SywJb7J8T1SHxc9uKuAzPpz1HDaYQsAFhceuTPnwp6ESEb2XBuDY73UfWABxAh+hki
 gZLeRVbhzbJvg7zAewFwbqKRAcZv75dxwfP9TPlMRcMRhCmNFvKq1TSpFfgobAzpR4
 ZXub9Ap1NOlEEm/juDYhoLsv5So6U3q+f8zpWyCux/08TPtHuZPJCKAgbbsXBw6egR
 Ce4q8F3wYiln4kgU4mpmPBB444UHJxY0JLMyYQ1MIri7iLkvnp0HEH7P+ujACjLb5A
 6c08ySdW/QxDw==
Received: by mail-ej1-f44.google.com with SMTP id a8so29616647ejc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 19:32:07 -0800 (PST)
X-Gm-Message-State: AOAM530i/lB84KApfGtIx1Yn1n8esKFCdAR6mfCyZY6q7OSSnfL9+KPd
 lYjhJJs5PRMP71vs+2V4AHHCoQ33yAbZjXIRMg==
X-Google-Smtp-Source: ABdhPJxfxo0hzxeTqTccLlT0ltYFEr2mGzS6xuefZo7jwVZH88S6M6qDz0iPDAFl7ugWQnJtM4+isexDKT36CBTSYE8=
X-Received: by 2002:a17:906:2a11:b0:69f:286a:66a7 with SMTP id
 j17-20020a1709062a1100b0069f286a66a7mr14319822eje.680.1645414326327; Sun, 20
 Feb 2022 19:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-12-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-12-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 11:31:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Bqo+1JoVJdk7eUEoW3B4ZKhzhuvFEqxxGxweQkQBbKA@mail.gmail.com>
Message-ID: <CAAOTY_-Bqo+1JoVJdk7eUEoW3B4ZKhzhuvFEqxxGxweQkQBbKA@mail.gmail.com>
Subject: Re: [PATCH v8 11/19] drm/mediatek: dpi: move the yuv422_en_bit to
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
> Add flexibility by moving the yuv422 en bit to board config

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
> index ec221e24e0fee..fcf88dcd8b89d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -132,6 +132,7 @@ struct mtk_dpi_conf {
>         // Mask used for HSIZE and VSIZE (no shift)
>         u32 hvsize_mask;
>         u32 channel_swap_shift;
> +       u32 yuv422_en_bit;
>         const struct mtk_dpi_yc_limit *limit;
>  };
>
> @@ -356,7 +357,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dp=
i *dpi,
>
>  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enabl=
e)
>  {
> -       mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
> +       mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->yuv422_en_bit : 0,
> +                    dpi->conf->yuv422_en_bit);
>  }
>
>  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
> @@ -824,6 +826,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
>         .dimension_mask =3D HPW_MASK,
>         .hvsize_mask =3D HSIZE_MASK,
>         .channel_swap_shift =3D CH_SWAP,
> +       .yuv422_en_bit =3D YUV422_EN,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -839,6 +842,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
>         .dimension_mask =3D HPW_MASK,
>         .hvsize_mask =3D HSIZE_MASK,
>         .channel_swap_shift =3D CH_SWAP,
> +       .yuv422_en_bit =3D YUV422_EN,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -853,6 +857,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .dimension_mask =3D HPW_MASK,
>         .hvsize_mask =3D HSIZE_MASK,
>         .channel_swap_shift =3D CH_SWAP,
> +       .yuv422_en_bit =3D YUV422_EN,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -867,6 +872,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .dimension_mask =3D HPW_MASK,
>         .hvsize_mask =3D HSIZE_MASK,
>         .channel_swap_shift =3D CH_SWAP,
> +       .yuv422_en_bit =3D YUV422_EN,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> --
> 2.34.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ABD4BD336
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 02:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2BC10E277;
	Mon, 21 Feb 2022 01:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BF210E277
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 01:46:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 137E8B80E3D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 01:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2B4C340E8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645407989;
 bh=4qgWKGsTwLoKg719UeLRaB5xjFNi6yHpYigKnDRlLFk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cIpg7hWw619i1bNWsfqhIAudwb9q8gBVD/5k1jA+qknLVsNIYcWosvE4S7bItkcmV
 afuTap6aE+Y2DBCxndC3DH37OGkjjBOyrZPFi6vU1FrijikCsW6KX8Oy5ZedFJyKVQ
 cBY8KP262S1QiZQLcENg7FczMuwbFpw65fXkZSTsSu3LVf8BscH+rlQX3i4+M7DkIx
 6r9gdbIbFMCvsq8MmB8KvbZeHkGLya/iDwlfHEtqu7si38hatWU+27W9d2XzCTCT6b
 1mhxbvs84QNpZpFZ1Z/2v660ZSCTBkLy1BCUUcXOBcxbVH4dgQbWN2U9526vSsrwqs
 hq3I5C3GBQq1g==
Received: by mail-ej1-f53.google.com with SMTP id p15so29010917ejc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 17:46:29 -0800 (PST)
X-Gm-Message-State: AOAM533uiVz9vb/YU2wWUY6Lyybk6dJkuUhUJapCe6PbNoGMQLKq1XSo
 9NnPaVMgUhjs+0yltPGuxmKvqOytCVkNh1RosA==
X-Google-Smtp-Source: ABdhPJwuTQy36EkhUNRD6M2+IcyGr33kZ+4z7L5xdpFKroaHetdf6U/UnYEQCCEMkMZsPcTHm7dMj6912ba9+VrWsIg=
X-Received: by 2002:a17:906:b348:b0:6cf:5b66:2f80 with SMTP id
 cd8-20020a170906b34800b006cf5b662f80mr13799127ejb.638.1645407988130; Sun, 20
 Feb 2022 17:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-6-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-6-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 09:46:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY__u8R-WkTmnKkey5p7_fVuy2mgoRY4Fx_kqb5kb4hnqmQ@mail.gmail.com>
Message-ID: <CAAOTY__u8R-WkTmnKkey5p7_fVuy2mgoRY4Fx_kqb5kb4hnqmQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/19] drm/mediatek: dpi: move dpi limits to board
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
> Add flexibility by moving the dpi limits to the board config

This patch looks good to me. But I would like to know what's this
limit and why it vary in different SoC. If possible, would you please
provide more description for this?

Regards,
Chun-Kuang.

>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 4554e2de14309..4746eb3425674 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -125,6 +125,7 @@ struct mtk_dpi_conf {
>         bool edge_sel_en;
>         const u32 *output_fmts;
>         u32 num_output_fmts;
> +       const struct mtk_dpi_yc_limit *limit;
>  };
>
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 m=
ask)
> @@ -235,9 +236,10 @@ static void mtk_dpi_config_fb_size(struct mtk_dpi *d=
pi, u32 width, u32 height)
>         mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
>  }
>
> -static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi,
> -                                        struct mtk_dpi_yc_limit *limit)
> +static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
>  {
> +       const struct mtk_dpi_yc_limit *limit =3D dpi->conf->limit;
> +
>         mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_bottom << Y_LIMINT_BOT,
>                      Y_LIMINT_BOT_MASK);
>         mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_top << Y_LIMINT_TOP,
> @@ -449,7 +451,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>                                     struct drm_display_mode *mode)
>  {
> -       struct mtk_dpi_yc_limit limit;
>         struct mtk_dpi_polarities dpi_pol;
>         struct mtk_dpi_sync_param hsync;
>         struct mtk_dpi_sync_param vsync_lodd =3D { 0 };
> @@ -484,11 +485,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *=
dpi,
>         dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
>                 pll_rate, vm.pixelclock);
>
> -       limit.c_bottom =3D 0x0010;
> -       limit.c_top =3D 0x0FE0;
> -       limit.y_bottom =3D 0x0010;
> -       limit.y_top =3D 0x0FE0;
> -
>         dpi_pol.ck_pol =3D MTK_DPI_POLARITY_FALLING;
>         dpi_pol.de_pol =3D MTK_DPI_POLARITY_RISING;
>         dpi_pol.hsync_pol =3D vm.flags & DISPLAY_FLAGS_HSYNC_HIGH ?
> @@ -536,7 +532,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *d=
pi,
>         else
>                 mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive);
>
> -       mtk_dpi_config_channel_limit(dpi, &limit);
> +       mtk_dpi_config_channel_limit(dpi);
>         mtk_dpi_config_bit_num(dpi, dpi->bit_num);
>         mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
>         mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> @@ -790,12 +786,20 @@ static const u32 mt8183_output_fmts[] =3D {
>         MEDIA_BUS_FMT_RGB888_2X12_BE,
>  };
>
> +static const struct mtk_dpi_yc_limit mtk_dpi_limit =3D {
> +       .c_bottom =3D 0x0010,
> +       .c_top =3D 0x0FE0,
> +       .y_bottom =3D 0x0010,
> +       .y_top =3D 0x0FE0,
> +};
> +
>  static const struct mtk_dpi_conf mt8173_conf =3D {
>         .cal_factor =3D mt8173_calculate_factor,
>         .reg_h_fre_con =3D 0xe0,
>         .max_clock_khz =3D 300000,
>         .output_fmts =3D mt8173_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> +       .limit =3D &mtk_dpi_limit,
>  };
>
>  static const struct mtk_dpi_conf mt2701_conf =3D {
> @@ -805,6 +809,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
>         .max_clock_khz =3D 150000,
>         .output_fmts =3D mt8173_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> +       .limit =3D &mtk_dpi_limit,
>  };
>
>  static const struct mtk_dpi_conf mt8183_conf =3D {
> @@ -813,6 +818,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .max_clock_khz =3D 100000,
>         .output_fmts =3D mt8183_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8183_output_fmts),
> +       .limit =3D &mtk_dpi_limit,
>  };
>
>  static const struct mtk_dpi_conf mt8192_conf =3D {
> @@ -821,6 +827,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .max_clock_khz =3D 150000,
>         .output_fmts =3D mt8173_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> +       .limit =3D &mtk_dpi_limit,
>  };
>
>  static int mtk_dpi_probe(struct platform_device *pdev)
> --
> 2.34.1
>

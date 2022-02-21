Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4F4BD423
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 04:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F32210E12B;
	Mon, 21 Feb 2022 03:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919D210E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:24:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 209FA61155
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59ACC340FC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645413886;
 bh=qO8573CRQiu/z0EEizzes65D3OQ8wZzEKmTCKW4MMZ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P7AwV41JAjM1ZOsTsvNlGJ6sJNmBEtTtLPKmNNZMC/XyySs3Tq3cBWL90hcL3jA/q
 uH9Vqr9YNCNgQQWZm0Ns9WoEljd+2walrv9TSiEkLrxEomBUJI0mMKWfIf5f0zDywj
 bossYpFjoH2fCEfV6X9jmPT+WwQZ5Am4PnnlP2Ibd54CyLY6tCVX3A+umM5Xi2ZPL6
 cqWvxZ7FiL48OjFb9T4kJAymjYyJaOzV6Txkn/N61dyxtab3v43prPY57tl1DEYf9B
 ZTyXJ7xlvbxzJPgswUVpXtVt4DPiaXRJdhBf+6O5c9xua6U289BEtAphzhZl4nKu6d
 +5Y+ufev1oAaQ==
Received: by mail-ej1-f54.google.com with SMTP id p14so29460504ejf.11
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 19:24:46 -0800 (PST)
X-Gm-Message-State: AOAM531DUL7UqeWb0gKMo1/WkbfMEzZzMYbY93u+QXelN7rxh62BCIAg
 QFYrddqkceVdVTXHF4/5LjdX6ARBUAmvrZe/FA==
X-Google-Smtp-Source: ABdhPJwjAPsaHxaTO2fPl36BRiMDL+aqL50uBkML8OltdMe4CzpwYsfSM7uRTzFcal0fd0xrQupABtvgOQ9eblRYB5w=
X-Received: by 2002:a17:906:8143:b0:6cf:73c1:8a0 with SMTP id
 z3-20020a170906814300b006cf73c108a0mr14451460ejw.406.1645413884967; Sun, 20
 Feb 2022 19:24:44 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-11-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-11-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 11:24:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9cOLJnTK0tSqfzyK4tUn_LUAywRPa+z7tTCOSien2j1Q@mail.gmail.com>
Message-ID: <CAAOTY_9cOLJnTK0tSqfzyK4tUn_LUAywRPa+z7tTCOSien2j1Q@mail.gmail.com>
Subject: Re: [PATCH v8 10/19] drm/mediatek: dpi: move swap_shift to board
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
> Add flexibility by moving the swap shift value to board config
>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 0d3acd08ea358..ec221e24e0fee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
>         u32 dimension_mask;
>         // Mask used for HSIZE and VSIZE (no shift)
>         u32 hvsize_mask;
> +       u32 channel_swap_shift;
>         const struct mtk_dpi_yc_limit *limit;
>  };
>
> @@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dp=
i *dpi,
>                 break;
>         }
>
> -       mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MAS=
K);
> +       mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> +                    CH_SWAP_MASK << dpi->conf->channel_swap_shift);

This may be wrong because of these definition:

#define DPINTF_CH_SWAP BIT(1)
#define DPINTF_CH_SWAP_MASK (0x7 << 1)

Regards,
Chun-Kuang.

>  }
>
>  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enabl=
e)
> @@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
>         .swap_input_support =3D true,
>         .dimension_mask =3D HPW_MASK,
>         .hvsize_mask =3D HSIZE_MASK,
> +       .channel_swap_shift =3D CH_SWAP,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
>         .swap_input_support =3D true,
>         .dimension_mask =3D HPW_MASK,
>         .hvsize_mask =3D HSIZE_MASK,
> +       .channel_swap_shift =3D CH_SWAP,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>         .swap_input_support =3D true,
>         .dimension_mask =3D HPW_MASK,
>         .hvsize_mask =3D HSIZE_MASK,
> +       .channel_swap_shift =3D CH_SWAP,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> @@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .swap_input_support =3D true,
>         .dimension_mask =3D HPW_MASK,
>         .hvsize_mask =3D HSIZE_MASK,
> +       .channel_swap_shift =3D CH_SWAP,
>         .limit =3D &mtk_dpi_limit,
>  };
>
> --
> 2.34.1
>

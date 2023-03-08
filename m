Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B476E6B168C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 00:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D160D10E75C;
	Wed,  8 Mar 2023 23:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8800310E75C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 23:35:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1005A6199F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 23:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78140C4339C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 23:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678318537;
 bh=RbtMQKg2Xucy89yY5ub2Cge2lq5W9QrN1nae527Olm8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cGiN3bc2o1ILpqLsATB8aSSSkQtP0+KAkMVoNd0eGmI2Y4K1dF5gtuOzfOs2z3G4B
 67iYUV/1sAvW1LyBpUeA7YRgeS7UYaBynPxT1aeftqGo7+z4m7B1bSoW4sBS/wsxxu
 PMtotBmjW8uIWkIFDbGgZ7YG9eahRTQNc6pfnSFbiMO7iOITFDjML5Tc8QuA8QQpjT
 7n7uISIji/AQtRTpggKw/7PMxZ2iPBM0ebgFaK/1MMqiqu/QBlxJ9Co7H2lejXR0Nb
 1wZ7jDJ8ar5uBi7V+OzpQd4VOhcwez0D+FQryPkoeRNzGzdI0QINGoLXlliHXsEftL
 BWNHjUSOCSZ/A==
Received: by mail-lj1-f169.google.com with SMTP id f16so56937ljq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 15:35:37 -0800 (PST)
X-Gm-Message-State: AO0yUKXPKXgcyKVTb7GRdJjDF45cwOuE8RlhbwvoK9bWBDd7uoI6+/G+
 bcNNP7FcWUlcqBHKQbOYtZAS6L18qVniYihRgQ==
X-Google-Smtp-Source: AK7set/tHrc6VkxMmyev2LYHjPqrafrWilhLS3Wfx2Fw/1l4z/og5+Y1EH6Tf7VSs2CrB+nG6v04akoO0HhR/rd2yp4=
X-Received: by 2002:a2e:a36a:0:b0:295:9040:fb0b with SMTP id
 i10-20020a2ea36a000000b002959040fb0bmr6196931ljn.10.1678318535536; Wed, 08
 Mar 2023 15:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20230308153358.333297-1-greenjustin@chromium.org>
 <20230308153358.333297-4-greenjustin@chromium.org>
In-Reply-To: <20230308153358.333297-4-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Mar 2023 07:35:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8fsqu7kK1Wv3_x4Yv4OT+5REh=21tbahrfZpHAK2A3Zw@mail.gmail.com>
Message-ID: <CAAOTY_8fsqu7kK1Wv3_x4Yv4OT+5REh=21tbahrfZpHAK2A3Zw@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 3/3] drm/mediatek: Enable AR30 and BA30 overlays
 on MT8195
To: Justin Green <greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
>

Describe more about what and why this patch does. The other
modification looks good to me.

Regards,
Chun-Kuang.

> Tested using "modetest -P" on an MT8195 device.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index a6255e847104..7d26f7055751 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -85,6 +85,22 @@ static const u32 mt8173_formats[] =3D {
>         DRM_FORMAT_YUYV,
>  };
>
> +static const u32 mt8195_formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_ARGB2101010,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_BGRA1010102,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};
> +
>  struct mtk_disp_ovl_data {
>         unsigned int addr;
>         unsigned int gmc_bits;
> @@ -616,8 +632,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driv=
er_data =3D {
>         .fmt_rgb565_is_0 =3D true,
>         .smi_id_en =3D true,
>         .supports_afbc =3D true,
> -       .formats =3D mt8173_formats,
> -       .num_formats =3D ARRAY_SIZE(mt8173_formats),
> +       .formats =3D mt8195_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8195_formats),
> +       .supports_clrfmt_ext =3D true,
>  };
>
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
> --
> 2.39.1.456.gfc5497dd1b-goog
>

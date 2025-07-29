Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C81B146FF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 05:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FBF10E1B1;
	Tue, 29 Jul 2025 03:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fyWiWuQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80E310E1B1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 03:55:52 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-886b2fdba07so1526482241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753761351; x=1754366151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeyQgL4zAM9urQ/V2LLVC5jrotO1A696xW4MrH9cKZw=;
 b=fyWiWuQvmFbE/uwKOrv209DUeQgjhbe2s5RHshyCMo1TSMTc3v9FgWczsuoWSofVDI
 LI2NsPxrn404AViWk4bvXC/EcDaTS9c3AveoFb3p+fwcyRlCXvo+wx63IzMezlmnNLVt
 bqBoMtsfGNQ7Xqd7AjpZs6+leA1CqLpE4phi/h7aM8vtmQja4zO7fHmcW/8RNIMyMd7t
 PeNwoAm+WDTzDcmg0cbrVugtNCTW6gLbAUdC247npPz6TfTaCfAtJO8Ni0/+y1c3BedB
 SGGZpj3ujmLCydP7hnI98UyLFzE/lbWPKZYOxUtyQdMwPqHRD6FRZwcGz4Phvi23Og8q
 gqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753761351; x=1754366151;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeyQgL4zAM9urQ/V2LLVC5jrotO1A696xW4MrH9cKZw=;
 b=S/cx0/HVuuRdXKqECscytP5NJ1YG7G2t3jZ+3J/oe3jofdL5FDWWopzLto5k6tR9J1
 TBFkJsOAgYVq8NJ9RUT+kwunEZo+PSoH9bQWxOUQ+qDEOeTiINoDwFLIirM/L3EQEUSo
 wvcnljQ4x2iU+ZxLgr62Wi/3djpOM1yhGAXsdtoy0HHY32dRcxoOOixu7kL2a/V2Xz1Q
 LmJWQ/qnDERaj3AFBfwcA/dmCZg2c+8f4ElP9TsulHC9VR2SVlL2mc2YqyUOtAZRZKo1
 mevXNTe6W9EHKuKhAiSxQtMlDt+se4PeeKYw0VQvO1+4Is5wmJPIH7cBx6VAxBU7vljd
 bCHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFhTPc5AWchZEEyf4YxKLfrJH4flXae1azEPaeVkYkOxILzeV98YsFkALCWCZZTo24LoM0dENWkKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb0ZDsjPPV7a9N8gRCLuyOOr3hPh/afONEfWAHaUc7HF5UWBWn
 1FMKYOs6Nfd0oe4pe+S7bxpfHaQu2rDV2J/z6bjI9/SNlsmBMTSdc0myOgfGpFtmCSrd4NHqTwI
 iftcOcGEv6HAvWRMRd0dlKui6pznNfno=
X-Gm-Gg: ASbGncvkaX6r0LQ0wNHtaacHdfHxb0tQcMU/fSyoqJaDOZe/kUTUmUpJwBw6rcJSqur
 AqlXlWA1KA7K7kZlfk4rUJzEVTeOWsV1rdge65oE+8a0NpKz8T195HS9Rrlf/YlEd67rbEJyBcH
 hKJeWcVxI3OZT1jE6lectyL+XFpqyiJhibJidBaMpUVMYNwmlWoss4fg+TUdTgoKtUP/Wk+DRRb
 KPAJg==
X-Google-Smtp-Source: AGHT+IG2mKzTaoyQhIzvXEq6IUJ/Cn1eY9r2poRKFBunLtB0fjLDRJGBG8ErMCT2vRGzzaUM0D1HViC2dX+iwTNt2js=
X-Received: by 2002:a05:6102:6885:b0:4e9:b793:1977 with SMTP id
 ada2fe7eead31-4fa3f6f2a22mr6292838137.0.1753761351455; Mon, 28 Jul 2025
 20:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-3-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-3-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 12:55:09 +0900
X-Gm-Features: Ac12FXwWbP8lV4QH9kqWdIB3oIAGkUWrt4c9ZYSOynqYZlW4YQIBN8DquJzuVJI
Message-ID: <CAAQKjZPNh=r5xf7X_R58VhuKz61vVGO83Oe9KsA1m_nJ1OuMLA@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] drm/bridge: samsung-dsim: add flag to control
 header FIFO wait
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
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

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:26, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM device doesn't require waiting for the header FIFO
> during a MIPI DSI transfer. Add a flag in the driver data in order to
> control said behavior.

I will merge this patch as-is and just sharing the following comments
purely for reference (for other Exynos DRM contributors).

This patch likely needs follow-up improvements in conjunction with
Marek=E2=80=99s earlier patch (commit-id:
15f389da11257b806da75a070cfa41ca0cc15aae). I=E2=80=99m unable to verify thi=
s
at the moment because the SoC Technical Reference Manual (TRM)
documentation I have is incomplete.

Based on these two patches, we should plan for future code
improvements that account for two scenarios:

- The header FIFO must be waited for.
- The header FIFO does not need to be waited for.

Currently, this is handled via driver data using the
has_broken_fifoctrl_emptyhdr and wait_for_hdr_fifo flags. If the
handling of this behavior changes in newer Exynos SoCs, this approach
may become confusing or lead to inconsistencies.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++---
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index dca3939dd99fa07aee309067b93e652bc9a9b78f..84af24171b6856cbcf95b9077=
b997ee587fc0409 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -418,6 +418,7 @@ static const struct samsung_dsim_driver_data exynos3_=
dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -438,6 +439,7 @@ static const struct samsung_dsim_driver_data exynos4_=
dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -456,6 +458,7 @@ static const struct samsung_dsim_driver_data exynos5_=
dsi_driver_data =3D {
>         .has_legacy_status_reg =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1000,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 11,
>         .pll_p_offset =3D 13,
> @@ -474,6 +477,7 @@ static const struct samsung_dsim_driver_data exynos54=
33_dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 5,
>         .max_freq =3D 1500,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 0,
>         .num_bits_resol =3D 12,
>         .pll_p_offset =3D 13,
> @@ -492,6 +496,7 @@ static const struct samsung_dsim_driver_data exynos54=
22_dsi_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 1500,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
>         .num_bits_resol =3D 12,
>         .pll_p_offset =3D 13,
> @@ -510,6 +515,7 @@ static const struct samsung_dsim_driver_data imx8mm_d=
si_driver_data =3D {
>         .has_clklane_stop =3D 1,
>         .num_clks =3D 2,
>         .max_freq =3D 2100,
> +       .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 0,
>         .num_bits_resol =3D 12,
>         /*
> @@ -1117,6 +1123,7 @@ static void samsung_dsim_send_to_fifo(struct samsun=
g_dsim *dsi,
>  {
>         struct device *dev =3D dsi->dev;
>         struct mipi_dsi_packet *pkt =3D &xfer->packet;
> +       const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
>         const u8 *payload =3D pkt->payload + xfer->tx_done;
>         u16 length =3D pkt->payload_length - xfer->tx_done;
>         bool first =3D !xfer->tx_done;
> @@ -1157,9 +1164,11 @@ static void samsung_dsim_send_to_fifo(struct samsu=
ng_dsim *dsi,
>                 return;
>
>         reg =3D get_unaligned_le32(pkt->header);
> -       if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
> -               dev_err(dev, "waiting for header FIFO timed out\n");
> -               return;
> +       if (driver_data->wait_for_hdr_fifo) {
> +               if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
> +                       dev_err(dev, "waiting for header FIFO timed out\n=
");
> +                       return;
> +               }
>         }
>
>         if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index f0c1e5c5ed490afe0bcfd06830f52471710b29ea..62c07952bd00f9c2c287a6a99=
8f0e243dd4032a9 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -61,6 +61,7 @@ struct samsung_dsim_driver_data {
>         unsigned int num_clks;
>         unsigned int min_freq;
>         unsigned int max_freq;
> +       unsigned int wait_for_hdr_fifo;
>         unsigned int wait_for_reset;
>         unsigned int num_bits_resol;
>         unsigned int pll_p_offset;
>
> --
> 2.49.0
>
>

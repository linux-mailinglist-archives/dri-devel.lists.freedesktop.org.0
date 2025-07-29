Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9385B148E1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 09:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11A910E5D3;
	Tue, 29 Jul 2025 07:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F3Q53p4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A17010E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:02:53 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-4f4aaca551fso1973538137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 00:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753772572; x=1754377372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UPe/qLLEwDQRByPG42BYIGc6HQMFYi+UgYC+8be7e28=;
 b=F3Q53p4rzAEMMg80QcHD4alNQEJqO2mOdQjLIAizLoOykYgF4rvjIeKJEvovERf9wj
 JENeewUhPjjj0u8+deyKq/z5n0qLcjaXWUCEvP9ygbWICwSGF0ebbGHYkXjskprxoycD
 22aY6UOMXl5eagTDreWYVs9BH49rGp33KOo2G55V2buHDuNVXVo1tzevW1YdwxRLZog/
 1nXLKkFGSA7BCgrbXGh56x+6Ozf9eVVGNVzAeU6uCiBbrAmwgkGm/hC99mCcuHPAmbx0
 3Yu15UAbGfxsAUUch5AmvPwCmI8emY3t/776iSjDlRzWcHuJikRiC/h0adVPlu5CvrAc
 4lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753772572; x=1754377372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UPe/qLLEwDQRByPG42BYIGc6HQMFYi+UgYC+8be7e28=;
 b=bRopwAYpB+MgyrF1f19qkAcalhf4VqVp2hBguy5mp08SbpVd1H4PlkWZpuLRn70fQ/
 BHbBelSr4eCLHvBbt0MpZzkWLZsuqNVcbHtH/m2fiIctdK5PhrrH+6o005DciCxYKbKS
 0MU7OrZAJPhVXVhoJfhZvaoKnqVyrDip/DRp+3/zppD4phVTNmTqEoxmGVylZjeHYTbR
 DoWr+jesFXehPiKUE+5dyf5yQH7Wz57c4Q87vEnVE//xuxZfgESpFIwkV/XbozpQK763
 5NPjgLsxyP8KVnDMNPmr/WYV4bu/jLbpYPAvimA/ZcAbCo9+xeMOXAmQVtmI7nohcTg7
 EmMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO0KgWkmJ+RgejeH0oM1dE/XjQO+NxL44kE+ZRPTBPqNHBWRwW6Ipm6qocDNxmibUqaW+dAiGu+l8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpd+S/4W5a1xxv/9Kdt1PmcetHnAz4mRwWltWFCOEkTSXzIEt0
 8cz14xLbCx6oULwxo2C0mwMJrBxMnzHicl1B61NpS91PmREaL/GQW4TzWMVB3cgjJyc0FDmA/5n
 TvENZmmt38b4MdwyTLYaP8t2EAHrreHI=
X-Gm-Gg: ASbGncujYKUyrPbkV5uoHlnw9LV6YiEMhu7xLJPyFC4PiXOCrtPmXVXKWvSiKkumZX5
 0pr5Hx9NuFmBcAGKfHjmiSV8AlHQzud0IaFDzstprmC5eJIZBJIxrBoqtiAyQDr5uRuV7U26h6V
 unqIdmO20h1bd3x19SpxbU02Y/Zm0zAMdxvOgLmVPg6AQ12uZKcd9AVpUGhGZmpkpXLBKgkReFu
 8xlOw==
X-Google-Smtp-Source: AGHT+IFoncrlpWw1i6WzQqR3txoGKpqtrzhok2riEERJ9a82EDQDLrmTtk5K8booTBL5JJI+e2v2Ca5TnYv+mP2pkxQ=
X-Received: by 2002:a05:6102:d90:b0:4f9:6a93:2a3a with SMTP id
 ada2fe7eead31-4fa3ff86239mr6458282137.26.1753772571875; Tue, 29 Jul 2025
 00:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-10-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-10-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 16:02:09 +0900
X-Gm-Features: Ac12FXzIdQh-2hSRJxrhTX04Gexopr85LkmnAh4nGUB4cX_MHGUC9ISKVNYHE8E
Message-ID: <CAAQKjZNfb6LkShtCvan__ew=H7CaquTqn5DLcP1agtkG6B5mSw@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] drm/bridge: samsung-dsim: add ability to define
 clock names for every variant
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

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:28, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Presently, all devices refer to clock names from a single array. The
> only controlling parameter is the number of clocks (num_clks field of
> samsung_dsim_driver_data) which uses the first n clocks of that array.
> As new devices are added, this approach turns out to be cumbersome.
>
> Separate the clock names in individual arrays required by each variant,
> in a struct clk_bulk_data. Add a pointer field to the driver data struct
> which points to their respective clock names, and rework the clock usage
> code to use the clk_bulk_* API instead.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 88 +++++++++++++++++------------=
------
>  include/drm/bridge/samsung-dsim.h     |  2 +-
>  2 files changed, 44 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 4b49707730db76aa8fd3ab973b02507436750889..b6b3bbcbd0f438e5e1d3faf18=
f8c2d532a4ecc93 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -219,23 +219,31 @@
>  #define DSI_XFER_TIMEOUT_MS            100
>  #define DSI_RX_FIFO_EMPTY              0x30800002
>
> -#define OLD_SCLK_MIPI_CLK_NAME         "pll_clk"
> -
>  #define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 10000=
00000000ULL)
>
> -static const char *const clk_names[5] =3D {
> -       "bus_clk",
> -       "sclk_mipi",
> -       "phyclk_mipidphy0_bitclkdiv8",
> -       "phyclk_mipidphy0_rxclkesc0",
> -       "sclk_rgb_vclk_to_dsim0"
> -};
> -
>  enum samsung_dsim_transfer_type {
>         EXYNOS_DSI_TX,
>         EXYNOS_DSI_RX,
>  };
>
> +static struct clk_bulk_data exynos3_clk_bulk_data[] =3D {
> +       { .id =3D "bus_clk" },
> +       { .id =3D "pll_clk" },
> +};
> +
> +static struct clk_bulk_data exynos4_clk_bulk_data[] =3D {
> +       { .id =3D "bus_clk" },
> +       { .id =3D "sclk_mipi" },
> +};
> +
> +static struct clk_bulk_data exynos5433_clk_bulk_data[] =3D {
> +       { .id =3D "bus_clk" },
> +       { .id =3D "sclk_mipi" },
> +       { .id =3D "phyclk_mipidphy0_bitclkdiv8" },
> +       { .id =3D "phyclk_mipidphy0_rxclkesc0" },
> +       { .id =3D "sclk_rgb_vclk_to_dsim0" },
> +};
> +
>  enum reg_idx {
>         DSIM_STATUS_REG,        /* Status register (legacy) */
>         DSIM_LINK_STATUS_REG,   /* Link status register */
> @@ -408,7 +416,8 @@ static const struct samsung_dsim_driver_data exynos3_=
dsi_driver_data =3D {
>         .has_legacy_status_reg =3D 1,
>         .has_freqband =3D 1,
>         .has_clklane_stop =3D 1,
> -       .num_clks =3D 2,
> +       .clk_data =3D exynos3_clk_bulk_data,
> +       .num_clks =3D ARRAY_SIZE(exynos3_clk_bulk_data),
>         .max_freq =3D 1000,
>         .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
> @@ -439,7 +448,8 @@ static const struct samsung_dsim_driver_data exynos4_=
dsi_driver_data =3D {
>         .has_legacy_status_reg =3D 1,
>         .has_freqband =3D 1,
>         .has_clklane_stop =3D 1,
> -       .num_clks =3D 2,
> +       .clk_data =3D exynos4_clk_bulk_data,
> +       .num_clks =3D ARRAY_SIZE(exynos4_clk_bulk_data),
>         .max_freq =3D 1000,
>         .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
> @@ -468,7 +478,8 @@ static const struct samsung_dsim_driver_data exynos5_=
dsi_driver_data =3D {
>         .reg_ofs =3D exynos_reg_ofs,
>         .plltmr_reg =3D 0x58,
>         .has_legacy_status_reg =3D 1,
> -       .num_clks =3D 2,
> +       .clk_data =3D exynos3_clk_bulk_data,
> +       .num_clks =3D ARRAY_SIZE(exynos3_clk_bulk_data),
>         .max_freq =3D 1000,
>         .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
> @@ -497,7 +508,8 @@ static const struct samsung_dsim_driver_data exynos54=
33_dsi_driver_data =3D {
>         .plltmr_reg =3D 0xa0,
>         .has_legacy_status_reg =3D 1,
>         .has_clklane_stop =3D 1,
> -       .num_clks =3D 5,
> +       .clk_data =3D exynos5433_clk_bulk_data,
> +       .num_clks =3D ARRAY_SIZE(exynos5433_clk_bulk_data),
>         .max_freq =3D 1500,
>         .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 0,
> @@ -526,7 +538,8 @@ static const struct samsung_dsim_driver_data exynos54=
22_dsi_driver_data =3D {
>         .plltmr_reg =3D 0xa0,
>         .has_legacy_status_reg =3D 1,
>         .has_clklane_stop =3D 1,
> -       .num_clks =3D 2,
> +       .clk_data =3D exynos3_clk_bulk_data,
> +       .num_clks =3D ARRAY_SIZE(exynos3_clk_bulk_data),
>         .max_freq =3D 1500,
>         .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 1,
> @@ -555,7 +568,8 @@ static const struct samsung_dsim_driver_data imx8mm_d=
si_driver_data =3D {
>         .plltmr_reg =3D 0xa0,
>         .has_legacy_status_reg =3D 1,
>         .has_clklane_stop =3D 1,
> -       .num_clks =3D 2,
> +       .clk_data =3D exynos4_clk_bulk_data,
> +       .num_clks =3D ARRAY_SIZE(exynos4_clk_bulk_data),
>         .max_freq =3D 2100,
>         .wait_for_hdr_fifo =3D 1,
>         .wait_for_reset =3D 0,
> @@ -2021,7 +2035,7 @@ int samsung_dsim_probe(struct platform_device *pdev=
)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct samsung_dsim *dsi;
> -       int ret, i;
> +       int ret;
>
>         dsi =3D devm_drm_bridge_alloc(dev, struct samsung_dsim, bridge, &=
samsung_dsim_bridge_funcs);
>         if (IS_ERR(dsi))
> @@ -2045,23 +2059,11 @@ int samsung_dsim_probe(struct platform_device *pd=
ev)
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to get regulators\=
n");
>
> -       dsi->clks =3D devm_kcalloc(dev, dsi->driver_data->num_clks,
> -                                sizeof(*dsi->clks), GFP_KERNEL);
> -       if (!dsi->clks)
> -               return -ENOMEM;
> -
> -       for (i =3D 0; i < dsi->driver_data->num_clks; i++) {
> -               dsi->clks[i] =3D devm_clk_get(dev, clk_names[i]);
> -               if (IS_ERR(dsi->clks[i])) {
> -                       if (strcmp(clk_names[i], "sclk_mipi") =3D=3D 0) {
> -                               dsi->clks[i] =3D devm_clk_get(dev, OLD_SC=
LK_MIPI_CLK_NAME);
> -                               if (!IS_ERR(dsi->clks[i]))
> -                                       continue;
> -                       }
> -
> -                       dev_info(dev, "failed to get the clock: %s\n", cl=
k_names[i]);
> -                       return PTR_ERR(dsi->clks[i]);
> -               }
> +       ret =3D devm_clk_bulk_get(dev, dsi->driver_data->num_clks,
> +                               dsi->driver_data->clk_data);
> +       if (ret) {
> +               dev_err(dev, "failed to get clocks in bulk (%d)\n", ret);
> +               return ret;

Above change modifies the existing behavior.

Previously, when devm_clk_get() failed and the clock name was
"sclk_mipi", the code included a fallback mechanism to try "pll_clk"
instead. This fallback logic has been removed in the current patch.

While changing this behavior may raise concerns, the benefits of
refactoring=E2=80=94specifically, defining clock names per SoC and adopting
the clk_bulk_* API for improved maintainability=E2=80=94appear to outweigh =
the
potential downsides.

Unless there are objections from other reviewers, I intend to proceed
with merging this patch.
If anyone has concerns or sees potential issues with this change,
please share your thoughts.

Thanks,
Inki Dae

>         }
>
>         dsi->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> @@ -2134,7 +2136,7 @@ static int samsung_dsim_suspend(struct device *dev)
>  {
>         struct samsung_dsim *dsi =3D dev_get_drvdata(dev);
>         const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
> -       int ret, i;
> +       int ret;
>
>         usleep_range(10000, 20000);
>
> @@ -2150,8 +2152,7 @@ static int samsung_dsim_suspend(struct device *dev)
>
>         phy_power_off(dsi->phy);
>
> -       for (i =3D driver_data->num_clks - 1; i > -1; i--)
> -               clk_disable_unprepare(dsi->clks[i]);
> +       clk_bulk_disable_unprepare(driver_data->num_clks, driver_data->cl=
k_data);
>
>         ret =3D regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->su=
pplies);
>         if (ret < 0)
> @@ -2164,7 +2165,7 @@ static int samsung_dsim_resume(struct device *dev)
>  {
>         struct samsung_dsim *dsi =3D dev_get_drvdata(dev);
>         const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
> -       int ret, i;
> +       int ret;
>
>         ret =3D regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->sup=
plies);
>         if (ret < 0) {
> @@ -2172,11 +2173,9 @@ static int samsung_dsim_resume(struct device *dev)
>                 return ret;
>         }
>
> -       for (i =3D 0; i < driver_data->num_clks; i++) {
> -               ret =3D clk_prepare_enable(dsi->clks[i]);
> -               if (ret < 0)
> -                       goto err_clk;
> -       }
> +       ret =3D clk_bulk_prepare_enable(driver_data->num_clks, driver_dat=
a->clk_data);
> +       if (ret < 0)
> +               goto err_clk;
>
>         ret =3D phy_power_on(dsi->phy);
>         if (ret < 0) {
> @@ -2187,8 +2186,7 @@ static int samsung_dsim_resume(struct device *dev)
>         return 0;
>
>  err_clk:
> -       while (--i > -1)
> -               clk_disable_unprepare(dsi->clks[i]);
> +       clk_bulk_disable_unprepare(driver_data->num_clks, driver_data->cl=
k_data);
>         regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
>
>         return ret;
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index 04ed11787bbd22503f7221cad1a491a4e5e66781..eb9fdbab1b34074923daa0aa0=
443c33c5b99ae42 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -58,6 +58,7 @@ struct samsung_dsim_driver_data {
>         unsigned int has_clklane_stop:1;
>         unsigned int has_broken_fifoctrl_emptyhdr:1;
>         unsigned int has_sfrctrl:1;
> +       struct clk_bulk_data *clk_data;
>         unsigned int num_clks;
>         unsigned int min_freq;
>         unsigned int max_freq;
> @@ -104,7 +105,6 @@ struct samsung_dsim {
>
>         void __iomem *reg_base;
>         struct phy *phy;
> -       struct clk **clks;
>         struct clk *pll_clk;
>         struct regulator_bulk_data supplies[2];
>         int irq;
>
> --
> 2.49.0
>
>

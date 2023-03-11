Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB566B6221
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 00:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0685D10E23B;
	Sat, 11 Mar 2023 23:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A5F10E23B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 23:39:58 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so915353pjb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678577998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ho5/1m/vfe0flKCSngkWFSeYuqEdK2ieB2yK5kPv+pw=;
 b=cwRQVZSQ/4wecTJvS8ZZUrZhfvAQ31HdqDDffDV3xNYoxOPvQefzes4L3s600zp+kB
 88Y8Hn0AtLLcKKbqwqsWsQUUsCwyNv5YI/760jAsgkiLBbXMiGMczRX4LYNeKlfoPZ3H
 xFD0wNFKJ014F5cUaJDxvBMuBXqfr2jitgkRk0EpYPt18JN7YahkfrKfIXDCoHaR+u4S
 x2v/hw6bgyUSyf1B6WrXzan+eVM6VvBnEjHSRRbBm/QPKbxUI0zR1ylZgvolnesvjOT2
 oBYVpzBpCSlJDv4iquoIllWZS1ByhnNwN/dkyW3GiU4R1OjMbUZqfDytVuRqsH15rNfg
 ON9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678577998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ho5/1m/vfe0flKCSngkWFSeYuqEdK2ieB2yK5kPv+pw=;
 b=4cPlgQ4/JbC1ldJuX9i1mV7gRc7q0MelBir3p6MNRjmJRM+zOo6eSbtteJXBqNdXPw
 ZLHd+mEVmmsAMohQozTzG5PVr1xdwX/0k3DmSdL1+PplIl4C4ttuwwQieK8Vml9hzgEh
 s2ZOsz9fE7JTbpv1m0BsHBGcGIWjCULpQmnvT0HE/6bopDcUhgRx1Gx97KZiIZrhZSY7
 6T/+y8y97CPmPgVWqmjxByruxhcJj3EJ87BhP/28Of/i/wxVaVRwF7wiKQznsYuybORg
 6oKKpgP2CMEveycQuqX9P5xuxoNZ3iuceC+BFrFJ0S9wlibKjI3oElw/0123OuzkJeXx
 iDcw==
X-Gm-Message-State: AO0yUKX26GwiLOrrHZApLzCLJjO7LDEDNt0F+Gb/OlS2leK7ZyOUFGvg
 Wgo9gCWNYPRtCwQT6kdmR1WXulvWiX79xxydQOI=
X-Google-Smtp-Source: AK7set+0tYvWlngCvR5oSgNRhI285VhyyUsM2kWX+W3ZlR/f/7rRbQ13n4ilHvxGDtKRXO0fZDC5sTrV04KRn9oodpw=
X-Received: by 2002:a17:903:710:b0:19f:30be:e9f6 with SMTP id
 kk16-20020a170903071000b0019f30bee9f6mr644472plb.6.1678577997996; Sat, 11 Mar
 2023 15:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
 <20230308163953.28506-15-jagan@amarulasolutions.com>
In-Reply-To: <20230308163953.28506-15-jagan@amarulasolutions.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 11 Mar 2023 17:39:46 -0600
Message-ID: <CAHCN7x+Tox5LcSa-vZNEZ2Ycem6habMT_4q5WaQxpUTeb7XxWg@mail.gmail.com>
Subject: Re: [PATCH v16 14/16] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano
 support
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 10:41=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.
>
> Add compatible and associated driver_data for it.
>
I have a few updates that I want to push once this series has been
accepted to support non-burst mode, fine-tune the PMS clock, and a few
other things.  I have the DSI working through a DSI to HDMI bridge
along with audio in case anyone is interested.

I have my repo here which is based on Jagan's V16 branch:
https://github.com/aford173/linux/tree/imx8mm-dsi-v16-beacon


For the series:

Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon


> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Acked-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v16, v15, v13:
> - none
> Changes for v12:
> - collect RB from Marek
> Changes for v11:
> - collect RB from Frieder
> - collect ACK from Robert
> Changes for v10, v9:
> - none
> Changed for v8:
> - fix and update the comment
> Changes for v7, v6:
> - none
> Changes for v3:
> - enable DSIM_QUIRK_FIXUP_SYNC_POL quirk
> Changes for v5:
> - [mszyprow] rebased and adjusted to the new driver initialization
> - drop quirk
> Changes for v4:
> - none
> Changes for v3:
> - enable DSIM_QUIRK_FIXUP_SYNC_POL quirk
> Changes for v2:
> - collect Laurent r-b
> Changes for v1:
> - none
>
>  drivers/gpu/drm/bridge/samsung-dsim.c | 44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index f9a5e69a0fcd..f3bd06489a39 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -376,6 +376,24 @@ static const unsigned int exynos5433_reg_values[] =
=3D {
>         [PHYTIMING_HS_TRAIL] =3D DSIM_PHYTIMING2_HS_TRAIL(0x0c),
>  };
>
> +static const unsigned int imx8mm_dsim_reg_values[] =3D {
> +       [RESET_TYPE] =3D DSIM_SWRST,
> +       [PLL_TIMER] =3D 500,
> +       [STOP_STATE_CNT] =3D 0xf,
> +       [PHYCTRL_ULPS_EXIT] =3D 0,
> +       [PHYCTRL_VREG_LP] =3D 0,
> +       [PHYCTRL_SLEW_UP] =3D 0,
> +       [PHYTIMING_LPX] =3D DSIM_PHYTIMING_LPX(0x06),
> +       [PHYTIMING_HS_EXIT] =3D DSIM_PHYTIMING_HS_EXIT(0x0b),
> +       [PHYTIMING_CLK_PREPARE] =3D DSIM_PHYTIMING1_CLK_PREPARE(0x07),
> +       [PHYTIMING_CLK_ZERO] =3D DSIM_PHYTIMING1_CLK_ZERO(0x26),
> +       [PHYTIMING_CLK_POST] =3D DSIM_PHYTIMING1_CLK_POST(0x0d),
> +       [PHYTIMING_CLK_TRAIL] =3D DSIM_PHYTIMING1_CLK_TRAIL(0x08),
> +       [PHYTIMING_HS_PREPARE] =3D DSIM_PHYTIMING2_HS_PREPARE(0x08),
> +       [PHYTIMING_HS_ZERO] =3D DSIM_PHYTIMING2_HS_ZERO(0x0d),
> +       [PHYTIMING_HS_TRAIL] =3D DSIM_PHYTIMING2_HS_TRAIL(0x0b),
> +};
> +
>  static const struct samsung_dsim_driver_data exynos3_dsi_driver_data =3D=
 {
>         .reg_ofs =3D exynos_reg_ofs,
>         .plltmr_reg =3D 0x50,
> @@ -437,6 +455,22 @@ static const struct samsung_dsim_driver_data exynos5=
422_dsi_driver_data =3D {
>         .reg_values =3D exynos5422_reg_values,
>  };
>
> +static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data =3D =
{
> +       .reg_ofs =3D exynos5433_reg_ofs,
> +       .plltmr_reg =3D 0xa0,
> +       .has_clklane_stop =3D 1,
> +       .num_clks =3D 2,
> +       .max_freq =3D 2100,
> +       .wait_for_reset =3D 0,
> +       .num_bits_resol =3D 12,
> +       /*
> +        * Unlike Exynos, PLL_P(PMS_P) offset 14 is used in i.MX8M Mini/N=
ano/Plus
> +        * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
> +        */
> +       .pll_p_offset =3D 14,
> +       .reg_values =3D imx8mm_dsim_reg_values,
> +};
> +
>  static const struct samsung_dsim_driver_data *
>  samsung_dsim_types[DSIM_TYPE_COUNT] =3D {
>         [DSIM_TYPE_EXYNOS3250] =3D &exynos3_dsi_driver_data,
> @@ -444,6 +478,7 @@ samsung_dsim_types[DSIM_TYPE_COUNT] =3D {
>         [DSIM_TYPE_EXYNOS5410] =3D &exynos5_dsi_driver_data,
>         [DSIM_TYPE_EXYNOS5422] =3D &exynos5422_dsi_driver_data,
>         [DSIM_TYPE_EXYNOS5433] =3D &exynos5433_dsi_driver_data,
> +       [DSIM_TYPE_IMX8MM] =3D &imx8mm_dsi_driver_data,
>  };
>
>  static inline struct samsung_dsim *host_to_dsi(struct mipi_dsi_host *h)
> @@ -1877,7 +1912,16 @@ const struct dev_pm_ops samsung_dsim_pm_ops =3D {
>  };
>  EXPORT_SYMBOL_GPL(samsung_dsim_pm_ops);
>
> +static const struct samsung_dsim_plat_data samsung_dsim_imx8mm_pdata =3D=
 {
> +       .hw_type =3D DSIM_TYPE_IMX8MM,
> +       .host_ops =3D &generic_dsim_host_ops,
> +};
> +
>  static const struct of_device_id samsung_dsim_of_match[] =3D {
> +       {
> +               .compatible =3D "fsl,imx8mm-mipi-dsim",
> +               .data =3D &samsung_dsim_imx8mm_pdata,
> +       },
>         { /* sentinel. */ }
>  };
>  MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
> --
> 2.25.1
>

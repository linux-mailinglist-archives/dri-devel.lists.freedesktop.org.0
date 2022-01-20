Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0894495011
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 15:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823E210E4C9;
	Thu, 20 Jan 2022 14:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2409210E457
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:25:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m4so29297199edb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 06:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FAhsQDmY+UEIFHjWgi4z9bftnzJtob5tCT+hA+Of3Tc=;
 b=KJEjgCdFG0dpF+3j0wAsKxGexfu15gsGWeXYUVgoDvXZHy2v0EQey/SQX7X4mYBsSp
 I2UnEh7K6RxCTHjo7Shad43R2GcXtPLrFEKdOCAxEif+jzcmr0OzMr/cGHYQmUOjX0dX
 j8VWdbTp3bckcfROeq0sRC9ycPXnU++G0KRAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FAhsQDmY+UEIFHjWgi4z9bftnzJtob5tCT+hA+Of3Tc=;
 b=uw2xKaA8cWWvbVOIe/oCzxw0gx8qDUMbyDI1HYBe2dVJcLc7KlZpvfUdMitQrzVJiC
 zTpl2wpoA2Wylha4vm27iqaAcqilulwcLVybTk/m93kRdl6X/diOItr86h4JGa5KmToR
 ciZDLOtyybfUPZirzBJCbXbl/zskSm4hv932UrB2HA+Dtymp1qN/ATBFSTOHudLgGKtQ
 Sgxd28jXKZulAvwWdHmJ7u3/3/Ftn+s3CfqsDM+bomBXUDwSgZJr4m/pP1eylpm3I7fV
 lTWkUNxZfhztnJxN1Lydn59gIgrXfIPv8GQYlw82i740g9H3h2da3yz9UmLSXoOMFwm4
 3cIA==
X-Gm-Message-State: AOAM530w8HjA0pEThqwkNOaUzAzVSx4Rc8NjXJ5bN11Kvhg+zM0p/b4W
 Z4tA+0Lsyg/VVe+hLVQc4flgySCnUXya6I19ChquIw==
X-Google-Smtp-Source: ABdhPJy4wH7/I8d3vpY8drpkpk3qBL9l/808L6I024OQggLfoUx7l3gQI5KIjzpg9Q0pWjfKBcf3bh29R7L7Wb5fBgc=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr13521547edb.271.1642688706615; 
 Thu, 20 Jan 2022 06:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-7-narmstrong@baylibre.com>
In-Reply-To: <20220120083357.1541262-7-narmstrong@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 20 Jan 2022 19:54:55 +0530
Message-ID: <CAMty3ZBvbPvKgUpNW1LVho5_S9kwzNioE0SxvX_E8bmgw-+fXw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> Glue on other Amlogic SoCs.
>
> This adds support for the Glue managing the transceiver, mimicing the init flow provided
> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
> Analog PHY in the proper way.
>
> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
> DW-MIPI-DSI transceiver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/Kconfig             |   7 +
>  drivers/gpu/drm/meson/Makefile            |   1 +
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 357 ++++++++++++++++++++++
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++
>  4 files changed, 525 insertions(+)
>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
>
> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
> index 6c70fc3214af..71a1364b51e1 100644
> --- a/drivers/gpu/drm/meson/Kconfig
> +++ b/drivers/gpu/drm/meson/Kconfig
> @@ -17,3 +17,10 @@ config DRM_MESON_DW_HDMI
>         default y if DRM_MESON
>         select DRM_DW_HDMI
>         imply DRM_DW_HDMI_I2S_AUDIO
> +
> +config DRM_MESON_DW_MIPI_DSI
> +       tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
> +       depends on DRM_MESON
> +       default y if DRM_MESON
> +       select DRM_DW_MIPI_DSI
> +       select GENERIC_PHY_MIPI_DPHY
> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
> index 833e18c20603..43071bdbd4b9 100644
> --- a/drivers/gpu/drm/meson/Makefile
> +++ b/drivers/gpu/drm/meson/Makefile
> @@ -6,3 +6,4 @@ meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
>
>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
> +obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) += meson_dw_mipi_dsi.o

Can the naming convention prefix with dw-mipi-dsi like other glue
drivers follow?

Jagan.

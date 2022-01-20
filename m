Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0244495439
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D15210EC97;
	Thu, 20 Jan 2022 18:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87010EC9A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 18:32:19 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p12so32458293edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+00NBU4zPpWp7jpvjiMcHu68nnfj/RSjb+xkfc0Ftio=;
 b=Ujrw03rYXeOdIrBL1FYq12Y7BD9PHdzWXOTbvGq3TL0sTrklNhYsPVirKgehYNdS71
 ywWPesI6LjjBA/ylLWyKbrznC3xu9vK2C4LwvKruPID0yH2J2uDbWAPWzjvhV1ctCBUb
 27SfQeB3rVS7zw3ck64PWI4MmubiXvrFuyjH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+00NBU4zPpWp7jpvjiMcHu68nnfj/RSjb+xkfc0Ftio=;
 b=GehxvjG5UVuYl2ecbXhU8onLr/kdJDN3S9yR7nnsBXqSE1UHBLBh5q8qr92acb+puu
 3p17PoBRidEnIFfj2RSN5U4EuJQ2LmDy/qAT/Z3j3NVEo6teS+ixGqd4fYWUC+a4Gcr5
 9H7QMVv0DOKQxKLVoDiLupaRx0iQvGTBu6Y+t+ntTerHQA5tExeVGPqUUfsnYZDNOevT
 hT7pjpVs4MYZ5Spavd0oU9aDT66sqj9JjfQCPnv4R0iSwURHDCnozRB4YSDjOuXrx8+C
 HW7DfOZ7/7iX7ueXsBARUz3kZkoMWulT6EvdWzScecuoiz4Rbjq9tHHhKnwoyWN0VqD2
 SyMA==
X-Gm-Message-State: AOAM531UsGNqm7NYD0EQmxFqGlQ3qBa8W57/rdzZ0c3DEKuzUk2/bXCL
 HV2h7M/icaefkUCBV/aEffetwPpS4MER+5/X+LfxVw==
X-Google-Smtp-Source: ABdhPJwtYYJyoFJwfwyt1kfWv+pgU8yVQH9Sl8CfaEbWcew1OIQe0t3QgSU+hVN98B+hr1XFAtv5BDKbO4q/1yNbR8k=
X-Received: by 2002:a17:906:5d0d:: with SMTP id
 g13mr131110ejt.167.1642703538208; 
 Thu, 20 Jan 2022 10:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-7-narmstrong@baylibre.com>
 <CAMty3ZBvbPvKgUpNW1LVho5_S9kwzNioE0SxvX_E8bmgw-+fXw@mail.gmail.com>
 <b2086dd4-643f-26b3-3930-4d8beb170b75@baylibre.com>
In-Reply-To: <b2086dd4-643f-26b3-3930-4d8beb170b75@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 21 Jan 2022 00:02:06 +0530
Message-ID: <CAMty3ZCb=oTw8inrk0MNHtjfJPVMKm2u-L8YSr=e0eQZ9HyQbA@mail.gmail.com>
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

On Thu, Jan 20, 2022 at 10:00 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 20/01/2022 15:24, Jagan Teki wrote:
> > On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> >> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> >> Glue on other Amlogic SoCs.
> >>
> >> This adds support for the Glue managing the transceiver, mimicing the init flow provided
> >> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
> >> Analog PHY in the proper way.
> >>
> >> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
> >> DW-MIPI-DSI transceiver.
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/meson/Kconfig             |   7 +
> >>  drivers/gpu/drm/meson/Makefile            |   1 +
> >>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 357 ++++++++++++++++++++++
> >>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++
> >>  4 files changed, 525 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> >>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
> >>
> >> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
> >> index 6c70fc3214af..71a1364b51e1 100644
> >> --- a/drivers/gpu/drm/meson/Kconfig
> >> +++ b/drivers/gpu/drm/meson/Kconfig
> >> @@ -17,3 +17,10 @@ config DRM_MESON_DW_HDMI
> >>         default y if DRM_MESON
> >>         select DRM_DW_HDMI
> >>         imply DRM_DW_HDMI_I2S_AUDIO
> >> +
> >> +config DRM_MESON_DW_MIPI_DSI
> >> +       tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
> >> +       depends on DRM_MESON
> >> +       default y if DRM_MESON
> >> +       select DRM_DW_MIPI_DSI
> >> +       select GENERIC_PHY_MIPI_DPHY
> >> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
> >> index 833e18c20603..43071bdbd4b9 100644
> >> --- a/drivers/gpu/drm/meson/Makefile
> >> +++ b/drivers/gpu/drm/meson/Makefile
> >> @@ -6,3 +6,4 @@ meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
> >>
> >>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
> >>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
> >> +obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) += meson_dw_mipi_dsi.o
> >
> > Can the naming convention prefix with dw-mipi-dsi like other glue
> > drivers follow?
>
> Seems only rockchip names their glue like that:
>
> $ find drivers/gpu/drm/ -name "*dw*mipi*dsi*.c"
> drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>
> If you look at dw-hdmi it's even worse:
>
> $ find drivers/gpu/drm/ -name "*dw*hdmi*.c" | grep -v mod
> drivers/gpu/drm/meson/meson_dw_hdmi.c
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> drivers/gpu/drm/imx/dw_hdmi-imx.c
> drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c

Look like there is no standard naming, thanks.

Jagan.

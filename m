Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BB670BEDF
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C58010E30C;
	Mon, 22 May 2023 12:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CBA10E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 12:57:27 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-ba878d5e75fso8272601276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 05:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684760246; x=1687352246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LUXBO0rbh+EQ+Hwq/PJXmwkqd/JJT6/GZ5oIe8Ihyqk=;
 b=pyU0N3/1E2I4DqKiflP6oJezbEvCGTFtQsjgw4w1SFeXKEVGVna/ScfaRYj9qVDNL2
 C9EIDtjaj2RbPmq1Iu3fF5oAkp+G0w8UIcTwX7m/7aZcsSK0+HhSkogZWjjpJSMlh2IA
 uq2E6uxARUBTI2P4wJMt/BASs6vXU/tFB0BzcyoA2vd6V8iS0xdZ82JTAIeqmEliJaX2
 FmQ5ri1am0V84QWjCejxI09Hl38ljE1jkCv7t+yZ0QQvSE+pTpk/m/ZPf3MbQIWzmD51
 IkXGzQ1VsQ1vcKs3LlVoTH4trFn41zuZp6XeRSSdrJWvlurc1zI62kQY1URHr7/kJyNt
 ijbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684760246; x=1687352246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LUXBO0rbh+EQ+Hwq/PJXmwkqd/JJT6/GZ5oIe8Ihyqk=;
 b=hSRS9K699vKd2a87E+6+jGR1ApeAx5MitdQEprNwKHRHVD7KkUdwdHZPfqpUfuMgYb
 ZhzahKpU39t07Z4eEMFE7KloMANkS7dVcjBdjfvdeP6gZF8pP79/i+6MW+aaMxZgt/yF
 jiVXJrO2LMVkjNAIdfbxipLLEeV+ifyqSAaIgjTdz4oXEdxl/bJRQlJJy2O2uNaF5GAN
 nmqFrgv+qzhy4subEDrxgfJf9OVpLETH1h0NfKaKoO7cda3ad97wENo5/MvLBLJuZYFr
 meXOhKRg5PmbBc4kCMAizAUIZfl9NA4yiNh3YgMniPMAnJFWd5NNFeyBSyGsYMoM4Ic3
 HHFw==
X-Gm-Message-State: AC+VfDztOWHDNiNobgEB0v2geqpsgT8gNkHJXZP8X7ofNtthHsbWwODO
 iFH88V5D6Od8Tjc6p2NqFoDdfdE86GKoUvRZsZUETg==
X-Google-Smtp-Source: ACHHUZ7nCM+avx4oQBmZJMpFSowAaZ7UAink2GdFw+06vNd2TrSLgR73S7uKtIEruWA+UlmqfWW1PVkFa6wxDkNEurU=
X-Received: by 2002:a0d:e886:0:b0:561:d25b:672a with SMTP id
 r128-20020a0de886000000b00561d25b672amr10951679ywe.21.1684760245841; Mon, 22
 May 2023 05:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-8-541c341d6bee@somainline.org>
 <4679c741-7877-ce79-4086-08ec4ee9e6bf@linaro.org>
 <cf5dea0f-5999-6ac4-4f04-9b397ca94fdb@linaro.org>
In-Reply-To: <cf5dea0f-5999-6ac4-4f04-9b397ca94fdb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 May 2023 15:57:14 +0300
Message-ID: <CAA8EJprZi3cUN5ytSNvoasP1QCiGhzpLzz9NySEV+6sdhVxL1w@mail.gmail.com>
Subject: Re: [PATCH RFC 08/10] drm/panel/samsung-sofef03: Add panel driver for
 Sony Xperia 5 II
To: neil.armstrong@linaro.org
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 at 12:08, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 22/05/2023 03:23, Dmitry Baryshkov wrote:
> > On 22/05/2023 00:23, Marijn Suijten wrote:
> >> The SOFEF03-M Display-IC paired with an unknown panel in the Sony Xperia
> >> 5 II always uses Display Stream Compression 1.1 and features a 60hz and
> >> 120hz refresh-rate mode.
> >>
> >> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> >
> > Konrad's S-o-b is also required then
> >
> >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> ---
> >>   drivers/gpu/drm/panel/Kconfig                 |  14 +
> >>   drivers/gpu/drm/panel/Makefile                |   1 +
> >>   drivers/gpu/drm/panel/panel-samsung-sofef03.c | 423 ++++++++++++++++++++++++++
> >>   3 files changed, 438 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> >> index 3f11e9906f2cb..8e2668153bce2 100644
> >> --- a/drivers/gpu/drm/panel/Kconfig
> >> +++ b/drivers/gpu/drm/panel/Kconfig
> >> @@ -630,6 +630,20 @@ config DRM_PANEL_SAMSUNG_SOFEF01
> >>         This panel features a fixed mode of 1080x2520@60.
> >> +config DRM_PANEL_SAMSUNG_SOFEF03
> >> +    tristate "Samsung sofef03 Sony Xperia 5 II DSI cmd mode panel"
> >> +    depends on GPIOLIB
> >> +    depends on OF
> >> +    depends on DRM_MIPI_DSI
> >> +    depends on BACKLIGHT_CLASS_DEVICE
> >> +    help
> >> +      Say Y or M here if you want to enable support for the Samsung AMOLED
> >> +      command mode panel found in the Sony Xperia 5 II smartphone.
> >> +
> >> +      This panel uses Display Stream Compression 1.1.
> >> +
> >> +      The panel features a 1080x2520@60 and 1080x2520@120 mode.
> >> +
> >>   config DRM_PANEL_SEIKO_43WVF1G
> >>       tristate "Seiko 43WVF1G panel"
> >>       depends on OF
> >> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> >> index a4039d0fc9cfb..52dcd82e33120 100644
> >> --- a/drivers/gpu/drm/panel/Makefile
> >> +++ b/drivers/gpu/drm/panel/Makefile
> >> @@ -63,6 +63,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams4
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF01) += panel-samsung-sofef01.o
> >> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF03) += panel-samsung-sofef03.o
> >>   obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
> >>   obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
> >>   obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
> >> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef03.c b/drivers/gpu/drm/panel/panel-samsung-sofef03.c
> >> new file mode 100644
> >> index 0000000000000..2763e1c56b37b
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef03.c
> >> @@ -0,0 +1,423 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2022 Konrad Dybcio <konrad.dybcio@linaro.org>
> >> + * Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
> >> + */
> >> +
> >> +#include <linux/backlight.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/regulator/consumer.h>
> >> +
> >> +#include <video/mipi_display.h>
> >> +
> >> +#include <drm/drm_mipi_dsi.h>
> >> +#include <drm/drm_modes.h>
> >> +#include <drm/drm_panel.h>
> >> +#include <drm/drm_probe_helper.h>
> >> +#include <drm/display/drm_dsc.h>
> >> +#include <drm/display/drm_dsc_helper.h>
> >> +
> >> +static const bool enable_120hz = true;
>
> Maybe this can be a module parameter ? Can you explain why this can't be dynamically changed by a modeset ?
>
> >> +
> >> +struct samsung_sofef03_m {
> >> +    struct drm_panel panel;
> >> +    struct mipi_dsi_device *dsi;
> >> +    struct regulator *vddio, *vci;
> >> +    struct gpio_desc *reset_gpio;
> >> +    bool prepared;
> >> +};
> >> +
> >> +static inline struct samsung_sofef03_m *to_samsung_sofef03_m(struct drm_panel *panel)
> >> +{
> >> +    return container_of(panel, struct samsung_sofef03_m, panel);
> >> +}
> >> +
> >> +static void samsung_sofef03_m_reset(struct samsung_sofef03_m *ctx)
> >> +{
> >> +    gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> >> +    usleep_range(10000, 11000);
> >> +}
> >> +
> >> +static int samsung_sofef03_m_on(struct samsung_sofef03_m *ctx)
> >> +{
> >> +    struct mipi_dsi_device *dsi = ctx->dsi;
> >> +    struct device *dev = &dsi->dev;
> >> +    int ret;
> >> +
> >> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> >> +
> >> +    mipi_dsi_dcs_write_seq(dsi, 0x9d, 0x01);
> >> +
> >> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +    usleep_range(10000, 11000);
> >> +
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x09);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xd5, 0x00, 0x00, 0x00);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x08);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xee, 0x00, 0x00);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> >> +
> >> +    ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to set tear on: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret = mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to set column address: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret = mipi_dsi_dcs_set_page_address(dsi, 0, 2520 - 1);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to set page address: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret = mipi_dsi_dcs_set_display_brightness_large(dsi, 100);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to set display brightness: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x83);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x01);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x01);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x02);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xec, 0x02, 0x00, 0x1c, 0x1c);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x0c);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xec, 0x01, 0x19);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> >> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5));
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x2d, 0x27);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0x60, enable_120hz ? 0x10 : 0x00);
> >> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> >> +    msleep(110);
> >> +
> >> +    ret = mipi_dsi_dcs_set_display_on(dsi);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int samsung_sofef03_m_off(struct samsung_sofef03_m *ctx)
> >> +{
> >> +    struct mipi_dsi_device *dsi = ctx->dsi;
> >> +    struct device *dev = &dsi->dev;
> >> +    int ret;
> >> +
> >> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> >> +
> >> +    ret = mipi_dsi_dcs_set_display_off(dsi);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to turn display off: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +    msleep(20);
> >> +
> >> +    ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +    msleep(100);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int samsung_sofef03_m_prepare(struct drm_panel *panel)
> >> +{
> >> +    struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
> >> +    struct drm_dsc_picture_parameter_set pps;
> >> +    struct device *dev = &ctx->dsi->dev;
> >> +    int ret;
> >> +
> >> +    if (ctx->prepared)
> >> +        return 0;
> >> +
> >> +    ret = regulator_enable(ctx->vddio);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to enable vddio regulator: %d\n", ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    ret = regulator_enable(ctx->vci);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to enable vci regulator: %d\n", ret);
> >> +        regulator_disable(ctx->vddio);
> >> +        return ret;
> >> +    }
> >> +
> >> +    samsung_sofef03_m_reset(ctx);
> >> +
> >> +    ret = samsung_sofef03_m_on(ctx);
> >> +    if (ret < 0) {
> >> +        dev_err(dev, "Failed to initialize panel: %d\n", ret);
> >> +        goto fail;
> >> +    }
> >> +
> >> +    if (ctx->dsi->dsc) {
> >
> > Always true
> >
> >> +        drm_dsc_pps_payload_pack(&pps, ctx->dsi->dsc);
> >> +
> >> +        ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
> >> +        if (ret < 0) {
> >> +            dev_err(dev, "failed to transmit PPS: %d\n", ret);
> >> +            goto fail;
> >> +        }
> >> +
> >> +        ret = mipi_dsi_compression_mode(ctx->dsi, true);
> >> +        if (ret < 0) {
> >> +            dev_err(dev, "Failed to enable compression mode: %d\n", ret);
> >> +            goto fail;
> >> +        }
> >> +
> >> +        msleep(28);
> >> +    }
> >> +
> >> +    ctx->prepared = true;
> >> +    return 0;
> >> +
> >> +fail:
> >> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> >> +    regulator_disable(ctx->vci);
> >> +    regulator_disable(ctx->vddio);
> >> +    return ret;
> >> +}
> >> +
> >> +static int samsung_sofef03_m_unprepare(struct drm_panel *panel)
> >> +{
> >> +    struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
> >> +    struct device *dev = &ctx->dsi->dev;
> >> +    int ret;
> >> +
> >> +    if (!ctx->prepared)
> >> +        return 0;
> >> +
> >> +    ret = samsung_sofef03_m_off(ctx);
> >> +    if (ret < 0)
> >> +        dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> >> +
> >> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> >> +    regulator_disable(ctx->vci);
> >> +    regulator_disable(ctx->vddio);
> >> +
> >> +    ctx->prepared = false;
> >> +    return 0;
> >> +}
> >> +
> >> +static const struct drm_display_mode samsung_sofef03_m_60hz_mode = {
> >> +    .clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
> >> +    .hdisplay = 1080,
> >> +    .hsync_start = 1080 + 156,
> >> +    .hsync_end = 1080 + 156 + 8,
> >> +    .htotal = 1080 + 156 + 8 + 8,
> >> +    .vdisplay = 2520,
> >> +    .vsync_start = 2520 + 2393,
> >> +    .vsync_end = 2520 + 2393 + 8,
> >> +    .vtotal = 2520 + 2393 + 8 + 8,
> >> +    .width_mm = 61,
> >> +    .height_mm = 142,
> >> +};
> >> +
> >> +static const struct drm_display_mode samsung_sofef03_m_120hz_mode = {
> >> +    .clock = (1080 + 56 + 8 + 8) * (2520 + 499 + 8 + 8) * 120 / 1000,
> >> +    .hdisplay = 1080,
> >> +    .hsync_start = 1080 + 56,
> >> +    .hsync_end = 1080 + 56 + 8,
> >> +    .htotal = 1080 + 56 + 8 + 8,
> >> +    .vdisplay = 2520,
> >> +    .vsync_start = 2520 + 499,
> >> +    .vsync_end = 2520 + 499 + 8,
> >> +    .vtotal = 2520 + 499 + 8 + 8,
> >> +    .width_mm = 61,
> >> +    .height_mm = 142,
> >> +};
> >> +
> >> +static int samsung_sofef03_m_get_modes(struct drm_panel *panel,
> >> +                   struct drm_connector *connector)
> >> +{
> >> +    if (enable_120hz)
> >
> > Is it possible to switch between these modes at runtime? It might be logical to define 60 Hz mode as preferred, while allowing users to switch to 120 Hz when required for some reason.

Current panel API does not have a way to handle modesetting. All
callbacks only get the panel as an input, state is left aside.
Probably it's time to add atomic_*() versions of these callbacks, so
that one can pass the state and maybe a connector?
Or maybe the panel should get lightweight state too, like bridges do.

> >
> >> +        return drm_connector_helper_get_modes_fixed(connector,
> >> +                                &samsung_sofef03_m_120hz_mode);
> >> +    else
> >> +        return drm_connector_helper_get_modes_fixed(connector,
> >> +                                &samsung_sofef03_m_60hz_mode);
> >> +}

-- 
With best wishes
Dmitry

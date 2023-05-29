Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ECD7150F2
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 23:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EF310E0D2;
	Mon, 29 May 2023 21:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D3210E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 21:29:16 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4effb818c37so3973885e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685395753; x=1687987753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1tP+eQP4nj66STdfWsRhOCtkWRNYGsG+AA9qlZc8VR0=;
 b=RpvRQB4/tgFRM4lrHXftUQdDjkDTqeWnpijBUtx+6jS6a4CrLL+9WRnE7J2ET7B3zJ
 1eC6y4uZeYEurDsJCyz1vLZXNKuB1MrySAg4reZ82c9MTYVjZpk6Ok9OA4Aa3MHwGQsk
 L8g/5ITpJSmUMBKcc91W42DGabBfzU1ejinUNSvU05ZthyxMqB5drwhNMKA54elKaCXX
 U7FVYnsaDoaQ1pj3+ZvaKsmRMUt6/pZOxadGfGes63nsQnuygntbPFjrdBQ8kMwO2EC5
 MojI0eczbVBB73qZimN890TRr2ULk+408vnoB9CmudeDRuGwud+J0ogdViEnc8jGE2xy
 TXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685395753; x=1687987753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1tP+eQP4nj66STdfWsRhOCtkWRNYGsG+AA9qlZc8VR0=;
 b=WawzhCPF5T+e80+qd1UzAXdOneQ4fz+IAoQ2x3incEdQhXIvVOnGTtVjlHsVogpcqi
 UUIX+QokqQ6XytAOLRVQmpyiUPNkeZChCb6HqMYB6cCDr+zStxZ9iLiFPbW8P2hoo/EV
 1Dbj9mK7J84+Fze1kEwvNDiGGNrv0K6U//EfvFCtjHNjF7obSP3/n9RUVs9GBGh6fOSx
 mum4t4wtASm7yJt30ysAoqNFY0+xyOQxZOLx6Y1oP3ddPyCjIx84wy8bduD4gsSpFf6U
 e4sa7Zqsp1HY3uhY+aIj49e+qvamWOOS/5R9R1rBD7TmPaQyY5Xq+DXWy5OVNcJlUmRX
 o2tg==
X-Gm-Message-State: AC+VfDyV1Vt4Dgr16R2QTElj6hN0b1HvPbLuOaqaJwFvJ+uYYFvqfSic
 TPEnN4tr2aQW3UuFILs0DOqBBA==
X-Google-Smtp-Source: ACHHUZ4tJ4GfnkK3+9x8CK2zWdSORd+/GdUc0nHT9D5g4RHxWPOidUcugOtdIHmNS87RTlbAsC4GyQ==
X-Received: by 2002:a2e:9245:0:b0:2ad:999b:3bd7 with SMTP id
 v5-20020a2e9245000000b002ad999b3bd7mr3901708ljg.19.1685395752920; 
 Mon, 29 May 2023 14:29:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a2e804e000000b002aeeda05382sm2612785ljg.29.2023.05.29.14.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 14:29:12 -0700 (PDT)
Message-ID: <80372e51-e72f-e70e-c205-8bd79ad57515@linaro.org>
Date: Mon, 29 May 2023 23:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC 08/10] drm/panel/samsung-sofef03: Add panel driver for
 Sony Xperia 5 II
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-8-541c341d6bee@somainline.org>
 <4679c741-7877-ce79-4086-08ec4ee9e6bf@linaro.org>
 <cf5dea0f-5999-6ac4-4f04-9b397ca94fdb@linaro.org>
 <g2f7oeoo5dljqpl7mwguoh5c766obe7vfltc2vlhx4c2na5ymm@pr2p6l5vewq5>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <g2f7oeoo5dljqpl7mwguoh5c766obe7vfltc2vlhx4c2na5ymm@pr2p6l5vewq5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.05.2023 23:21, Marijn Suijten wrote:
> On 2023-05-22 11:08:12, Neil Armstrong wrote:
>> On 22/05/2023 03:23, Dmitry Baryshkov wrote:
>>> On 22/05/2023 00:23, Marijn Suijten wrote:
>>>> The SOFEF03-M Display-IC paired with an unknown panel in the Sony Xperia
>>>> 5 II always uses Display Stream Compression 1.1 and features a 60hz and
>>>> 120hz refresh-rate mode.
>>>>
>>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>>>
>>> Konrad's S-o-b is also required then
> 
> I am unsure what to include here, since Konrad originally "authored" the
> commit but I believe it was nothing more than a completely broken and
> unusable driver spit out by "The mdss panel generator".  This needed
> enough rewriting that I don't feel like giving it much credit ;)
Might have been. I won't be mad if you drop this!

Konrad
> 
>>>
>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> ---
>>>>   drivers/gpu/drm/panel/Kconfig                 |  14 +
>>>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>>>   drivers/gpu/drm/panel/panel-samsung-sofef03.c | 423 ++++++++++++++++++++++++++
>>>>   3 files changed, 438 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>>>> index 3f11e9906f2cb..8e2668153bce2 100644
>>>> --- a/drivers/gpu/drm/panel/Kconfig
>>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>>> @@ -630,6 +630,20 @@ config DRM_PANEL_SAMSUNG_SOFEF01
>>>>         This panel features a fixed mode of 1080x2520@60.
>>>> +config DRM_PANEL_SAMSUNG_SOFEF03
>>>> +    tristate "Samsung sofef03 Sony Xperia 5 II DSI cmd mode panel"
>>>> +    depends on GPIOLIB
>>>> +    depends on OF
>>>> +    depends on DRM_MIPI_DSI
>>>> +    depends on BACKLIGHT_CLASS_DEVICE
>>>> +    help
>>>> +      Say Y or M here if you want to enable support for the Samsung AMOLED
>>>> +      command mode panel found in the Sony Xperia 5 II smartphone.
>>>> +
>>>> +      This panel uses Display Stream Compression 1.1.
>>>> +
>>>> +      The panel features a 1080x2520@60 and 1080x2520@120 mode.
>>>> +
>>>>   config DRM_PANEL_SEIKO_43WVF1G
>>>>       tristate "Seiko 43WVF1G panel"
>>>>       depends on OF
>>>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>>>> index a4039d0fc9cfb..52dcd82e33120 100644
>>>> --- a/drivers/gpu/drm/panel/Makefile
>>>> +++ b/drivers/gpu/drm/panel/Makefile
>>>> @@ -63,6 +63,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams4
>>>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
>>>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
>>>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF01) += panel-samsung-sofef01.o
>>>> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF03) += panel-samsung-sofef03.o
>>>>   obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
>>>>   obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
>>>>   obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
>>>> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef03.c b/drivers/gpu/drm/panel/panel-samsung-sofef03.c
>>>> new file mode 100644
>>>> index 0000000000000..2763e1c56b37b
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef03.c
>>>> @@ -0,0 +1,423 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2022 Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> + * Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
>>>> + */
>>>> +
>>>> +#include <linux/backlight.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +
>>>> +#include <video/mipi_display.h>
>>>> +
>>>> +#include <drm/drm_mipi_dsi.h>
>>>> +#include <drm/drm_modes.h>
>>>> +#include <drm/drm_panel.h>
>>>> +#include <drm/drm_probe_helper.h>
>>>> +#include <drm/display/drm_dsc.h>
>>>> +#include <drm/display/drm_dsc_helper.h>
>>>> +
>>>> +static const bool enable_120hz = true;
>>
>> Maybe this can be a module parameter ? Can you explain why this can't be dynamically changed by a modeset ?
>>
>>>> +
>>>> +struct samsung_sofef03_m {
>>>> +    struct drm_panel panel;
>>>> +    struct mipi_dsi_device *dsi;
>>>> +    struct regulator *vddio, *vci;
>>>> +    struct gpio_desc *reset_gpio;
>>>> +    bool prepared;
>>>> +};
>>>> +
>>>> +static inline struct samsung_sofef03_m *to_samsung_sofef03_m(struct drm_panel *panel)
>>>> +{
>>>> +    return container_of(panel, struct samsung_sofef03_m, panel);
>>>> +}
>>>> +
>>>> +static void samsung_sofef03_m_reset(struct samsung_sofef03_m *ctx)
>>>> +{
>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>>> +    usleep_range(10000, 11000);
>>>> +}
>>>> +
>>>> +static int samsung_sofef03_m_on(struct samsung_sofef03_m *ctx)
>>>> +{
>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>> +    struct device *dev = &dsi->dev;
>>>> +    int ret;
>>>> +
>>>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>>> +
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0x9d, 0x01);
>>>> +
>>>> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +    usleep_range(10000, 11000);
>>>> +
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x09);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd5, 0x00, 0x00, 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x08);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xee, 0x00, 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>>>> +
>>>> +    ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to set tear on: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to set column address: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = mipi_dsi_dcs_set_page_address(dsi, 0, 2520 - 1);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to set page address: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = mipi_dsi_dcs_set_display_brightness_large(dsi, 100);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to set display brightness: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x83);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x01);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x01);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x02);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xec, 0x02, 0x00, 0x1c, 0x1c);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x0c);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xec, 0x01, 0x19);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, BIT(5));
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x2d, 0x27);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0x60, enable_120hz ? 0x10 : 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>>>> +    msleep(110);
>>>> +
>>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int samsung_sofef03_m_off(struct samsung_sofef03_m *ctx)
>>>> +{
>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>> +    struct device *dev = &dsi->dev;
>>>> +    int ret;
>>>> +
>>>> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>>> +
>>>> +    ret = mipi_dsi_dcs_set_display_off(dsi);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to turn display off: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +    msleep(20);
>>>> +
>>>> +    ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +    msleep(100);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int samsung_sofef03_m_prepare(struct drm_panel *panel)
>>>> +{
>>>> +    struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
>>>> +    struct drm_dsc_picture_parameter_set pps;
>>>> +    struct device *dev = &ctx->dsi->dev;
>>>> +    int ret;
>>>> +
>>>> +    if (ctx->prepared)
>>>> +        return 0;
>>>> +
>>>> +    ret = regulator_enable(ctx->vddio);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to enable vddio regulator: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = regulator_enable(ctx->vci);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to enable vci regulator: %d\n", ret);
>>>> +        regulator_disable(ctx->vddio);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    samsung_sofef03_m_reset(ctx);
>>>> +
>>>> +    ret = samsung_sofef03_m_on(ctx);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to initialize panel: %d\n", ret);
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    if (ctx->dsi->dsc) {
>>>
>>> Always true
> 
> Would like to keep this as described in the Xperia XZ3 panel driver
> review.
> 
>>>> +        drm_dsc_pps_payload_pack(&pps, ctx->dsi->dsc);
>>>> +
>>>> +        ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
>>>> +        if (ret < 0) {
>>>> +            dev_err(dev, "failed to transmit PPS: %d\n", ret);
>>>> +            goto fail;
>>>> +        }
>>>> +
>>>> +        ret = mipi_dsi_compression_mode(ctx->dsi, true);
>>>> +        if (ret < 0) {
>>>> +            dev_err(dev, "Failed to enable compression mode: %d\n", ret);
>>>> +            goto fail;
>>>> +        }
>>>> +
>>>> +        msleep(28);
>>>> +    }
>>>> +
>>>> +    ctx->prepared = true;
>>>> +    return 0;
>>>> +
>>>> +fail:
>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>> +    regulator_disable(ctx->vci);
>>>> +    regulator_disable(ctx->vddio);
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int samsung_sofef03_m_unprepare(struct drm_panel *panel)
>>>> +{
>>>> +    struct samsung_sofef03_m *ctx = to_samsung_sofef03_m(panel);
>>>> +    struct device *dev = &ctx->dsi->dev;
>>>> +    int ret;
>>>> +
>>>> +    if (!ctx->prepared)
>>>> +        return 0;
>>>> +
>>>> +    ret = samsung_sofef03_m_off(ctx);
>>>> +    if (ret < 0)
>>>> +        dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
>>>> +
>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>> +    regulator_disable(ctx->vci);
>>>> +    regulator_disable(ctx->vddio);
>>>> +
>>>> +    ctx->prepared = false;
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct drm_display_mode samsung_sofef03_m_60hz_mode = {
>>>> +    .clock = (1080 + 156 + 8 + 8) * (2520 + 2393 + 8 + 8) * 60 / 1000,
>>>> +    .hdisplay = 1080,
>>>> +    .hsync_start = 1080 + 156,
>>>> +    .hsync_end = 1080 + 156 + 8,
>>>> +    .htotal = 1080 + 156 + 8 + 8,
>>>> +    .vdisplay = 2520,
>>>> +    .vsync_start = 2520 + 2393,
>>>> +    .vsync_end = 2520 + 2393 + 8,
>>>> +    .vtotal = 2520 + 2393 + 8 + 8,
>>>> +    .width_mm = 61,
>>>> +    .height_mm = 142,
>>>> +};
>>>> +
>>>> +static const struct drm_display_mode samsung_sofef03_m_120hz_mode = {
>>>> +    .clock = (1080 + 56 + 8 + 8) * (2520 + 499 + 8 + 8) * 120 / 1000,
>>>> +    .hdisplay = 1080,
>>>> +    .hsync_start = 1080 + 56,
>>>> +    .hsync_end = 1080 + 56 + 8,
>>>> +    .htotal = 1080 + 56 + 8 + 8,
>>>> +    .vdisplay = 2520,
>>>> +    .vsync_start = 2520 + 499,
>>>> +    .vsync_end = 2520 + 499 + 8,
>>>> +    .vtotal = 2520 + 499 + 8 + 8,
>>>> +    .width_mm = 61,
>>>> +    .height_mm = 142,
>>>> +};
>>>> +
>>>> +static int samsung_sofef03_m_get_modes(struct drm_panel *panel,
>>>> +                   struct drm_connector *connector)
>>>> +{
>>>> +    if (enable_120hz)
>>>
>>> Is it possible to switch between these modes at runtime? It might be logical to define 60 Hz mode as preferred, while allowing users to switch to 120 Hz when required for some reason.
> 
> I'd love to define two modes but as described in the cover letter - and
> the reason to send this as RFC - drm_panel currently does not expose the
> mode back to the driver in e.g. _prepare, so I cannot update or resend
> the necessary dcs commands to set **or change** the current mode
> (downstream defines commands to change the rate without fully resetting
> the panel).
> 
> I can either convert this to drm_bridge (is that easy / worth it?) or
> hack it in with a global as done here so that we can tackle that
> endeavour separately, while at least having the drivers upstream (or on
> the lists) as requested by quic for DSC development.
> 
>>>> +        return drm_connector_helper_get_modes_fixed(connector,
>>>> +                                &samsung_sofef03_m_120hz_mode);
>>>> +    else
>>>> +        return drm_connector_helper_get_modes_fixed(connector,
>>>> +                                &samsung_sofef03_m_60hz_mode);
>>>> +}
>>>> +
>>>> +static const struct drm_panel_funcs samsung_sofef03_m_panel_funcs = {
>>>> +    .prepare = samsung_sofef03_m_prepare,
>>>> +    .unprepare = samsung_sofef03_m_unprepare,
>>>> +    .get_modes = samsung_sofef03_m_get_modes,
>>>> +};
>>>> +
>>>> +static int samsung_sofef03_m_bl_update_status(struct backlight_device *bl)
>>>> +{
>>>> +    struct mipi_dsi_device *dsi = bl_get_data(bl);
>>>> +    u16 brightness = backlight_get_brightness(bl);
>>>> +    int ret;
>>>> +
>>>> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>>> +
>>>> +    pr_err("Writing %#x\n", brightness);
>>
>> You forgot to remove those desbug prints :-p
> 
> RFC: I indeed forgot to mention this in the cover letter but this driver
> is still mostly broken beyond displaying an image.  Setting brightness
> here does nothing (except after sending the command many times in quick
> succession by e.g. a brightness slider in UI, the panel gets stuck on a
> broken image) and the panel remained black if it wasn't for the random
> set_brightness_large(100) in _prepare.
> 
> I will remove these in a followup once figuring out how to make and keep
> it working.
> 
> - Marijn

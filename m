Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1BE7120FC
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB8F10E132;
	Fri, 26 May 2023 07:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE0710E132
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:32:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe934so2713915e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685086367; x=1687678367;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZN/4JZuQHY1T1h2dkOqoyyUUMJ5n63R18ZrD1fL2PYc=;
 b=Dg8GAdcNEtta8bRzMU/es2FoyLd5f5CJzrwNvCeSBNqlFvxj50Vwb/227XJ1Uz4uC+
 KugAgKgsAGa8KCwJQdmdB9dGhQ1diC2caRiTYj5cVb6nIqsrcDkC8pA2SjXXaKu89RSD
 iMI9NEkyvoanyH7D1gqjesA/TSG70N5OECkIDSfEspsnr7eOlXTlkB8MEUYC+z3rhQD/
 jFghhVGqzeb+eFHzmY5UvOtdmGkx1FQdX3Bqg48H8htumqkrdSx04jW4FbztK15IvVeS
 w2P5js0117ighSJEASbGvM+BZqzWKdDZE6z7b797lLwvsvYIPmvSeXhvub8175sWmIUL
 KI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685086367; x=1687678367;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZN/4JZuQHY1T1h2dkOqoyyUUMJ5n63R18ZrD1fL2PYc=;
 b=Jcj5iQthIcRslO+ACYxhNun/eY7oBszAriHREIHtX/aKLHdEmBodXKqzXjtAprCeJL
 HRmmUe1Pix+GkncmtRCLdkt8ccM1TWH3GJKrc1G2C7OnlhWKqWVOyZELVAG20v5hD/ws
 FshHlIm/hGlsMNjo4t+RVvfKd0Lc1/ZJPHtDJkS9zEU5ciqgiOGoju3N47JNZcOtaEwn
 3khSkpf/mt0mQYy54PWvk5CCUueYMJu/mFusDgsbTXYSuLLmaQj3pEAyEM7ke1J47/z3
 crn75HUN04CsT+hH5cGDyGw1nmRLYigGc/13TkqmdN5TNg13OfSeRVaAug2SXRL4j2k7
 CetQ==
X-Gm-Message-State: AC+VfDwZc65Qyjsx2CbOPbr4CsX29jsu6GntRn31YuF+8sqC0Da/Cs5Y
 BNAv/pF8edlES0j+auMXo/e+BQ==
X-Google-Smtp-Source: ACHHUZ5NiWj/DKrr9p7fJIGPKj7VQEwoKWSVW9NSzQ9tTDfpc5GoBQevYto3KttZje+P2gSJuzttcg==
X-Received: by 2002:a7b:cd8e:0:b0:3f6:113a:2023 with SMTP id
 y14-20020a7bcd8e000000b003f6113a2023mr877858wmj.12.1685086366782; 
 Fri, 26 May 2023 00:32:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0?
 ([2a01:e0a:982:cbb0:15d9:4dfb:95d6:f5a0])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c224a00b003f4247fbb5fsm7884106wmm.10.2023.05.26.00.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 00:32:46 -0700 (PDT)
Message-ID: <5becf303-8a23-6ace-2379-0a002e9b48f7@linaro.org>
Date: Fri, 26 May 2023 09:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Visionox r66451 panel
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-2-4210bcbb1649@quicinc.com>
 <3cca2809-fa26-f0cf-2ccc-6737d150b43d@linaro.org>
 <kc65fjf5xibvszx4afomzbmfrlld4vcnwfxqxefrupkaxw74fa@j2op4bj2recm>
 <2d9d7454-0e7d-b6f2-93ff-9eca69380e47@quicinc.com>
 <9d50bc4e-e747-47fa-03cf-4dbd33f778dd@quicinc.com>
Organization: Linaro Developer Services
In-Reply-To: <9d50bc4e-e747-47fa-03cf-4dbd33f778dd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2023 00:28, Jessica Zhang wrote:
> 
> 
> On 5/23/2023 1:33 PM, Jessica Zhang wrote:
>>
>>
>> On 5/21/2023 3:28 AM, Marijn Suijten wrote:
>>> On 2023-05-18 03:19:49, Dmitry Baryshkov wrote:
>>>> On 16/05/2023 23:20, Jessica Zhang wrote:
>>>>> Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
>>>>> comes with the Qualcomm HDK8350 display expansion pack.
>>>>>
>>>>> The panel enables display compression (DSC v1.2) by default.
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/panel/Kconfig                 |   8 +
>>>>>    drivers/gpu/drm/panel/Makefile                |   1 +
>>>>>    drivers/gpu/drm/panel/panel-visionox-r66451.c | 395 ++++++++++++++++++++++++++
>>>>>    3 files changed, 404 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>>>>> index 29cf5fa39ff2..9c2c36dbddf3 100644
>>>>> --- a/drivers/gpu/drm/panel/Kconfig
>>>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>>>> @@ -766,6 +766,14 @@ config DRM_PANEL_VISIONOX_VTDR6130
>>>>>          Say Y here if you want to enable support for Visionox
>>>>>          VTDR6130 1080x2400 AMOLED DSI panel.
>>>>> +config DRM_PANEL_VISIONOX_R66451
>>>>> +    tristate "Visionox R66451"
>>>>> +    depends on OF
>>>>> +    depends on DRM_MIPI_DSI
>>>>> +    help
>>>>> +      Say Y here if you want to enable support for Visionox
>>>>> +      R66451 1080x2340 AMOLED DSI panel.
>>>>> +
>>>>>    config DRM_PANEL_WIDECHIPS_WS2401
>>>>>        tristate "Widechips WS2401 DPI panel driver"
>>>>>        depends on SPI && GPIOLIB
>>>>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>>>>> index b3e8ba29edd3..e043a92ee676 100644
>>>>> --- a/drivers/gpu/drm/panel/Makefile
>>>>> +++ b/drivers/gpu/drm/panel/Makefile
>>>>> @@ -78,5 +78,6 @@ obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>>>>>    obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
>>>>>    obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>>>>>    obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
>>>>> +obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
>>>>>    obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
>>>>>    obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
>>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
>>>>> new file mode 100644
>>>>> index 000000000000..e3648ead3e84
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
>>>>> @@ -0,0 +1,395 @@
>>>>> +//SPDX-License-Identifier: GPL-2.0-only
>>>>> +//Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>> +
>>>>> +#include <linux/backlight.h>
>>>>> +#include <linux/delay.h>
>>>>> +#include <linux/gpio/consumer.h>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/of.h>
>>>>> +#include <linux/regulator/consumer.h>
>>>>> +
>>>>> +#include <drm/drm_mipi_dsi.h>
>>>>> +#include <drm/drm_modes.h>
>>>>> +#include <drm/drm_panel.h>
>>>>> +#include <drm/display/drm_dsc.h>
>>>>> +#include <drm/display/drm_dsc_helper.h>
>>>>> +
>>>>> +#include <video/mipi_display.h>
>>>>> +
>>>>> +struct visionox_r66451 {
>>>>> +    struct drm_panel panel;
>>>>> +    struct mipi_dsi_device *dsi;
>>>>> +    struct gpio_desc *reset_gpio;
>>>>> +    struct regulator_bulk_data supplies[2];
>>>>> +    bool prepared, enabled;
>>>>> +};
>>>>> +
>>>>> +static inline struct visionox_r66451 *to_visionox_r66451(struct drm_panel *panel)
>>>>> +{
>>>>> +    return container_of(panel, struct visionox_r66451, panel);
>>>>> +}
>>>>> +
>>>>> +static void visionox_r66451_reset(struct visionox_r66451 *ctx)
>>>>> +{
>>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>>>> +    usleep_range(10000, 10100);
>>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>>> +    usleep_range(10000, 10100);
>>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>>>> +    usleep_range(10000, 10100);
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_on(struct visionox_r66451 *ctx)
>>>>> +{
>>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>>> +    struct device *dev = &dsi->dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>>>> +
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xc2,
>>>>> +                   0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
>>>>> +                   0x09, 0x3c);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd7,
>>>>> +                   0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
>>>>> +                   0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
>>>>> +                   0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xde,
>>>>> +                   0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18,
>>>>> +                   0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xc4,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>>>> +                   0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xcf,
>>>>> +                   0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
>>>>> +                   0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
>>>>> +                   0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd3,
>>>>> +                   0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 0x07,
>>>>> +                   0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
>>>>> +                   0x3c, 0x9c);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd7,
>>>>> +                   0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
>>>>> +                   0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
>>>>> +                   0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd8,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>>>> +                   0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
>>>>> +                   0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>>>> +                   0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
>>>>> +                   0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf,
>>>>> +                   0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 0x00,
>>>>> +                   0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>>>> +                   0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 0x00,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 0x00,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0x39, 0x04, 0x09, 0x34);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
>>>>> +    mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x00, 0x04, 0x37);
>>>>
>>>> Please use mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
>>>>
>>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x00, 0x09, 0x23);
>>>>
>>>> mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);
>>>
>>> Yes please, thanks for already pointing these two out.
>>>
>>>>
>>>>> +
>>>>> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +    msleep(120);
>>>>> +
>>>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
>>>>
>>>> Should the mipi_dsi_dcs_set_display_on() (and maybe exit sleep mode) be
>>>> a a part of _enable()? Correspondingly _off should IMO be a part of
>>>> _disable callback().
>>>>
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed on set display on: %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +    msleep(20);
>>>>
>>>>
>>>> Do we need to add here the following line?
>>>>
>>>> dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>>>
>>>>
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_off(struct visionox_r66451 *ctx)
>>>>> +{
>>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>>> +    struct device *dev = &dsi->dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>>>> +
>>>>> +    ret = mipi_dsi_dcs_set_display_off(dsi);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to set display off: %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +    msleep(20);
>>>>> +
>>>>> +    ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +    msleep(120);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_prepare(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>>> +    struct device *dev = &ctx->dsi->dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (ctx->prepared)
>>>>> +        return 0;
>>>>> +
>>>>> +    ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
>>>>> +                    ctx->supplies);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    visionox_r66451_reset(ctx);
>>>>> +
>>>>> +    ret = visionox_r66451_on(ctx);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to initialize panel: %d\n", ret);
>>>>> +        gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>>> +        regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    ctx->prepared = true;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_unprepare(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>>> +    struct device *dev = &ctx->dsi->dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (!ctx->prepared)
>>>>> +        return 0;
>>>>> +
>>>>> +    ret = visionox_r66451_off(ctx);
>>>>> +    if (ret < 0)
>>>>> +        dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
>>>>> +
>>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>>> +    regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>>>> +
>>>>> +    ctx->prepared = false;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct drm_display_mode visionox_r66451_mode = {
>>>>> +    .clock = (1080 + 95 + 1 + 40) * (2340 + 25 + 1 + 4) * 120 / 1000,
>>>>> +    .hdisplay = 1080,
>>>>> +    .hsync_start = 1080 + 95,
>>>>> +    .hsync_end = 1080 + 95 + 1,
>>>>> +    .htotal = 1080 + 95 + 1 + 40,
>>>>> +    .vdisplay = 2340,
>>>>> +    .vsync_start = 2340 + 25,
>>>>> +    .vsync_end = 2340 + 25 + 1,
>>>>> +    .vtotal = 2340 + 25 + 1 + 4,
>>>>> +    .width_mm = 0,
>>>>> +    .height_mm = 0,
>>>>
>>>> Please provide real values here.
>>>>
>>>>> +};
>>>>> +
>>>>> +static int visionox_r66451_enable(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>>> +    struct drm_dsc_picture_parameter_set pps;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (ctx->enabled)
>>>>> +        return 0;
>>>>> +
>>>>> +    if (!dsi->dsc) {
>>>>> +        dev_err(&dsi->dev, "DSC not attached to DSI\n");
>>>>> +        return -ENODEV;
>>>>> +    }
>>>>> +
>>>>> +    drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>>>>> +    ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>>>
>>> This `ret` value is unused.
>>
>> Hi Marijn,
>>
>> Acked.
>>
>>>
>>> Do we also need to call mipi_dsi_compression_mode() to enable
>>> compression? 
>>
>>  From my understanding, DSC is enabled by default for this panel, so it's not necessary to explicitly set it.
>>
>>> This also selects PPS table 1 (which is supposedly the
>>> default reset value, and the PPS that is uploaded by
>>> mipi_dsi_picture_parameter_set()).  Note that it does set the algorithm
>>> to "VESA DSC Standard 1.1" but i am unsure if it makes a difference
>>> (docs for mipi_dsi_picture_parameter_set() say that it is "1.1" as well)
>>
>> We noticed the same thing when trying to debug an unrelated panel issue. FWIW, the raw PPS values being sent to the panel are correct and it's not breaking DSC for us.
>>
>>>
>>>>> +
>>>>> +    ctx->enabled = true;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_disable(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>>> +
>>>>> +    ctx->enabled = false;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_get_modes(struct drm_panel *panel,
>>>>> +                    struct drm_connector *connector)
>>>>> +{
>>>>> +    struct drm_display_mode *mode;
>>>>> +
>>>>> +    mode = drm_mode_duplicate(connector->dev, &visionox_r66451_mode);
>>>>> +    if (!mode)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    drm_mode_set_name(mode);
>>>>> +
>>>>> +    mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>>>>> +    connector->display_info.width_mm = mode->width_mm;
>>>>> +    connector->display_info.height_mm = mode->height_mm;
>>>>> +    drm_mode_probed_add(connector, mode);
>>>>
>>>> Can we use drm_connector_helper_get_modes_fixed() instead?
>>>
>>> This does not set DRM_MODE_TYPE_DRIVER though; is that preferred?
>>>
>>>>> +
>>>>> +    return 1;
>>>>> +}
>>>>> +
>>>>> +static const struct drm_panel_funcs visionox_r66451_funcs = {
>>>>> +    .prepare = visionox_r66451_prepare,
>>>>> +    .unprepare = visionox_r66451_unprepare,
>>>>> +    .get_modes = visionox_r66451_get_modes,
>>>>> +    .enable = visionox_r66451_enable,
>>>>> +    .disable = visionox_r66451_disable,
>>>>> +};
>>>>> +
>>>>> +static int visionox_r66451_bl_update_status(struct backlight_device *bl)
>>>>> +{
>>>>> +    struct mipi_dsi_device *dsi = bl_get_data(bl);
>>>>> +    u16 brightness = backlight_get_brightness(bl);
>>>>> +
>>>>> +    return mipi_dsi_dcs_set_display_brightness(dsi, cpu_to_le16(brightness));
>>>>
>>>> mipi_dsi_dcs_set_display_brightness() already converts the brightness,
>>>> so you don't need cpu_to_le16 here.
>>>
>>> Tread carefully here: we've had the same issue and conversation on our
>>> Sony panels where this extra inversion is required.
>>> set_display_brightness() sends the bytes as little-endian to the panel
>>> (and it even assumes little-endian in get_display_brightness()) but the
>>> spec for 16-bit brightness values states that they have to be sent in
>>> big-endian.  This is why c9d27c6be518b ("drm/mipi-dsi: Fix byte order of
>>> 16-bit DCS set/get brightness") added
>>> mipi_dsi_dcs_set_display_brightness_large().
>>>
>>> Jessica, if you need to have the endian swap here (should be very easy
>>> to test with a real panel, but it should be given the max_brightness
>>> value being over 8 bits) please switch to the _large() variant.
>>
>> Got it, thanks for the heads up!
> 
> Hi Marijn,
> 
> Just wanted to update this thread -- I've checked the backlight brightness values in the sysfs and it matches the value being given in the panel driver (255), so I think it should be fine to use *_set_display_brightness() without the _large() variant.

Sure, I was also misleaded by you using cpu_to_le16() but as Dmitry said it's already
done in mipi_dsi_dcs_set_display_brightness() and a no-op on LE arm64 platforms anyway.

Neil

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>>
>>>>> +}
>>>>> +
>>>>> +static const struct backlight_ops visionox_r66451_bl_ops = {
>>>>> +    .update_status = visionox_r66451_bl_update_status,
>>>
>>> Should this implement get_brightness?
>>
>> I don't believe so. As far as I know, get_brightness() is an optional op for if the panel has a special HW readback for getting the brightness value, and this panel doesn't have that. So the default behavior of getting the current brightness property value should be fine.
>>
>>>
>>>>> +};
>>>>> +
>>>>> +static struct backlight_device *
>>>>> +visionox_r66451_create_backlight(struct mipi_dsi_device *dsi)
>>>>> +{
>>>>> +    struct device *dev = &dsi->dev;
>>>>> +    const struct backlight_properties props = {
>>>>> +        .type = BACKLIGHT_RAW,
>>>>> +        .brightness = 255,
>>>>> +        .max_brightness = 4095,
>>>>> +    };
>>>>> +
>>>>> +    return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
>>>>> +                          &visionox_r66451_bl_ops, &props);
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_probe(struct mipi_dsi_device *dsi)
>>>>> +{
>>>>> +    struct device *dev = &dsi->dev;
>>>>> +    struct visionox_r66451 *ctx;
>>>>> +    struct drm_dsc_config *dsc;
>>>>> +    int ret = 0;
>>>>> +
>>>>> +    ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>>> +    if (!ctx)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
>>>>> +    if (!dsc)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    /* Set DSC params */
>>>>> +    dsc->dsc_version_major = 0x1;
>>>>> +    dsc->dsc_version_minor = 0x2;
>>>>> +
>>>>> +    dsc->slice_height = 20;
>>>>> +    dsc->slice_width = 540;
>>>>> +    dsc->slice_count = 2;
>>>>> +    dsc->bits_per_component = 8;
>>>>> +    dsc->bits_per_pixel = 0x8 << 4;
>>>
>>> What's the 0x for?  bpc is also just "8" and not 0x8.
>>
>> Is there a functional difference between 0x8 vs 8? I can drop the "0x" if you prefer it as decimal instead of hex.
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>> - Marijn
>>>
>>>>> +    dsc->block_pred_enable = true;
>>>>> +
>>>>> +    dsi->dsc = dsc;
>>>>> +
>>>>> +    ctx->supplies[0].supply = "vddio";
>>>>> +    ctx->supplies[1].supply = "vdd";
>>>>> +
>>>>> +    ret = devm_regulator_bulk_get(&dsi->dev, ARRAY_SIZE(ctx->supplies),
>>>>> +            ctx->supplies);
>>>>> +
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>>>>> +    if (IS_ERR(ctx->reset_gpio))
>>>>> +        return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "Failed to get reset-gpios\n");
>>>>> +
>>>>> +    ctx->dsi = dsi;
>>>>> +    mipi_dsi_set_drvdata(dsi, ctx);
>>>>> +
>>>>> +    dsi->lanes = 4;
>>>>> +    dsi->format = MIPI_DSI_FMT_RGB888;
>>>>> +    dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>>> +
>>>>> +    drm_panel_init(&ctx->panel, dev, &visionox_r66451_funcs, DRM_MODE_CONNECTOR_DSI);
>>>>> +    ctx->panel.backlight = visionox_r66451_create_backlight(dsi);
>>>>> +    if (IS_ERR(ctx->panel.backlight))
>>>>> +        return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
>>>>> +                "Failed to create backlight\n");
>>>>> +
>>>>> +    drm_panel_add(&ctx->panel);
>>>>> +
>>>>> +    ret = mipi_dsi_attach(dsi);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
>>>>> +        drm_panel_remove(&ctx->panel);
>>>>> +    }
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +static void visionox_r66451_remove(struct mipi_dsi_device *dsi)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = mipi_dsi_get_drvdata(dsi);
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = mipi_dsi_detach(dsi);
>>>>> +    if (ret < 0)
>>>>> +        dev_err(&dsi->dev, "Failed to detach DSI host: %d\n", ret);
>>>>> +
>>>>> +    drm_panel_remove(&ctx->panel);
>>>>> +}
>>>>> +
>>>>> +static const struct of_device_id visionox_r66451_of_match[] = {
>>>>> +    {.compatible = "visionox,r66451"},
>>>>> +    { /*sentinel*/ }
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, visionox_r66451_of_match);
>>>>> +
>>>>> +static struct mipi_dsi_driver visionox_r66451_driver = {
>>>>> +    .probe = visionox_r66451_probe,
>>>>> +    .remove = visionox_r66451_remove,
>>>>> +    .driver = {
>>>>> +        .name = "panel-visionox-r66451",
>>>>> +        .of_match_table = visionox_r66451_of_match,
>>>>> +    },
>>>>> +};
>>>>> +
>>>>> +module_mipi_dsi_driver(visionox_r66451_driver);
>>>>> +
>>>>> +MODULE_AUTHOR("Jessica Zhang <quic_jesszhan@quicinc.com>");
>>>>> +MODULE_DESCRIPTION("Panel driver for the Visionox R66451 AMOLED DSI panel");
>>>>> +MODULE_LICENSE("GPL");
>>>>>
>>>>
>>>> -- 
>>>> With best wishes
>>>> Dmitry
>>>>


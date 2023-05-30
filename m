Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573CF717162
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB98610E441;
	Tue, 30 May 2023 23:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE14710E43F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 23:12:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4b0a0b557so5698201e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685488358; x=1688080358;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VlrmURisZS7q/QAHr0J+CvY3JO6uf1hNrIrIO78pa18=;
 b=Fo0dkMfhk0Vi7P8wz+WXkw8ZPZV1Vl46ZM2YvqHNrCx9UMIvhl/jfg9hq8sV/acL40
 zoP7YnVKsrw6L2VW68/nOnjEeKMGGdJjyS/NCqXRB2XMT6OiG7nLn+EMCmfJVRQHwK7b
 5eL3Tni5dC1qzaRa8FFbwih7k291xNEPD8o6am09pdq7qVvmFOjqx0ihux/gWtYdzop2
 ZiWhO36st07XHN8nCQTai6hanK+/c1MQZAmaEG18LfyLad0dqLlobuJsGs//05uPJl2V
 PS9e0Nweu4I64ocP32S0iqk9vgCzfE/GqRkjv07elKjyGsVxvY/OatYzm/bisf8dupJQ
 YzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685488358; x=1688080358;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VlrmURisZS7q/QAHr0J+CvY3JO6uf1hNrIrIO78pa18=;
 b=dAodK1Fg0h27/+4S2gYfl57mkane7yFVKZwXe5XN+9Qqq2xuiom/gMouBBgdrl3Uoy
 0QlrdfC4Cc8Jj/r+h1lfNLz+YXSiN9rgOBx3Yfiv4dl8hSkkfv5eTmuONP4Nq1pnXPu6
 RycigsqcElHL6sYsCSQZxFw/UIm2/tQ6igXgdZt27u3duGS4l+hynUOpFjkI3QmmrEca
 fV0smf1dMExdKnpYN/Ojb0NfABxmIZjA+zXYjlPjiYAlugBq5OAdtspODryz4Efq7uRq
 EEEIduAgu0l54eticnOIoB9VK9YYxPJ7mYaFfG+sG7Cr5mJuHUaZxRx6QDZ88r6m/DBD
 xPiA==
X-Gm-Message-State: AC+VfDzwbAwluBgvZ1qQ0z+PHCzqF4TVsfBZGAv4XKcUW1Fe2Lw+72nY
 qOmwAlXZ0veP/O46xoGNAPfOVg==
X-Google-Smtp-Source: ACHHUZ4hbr+QnHxMndXp+K41DpevzQh5vk3K1wv9jGL+7zjGaSwdfj1uOgSrwYbmIAtG/nr/fHUTcw==
X-Received: by 2002:ac2:4c13:0:b0:4ef:f11c:f5b0 with SMTP id
 t19-20020ac24c13000000b004eff11cf5b0mr1760472lfq.54.1685488358638; 
 Tue, 30 May 2023 16:12:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a056512007600b004f3940c2b07sm472758lfo.274.2023.05.30.16.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 16:12:38 -0700 (PDT)
Message-ID: <f3908927-e9b7-c61e-d5e6-8223dfe45bf8@linaro.org>
Date: Wed, 31 May 2023 02:12:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Visionox r66451 panel
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-2-4210bcbb1649@quicinc.com>
 <3cca2809-fa26-f0cf-2ccc-6737d150b43d@linaro.org>
 <aeef04c4-7952-2b7c-d673-5c75dda19154@quicinc.com>
 <196a43da-1f59-6213-7c4f-2cfcb8d39b32@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <196a43da-1f59-6213-7c4f-2cfcb8d39b32@quicinc.com>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 23:09, Jessica Zhang wrote:
> 
> 
> On 5/18/2023 3:17 PM, Jessica Zhang wrote:
>>
>>
>> On 5/17/2023 5:19 PM, Dmitry Baryshkov wrote:
>>> On 16/05/2023 23:20, Jessica Zhang wrote:
>>>> Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
>>>> comes with the Qualcomm HDK8350 display expansion pack.
>>>>
>>>> The panel enables display compression (DSC v1.2) by default.
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/panel/Kconfig                 |   8 +
>>>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>>>   drivers/gpu/drm/panel/panel-visionox-r66451.c | 395 
>>>> ++++++++++++++++++++++++++
>>>>   3 files changed, 404 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/Kconfig 
>>>> b/drivers/gpu/drm/panel/Kconfig
>>>> index 29cf5fa39ff2..9c2c36dbddf3 100644
>>>> --- a/drivers/gpu/drm/panel/Kconfig
>>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>>> @@ -766,6 +766,14 @@ config DRM_PANEL_VISIONOX_VTDR6130
>>>>         Say Y here if you want to enable support for Visionox
>>>>         VTDR6130 1080x2400 AMOLED DSI panel.
>>>> +config DRM_PANEL_VISIONOX_R66451
>>>> +    tristate "Visionox R66451"
>>>> +    depends on OF
>>>> +    depends on DRM_MIPI_DSI
>>>> +    help
>>>> +      Say Y here if you want to enable support for Visionox
>>>> +      R66451 1080x2340 AMOLED DSI panel.
>>>> +
>>>>   config DRM_PANEL_WIDECHIPS_WS2401
>>>>       tristate "Widechips WS2401 DPI panel driver"
>>>>       depends on SPI && GPIOLIB
>>>> diff --git a/drivers/gpu/drm/panel/Makefile 
>>>> b/drivers/gpu/drm/panel/Makefile
>>>> index b3e8ba29edd3..e043a92ee676 100644
>>>> --- a/drivers/gpu/drm/panel/Makefile
>>>> +++ b/drivers/gpu/drm/panel/Makefile
>>>> @@ -78,5 +78,6 @@ obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += 
>>>> panel-tpo-tpg110.o
>>>>   obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
>>>>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>>>>   obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += 
>>>> panel-visionox-vtdr6130.o
>>>> +obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
>>>>   obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
>>>>   obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += 
>>>> panel-xinpeng-xpp055c272.o
>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c 
>>>> b/drivers/gpu/drm/panel/panel-visionox-r66451.c
>>>> new file mode 100644
>>>> index 000000000000..e3648ead3e84
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
>>>> @@ -0,0 +1,395 @@
>>>> +//SPDX-License-Identifier: GPL-2.0-only
>>>> +//Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved.
>>>> +
>>>> +#include <linux/backlight.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +
>>>> +#include <drm/drm_mipi_dsi.h>
>>>> +#include <drm/drm_modes.h>
>>>> +#include <drm/drm_panel.h>
>>>> +#include <drm/display/drm_dsc.h>
>>>> +#include <drm/display/drm_dsc_helper.h>
>>>> +
>>>> +#include <video/mipi_display.h>
>>>> +
>>>> +struct visionox_r66451 {
>>>> +    struct drm_panel panel;
>>>> +    struct mipi_dsi_device *dsi;
>>>> +    struct gpio_desc *reset_gpio;
>>>> +    struct regulator_bulk_data supplies[2];
>>>> +    bool prepared, enabled;
>>>> +};
>>>> +
>>>> +static inline struct visionox_r66451 *to_visionox_r66451(struct 
>>>> drm_panel *panel)
>>>> +{
>>>> +    return container_of(panel, struct visionox_r66451, panel);
>>>> +}
>>>> +
>>>> +static void visionox_r66451_reset(struct visionox_r66451 *ctx)
>>>> +{
>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>>> +    usleep_range(10000, 10100);
>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>> +    usleep_range(10000, 10100);
>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>>> +    usleep_range(10000, 10100);
>>>> +}
>>>> +
>>>> +static int visionox_r66451_on(struct visionox_r66451 *ctx)
>>>> +{
>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>> +    struct device *dev = &dsi->dev;
>>>> +    int ret;
>>>> +
>>>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>>> +
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xc2,
>>>> +                   0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 
>>>> 0x00,
>>>> +                   0x09, 0x3c);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd7,
>>>> +                   0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 
>>>> 0x0a,
>>>> +                   0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x19,
>>>> +                   0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xde,
>>>> +                   0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 
>>>> 0x18,
>>>> +                   0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 
>>>> 0x00, 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xc4,
>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x00,
>>>> +                   0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xcf,
>>>> +                   0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x08,
>>>> +                   0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 
>>>> 0x01,
>>>> +                   0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd3,
>>>> +                   0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 
>>>> 0x07,
>>>> +                   0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 
>>>> 0xa0,
>>>> +                   0x3c, 0x9c);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd7,
>>>> +                   0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 
>>>> 0x0a,
>>>> +                   0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x19,
>>>> +                   0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd8,
>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x00,
>>>> +                   0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 
>>>> 0x3a,
>>>> +                   0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x00,
>>>> +                   0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x00,
>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x0a,
>>>> +                   0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf,
>>>> +                   0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 
>>>> 0x00,
>>>> +                   0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>> 0x00,
>>>> +                   0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 
>>>> 0x00,
>>>> +                   0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 
>>>> 0x00,
>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 
>>>> 0x39, 0x04, 0x09, 0x34);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
>>>> +    mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 
>>>> 0x00, 0x04, 0x37);
>>>
>>> Please use mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
>>
>> Hi Dmitry,
>>
>> Acked.
>>
>>>
>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 
>>>> 0x00, 0x09, 0x23);
>>>
>>> mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);
>>
>> Acked.
>>
>>>
>>>> +
>>>> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +    msleep(120);
>>>> +
>>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
>>>
>>> Should the mipi_dsi_dcs_set_display_on() (and maybe exit sleep mode) 
>>> be a a part of _enable()? Correspondingly _off should IMO be a part 
>>> of _disable callback().
>>
>> Acked. Looking at the downstream code, it seems that all the dcs on 
>> commands can be sent within _enable() (and similarly for the off 
>> commands with _disable()).
>>
>>>
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed on set display on: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +    msleep(20);
>>>
>>>
>>> Do we need to add here the following line?
>>>
>>> dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>
>> Do you mean within the return on error block?
>>
>>  From my understanding, we should be setting the MIPI_DSI_MODE_LPM for 
>> panel_on() then unsetting MODE_LPM in panel_off().
>>
>>>
>>>
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int visionox_r66451_off(struct visionox_r66451 *ctx)
>>>> +{
>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>> +    struct device *dev = &dsi->dev;
>>>> +    int ret;
>>>> +
>>>> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>>> +
>>>> +    ret = mipi_dsi_dcs_set_display_off(dsi);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to set display off: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +    msleep(20);
>>>> +
>>>> +    ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +    msleep(120);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int visionox_r66451_prepare(struct drm_panel *panel)
>>>> +{
>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>> +    struct device *dev = &ctx->dsi->dev;
>>>> +    int ret;
>>>> +
>>>> +    if (ctx->prepared)
>>>> +        return 0;
>>>> +
>>>> +    ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
>>>> +                    ctx->supplies);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    visionox_r66451_reset(ctx);
>>>> +
>>>> +    ret = visionox_r66451_on(ctx);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to initialize panel: %d\n", ret);
>>>> +        gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>> +        regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), 
>>>> ctx->supplies);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ctx->prepared = true;
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int visionox_r66451_unprepare(struct drm_panel *panel)
>>>> +{
>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>> +    struct device *dev = &ctx->dsi->dev;
>>>> +    int ret;
>>>> +
>>>> +    if (!ctx->prepared)
>>>> +        return 0;
>>>> +
>>>> +    ret = visionox_r66451_off(ctx);
>>>> +    if (ret < 0)
>>>> +        dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
>>>> +
>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>> +    regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>>> +
>>>> +    ctx->prepared = false;
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct drm_display_mode visionox_r66451_mode = {
>>>> +    .clock = (1080 + 95 + 1 + 40) * (2340 + 25 + 1 + 4) * 120 / 1000,
>>>> +    .hdisplay = 1080,
>>>> +    .hsync_start = 1080 + 95,
>>>> +    .hsync_end = 1080 + 95 + 1,
>>>> +    .htotal = 1080 + 95 + 1 + 40,
>>>> +    .vdisplay = 2340,
>>>> +    .vsync_start = 2340 + 25,
>>>> +    .vsync_end = 2340 + 25 + 1,
>>>> +    .vtotal = 2340 + 25 + 1 + 4,
>>>> +    .width_mm = 0,
>>>> +    .height_mm = 0,
>>>
>>> Please provide real values here.
>>
>> Acked.
>>
>>>
>>>> +};
>>>> +
>>>> +static int visionox_r66451_enable(struct drm_panel *panel)
>>>> +{
>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>> +    struct drm_dsc_picture_parameter_set pps;
>>>> +    int ret;
>>>> +
>>>> +    if (ctx->enabled)
>>>> +        return 0;
>>>> +
>>>> +    if (!dsi->dsc) {
>>>> +        dev_err(&dsi->dev, "DSC not attached to DSI\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>>>> +    ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>>>> +
>>>> +    ctx->enabled = true;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int visionox_r66451_disable(struct drm_panel *panel)
>>>> +{
>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>> +
>>>> +    ctx->enabled = false;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int visionox_r66451_get_modes(struct drm_panel *panel,
>>>> +                    struct drm_connector *connector)
>>>> +{
>>>> +    struct drm_display_mode *mode;
>>>> +
>>>> +    mode = drm_mode_duplicate(connector->dev, &visionox_r66451_mode);
>>>> +    if (!mode)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    drm_mode_set_name(mode);
>>>> +
>>>> +    mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>>>> +    connector->display_info.width_mm = mode->width_mm;
>>>> +    connector->display_info.height_mm = mode->height_mm;
>>>> +    drm_mode_probed_add(connector, mode);
>>>
>>> Can we use drm_connector_helper_get_modes_fixed() instead?
>>
>> Acked.
> 
> Hi Dmitry,
> 
> Just wanted to follow up on this -- As Marijn mentioned in a separated 
> thread, DRM_MODE_TYPE_DRIVER is not set within 
> drm_connector_helper_get_modes_fixed(), and looking at the kernel docs, 
> that's a required flag for this mode.

You can set this flag in the visionox_r66451_mode, can you not?

> Since I'm not able to set the *_TYPE_DRIVER flag before 
> *_get_modes_fixed() is called, I'll stick to using the previous method 
> of calling drm_mode_probed_add() directly in 
> visionox_r66451_get_modes(). (FWIW, other drivers such as 
> panel-visionox-vtdr6130, panel-truly-nt35597, and panel-visionox-rm69299 
> also don't use *_get_modes_fixed() and call drm_mode_probed_add() 
> directly in their get_mode() implementations.)

That doesn't mean that we should increase the amount of the c&p code.

If I have time, I'try doing a rework of existing panel drivers.

-- 
With best wishes
Dmitry


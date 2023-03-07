Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FBE6ADD07
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 12:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385DA10E437;
	Tue,  7 Mar 2023 11:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9079C10E437
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 11:13:29 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id x6so12782874ljq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 03:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678187607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JOb+ese1G9EOeUzjmNMkD2P+gItFSqPvD5nHFyy1oPY=;
 b=f5j1teKS1STo0sB3a7p3ugHg4el2apLby6L25iQkSUf7jFZm3Ew3v2gR7FTZZiuH2F
 7cBvegoFfuW78HToK5NFrGtU3BJfe0VMsxofysPywYmmBxRj7esfOcBD/GvGmeNpfKoN
 uwyeY5aXuP5yxxeDPYtgwOBTASP632TnNs6oNIlSm3osjixi3WFaRYGZIQT9EcyyRqri
 0x9dxcUeW/c6PWDVz1bioM649Ap4obHsNZATC1nlWDl7Vp6ZE4L/w0J/7yOMH7oGZoHa
 EG9slI+u5gNr+XNxqRHuN1sfWNuAUoDBAOslrT77JEctmorii4nlU+xhgdiOmjAdc3BV
 IoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678187607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JOb+ese1G9EOeUzjmNMkD2P+gItFSqPvD5nHFyy1oPY=;
 b=MKnqlbZRaWaWZfjaV4uU2Ls3NbhTe6Yf3ry1Vf2lck0PpLQcdv3JlJBiIyL+3px3je
 zRbjJtkJKI9wSCu+BseUVHbi60sYS0LdhomS7p7c9Z1fg4Xkvv6MPfZXoeqHHgJ2T6Kn
 Ld7hvYlgEP3wDX7uYGKy4DQQ/Gy+Jy2njUEETIna8uSzHUrAuaRv4EvG82m3cvH0O8Tt
 LVei1tcCciUyUdHlBxwCvdOSa14x2xuLFMhpa5YXrMJV/ao2GveM/6q8XbKFr4ZBaK4c
 bL5M2bCBbpTWTep6HLDEyxVcBVmLEckiw91kGe2hOwUnWcJGQwf8B7qqlY3BCp9TuTq9
 tHLA==
X-Gm-Message-State: AO0yUKU/JrQzVkniJ9eJ4SdVpz8Ny7Za+yPVeHV22VRRDepxfEmkF7sr
 7Pbqz1RE06HyMPcYn+/7ZPFrow==
X-Google-Smtp-Source: AK7set9G9umUriGHuIBtEjMY7Oj/2R8YqqszMz6w+ITLJyztplcz7ffXvIOH2pSgTXs3O6OHl6KwYA==
X-Received: by 2002:a2e:86c4:0:b0:295:965f:415 with SMTP id
 n4-20020a2e86c4000000b00295965f0415mr3945621ljj.10.1678187607676; 
 Tue, 07 Mar 2023 03:13:27 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a2e988f000000b00295a50e7529sm2148793ljj.90.2023.03.07.03.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:13:27 -0800 (PST)
Message-ID: <e9ec543a-0da6-9314-9e9e-62f7ede9efaf@linaro.org>
Date: Tue, 7 Mar 2023 12:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] gpu/drm/panel: Add Lenovo NT36523W BOE panel
To: neil.armstrong@linaro.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230217-topic-lenovo-panel-v1-0-9d7ee1602089@linaro.org>
 <20230217-topic-lenovo-panel-v1-2-9d7ee1602089@linaro.org>
 <6c58497d-47c4-002f-4f39-977706f9df87@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6c58497d-47c4-002f-4f39-977706f9df87@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7.03.2023 10:19, Neil Armstrong wrote:
> Hi,
> 
> On 17/02/2023 12:29, Konrad Dybcio wrote:
>> Introduce support for the BOE panel with a NT36523W touch/driver IC
>> found on some Lenovo Tab P11 devices. It's a 2000x1200, 24bit RGB
>> MIPI DSI panel with integrated DCS-controlled backlight (that expects
>> big-endian communication).
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/panel/Kconfig                     |  12 +
>>   drivers/gpu/drm/panel/Makefile                    |   1 +
>>   drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c | 751 ++++++++++++++++++++++
>>   3 files changed, 764 insertions(+)
>>
> 
> <snip>
> 
>> diff --git a/drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c b/drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c
>> new file mode 100644
>> index 000000000000..83478e471493
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c
>> @@ -0,0 +1,751 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023 Linaro Limited
>> + *
>> + * Generated with linux-mdss-dsi-panel-driver-generator with
>> + * some manual adjustments.
>> + */
> 
> <snip>
> 
>> +static int nt36523w_boe_bl_update_status(struct backlight_device *bl)
>> +{
>> +    struct mipi_dsi_device *dsi = bl_get_data(bl);
>> +    u16 brightness = backlight_get_brightness(bl);
>> +    int ret;
>> +
>> +    brightness = cpu_to_be16(brightness);
>> +
>> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>> +
>> +    ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
>> +    if (ret < 0)
>> +        return ret;
> 
> It's not wrong as is, but could you switch to mipi_dsi_dcs_set_display_brightness_large() ?
Sure!

Recent-ish panels only talk BE brightness data, very cool that
somebody made a wrapper for this!

Konrad
> 
>> +
>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>> +
>> +    return 0;
>> +}
>> +
>> +static int nt36523w_boe_bl_get_brightness(struct backlight_device *bl)
>> +{
>> +    struct mipi_dsi_device *dsi = bl_get_data(bl);
>> +    u16 brightness;
>> +    int ret;
>> +
>> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>> +
>> +    ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
> 
> And here to  mipi_dsi_dcs_get_display_brightness_large() ?
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>> +
>> +    brightness = be16_to_cpu(brightness);
>> +
>> +    return brightness;
>> +}
>> +
> Please send a v2 with those changes and keep my reviewed-by
> 
> Thanks!
> Neil

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331326ADA18
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304F610E38E;
	Tue,  7 Mar 2023 09:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8BF10E38A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:19:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p16so7274611wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678180792;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Xvf3J0opIvDUcxf9EVO52WF3b9vkBrT7WnUb6TfxtQw=;
 b=qlSONsvqCrRJCiKnQemhSWVzmW8IkLxHGjVLW+q3uPKfZB74eSAgFyNGsjVpOIppKR
 N7WvqjftsfK69mezO3QyBdmQeRB48X/cA/zRMbjS401KI8VVZa/VpmnM0rgvi3WW/iAs
 4+JqUn3vf8CiUvM10mRD8HJgsZnRr9AzQJVu6K7xatmQF67cDI7+i98GC3FZV6qvsmzX
 PSastNPqf1afvY4XteO+Y/ooO5tuuF/UIREF1YpZtfJ8cVrv8BwN+Q04csKll7eO7mUi
 JKAvh8MKLkhF/bzJDgIzbLl3fLg4kwPJVEFLYRoiiT5N+zx2PpBCDVEdhWDYANtCSfNd
 McmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678180792;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xvf3J0opIvDUcxf9EVO52WF3b9vkBrT7WnUb6TfxtQw=;
 b=JCOXpth4xGmxTm7CZACHD2i6tEkYT/GeIQj9oEVxn6jjSbqvRGTfnMZXuKc625HqxX
 f0YmpRIOy4+o06PYNVLuXZBGCRYb2ixITK2x0wBscYIR6WMW0JT8v2oekCI/Efa9EVS7
 KqrSQPXhWMtLLTs3KADhS8XEnyI99tbXaUDddAs1eeTIkhuALPzMIhLmDVfI9OnVPPWF
 tbUfZ9gXOP+AXbeJ5Juf05Pxp9keCl8LLF428ZCAtqgro4jdcxvptJz7FmZ9McDx7Ky7
 5LkuGj+XCppUwyN9fNGU/uqPowCnbigHi8FRp03gssdrf38CNVzT25Pb9K0EXTfWLGd+
 mpJg==
X-Gm-Message-State: AO0yUKX3fnPEn7leMhIcOQr9EdePA2iajmaEl3cfpobZX5zKqbMlytXn
 UAb58hbYOiGdqwGku8Si5Q5qBg==
X-Google-Smtp-Source: AK7set/k5WpOi8Sz3yDYvf2/fNpy2N6KzP1JdktA73cysUhzQQJhzb0GXWO8S+TNxvAb6p0yyfaazA==
X-Received: by 2002:a05:600c:4448:b0:3ea:82a9:3644 with SMTP id
 v8-20020a05600c444800b003ea82a93644mr11655011wmn.34.1678180791874; 
 Tue, 07 Mar 2023 01:19:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6faa:6d13:586e:871d?
 ([2a01:e0a:982:cbb0:6faa:6d13:586e:871d])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a5d63cc000000b002c5801aa9b0sm12141821wrw.40.2023.03.07.01.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 01:19:51 -0800 (PST)
Message-ID: <6c58497d-47c4-002f-4f39-977706f9df87@linaro.org>
Date: Tue, 7 Mar 2023 10:19:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] gpu/drm/panel: Add Lenovo NT36523W BOE panel
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230217-topic-lenovo-panel-v1-0-9d7ee1602089@linaro.org>
 <20230217-topic-lenovo-panel-v1-2-9d7ee1602089@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230217-topic-lenovo-panel-v1-2-9d7ee1602089@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17/02/2023 12:29, Konrad Dybcio wrote:
> Introduce support for the BOE panel with a NT36523W touch/driver IC
> found on some Lenovo Tab P11 devices. It's a 2000x1200, 24bit RGB
> MIPI DSI panel with integrated DCS-controlled backlight (that expects
> big-endian communication).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                     |  12 +
>   drivers/gpu/drm/panel/Makefile                    |   1 +
>   drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c | 751 ++++++++++++++++++++++
>   3 files changed, 764 insertions(+)
> 

<snip>

> diff --git a/drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c b/drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c
> new file mode 100644
> index 000000000000..83478e471493
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c
> @@ -0,0 +1,751 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Linaro Limited
> + *
> + * Generated with linux-mdss-dsi-panel-driver-generator with
> + * some manual adjustments.
> + */

<snip>

> +static int nt36523w_boe_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	brightness = cpu_to_be16(brightness);
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +	if (ret < 0)
> +		return ret;

It's not wrong as is, but could you switch to mipi_dsi_dcs_set_display_brightness_large() ?

> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static int nt36523w_boe_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);

And here to  mipi_dsi_dcs_get_display_brightness_large() ?
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	brightness = be16_to_cpu(brightness);
> +
> +	return brightness;
> +}
> +
Please send a v2 with those changes and keep my reviewed-by

Thanks!
Neil

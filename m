Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A372389E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 09:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7739710E00C;
	Tue,  6 Jun 2023 07:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0004810E00C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 07:14:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51492ae66a4so8019758a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686035691; x=1688627691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XmRHIbHI19eoc97ppNeppF0Ezev+VmG8IR7wKOYBJyU=;
 b=WH84TS7sVBpGROxnijNPIa5FE+w0fXrVQjj8SbiPkF+XGVJsxZIoagF5R+NHOkL92o
 8WbOSQ3ScOIIXG3aNUrAiBownXTNQ0FygSuL4xKGXx+zdSeGerhEwUxB+R/WISBgJPf7
 NBj2D0jFiLq5VeViHNbSlLS+AH5HAUGvS278VpaVPMskr3oltn56aB3e16aYwnkvybVS
 5oiPsnMb37n4VbK9AE3hR5Yzfux0k4huOhPkLUE5LpaAVpTCaYCGiR3qmpcyXqGshxYy
 ZJTZpkYsImHekEvIf7h4qdXQoMNha8fhitraXkeT1oBDmqAI8hDdKVCYbQWjAAR0v/8b
 Rl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686035691; x=1688627691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XmRHIbHI19eoc97ppNeppF0Ezev+VmG8IR7wKOYBJyU=;
 b=NJSs2HE6NLaCZurnatUjk4YL6xEkxAz3fT/Jp1QKc6i8Nfg2F6+kDtfmkUNobjJW+7
 GiCCjY7pZn7dL7tunu0FncNxlAFJWt1sB+KRO0AW80LfGIwqb8keeZ5Li+NvkIHdxbgo
 U8rUuPaTaxtgPh6Yn4mtRlK8T0gpunut+xqqjK/fC2qwXvZAsC5ba8EV5c3KK7/OeC2O
 Ln8uYgTB4bUTiRFhwBRra74oV99d3RYWRgRBircDYAKo6bGKp0TFa/TKI2wXmyZhDrJB
 2asQObdqy9n3DLZM3vNVDltuGf8pdTosGzGaru7RJHGyUgNlb794i++n5YYKrXUzmW4Z
 O8uQ==
X-Gm-Message-State: AC+VfDygxj0DlrY3OB6uWJUXSVLOe0is+euZP6tmfyLLFTw57tGZQame
 vQqMbWn/7jXey4B1BVix1qmRBg==
X-Google-Smtp-Source: ACHHUZ7PaX5m9mu4aBEn/ZGkNHDbeD9hs3mRnmZkxYtMpgdkF5W4cYVVc8LnNVzVgcV1RpWdsNAWQg==
X-Received: by 2002:a17:907:d12:b0:973:940e:a018 with SMTP id
 gn18-20020a1709070d1200b00973940ea018mr1290288ejc.34.1686035691061; 
 Tue, 06 Jun 2023 00:14:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7cc16000000b005153b12c9f7sm4856912edt.32.2023.06.06.00.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 00:14:50 -0700 (PDT)
Message-ID: <4bb22e77-b3f0-be07-5e8a-442c3aa3fd48@linaro.org>
Date: Tue, 6 Jun 2023 09:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/3] drm/panel-fannal-c3003: Add fannal c3004 DSI panel
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20230605153539.497602-1-pavacic.p@gmail.com>
 <20230605153539.497602-4-pavacic.p@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605153539.497602-4-pavacic.p@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/06/2023 17:35, Paulo Pavacic wrote:
> Fannal C3004 is a 480x800 display made by fannal that requires
> DCS initialization sequences.
> 
> Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> ---

> v3 changelog:
>  - using generic mipi_dsi_dcs_write_seq

This is marked as v2?

>  - removed success prints
>  - removed some comments
>  - simplified code/removed support for different panels
>  - changed namespace from fann to fannal
> v2 changelog:
>  - renamed from panel-mipi-dsi-bringup
>  - only one MAINTAINER e-mail
> ---
>  MAINTAINERS     


> +static int fannal_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct fannal_panel_data *panel_data;
> +	int ret;
> +
> +	panel_data = devm_kzalloc(&dsi->dev, sizeof(*panel_data), GFP_KERNEL);
> +
> +	if (!panel_data)
> +		return -ENOMEM;
> +
> +	panel_data->reset = devm_gpiod_get_optional(
> +		dev, "reset", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);

dev should be in previous line

Why this is nonexclusive? How many instances of same driver are
expecting to get this on one system?

> +
> +	if (IS_ERR(panel_data->reset)) {
> +		ret = PTR_ERR(panel_data->reset);
> +		dev_err(dev,
> +			"error: probe: get reset GPIO: (%d) Check the fdt\n",
> +			ret);

return dev_err_probe

> +		return ret;
> +	}
> +
> +	mipi_dsi_set_drvdata(dsi, panel_data);
> +
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			  MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_HSE |
> +			  MIPI_DSI_MODE_NO_EOT_PACKET |
> +			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO;
> +	dsi->lanes = 2;
> +
> +	gpiod_set_value_cansleep(panel_data->reset, 1);

So you leave the panel in reset state?
> +
> +	drm_panel_init(&panel_data->panel, dev, &fannal_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	dev_set_drvdata(dev, panel_data);
> +
> +	drm_panel_add(&panel_data->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret) {
> +		drm_panel_remove(&panel_data->panel);
> +		dev_err(dev, "error: probe fail: can't attach mipi_dsi!\n");

No need to shout, skip exclamation mark.


Best regards,
Krzysztof


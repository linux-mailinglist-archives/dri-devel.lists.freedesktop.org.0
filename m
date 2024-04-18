Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0668AA59E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 01:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A310EF9B;
	Thu, 18 Apr 2024 23:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FTOW4DtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A1D10EF9B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 23:06:21 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5e152c757a5so826609a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 16:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713481581; x=1714086381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+eBAbd5WwPqI3LEdzv+bUfvrmzrEdDodkqWSBZ40boY=;
 b=FTOW4DtVlfMd1B0XyYy9Vscgkhu7jIaOgj9DIYrhiq67M8FeY4A+kLyEBqh2CFVL0i
 znEe2znt/GffH12wqZkYqsuEZKvzHHsxSKQbhYPWAy2H69do0K/jGDjiGzeBD5j+Rbr9
 Yrh2q/4Tdc7wR1QpmFsJ7+xLGUKwLKc3vJ1Vq3BHDaeDhXDHJe/GyqMDUGnoEfRcknRL
 7AY6tBlqlbkwOoljGeer7JyoGrPnSd1UHVuQJAtvXUakHsURQS6ji+jTlV7mlEYKfUx9
 tDi3kAjegPYZR14nnqirNzo03VIbeNxHfHJuKzw5J6v1GV+odXF4BnrszTAumWZuzKF6
 FLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713481581; x=1714086381;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eBAbd5WwPqI3LEdzv+bUfvrmzrEdDodkqWSBZ40boY=;
 b=Sb5xkkTM5EVLKXFo5ltXeaDx0nsupL5ItBZR6BhUAbkDNw5MlXtB88HY1+vuKRyETN
 hWgIbr1MEfBwXbQjjMjVEUQmM5xTwziRBYv/oQjqOY+uDzjES06ecNkx79AjoKcMtJRN
 yc//qrcWnWC1r3lXnaXSRVc2hNOFEsNHz4CcJexgGcQtJtehva/apaQLnfKusQzJjhjs
 cRn1i3lTnRHY+bwsdqm9qyOQn+GhaP7Ka4S/UmgikJXqxuhyR5EyQQhwFfRVLkSAiN4Y
 Oy/n0WGJLC+FG3N6xg/f+hLeBHv+rnjHCg4Viam33oSScswMCG5LbhjuE50D220uHJfA
 emGg==
X-Gm-Message-State: AOJu0Yy9y78QsFUjgrrezb6CKxKtTqNVV8LFLvn33QV6HZj+Auv6Bxiw
 sATy4I0XjCuCmze6TzdiRjqDM0LZVMqE5IEyFvSh0vtphTzAmflbRvxGKSSRI+c=
X-Google-Smtp-Source: AGHT+IHZov8Ta3j29EV4qG0fYa92F9QoQSdSDcWCBKZ2jeADxr5Zw/wAzlj+Ca9b8XiXLcf5T0rFYQ==
X-Received: by 2002:a17:90b:818:b0:2a4:f16f:f31f with SMTP id
 bk24-20020a17090b081800b002a4f16ff31fmr557256pjb.40.1713481580853; 
 Thu, 18 Apr 2024 16:06:20 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.146])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a17090a77c700b002a55d8a99d5sm3673136pjs.22.2024.04.18.16.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 16:06:20 -0700 (PDT)
Message-ID: <76b46467-6a27-4f07-8a3e-cdd51e2e28bb@linaro.org>
Date: Fri, 19 Apr 2024 01:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panel: panel-simple: Add generic panel-dsi driver
To: Johan Adolfsson <johan.adolfsson@axis.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@axis.com
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
 <20240418-foo-fix-v1-1-461bcc8f5976@axis.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240418-foo-fix-v1-1-461bcc8f5976@axis.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2024 16:01, Johan Adolfsson wrote:
> Add generic panel-dsi panel, similar to panel-dpi that can have it's
> timing, lanes and flags overridden by devicetree.
> Add some dev_err() and dev_warn() calls.
> 

...

>  		/* sentinel */
>  	}
> @@ -4992,17 +5051,28 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
>  		return -ENODEV;
>  
>  	err = panel_simple_probe(&dsi->dev, &desc->desc);
> +	if (err)
> +		dev_err(&dsi->dev, "%s: err %i\n", __func__, err);

This looks like debugging code.

> +
> +	if (desc == &panel_dsi) {
> +		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
> +		/* Handle the generic panel-dsi binding */
> +		err = panel_dsi_probe(&dsi->dev, panel);
> +	}
> +
>  	if (err < 0)
>  		return err;
>  
>  	dsi->mode_flags = desc->flags;
>  	dsi->format = desc->format;
>  	dsi->lanes = desc->lanes;
> +	of_property_read_u32(dsi->dev.of_node, "lanes", &dsi->lanes);

Is this defined in the binding?

>  
>  	err = mipi_dsi_attach(dsi);
>  	if (err) {
>  		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
>  
> +		dev_err(&dsi->dev, "probe attach err: %i", err);

Do not introduce unrelated code changes.

Best regards,
Krzysztof


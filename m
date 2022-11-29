Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5963BBD1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 09:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8C410E2EB;
	Tue, 29 Nov 2022 08:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFD410E2EB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 08:38:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 5so10296421wmo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 00:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XgU2Me36pWpv5WapeJ4LPJ3zFhHMt8NlKreZ17SiFYI=;
 b=eSdL13nPAAE9KfbRzj2fCIepGM6/yyMJRSpSbtV+qTcW929EIa4OABn8vS5yE4KwVN
 dhRF4IKu30cR5LMLlmnwFaoBLqN6SL02TGXbzQ2W5eSrWzlbUg6YlFcsxI9lNfHS/059
 DZ0ZaUVAH7k73aSGu7vA0WjbHCO04rV1d4G6qVx6TAu1tcGB1lDkzpb8Ie3s2i5OUilh
 H+NL5OQ7fZAfnVi55MvfEYE8R+DjKIxT//YNB2CU6jdZ8SAnvQ2mY4+OlXalRpVC3gKm
 xyOx2am5t9bgULDwET1sl91wGzsVBZ4U2AUWsm8RyNtTa+xfK1h0uQa6JROUKj9i6fjJ
 jhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XgU2Me36pWpv5WapeJ4LPJ3zFhHMt8NlKreZ17SiFYI=;
 b=5dZC3r67bBSUg3hJ9tAtZ7J3xgL/CD3i2fVtPyFU3bGxDyN8PJjHrSsJGkUSoPO7hM
 crgHPRyQduJIO5qZFq4STKNXOqF+6IuOmFNCvxxoyuCvLnKQvq0S2kGi9hG4/1Nx/GtE
 oLkOCCJzCqzav4cJVGL8eayOm7whl9d51HVJ0x8+GsgKeh3++2emaN9uRiOy5fQIpor3
 bs4lCwKheARc512ixlKvxkKLDmMhMLMt3xYAJtq7yzyUFWFP5bF6IYvpd+uT+uoXOAOr
 8ls5arHXCDB9cmEf1PSsitlcZp8JnKH8lppbmbpx42U4OM2BtSU1bKZlQIg7MzAQzYXL
 9PGg==
X-Gm-Message-State: ANoB5pmTVZsxDdty25+Ug7341dG31O8uqbopoVkoZ1Cn4m4Q0UNpnUNy
 J7x/w+wwfv6vTfJ8c+n+Y2T+YA==
X-Google-Smtp-Source: AA0mqf6OAhXAHg9j5+BXVKjL+Xc8gtMngAEKoiv4eF9a4BzThu69gyqxyX8YzEQPD1iPsmDy+DbTAg==
X-Received: by 2002:a7b:c00a:0:b0:3cf:e8f0:ad11 with SMTP id
 c10-20020a7bc00a000000b003cfe8f0ad11mr44668145wmb.65.1669711120927; 
 Tue, 29 Nov 2022 00:38:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2?
 ([2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d4587000000b0022ae0965a8asm12835842wrq.24.2022.11.29.00.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 00:38:40 -0800 (PST)
Message-ID: <fbe945cb-036f-b405-901f-0d625e8bfcbd@linaro.org>
Date: Tue, 29 Nov 2022 09:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/tiny: rpi-lcd-35: Enable driver module
 autoloading
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
 <20221116-s905x_spi_ili9486-v2-1-084c6e3cd930@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v2-1-084c6e3cd930@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/11/2022 10:42, Carlo Caione wrote:
> SPI devices use the spi_device_id for module autoloading even on
> systems using device tree.
> 
> Add the spi_device_id entry to enable autoloading for the 3.5inch RPi
> Display (rpi-lcd-35).
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   drivers/gpu/drm/tiny/ili9486.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index 1bb847466b10..bd37dfe8dd05 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -183,6 +183,7 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
>   
>   static const struct spi_device_id ili9486_id[] = {
>   	{ "ili9486", 0 },
> +	{ "rpi-lcd-35", 0 },

It should also contain "piscreen" then.

Anyway:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(spi, ili9486_id);
> 


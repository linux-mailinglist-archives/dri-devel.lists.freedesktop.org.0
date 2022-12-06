Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76A9643FFF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 10:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219D489A94;
	Tue,  6 Dec 2022 09:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBF389A94
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 09:41:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m4-20020a05600c3b0400b003d1cb516ce0so193665wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 01:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FxokdyaSTsdEUZeAO0dhrrdDTQh5fW0PAMkusaqbnNI=;
 b=hgKt/N5djRerT1RlOcMWnFpuJQ4bX2M6JA9wzFXO6HtaVliekexNJE17RJ88EUN4MZ
 UZg9sFwVIJoZfDmb70Y6nemKwx9p1fMrZV5ncdr3oqCWRxndOEuHEWbWgASwXIIVLK2t
 +SENYm0ShHRRBGfZ3bQ9AD38zn1H/nB4cWJJSRrlBDfKWLVMEmJ/3QOKGLf0+NnMB3UW
 uXr7RihODsoehrFECd7vfHFmevEritm/0bpC64hgwRM10Wn4C8Pd2Ab7WVvUdlwNQY0C
 YvNUV6RdF5gEXafU4GOCRKbDOr8V8g61KBmLFIP9u0yJxT/Bk7tMIdxidPvx66yYGFHX
 zQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FxokdyaSTsdEUZeAO0dhrrdDTQh5fW0PAMkusaqbnNI=;
 b=4mooPfO52YMAIvxjhAtVAaqIaWwt5+HV7DJJfA7s72CtcqJwfW7FjwPMN0/YMhoR92
 PV/hSbYmxtR/pJoDAAl927amVXI8bmvcw8Hrz745bQe044KKi0vsvu4NpxYGNb0Tzzck
 sFilfc7IAnhimuLnV2PSIOV6xwFMQtAIov2akeJk5a8u6N/zYgGzi9R5eKhDSyIUgs3V
 QXrXmvcczJfJWkYNbZFDppW2PNeWHzrZWZfmG00DzI/JpVPpJhhSLu7vakeW36WMPlIp
 cQKq++HzfrFld3BPs3q9EiriQhulQZX3MnhYBpNAAL5nvapTYvYUhsouG3sUK+6LLmf9
 +PpA==
X-Gm-Message-State: ANoB5pl2d8CqX1AkAuMiaYQomu+geJB922TYR2a6/hX1ylb6R69cJvGP
 nwU5tOuWaTB2en+rMRahyh3PCg==
X-Google-Smtp-Source: AA0mqf4shAeXN1wG69orKehuFKdhFboW8rWmjTs2IHUubgXM5BC17QT0CVMzYAocd2isflrozlyBYA==
X-Received: by 2002:a7b:c00f:0:b0:3cf:7066:cf53 with SMTP id
 c15-20020a7bc00f000000b003cf7066cf53mr49237478wmb.135.1670319674510; 
 Tue, 06 Dec 2022 01:41:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2d5b:61d6:a067:f8e9?
 ([2a01:e0a:982:cbb0:2d5b:61d6:a067:f8e9])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c1d0900b003cf878c4468sm27382120wms.5.2022.12.06.01.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 01:41:14 -0800 (PST)
Message-ID: <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
Date: Tue, 6 Dec 2022 10:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
 <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlo,

On 06/12/2022 09:34, Carlo Caione wrote:
> For platforms using simplefb / efifb, call
> drm_aperture_remove_framebuffers() to remove the conflicting
> framebuffer.

Conflicting framebuffer on the SPI display ? How is that possible ?

The meson_drm should already do this, no ?

Neil

> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   drivers/gpu/drm/tiny/ili9486.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
> index 14a9e6ad2d15..6fd4d42437fd 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -14,6 +14,7 @@
>   
>   #include <video/mipi_display.h>
>   
> +#include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fb_helper.h>
> @@ -238,6 +239,10 @@ static int ili9486_probe(struct spi_device *spi)
>   	if (ret)
>   		return ret;
>   
> +	ret = drm_aperture_remove_framebuffers(false, &ili9486_driver);
> +	if (ret)
> +		return ret;
> +
>   	drm_mode_config_reset(drm);
>   
>   	ret = drm_dev_register(drm, 0);
> 


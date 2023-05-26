Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CA6712497
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1513F10E7DB;
	Fri, 26 May 2023 10:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A70310E7DB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:27:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4e01fso6438985e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685096831; x=1687688831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YfIXJEMjywgbIaPnMejEqfeJlu29DLDhW+hRk8nBYC4=;
 b=WYZCFJVExeDVYp9MYxoWE58L9LDV10iEHG8v3I8k6jtl930DQwLlq7iZSV6CDtyHdD
 eQoA0t0VfzgWmxBKmXy9SX16Av1QD2N1bSTTCZMqaT6Uz+v+r+FTQhPURpRiSNdKsqiM
 IASMSZDBvGoLIsMDJwg8dCLsh0SulVWbLVni8bJ9S+dCOynjfEyvMiJsxO71uR3xHc/a
 eTz3FbvivrNbYU5oIziujcPbzvWnkd3RhLyVmuYOQLaORhPbmWOBaDpx4D+FxU5p+ig/
 SH0lnSMs+moJ7aH0ytEW+b6cRz2w4Vd5laCpLD9Fq1GFfIhGXa77qlBaKmEmxXmoWEcV
 BMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685096831; x=1687688831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YfIXJEMjywgbIaPnMejEqfeJlu29DLDhW+hRk8nBYC4=;
 b=AUFGvAOPCYLkkQpzhZMZZD0vT0WC/KPacKN1ElKBGtylrnjjYL/8Gjrprofqs74cv7
 Jw3lhJsoVvwYqqCYAWgIzzD4fbT5yaQrbRyDleemA03O+kqEZJeTqWU4rZEeuTX7Xs3f
 SJMWKOxR3Ow2s24PSpFc0a/6TgbpRZw25TXrQKldfl741RfJt1UISpXemdD2QUzoMhQK
 WGjXRUvAXRTtZxuLlLGgq3OPf8gZ1w3GANQ2eS4RBeoy27nO8Y0u/QA+oRCRzSdzauMT
 KR48hzLhtiNXaTKUYluXFWm05+UoNYUa7iiM/k6nGqTXfnogvGM20ZQyNAh07yiEe/Ge
 1y/w==
X-Gm-Message-State: AC+VfDw8u83Jc0ZMoEyHIjq7jl1DktqLs99vlNZdW+liPcrlRPJ3g5rP
 jimal5Yy0NuCNlS8zASBx5Pttg==
X-Google-Smtp-Source: ACHHUZ6IzvKAf5IPmjt8K9b1nutegl78hAyGPJdoaYhRnE2oMuBVUeelQwu3T/SDLVPuKWVVJeKIcQ==
X-Received: by 2002:a05:600c:2042:b0:3f4:2e13:ccdc with SMTP id
 p2-20020a05600c204200b003f42e13ccdcmr1326649wmg.0.1685096831092; 
 Fri, 26 May 2023 03:27:11 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a1c7916000000b003f607875e5csm8452340wme.24.2023.05.26.03.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 03:27:10 -0700 (PDT)
Date: Fri, 26 May 2023 11:27:08 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH 1/2] backlight: gpio_backlight: add new property
 default-brightness-level
Message-ID: <20230526102708.GC626291@aspen.lan>
References: <20230519200520.10657-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519200520.10657-1-alex@shruggie.ro>
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Philippe CORNU <philippe.cornu@foss.st.com>, pavel@ucw.cz,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 11:05:19PM +0300, Alexandru Ardelean wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
>
> Add new property to set a brightness by default at probe.
>
> Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>

Patch order should be reversed for v2. Nevertheless:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
>  	int ret, init_brightness, def_value;
> +	u32 value;
>
>  	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
> @@ -93,7 +94,11 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	else
>  		bl->props.power = FB_BLANK_UNBLANK;
>
> -	bl->props.brightness = 1;
> +	ret = device_property_read_u32(dev, "default-brightness-level", &value);
> +	if (!ret && value <= props.max_brightness)
> +		bl->props.brightness = value;
> +	else
> +		bl->props.brightness = 1;
>
>  	init_brightness = backlight_get_brightness(bl);
>  	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
> --
> 2.40.1
>

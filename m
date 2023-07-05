Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFFB7485AC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 16:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A58E10E368;
	Wed,  5 Jul 2023 14:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300CC10E368
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 14:09:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbc77e769cso65592495e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688566185; x=1691158185;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Izz7ihe7+cPV8NfKfF0xuM/ZXdOZCR9uthmt7NZp1VA=;
 b=mTtlv8+nZvnL92HQWPsRJTB05DIhfhfELlpD2EDBYSb0MJ8tI/emN1nJKIUPn3cuRS
 YCejqc3xaIyC0bMfc+RPkAP2wAlvY1omsda8SNPbTMqUJto5GlROzx9GU2KHf6uT0sJx
 ILeRngMRHIlGAh9kx6durc/VMQ2hVoXyh9PnW2Olx3kSw3tn8fX7+zGo3oglw4+yvpgo
 Sw4tPXRd5TkSQhYBM9RUnONf1+OYgBAmRSzTpxh5IVdUpLlRXYfp+mlXYYijT0S62nNg
 SJ0BhOq4+vhv+xrdM/EOI/BcLpGDy9Zzzf5SYHOJan1XUkm2/NrfbmyYT0oNVX6k2nan
 9Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688566185; x=1691158185;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Izz7ihe7+cPV8NfKfF0xuM/ZXdOZCR9uthmt7NZp1VA=;
 b=RyXsIesDz0vhSbnUJ6M+GBaeltg7mH/xlg+fPFhCOKlrISY0BorZa1Ox/7nBMTBQvW
 eoAgf5/F+QRQGb/hBpxAe2Uq5nvAVd7Zj48ESM9CzjKQHe1P5N6+QqLnmN0bpiK75s7o
 6UqXwNEACFJiu2O0muJPmqshuEzKxvWfWeK5U4PXqsV8oDO1WL6sNDej78ZxNUqrbKOM
 DVfk1D2piYohXUlFD/L/7q9WeDl4y24MgQi+Avo7mzUBNLLoLdnOsThOnukjII52JQZg
 WOD1MvufcZ6g9dt17OpYFfBroTKoWUinzbW8JbcI5Ys+harerOjUGJIAISHZ8tu0H3yF
 l50w==
X-Gm-Message-State: AC+VfDwa5QvxJbMaqH21fyAOSXH0X0yyUiG4WbLrS9Z+oT9Y7/Ss0f3j
 xfyEFI/BFFR+2E+4YiTePbATfA==
X-Google-Smtp-Source: ACHHUZ6IS2TiOtorETud8FSgZjhyqs6fHCpyhU040q30QB6W7Fho8aNZcui+S/8puhB0PsO+VzM0wQ==
X-Received: by 2002:a1c:7412:0:b0:3fa:98c3:7db6 with SMTP id
 p18-20020a1c7412000000b003fa98c37db6mr14857204wmc.38.1688566185061; 
 Wed, 05 Jul 2023 07:09:45 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a1c7217000000b003fae92e7a8dsm2244468wmc.27.2023.07.05.07.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 07:09:44 -0700 (PDT)
Date: Wed, 5 Jul 2023 15:09:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mans Rullgard <mans@mansr.com>
Subject: Re: [PATCH v2] backlight: led_bl: fix initial power state
Message-ID: <20230705140943.GC6265@aspen.lan>
References: <20230704163013.21097-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704163013.21097-1-mans@mansr.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 05:19:52PM +0100, Mans Rullgard wrote:
> The condition for the initial power state based on the default
> brightness value is reversed.  Fix it.
>
> Furthermore, use the actual state of the LEDs rather than the default
> brightness specified in the devicetree as the latter should not cause
> the backlight to be automatically turned on.
>
> If the backlight device is not linked to any display, set the initial
> power to on unconditionally.
>
> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
> Changes in v2:
> - Use the reported LED state to set initial power state
> - Always power on if no phandle in DT
> ---
>  drivers/video/backlight/led_bl.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 3259292fda76..bbf1673b1fb0 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -176,6 +176,7 @@ static int led_bl_probe(struct platform_device *pdev)
>  {
>  	struct backlight_properties props;
>  	struct led_bl_data *priv;
> +	int init_brightness;
>  	int ret, i;
>
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -190,6 +191,8 @@ static int led_bl_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> +	init_brightness = priv->default_brightness;
> +
>  	ret = led_bl_parse_levels(&pdev->dev, priv);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to parse DT data\n");
> @@ -200,8 +203,8 @@ static int led_bl_probe(struct platform_device *pdev)
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = priv->max_brightness;
>  	props.brightness = priv->default_brightness;
> -	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
> -		      FB_BLANK_UNBLANK;
> +	props.power = (init_brightness || !pdev->dev.of_node->phandle) ?
> +		FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;

I was rather expecting to see a comment in the code here... it's super
hard to figure out the purpose of the phandle check otherwise.


Daniel.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD26F68BBC0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 12:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B07510E389;
	Mon,  6 Feb 2023 11:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C4810E389
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 11:35:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o36so8443076wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pR8VY8MEaUw8uT3n7EK5kFq1p/76o+VV6eFTe4dXliU=;
 b=YJDQNV6/1J1q36ybp2G2ZKvs1dYPlTrqYzKO5Be1jCumUHzKAKcyozOg2lqBZOwjz2
 jIJCjKYnRDQ3IVAJ3fei9R4i1PIHUp5QXrZA8k0OrPo1D8Da445vzUbhu3XyQj7e/rlr
 I1T6M9Fkyp+g1rQK90eWCwcmHvmfY8OLcAvgpCHnXGTMUEKdTY1k4/OtVLZrIEh/lydG
 UTZ4xXB6PUy1Xjsliri3Iyem1Dp+5Z0YtKyxpNdFIl7Q4iFOpkogA/1AS70FrUZxtc6L
 ko71QhPlsvuCB93OxY+yso8p+yFtiNJidbQIDBI3bDmpbTRkmSlAgigdUPckAYky7klt
 WxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pR8VY8MEaUw8uT3n7EK5kFq1p/76o+VV6eFTe4dXliU=;
 b=TE7gEMasNdVELPHE9f5ym9qNn8Hlh9JK3LLeF5PKp499RqCu0FgvGlaM6NBz20Z3de
 dc+A02Js5lgoFMBSRxPA6C7FbkvWBCs0QttlyZKRYs9nTjEr9XM0jrm3oKwHp4Rcjlvb
 9KHaKjgJJlVOmAQ0BJBFdPvM8ScD3EllR0VeayK7Rj+075KW4+QdHKbURHAM0tYyThzP
 0X91b6EuXnCFca2urrA4ehjWNj3/citpUZBk3FxtxUg4iEYLODtmvOeNxKRYTjW/RTL4
 4YyzPn23EH5o5lBeB4SMnP/FmpFFcKekcvsOX5Hf3GIAKBnfNEoCkskt5ZHEgz3GHcak
 xdiA==
X-Gm-Message-State: AO0yUKV803Ij3pFb+n2/8Rq457mUNVnyygW2wFyfZOltncS0ZLMn5s/4
 Qu7l+QCOZQQAaK5K/q22ethpDw==
X-Google-Smtp-Source: AK7set/xN77otnGQhZNbFbdcG8zsWM3YHu8lPSRThnKghUb3pLW4WPhKlBSWyxklGkVCuojuTBpHJQ==
X-Received: by 2002:a05:600c:4a9b:b0:3de:1d31:1043 with SMTP id
 b27-20020a05600c4a9b00b003de1d311043mr18725422wmp.21.1675683334991; 
 Mon, 06 Feb 2023 03:35:34 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 d5-20020a1c7305000000b003dcc82ce53fsm1068040wmb.38.2023.02.06.03.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 03:35:34 -0800 (PST)
Date: Mon, 6 Feb 2023 11:35:32 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/2] backlight: hx8357: switch to using gpiod API
Message-ID: <Y+DmBGiq9kvRBHLY@aspen.lan>
References: <20230131225707.3599889-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131225707.3599889-1-dmitry.torokhov@gmail.com>
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

On Tue, Jan 31, 2023 at 02:57:06PM -0800, Dmitry Torokhov wrote:
> Switch the driver from legacy gpio API that is deprecated to the newer
> gpiod API that respects line polarities described in ACPI/DT.
>
> This makes driver use standard property name for the reset gpio
> ("reset-gpios" vs "gpios-reset"), however there is a quirk in gpiolib
> to also recognize the legacy name and keep compatibility with older
> DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> All preparation gpiolib work to handle legacy names and polarity quirks
> has landed in mainline...
>
>  drivers/video/backlight/hx8357.c | 82 ++++++++++++++------------------
>  1 file changed, 37 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
> index 9b50bc96e00f..a93e14adb846 100644
> --- a/drivers/video/backlight/hx8357.c
> +++ b/drivers/video/backlight/hx8357.c
> [snip]
> -	if (of_find_property(spi->dev.of_node, "im-gpios", NULL)) {
> -		lcd->use_im_pins = 1;
> -
> -		for (i = 0; i < HX8357_NUM_IM_PINS; i++) {
> -			lcd->im_pins[i] = of_get_named_gpio(spi->dev.of_node,
> -							    "im-gpios", i);
> -			if (lcd->im_pins[i] == -EPROBE_DEFER) {
> -				dev_info(&spi->dev, "GPIO requested is not here yet, deferring the probe\n");
> -				return -EPROBE_DEFER;
> -			}
> -			if (!gpio_is_valid(lcd->im_pins[i])) {
> -				dev_err(&spi->dev, "Missing dt property: im-gpios\n");
> -				return -EINVAL;
> +	gpiod_set_consumer_name(lcd->reset, "hx8357-reset");
> +
> +	for (i = 0; i < HX8357_NUM_IM_PINS; i++) {
> +		lcd->im_pins[i] = devm_gpiod_get_index(&spi->dev,
> +						       "im", i, GPIOD_OUT_LOW);
> +		ret = PTR_ERR_OR_ZERO(lcd->im_pins[i]);
> +		if (ret) {
> +			if (ret == -ENOENT) {
> +				if (i == 0)
> +					break;
> +				dev_err(&spi->dev, "Missing im gpios[%d]\n", i);
> +				ret = -EINVAL;
> +			} if (ret == -EPROBE_DEFER) {
> +				dev_info(&spi->dev, "im gpio[%d] is not here yet, deferring the probe\n",
> +					 i);
> +			} else {
> +				dev_err(&spi->dev, "failed to request im gpio[%d]: %d\n",
> +					i, ret);
>  			}

These last two clauses should be updated to return dev_err_probe(...)
instead.

With that change:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

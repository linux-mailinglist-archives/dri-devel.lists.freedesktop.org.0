Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8643C671B7A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 13:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBA310E6B5;
	Wed, 18 Jan 2023 12:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E6510E6B5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 12:08:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1347474wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 04:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/lWnIGJEQm1L3ptN3FXqu2iW3lASN9DCnEylfKeYnQ4=;
 b=FRzSnjslV4xlcVe1pe7U45KyYjXv1nfanzhJOKczfcXVpqhUIcP9JW/j/L3Au1avfV
 LghMbLQVe8p4/Znifbi6M4LLE+BgU8UDPFcPr5Cs9ran4JHBhLSyv8mg8JNiOXptryiS
 2PhulpWUOCbFeLYWoW10RJE+P5oC0mIwldPxqXVBwY+2qEHussVYB2U+xxvgmIS+5p+o
 MahPgKOF1tV/GV4i0Kv/z/nWhnAe48+C2GXpPRiuDeoEggXoeA2KeKsjO6C4rmPHtBDd
 v1wb4ZCkg8/FisQ5C5P/+u18mX7ntFZuHTdlak7ZB4x75P8c8WP8SWO8m/h3Vslt4nkP
 ZusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/lWnIGJEQm1L3ptN3FXqu2iW3lASN9DCnEylfKeYnQ4=;
 b=4JhqAtPuTs4sjpDMsfKIjXcYlnU20dvoEV30tVUEZoZfOLPT+P+oH101tHvr0XJNx8
 D4VxqJs8WP261Mwft8HCWNn4eeYGuKw3Q3bq1qW/TwXtJy4oyLV7f3uXwjcpLyzL43H3
 mOVWidSWYe6aB8Zx5Pdf9QOKZn+yx0qDbAeEyBLJcDzjic/e+xnaCFU8+YEP6UqsXIdV
 JahmfSSl7crMExFWv6ZJR/xCkuSOO5WvUX/KNU3/VIFTPLxG8F3ZY/iUgsqFQjJ7n8cr
 mPxU+OQv2A6nuBSm8WeS2IqysVaRKbrxIMEWgg5sKY+HEcreiX0lgFfDGx7lfOjMwOSO
 tigg==
X-Gm-Message-State: AFqh2krKprGWxHsF92G9+fnZyFzDTKrktDDlHo94XX0myKmZlxG8HhXN
 6sFBKjHsX8x9knjDwzjE8XvatA==
X-Google-Smtp-Source: AMrXdXs7sLoKG9/pVLisKy5De0WkDtXJRH03vKLmjmas+ZV49OQvrV9E5k79fnsPc242Wowp5o4tpg==
X-Received: by 2002:a05:600c:5386:b0:3da:f670:a199 with SMTP id
 hg6-20020a05600c538600b003daf670a199mr6493504wmb.36.1674043684637; 
 Wed, 18 Jan 2023 04:08:04 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 k7-20020adfd227000000b002bdf3809f59sm10626937wrh.38.2023.01.18.04.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:08:03 -0800 (PST)
Date: Wed, 18 Jan 2023 12:08:01 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH v5 2/2] backlight: ktz8866: Add support for Kinetic
 KTZ8866 backlight
Message-ID: <Y8fhIVRbgEok29t1@aspen.lan>
References: <20230117154408.1882-1-lujianhua000@gmail.com>
 <20230117154408.1882-2-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117154408.1882-2-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 11:44:08PM +0800, Jianhua Lu wrote:
> Add support for Kinetic KTZ8866 backlight, which is used in
> Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
> downstream implementation [1].
> [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Add missing staitc modifier to ktz8866_write function.
>
> Changes in v3:
>   - Add 2022 to Copyright line.
>   - Sort headers.
>   - Remove meaningless comment.
>   - Use definitions instead of hardcoding.
>   - Add missing maintainer info.
>
> Changes in v4:
>   - Change 2022 to 2023.
>   - Remove useless macro and enum.
>   - Describe settings by devicetree.
>   - Move header file to C file.
> Changes in v5:
>   - Change "2023" to "2022, 2023" in Copyright line.
>   - Set scale property for backlight.
>
>  MAINTAINERS                       |   6 +
>  drivers/video/backlight/Kconfig   |   8 ++
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/ktz8866.c | 201 ++++++++++++++++++++++++++++++
>  4 files changed, 216 insertions(+)
>  create mode 100644 drivers/video/backlight/ktz8866.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42fc47c6edfd..2084e74e1b58 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11674,6 +11674,12 @@ M:	John Hawley <warthog9@eaglescrag.net>
>  S:	Maintained
>  F:	tools/testing/ktest
>
> +KTZ8866 BACKLIGHT DRIVER
> +M:	Jianhua Lu <lujianhua000@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
> +F:	drivers/video/backlight/ktz8866.c
> +
>  L3MDEV
>  M:	David Ahern <dsahern@kernel.org>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 936ba1e4d35e..2845fd7e33ad 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -190,6 +190,14 @@ config BACKLIGHT_KTD253
>  	  which is a 1-wire GPIO-controlled backlight found in some mobile
>  	  phones.
>
> +config BACKLIGHT_KTZ8866
> +	tristate "Backlight Driver for Kinetic KTZ8866"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +		Say Y to enabled the backlight driver for the Kinetic KTZ8866
> +		found in Xiaomi Mi Pad 5 series.

s/enabled/enable/ (and sorry for spotting this one so late)


> +++ b/drivers/video/backlight/ktz8866.c
> @@ -0,0 +1,201 @@
> [...]
> +static void ktz8866_init(struct ktz8866 *ktz)
> +{
> +	unsigned int val;
> +
> +	if(of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
> +		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
> +	else
> +		/* Enable all 6 current sinks if the number of current sinks isn't specifed. */
> +		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
> +
> +	if(of_property_read_u32(ktz->client->dev.of_node, "current-ramping-time-us", &val)) {
> +		if(val <= 128) {
> +			ktz8866_write(ktz, BL_CFG2, BIT(7) | (ilog2(val) << 3) | PWM_HYST);
> +		} else {
> +			ktz8866_write(ktz, BL_CFG2, BIT(7) | ((5 + val / 64) << 3) | PWM_HYST);
> +		}

This code is interpreting current-ramping-time-us as milliseconds rather
than microseconds!

I know I used microseconds in the example I proposed in the feedback for
v4 DT bindings but "something like" means I am merely providing an
example (mostly I was intending to show that the units should be
included both in the property name *and* description).

It is up to you whether you fix the mismatch by changing the DT bindings
document to current-ramping-time-ms or change this code to accept
values in microseconds.


> +	}
> +
> +	if(of_property_read_u32(ktz->client->dev.of_node, "led-ramping-time-us", &val)) {
> +		unsigned int ramp_off_time = ilog2(val) + 1;
> +		unsigned int ramp_on_time = ramp_off_time << 4;
> +		ktz8866_write(ktz, BL_DIMMING, ramp_on_time | ramp_off_time);
> +	}

Similarly, this code has not adopted the units specified in the
bindings documentation.

In this case 0 would map to 512us so if you decided to use milliseconds
you will need to add comment in the description saying that 0 will map
to 512us because the hardware cannot ramp faster than this!


Daniel.

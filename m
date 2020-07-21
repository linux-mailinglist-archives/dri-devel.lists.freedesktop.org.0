Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AEC227ED7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 13:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ADC6E115;
	Tue, 21 Jul 2020 11:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4931A89E2A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 11:28:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f18so2503402wml.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 04:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4TOLW2imB3rsMZepinPh8jkYmxmq6wzr9xbAWaAB63E=;
 b=zxA+ofaVwdl1bgNC13zN9ubxqHC9ewBBFt+NnKG2h8XDElraUcs8hoO7/q7zF2Yg34
 QmQ8jfkqyfb2Bkbbu9KNvYZpTSBzFtcg2JwlKSHR60ZRl9bUVELDmjyBfasdmAhQdXgq
 PE6MvfWaYT3PJv46TQIXdtpbH44y7um8SFGrXcNMYM16TDfD/rgKWEZyiV+mNTPsJKgK
 0qp/LLknorODSNsIgwkyLxHgbqETiKwOfAzWazzQv+cAbP7yNKacslNMXFNbwdqwTDm+
 xmP3Q05/LOa1PZrMl1I1tFxtlneod5QopL6jJhffKklyh2wBHqyecIgrZbv5XaITUF/L
 9NEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4TOLW2imB3rsMZepinPh8jkYmxmq6wzr9xbAWaAB63E=;
 b=pNwKyaujtSX9A2bX2UpGr/0fnhoZZVRP+lCvLrNwwOFb2oGtvHptDs6MRV2hQak9Av
 /Fy2RaGA2WZNqAqcOasJHlUeV23A3XeUUlZUgswGWCU03d7h/l7MPEWQm6CJmoUa426G
 T2L/kr/Crs0rEpGlNAAu9yuV+kavPIjb3qke97w/nyrpJL2mQNTSDVw/WpWJZwV48Sky
 9WbgENuAb+LEu2nU7K5Z/VKkQKSdqJsmhilno7yLfERQwqVlD4ZhqqkM0PyZ6NW4kKaj
 iajVFRMBCQViiM0Od1NVFC8+IJFqHaahOFIOK2H4aQHdM8qDRhYQciCAN/OSMJwbF8Uz
 vLew==
X-Gm-Message-State: AOAM5315qalQAEIaPChgdq7ATX3dj7zvDPX/dwmP/oGiZ+rYbygkJhbe
 bKRZoqLwMSSeFSiO4+I2JX6UlQ==
X-Google-Smtp-Source: ABdhPJxD0h2M/2DjFqCYE+/h1ypZKlgo6FcZAnC0ULNYW3repPMTnleiqfIwBksS16IjOuUgYaKaGQ==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr3482710wmc.44.1595330923806; 
 Tue, 21 Jul 2020 04:28:43 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 22sm3336707wmb.11.2020.07.21.04.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 04:28:43 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:28:41 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
Message-ID: <20200721112841.jxocq26yxhwy3gag@holly.lan>
References: <20200720203506.3883129-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720203506.3883129-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 10:35:05PM +0200, Linus Walleij wrote:
> This adds device tree bindings for the Kinetic KTD253
> white LED backlight driver.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../leds/backlight/kinetic,ktd253.yaml        | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> new file mode 100644
> index 000000000000..610bf9a0e270
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kinetic Technologies KTD253 one-wire backlight
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The Kinetic Technologies KTD253 is a white LED backlight that is
> +  controlled by a single GPIO line. If you just turn on the backlight
> +  it goes to maximum backlight then you can set the level of backlight
> +  using pulses on the enable wire.
> +
> +properties:
> +  compatible:
> +    const: kinetic,ktd253
> +
> +  gpios:
> +    description: GPIO to use to enable/disable and dim the backlight.
> +    maxItems: 1
> +
> +  default-brightness:
> +    description: Default brightness level on boot. 0 is off.
> +    minimum: 0
> +    maximum: 255
> +
> +  max-brightness:
> +    description: Maximum brightness that is allowed during runtime.
> +    minimum: 0
> +    maximum: 255

[I ended up dropping this into this thread... but it applies to both
patches]

I'm a bit sceptical of having a max-brightness in the DT and a driver
defined lookup table in the driver itself. That doesn't make a whole lot
of sense to me since the maximum brightness here is basically relies on
knowing what scale the Linux driver has opted to implement in its tables.

I think there are two options here.

1. Throw away the brightness table in the driver and expose the hardware
   steps directly (maybe using allowing properties such as
   max-brightness = 24 if the top 8 values cannot be distinguished
   visually).

2. Implement a brightness table in the DT if there really is a need
   to linearize the feel of the slider. In that case max-brightness
   can be inferred from the maximum value in the table.

Note that #2 is absolutely *not* the same as the tables in pwm_bl.c
(which are used to map a very wide linear scale on the hardware into a
smaller logarithmic interface for software to use). For this driver
the driver's lookup table is used to present an oversized
scale to software and quantizing it in the driver (using variably sized
quantums) to create a hardware value.

This can be useful if the hardware's perceptual response feels *really*
lumpy but often results in sliders with dead zones (because they do not
"snap" to the hardware intervals). Looking at the gaps in the driver I'm
suspect the table is not worth the effort (the difference in the deltas
is pretty modest) but I'm happy to contradicted by someone with access
to the hardware!


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87747AED89
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 15:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B8210E3E0;
	Tue, 26 Sep 2023 13:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0D710E3E1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 13:01:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4053c6f1087so78660125e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695733277; x=1696338077; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MS7T5qNcaaAtsXyLYljAh+1Xxln9bcBRkmzw4oED08Y=;
 b=ZoQaDGl81uLXtq5Vht7SLnC0nP05X8aRuWv/SkvCqnLwKx6MLDCo4kxH8Nn0ZBcjvB
 TtP3IIdl018V+zwYceX9ldfOspr4RVkYdDR+reAmsfyCb7Vd5mpdsWjgY3qVIk+K1/id
 k3ZXF9xdtssxW/IOQNcWrCWtKF+dGtYeEscaco6aPs8HCntmxT5xJaKpVFVIZHF+p7vK
 /vX57ROhRIB4mPE2c/ubVzw+i3nHzVyVtCxFVNFxQGxagzc+n/n5jfNogXxfs1D7o3nw
 kU8a76QHHiCtu8n+GXo4aE7puAUeJ91hCg6SYU9Cf59d+NrYK5YzsBy27nvsYKOIrxTD
 nIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695733277; x=1696338077;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MS7T5qNcaaAtsXyLYljAh+1Xxln9bcBRkmzw4oED08Y=;
 b=vbqQz4PCI9eW30cZ2+mKUJZW5Iphj3WVtdBux/gpROif915sT7D/r4ZhZKAoMoIMKk
 OF6WX70rq6H9UEUayS+ahsqhuzVkwoN9qklenJd2ydsVomVlqj83Q2PoryBEZ9LXaST5
 HF1emZGenUrJn596R4K43fA3ZSCeyVYeGzYi0B2RJVloCGR6edMysLgoHLH+zgxbe0Lw
 suC4Alv8l8P8E28v/cCUkJEDlXLaRplssQk2Uym12SJi2ziqWI5JSKx+ey9OhK0zaqbE
 fJt+efapMQOPWUwej0KhH/38AkPbqqFKdG7rmmQWQ7+vI3jAs51R61FbkckbaWHNjCeD
 Ik7Q==
X-Gm-Message-State: AOJu0YxicjtmiSVggYqbR0LQdpF2fzRjlZB7+o7PTusnQIhheGdzRnZO
 zTmuctIO0PyPH1tWfTsnkWPDjw==
X-Google-Smtp-Source: AGHT+IHQuRtjXPocWtmNLqUsEHc9Fm36NC/aEQcNjyXW9d+4nNeVH9BfrSCCtcERycCPCpPfFQ8z1Q==
X-Received: by 2002:a05:600c:3658:b0:3f6:9634:c8d6 with SMTP id
 y24-20020a05600c365800b003f69634c8d6mr8513184wmq.18.1695733276393; 
 Tue, 26 Sep 2023 06:01:16 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 e9-20020adfe7c9000000b003197efd1e7bsm693730wrn.114.2023.09.26.06.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 06:01:15 -0700 (PDT)
Date: Tue, 26 Sep 2023 14:01:13 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Message-ID: <20230926130113.GB4356@aspen.lan>
References: <20230925122609.78849-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925122609.78849-1-f.suligoi@asem.it>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 02:26:08PM +0200, Flavio Suligoi wrote:
> The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
> programmable switching frequency to optimize efficiency.
> The brightness can be controlled either by I2C commands (called "analog"
> mode) or by a PWM input signal (PWM mode).
> This driver supports both modes.
>
> For device driver details, please refer to:
> - drivers/video/backlight/mp3309c_bl.c
>
> The datasheet is available at:
> - https://www.monolithicpower.com/en/mp3309c.html
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>
> v3:
>  - add default value for mps,overvoltage-protection-microvolt property
>  - fix the example, changing from "mps,mp3309c-backlight" to "mps,mp3309c" in
>    compatible property
> v2:
>  - remove useless properties (dimming-mode, pinctrl-names, pinctrl-0,
>    switch-on-delay-ms, switch-off-delay-ms, reset-gpios, reset-on-delay-ms,
>    reset-on-length-ms)
>  - add common.yaml#
>  - remove already included properties (default-brightness, max-brightness)
>  - substitute three boolean properties, used for the overvoltage-protection
>    values, with a single enum property
>  - remove some conditional definitions
>  - remove the 2nd example
> v1:
>  - first version
>
>  .../bindings/leds/backlight/mps,mp3309c.yaml  | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> new file mode 100644
> index 000000000000..4191e33626f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/mps,mp3309c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MPS MP3309C backlight
> +
> +maintainers:
> +  - Flavio Suligoi <f.suligoi@asem.it>
> +
> +description: |
> +  The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
> +  programmable switching frequency to optimize efficiency.
> +  It supports two different dimming modes:
> +
> +  - analog mode, via I2C commands (default)
> +  - PWM controlled mode.
> +
> +  The datasheet is available at:
> +  https://www.monolithicpower.com/en/mp3309c.html
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: mps,mp3309c
> +
> +  reg:
> +    maxItems: 1
> +
> +  pwms:
> +    description: if present, the backlight is controlled in PWM mode.
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: GPIO used to enable the backlight in "analog-i2c" dimming mode.
> +    maxItems: 1
> +
> +  mps,overvoltage-protection-microvolt:
> +    description: Overvoltage protection (13.5V, 24V or 35.5V).
> +    enum: [ 13500000, 24000000, 35500000 ]
> +    default: 35500000
> +
> +  mps,no-sync-mode:
> +    description: disable synchronous rectification mode
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - max-brightness

Why is this mandatory?

There's no point in setting max-brightness when running in I2C mode
(max-brightness should default to 31 in that case).


> +  - default-brightness

Again. I'm not clear why this needs to be mandatory.


Daniel.

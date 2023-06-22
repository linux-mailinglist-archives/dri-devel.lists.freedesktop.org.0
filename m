Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98A739551
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 04:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7CB10E0EE;
	Thu, 22 Jun 2023 02:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D209B10E0EE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 02:13:06 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3422d37d316so20569725ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 19:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687399986; x=1689991986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j95uarGP35hPSWnjSMr+fwYBKOEPZAg+794kgrinkk4=;
 b=igQxnsSLArZGXNecW9uut00eLkZB9pXjP/A5rElDxXR2mGvbdydlcU6o4sF9dyjELb
 vzUZtlH8wrr/N5glCWA+fjrzLYR7f7Qitty7pcsBXs/doKdEmRhR9LNy9XEKOMDLHLL7
 OnOFSzrbV/9anSAKq6LXQ+rxT5I2ak6PKmLFQn3QOg+BJwUtAmYrSKHwxB6pRpNsIuJ+
 5QcQrEh1nh59fJy22Z/am7GDVgYcDF9uGDPiJctBgWSspgSF5nAFmloV67OtQNdc/uSw
 PJleFjwlZJWKg8UKLaJ0MyG87p71ZkJOjhBtQzHXaS4qpHarP8KXVzP55xq52XlT+OlR
 rh5A==
X-Gm-Message-State: AC+VfDyHplUDAEcrtGChFfaUE457CGuBl4vuIzGjLuquaBP/s1aGTk0R
 FrEp8+pfV1EIxCst0fiYqw==
X-Google-Smtp-Source: ACHHUZ60xJYjxvtQhBhgAxqfQ0q0sG6xeGQalleS7tfQti6tA1HN+oiqOyA3+97Ja+MFSuyE+l3jBA==
X-Received: by 2002:a92:cac8:0:b0:340:c382:f6bb with SMTP id
 m8-20020a92cac8000000b00340c382f6bbmr12037373ilq.26.1687399985736; 
 Wed, 21 Jun 2023 19:13:05 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a92d90b000000b00333b5ae4ab7sm1684468iln.87.2023.06.21.19.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 19:13:05 -0700 (PDT)
Received: (nullmailer pid 75083 invoked by uid 1000);
 Thu, 22 Jun 2023 02:13:03 -0000
Date: Wed, 21 Jun 2023 20:13:03 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: document new property
 default-brightness-level
Message-ID: <20230622021303.GA68330-robh@kernel.org>
References: <20230621215457.11297-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621215457.11297-1-alex@shruggie.ro>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, pavel@ucw.cz,
 daniel.thompson@linaro.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 12:54:56AM +0300, Alexandru Ardelean wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> Add documentation for new default-brightness-level property.

Why?

> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
> 
> Link to original patch:
>   https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14ffd49892c4ce663cdafe98
> 
> Changelog v1 -> v2:
> * https://lore.kernel.org/dri-devel/20230519200520.10657-2-alex@shruggie.ro/
> * removed 'brightness-levels' reference
> * updated doc-text for 'default-brightness-level'
> * updated doc-text for 'default-on'
> * added 'minimum' & 'maximum' to 'default-brightness-level' property
> * removed 'Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>' as
>   requested
> * patch is first in series of 2 patches (was second patch)
> 
>  .../bindings/leds/backlight/gpio-backlight.yaml    | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> index 584030b6b0b9..2da6552a207c 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -20,9 +20,21 @@ properties:
>      maxItems: 1
>  
>    default-on:
> -    description: enable the backlight at boot.
> +    description:
> +      The default power state of the backlight at boot.
>      type: boolean
>  
> +  default-brightness-level:
> +    description:
> +      The default brightness level on device init. The value can be 0 or 1.
> +      If omitted, the value is 1. In the context of the "gpio-backlight" driver
> +      the effect of this setting will be that the backlight is on/off.
> +      The difference between this setting and "default-on" is that this handles
> +      brightness, while "default-on" handles the power setting of the device.

What power setting? You only have 1 GPIO to control here which is 2 
states. I fail to see why you need 6 possible states with all the 
combinations of 2 properties.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1
> +
>  required:
>    - compatible
>    - gpios
> -- 
> 2.40.1
> 

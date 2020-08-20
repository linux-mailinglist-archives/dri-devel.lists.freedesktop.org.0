Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F524C367
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4713D6E97B;
	Thu, 20 Aug 2020 16:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2416E97B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:37:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g75so2164022wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=phxeP4MV+AZQ9kUQVMqGmzO05ejp2HQBRzK/nNCK9N8=;
 b=P1eiFlVOgLxo3DkLBmkvbq9UU2VuBQjg54RT5Y5dw+W8OxcnIUE3hO6QOPd1YNJvLu
 AMOWO50dSluF5lWqUfL5f/cYUXvV8LBj34xpRzWwbZCO+wqQ+xRurb+mJrpf6Z8yGxqH
 waMfOmcesXpwEG03SI2gDqo7ozpdeiNEgQTm8q2mumcuOQuc9qma1pOBCkUMX4RjAxky
 ldRBYJK8uGJd1riL0etiRUXMxlXM9twIZHQhxg3WXuKCQOC6qKq3KNlEdk3z0SCA3AWI
 bfLzyXbGIh82VQX9kJVDSZZ8GQbkaLjdzOSKAK3UAtoUrwZ68LiwbGFf9t2mylJd0cpn
 wFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=phxeP4MV+AZQ9kUQVMqGmzO05ejp2HQBRzK/nNCK9N8=;
 b=U4X59y6MxrdysqDYjQPmz06rOZ6Xv9ccZvkaPZc8Msm5uM5gHYcSy1tTlbHctYbaxO
 NLC7K5MMQblxPoasEHtPYfYwYnJwB3/KDkN/6OEJD3sSDXBSZlki9SN1eVMXi0/K8R/V
 fZ8Dsiou5+v8A0dr8YGHUg8lJTRlNFHqbeqeyASCyD9sXwMrqKgubhFzRIRUjXO9KiX0
 6cc4pg4WdJom9vVWqm8vcCOBcl5ZtYdhTcGWsAnBMl+xTQacE9FPLFdStlkNGbuxKJXW
 AEUtk7MQrg6wxiaBTM2dndbolkFfeDyGAvzAGnRv9YTvU7UEX8qLsRu4AUlLflxsI/l+
 k/SQ==
X-Gm-Message-State: AOAM53348bSM4MbjUyBJcWtm0VU0mtGmkjXiJAUrmNnE6GcKag8QHuJF
 YDnKhSRTGNuydXmXrToTRiYI9g==
X-Google-Smtp-Source: ABdhPJyFLmeHBDicbx7M1ykYXBGiA8dKvHpRmhTK+h59Do0inB8TCK9Hde0p8vsSnS1TSDj/XbEkvg==
X-Received: by 2002:a05:600c:410b:: with SMTP id
 j11mr4487705wmi.38.1597941452130; 
 Thu, 20 Aug 2020 09:37:32 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a188sm5520953wmc.31.2020.08.20.09.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 09:37:31 -0700 (PDT)
Date: Thu, 20 Aug 2020 17:37:29 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3 v3] dt-bindings: backlight: Add some common backlight
 properties
Message-ID: <20200820163729.eq6vqmi3z6fcazd4@holly.lan>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-1-linus.walleij@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 10:51:48PM +0200, Linus Walleij wrote:
> Let's use a common.yaml include for the backlight like we do with
> the LEDs. The LEDs are inherently incompatible so their bindings
> cannot be reused for backlight.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> ChangeLog v2->v3:
> - Drop the | for the description
> - Drop the "default-on" property, we're not using it.
> - Drop the minimum 0 for unsigned u32:s
> ChangeLog v1->v2:
> - New patch as suggested by Sam.
> ---
>  .../bindings/leds/backlight/common.yaml       | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
> new file mode 100644
> index 000000000000..4e7e95e331a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common backlight properties
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>
> +  - Daniel Thompson <daniel.thompson@linaro.org>
> +  - Jingoo Han <jingoohan1@gmail.com>
> +
> +description:
> +  Backlight devices provide backlight for different types of graphical
> +  displays. They are typically but not necessarily implemented using a white
> +  LED powered by a boost converter.
> +
> +properties:
> +  default-brightness:
> +    description:
> +      The default brightness that should be applied to the LED by the operating
> +      system on start-up. The brightness should not exceed the brightness the
> +      LED can provide.
> +    $ref: /schemas/types.yaml#definitions/uint32
> +
> +  max-brightness:
> +    description:
> +      Normally the maximum brightness is determined by the hardware and this
> +      property is not required. This property is used to put a software limit
> +      on the brightness apart from what the driver says, as it could happen
> +      that a LED can be made so bright that it gets damaged or causes damage
> +      due to restrictions in a specific system, such as mounting conditions.
> +    $ref: /schemas/types.yaml#definitions/uint32
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

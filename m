Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752FA243913
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 13:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEF96E1F8;
	Thu, 13 Aug 2020 11:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15566E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 11:04:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f1so4890607wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yr/mjxUpkY1c/lUEQ4SP0vPJpwMpzcQ8K8L8JyZm16M=;
 b=fxWoJl9JTcWAFzQ1sN5VdxEAh0+vy+RKj/GPr4K9n39MpVFGJgtH3nWpA8OodYIGth
 NsyH7Tpv3yBP6IBJ4tLRTo3IW2a1u3WTdiIdAbBMyDDXDWa3+JkCwDHtfldizY0aWP5Q
 AFK/ZtlexDndbpRgHmUyk8au5r50q8hI5wjeaddIHyApGiakM8Dvi/UTSafE3x+18WE1
 2/BWnVeGi2Ad7IJgUxhNWYSmLNPVJBF5tzU7Ocpx2l6pVtLHU/wWKHmwDkzo5HJzP+Fv
 gApHSKr49LFFy409Wv4bkKbZ8dgeq8NI9q5kjrRic/s+9VER6Rp+m/sI1YI5d8J6Hs8L
 LzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yr/mjxUpkY1c/lUEQ4SP0vPJpwMpzcQ8K8L8JyZm16M=;
 b=iC/mhP/uKQ/xfXp7faAnHdXMB5NIshehGwnu5oCFGia6llpQ35pGOxEN9uChrN3B3C
 mSB/nG0R4tu4C+D7dZiv8W7ZIlLkdnodLVYECmqgiDyUyDaWULxDwi5gqjKCSrYLkzt1
 A4zC5sZYQ14URLR1jFqBmArxgaXss0fySGqJ6kehyd3dq7Pz/Dg6/gs8phF+IchnLdDm
 JyJ8uR9zHDJqVE037cOYwJTxGYk15JcCdaI5wMAcfT4HZAml2z1dAd+dQVQ0a6/2ACUV
 Q3VkwUiQUXsRw9eLJnDHe5iq+Kr9CowSpFTLFT7fwoaIhTK/pVyYCl7NN5yTl6G4tHJs
 sp/Q==
X-Gm-Message-State: AOAM531V27cEqFynfewv7540eFfKlVIsOQJuPXW/jBTf+L/syRuJrb0W
 YZhGE/OUGTWXm1JfBr6Rr8Di9g==
X-Google-Smtp-Source: ABdhPJzdRWVo06phdhDhcFTY+xzsyPi1aU0HqVp/y5mvmsroDBpq9Cj/8/vse5cbsqFkG/0X6oF3kA==
X-Received: by 2002:adf:c552:: with SMTP id s18mr3415074wrf.209.1597316665325; 
 Thu, 13 Aug 2020 04:04:25 -0700 (PDT)
Received: from holly.lan (82-132-221-219.dab.02.net. [82.132.221.219])
 by smtp.gmail.com with ESMTPSA id z8sm8642091wmf.10.2020.08.13.04.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 04:04:24 -0700 (PDT)
Date: Thu, 13 Aug 2020 12:04:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3 v2] dt-bindings: backlight: Add some common backlight
 properties
Message-ID: <20200813110422.25fkbqfldehncjzs@holly.lan>
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812085850.2643820-1-linus.walleij@linaro.org>
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

On Wed, Aug 12, 2020 at 10:58:48AM +0200, Linus Walleij wrote:
> Let's use a common.yaml include for the backlight like we do with
> the LEDs. The LEDs are inherently incompatible so their bindings
> cannot be reused for backlight.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - New patch as suggested by Sam.
> ---
>  .../bindings/leds/backlight/common.yaml       | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
> new file mode 100644
> index 000000000000..8ae7e3818b0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
> @@ -0,0 +1,42 @@
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
> +description: |
> +  Backlight devices provide backlight for different types of graphical
> +  displays. They are typically but not necessarilt implemented using a white
> +  LED powered by a boost converter.
> +
> +properties:
> +  default-on:
> +    description:
> +      The initial state of the backlight can be set to be on with this
> +      property. This is a state applied by the operating system so that the
> +      backlight is always turned on at boot.

Is default-on really a common property? I would describe it as legacy
that emerged when we added the gpio bindings and didn't spell
default-brightness correctly!

Currently I think this is only implemented for GPIO and it is simply
not needed for most hardware. More specifically, for hardware that is
capable of flicker-free handover (bootloader -> kernel) by examining
the hardware state at handover then we don't want a DT property. It is
duplicative and can only result in bad handovers.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

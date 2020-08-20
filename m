Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D009E24C36A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 18:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F076E97F;
	Thu, 20 Aug 2020 16:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1F56E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:38:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r4so2620257wrx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=66z3oTQKaSpXr1HTEurDMIey6l+nDsRMIQbXYeoP4QQ=;
 b=gPu5A+78PWk/yFnK6QxFXI2uLGsiHvK+DEtmEZSSVGS83ofZ1t9Bej/R103UXv7aVT
 YVfNHDmX/O28HR+0yDBq8nzJgdubjjQhdriFMBE/TjQbi25UHNDwublG0i3N2odoVIeI
 yNdE0lTW97iP7/6Rt0xUJMSbG7c4DVCpEyZMUvzJiUgWW9d9i9p1ZpgP7WIjM2atza+H
 iRZ/Dw/JtxdMtSk8TNCroGS6rkK9QkFbmkcTeo4x1ynvyg5XR9+cLJJ+Vz55UuH/Vb2/
 ZCB21IUeKRs32kaGJFDtHbzUy8iKKMp5k8NG7Hte0VuSbdmgrPXUsrMNIF9YQ1esSk0I
 UIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=66z3oTQKaSpXr1HTEurDMIey6l+nDsRMIQbXYeoP4QQ=;
 b=L4Y/PqLdbXJ4A5/buUzl1G5KrGwSVHSHWX8Rr0sO/iUNeEz+5TmGH+DWH1MCNZK/bU
 ZaYCjPXM0RDKJN6mSyJPm0boRnimSMXW6ilABRiIIlix92u64MoIgoPRLJdbKLAhlkpV
 8ER+7yu+pPcDbdsW3D/GbWbhNJ08FeYiCFWetBPyaj5AhNIytJDuNxkAC2uGARasIXWu
 8K3OtlXHuhJxT05YZh0gNQcABGK1ryUEAZi1UpnAZd3yq1N07JejZi8nB/+2v0WOU7ph
 /tq3FYdxHP3rnIiT+ijmDcgT4O5Xe5FYuGZSBsEi5yjVzF0343NIPpf9Bf5W6mZkHapm
 9s1A==
X-Gm-Message-State: AOAM531yMsFMm8WRegBiES8ZazCK/Ua5JoqZsxRyiGsugO/D4Xhsnb/T
 y+hVNnjUki9UxZccvaPU8IvwsQ==
X-Google-Smtp-Source: ABdhPJxYsIkn9Lzp0sRuLRWKX498c8umiAoQVlUm19jZ9lyLi/ILdooh6ou625Oa7NGZIfVIjursaQ==
X-Received: by 2002:adf:df91:: with SMTP id z17mr4365303wrl.149.1597941482392; 
 Thu, 20 Aug 2020 09:38:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j4sm5039364wmi.48.2020.08.20.09.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 09:38:01 -0700 (PDT)
Date: Thu, 20 Aug 2020 17:38:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3 v3] dt-bindings: backlight: Add Kinetic KTD253 bindings
Message-ID: <20200820163800.3hb3jl5emkxoczw2@holly.lan>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-2-linus.walleij@linaro.org>
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

On Wed, Aug 19, 2020 at 10:51:49PM +0200, Linus Walleij wrote:
> This adds device tree bindings for the Kinetic KTD253
> white LED backlight driver.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> ChangeLog v2->v3:
> - Drop the pointless cargo-culted "default-on" property that
>   we were not using
> - Correct the brightness in the example to something legal (13)
> ChangeLog v1->v2:
> - Create common.yaml for backlight as suggested by Sam and
>   use that.
> - Rename the GPIO line "enable-gpios"
> ---
>  .../leds/backlight/kinetic,ktd253.yaml        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> new file mode 100644
> index 000000000000..7a6ec1f8c0f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> @@ -0,0 +1,46 @@
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
> +  using pulses on the enable wire. This is sometimes referred to as
> +  "expresswire".
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: kinetic,ktd253
> +
> +  enable-gpios:
> +    description: GPIO to use to enable/disable and dim the backlight.
> +    maxItems: 1
> +
> +  default-brightness: true
> +  max-brightness: true
> +
> +required:
> +  - compatible
> +  - enable-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    backlight {
> +        compatible = "kinetic,ktd253";
> +        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +        default-brightness = <13>;
> +    };
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

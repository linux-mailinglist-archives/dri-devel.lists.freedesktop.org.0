Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACD3EF247
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 20:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD0A6E22B;
	Tue, 17 Aug 2021 18:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87856E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:53:34 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so26069388oth.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 11:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uh3yX8H6TLsN9OKTlfGslSl2eUYu3PuQFUrAtR+MjgY=;
 b=pHd0SbqlTM/SoQbw6c3G/hI6HmZYpY05lWVgLukuPNMbrlf/yeXd++p+vEJD4TmOXr
 C1ud7vl+W+CFPE4cdtJkEWmNJZIg9Tw9cQHjCFlXBmsuBPSUZk1x5B1nHNjxUNm3NChC
 FqRK7hh7g/r7ReZIpknd+TEBKxipA2HhpzH+R8BtGnUMRncInHsUFYORlufmYuhhZG3S
 rRex+sy/IG36JZKwC1l6Hu7/ovVmxLcwdmCxYnrebTZzvYS31tDkNyQEsttLE5bigZCf
 Im8yZRGr77jO1dAu4+1NN12wkwmlLCNOGH72w0LIM22dPJ48B78tSAmZaMxhVm96LLfk
 s6Tg==
X-Gm-Message-State: AOAM5324hlL6mCK9odm6qpCnEWc6qePOT99l2JTinr1pAwm6WjN45P2e
 2VwXs4IIfTEIOIsy63oezgkKcF5+Jg==
X-Google-Smtp-Source: ABdhPJwdlsfHlEhRtBcV8FhwgbozTQwrR52YEoNnA5fHDt6QOPwB6NMzcRRM9gfouCAMNfnpZvYYlQ==
X-Received: by 2002:a9d:a12:: with SMTP id 18mr3820062otg.252.1629226413997;
 Tue, 17 Aug 2021 11:53:33 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b5sm674032oif.44.2021.08.17.11.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 11:53:32 -0700 (PDT)
Received: (nullmailer pid 652790 invoked by uid 1000);
 Tue, 17 Aug 2021 18:53:31 -0000
Date: Tue, 17 Aug 2021 13:53:31 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: add bindings for the Sharp
 LS060T1SX01 panel
Message-ID: <YRwFqzIqwmkjgFAv@robh.at.kernel.org>
References: <20210809184712.203791-1-dmitry.baryshkov@linaro.org>
 <20210809184712.203791-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809184712.203791-2-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 09, 2021 at 09:47:11PM +0300, Dmitry Baryshkov wrote:
> Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
> using NT35695 driver. This panel can be found i.e. in the Dragonboard
> Display Adapter bundle.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/panel/sharp,ls060t1sx01.yaml      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> new file mode 100644
> index 000000000000..c4af5e7f6f39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sharp,ls060t1sx01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp Microelectronics 6.0" FullHD TFT LCD panel
> +
> +maintainers:
> +  - Dmitry Baryskov <dmitry.baryshkov@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sharp,ls060t1sx01
> +
> +  reg: true
> +  backlight: true
> +  reset-gpios: true
> +  port: true
> +
> +  avdd-supply:
> +    description: handle of the regulator that provides the supply voltage

Single supply? Use simple-panel binding. Or are your supplies 
incomplete?

> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "sharp,ls060t1sx01";
> +            reg = <0>;
> +            avdd-supply = <&pm8941_l22>;
> +            backlight = <&backlight>;
> +            reset-gpios = <&pm8916_gpios 25 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +
> +...
> -- 
> 2.30.2
> 
> 

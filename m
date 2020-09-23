Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C80275D29
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 18:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824526E972;
	Wed, 23 Sep 2020 16:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F265A6E972
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 16:17:14 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id y13so60919iow.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 09:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6SQ6n7+tg5duNFb+wRc7wNGDsNgiQxy+sYGpkWZIShY=;
 b=a+SFcLuKJ0hwE9hKJ3344DyiJi1the26sgD+jl7kZKBWTyZ9NdCZAsUOuvC5vqPFPP
 Jzk6yPN0a/5O0ntuZUtitreM7WwXBMJb1n8tsGNLHfWktn/e3tmNF+n+FPmVjkV+s0dD
 +/ZSjeFAccuVuMjMoi2D/y1G/NldWYdOQ5gifenUvyQcBoSQmTwmFV1vYm+mA7Pf1u4r
 nMOEFZ9NpvfxUfuXbNHMG3MrYV8fyQr2pUXhCe0ndW6gJJh2+bw7bmlqstHEVWR/Jc72
 0py1cPxoegSrikvQ6lRQf5rC97UQCjs7SwqSQWg2IIvPq5CTLkHrCED7hOBDUg3FFKka
 xBGA==
X-Gm-Message-State: AOAM530ZNYA98r0FySjAnCRnROKcWrM/+SsLQ8gZg7+vbfW3Ij0O+pkS
 Ly0tD1MvZydTYWNWM1W7pQ==
X-Google-Smtp-Source: ABdhPJxpYKAVLagbR20YcNbcHw7nZz6VjjRgsGsDe9UV6plLdrV55DxVoaEKsTiCzT32smc1BAriTg==
X-Received: by 2002:a02:a1d0:: with SMTP id o16mr113440jah.141.1600877834276; 
 Wed, 23 Sep 2020 09:17:14 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id v14sm156295iol.17.2020.09.23.09.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 09:17:13 -0700 (PDT)
Received: (nullmailer pid 857808 invoked by uid 1000);
 Wed, 23 Sep 2020 16:17:12 -0000
Date: Wed, 23 Sep 2020 10:17:12 -0600
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2] dt-bindings: dp-connector: add binding for DisplayPort
 connector
Message-ID: <20200923161712.GA836725@bogus>
References: <20200917055210.22868-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917055210.22868-1-tomi.valkeinen@ti.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 08:52:10AM +0300, Tomi Valkeinen wrote:
> Add binding for DisplayPort connector. A few notes:
> 
> * Similar to hdmi-connector, it has hpd-gpios as an optional property,
>   as the HPD could also be handled by, e.g., the DP bridge.
> 
> * dp-pwr-supply, which provides 3.3V on DP_PWR pin, is optional, as it
>   is not strictly required: standard DP cables do not even have the pin
>   connected.
> 
> * Connector type. Full size and mini connectors are identical except for
>   the connector size and form, so I believe there is no functional need
>   for this property. But similar to 'label' property, it might be used
>   to present information about the connector to the userspace.
> 
> * No eDP. There's really no "eDP connector", as it's always a custom
>   made connection between the DP and the DP panel. So possibly there is
>   no need for edp-connector binding, but even if there is, I don't want
>   to guess what it could look like, and could it be part of the
>   dp-connector binding.

I don't think that's true. Do an image search for 'edp pinout'. AFAICT, 
there's 2 lane 30 pin and 4 lane 40 pin. One image says 'Table 5-3 in 
eDP v1.2'. Of course, I'm sure there's custom ones too. From a binding 
perspective, we probably don't care about the differences, but just need 
to be able to describe HPD, backlight power, enable, and pwm, and LCD 
power.

That said, it's fine to not handle eDP here.

> 
> * No DP++. I'm not familiar with DP++, but I think it's all handled by
>   the DP bridge, and does not need any new properties to the dp-connector.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
> 
> Changes in v2: Add connector type.
> 
> 
>  .../display/connector/dp-connector.yaml       | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> new file mode 100644
> index 000000000000..b5fc3e52899e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/connector/dp-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DisplayPort Connector
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +properties:
> +  compatible:
> +    const: dp-connector
> +
> +  label: true
> +
> +  type:
> +    enum:
> +      - full-size
> +      - mini
> +
> +  hpd-gpios:
> +    description: A GPIO line connected to HPD
> +    maxItems: 1
> +
> +  dp-pwr-supply:
> +    description: Power supply for the DP_PWR pin
> +    maxItems: 1
> +
> +  port:
> +    description: Connection to controller providing DP signals
> +
> +required:
> +  - compatible
> +  - type
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    connector {
> +        compatible = "dp-connector";
> +        label = "dp0";
> +        type = "full-size";
> +
> +        port {
> +            dp_connector_in: endpoint {
> +                remote-endpoint = <&dp_out>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

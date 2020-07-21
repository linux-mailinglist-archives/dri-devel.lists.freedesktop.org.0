Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521D2276C4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 05:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D120A89A0E;
	Tue, 21 Jul 2020 03:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F0289A0E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 03:33:31 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id v6so19896092iob.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 20:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FIsq5aS0lflR5eoGS5qg3+rJGrp+o2lfnvyRp1tDhhA=;
 b=qNhL1pEpQxjcBLbVluCaH9W1pwwyr7G+fU3/H7aO0xTvue2cnKOYTy6gEgdNaDhNvG
 YCXMXRTCqRoilO70P/rKgGIknwnFqp8W0znNHrQjVaiPr7yLg40E0xEwStiAxzycRK2f
 Tn0wY35feLCUnb9bhTh/I8Z9vuOMu79fINHkD0o6y673D3oLMUSWT4z3gPIuYG+1/HFB
 Eqho/NCwLVtLvaSrDLfPhbv9d1fvXTypynW4lYO70QqfRo2aqPb8KGVtUaB1epgoJ3Eg
 XEo4GdCc+K6WFYDZyXHof3FfugpNIY7zhVZ1hF6Bb75C2rjaeqzFFeQoTTDDgL3WVIQL
 yv9Q==
X-Gm-Message-State: AOAM533p3A3NeJ3hnFz0tp+Gt5th2kepzkX8C/ymgMdpyNu3PV5sHagV
 nQ7tbtVLWIIhkoSMHx7N7A==
X-Google-Smtp-Source: ABdhPJxLzxwkSBFgFvKAURG7gHM0n9OP8gTt/FOr/k7nGl4P1U3thGEkKqvgI5H750H/QtxdXFHIqw==
X-Received: by 2002:a05:6602:2d12:: with SMTP id
 c18mr25892320iow.13.1595302410706; 
 Mon, 20 Jul 2020 20:33:30 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id g1sm9885914ilk.51.2020.07.20.20.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 20:33:29 -0700 (PDT)
Received: (nullmailer pid 3502407 invoked by uid 1000);
 Tue, 21 Jul 2020 03:33:28 -0000
Date: Mon, 20 Jul 2020 21:33:28 -0600
From: Rob Herring <robh@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Tianma
 nt36672a panel
Message-ID: <20200721033328.GA3492972@bogus>
References: <20200716153858.526-1-sumit.semwal@linaro.org>
 <20200716153858.526-2-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716153858.526-2-sumit.semwal@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 09:08:57PM +0530, Sumit Semwal wrote:
> The nt36672a panel from Tianma is a FHD+ panel with a resolution of 1080x2246
> and 6.18 inches size. It is found in some of the Poco F1 phones.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> ---
>  .../display/panel/tianma,nt36672a.yaml        | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> new file mode 100644
> index 000000000000..3c583ca926ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/tianma,nt36672a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tianma model NT36672A DSI Panel display driver
> +
> +maintainers:
> +  - Sumit Semwal <sumit.semwal@linaro.org>
> +
> +description: |
> +  The nt36672a panel from Tianma is a FHD+ LCD display panel with a resolution
> +  of 1080x2246. It is a video mode DSI panel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: tianma,nt36672a
> +
> +  reg:
> +    description: DSI virtual channel of the peripheral
> +
> +  reset-gpios:
> +    description: phandle of gpio for reset line - This should be 8mA, gpio
> +      can be configured using mux, pinctrl, pinctrl-names (active high)
> +
> +  vddio-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      Power IC supply
> +
> +  vddpos-supply:
> +    description: phandle of the positive boost supply regulator
> +
> +  vddneg-supply:
> +    description: phandle of the negative boost supply regulator
> +
> +  pinctrl-names:
> +    description: Pinctrl for panel active and suspend
> +
> +  pinctrl-0:
> +    description: Active pinctrls
> +
> +  pinctrl-1:
> +    description: Suspend pinctrls

I think the pinctrl should go in the DSI controller node, not the 
display unless it is settings for 'reset-gpios'.

> +
> +  ports:
> +    type: object
> +    properties:
> +      port@0:
> +        type: object
> +        description: DSI input port driven by master DSI
> +        properties:
> +          reg:
> +            const: 0
> +
> +        required:
> +          - reg

For a single port, you can do just 'port' (without ports node).

> +
> +required:
> +  - compatible
> +  - reg
> +  - vddi0-supply
> +  - vddpos-supply
> +  - vddneg-supply
> +  - reset-gpios
> +  - pinctrl-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/gpio/gpio.h>
> +    dsi0 {

dsi {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      panel@0 {
> +        compatible = "tianma,nt36672a";
> +        reg = <0>;
> +        vddi0-supply = <&vreg_l14a_1p88>;
> +        vddpos-supply = <&lab>;
> +        vddneg-supply = <&ibb>;
> +
> +        reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +        pinctrl-names = "panel_active", "panel_suspend";
> +        pinctrl-0 = <&sde_dsi_active>;
> +        pinctrl-1 = <&sde_dsi_suspend>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            tianma_nt36672a_in_0: endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.27.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

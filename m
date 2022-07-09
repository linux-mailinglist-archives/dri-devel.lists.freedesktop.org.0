Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4056C837
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 11:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8C5112202;
	Sat,  9 Jul 2022 09:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A1F112208
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=bQao0uhcvp+1LML5tn0jIDi+JBcfo6KzruckDKC3200=;
 b=Zx7kpXndr5SVSWcRnKMCgbXGc41CeI+YBqFqw9lfB9KyhGx7kx6LILIip5cIKSq66lnHckwdThCH6
 EvkXHVzjn4AWSTT8FaGwVS/OK3j1w9BazJy/bg9s5aosL293b1f4BzssBH0bvj4D3hLzQiPXt2YYhf
 U3nRlwzNTuOvRMCG47AqXDryAjBS2v0B1rlKkgplcw9xa0cPxistjxJrO0ATmUPVOOck0PfEyAm/de
 Gy8X5kUDOipjR5Sf2i/DoCaoBPOFed4YxKx0+ikFATPhp0Kcv20pK581tYO2ztkqTLTCMJbfDwGzti
 v4E0foZa6DWsS7Wefq2UC7JaRzVLMGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=bQao0uhcvp+1LML5tn0jIDi+JBcfo6KzruckDKC3200=;
 b=iLvft4rlxwG6L3oaWSPOLOufdauTPHbYccYyEMqEW2sMLdLHTEJovzFCWbf0h//uiGB67ygy/dCmC
 5NjgJFQCg==
X-HalOne-Cookie: d1d041af6dd76b0adfe09725c6a117cc2310e10a
X-HalOne-ID: 811e08aa-ff66-11ec-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 811e08aa-ff66-11ec-be7e-d0431ea8bb03;
 Sat, 09 Jul 2022 09:07:06 +0000 (UTC)
Date: Sat, 9 Jul 2022 11:07:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: MollySophia <mollysophia379@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Message-ID: <YslFOHQMSSVG7czY@ravnborg.org>
References: <20220708021824.9167-1-mollysophia379@gmail.com>
 <20220708021824.9167-2-mollysophia379@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708021824.9167-2-mollysophia379@gmail.com>
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Molly,

On Fri, Jul 08, 2022 at 10:18:24AM +0800, MollySophia wrote:
> Add documentation for "novatek,nt35596s" panel.

As a general note, we cannot apply a driver without the binding.
So this patch should be the first in the series.

Not a big deal, but it makes it easier on the committer later.

A few comments below.

	Sam

> 
> Signed-off-by: MollySophia <mollysophia379@gmail.com>
> ---
>  .../display/panel/novatek,nt35596s.yaml       | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> new file mode 100644
> index 000000000000..937b194a6f18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt35596s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT35596S based DSI display Panels
> +
> +maintainers:
> +  - Molly Sophia <mollysophia379@gmail.com>
> +
> +description: |
> +  The nt35596s IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, support is added only for a JDI FHD+ LCD display panel with a
> +  resolution of 1080x2160. It is a video mode DSI panel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - jdi,fhd-nt35596s
> +      - const: novatek,nt35596s
> +    description: This indicates the panel manufacturer of the panel that is
> +      in turn using the NT35596S panel driver. This compatible string
> +      determines how the NT35596S panel driver is configured for the indicated
> +      panel. The novatek,nt35596s compatible shall always be provided as a fallback.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: phandle of gpio for reset line - This should be 8mA, gpio
> +      can be configured using mux, pinctrl, pinctrl-names (active high)
reset-gpios is part of panel-common and there is no need to describe it
here. The description, which looks like a copy from another binding,
does not really tell anything that is specific for this HW.
So replace it with a
    reset-gpios: true
later in the binding would be better.

> +
> +  vddi0-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      Power IC supply
Please drop the "phandle of the" part. This is implicit and does not
provide any extra info on the actual HW.
This comments applies for all *-supply.

> +
> +  vddpos-supply:
> +    description: phandle of the positive boost supply regulator
> +
> +  vddneg-supply:
> +    description: phandle of the negative boost supply regulator
> +
> +  reg: true
> +  port: true
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddi0-supply
> +  - vddpos-supply
> +  - vddneg-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false

Use:
additionalProperties: false

This will catch if the DT file contains any properties that is not
mentioned here.
The use of unevaluatedProperties in the file you copied from looks
wrong.

> +
> +examples:
> +  - |+
No need for the + sign here.

> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi0 {
dsi {


> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "jdi,fhd-nt35596s", "novatek,nt35596s";
> +            reg = <0>;
> +            vddi0-supply = <&vreg_l14a_1p88>;
> +            vddpos-supply = <&lab>;
> +            vddneg-supply = <&ibb>;
> +
> +            backlight = <&pmi8998_wled>;
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                jdi_nt35596s_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.37.0

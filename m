Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD639D9BC4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F7510E940;
	Tue, 26 Nov 2024 16:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LvdPM+NU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8AF10E940
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 16:46:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 67518A4047D;
 Tue, 26 Nov 2024 16:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793B2C4CECF;
 Tue, 26 Nov 2024 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732639605;
 bh=hKlquugWmJSu667nRHswM59/EFTEBAHYCg7yF1p2uwI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LvdPM+NUPDRh5ZWDp53+qoAzncutiTmOE/UnDLIb0Cha0oyL8pITpfzO7oz4hqb+a
 vvcV/acLao9hWVDEvrH8rI4AOKpJuG+RdfcCpnaVyGzq0rIsY/E2LwpSQXJyfl4GO0
 V1FIMx3gi6vCZUsvWUeUzi7oojjVH33ulhSg8rr9lYAYJ0RKgX1IW01bGHeUiZecDs
 wTPy++jwwouGI2ov2706JwpYrTIA2GPMAvnRtygxwAgOzNvrCiBntt4oqVKXIScMXA
 N+zmPyE9Vamm80K5di5i50uvx2H6ZBHfaosVBsbu2dvHeX0Kua/olJDFqPGs1/qpbm
 a8rVaS/mnSw4w==
Message-ID: <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
Date: Tue, 26 Nov 2024 17:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 26/11/2024 17:34, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add bindings for a secondary display controller present on certain
> Apple laptops.
> 

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../display/apple,h7-display-pipe-mipi.yaml        | 89 ++++++++++++++++++++++
>  .../bindings/display/apple,h7-display-pipe.yaml    | 77 +++++++++++++++++++
>  .../bindings/display/panel/apple,summit.yaml       | 58 ++++++++++++++
>  3 files changed, 224 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2cf2f50e9fc7329a5b424d5ddf8c34cad2ebb6be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/apple,h7-display-pipe-mipi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple pre-DCP display controller MIPI interface.

Drop final stop, that's a title so it could be capitalized, but anyway
it is not a sentence

> +
> +maintainers:
> +  - asahi@lists.linux.dev

Drop, maintainer boxes are not allowed for bindings.

> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description:
> +  The MIPI controller part of the pre-DCP Apple display controller
> +
> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8112-display-pipe-mipi
> +          - apple,t8103-display-pipe-mipi
> +      - const: apple,h7-display-pipe-mipi
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mipi
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    required:
> +      - port@0
> +      - port@1

Please take a look how other bindings define ports. You miss here
several items and more important - description what are these ports for.

> +
> +  '#address-cells': true
> +
> +  '#size-cells': true
> +
> +patternProperties:
> +  "^panel@[0-3]$": true

These look unusual. Is this a DSI controller? If so, then reference
dsi-controller. See other bindings how this is done.


> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    display_dfr: dsi@228200000 {

Drop unused label

> +    	compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
> +    	reg-names = "mipi";
> +    	reg = <0x28200000 0xc000>;

Order fields according to DTS coding style.

> +    	power-domains = <&ps_dispdfr_mipi>;
> +
> +    	ports {
> +    		#address-cells = <1>;

Messed indentation. Use 4 spaces for example indentation.


> +    		#size-cells = <0>;
> +
> +    		dfr_mipi_in: port@0 {
> +    			#address-cells = <1>;
> +    			#size-cells = <0>;
> +    			reg = <0>;
> +    		};
> +
> +    		dfr_mipi_out: port@1 {
> +    			#address-cells = <1>;
> +    			#size-cells = <0>;
> +    			reg = <1>;
> +    		};
> +    	};
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..98982da9c5f672167d67e4cd3b47e1fbdafc9510
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/apple,h7-display-pipe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple pre-DCP display controller.
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description:
> +  A secondary display controller used to drive the "touchbar" on certain Apple laptops.

Please wrap code according to coding style (checkpatch is not a coding
style description, but only a tool).


> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8112-display-pipe
> +          - apple,t8103-display-pipe
> +      - const: apple,h7-display-pipe
> +
> +  reg:
> +    maxItems: 2

List and describe the items instead, because be and fe are a bit cryptic.

> +
> +  reg-names:
> +    items:
> +      - const: be
> +      - const: fe
> +
> +  power-domains:
> +    maxItems: 2

Need to list the items instead.

> +
> +  interrupts:
> +    maxItems: 2

Ditto

> +
> +  interrupt-names:
> +    items:
> +      - const: be
> +      - const: fe
> +
> +  iommus:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    display_dfr: display-pipe@228200000 {

Drop unused label.

> +    	compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
> +    	reg-names = "be", "fe";
> +    	reg = <0x28200000 0xc000>,
> +    		<0x28400000 0x4000>;

Messed alignment, in other places as well.

> +    	power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
> +    	interrupt-parent = <&aic>;
> +    	interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
> +    		<AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
> +    	interrupt-names = "be", "fe";
> +    	iommus = <&displaydfr_dart 0>;
> +    	port {
> +    		dfr_adp_out_mipi: endpoint {

Messed indentation.

> +    			remote-endpoint = <&dfr_mipi_in_adp>;
> +    		};
> +    	};
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..db14f7af3787076c84ccdda08fedeb8912d5514d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/apple,summit.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple "Summit" display panel.
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/leds/backlight/common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,j293-summit
> +          - apple,j493-summit
> +      - const: apple,summit

Summit tells me nothing - no description, title repeats it, so I suggest
using device specific compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  max-brightness: true
> +
> +  port: true

No, these cannot be true without definition. Again, please open existing
bindings and use them as example. You probably miss here some reference,
but max-brightness for panel is a bit confusing. I asked already and did
not get answer: isn't this backlight property? What is this device -
backlight or panel? If panel, then what bus?


Best regards,
Krzysztof

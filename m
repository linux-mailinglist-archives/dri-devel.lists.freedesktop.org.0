Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B082A0B1E9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC8410E5C3;
	Mon, 13 Jan 2025 08:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iF3rsECn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725F510E5CB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:59:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C76405C26EA;
 Mon, 13 Jan 2025 08:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7ABC4CED6;
 Mon, 13 Jan 2025 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736758742;
 bh=2wJJM13zlSd944RH/1F0Bz3tql/OxPThH7169R04jPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iF3rsECnnNXnLPj/o91djAfP13GvTUDHa2aK3jynTdpWUxaFsoHt+YYpkPFr2bKhE
 paaaxfqSUYRyNmmn5DgXeZlS7H1ClTLKP+oyDF+5GGDc2WsJ1et8+uLlDwJA6dc8Yh
 iBKHhWS8W7njrgoB4rmdN/Dy6jnx/scMlCusFopJtOhRwT7LIC432I46q+uA2e4VTT
 IygCnhmFDWjW+tC5D5GmeULFnqs4qDnkJIkQqQYXJQsOvzLw5ublYsF1jTSODgkwbC
 9BDvIfgqmUwktgiixLRMuCPn3STy19yGn/+3RanXIrVLiaNUHa+N7JZ6x5ru221kEl
 e3ah5b52n3SCg==
Date: Mon, 13 Jan 2025 09:58:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
Message-ID: <7rr3fja4rxjbdmgpdqaid5fybiu6uctpbvp24ujv5drfmeiowf@u4pkhzyhy3pd>
References: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
 <20250112-adpdrm-v3-1-c674dc19fa7f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250112-adpdrm-v3-1-c674dc19fa7f@gmail.com>
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

On Sun, Jan 12, 2025 at 09:43:48PM +0100, Sasha Finkelstein wrote:
 +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port. Always connected to the primary controller
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output MIPI DSI port to the panel
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dsi@228200000 {
> +        compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
> +        reg = <0x28200000 0xc000>;

This looks not matching unit address.

> +        power-domains = <&ps_dispdfr_mipi>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;

Make the example complete, so you will see that address/size cells are
unnecessary here or, if you really have more than one endpoint, they are
supposed to be here.

> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc07edccb437b221ea9772b9356e1896326aa7da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/apple,h7-display-pipe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple pre-DCP display controller
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description:
> +  A secondary display controller used to drive the "touchbar" on
> +  certain Apple laptops.
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
> +
> +  reg-names:
> +    items:
> +      - const: be
> +        description: Primary register block, controls planes and blendinga

Description goes to 'reg:' field, just like I asked last time.

> +      - const: fe
> +        description:
> +          Contains other configuration registers like interrupt
> +          and FIFO control
> +
> +  power-domains:
> +    description:
> +      Phandles to pmgr entries that are needed for this controller to turn on.
> +      Aside from that, their specific functions are unknown
> +    maxItems: 2
> +
> +  interrupts:

Same comments as before - list and describe the items.

Best regards,
Krzysztof


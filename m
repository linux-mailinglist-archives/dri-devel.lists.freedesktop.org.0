Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7B3B2F2AD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 10:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0275010E2DC;
	Thu, 21 Aug 2025 08:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JR/XurJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C96C10E2DC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 08:47:36 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BDEFC78;
 Thu, 21 Aug 2025 10:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1755765995;
 bh=YOJtioSHHd/SkiLRqPzjm4PRQjeoNg6aVatMs971PnA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JR/XurJW8sk9ngBFyhtN41bOYZKc3k6MO96wg5S1s/yToSxVonfxw9oBZCQeluZc4
 hC5yUxoMZeMOJDoy+oNNr2zhw/ZUz2MejPSMRyXxSdBRev9IAwx146iUVyEZncJuFf
 ukWll4p/fGM3RUiMJdlG0yqwWG8S0wD4TJl2KYj0=
Message-ID: <913b5a87-19f1-44f5-8782-8711980644a1@ideasonboard.com>
Date: Thu, 21 Aug 2025 11:47:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] dt-bindings: display: bridge: renesas, dsi:
 Document RZ/V2H(P) and RZ/V2N
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi,

On 28/07/2025 23:14, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the compatible string "renesas,r9a09g057-mipi-dsi" for the Renesas
> RZ/V2H(P) (R9A09G057) SoC. While the MIPI DSI LINK registers are shared
> with the RZ/G2L SoC, the D-PHY register layout differs. Additionally, the
> RZ/V2H(P) uses only two resets compared to three on RZ/G2L, and requires
> five clocks instead of six.
> 
> To reflect these hardware differences, update the binding schema to
> support the reduced clock and reset requirements for RZ/V2H(P).
> 
> Since the RZ/V2N (R9A09G056) SoC integrates an identical DSI IP to
> RZ/V2H(P), the same "renesas,r9a09g057-mipi-dsi" compatible string is
> reused for RZ/V2N.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v6->v7:
> - Renamed pllclk to pllrefclk
> - Preserved the reviewed by tag from Geert and Krzysztof
> 
> v5->v6:
> - Preserved the sort order (by part number).
> - Added reviewed tag from Geert.
> 
> v4->v5:
> - No changes
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - Collected reviewed tag from Krzysztof
> 
> v1->v2:
> - Kept the sort order for schema validation
> - Added  `port@1: false` for RZ/V2H(P) SoC
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++-----
>  1 file changed, 91 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> index 5a99d9b9635e..c20625b8425e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -14,16 +14,21 @@ description: |
>    RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
>    up to four data lanes.
>  
> -allOf:
> -  - $ref: /schemas/display/dsi-controller.yaml#
> -
>  properties:
>    compatible:
> -    items:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> +              - renesas,r9a07g054-mipi-dsi # RZ/V2L
> +          - const: renesas,rzg2l-mipi-dsi
> +
> +      - items:
> +          - const: renesas,r9a09g056-mipi-dsi # RZ/V2N
> +          - const: renesas,r9a09g057-mipi-dsi
> +
>        - enum:
> -          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> -          - renesas,r9a07g054-mipi-dsi # RZ/V2L
> -      - const: renesas,rzg2l-mipi-dsi
> +          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
>  
>    reg:
>      maxItems: 1
> @@ -49,34 +54,56 @@ properties:
>        - const: debug
>  
>    clocks:
> -    items:
> -      - description: DSI D-PHY PLL multiplied clock
> -      - description: DSI D-PHY system clock
> -      - description: DSI AXI bus clock
> -      - description: DSI Register access clock
> -      - description: DSI Video clock
> -      - description: DSI D-PHY Escape mode transmit clock
> +    oneOf:
> +      - items:
> +          - description: DSI D-PHY PLL multiplied clock
> +          - description: DSI D-PHY system clock
> +          - description: DSI AXI bus clock
> +          - description: DSI Register access clock
> +          - description: DSI Video clock
> +          - description: DSI D-PHY Escape mode transmit clock
> +      - items:
> +          - description: DSI D-PHY PLL reference clock
> +          - description: DSI AXI bus clock
> +          - description: DSI Register access clock
> +          - description: DSI Video clock
> +          - description: DSI D-PHY Escape mode transmit clock

Is this style ok in the bindings? I thought it's necessary to "if" these
kind of blocks based on the compatible.

>    clock-names:
> -    items:
> -      - const: pllclk
> -      - const: sysclk
> -      - const: aclk
> -      - const: pclk
> -      - const: vclk
> -      - const: lpclk
> +    oneOf:
> +      - items:
> +          - const: pllclk
> +          - const: sysclk
> +          - const: aclk
> +          - const: pclk
> +          - const: vclk
> +          - const: lpclk
> +      - items:
> +          - const: pllrefclk
> +          - const: aclk
> +          - const: pclk
> +          - const: vclk
> +          - const: lpclk
>  
>    resets:
> -    items:
> -      - description: MIPI_DSI_CMN_RSTB
> -      - description: MIPI_DSI_ARESET_N
> -      - description: MIPI_DSI_PRESET_N
> +    oneOf:
> +      - items:
> +          - description: MIPI_DSI_CMN_RSTB
> +          - description: MIPI_DSI_ARESET_N
> +          - description: MIPI_DSI_PRESET_N
> +      - items:
> +          - description: MIPI_DSI_ARESET_N
> +          - description: MIPI_DSI_PRESET_N
>  
>    reset-names:
> -    items:
> -      - const: rst
> -      - const: arst
> -      - const: prst
> +    oneOf:
> +      - items:
> +          - const: rst
> +          - const: arst
> +          - const: prst
> +      - items:
> +          - const: arst
> +          - const: prst
>  
>    power-domains:
>      maxItems: 1
> @@ -130,6 +157,41 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-mipi-dsi
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +
> +        clock-names:
> +          maxItems: 5
> +
> +        resets:
> +          maxItems: 2
> +
> +        reset-names:
> +          maxItems: 2
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 6
> +
> +        clock-names:
> +          minItems: 6
> +
> +        resets:
> +          minItems: 3
> +
> +        reset-names:
> +          minItems: 3
> +

Oh... So this one does the selection based on the compatible. And if we
get a new SoC which doesn't fit into the above classification model,
we'll have to restructure the binding (or add a new one)?

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

 Tomi

>  examples:
>    - |
>      #include <dt-bindings/clock/r9a07g044-cpg.h>


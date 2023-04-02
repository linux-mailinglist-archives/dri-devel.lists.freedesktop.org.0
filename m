Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 295736D39EC
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 20:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83E410E0FB;
	Sun,  2 Apr 2023 18:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E9C10E0FB
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 18:52:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AFD528573D;
 Sun,  2 Apr 2023 20:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680461552;
 bh=Z1WR3Y7aWo2/OJq76xBAnL8zgZiC0NvMMQk3/Xgge2M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TAOAAJSusAjGSYlSPBp/Djj+6PFgyCRUwC0DhHaWqthUOSzNv0oXKL1ynC9qaOEYY
 SccKW2GwFy8antHbz2SpoiLnzYC515P9S6GuAJ4fwuVBc0eKCKOHMvJo8z7gNl7E9Z
 o06g4akPUvGsYLZPk499W8sslrnP0PAY9V4TOuKlsyOe6RtLxH5L5r5kbMFzlyUjAL
 yGIzcIPXGNYmYn3KXGMM34OKn0nLbnpkBf95T5GgLprHJY4V3KYq/IDq9fgNTKQYwf
 8lutLhRUzMKyKopitPpqS7Zal1tWSe9GxTIQE1mw1VoTujU2YHAEftlIklAN/cpKlA
 NXrfgzCYoSNDg==
Message-ID: <982f2196-7690-0046-d438-0466c8588671@denx.de>
Date: Sun, 2 Apr 2023 19:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to
 yaml
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230331195746.114840-1-festevam@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230331195746.114840-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/31/23 21:57, Fabio Estevam wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Samsung MIPI DSIM bridge can be found on Exynos and NXP's
> i.MX8M Mini and Nano SoC's.

MX8M Plus too .

> Convert exynos_dsim.txt to yaml.
> 
> Used the example node from latest Exynos SoC instead of
> the one used in legacy exynos_dsim.txt.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>   .../display/bridge/samsung,mipi-dsim.yaml     | 275 ++++++++++++++++++
>   .../bindings/display/exynos/exynos_dsim.txt   |  92 ------
>   2 files changed, 275 insertions(+), 92 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>   delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> new file mode 100644
> index 000000000000..c131bd879caf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -0,0 +1,275 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung MIPI DSIM bridge controller
> +
> +maintainers:
> +  - Inki Dae <inki.dae@samsung.com>
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +description: |
> +  Samsung MIPI DSIM bridge controller can be found it on Exynos
> +  and i.MX8M Mini and Nano SoC's.

Plus too.

> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos3250-mipi-dsi
> +      - samsung,exynos4210-mipi-dsi
> +      - samsung,exynos5410-mipi-dsi
> +      - samsung,exynos5422-mipi-dsi
> +      - samsung,exynos5433-mipi-dsi
> +      - fsl,imx8mm-mipi-dsim
> +      - fsl,imx8mp-mipi-dsim

You have plus here already, so just update the description.

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 5
> +
> +  phys:
> +    maxItems: 1
> +    description: phandle to the phy module representing the DPHY
> +
> +  phy-names:
> +    items:
> +      - const: dsim
> +
> +  samsung,phy-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: phandle to the samsung phy-type
> +
> +  power-domains:
> +    description: phandle to the associated power domain
> +    maxItems: 1
> +
> +  samsung,power-domain:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the associated samsung power domain
> +
> +  vddcore-supply:
> +    description: MIPI DSIM Core voltage supply (e.g. 1.1V)
> +
> +  vddio-supply:
> +    description: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
> +
> +  samsung,burst-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM high speed burst mode frequency.
> +
> +  samsung,esc-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM escape mode frequency.
> +
> +  samsung,pll-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM oscillator clock frequency.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Input port node to receive pixel data from the
> +          display controller. Exactly one endpoint must be
> +          specified.
> +        properties:
> +          endpoint@0:

Why endpoint@0 if this only has one endpoint ?

> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: sub-node describing the input from MIC
> +
> +        unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          DSI output port node to the panel or the next bridge
> +          in the chain

[...]

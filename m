Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBC282565
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 18:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638576E0BE;
	Sat,  3 Oct 2020 16:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6CB6E0BE
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 16:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id EE66DFB03;
 Sat,  3 Oct 2020 18:47:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1SgnQLk12Z5; Sat,  3 Oct 2020 18:47:37 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 7489845D0C; Sat,  3 Oct 2020 18:47:36 +0200 (CEST)
Date: Sat, 3 Oct 2020 18:47:36 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Add dsi-controller.yaml in DSI
 controller schemas
Message-ID: <20201003164736.GA2773@bogon.m.sigxcpu.org>
References: <20201002225924.3513700-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002225924.3513700-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>,
 Yannick Fertre <yannick.fertre@st.com>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Oct 02, 2020 at 05:59:24PM -0500, Rob Herring wrote:
> Some DSI controllers are missing a reference to the recently added
> dsi-controller.yaml schema. Add it and we can drop the duplicate
> parts.

For the NWL part:

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =


> =

> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: "Guido G=FAnther" <agx@sigxcpu.org>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 11 ++-------
>  .../bindings/display/brcm,bcm2835-dsi0.yaml   |  3 +++
>  .../bindings/display/bridge/nwl-dsi.yaml      | 11 ++++-----
>  .../bindings/display/st,stm32-dsi.yaml        | 23 ++++---------------
>  4 files changed, 14 insertions(+), 34 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a3=
1-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i=
-a31-mipi-dsi.yaml
> index 63f948175239..7aa330dabc44 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-=
dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-=
dsi.yaml
> @@ -11,9 +11,6 @@ maintainers:
>    - Maxime Ripard <mripard@kernel.org>
>  =

>  properties:
> -  "#address-cells": true
> -  "#size-cells": true
> -
>    compatible:
>      enum:
>        - allwinner,sun6i-a31-mipi-dsi
> @@ -57,12 +54,7 @@ properties:
>        port should be the input endpoint, usually coming from the
>        associated TCON.
>  =

> -patternProperties:
> -  "^panel@[0-9]+$": true
> -
>  required:
> -  - "#address-cells"
> -  - "#size-cells"
>    - compatible
>    - reg
>    - interrupts
> @@ -74,6 +66,7 @@ required:
>    - port
>  =

>  allOf:
> +  - $ref: dsi-controller.yaml#
>    - if:
>        properties:
>          compatible:
> @@ -99,7 +92,7 @@ allOf:
>          clocks:
>            minItems: 1
>  =

> -additionalProperties: false
> +unevaluatedProperties: false
>  =

>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.=
yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
> index 3c643b227a70..eb44e072b6e5 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
> @@ -9,6 +9,9 @@ title: Broadcom VC4 (VideoCore4) DSI Controller
>  maintainers:
>    - Eric Anholt <eric@anholt.net>
>  =

> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
>  properties:
>    "#clock-cells":
>      const: 1
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yam=
l b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index b8ba6eb482a1..a125b2dd3a2f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -14,6 +14,9 @@ description: |
>    NWL MIPI-DSI host controller found on i.MX8 platforms. This is a dsi b=
ridge for
>    the SOCs NWL MIPI-DSI host controller.
>  =

> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +
>  properties:
>    compatible:
>      const: fsl,imx8mq-nwl-dsi
> @@ -144,10 +147,6 @@ properties:
>  =

>      additionalProperties: false
>  =

> -patternProperties:
> -  "^panel@[0-9]+$":
> -    type: object
> -
>  required:
>    - '#address-cells'
>    - '#size-cells'
> @@ -163,7 +162,7 @@ required:
>    - reset-names
>    - resets
>  =

> -additionalProperties: false
> +unevaluatedProperties: false
>  =

>  examples:
>    - |
> @@ -172,7 +171,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/reset/imx8mq-reset.h>
>  =

> -    mipi_dsi: mipi_dsi@30a00000 {
> +    dsi@30a00000 {
>                #address-cells =3D <1>;
>                #size-cells =3D <0>;
>                compatible =3D "fsl,imx8mq-nwl-dsi";
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml =
b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> index 69cc7e8bf15a..327a14d85df8 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> @@ -13,6 +13,9 @@ maintainers:
>  description:
>    The STMicroelectronics STM32 DSI controller uses the Synopsys DesignWa=
re MIPI-DSI host controller.
>  =

> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
>  properties:
>    compatible:
>      const: st,stm32-dsi
> @@ -65,24 +68,6 @@ properties:
>          description:
>            DSI output port node, connected to a panel or a bridge input p=
ort"
>  =

> -patternProperties:
> -  "^(panel|panel-dsi)@[0-9]$":
> -    type: object
> -    description:
> -      A node containing the panel or bridge description as documented in
> -      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> -    properties:
> -      port:
> -        type: object
> -        description:
> -          Panel or bridge port node, connected to the DSI output port (p=
ort@1)
> -
> -  "#address-cells":
> -    const: 1
> -
> -  "#size-cells":
> -    const: 0
> -
>  required:
>    - "#address-cells"
>    - "#size-cells"
> @@ -92,7 +77,7 @@ required:
>    - clock-names
>    - ports
>  =

> -additionalProperties: false
> +unevaluatedProperties: false
>  =

>  examples:
>    - |
> -- =

> 2.25.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

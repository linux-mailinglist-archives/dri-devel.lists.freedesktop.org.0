Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E81569AE
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2020 09:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B396E575;
	Sun,  9 Feb 2020 08:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D616E575
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2020 08:31:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 843EF20022;
 Sun,  9 Feb 2020 09:31:39 +0100 (CET)
Date: Sun, 9 Feb 2020 09:31:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCHv3 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200209083138.GC5321@ravnborg.org>
References: <1580907990-32108-1-git-send-email-harigovi@codeaurora.org>
 <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
 a=gEfo2CItAAAA:8 a=rUAlzMgn7VfAsfAmY-cA:9 a=2aNtAtRbR_R-ZWdM:21
 a=at3rOJuKAjAUH52G:21 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Harigovindan

On Wed, Feb 05, 2020 at 06:36:29PM +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
> 	- Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
Thanks for changing to DT Schema.


> 
>  .../bindings/display/visionox,rm69299.yaml         | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/visionox,rm69299.yaml
> new file mode 100644
> index 0000000..bfcd46d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/visionox,rm69299.yaml

This is a binding for a panel - and thus belongs in the panel/
directory.

> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: GPL-2.0-only
The preferred license for new bindings are (GPL-2.0-only or BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/visionox,rm69299.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Visionox model RM69299 Panels Device Tree Bindings
> +
> +maintainers:
> +  - Harigovindan P <harigovi@codeaurora.org>
> +  - Kalyan Thota <kalyan_t@codeaurora.org>
> +  - Vishnuvardhan Prodduturi <vproddut@codeaurora.org>
> +
> +description:
> +  This binding is for display panels using a Visionox RM692999 panel.
> +

Use:
allOf:
  - $ref: panel-common.yaml#

Then you have access to all properties described there.


> +patternProperties:
> +  "^(panel|panel-dsi)@[0-9]$":
> +    type: object
> +    description:
> +      A node containing the panel or bridge description as documented in
> +      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt

The panel shall not document the parent node.
See how other panels do it.
In general - start with the compatible.

This will also simplify your list of required properties.

> +    properties:
> +      compatible:
> +        const: visionox,rm69299-1080p-display
> +
> +      reg:
> +        maxItems: 1
> +
> +      vdda-supply:
> +        description:
> +          Phandle of the regulator that provides the vdda supply voltage.
> +
> +      vdd3p3-supply:
> +        description:
> +          Phandle of the regulator that provides the vdd3p3 supply voltage.
> +
> +      pinctrl-names:
> +        items:
> +          - const: default
> +          - const: suspend
> +
> +      pinctrl-0:
> +        items:
> +          - const: Display default pin
> +          - const: Display default pin

pinctrl are not needed for the panel. They belong to the display driver.

> +
> +      ports:
> +        type: object
> +        description:
> +          A node containing DSI input & output port nodes with endpoint
> +          definitions as documented in
> +          Documentation/devicetree/bindings/media/video-interfaces.txt
> +          Documentation/devicetree/bindings/graph.txt
> +        properties:
> +          port@0:
> +            type: object
> +            description:
> +              DSI input port node.
> +
A
       port: true
should do the trick here.




> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
Not required.
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - reg
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - pinctrl-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - reset-gpios

reset-gpios are not documented in the above.

Add
      reset-gpios: true


Please give it a spin more.
And preferably give it a "make dt_binding_check" whirl.
If you cannot get this part working I can do so for you in next
reviision.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

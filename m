Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5128E69E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 20:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0206EB27;
	Wed, 14 Oct 2020 18:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7266EB27
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 18:44:48 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9EDAC804DF;
 Wed, 14 Oct 2020 20:44:44 +0200 (CEST)
Date: Wed, 14 Oct 2020 20:44:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: display: panel: Add bindings for
 Novatek nt36672a
Message-ID: <20201014184443.GA835495@ravnborg.org>
References: <20200902064407.30712-1-sumit.semwal@linaro.org>
 <20200902064407.30712-2-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902064407.30712-2-sumit.semwal@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=7SntCGha3WDrWTH_G2cA:9
 a=LUD6pZZpSXjGsJNK:21 a=SGBMzKFWdo6dqNr9:21 a=CjuIK1q_8ugA:10
 a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sumit.
On Wed, Sep 02, 2020 at 12:14:06PM +0530, Sumit Semwal wrote:
> Novatek nt36672a is a display driver IC that can drive DSI panel. It
> is also present in the Tianma video mode panel, which is a FHD+ panel
> with a resolution of 1080x2246 and 6.18 inches size. It is found in
> some of the Poco F1 phones.
> 
> This patch adds the display driver for the IC, with support added for
> this tianma fhd video mode panel.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
I assume you will apply the patch yourself.

	Sam
> 
> ---
> v2: remove ports node, making port@0 directly under panel@0 node.
> v3: updated to replace port@0 to just 'port'.
> v5: renamed to novatek,nt36672a, since the binding is for the IC and not
>       the panel.
> v6: v5 review comments incorporated.
>     - added enum for the compatible part, since it can be extended in
>       future.
>     - few cosmetic updates.
> ---
>  .../display/panel/novatek,nt36672a.yaml       | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> new file mode 100644
> index 000000000000..d2170de6b723
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt36672a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36672A based DSI display Panels
> +
> +maintainers:
> +  - Sumit Semwal <sumit.semwal@linaro.org>
> +
> +description: |
> +  The nt36672a IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, support is added only for a Tianma FHD+ LCD display panel with a
> +  resolution of 1080x2246. It is a video mode DSI panel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +         - tianma,fhd-video
> +      - const: novatek,nt36672a
> +    description: This indicates the panel manufacturer of the panel that is
> +      in turn using the NT36672A panel driver. This compatible string
> +      determines how the NT36672A panel driver is configured for the indicated
> +      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
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
> +  reg: true
> +  port: true
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
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "tianma,fhd-video", "novatek,nt36672a";
> +            reg = <0>;
> +            vddi0-supply = <&vreg_l14a_1p88>;
> +            vddpos-supply = <&lab>;
> +            vddneg-supply = <&ibb>;
> +
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port {
> +                tianma_nt36672a_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB229F7C6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CD16E916;
	Thu, 29 Oct 2020 22:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB256E916
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:22:28 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CBE182001F;
 Thu, 29 Oct 2020 23:22:26 +0100 (CET)
Date: Thu, 29 Oct 2020 23:22:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v10 2/6] dt-bindings: display: bridge: Intel KeemBay DSI
Message-ID: <20201029222225.GB904738@ravnborg.org>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-3-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604006877-20092-3-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
 a=gCqPDhMgXDf6k_4HypcA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Thu, Oct 29, 2020 at 02:27:53PM -0700, Anitha Chrisanthus wrote:
> This patch adds bindings for Intel KeemBay MIPI DSI
> 
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>

This again matches my understanding of the HW - good.

One small nit below, with that addressed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  .../bindings/display/bridge/intel,keembay-dsi.yaml | 101 +++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
> new file mode 100644
> index 0000000..4cef64e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/intel,keembay-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Devicetree bindings for Intel Keem Bay mipi dsi controller
> +
> +maintainers:
> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> +  - Edmond J Dea <edmund.j.dea@intel.com>
> +
> +properties:
> +  compatible:
> +    const: intel,keembay-dsi
> +
> +  reg:
> +    items:
> +      - description: MIPI registers range
> +
> +  reg-names:
> +    items:
> +      - const: mipi
> +
> +  clocks:
> +    items:
> +      - description: MIPI DSI clock
> +      - description: MIPI DSI econfig clock
> +      - description: MIPI DSI config clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_mipi
> +      - const: clk_mipi_ecfg
> +      - const: clk_mipi_cfg
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      '#address-cells':
> +       const: 1
> +
> +      '#size-cells':
> +       const: 0
> +
> +      port@0:
> +        type: object
> +        description: MIPI DSI input port.
> +
> +      port@1:
> +        type: object
> +        description: DSI output port to adv7535.
Drop the mention of adv7535 - the DT decide what the port is connected
to.

> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mipi-dsi@20900000 {
> +        compatible = "intel,keembay-dsi";
> +        reg = <0x20900000 0x4000>;
> +        reg-names = "mipi";
> +        clocks = <&scmi_clk 0x86>,
> +                 <&scmi_clk 0x88>,
> +                 <&scmi_clk 0x89>;
> +        clock-names = "clk_mipi", "clk_mipi_ecfg",
> +                      "clk_mipi_cfg";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dsi_in: endpoint {
> +                    remote-endpoint = <&disp_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dsi_out: endpoint {
> +                    remote-endpoint = <&adv7535_input>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

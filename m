Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D424150BF69
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8759310E2A7;
	Fri, 22 Apr 2022 18:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B2310E2F2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=LwlU40XotA1nBo9aBTZeYjcwTzaZNnyNJyXy4ofmuGM=;
 b=XGd/ddQUlgsno2GCtZUjjFWT7z0Qkeg0mlhyS9u7n+/+DLi6vbcc1T2zLAQk+ul4hcIMiXUAT4Fhw
 kjJfzlXGSB7dHUPx4Y8TVII/C5aKlb+VJ9BAQLK2zoTMWGlxF6jCOwkojS6atrd1GSyJJaS/QHPLUl
 Fp0hcofdNEHV1nnFRXG33I7HMaQdpFsJ8p4gXhMtmhCnOGSnhI7Bl6S4YT8dADRA26kVgXkxRiZbRF
 Jdf2JMFhpSLmkWHr5Cn1Q6Yn3Mqul+TBWxbzZXXO1Rr9onCvzzHW7Gf1KJuI3LTSlgmfpgZdfYo2DF
 ioHI6532Xk498ayoYQ5JCiCEa/qv4Dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=LwlU40XotA1nBo9aBTZeYjcwTzaZNnyNJyXy4ofmuGM=;
 b=hGYf4mv/zZqNcNNgXkkau7R0O+Yxaws+yRBN2v84NNowMoCpjcTp0rQk/tJXmBynNhqIGs5QQBPDC
 JqbN9hwAQ==
X-HalOne-Cookie: 49d5a337dfd7411a6073e858fb795eaf22434d3f
X-HalOne-ID: bf8828c3-c269-11ec-be69-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id bf8828c3-c269-11ec-be69-d0431ea8bb03;
 Fri, 22 Apr 2022 18:26:38 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:26:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Implement
 simple NXP i.MX8M LDB bridge
Message-ID: <YmLzXDtZ9WNhTX2x@ravnborg.org>
References: <20220418145105.76986-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418145105.76986-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek, I read the patch once more.

On Mon, Apr 18, 2022 at 04:51:04PM +0200, Marek Vasut wrote:
> The i.MX8MP contains two syscon registers which are responsible

Here it says i.MX8MP

> for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
> which represents this serializer as a bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Consistently use fsl,imx8mp-ldb as compatible
>     - Drop items: from compatible:
>     - Replace minItems with maxItems in clocks:
>     - Drop quotes from clock-names const: ldb
>     - Rename syscon to fsl,syscon
>     - Use generic name of ldb-lvds in example
> ---
>  .../bindings/display/bridge/nxp,ldb.yaml      | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> new file mode 100644
> index 0000000000000..f3182566eb316
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/nxp,ldb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8M DPI to LVDS bridge chip
Here it says i.MX8M 
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  The i.MX8MP contains two syscon registers which are responsible
Here it says i.MX8MP

> +  for configuring the on-SoC DPI-to-LVDS serializer. This describes
> +  those registers as bridge within the DT.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-ldb
Here it says fsl,imx8mp


It looks a little inconsistent, I guess the title needs a fix.
a-b stands with the title fixed.

	Sam
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ldb
> +
> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle to media block controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for DPI input.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for LVDS Channel-A output (panel or bridge).
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for LVDS Channel-B output (panel or bridge).
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - fsl,syscon
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +
> +    bridge {
> +        compatible = "fsl,imx8mp-ldb";
> +        clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
> +        clock-names = "ldb";
> +        fsl,syscon = <&media_blk_ctrl>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                ldb_from_lcdif2: endpoint {
> +                    remote-endpoint = <&lcdif2_to_ldb>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                ldb_lvds_ch0: endpoint {
> +                    remote-endpoint = <&ldb_to_lvdsx4panel>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                ldb_lvds_ch1: endpoint {
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.35.1

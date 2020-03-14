Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE4185513
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 08:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D054E8929B;
	Sat, 14 Mar 2020 07:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9E28929B
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 07:41:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2594B80501;
 Sat, 14 Mar 2020 08:41:19 +0100 (CET)
Date: Sat, 14 Mar 2020 08:41:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 2/5] dt-bindings: panel: add binding for Xingbangda
 XBD599 panel
Message-ID: <20200314074118.GD5783@ravnborg.org>
References: <20200311163329.221840-1-icenowy@aosc.io>
 <20200311163329.221840-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311163329.221840-3-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8
 a=NVUcaYqSR25QaaNNWYIA:9 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy

A few comment below.

	Sam

On Thu, Mar 12, 2020 at 12:33:26AM +0800, Icenowy Zheng wrote:
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel.
> 
> Add its device tree binding.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../display/panel/xingbangda,xbd599.yaml      | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml b/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
> new file mode 100644
> index 000000000000..62816b34de31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/xingbangda,xbd599.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/xingbangda,xbd599.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xingbangda XBD599 5.99in MIPI-DSI LCD panel
> +
> +maintainers:
> +  - Icenowy Zheng <icenowy@aosc.io>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: xingbangda,xbd599
> +  reg: true
> +  backlight: true
> +  reset-gpios: true
> +  vcc-supply:
> +     description: regulator that supplies the VCC voltage
Fix indent - two chars, not three

> +  iovcc-supply:
> +     description: regulator that supplies the IOVCC voltage
Same here

> +
> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - vcc-supply
> +  - iovcc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    &dsi {
Remove '&' - dt_binding_check will fail otherwise

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "xingbangda,xbd599";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            iovcc-supply = <&reg_dldo2>;
> +            vcc-supply = <&reg_ldo_io0>;
> +        };
> +    };
> +
> +...
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

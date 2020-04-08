Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B41A1BCA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26B56E94D;
	Wed,  8 Apr 2020 06:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84BA6E94D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 06:07:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9C4732002C;
 Wed,  8 Apr 2020 08:07:50 +0200 (CEST)
Date: Wed, 8 Apr 2020 08:07:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add binding document
 for Leadtek LTK050H3146W
Message-ID: <20200408060744.GA14965@ravnborg.org>
References: <20200407232351.2547750-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407232351.2547750-1-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=NXpJzYs8AAAA:8
 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=PNnMyF-q063_3wR0rKAA:9
 a=CjuIK1q_8ugA:10 a=cwV61pgf2j4Cq8VD9hE_:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Goodmorning Heiko.

On Wed, Apr 08, 2020 at 01:23:50AM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The LTK050H3146W is a 5.0" 720x1280 DSI display.
> 
> changes in v2:
> - add display variants
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Applied to drm-misc-next.

	Sam

> ---
>  .../display/panel/leadtek,ltk050h3146w.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> new file mode 100644
> index 000000000000..a372bdc5bde1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Leadtek LTK050H3146W 5.0in 720x1280 DSI panel
> +
> +maintainers:
> +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - leadtek,ltk050h3146w
> +      - leadtek,ltk050h3146w-a2
> +  reg: true
> +  backlight: true
> +  reset-gpios: true
> +  iovcc-supply:
> +     description: regulator that supplies the iovcc voltage
> +  vci-supply:
> +     description: regulator that supplies the vci voltage
> +
> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - iovcc-supply
> +  - vci-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "leadtek,ltk050h3146w";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            iovcc-supply = <&vcc_1v8>;
> +            vci-supply = <&vcc3v3_lcd>;
> +        };
> +    };
> +
> +...
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

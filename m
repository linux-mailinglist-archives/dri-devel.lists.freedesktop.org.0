Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2121A1698
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 22:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBE76E8F7;
	Tue,  7 Apr 2020 20:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021FE6E8F7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 20:13:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F2C92804F2;
 Tue,  7 Apr 2020 22:12:59 +0200 (CEST)
Date: Tue, 7 Apr 2020 22:12:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: Convert feiyang,
 fy07024di26a30d to DT schema
Message-ID: <20200407201258.GB28801@ravnborg.org>
References: <20200403142453.25307-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403142453.25307-1-jagan@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=iP-xVBlJAAAA:8
 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=IP_fJxDYSyxqUQePLtIA:9
 a=CjuIK1q_8ugA:10 a=lHLH-nfn2y1bM_0xSXwp:22 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan.

On Fri, Apr 03, 2020 at 07:54:51PM +0530, Jagan Teki wrote:
> Convert the feiyang,fy07024di26a30d panel bindings to DT schema.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Thanks, this and the two other patches are now pushed to drm-misc-next.

	Sam

> ---
> Changes for v3:
> - update the licence, used (GPL-2.0-only OR BSD-2-Clause) since
>   I'm the author for old binding
> - use panel-common.yaml
> - mark true for common properties 
> - use maxItems: 1 for reg
> - update example
> Changes for v2:
> - fix dt_binding_check 
> 
>  .../display/panel/feiyang,fy07024di26a30d.txt | 20 -------
>  .../panel/feiyang,fy07024di26a30d.yaml        | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> deleted file mode 100644
> index 82caa7b65ae8..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Feiyang FY07024DI26A30-D 7" MIPI-DSI LCD Panel
> -
> -Required properties:
> -- compatible: must be "feiyang,fy07024di26a30d"
> -- reg: DSI virtual channel used by that screen
> -- avdd-supply: analog regulator dc1 switch
> -- dvdd-supply: 3v3 digital regulator
> -- reset-gpios: a GPIO phandle for the reset pin
> -
> -Optional properties:
> -- backlight: phandle for the backlight control.
> -
> -panel@0 {
> -	compatible = "feiyang,fy07024di26a30d";
> -	reg = <0>;
> -	avdd-supply = <&reg_dc1sw>;
> -	dvdd-supply = <&reg_dldo2>;
> -	reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
> -	backlight = <&backlight>;
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> new file mode 100644
> index 000000000000..95acf9e96f1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/feiyang,fy07024di26a30d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Feiyang FY07024DI26A30-D 7" MIPI-DSI LCD Panel
> +
> +maintainers:
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: feiyang,fy07024di26a30d
> +
> +  reg:
> +    description: DSI virtual channel used by that screen
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: analog regulator dc1 switch
> +
> +  dvdd-supply:
> +    description: 3v3 digital regulator
> +
> +  reset-gpios: true
> +
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - dvdd-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "feiyang,fy07024di26a30d";
> +            reg = <0>;
> +            avdd-supply = <&reg_dc1sw>;
> +            dvdd-supply = <&reg_dldo2>;
> +            reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
> +            backlight = <&backlight>;
> +        };
> +    };
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

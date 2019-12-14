Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4981311F0CC
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 08:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405A96E31C;
	Sat, 14 Dec 2019 07:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9046E31C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 07:54:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 495CB804FD;
 Sat, 14 Dec 2019 08:54:13 +0100 (CET)
Date: Sat, 14 Dec 2019 08:54:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add binding document
 for Xinpeng XPP055C272
Message-ID: <20191214075412.GB22818@ravnborg.org>
References: <20191209144208.4863-1-heiko@sntech.de>
 <20191209144208.4863-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209144208.4863-2-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=NXpJzYs8AAAA:8
 a=gEfo2CItAAAA:8 a=7gkXJVJtAAAA:8 a=kqpNkawWe9FrIPx1R8MA:9
 a=CjuIK1q_8ugA:10 a=cwV61pgf2j4Cq8VD9hE_:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko.


On Mon, Dec 09, 2019 at 03:42:07PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The XPP055C272 is a 5.5" 720x1280 DSI display.
Can we get the size info included in the title in the binding?
Then all relavant info is in the binding, and no git digging is needed.

> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../display/panel/xinpeng,xpp055c272.yaml     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> new file mode 100644
> index 000000000000..4515d44d189b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xinpeng XPP055C272 720x1280 DSI panel
> +
> +maintainers:
> +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: xinpeng,xpp055c272
> +  reg: true
> +  backlight: true
> +  port: true
> +  reset-gpios: true
> +  iovcc-supply:
> +     description: regulator that supplies the iovcc voltage
> +  vci-supply:
> +     description: regulator that supplies the vci voltage
> +
> +required:
> +  - compatible
> +  - reg
One would assume the display also required power to operate.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi@ff450000 {
> +        panel@0 {
> +            compatible = "xinpeng,xpp055c272";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            iovcc-supply = <&vcc_1v8>;
> +            vci-supply = <&vcc3v3_lcd>;
> +        };
> +    };
> +
> +...

With the few things mentioned above fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

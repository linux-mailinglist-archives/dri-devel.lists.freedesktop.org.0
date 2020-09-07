Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C8260517
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 21:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7ED6E530;
	Mon,  7 Sep 2020 19:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6489A6E530
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 19:24:23 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0B33820033;
 Mon,  7 Sep 2020 21:24:19 +0200 (CEST)
Date: Mon, 7 Sep 2020 21:24:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add TDO tl070wsh30
 DSI panel bindings
Message-ID: <20200907192418.GA558348@ravnborg.org>
References: <20200907111027.21933-1-narmstrong@baylibre.com>
 <20200907111027.21933-3-narmstrong@baylibre.com>
 <20200907114552.GA526406@ravnborg.org>
 <358ee0c3-fe1c-b9b6-9ed8-086f9d14afd9@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <358ee0c3-fe1c-b9b6-9ed8-086f9d14afd9@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=IpJZQVW2AAAA:8 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8
 a=26pVUN82OfOXP9tGjk4A:9 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil.

On Mon, Sep 07, 2020 at 03:24:47PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 07/09/2020 13:45, Sam Ravnborg wrote:
> > Hi Neil.
> > 
> > On Mon, Sep 07, 2020 at 01:10:26PM +0200, Neil Armstrong wrote:
> >> This add the bindings for the 1024*600 tl070wsh30 DSI panel.
> > 
> > The binding looks like a panel-simple-dsi.yaml candidate.
> > Only differen is enable-gpios versus reset-gpios
> 
> This is the only difference, the panel only has a reset signal and no
> enable signal.
> 
> But I can add a reset-gpios to panel-simple-dsi.yaml, would it be ok ?

Yes, that would be fine as long as it is not a required property.
It was a mistake we did not add it from the beginning.

There has been patches floating to add reset-gpios to panle.simple.c
that I rejected - this was also wrong.
Really simple and dumb panels has no reset but dsi panels that
panel-simple supports too has a reset.

	Sam


> 
> Neil
> 
> > 
> > Could you check if we can use panel-simple-dsi-yaml.
> > 
> > 	Sam
> > 
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  .../display/panel/tdo,tl070wsh30.yaml         | 58 +++++++++++++++++++
> >>  1 file changed, 58 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
> >> new file mode 100644
> >> index 000000000000..20f4fdedfcb0
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
> >> @@ -0,0 +1,58 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> >> +# Copyright 2020 BayLibre, SAS
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/panel/tdo,tl070wsh30.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: TDO TL070WSH30 DSI panel
> >> +
> >> +maintainers:
> >> +  - Neil Armstrong <narmstrong@baylibre.com>
> >> +
> >> +allOf:
> >> +  - $ref: panel-common.yaml#
> >> +
> >> +properties:
> >> +
> >> +  compatible:
> >> +    enum:
> >> +      - tdo,tl070wsh30
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +    description: DSI virtual channel
> >> +
> >> +  backlight: true
> >> +  reset-gpios: true
> >> +  port: true
> >> +  power-supply: true
> >> +
> >> +additionalProperties: false
> >> +
> >> +required:
> >> +  - compatible
> >> +  - power-supply
> >> +  - reset-gpios
> >> +  - port
> >> +  - reg
> >> +
> >> +examples:
> >> +  - |
> >> +    dsi {
> >> +      #address-cells = <1>;
> >> +      #size-cells = <0>;
> >> +      panel@0 {
> >> +        compatible = "tdo,tl070wsh30";
> >> +        reg = <0>;
> >> +        power-supply = <&vcc_lcd_reg>;
> >> +        backlight = <&panel_backlight>;
> >> +        reset-gpios = <&gpio_reset>;
> >> +
> >> +        port {
> >> +          panel: endpoint {
> >> +            remote-endpoint = <&mipi_dsi_out>;
> >> +          };
> >> +        };
> >> +      };
> >> +    };
> >> -- 
> >> 2.22.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

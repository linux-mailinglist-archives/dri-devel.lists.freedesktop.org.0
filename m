Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63691303CE
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 18:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B206E027;
	Sat,  4 Jan 2020 17:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DC56E027
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 17:52:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 439A420034;
 Sat,  4 Jan 2020 18:52:17 +0100 (CET)
Date: Sat, 4 Jan 2020 18:52:15 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Novatek NT35510-based
 panels
Message-ID: <20200104175215.GA19679@ravnborg.org>
References: <20191225115610.14518-1-linus.walleij@linaro.org>
 <20200104172717.GB8724@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200104172717.GB8724@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=j8Cu_9a8AAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8
 a=fdb9Mel2xOjeGKR8vtwA:9 a=CjuIK1q_8ugA:10 a=A2jcf3dkIZPIRbEE90CI:22
 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus

On Sat, Jan 04, 2020 at 06:27:17PM +0100, Sam Ravnborg wrote:
> Hi Linus.
> 
> On Wed, Dec 25, 2019 at 12:56:09PM +0100, Linus Walleij wrote:
> > This adds device tree bindings for the Novatek NT35510-based
> > family of panels. Since several such panels are in existence
> > we define bindings common for all, and define the compatible
> > string for one certain panel (Hydis HVA40WV1).
Reading this once more make me think that the right way to do this
is to have two compatible's.

enum
- novatek,nt35510
- hydis,hva40wv1

So there shall be a match for both.

Then we have explicit documented that this is the combination of
a specific controller and a specific panel.

	Sam

> > 
> > As other panels are discovered and investigated, we can add
> > more compatibles to the binding.
> > 
> > Cc: Stephan Gerhold <stephan@gerhold.net>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  .../display/panel/novatek-nt35510.yaml        | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml
> > new file mode 100644
> > index 000000000000..a4a6b5adf15b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/novatek-nt35510.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/novatek-nt35510.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Novatek NT35510-based display panels
> > +
> > +maintainers:
> > +  - Linus Walleij <linus.walleij@linaro.org>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: hydis,hva40wv1
> compatible fail to match filename - which is common practice.
> And hydis is not a known vendor-prefix.
> 
> 
> > +    description: This indicates the panel manufacturer of the panel
> > +      that is in turn using the NT35510 panel driver. The compatible
> > +      string determines how the NT35510 panel driver shall be configured
> > +      to work with the indicated panel.
> The description is just a general description of what compatible is used
> for.
> Please drop it as it does not provide anything specific for the panel.
> 
> 	Sam
> 
> > +  reg: true
> > +  reset-gpios: true
> > +  vdd-supply:
> > +     description: regulator that supplies the vdd voltage
> > +  vddi-supply:
> > +     description: regulator that supplies the vddi voltage
> > +  backlight: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi@a0351000 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        panel {
> > +            compatible = "hydis,hva40wv1";
> > +            reg = <0>;
> > +            vdd-supply = <&ab8500_ldo_aux4_reg>;
> > +            vddi-supply = <&ab8500_ldo_aux6_reg>;
> > +            reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
> > +            backlight = <&gpio_bl>;
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.21.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

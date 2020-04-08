Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA61A23B1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 16:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94F46EA6D;
	Wed,  8 Apr 2020 14:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B7D89DB5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 14:01:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86BC9522;
 Wed,  8 Apr 2020 16:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586354476;
 bh=XxzHVE6zlWTyguJ27GTvGM6nacHAH8FyWLtZvZFu2/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d9jT2vK9pgwoxt9t1G3WP4tn7UhnCCiCzsRndoW75L4PWrqgQJsqRJxEGYc1gDsE0
 Gh9N0LYxSemAjirnWQy5I9reHelt7BYJPwgqUb2r0rVVkWqpJsQy/rZtwTUhGFmkDN
 hRLo7Y4g3NXpJxfFobSajUD90HyAzwKG7Ja+iwb8=
Date: Wed, 8 Apr 2020 17:01:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH/RFC 4/6] dt-bindings: display: rockchip: dw-hdmi: Convert
 binding to YAML
Message-ID: <20200408140107.GH4881@pendragon.ideasonboard.com>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200406080032.zlszhkjqmjeoa4ti@gilmour.lan>
 <20200406111927.GD4757@pendragon.ideasonboard.com>
 <20200406170915.x2ztz4q446h6vx2y@gilmour.lan>
 <20200406175028.GI16885@pendragon.ideasonboard.com>
 <20200407071251.npibrmzywiyigu2a@gilmour.lan>
 <20200408114552.GC4881@pendragon.ideasonboard.com>
 <20200408122519.epxtptdjlhkj3kru@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408122519.epxtptdjlhkj3kru@gilmour.lan>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, Apr 08, 2020 at 02:25:19PM +0200, Maxime Ripard wrote:
> On Wed, Apr 08, 2020 at 02:45:52PM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 07, 2020 at 09:12:51AM +0200, Maxime Ripard wrote:
> >> On Mon, Apr 06, 2020 at 08:50:28PM +0300, Laurent Pinchart wrote:
> >>> On Mon, Apr 06, 2020 at 07:09:15PM +0200, Maxime Ripard wrote:
> >>>> On Mon, Apr 06, 2020 at 02:19:27PM +0300, Laurent Pinchart wrote:
> >>>>> On Mon, Apr 06, 2020 at 10:00:32AM +0200, Maxime Ripard wrote:
> >>>>>> On Mon, Apr 06, 2020 at 02:39:33AM +0300, Laurent Pinchart wrote:
> >>>>>>> Convert the Rockchip HDMI TX text binding to YAML.
> >>>>>>>
> >>>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>>>>>> ---
> >>>>>>>  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
> >>>>>>>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 178 ++++++++++++++++++
> >>>>>>>  2 files changed, 178 insertions(+), 74 deletions(-)
> >>>>>>>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> >>>>>>>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> >>>>>>> deleted file mode 100644
> >>>>>>> index 3d32ce137e7f..000000000000
> >>>>>>> --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> >>>>>>> +++ /dev/null
> >>>>>>> @@ -1,74 +0,0 @@
> >>>>>>> -Rockchip DWC HDMI TX Encoder
> >>>>>>> -============================
> >>>>>>> -
> >>>>>>> -The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> >>>>>>> -with a companion PHY IP.
> >>>>>>> -
> >>>>>>> -These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> >>>>>>> -Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> >>>>>>> -following device-specific properties.
> >>>>>>> -
> >>>>>>> -
> >>>>>>> -Required properties:
> >>>>>>> -
> >>>>>>> -- compatible: should be one of the following:
> >>>>>>> -		"rockchip,rk3228-dw-hdmi"
> >>>>>>> -		"rockchip,rk3288-dw-hdmi"
> >>>>>>> -		"rockchip,rk3328-dw-hdmi"
> >>>>>>> -		"rockchip,rk3399-dw-hdmi"
> >>>>>>> -- reg: See dw_hdmi.txt.
> >>>>>>> -- reg-io-width: See dw_hdmi.txt. Shall be 4.
> >>>>>>> -- interrupts: HDMI interrupt number
> >>>>>>> -- clocks: See dw_hdmi.txt.
> >>>>>>> -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> >>>>>>> -- ports: See dw_hdmi.txt. The DWC HDMI shall have a single port numbered 0
> >>>>>>> -  corresponding to the video input of the controller. The port shall have two
> >>>>>>> -  endpoints, numbered 0 and 1, connected respectively to the vopb and vopl.
> >>>>>>> -- rockchip,grf: Shall reference the GRF to mux vopl/vopb.
> >>>>>>> -
> >>>>>>> -Optional properties
> >>>>>>> -
> >>>>>>> -- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
> >>>>>>> -  or the functionally-reduced I2C master contained in the DWC HDMI. When
> >>>>>>> -  connected to a system I2C master this property contains a phandle to that
> >>>>>>> -  I2C master controller.
> >>>>>>> -- clock-names: See dw_hdmi.txt. The "cec" clock is optional.
> >>>>>>> -- clock-names: May contain "cec" as defined in dw_hdmi.txt.
> >>>>>>> -- clock-names: May contain "grf", power for grf io.
> >>>>>>> -- clock-names: May contain "vpll", external clock for some hdmi phy.
> >>>>>>> -- phys: from general PHY binding: the phandle for the PHY device.
> >>>>>>> -- phy-names: Should be "hdmi" if phys references an external phy.
> >>>>>>> -
> >>>>>>> -Optional pinctrl entry:
> >>>>>>> -- If you have both a "unwedge" and "default" pinctrl entry, dw_hdmi
> >>>>>>> -  will switch to the unwedge pinctrl state for 10ms if it ever gets an
> >>>>>>> -  i2c timeout.  It's intended that this unwedge pinctrl entry will
> >>>>>>> -  cause the SDA line to be driven low to work around a hardware
> >>>>>>> -  errata.
> >>>>>>> -
> >>>>>>> -Example:
> >>>>>>> -
> >>>>>>> -hdmi: hdmi@ff980000 {
> >>>>>>> -	compatible = "rockchip,rk3288-dw-hdmi";
> >>>>>>> -	reg = <0xff980000 0x20000>;
> >>>>>>> -	reg-io-width = <4>;
> >>>>>>> -	ddc-i2c-bus = <&i2c5>;
> >>>>>>> -	rockchip,grf = <&grf>;
> >>>>>>> -	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> >>>>>>> -	clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
> >>>>>>> -	clock-names = "iahb", "isfr";
> >>>>>>> -	ports {
> >>>>>>> -		hdmi_in: port {
> >>>>>>> -			#address-cells = <1>;
> >>>>>>> -			#size-cells = <0>;
> >>>>>>> -			hdmi_in_vopb: endpoint@0 {
> >>>>>>> -				reg = <0>;
> >>>>>>> -				remote-endpoint = <&vopb_out_hdmi>;
> >>>>>>> -			};
> >>>>>>> -			hdmi_in_vopl: endpoint@1 {
> >>>>>>> -				reg = <1>;
> >>>>>>> -				remote-endpoint = <&vopl_out_hdmi>;
> >>>>>>> -			};
> >>>>>>> -		};
> >>>>>>> -	};
> >>>>>>> -};
> >>>>>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..8ff544ae0ac2
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> >>>>>>> @@ -0,0 +1,178 @@
> >>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>>> +%YAML 1.2
> >>>>>>> +---
> >>>>>>> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
> >>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>> +
> >>>>>>> +title: Rockchip DWC HDMI TX Encoder
> >>>>>>> +
> >>>>>>> +maintainers:
> >>>>>>> +  - Mark Yao <mark.yao@rock-chips.com>
> >>>>>>> +
> >>>>>>> +description: |
> >>>>>>> +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> >>>>>>> +  with a companion PHY IP.
> >>>>>>> +
> >>>>>>> +allOf:
> >>>>>>> +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    enum:
> >>>>>>> +      - rockchip,rk3228-dw-hdmi
> >>>>>>> +      - rockchip,rk3288-dw-hdmi
> >>>>>>> +      - rockchip,rk3328-dw-hdmi
> >>>>>>> +      - rockchip,rk3399-dw-hdmi
> >>>>>>> +
> >>>>>>> +  reg: true
> >>>>>>> +
> >>>>>>> +  reg-io-width:
> >>>>>>> +    const: 4
> >>>>>>> +
> >>>>>>> +  clocks:
> >>>>>>> +    minItems: 2
> >>>>>>> +    maxItems: 5
> >>>>>>> +    items:
> >>>>>>> +      - description: The bus clock for either AHB and APB
> >>>>>>> +      - description: The internal register configuration clock
> >>>>>>> +      - description: The HDMI CEC controller main clock
> >>>>>>> +      - description: Power for GRF IO
> >>>>>>> +      - description: External clock for some HDMI PHY
> >>>>>>> +
> >>>>>>> +  clock-names:
> >>>>>>> +    minItems: 2
> >>>>>>> +    maxItems: 5
> >>>>>>> +    items:
> >>>>>>> +      - const: iahb
> >>>>>>> +      - const: isfr
> >>>>>>> +      - enum:
> >>>>>>> +        - cec
> >>>>>>> +        - grf
> >>>>>>> +        - vpll
> >>>>>>> +      - enum:
> >>>>>>> +        - cec
> >>>>>>> +        - grf
> >>>>>>> +        - vpll
> >>>>>>> +      - enum:
> >>>>>>> +        - cec
> >>>>>>> +        - grf
> >>>>>>> +        - vpll
> >>>>>>
> >>>>>> IIRC Rob wanted us to standardize the order of the clocks if possible,
> >>>>>> since it's a pain to support properly here, and your description won't
> >>>>>> match what you describe here either (and in general it's just a best
> >>>>>> practice), so if all your DTs have the same order you should just set
> >>>>>> that order in stone.
> >>>>>
> >>>>> But how do we handle the case where any of the cec, grf and vpll clocks
> >>>>> can be set ? Assuming, for instance, that
> >>>>>
> >>>>> 	clock-names = "iahb", "isfr", "cec";
> >>>>> 	clock-names = "iahb", "isfr", "vpll";
> >>>>> 	clock-names = "iahb", "isfr", "cec", "vpll";
> >>>>>
> >>>>> would all be valid.
> >>>>
> >>>> It would be painful then...
> >>>>
> >>>> The easiest way to do so would be to simply use an enum there, and not
> >>>> bother checking the array at all. You'll get a warning if there's
> >>>> multiple occurences of the same string, and I guess that's what you
> >>>> would be really concerned about.
> >>>>
> >>>> However, now that I think about it, what's the interaction between the
> >>>> generic binding and this one when it comes to the third clock? The
> >>>> generic one expects it to be cec, and here you have other options?
> >>>
> >>> I'm not too familiar with the platform, but as far as I understand, any
> >>> of the cec, grf and vpll clock is optional (if someone could confirm
> >>> that, it would be useful). I don't care so much about the order, but
> >>> iahb and isfr are mandatory, and thus need to be specified as two const
> >>> items in the beginning as far as I understand. It would be nice to set
> >>> something along the lines of
> >>>
> >>>   minItems: 2
> >>>   maxItems: 5
> >>>   items:
> >>>     - const: iahb
> >>>     - const: isfr
> >>>     - enum:
> >>>       - cec
> >>>       - grf
> >>>       - vpll
> >>
> >> I guess you could do something like:
> >>
> >> in the generic schema:
> >>
> >> clock-names:
> >>   allOf:
> >>     - minItems: 2
> >>     - enum:
> >>        - iahb
> >>        - isfr
> >>        - cec
> >>       additonalItems: true
> >>     - items:
> >>       - iahb
> >>       - isfr
> >>
> >> Or something along those lines, I haven't tested it, but the basic
> >> idea is that you want to enforce that:
> >>   a) there's a minimum of two clocks
> >>   b) valid clock names are iahb, isfr and cec, but we will allow more
> >>   c) the first two clocks are iahb and isfr
> >
> > Interesting idea. I've tried
> >
> >   clock-names:
> >     allOf:
> >       - minItems: 2
> >       - enum:
> >         - iahb
> >         - isfr
> >         - cec
> >         additionalItems: true
> >       - items:
> >         - const: iahb
> >         - const: isfr
> >
> > in the base synopsys,dw-hdmi.yaml schema, and
> >
> >   clock-names:
> >     maxItems: 2
> >
> > in renesas,dw-hdmi.yaml, which resulted in the following validation
> > errors:
> >
> > Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.example.dt.yaml: hdmi@fead0000: clock-names: ['iahb', 'isfr'] is too long
> >
> > This is caused by the enum entry.
> 
> What happens if you have instead of
> - enum:
>  ...
> 
> - items:
>     enum:
>       ...

That works, but if I then specify a cec clock in the example in
renesas,dw-hdmi.yaml, I get

Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.example.dt.yaml: hdmi@fead0000: clock-names: ['iahb', 'isfr', 'cec'] is too long
Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.example.dt.yaml: hdmi@fead0000: clock-names: Additional items are not allowed ('cec' was unexpected)

which is caused by

       - items:
         - const: iahb
         - const: isfr

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

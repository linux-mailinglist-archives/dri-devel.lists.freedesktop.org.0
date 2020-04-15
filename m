Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714ED1AA908
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B548E6E974;
	Wed, 15 Apr 2020 13:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A006E974
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:50:15 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62385208FE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586958615;
 bh=53nFtvqHdyIgnypxB2RMpy1E3WnulTpS940anTDT8/M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GuN9hmJH60vwU/dgm2fayA+8neORrahqcuLDYYBvzXKwBdLCu07hilcBV5damZoye
 rOW0oarkc679i09GzcdL/7n9kkoqFasX7jL3+TsuvLxHYhHCBsbDivBYJNTm4yT/cu
 J68/yNBTSuQohBn1nG2CHZi4AyMrg/yPG9STo8f8=
Received: by mail-qk1-f172.google.com with SMTP id g74so17142405qke.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 06:50:15 -0700 (PDT)
X-Gm-Message-State: AGi0PubGhlKBPFp+VPtCO2wWBedsMymcYgrFLHzRRrvYTaCwegqAS7UL
 UkOHQXmGaLDEA/MV+agc0KdyxyzLisn9GJix3g==
X-Google-Smtp-Source: APiQypJUnhFeABv9P0F814Z+p+B5Q4yhQFZZ9hVOY7koZh7lZJDfPlV3W5rtAhAuBySOBChpx4uaiKFo1iYLgHXov6Q=
X-Received: by 2002:a37:4a85:: with SMTP id
 x127mr26789090qka.152.1586958614150; 
 Wed, 15 Apr 2020 06:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-5-laurent.pinchart+renesas@ideasonboard.com>
 <20200406080032.zlszhkjqmjeoa4ti@gilmour.lan>
 <20200406111927.GD4757@pendragon.ideasonboard.com>
 <20200406170915.x2ztz4q446h6vx2y@gilmour.lan>
 <20200406175028.GI16885@pendragon.ideasonboard.com>
 <20200407071251.npibrmzywiyigu2a@gilmour.lan>
 <20200408114552.GC4881@pendragon.ideasonboard.com>
 <20200414231005.GA24462@bogus>
 <20200415010615.GZ19819@pendragon.ideasonboard.com>
In-Reply-To: <20200415010615.GZ19819@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Apr 2020 08:50:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKEnfK0BJMmb1XHNCkRYiAf7FVgRKdPpmcpz1TFvUU01g@mail.gmail.com>
Message-ID: <CAL_JsqKEnfK0BJMmb1XHNCkRYiAf7FVgRKdPpmcpz1TFvUU01g@mail.gmail.com>
Subject: Re: [PATCH/RFC 4/6] dt-bindings: display: rockchip: dw-hdmi: Convert
 binding to YAML
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 8:06 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Tue, Apr 14, 2020 at 06:10:05PM -0500, Rob Herring wrote:
> > On Wed, Apr 08, 2020 at 02:45:52PM +0300, Laurent Pinchart wrote:
> > > On Tue, Apr 07, 2020 at 09:12:51AM +0200, Maxime Ripard wrote:
> > >> On Mon, Apr 06, 2020 at 08:50:28PM +0300, Laurent Pinchart wrote:
> > >>> On Mon, Apr 06, 2020 at 07:09:15PM +0200, Maxime Ripard wrote:
> > >>>> On Mon, Apr 06, 2020 at 02:19:27PM +0300, Laurent Pinchart wrote:
> > >>>>> On Mon, Apr 06, 2020 at 10:00:32AM +0200, Maxime Ripard wrote:
> > >>>>>> On Mon, Apr 06, 2020 at 02:39:33AM +0300, Laurent Pinchart wrote:
> > >>>>>>> Convert the Rockchip HDMI TX text binding to YAML.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >>>>>>> ---
> > >>>>>>>  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
> > >>>>>>>  .../display/rockchip/rockchip,dw-hdmi.yaml    | 178 ++++++++++++++++++
> > >>>>>>>  2 files changed, 178 insertions(+), 74 deletions(-)
> > >>>>>>>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > >>>>>>>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > >>>>>>>
> > >>>>>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > >>>>>>> deleted file mode 100644
> > >>>>>>> index 3d32ce137e7f..000000000000
> > >>>>>>> --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > >>>>>>> +++ /dev/null
> > >>>>>>> @@ -1,74 +0,0 @@
> > >>>>>>> -Rockchip DWC HDMI TX Encoder
> > >>>>>>> -============================
> > >>>>>>> -
> > >>>>>>> -The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > >>>>>>> -with a companion PHY IP.
> > >>>>>>> -
> > >>>>>>> -These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> > >>>>>>> -Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> > >>>>>>> -following device-specific properties.
> > >>>>>>> -
> > >>>>>>> -
> > >>>>>>> -Required properties:
> > >>>>>>> -
> > >>>>>>> -- compatible: should be one of the following:
> > >>>>>>> -             "rockchip,rk3228-dw-hdmi"
> > >>>>>>> -             "rockchip,rk3288-dw-hdmi"
> > >>>>>>> -             "rockchip,rk3328-dw-hdmi"
> > >>>>>>> -             "rockchip,rk3399-dw-hdmi"
> > >>>>>>> -- reg: See dw_hdmi.txt.
> > >>>>>>> -- reg-io-width: See dw_hdmi.txt. Shall be 4.
> > >>>>>>> -- interrupts: HDMI interrupt number
> > >>>>>>> -- clocks: See dw_hdmi.txt.
> > >>>>>>> -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> > >>>>>>> -- ports: See dw_hdmi.txt. The DWC HDMI shall have a single port numbered 0
> > >>>>>>> -  corresponding to the video input of the controller. The port shall have two
> > >>>>>>> -  endpoints, numbered 0 and 1, connected respectively to the vopb and vopl.
> > >>>>>>> -- rockchip,grf: Shall reference the GRF to mux vopl/vopb.
> > >>>>>>> -
> > >>>>>>> -Optional properties
> > >>>>>>> -
> > >>>>>>> -- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
> > >>>>>>> -  or the functionally-reduced I2C master contained in the DWC HDMI. When
> > >>>>>>> -  connected to a system I2C master this property contains a phandle to that
> > >>>>>>> -  I2C master controller.
> > >>>>>>> -- clock-names: See dw_hdmi.txt. The "cec" clock is optional.
> > >>>>>>> -- clock-names: May contain "cec" as defined in dw_hdmi.txt.
> > >>>>>>> -- clock-names: May contain "grf", power for grf io.
> > >>>>>>> -- clock-names: May contain "vpll", external clock for some hdmi phy.
> > >>>>>>> -- phys: from general PHY binding: the phandle for the PHY device.
> > >>>>>>> -- phy-names: Should be "hdmi" if phys references an external phy.
> > >>>>>>> -
> > >>>>>>> -Optional pinctrl entry:
> > >>>>>>> -- If you have both a "unwedge" and "default" pinctrl entry, dw_hdmi
> > >>>>>>> -  will switch to the unwedge pinctrl state for 10ms if it ever gets an
> > >>>>>>> -  i2c timeout.  It's intended that this unwedge pinctrl entry will
> > >>>>>>> -  cause the SDA line to be driven low to work around a hardware
> > >>>>>>> -  errata.
> > >>>>>>> -
> > >>>>>>> -Example:
> > >>>>>>> -
> > >>>>>>> -hdmi: hdmi@ff980000 {
> > >>>>>>> -     compatible = "rockchip,rk3288-dw-hdmi";
> > >>>>>>> -     reg = <0xff980000 0x20000>;
> > >>>>>>> -     reg-io-width = <4>;
> > >>>>>>> -     ddc-i2c-bus = <&i2c5>;
> > >>>>>>> -     rockchip,grf = <&grf>;
> > >>>>>>> -     interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > >>>>>>> -     clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
> > >>>>>>> -     clock-names = "iahb", "isfr";
> > >>>>>>> -     ports {
> > >>>>>>> -             hdmi_in: port {
> > >>>>>>> -                     #address-cells = <1>;
> > >>>>>>> -                     #size-cells = <0>;
> > >>>>>>> -                     hdmi_in_vopb: endpoint@0 {
> > >>>>>>> -                             reg = <0>;
> > >>>>>>> -                             remote-endpoint = <&vopb_out_hdmi>;
> > >>>>>>> -                     };
> > >>>>>>> -                     hdmi_in_vopl: endpoint@1 {
> > >>>>>>> -                             reg = <1>;
> > >>>>>>> -                             remote-endpoint = <&vopl_out_hdmi>;
> > >>>>>>> -                     };
> > >>>>>>> -             };
> > >>>>>>> -     };
> > >>>>>>> -};
> > >>>>>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > >>>>>>> new file mode 100644
> > >>>>>>> index 000000000000..8ff544ae0ac2
> > >>>>>>> --- /dev/null
> > >>>>>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > >>>>>>> @@ -0,0 +1,178 @@
> > >>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >>>>>>> +%YAML 1.2
> > >>>>>>> +---
> > >>>>>>> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
> > >>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>>>>>> +
> > >>>>>>> +title: Rockchip DWC HDMI TX Encoder
> > >>>>>>> +
> > >>>>>>> +maintainers:
> > >>>>>>> +  - Mark Yao <mark.yao@rock-chips.com>
> > >>>>>>> +
> > >>>>>>> +description: |
> > >>>>>>> +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > >>>>>>> +  with a companion PHY IP.
> > >>>>>>> +
> > >>>>>>> +allOf:
> > >>>>>>> +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> > >>>>>>> +
> > >>>>>>> +properties:
> > >>>>>>> +  compatible:
> > >>>>>>> +    enum:
> > >>>>>>> +      - rockchip,rk3228-dw-hdmi
> > >>>>>>> +      - rockchip,rk3288-dw-hdmi
> > >>>>>>> +      - rockchip,rk3328-dw-hdmi
> > >>>>>>> +      - rockchip,rk3399-dw-hdmi
> > >>>>>>> +
> > >>>>>>> +  reg: true
> > >>>>>>> +
> > >>>>>>> +  reg-io-width:
> > >>>>>>> +    const: 4
> > >>>>>>> +
> > >>>>>>> +  clocks:
> > >>>>>>> +    minItems: 2
> > >>>>>>> +    maxItems: 5
> > >>>>>>> +    items:
> > >>>>>>> +      - description: The bus clock for either AHB and APB
> > >>>>>>> +      - description: The internal register configuration clock
> > >>>>>>> +      - description: The HDMI CEC controller main clock
> > >>>>>>> +      - description: Power for GRF IO
> > >>>>>>> +      - description: External clock for some HDMI PHY
> > >>>>>>> +
> > >>>>>>> +  clock-names:
> > >>>>>>> +    minItems: 2
> > >>>>>>> +    maxItems: 5
> > >>>>>>> +    items:
> > >>>>>>> +      - const: iahb
> > >>>>>>> +      - const: isfr
> > >>>>>>> +      - enum:
> > >>>>>>> +        - cec
> > >>>>>>> +        - grf
> > >>>>>>> +        - vpll
> > >>>>>>> +      - enum:
> > >>>>>>> +        - cec
> > >>>>>>> +        - grf
> > >>>>>>> +        - vpll
> > >>>>>>> +      - enum:
> > >>>>>>> +        - cec
> > >>>>>>> +        - grf
> > >>>>>>> +        - vpll
> > >>>>>>
> > >>>>>> IIRC Rob wanted us to standardize the order of the clocks if possible,
> > >>>>>> since it's a pain to support properly here, and your description won't
> > >>>>>> match what you describe here either (and in general it's just a best
> > >>>>>> practice), so if all your DTs have the same order you should just set
> > >>>>>> that order in stone.
> > >>>>>
> > >>>>> But how do we handle the case where any of the cec, grf and vpll clocks
> > >>>>> can be set ? Assuming, for instance, that
> > >>>>>
> > >>>>>         clock-names = "iahb", "isfr", "cec";
> > >>>>>         clock-names = "iahb", "isfr", "vpll";
> > >>>>>         clock-names = "iahb", "isfr", "cec", "vpll";
> > >>>>>
> > >>>>> would all be valid.
> > >>>>
> > >>>> It would be painful then...
> > >>>>
> > >>>> The easiest way to do so would be to simply use an enum there, and not
> > >>>> bother checking the array at all. You'll get a warning if there's
> > >>>> multiple occurences of the same string, and I guess that's what you
> > >>>> would be really concerned about.
> > >>>>
> > >>>> However, now that I think about it, what's the interaction between the
> > >>>> generic binding and this one when it comes to the third clock? The
> > >>>> generic one expects it to be cec, and here you have other options?
> > >>>
> > >>> I'm not too familiar with the platform, but as far as I understand, any
> > >>> of the cec, grf and vpll clock is optional (if someone could confirm
> > >>> that, it would be useful). I don't care so much about the order, but
> > >>> iahb and isfr are mandatory, and thus need to be specified as two const
> > >>> items in the beginning as far as I understand. It would be nice to set
> > >>> something along the lines of
> > >>>
> > >>>   minItems: 2
> > >>>   maxItems: 5
> > >>>   items:
> > >>>     - const: iahb
> > >>>     - const: isfr
> > >>>     - enum:
> > >>>       - cec
> > >>>       - grf
> > >>>       - vpll
> > >>
> > >> I guess you could do something like:
> > >>
> > >> in the generic schema:
> > >>
> > >> clock-names:
> > >>   allOf:
> > >>     - minItems: 2
> > >>     - enum:
> > >>        - iahb
> > >>        - isfr
> > >>        - cec
> > >>       additonalItems: true
> > >>     - items:
> > >>       - iahb
> > >>       - isfr
> > >>
> > >> Or something along those lines, I haven't tested it, but the basic
> > >> idea is that you want to enforce that:
> > >>   a) there's a minimum of two clocks
> > >>   b) valid clock names are iahb, isfr and cec, but we will allow more
> > >>   c) the first two clocks are iahb and isfr
> > >
> > > Interesting idea. I've tried
> > >
> > >   clock-names:
> > >     allOf:
> > >       - minItems: 2
> > >       - enum:
> > >         - iahb
> > >         - isfr
> > >         - cec
> > >         additionalItems: true
> >
> > Instead of these 2, you want:
> >
> > items:
> >   enum: [ iahb, isfr, cec ]
> > minItems: 2
> > maxItems: 3
> >
> > Though I assume there's some others missing as with this and below, the
> > 3rd clock can only be 'cec'.
>
> But with this bindings that include this base schema and extend the
> number of clocks will not validate :-( I'd like a way for the base
> schema to provide an overridable check, but I don't think that's
> possible. I then tried to specify a check that would be valid for
> extensions too, and that would verify that

But this is not the base schema?

> - There are at least two clocks and maybe more (that should be easy by
>   setting minItems: 2 and leaving maxItems unspecified, but the
>   dt-validate tool then adds a maxItems automatically :-()

That's to avoid boilerplate in the vast majority of cases.

Can't you just do 'maxItems: 1000' or some sane limit?

>
> - The first two clock names are 'iahb' and 'isfr', and additional clock
>   names can be anything.

So, in the base schema:

items:
  - const: iahb
  - const: isfr
minItems: 2
maxItems: 10
additionalItems: true

In the device schema you can do something like:

items:
  - {}
  - {}
  - enum: [ a, b, c ]
  - enum: [ a, b, c ]

If there's no order of the last items. Or you can use the schema
flavor (rather than list) of 'items' and list iahb and isfr again.

> Maybe YAML schemas can't support this, and I need to specify all
> constraints explicitly in derived bindings ? The base
> bridge/synopsys,dw-hdmi.yaml file would then be dropped completely, with
> its contents copied to derived bindings. Or maybe I should selectively
> include rules from the base schema in rockchip,dw-hdmi.yaml ? That's not
> very user-friendly though.

You could get into using definitions and referencing those
individually, but I wouldn't recommend it.

My hope is in new bindings the difficulty in expressing all the schema
variations will prevent some of this needless variation. The reality
is for the same IP block, the clocks and other resources shouldn't
vary so much. :)

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

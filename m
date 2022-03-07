Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB484D0500
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 18:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C26010E0B6;
	Mon,  7 Mar 2022 17:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC6710E0D4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 17:10:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65AC951C;
 Mon,  7 Mar 2022 18:10:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646673056;
 bh=hPqdb7olEWnqiNRqjAujSZ3gHfvXUdS7jjQtpXwqhxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E+M5NqeW5SnGfeR2GkHOwFbrK8C1VrUVBjiYg5RH2kljzGFf5zIUGesuVPjiLumi/
 sGJ5NyJqqA2kxXYIG44zO2M5doFnYrr8wvYEughyBVEuxLOJ6yRSq1bRmXIaSUqNRb
 W3Mg7BiY3QMhJK+pBQ7bl7XbkV8AaRe6zgS10+18=
Date: Mon, 7 Mar 2022 19:10:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
Message-ID: <YiY8ko5WX3mQfDLY@pendragon.ideasonboard.com>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-2-robert.foss@linaro.org>
 <YiY1CP6DkfgU4re/@robh.at.kernel.org>
 <CAG3jFyssPxuRXzZsZkVHWrSS8b6pRHRRmpZCTvLmDV-t2CDA1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG3jFyssPxuRXzZsZkVHWrSS8b6pRHRRmpZCTvLmDV-t2CDA1g@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com, xji@analogixsemi.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 05:57:47PM +0100, Robert Foss wrote:
> On Mon, 7 Mar 2022 at 17:38, Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Mar 07, 2022 at 04:45:57PM +0100, Robert Foss wrote:
> > > This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.
> >
> > S-o-b and reason for the revert?
> >
> > > ---
> > >  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
> > >  1 file changed, 2 insertions(+), 63 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index 1d3e88daca041..ab48ab2f4240d 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -43,70 +43,14 @@ properties:
> > >    vdd33-supply:
> > >      description: Regulator that provides the supply 3.3V power.
> > >
> > > -  analogix,lane0-swing:
> > > -    $ref: /schemas/types.yaml#/definitions/uint8-array
> > > -    minItems: 1
> > > -    maxItems: 20
> > > -    description:
> > > -      an array of swing register setting for DP tx lane0 PHY.
> > > -      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> > > -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> > > -      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
> > > -      [Swing control] setting.
> > > -      Registers 0~9, bit 3:0 is [Boost control], these bits control
> > > -      post cursor manual, increase the [Boost control] to increase
> > > -      Pre-emphasis value.
> > > -      Registers 0~9, bit 6:4 is [Swing control], these bits control
> > > -      swing manual, increase [Swing control] setting to add Vp-p value
> > > -      for each Swing, Pre.
> > > -      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> > > -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> > > -      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
> > > -      [R Termination control] setting.
> > > -      Registers 10~19, bit 4:0 is [R select control], these bits are
> > > -      compensation manual, increase it can enhance IO driven strength
> > > -      and Vp-p.
> > > -      Registers 10~19, bit 5:6 is [R termination control], these bits
> > > -      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
> > > -      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
> > > -
> > > -  analogix,lane1-swing:
> > > -    $ref: /schemas/types.yaml#/definitions/uint8-array
> > > -    minItems: 1
> > > -    maxItems: 20
> > > -    description:
> > > -      an array of swing register setting for DP tx lane1 PHY.
> > > -      DP TX lane1 swing register setting same with lane0
> > > -      swing, please refer lane0-swing property description.
> >
> > These apply to the DP side, so no need to revert this part.
> 
> Ack.
> 
> >
> > > -
> > > -  analogix,audio-enable:
> > > -    type: boolean
> > > -    description: let the driver enable audio HDMI codec function or not.
> > > -
> >
> > Not sure on this one...
> 
> These additions are independent from my reading of this, would you
> like a v2 with only the bus-type related changes reverted?
> 
> >
> > >    ports:
> > >      $ref: /schemas/graph.yaml#/properties/ports
> > >
> > >      properties:
> > >        port@0:
> > > -        $ref: /schemas/graph.yaml#/$defs/port-base
> > > -        unevaluatedProperties: false
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > >          description:
> > > -          MIPI DSI/DPI input.
> > > -
> > > -        properties:
> > > -          endpoint:
> > > -            $ref: /schemas/media/video-interfaces.yaml#
> > > -            type: object
> > > -            additionalProperties: false
> > > -
> > > -            properties:
> > > -              remote-endpoint: true
> > > -
> > > -              bus-type:
> > > -                enum: [1, 5]
> >
> > I think the error here is really 1 should be 4 which corresponds to
> > D-PHY which is used by both CSI and DSI. Otherwise, I don't really see
> > the issue with bus-type being shared between CSI and DSI.
> 
> I think that would be a correct solution. And ignoring everything
> else, the range of this property is something that should be fixed.
> 
> But that would mean that CPI (camera parallel interface) and DPI
> (display parallel interface) would share the
> V4L2_FWNODE_BUS_TYPE_PARALLEL enum. I think that would be perfectly
> functional, but it is not what V4L2_FWNODE_BUS_TYPE_PARALLEL is
> documented to represent. As far as I can see it's only intended to
> represent CPI.

Are you aware of any standard documenting camera parallel interfaces
with separate sync signals ? I was looking for that the other day, and
couldn't find much. CPI seems to be an old MIPI standard, but I couldn't
find any public document, I'not not sure if it actually matches.

Another common parallel interface in SoCs is AXI4 Stream, which we will
likely need a bus type for. We'll then have to decide on how to handle
on-SoC custom parallel buses.

> Instead of having V4L2_FWNODE_BUS_TYPE_PARALLEL represent two
> standards, I think they should be split. And possibly
> V4L2_FWNODE_BUS_TYPE_PARALLEL should be renamed for CPI, but that is a
> separate story. This would provide for the neatest and most legible
> solution. If this solution is implemented, this range would be
> incorrect. Additionally the snippet reverted in 2/2 of this series
> would no longer be valid.
> 
> As it stands V4L2_FWNODE_BUS_TYPE_PARALLEL was used to represent DPI
> due to not being caught in the review process.

We may end up using those values, but I think it should be discussed and
not rushed in v5.17 if possible.

> > > -                default: 1
> > > -
> > > -              data-lanes: true
> > > +          Video port for MIPI DSI input.
> > >
> > >        port@1:
> > >          $ref: /schemas/graph.yaml#/properties/port
> > > @@ -143,9 +87,6 @@ examples:
> > >              vdd10-supply = <&pp1000_mipibrdg>;
> > >              vdd18-supply = <&pp1800_mipibrdg>;
> > >              vdd33-supply = <&pp3300_mipibrdg>;
> > > -            analogix,audio-enable;
> > > -            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> > > -            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> > >
> > >              ports {
> > >                  #address-cells = <1>;
> > > @@ -155,8 +96,6 @@ examples:
> > >                      reg = <0>;
> > >                      anx7625_in: endpoint {
> > >                          remote-endpoint = <&mipi_dsi>;
> > > -                        bus-type = <5>;
> > > -                        data-lanes = <0 1 2 3>;
> > >                      };
> > >                  };
> > >
> > > --
> > > 2.32.0
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

-- 
Regards,

Laurent Pinchart

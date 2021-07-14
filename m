Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264A3C802D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874B86E1B2;
	Wed, 14 Jul 2021 08:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7096E1B2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:32:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF960CC;
 Wed, 14 Jul 2021 10:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1626251556;
 bh=jKDxdCR/47jG5iunXdfBy5N82ZjyM5+IZvoSipRRYFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPwRm6krENd5glAHM+t2YcpCx17rA11v9T9jJBX0LtPAeALZMivtNOUYAnT1Pk0Qv
 j88ETcxfAbZ4gBvsmbOPh1tIma46LxIt8CAAFrx6lWEfrlsr2zgGA6+IxV3IpEg7S8
 exLHrb8bHdW05GPVPTC4gWiKsNxE/bGFLoFIk7tE=
Date: Wed, 14 Jul 2021 11:32:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v9 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <YO6hIzlOuMsDXztW@pendragon.ideasonboard.com>
References: <cover.1624349479.git.xji@analogixsemi.com>
 <308427448195e2db37a32997c6d32905c96ca876.1624349480.git.xji@analogixsemi.com>
 <CAG3jFys6D=-L-Aez4aWuE4nM7qJCtn4wPws3TKxbkRzcAoFR0A@mail.gmail.com>
 <20210707073051.GA936385@anxtwsw-Precision-3640-Tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210707073051.GA936385@anxtwsw-Precision-3640-Tower>
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
Cc: Nicolas Boichat <drinkcat@google.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bernie Liang <bliang@analogixsemi.com>,
 Sheng Pan <span@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin,

On Wed, Jul 07, 2021 at 03:30:51PM +0800, Xin Ji wrote:
> On Thu, Jun 24, 2021 at 01:57:22PM +0200, Robert Foss wrote:
> > Hey Xin,
> > 
> > I would like to merge this series now, but this patch needs a review
> > first. Maybe Laurent/Rob Herring are good candidates.
>
> Hi Rob, I get Laurent/Rob comments before, and explained why we needs
> these DT properties, so far, I didn't get any response.
> 
> Hi Rob Herring and Laurent, for the DT property lane0/1-swing, Google
> engineer has strong demond for them, they don't want to move DP swing
> adjusting to kernel, thus may cause change the driver code in each
> project, so config them in DT is a best option.

Hardcoding it in the driver is certainly not a good option, but
hardcoding it in DT isn't either unless you can explain how the value
should be computed. "Contact the vendor" isn't good enough.

> > On Tue, 22 Jun 2021 at 14:31, Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> > > lane1 swing register array define, and audio enable flag.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  .../display/bridge/analogix,anx7625.yaml      | 57 ++++++++++++++++++-
> > >  1 file changed, 56 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index ab48ab2f4240..9e604d19a3d5 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -43,6 +43,26 @@ properties:
> > >    vdd33-supply:
> > >      description: Regulator that provides the supply 3.3V power.
> > >
> > > +  analogix,lane0-swing:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    minItems: 1
> > > +    maxItems: 20
> > > +    description:
> > > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > > +      add this property, or contact vendor.
> > > +
> > > +  analogix,lane1-swing:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    minItems: 1
> > > +    maxItems: 20
> > > +    description:
> > > +      an array of swing register setting for DP tx lane1 PHY, please don't
> > > +      add this property, or contact vendor.
> > > +
> > > +  analogix,audio-enable:
> > > +    type: boolean
> > > +    description: let the driver enable audio HDMI codec function or not.
> > > +
> > >    ports:
> > >      $ref: /schemas/graph.yaml#/properties/ports
> > >
> > > @@ -50,13 +70,43 @@ properties:
> > >        port@0:
> > >          $ref: /schemas/graph.yaml#/properties/port
> > >          description:
> > > -          Video port for MIPI DSI input.
> > > +          MIPI DSI/DPI input.
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            type: object
> > > +            additionalProperties: false
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +              bus-type: true
> > > +              data-lanes: true
> > > +
> > > +            required:
> > > +              - remote-endpoint
> > > +
> > > +        required:
> > > +          - endpoint
> > > +
> > >
> > >        port@1:
> > >          $ref: /schemas/graph.yaml#/properties/port
> > >          description:
> > >            Video port for panel or connector.
> > >
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            type: object
> > > +            additionalProperties: false
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +            required:
> > > +              - remote-endpoint
> > > +
> > >      required:
> > >        - port@0
> > >        - port@1
> > > @@ -87,6 +137,9 @@ examples:
> > >              vdd10-supply = <&pp1000_mipibrdg>;
> > >              vdd18-supply = <&pp1800_mipibrdg>;
> > >              vdd33-supply = <&pp3300_mipibrdg>;
> > > +            analogix,audio-enable;
> > > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > >
> > >              ports {
> > >                  #address-cells = <1>;
> > > @@ -96,6 +149,8 @@ examples:
> > >                      reg = <0>;
> > >                      anx7625_in: endpoint {
> > >                          remote-endpoint = <&mipi_dsi>;
> > > +                        bus-type = <5>;
> > > +                        data-lanes = <0 1 2 3>;
> > >                      };
> > >                  };
> > >

-- 
Regards,

Laurent Pinchart

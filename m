Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D1B1273CD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 04:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C00F6EBC7;
	Fri, 20 Dec 2019 03:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7B46EBC7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 03:22:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3794E97D;
 Fri, 20 Dec 2019 04:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576812171;
 bh=GbjWOXoHbTc7o/70pzRDyb6harPQRgq/1uJqetbyvEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eiD5P2Vs/QXwTU749YgX3ffncRsvHu/csSN90zm5CA5+AlOF58zlIMNsA70unsJOI
 eTeBk6rzNvZ3sY8nTxruTgXtU/2o65/rPpx0hz333tRbfP07RPFYLk3YE47zhV77oV
 Maus3i0cm/+PvRN9WVjB48J3KzFdIMLu27tzAQBE=
Date: Fri, 20 Dec 2019 05:22:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688:
 Add ANX7688 transmitter binding
Message-ID: <20191220032238.GA5342@pendragon.ideasonboard.com>
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-2-hsinyi@chromium.org>
 <20191219204524.GA7841@bogus>
 <CAJMQK-gYFJ-F9_rkPsxXS+qc40OwU-di2tdLLbL7x=smbRNujw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJMQK-gYFJ-F9_rkPsxXS+qc40OwU-di2tdLLbL7x=smbRNujw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

On Fri, Dec 20, 2019 at 11:20:13AM +0800, Hsin-Yi Wang wrote:
> On Fri, Dec 20, 2019 at 4:45 AM Rob Herring wrote:
> > On Wed, Dec 11, 2019 at 02:19:08PM +0800, Hsin-Yi Wang wrote:
> > > From: Nicolas Boichat <drinkcat@chromium.org>
> > >
> > > Add support for analogix,anx7688
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > > Change from RFC to v1:
> > > - txt to yaml
> > > ---
> > >  .../bindings/display/bridge/anx7688.yaml      | 60 +++++++++++++++++++
> > >  1 file changed, 60 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > > new file mode 100644
> > > index 000000000000..cf79f7cf8fdf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/anx7688.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Analogix ANX7688 SlimPort (Single-Chip Transmitter for DP over USB-C)
> > > +
> > > +maintainers:
> > > +  - Nicolas Boichat <drinkcat@chromium.org>
> > > +
> > > +description: |
> > > +  The ANX7688 is a single-chip mobile transmitter to support 4K 60 frames per
> > > +  second (4096x2160p60) or FHD 120 frames per second (1920x1080p120) video
> > > +  resolution from a smartphone or tablet with full function USB-C.
> > > +
> > > +  This binding only describes the HDMI to DP display bridge.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: analogix,anx7688
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: I2C address of the device
> > > +
> > > +  ports:
> > > +    type: object
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: |
> > > +          Video port for HDMI input
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: |
> > > +          Video port for eDP output
> > > +
> > > +    required:
> > > +      - port@0
> >
> > Sometimes you have no output?
>
> Yes, only input is required.

But what happens in that case ? What's the use of a bridge with a
non-connected output ? :-)

> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - ports
> >
> > The example will have errors because it is missing 'ports'. Run 'make
> > dt_binding_check'.
> >
> > Add:
> >
> > additionalProperties: false
> >
>
> Ack, will fix this. Thanks
>
> > > +
> > > +examples:
> > > +  - |
> > > +    anx7688: anx7688@2c {
> > > +      compatible = "analogix,anx7688";
> > > +      reg = <0x2c>;
> > > +
> > > +      port {
> > > +        anx7688_in: endpoint {
> > > +          remote-endpoint = <&hdmi0_out>;
> > > +        };
> > > +      };
> > > +    };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

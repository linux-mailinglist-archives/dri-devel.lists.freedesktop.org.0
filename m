Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8C188726
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E706E188;
	Tue, 17 Mar 2020 14:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA386E049
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 09:02:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 293E45800B4;
 Tue, 17 Mar 2020 05:02:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 17 Mar 2020 05:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=zhHB8h7bTVR4wxZZdCUYZN5849w
 m/LRx5+CuFE0aeeQ=; b=YhTkGFeCQiXpx5LbN7kBXi+HjYEHrbvvfTQpYetQ+F1
 qiv2/wPyZsHdHpcndM38/OuErDVTn8wVhaNX/VwRUIrQDfE58UTPVrWXHSaDCUfT
 5v/PSh2Qx2rxKOXnmToI22ZdfAhBx8+bvCw+ma4MCF0N9/wJG8fvGwttFUYyzmKE
 bU1qW8QObsCtrTkScyy9PyQolBmtGiKJNqq1IbRFyzRFCPQ73piCua43rcs8LCwK
 Xk5lnzg9d2LyIMCvJzg1XwpowGCWbdMqwlps9yul0KG7UTCiEJBdtRduXLbL0Uy1
 tXNYIg1S7XsQYHDGEwVZ/gl1aQrHgkZmtzN0a/4HnNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zhHB8h
 7bTVR4wxZZdCUYZN5849wm/LRx5+CuFE0aeeQ=; b=opEWyHLQFZfZVilvfsNRYi
 DKkrrQ3tX17VJlL9KHdQR7t9wB1VzojokFWOXxdYlnXOOXfLAfOjCDdH7rN40V42
 xzY1ZhbiaRoRkZNHpR2K+qCMeuJ9mlUVwsVn+/sQ1vJF4WgfTH1FIS5cfz9UZlvd
 K/u9uhYRj9XdGQfND3Nup2kvy54bVv6MnnJOMHYs63ptaR29agQCDzZmSgpgO6HU
 pUuLltq278srlfRLz28PCzGCy8G1dvp6AIqYvXfIYzQzhziA8RenyBJC8qSNgWuN
 wZTwK3JnxgdgQFNgbUoQJMia5mWW1VQFOEvyOc6nj6snvOK26H+OuLQrm2GDQ1iw
 ==
X-ME-Sender: <xms:NZJwXtU87lqVjulK0mWc6F1ZBwsFPG5D8jazZzncIT3cmWYoCCLqFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefgedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
 dtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NZJwXuVN5s3HEita2_d9eG0M8yyIQ0Sc62u7_QWiqiTSBzMhcnbS4g>
 <xmx:NZJwXiQY7CeL1sIFSb3tElOORHcfmtdmN5lTvSZHuxxIVLp7Rqj7NA>
 <xmx:NZJwXoM1Bdx3gEz4zy_OveF_Zi7zjUZtkV0IqujdqqYRW2QuUVTi7w>
 <xmx:OZJwXu1r4YngpRKIaNu56-Rlnd3FfYRhfP51NkK_9-D0cxcqaQl-4A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D14A3280060;
 Tue, 17 Mar 2020 05:02:45 -0400 (EDT)
Date: Tue, 17 Mar 2020 10:02:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 02/36] dt-bindings: spi: support non-spi bindings as
 SPI slaves
Message-ID: <20200317090244.jmucfw5pkxzrce7e@gilmour.lan>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-3-sam@ravnborg.org>
 <20200316204850.gggeyjulgiy53i7x@gilmour.lan>
 <20200316214346.GA23637@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200316214346.GA23637@ravnborg.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: multipart/mixed; boundary="===============1003636669=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1003636669==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="56oevq6iibsekfv4"
Content-Disposition: inline


--56oevq6iibsekfv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Mar 16, 2020 at 10:43:46PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 16, 2020 at 09:48:50PM +0100, Maxime Ripard wrote:
> > Hi Sam,
> >
> > On Sun, Mar 15, 2020 at 02:43:42PM +0100, Sam Ravnborg wrote:
> > > Independent bindings can be SPI slaves which for example is
> > > the case for several panel bindings.
> > >
> > > Move SPI slave properties to spi-slave.yaml so the independent
> > > SPI slave bindings can include spi-slave.yaml rather than
> > > duplicating the properties.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: linux-spi@vger.kernel.org
> > > ---
> > >  .../bindings/spi/spi-controller.yaml          | 63 +-------------
> > >  .../devicetree/bindings/spi/spi-slave.yaml    | 83 +++++++++++++++++++
> > >  2 files changed, 86 insertions(+), 60 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/spi/spi-slave.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> > > index 1e0ca6ccf64b..99531c8d10dd 100644
> > > --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> > > @@ -67,71 +67,14 @@ patternProperties:
> > >    "^.*@[0-9a-f]+$":
> > >      type: object
> > >
> > > +    allOf:
> > > +      - $ref: spi-slave.yaml#
> > > +
> > >      properties:
> > >        compatible:
> > >          description:
> > >            Compatible of the SPI device.
> > >
> > > -      reg:
> > > -        minimum: 0
> > > -        maximum: 256
> > > -        description:
> > > -          Chip select used by the device.
> > > -
> > > -      spi-3wire:
> > > -        $ref: /schemas/types.yaml#/definitions/flag
> > > -        description:
> > > -          The device requires 3-wire mode.
> > > -
> > > -      spi-cpha:
> > > -        $ref: /schemas/types.yaml#/definitions/flag
> > > -        description:
> > > -          The device requires shifted clock phase (CPHA) mode.
> > > -
> > > -      spi-cpol:
> > > -        $ref: /schemas/types.yaml#/definitions/flag
> > > -        description:
> > > -          The device requires inverse clock polarity (CPOL) mode.
> > > -
> > > -      spi-cs-high:
> > > -        $ref: /schemas/types.yaml#/definitions/flag
> > > -        description:
> > > -          The device requires the chip select active high.
> > > -
> > > -      spi-lsb-first:
> > > -        $ref: /schemas/types.yaml#/definitions/flag
> > > -        description:
> > > -          The device requires the LSB first mode.
> > > -
> > > -      spi-max-frequency:
> > > -        $ref: /schemas/types.yaml#/definitions/uint32
> > > -        description:
> > > -          Maximum SPI clocking speed of the device in Hz.
> > > -
> > > -      spi-rx-bus-width:
> > > -        allOf:
> > > -          - $ref: /schemas/types.yaml#/definitions/uint32
> > > -          - enum: [ 1, 2, 4, 8 ]
> > > -          - default: 1
> > > -        description:
> > > -          Bus width to the SPI bus used for MISO.
> > > -
> > > -      spi-rx-delay-us:
> > > -        description:
> > > -          Delay, in microseconds, after a read transfer.
> > > -
> > > -      spi-tx-bus-width:
> > > -        allOf:
> > > -          - $ref: /schemas/types.yaml#/definitions/uint32
> > > -          - enum: [ 1, 2, 4, 8 ]
> > > -          - default: 1
> > > -        description:
> > > -          Bus width to the SPI bus used for MOSI.
> > > -
> > > -      spi-tx-delay-us:
> > > -        description:
> > > -          Delay, in microseconds, after a write transfer.
> > > -
> >
> > I can see what you're trying to do, but you don't really need to.
> >
> > All the SPI devices will be declared under a spi controller node that
> > will validate its child nodes (and thus the devices) already.
>
> This was the missing piece - thanks.
> And as Mark put it "why is this suddenly an issue"?
> Turns out this is already properly handled and I made up an issue.
> Maybe Mark tried to explian it to me already...

Yeah, the schemas multi-layering thing is pretty difficult to get used
to :)

> >
> > Doing it this way would actually make all the checks happen twice,
> > once as part of the SPI controller, once as part of the SPI device
> > binding, without any good reason.
>
> I had focus on validating the example in the binding
> file and not the full picture.
>
> One thing I do not see properly addressed, but maybe I just miss it.
> What triggers that we catch properties that are not supposed to be
> present?
>
> If we see a unsupported property "foobar":
>
> spi {
>     ...
>     panel {
>        ....
>        foobar = <1>;
>     };
> };
>
> somewhere in a SPI slave binding we should catch this.
> If for no other reasons that it could be a simple spelling mistake
> that otherwise could go undetected for a long time.
> But maybe this is really not feasible to do?

So you have multiple things here you can do.

Like I said, the schemas are all run as some kind of layers, and each
schema must validate, so you'll want to make a schema that will
validate only what's it supposed to be validating.

Let's use your SPI panel as an example. The SPI controller schema has
a description of what a controller is supposed to look like, and the
properties that are useful to that controller in the devices (things
like the chip-select number, phase settings, etc).

However, at the controller level, you have no idea what devices are
connected, and thus you cannot limit the number of properties a child
is going to have.

The second layer that comes in is the device binding itself. Here,
you'll know what the device itself needs, but you don't really care
about the SPI controller setting itself, since you could have pretty
much each combination in various DTs.

The main property to restrict the allowed properties is
additionalProperties, and setting it to false will raise an error for
each property encountered that isn't part of the *current*
schema. This means that we can't set it for the spi controller
binding, and we would need to duplicate the list of all the generic
SPI properties in each and every binding to avoid spurious error
messages: this is not really ideal, but some (early) schemas are doing
this.

The next spec of the schema language introduces a new property though
that is unevaluatedProperties, which works pretty much like
additionalProperties, but will emit an error only if no schema defines
it. Like I said, the library implementing the schema validation logic
doesn't implement that new spec yet, but the tools allow that property
to be set (but it's ignored). It would be best to simply use
unevaluatedProperties in your panel patch, and when the tools will be
updated you'll get the behaviour you want.

Maxime

--56oevq6iibsekfv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnCSMwAKCRDj7w1vZxhR
xQpBAQCzJQpBBdk2qaPu4qnorbl8NuYMcRaciNqgdZamW5q/RwD+PBN6+gHkJfCD
qcUMZw1ZhBg+hyE3e1klr2RL+Dj9Fwo=
=0O15
-----END PGP SIGNATURE-----

--56oevq6iibsekfv4--

--===============1003636669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1003636669==--

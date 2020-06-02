Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD001ECA26
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779156E4E8;
	Wed,  3 Jun 2020 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BCE89612
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 15:08:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 52D3558029D;
 Tue,  2 Jun 2020 11:08:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Jun 2020 11:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=gy1oFJKqpBP4SByoQQwaUJAvM+9
 w8yd8uHa/7cqBJYw=; b=Oz9Xqz55njCGiEvASU5op28H1HwHkjvsX30FAklJvnC
 9SRwNgp+FAsmWDWl2eGPl/wwn2wX8iyHIIDpUhDjbxB7ek8aBGBEgqPApx01cJee
 ow72sBBRgkWLGsHHvtuUDxH3cgPp6vZ2IhNqhLL/RB3IOIzbyV8SRrB7FgtHxmux
 mm8q7dyytgf0taBIKSlN4wXh7c9VEwqrVND5Rb52ANfnDzAPAmnWONIEcR1OaMfs
 bnND44Y8qXvtXYaTllhuRgGaRpRw374gEZ1kilfWmxUfh4oxYDidSUTI3aSeDI5y
 Yk/rNyvw7halECPY0JtZEUNQBHLZCoI2suQFBvap7Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gy1oFJ
 KqpBP4SByoQQwaUJAvM+9w8yd8uHa/7cqBJYw=; b=bJM6OPVoNRNPTageBFCxr/
 IN/eDOTiB/u5xeOBUfJZ7dPocqBHKKQmsp7LkdPM4o027HNQoJNFV8UzNnHkhimN
 hwAAwp9IxdEKn5yUNVDVqqEbXV9qo3w8/pCScjiyZmSQIH9N1IpBRoP8ZNuLifP2
 z78jC9+XbmPYa87Ae5US+movKmAI8Pir0IYmv9XPaMdWcg6pm+5SFud3raTOhv/2
 JI2A8GQ+hQQceElacAMzKPp6ZEVUvdgLQfqSf9TjG2O2Lgmw6dKfhZ9sZo683m2p
 y1Mc+GDYcbkqivtCnyEXJs1qHBUwCuobPgB4wcBf1l3zcz7UhsAka2b3+PNwNYFg
 ==
X-ME-Sender: <xms:c2vWXkhdVEW6ST4sMVFQgmKUTFTvuPer01RwFoKyAodm4pEC_tk76A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepffetteevieejteeuhfffgeektefghfeileehhedtuddutefhhfejtddvtddu
 ledvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:c2vWXtCDEAcKfSgqwYDZX7tjB7rLCyk7f6fK6F2QNuL4qtIuAbF7TQ>
 <xmx:c2vWXsFXlbOKzrCYCsFvwq4O5GZ-ck9CYfRuifQYUyM_3Hm0ZbjU3A>
 <xmx:c2vWXlQvPSwwrNNBVCFjU57a4PX_szp_kzAzcH61aCULz3_pjaSXHw>
 <xmx:dGvWXomyvR5ShMrCKL5WanwF1A69eGDNVxpMFlapZCgrDvWRLw219Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 119FE30614FA;
 Tue,  2 Jun 2020 11:08:34 -0400 (EDT)
Date: Tue, 2 Jun 2020 17:08:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 104/105] dt-bindings: display: vc4: hdmi: Add BCM2711
 HDMI controllers bindings
Message-ID: <20200602150834.6xovwdxpgncq3ybh@gilmour>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <e85e24a494a3ff41177c94673ced0f4280b6a0ee.1590594512.git-series.maxime@cerno.tech>
 <20200529181833.GA2685451@bogus>
MIME-Version: 1.0
In-Reply-To: <20200529181833.GA2685451@bogus>
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0721037176=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0721037176==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="idttynnu6hrdagv3"
Content-Disposition: inline


--idttynnu6hrdagv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, May 29, 2020 at 12:18:33PM -0600, Rob Herring wrote:
> On Wed, May 27, 2020 at 05:49:14PM +0200, Maxime Ripard wrote:
> > The HDMI controllers found in the BCM2711 SoC need some adjustments to =
the
> > bindings, especially since the registers have been shuffled around in m=
ore
> > register ranges.
> >=20
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 109=
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 109 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2=
711-hdmi.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdm=
i.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > new file mode 100644
> > index 000000000000..6091fe3d315b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: GPL-2.0
>=20
> Dual license...
>=20
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom BCM2711 HDMI Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Eric Anholt <eric@anholt.net>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - brcm,bcm2711-hdmi0
> > +      - brcm,bcm2711-hdmi1
>=20
> What's the difference between the 2 blocks?=20

The register layout and the lane mapping in the PHY change a bit.

> > +
> > +  reg:
> > +    items:
> > +      - description: HDMI controller register range
> > +      - description: DVP register range
> > +      - description: HDMI PHY register range
> > +      - description: Rate Manager register range
> > +      - description: Packet RAM register range
> > +      - description: Metadata RAM register range
> > +      - description: CSC register range
> > +      - description: CEC register range
> > +      - description: HD register range
> > +
> > +  reg-names:
> > +    items:
> > +      - const: hdmi
> > +      - const: dvp
> > +      - const: phy
> > +      - const: rm
> > +      - const: packet
> > +      - const: metadata
> > +      - const: csc
> > +      - const: cec
> > +      - const: hd
> > +
> > +  clocks:
> > +    description: The HDMI state machine clock
> > +
> > +  clock-names:
> > +    const: hdmi
> > +
> > +  ddc:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: >
> > +      Phandle of the I2C controller used for DDC EDID probing
>=20
> Goes in the connector.
>=20
> And isn't the standard name ddc-i2c-bus?
>=20
> > +
> > +  hpd-gpios:
> > +    description: >
> > +      The GPIO pin for the HDMI hotplug detect (if it doesn't appear
> > +      as an interrupt/status bit in the HDMI controller itself)
>=20
> Goes in the connector.

If this was an entirely new binding, I would agree, but this is not
really the case here.

We discussed it already for the v2, and this binding is essentially the
same one than the bcm2835 HDMI controller.

I initially sent a patch adding conditionnals for the clocks and regs
differences too, and you asked to split the binding into a separate file
to simplify it a bit.

Supporting both the old binding, and the new one based on the connector
is going to make the code significantly more complicated, and I'm not
really sure why we would here.

Thanks!
Maxime

--idttynnu6hrdagv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXtZrcQAKCRDj7w1vZxhR
xS63AQChWBDf5sP/ABh3lPAf9fleWlDwl1ELjIJJmVcgvpMHdwEA7OiJMvxjuIzW
wGuu/pUZM36aV5U9/r21kOAWpvo1Rgs=
=4keu
-----END PGP SIGNATURE-----

--idttynnu6hrdagv3--

--===============0721037176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0721037176==--

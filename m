Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352601D0B82
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AA06E116;
	Wed, 13 May 2020 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6736E141
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 08:16:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 82B9B580259;
 Wed, 13 May 2020 04:16:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 13 May 2020 04:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0j46CBI/bHAD1UvanCxkve32qLl
 V511xJqDxBIoMMfU=; b=HTFl3Klp2QfojXXgRrErUJAxxal4UKbARLXv7sdH2kW
 5Z6TVj+TXe0Dzotb9rvCgJ7qIFqDAM50LeL9vDigMJ+/hJIqiLhpnY6TwrmdA9zn
 wcIuONOdhRvzr0XnqxfzmU4Cgqt2obYMbFPYkA4rG7n9sY4DuGGY1QHtihcL9OUG
 6KcpkECvWFW0vg2c3woq4k8U9vVXZBv4IpM2bMnzgAq7u0FsZOt4appHJQISonKm
 37mJ2ws/KvvqGaaEoNlkwA9EcjNR+oSDshiAH+3NfaXS7QJxp0XvXqLOQeHyr+pK
 BZlmKfUu9zC+arM5xFxLzw8xGpHu0xrrawRP5EDSY2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0j46CB
 I/bHAD1UvanCxkve32qLlV511xJqDxBIoMMfU=; b=ME8JKV6mKukylAFSChUaYj
 U2qnpZbY8VKhb96F+cdAzDVoxRc7tMYOGgh5HI3He7gV4X6NCP/4BzKyTFVeFpaX
 b1ffAwY3vT8C3XXm7X8ukIyCPNXKKw9Wn3YuUah4EzkwpkOT+z1rdenqkGB3SIDC
 mbk5Mib8N1EAM+EgLtO7OTDZC42IrKZveCNtpzTsojGDKx7hoZKjxbGLD12Xd/Uc
 S3tVA+WAf8nTtQ8xxhqdiG/rufNA0lMMowDMpqobVaQnEnI+0I86mpCbDFOsnOjc
 tyxHn0UMGfv9XWlq1qreHMWhXU4bAefkHCcxpBL+H2WPKXYGJt49Uw4fVLIz2QFQ
 ==
X-ME-Sender: <xms:zqy7Xoae7j8EJXZNl5ITxUEaEHN9KyUXts41mDFCudOneOnPlTZdsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeffteetveeijeetuefhffegkeetgffhieelheehtdduudethffhjedtvddtudel
 vdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zqy7Xjb_gzqfaP5apaGEkZQP7B1_BAWupvdiUOGftcDIYbxDnZ2mZQ>
 <xmx:zqy7Xi-GppLH-jpxW4_wKRZ_cK_3RDfc29t0cqAQWlOWo8k80vdOPQ>
 <xmx:zqy7XirIrMfP-DBf7fwSPbqIuiv3WgKZ12YTpZJzGtvgifSiYkBHBg>
 <xmx:z6y7XndYTy7d3DOVWcCzjnYkUd2S4pRFNwlYKG6tiFFzfUZaHJ0q-w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D76EC30662FE;
 Wed, 13 May 2020 04:16:13 -0400 (EDT)
Date: Wed, 13 May 2020 10:16:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 90/91] dt-bindings: display: vc4: hdmi: Add BCM2711
 HDMI controllers bindings
Message-ID: <20200513081612.qyc24hmodift4pru@gilmour.lan>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <9bdee4024b3f95bed9b55c642f0f9415c22fc506.1587742492.git-series.maxime@cerno.tech>
 <20200511215014.GA4800@bogus>
MIME-Version: 1.0
In-Reply-To: <20200511215014.GA4800@bogus>
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Content-Type: multipart/mixed; boundary="===============0424226814=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0424226814==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="25uvvhz4ijwduufw"
Content-Disposition: inline


--25uvvhz4ijwduufw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 04:50:14PM -0500, Rob Herring wrote:
> On Fri, Apr 24, 2020 at 05:35:11PM +0200, Maxime Ripard wrote:
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
> Dual license
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
> This belongs in a connector node. (ddc-i2c-bus)
>=20
> > +
> > +  hpd-gpios:
> > +    description: >
> > +      The GPIO pin for the HDMI hotplug detect (if it doesn't appear
> > +      as an interrupt/status bit in the HDMI controller itself)
>=20
> This belongs in a connector node.

If we were to create a new binding, sure, but we're merely reusing the old
binding that is already there. The only reason it's in a separate file is
because you said it would be clearer in a separate file.

Maxime

--25uvvhz4ijwduufw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXruszAAKCRDj7w1vZxhR
xZXGAPwI/P/64ae/RGoyiyvicUFL/8PZpskFHFYPNqgj1twd1QD9GJ81sy881K3d
VLuJhfBzZzlO3Dkq6buOGLj+E1To/Qw=
=ZkKk
-----END PGP SIGNATURE-----

--25uvvhz4ijwduufw--

--===============0424226814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0424226814==--

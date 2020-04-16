Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FC11AD696
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE346E375;
	Fri, 17 Apr 2020 06:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B416EB20
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 07:28:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DB7856C8;
 Thu, 16 Apr 2020 03:28:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Apr 2020 03:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oWvboizClBIQCLsIM+QeCQyJEOn
 4qOWnj1Q+s++lsjs=; b=zSIcztlUz8NKqb7WKKpyAEkcZ1dTraBzvn03Zfzy9A5
 B+h+d0EccRHd61F+h9HgZ048hy261vUnQJealj3ZWMpO1o7w3u2GAcfD63Nnxb/c
 iNm6QbEE7TArhYYza3xaEYWi9FOSoi0f/c010l/YRe4+67Am1N59RC8ez1Lqeofo
 3mzV1ofHkLPYSTAaK+OaUeunBnq0ol6rOLTCnIrqnaEeH0J/WfHjgvoZwJFwfzr/
 i9KAwgA57QoR9r8uc0QCJ6okJlGk+ae9nJ1SMubPtNaFdiOTks1JoP/WZe0YdG3o
 cLkh3Qkqy6bCcr4PptQFzgdmhyQu4YOzt/qFz0EbLdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oWvboi
 zClBIQCLsIM+QeCQyJEOn4qOWnj1Q+s++lsjs=; b=G6Uw3TQHyi5VmNPG6Wn5Yb
 7ey5AyRNaYPpvzgnX/alNu/CrDkMQLCs15YxG4wP9nJ5mVFJfLW5Cx8Zu5/aZGIg
 7S/G4GDfhgH2/b8+pWmq/OWjAVYwDfggxiA12TY68Lutd6PnqgmCvwEID1NRfJo9
 IxKlIMZ9YM16RStAhU5KfncdPMjWU6IYSMIftwhdEx3UTOlazk0KbRqD4ElztuLu
 t9QA7T8rPdmcdr0aoSIT8YDnJP/mr2Co0jyKxLdQu1VdVs/QErPCcsBkXYGIcL7a
 hZxWEGEGtoeL8yZ6Rolu/ha4SkmC1gl/g7kyquIAm/Faz4PaPGDUr3nGxrm4fkng
 ==
X-ME-Sender: <xms:FQmYXujE1KNDZjwwxcLHqAY3RKBJYZ_JObe5_MfOWQxtmrdnf8ZtVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvg
 estggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FQmYXrUzC2IVvL9NVt0jEwUx4KLQUB8fFxLkmCmcEqNFIXqVA80XZg>
 <xmx:FQmYXo2rFH-LZClwK_K-LJO1UO466yvvJKvejb0g_tE84XrpQFEqWw>
 <xmx:FQmYXpFYffKWDwhGT52n7INhew0EB4kuo4UDmyCvYWGNIgZjD6LeFA>
 <xmx:FgmYXl4y38Nz2SXzyM9WNko6ZU3zss0377Fg-TIyiu3ToNx6GbcgPA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 89FC9328005A;
 Thu, 16 Apr 2020 03:28:21 -0400 (EDT)
Date: Thu, 16 Apr 2020 09:28:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: display: convert atmel-hlcdc to DT
 Schema
Message-ID: <20200416072820.lizjyhk5dbvnujwv@gilmour.lan>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-2-sam@ravnborg.org>
 <20200414082803.exblunwe7bufbiht@gilmour.lan>
 <20200415163956.GB7965@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200415163956.GB7965@ravnborg.org>
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1940756804=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1940756804==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lplp3n3i5fwlo3st"
Content-Disposition: inline


--lplp3n3i5fwlo3st
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 06:39:56PM +0200, Sam Ravnborg wrote:
> Hi Maxime.
>
> On Tue, Apr 14, 2020 at 10:28:03AM +0200, Maxime Ripard wrote:
> > Hi Sam,
> >
> > On Sun, Apr 12, 2020 at 08:20:09PM +0200, Sam Ravnborg wrote:
> > > diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
> > > new file mode 100644
> > > index 000000000000..7eb6266a25a2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
> > > @@ -0,0 +1,102 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/atmel/hlcdc-dc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Atmel HLCDC (High LCD Controller) display controller
> > > +
> > > +maintainers:
> > > +  - Sam Ravnborg <sam@ravnborg.org>
> > > +  - Boris Brezillon <bbrezillon@kernel.org>
> > > +
> > > +description: |
> > > +  The Atmel HLCDC Display Controller is subdevice of the HLCDC MFD device.
> > > +  See ../../mfd/atmel-hlcdc.yaml for more details.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: atmel,hlcdc-display-controller
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +required:
> > > +  - compatible
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +
> > > +patternProperties:
> > > +  "^port@[0-9]$":
> > > +    type: object
> > > +    description: |
> > > +      A port node with endpoint definitions as defined in
> > > +      ../../media/video-interfaces.txt
> > > +
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      reg:
> > > +        maxItems: 1
> > > +        description: The virtual number of the port
> > > +
> > > +    patternProperties:
> > > +      "^endpoint(@[0-9])$":
> >
> > I guess you meant ^endpoint(@[0-9])?$ instead?
>
> I think "^endpoint@[0-9]$" will do the trick.
> No need for endpoints with numbers higher than 9.

If you want to stick to pedantic DT, then if there's a single
endpoint, you should avoid reg and the unit-address, and this is
something that dtc will complain about (even though it's silenced in
Linux), so yeah, ? seems the way to go.

Maxime

--lplp3n3i5fwlo3st
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpgJFAAKCRDj7w1vZxhR
xWxgAQCiEz5pDVYTAZAQHIEYCYsDFUgxa56uIAMS+stmFXHAbgD/RnKsMfVPjvNi
ihHhyUqtRGFrbbr0ZK29Y5ZAVxRAVAI=
=VL7j
-----END PGP SIGNATURE-----

--lplp3n3i5fwlo3st--

--===============1940756804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1940756804==--

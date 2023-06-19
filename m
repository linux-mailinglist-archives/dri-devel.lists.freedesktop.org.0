Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A317356E7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 14:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA1D10E1F4;
	Mon, 19 Jun 2023 12:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68BF10E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 12:31:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C5665C026F;
 Mon, 19 Jun 2023 08:31:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 19 Jun 2023 08:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1687177880; x=1687264280; bh=GA
 QXkFx5rP9qiKxhnuup7uWPTRBTYWVFfhze3j96ciQ=; b=gEiQxjsCrITet1vH20
 2aMo97fyH9nxFLOz7iiyi9CAYqkWD7c7osGJIVUKT5QADHqGc6hymtQ7WZNnL8Iq
 so7nIzhsmooq3D/BKC/hicadzYanmCIGiZylU21HAAb2h/u9ltKlgk3LznIbF/7a
 P9nlOnbpV37sNrgDTRwB2xpRAJ6O4dgIVdQ09VqBXaEORaKZDrfj8RFD/rkhzh5h
 PYl0KpkSwIXMusXT8F47epPOyzeZk+KicyVJAm9osgFXAc40BJqvvli0A21iGZs5
 82qyFQa4swxg7rv6iA4z4ezP8SNseX3seEVfy9nbMFO4w5k5hhCIHdix4bqSZL1L
 fOwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1687177880; x=1687264280; bh=GAQXkFx5rP9qi
 Kxhnuup7uWPTRBTYWVFfhze3j96ciQ=; b=aTYHTRv+Cc4FxH+gSX5Tk3qbqHoHY
 LoLa1H+VQsEi8DVDAQxhoebMpElBb9krnwnXG01w1HYKMPAcHkbjw8P+5hRFwUXM
 1lKWH7JttXRYSlCaFUcua3vjoWjEwU+JeOctymuMYJTPRjSYmujjxXnMOkjlsGAv
 pQZhZAGVFih3pYxunmo5hrCQNveO6ucQh2bRJbRs3J8OMbTH1jesCfLTCtGtaY+I
 YYD8516CUgVi+QnEKogSFP7InPU2UF0h/SWAS3/2puDPVUOuzYklUHDv4VRmRQSp
 JUHKgsKoJTWTFJNTf5c5dzAiIGGC0sxl/XJ2/zFhCeKBbvjReTT4kh2+g==
X-ME-Sender: <xms:l0qQZCgEweesZR6_xW0bXeP8cdo56X_UpoSW_aVLmvoWlqci18FRJg>
 <xme:l0qQZDDRwOOJrh868MvAwqt9zJHIuxYpN4k4fsYeQZRcNS-rnyNdT3dgjxFrwniAP
 K2Nrynk5bmo-_vvwbM>
X-ME-Received: <xmr:l0qQZKGJqqTlp0MQs5bdzOsGVtENUnVaIP7zNjpDb-9aGScgv48AMGCt3Tvae8L9au1KjhPduUzETCUEFNF1kA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefvddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtgfdukeeigeeuhfelheeftdfhgfegfefgudeuiefhueeuleekveetvdei
 tddvieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:l0qQZLSrkhcCGfP-wpOjA75iMENwQxDOvhsEBcjaPnWhoBJ-4WhQcA>
 <xmx:l0qQZPyX6m0YIcHSAgndV45MWl6LfVUMc0eW_A03UGJnBouLnd7J5g>
 <xmx:l0qQZJ66pbYhRLnJnP22C6O1w-xRSLWXlEXbob4tUhRzOJWV4xlE1A>
 <xmx:mEqQZEohV6y4QIWmlRPLRS3T9hIffE9FIxtlOeOkCRoVBOGbTex7OA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jun 2023 08:31:19 -0400 (EDT)
Date: Mon, 19 Jun 2023 14:31:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: display: st7789v: bound the number
 of Rx data lines
Message-ID: <yv3c5rzoz5bdo34q7eczydlawdkmikekxzkzejcxq74nf7xzcc@qgwg5yapdtwn>
References: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
 <20230616163255.2804163-3-miquel.raynal@bootlin.com>
 <tcxifa7ol3fukfsdw7hh3kl25dhpviu6lasdc6xasz4dvhjedx@mo2vae6smtok>
 <20230618193732.04fc1909@xps-13>
 <wgi4wtewth3xwtl5updyg5et3roiqp4h5kz6oyevd4uxjveboq@gff42fefym7m>
 <20230619121958.2e4a7c95@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e6brfdgkpu66s3xx"
Content-Disposition: inline
In-Reply-To: <20230619121958.2e4a7c95@xps-13>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e6brfdgkpu66s3xx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 12:19:58PM +0200, Miquel Raynal wrote:
> Hi Maxime,
>=20
> maxime@cerno.tech wrote on Mon, 19 Jun 2023 11:39:56 +0200:
>=20
> > On Sun, Jun 18, 2023 at 07:37:32PM +0200, Miquel Raynal wrote:
> > > Hello Maxime,
> > >=20
> > > maxime@cerno.tech wrote on Sun, 18 Jun 2023 16:37:58 +0200:
> > >  =20
> > > > Hi,
> > > >=20
> > > > On Fri, Jun 16, 2023 at 06:32:51PM +0200, Miquel Raynal wrote: =20
> > > > > The ST7789V LCD controller supports regular SPI wiring, as well a=
s no Rx
> > > > > data line at all. The operating system needs to know whether it c=
an read
> > > > > registers from the device or not. Let's detail this specific desi=
gn
> > > > > possibility by bounding the spi-rx-bus-width property.
> > > > >=20
> > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > > ---
> > > > >  .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | =
4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/display/panel/sitr=
onix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitroni=
x,st7789v.yaml
> > > > > index 0ccf0487fd8e..a25df7e1df88 100644
> > > > > --- a/Documentation/devicetree/bindings/display/panel/sitronix,st=
7789v.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st=
7789v.yaml
> > > > > @@ -29,6 +29,10 @@ properties:
> > > > >    spi-cpha: true
> > > > >    spi-cpol: true
> > > > > =20
> > > > > +  spi-rx-bus-width:
> > > > > +    minimum: 0
> > > > > +    maximum: 1
> > > > > +   =20
> > > >=20
> > > > It's not clear to me what the default would be? =20
> > >=20
> > > This binding references spi-peripheral-props.yaml which sets the
> > > default to 1, I believe it is sane to keep it that way? =20
> >=20
> > I'm not sure.
> >=20
> > The driver didn't need RX before, and we didn't have any property that
> > was expressing whether we had MISO in the device tree.
> >=20
> > That means we had both devices with and without MISO expressed in the
> > same way, the driver handling both (by ignoring MISO entirely).
> >=20
> > With this patch, you now introduce a property that specifies whether
> > MISO is connected or not, and defaults to MISO being there. And a later
> > patch will use MISO if it's available.
> >=20
> > This means that, while it's working fine for devices that had MISO
> > connected, devices that didn't are assumed to have it, and the driver
> > makes use of it.
>=20
> Ah yes, I get your concern. I thought you wanted to talk about the fact
> that it was not constrained in the yaml description. Your concern is
> about breaking existing devices.
>=20
> Your concern is real, designs not wiring the MISO line which do not
> describe this in the device tree will no longer succeed to probe with
> the current implementation. Technically speaking, they're broken since
> 2021:
>=20
> c476d430bfc0 ("dt-bindings: display: Add SPI peripheral schema to SPI bas=
ed displays")

I mean, I guess, but an old DT was still booting fine. Validation didn't
pass but that's a bit irrelevant for devices that shipped already.

> We actually discussed this with Sebastian, right there:
> https://lore.kernel.org/all/20230609145951.853533-6-miquel.raynal@bootlin=
=2Ecom/T/#m9286cdb4d617c5efc29052b552e981ecfa2628e4
>=20
> And the conclusion was that we decided not to care about the broken
> descriptions (because, let's agree on this, not wiring the MISO line is
> not a standard spi design).

It might not be, but it's there. Just like the 9 bits per word :)

All the current in-tree users seem to only mux (at least, I haven't
checked the design) MOSI, and the devices I worked on with this driver
also didn't iirc.

> But I don't have a strong opinion TBH, so if you think it's best to
> prevent these probes from failing (note that I already added a debug
> line explicitly saying why the probe would fail, "easy" to identify)
> I'm fine turning the check as a warning and ignoring the error to
> avoid failing.

Updating the DT isn't always an option, so yeah, please make it backward
compatible.

Maxime

--e6brfdgkpu66s3xx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJBKlQAKCRDj7w1vZxhR
xf0ZAQDmDZTRz3V1/lsj/hq17Cnf/N3/RpU/V0PpnyCmJuEaOQEA7ECAgWdFQD+q
MUDS4Y7G4D9hXq93on/jlTikgoIG6A4=
=dIzl
-----END PGP SIGNATURE-----

--e6brfdgkpu66s3xx--

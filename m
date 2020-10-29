Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFF29FFD9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460F96ED06;
	Fri, 30 Oct 2020 08:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77156E5BD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 18:16:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75F78AD1E;
 Thu, 29 Oct 2020 18:16:58 +0000 (UTC)
Message-ID: <30d4a73b02957c18460d7f4535b1baa98ccda013.camel@suse.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: Add a property to deal
 with WiFi coexistence
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Oct 2020 19:16:56 +0100
In-Reply-To: <20201029180721.lsucxnl7kavlvibd@gilmour.lan>
References: <20201029134018.1948636-1-maxime@cerno.tech>
 <4d0028fdf797abd99f95d627e60e9322caa52596.camel@suse.de>
 <20201029180721.lsucxnl7kavlvibd@gilmour.lan>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1601236402=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1601236402==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Si3FC5Rwn4sE3tHN32Hz"


--=-Si3FC5Rwn4sE3tHN32Hz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-10-29 at 19:07 +0100, Maxime Ripard wrote:
> Hi Nicolas,
>=20
> On Thu, Oct 29, 2020 at 06:43:27PM +0100, Nicolas Saenz Julienne wrote:
> > Hi maxime,
> >=20
> > On Thu, 2020-10-29 at 14:40 +0100, Maxime Ripard wrote:
> > > The RaspberryPi4 has both a WiFi chip and HDMI outputs capable of doi=
ng
> > > 4k. Unfortunately, the 1440p resolution at 60Hz has a TMDS rate on th=
e
> > > HDMI cable right in the middle of the first Wifi channel.
> > >=20
> > > Add a property to our HDMI controller, that could be reused by other
> > > similar HDMI controllers, to allow the OS to take whatever measure is
> > > necessary to avoid that crosstalk.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > ---
> > >=20
> > > Changes from v1:
> > >   - Renamed the property
> > >   - Split it into a separate patch
> > > ---
> > >  .../devicetree/bindings/display/brcm,bcm2711-hdmi.yaml      | 6 ++++=
++
> > >  1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-h=
dmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > > index 03a76729d26c..7ce06f9f9f8e 100644
> > > --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yam=
l
> > > +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yam=
l
> > > @@ -76,6 +76,12 @@ properties:
> > >    resets:
> > >      maxItems: 1
> > > =20
> > > +  wifi-2.4ghz-coexistence:
> >=20
> > I see you already renamed the property, but I can't seem to find v1 of =
the
> > series online.
>=20
> I realized I didn't put you in Cc for the first version, sorry, you'll fi=
nd it here:
> https://lore.kernel.org/dri-devel/20200925130744.575725-1-maxime@cerno.te=
ch/
>=20
> > Sorry if this is redundant:
> >=20
> > I wonder if it'd make sense to prefix the property like this:
> > "raspberrypi,wifi-2.4ghz-coexistence." I tend to associate the lack of =
prefix
> > with generic properties, and also thought it was a rule. Although I may=
 have as
> > well imagined it.
>=20
> Rob in the first iteration asked for the opposite :)

Fair enough, then:

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-Si3FC5Rwn4sE3tHN32Hz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+bBxgACgkQlfZmHno8
x/7MIQf8CumOgp9BNlym7/DOS46fLZCDh9XuUv2MduUAdyrSsnvucoiKqoXYvw1g
8xULNi/G7D/faPC6ckWb0AvxNoSy1ipJ0ckp46bvzOaFivHFBCfAWK428T/2Y6EF
qH/r0g8VaygPzvo6J2GOKXR/VitlmDVhnlIWcz/x8RqX0KQR4doPcjasU4eDomg7
F87j4m31WIkp4husWqbnX6PSNq7z+RGwhrr3/rznlqpCDGrpap+8BfXU7FWwU1aL
DOjmqHU1w65Vy4nGXUNbKDaBvA/RaKwkdi/1Sa7UlZfHWYq4kTrLbsXBFcvdI2XA
wquVgDq1ISPdQJd5+ijRB3q3UhD61g==
=yX7+
-----END PGP SIGNATURE-----

--=-Si3FC5Rwn4sE3tHN32Hz--


--===============1601236402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1601236402==--


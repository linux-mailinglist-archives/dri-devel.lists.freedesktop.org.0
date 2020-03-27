Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1521974F4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2204B89ECD;
	Mon, 30 Mar 2020 07:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA236E095
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 12:40:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6AD9BAE1C;
 Fri, 27 Mar 2020 12:40:54 +0000 (UTC)
Message-ID: <d6325a2610d349eba922cdcdd3381364ab927159.camel@suse.de>
Subject: Re: [PATCH] drm/vc4: Fix HDMI mode validation
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 27 Mar 2020 13:40:52 +0100
In-Reply-To: <20200327124014.cpadv7npw2q6iaxe@gilmour.lan>
References: <20200326122001.22215-1-nsaenzjulienne@suse.de>
 <65a2d18ec2b901c6a89acc091cf9573a98fda75f.camel@suse.de>
 <20200327124014.cpadv7npw2q6iaxe@gilmour.lan>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, f.fainelli@gmail.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1982597939=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1982597939==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5Iqt3qdKsxOyWAW1tzPj"


--=-5Iqt3qdKsxOyWAW1tzPj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-03-27 at 13:40 +0100, Maxime Ripard wrote:
> On Fri, Mar 27, 2020 at 12:46:52PM +0100, Nicolas Saenz Julienne wrote:
> > Hi Daniel,
> >=20
> > On Thu, 2020-03-26 at 13:20 +0100, Nicolas Saenz Julienne wrote:
> > > Current mode validation impedes setting up some video modes which sho=
uld
> > > be supported otherwise. Namely 1920x1200@60Hz.
> > >=20
> > > Fix this by lowering the minimum HDMI state machine clock to pixel cl=
ock
> > > ratio allowed.
> > >=20
> > > Fixes: 32e823c63e90 ("drm/vc4: Reject HDMI modes with too high of clo=
cks")
> > > Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> > > Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> >=20
> > Would it be possible for you to take this in for v5.7 (or as a fix for =
v5.6,
> > but it seems a little late)?
> >=20
> > A device-tree patch I have to channel trough the SoC tree depends on th=
is to
> > avoid regressions.
>=20
> I've applied it for 5.7-rc1

Thanks!


--=-5Iqt3qdKsxOyWAW1tzPj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl599FQACgkQlfZmHno8
x/44LAf9HAcHO90kKZkw5zqsWzAr69zCvbeLuO9UCtVc8Iul7mVEIb5n2KAS/BjD
wsSHNZwvAKU8FT4DTuTIqF7kSzOb7iaKErzt/QgyVuRovM1yNS9ZgQQUVbFungxi
g+GtSPnLkil5ydnN72MU3m52xsdqe4GA/7plv6sbbsFlH08N1dl/T0vSd3lHNO8a
CY9yIId3RkfhoC74QfBGL7tRyoJyiKyt4xrOLlfyR7el9CR0hzcfC+5qHdER8Mig
jooqcstPltByTHY/4OCewAhfA5b3lf2iul1kQMgHrkqZe2WGxMy6z80Stxfm3nsM
2gVYNeIuq4K74o++da6R3jDE/7mn1g==
=mJWx
-----END PGP SIGNATURE-----

--=-5Iqt3qdKsxOyWAW1tzPj--


--===============1982597939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1982597939==--


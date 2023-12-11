Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8129F80CB41
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 14:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60C910E439;
	Mon, 11 Dec 2023 13:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D590910E439
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 13:40:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10A746129B;
 Mon, 11 Dec 2023 13:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66063C433C9;
 Mon, 11 Dec 2023 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702302016;
 bh=hT5wbRADqOwmV/3WZ6GsQaZ1PuuPhcM0p2K+H0ix/SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PnCVEbSyG/2I+FFRvEGqrHMTRyDEGeXMOmPuTsS4HamISXYJ8habLZBlGRjetqaQo
 ciC43t8C31BPvi/nF4L7+vBGCyCC4ey2MJoCHdtXSjjkI3hvqcY8i2wunJj11jOKMx
 ZD0r0CKfkY7YaibfMTaf3NZauWqbNWPPFy18v2ttp5lUl/wBeQAlDzQSeEEdbX5RAg
 fBl4mfF/ZJS65+KCEfkfTZ9Q7F6WxuJ+5HWKPLO5HJSYhTALFNbl1acGRwP++sO+bx
 Pk3JLNPxzitTgBuT1YMobMTBTzf99QQoLVIbN6RUKYyNdvR1CFkmOh34LGaY8nr8Ky
 wUPVuvPrJ/cPA==
Date: Mon, 11 Dec 2023 14:40:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: State of affairs with Ilitek 9341 support
Message-ID: <tqor4oqv64x6qacmsmvifacy46rnmexjlwtzadw3m66wj2mkax@l342lokeehti>
References: <ZXM9pG-53V4S8E2H@smile.fi.intel.com>
 <7c848801-cf7f-4293-8a29-084dd20efb8e@tronnes.org>
 <ZXcMTBKbHiuTLAfR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hzddigwmpsx2gxqj"
Content-Disposition: inline
In-Reply-To: <ZXcMTBKbHiuTLAfR@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Priit Laes <plaes@plaes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Lechner <dlechner@baylibre.com>, Dillon Min <dillon.minfei@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hzddigwmpsx2gxqj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 03:19:08PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 08, 2023 at 09:18:20PM +0100, Noralf Tr=F8nnes wrote:
> > On 12/8/23 17:00, Andy Shevchenko wrote:
> > > Included authors and latest (non-white-space) contributors to the dri=
vers
> > > in question along with relevant mailing list and respective (active i=
n the
> > > area) maintainers.
> > >=20
> > > I already had risen the question in times when 4th (sic!) driver for =
the same
> > > hardware was about to be pulled into upstream that we have to somehow=
 reduce
> > > the code base and unify device properties.
> > >=20
> > > So, the main question here "What is the plan and where are we now?"
> > >=20
> > > I admit that fbtft case is special as it supports, in particular, pla=
tform
> > > device (parallel interface) and also well established in the embedded=
 world.
> > > What about the rest?
> > >=20
> > > N.B. Besides the fact that panel drivers are too OF-centric, which is=
 bad
> > > practice for the new kernel code in general and has to be stopped. I.=
o.w.
> > > seeing of_property_*() or alike in the driver after ca. 2020 should be
> > > immediate NAK unless it's very well justified why it may not be used =
on
> > > non-OF systems.
>=20
> Noralf, thanks for your response, my comments below.
>=20
> TBH I would also like to hear from maintainers, because it seems they got
> an additional burden for no benefit.
>=20
> > Last year drivers/gpu/drm/tiny/panel-mipi-dbi.c was added to support all
> > MIPI DBI compatible (ili9341) SPI displays.
> > It loads the initialisation commands from a firmware file. For more info
> > see https://github.com/notro/panel-mipi-dbi/wiki.
> >=20
> > When I started on fbtft in 2013 I didn't know about MIPI DBI so I made
> > some common bus access functions and one driver per controller and that
> > driver had an initialisation sequence to match the panel I had. Then I
> > discovered that displays using the same controller could have different
> > init sequences so I added a Device Tree <init> property that could
> > override the driver init.
> >=20
> > In 2015 fbtft was added to drivers/staging, but later that year fbdev
> > was closed for new drivers so it was a dead end.
> >=20
> > I started to work on porting fbtft to DRM and almost 2 years later
> > support for the MI0283QT panel (ILI9341) was added.
> > I had now learned about MIPI DBI so a library to handle that was added.
> > I had asked on the Device Tree ML about the <init> property and I was
> > told that I couldn't have that which meant that I couldn't get away with
> > having just one driver for the MIPI DBI compatible display panels as I
> > was first hoping for.
> >=20
> > I was aware that there was a challenge going from fbtft to DRM because
> > in fbtft there is support for all panel setups using the <init>
> > property, but in DRM every panel needed support in a driver. So I
> > started to look at adding Device Tree properties to describe the setup
> > for one controller. This would make it easy to describe a new panel in
> > Device Tree for a supported controller. Maxime Ripard came up with the
> > idea to have the controller initialisation commands in a firmware file
> > which meant that we could get away with having just one driver for all
> > MIPI DBI SPI panels (which is the vast majority of these SPI pixel
> > upload panels).
> >=20
> > This meant that SPI support could be removed from all the MIPI DBI
> > compatible controllers in fbtft
>=20
> I believe it can't. Otherwise we _must_ provide the DT (device property)
> parser that uses what is provided for fbtft SPI to be enabled in the other
> driver.

We never committed to supporting that binding in the first place, and
that code is in staging, so I don't see why we must do that.

> > since there's now a solution for them in DRM. The drivers themselves
> > must stay since they also have parallel bus support which is lacking
> > in DRM. My plan was to wait for panel-mipi-dbi to hit an LTS and
> > then either prepare patches to remove MIPI DBI SPI support from
> > fbtft or at least send an email to staging about the new driver.
>=20
> > Unfortunately my health problems got worse and many plans went
> > out the window.
>=20
> Oh, sad to hear this, hope you will get better sooner than later!
>=20
> > ILI9341 DRM drivers
> >=20
> > - drivers/gpu/drm/tiny/mi0283qt.c
> >   This was the first driver added for the MI0283QT panel series
> >=20
> > - drivers/gpu/drm/tiny/ili9341.c
> >   Later ili9341 based panels was decided to be added to a controller
> >   specific driver.
>=20
> Why was it appeared in the first place? :-(

It's probably an oversight. The name was far from obvious to begin with.

> > - drivers/gpu/drm/tiny/panel-mipi-dbi.c
> >   Generic MIPI DBI SPI driver that loads init commands from a firmware
> >   file. It uses of_property_read_string_index() and
> >   of_get_drm_panel_display_mode(). I don't know if it's possible to make
> >   device_property_*() versions of those.
>=20
> Everything like this is possible, just somebody needs to fulfill that.
> And as I said, new OF-centric code, has to be NAKed by default.
>=20
> > - drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> >   This driver supports the MIPI DPI (RGB) interface on the controller.
> >   Controller init is done over MIPI DBI SPI. The driver does also for
> >   some reason support the same panel as the ili9341.c driver does.
> >   So 2 drivers for the same panel...
> >   Sidenote: It is possible to make a generic panel-mipi-dpi.c driver for
> >   panels that use DPI for pixels and DBI for init loaded from a firmware
> >   file.
>=20
> I wonder who has enough experience and time to at least point out or do
> something about this...

I'm not sure it's worth it tbh. Panel drivers are fairly straightforward
and easy to maintain, and getting a driver that can support all the
variations of the power sequences those driver need would make a very
complicated driver.

And MIPI-DPI display are becoming more and more irrelevant. Small,
cheap, display will keep using MIPI-DBI, and middle and high-end screens
are using MIPI-DSI/eDP.

Maxime

--hzddigwmpsx2gxqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXcRPQAKCRDj7w1vZxhR
xceiAQDywp06OGujKCOAINdkhh/Zgz3RYVu0OzMb4E/I/SM1TAD6ArT1+eunjyzR
oZF7beWidPyr5IJ6oKMc+trd12xKQQY=
=X9fO
-----END PGP SIGNATURE-----

--hzddigwmpsx2gxqj--

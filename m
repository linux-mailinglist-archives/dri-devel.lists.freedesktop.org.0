Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74607595E3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 10:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4E06E88B;
	Fri, 28 Jun 2019 08:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE156E88B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 08:18:09 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 713FE8063E; Fri, 28 Jun 2019 10:17:55 +0200 (CEST)
Date: Fri, 28 Jun 2019 10:18:06 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
Message-ID: <20190628081806.GA31375@amd>
References: <20190624203114.93277-1-mka@chromium.org>
 <20190624203114.93277-5-mka@chromium.org>
 <20190626145617.GB22348@xo-6d-61-c0.localdomain>
 <20190628075516.dwev7fxz7kmox2i2@holly.lan>
MIME-Version: 1.0
In-Reply-To: <20190628075516.dwev7fxz7kmox2i2@holly.lan>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============0884629197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0884629197==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-06-28 08:55:16, Daniel Thompson wrote:
> On Wed, Jun 26, 2019 at 04:56:18PM +0200, Pavel Machek wrote:
> > On Mon 2019-06-24 13:31:13, Matthias Kaehlcke wrote:
> > > Check if a brightness curve specified in the device tree is linear or
> > > not and set the corresponding property accordingly. This makes the
> > > scale type available to userspace via the 'scale' sysfs attribute.
> > >=20
> > > To determine if a curve is linear it is compared to a interpolated li=
near
> > > curve between min and max brightness. The curve is considered linear =
if
> > > no value deviates more than +/-5% of ${brightness_range} from their
> > > interpolated value.
> >=20
> > I don't think this works. Some hardware does takes brightness in percep=
tual units,
> > converting it in the LED controller.
>=20
> This check is exclusive to PWM backlights so I'd like to double check
> that you are thinking specifically of hardware that takes it's signal
> from the PWM and works in perceptual units?

I missed that details. Taking PWM input then converting it to
perceptual units would indeed be strange.

Sorry,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0VzT4ACgkQMOfwapXb+vJHvwCfXWJZfJ+NpPdPg9PEDds9PM6A
2PkAoKvMuJ+sLPxMlK+cBeBefsVNKEOi
=vu5D
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

--===============0884629197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0884629197==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB1CDC13
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2114D6E46E;
	Mon,  7 Oct 2019 07:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3F96E0BB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 11:04:59 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 9D38780476; Sun,  6 Oct 2019 13:04:41 +0200 (CEST)
Date: Sun, 6 Oct 2019 13:04:56 +0200
From: Pavel Machek <pavel@denx.de>
To: Daniel Thompson <daniel.thompson@linaro.org>, alex@alexanderweb.de,
 andriy.shevchenko@linux.intel.com
Subject: Re: New sysfs interface for privacy screens
Message-ID: <20191006110455.GC24605@amd>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <20191002094650.3fc06a85@lwn.net> <87muei9r7i.fsf@intel.com>
 <20191003102254.dmwl6qimdca3dbrv@holly.lan>
MIME-Version: 1.0
In-Reply-To: <20191003102254.dmwl6qimdca3dbrv@holly.lan>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Mat King <mathewk@google.com>, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: multipart/mixed; boundary="===============0993026460=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0993026460==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >> I have been looking into adding Linux support for electronic privacy
> > >> screens which is a feature on some new laptops which is built into t=
he
> > >> display and allows users to turn it on instead of needing to use a
> > >> physical privacy filter. In discussions with my colleagues the idea =
of
> > >> using either /sys/class/backlight or /sys/class/leds but this new
> > >> feature does not seem to quite fit into either of those classes.
> > >
> > > FWIW, it seems that you're not alone in this; 5.4 got some support for
> > > such screens if I understand things correctly:
> > >
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D110ea1d833ad
> >=20
> > Oh, I didn't realize it got merged already, I thought this was
> > related...
> >=20
> > So we've already replicated the backlight sysfs interface problem for
> > privacy screens. :(
>=20
> I guess... although the Thinkpad code hasn't added any standard
> interfaces (no other laptop should be placing controls for a privacy
> screen in /proc/acpi/ibm/... ). Maybe its not too late.

There's new interface for controlling privacyguard... but perhaps we
need better solution than what went in 5.4. Perhaps it should be
reconsidered?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2ZylcACgkQMOfwapXb+vIvLwCgv8pM8435FkksDHNB1TjTxnow
Zm8AoKrwhCDI1rdvOj6Y2H8UU21KaV9E
=xgty
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--

--===============0993026460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0993026460==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FFD269C1
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 20:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C0189B9A;
	Wed, 22 May 2019 18:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D8689B9A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 18:21:56 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id A821780313; Wed, 22 May 2019 20:21:42 +0200 (CEST)
Date: Wed, 22 May 2019 20:21:52 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv6 4/4] drm/omap: add support for manually updated displays
Message-ID: <20190522182152.GA10003@amd>
References: <20190403195413.djfrgzuj7povdksi@earth.universe>
 <20190403201326.3127-1-sebastian.reichel@collabora.com>
 <20190403201326.3127-5-sebastian.reichel@collabora.com>
 <20190404001109.GZ49658@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20190404001109.GZ49658@atomide.com>
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0834806733=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0834806733==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-04-03 17:11:09, Tony Lindgren wrote:
> * Sebastian Reichel <sebastian.reichel@collabora.com> [190403 20:14]:
> > This adds the required infrastructure for manually updated displays,
> > such as DSI command mode panels. While those panels often support
> > partial updates we currently always do a full refresh.
> >=20
> > The display will be refreshed when something calls the dirty callback,
> > such as libdrm's drmModeDirtyFB(). This is currently being done at least
> > by the kernel console and Xorg (with modesetting driver) in their
> > default configuration. Weston does not implement this and the fbdev
> > backend does not work (display will not update). Weston's DRM backend
> > uses double buffering and the page flip will also trigger a display
> > refresh.
>=20
> I've tested this with Linux next and the latest lm3532
> patches and it works fine as long as we leave out the
> backlight =3D <&lcd_backlight> entry from dts like I
> replied in the lm3532 tread. So as far as I'm concerned,
> we're good to go:
>=20
> Tested-by: Tony Lindgren <tony@atomide.com>

I've tested this on 5.2-rc1, and it is still neccessary, still needed,
and still not merged.

How can I help? Can the patches simply be picked up for drm tree?

Tested-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzlk0AACgkQMOfwapXb+vJXQQCfQd2JMKV5aE0IX8qcHplWoUFq
tQsAn2FpwuQw/t+w9mpUiAiZ/CP53ppT
=FNwu
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--

--===============0834806733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0834806733==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C395832FCA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 21:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127FC10E1FD;
	Fri, 19 Jan 2024 20:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909AB10E1FD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 20:32:42 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4A3841C0071; Fri, 19 Jan 2024 21:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1705696360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Z4zR8u3nm1rRi0zh1NzLoJEZgyLkftEGi5YnT+0UVA=;
 b=NinSCgGWEItpLCFK8x0Plbr7ic7jnW5Xg2ZYjXsM9w+gtEy+UAh0BsWBQQmUsCq0s1Gcrb
 FOduxoV6A0sLjTsiMplEkepm1nA1DYNxTGdAr5mftTcmZ2Sv1lYCUFw8kVsfLir6lEm9Eq
 t4D01rdmcjk2BoWgz1riHNWdItpC4+Q=
Date: Fri, 19 Jan 2024 21:32:39 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <ZarcZwQd/2EXjgZP@duo.ucw.cz>
References: <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <ZarYSkzISyS+wuYR@duo.ucw.cz>
 <36973f9d-bf67-417d-998c-ce24c38322c3@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="/ZMJYiWSABC/ttn2"
Content-Disposition: inline
In-Reply-To: <36973f9d-bf67-417d-998c-ce24c38322c3@tuxedocomputers.com>
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
Cc: jikos@kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/ZMJYiWSABC/ttn2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > And then storing RGB in separate bytes, so userspace will then
> > > always send a buffer of 192 bytes per line (64x3) x 14 rows
> > > =3D 3072 bytes. With the kernel driver ignoring parts of
> > > the buffer where there are no actual keys.
> > That's really really weird interface. If you are doing RGB888 64x14,
> > lets make it a ... display? :-).
> >=20
> > ioctl always sending 3072 bytes is really a hack.
> >=20
> > Small displays exist and are quite common, surely we'd handle this as
> > a display:
> > https://pajenicko.cz/displeje/graficky-oled-displej-0-66-64x48-i2c-bily=
-wemos-d1-mini
> > It is 64x48.
> >=20
> > And then there's this:
> > https://pajenicko.cz/displeje/maticovy-8x8-led-displej-s-radicem-max7219
> > and this:
> > https://pajenicko.cz/displeje/maticovy-8x32-led-displej-s-radicem-max72=
19
> >=20
> > One of them is 8x8.
> >=20
> > Surely those should be displays, too?
>=20
> But what about a light bar with, lets say, 3 zones. Is that a 3x1 display?
>=20
> And what about a mouse having lit mousebuttons and a single led light bar=
 at
> the wrist: a 2x2 display, but one is thin but long and one is not used?

So indeed LEDs can arranged into various shapes. Like a ring, or this:

 * *
* * *
 * *

https://pajenicko.cz/led-moduly?page=3D2

Dunno. Sounds like a display is still a best match for them. Some of
modules are RGB, some are single-color only, I'm sure there will be
various bit depths.

I guess we can do 3x1 and 2x2 displays. Or we could try to solve
keyboards and ignore those for now.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--/ZMJYiWSABC/ttn2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZarcZwAKCRAw5/Bqldv6
8vorAJ44jwibpMssWa1IOTj5wgRqgYAdpACgsblb5qNdHeBKVZp9qFNQLdR24uQ=
=Qwmz
-----END PGP SIGNATURE-----

--/ZMJYiWSABC/ttn2--

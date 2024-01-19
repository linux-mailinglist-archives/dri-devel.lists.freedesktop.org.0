Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C79832FAB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 21:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B562B10EA65;
	Fri, 19 Jan 2024 20:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153FD10EA65
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 20:15:20 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 033531C0071; Fri, 19 Jan 2024 21:15:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1705695307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hKuIM8W+NNavO6XUMavTavQPy2bJBy/hmu5/EWXXd5g=;
 b=pI/ms/ITLYhFrPr7zCiV+hcNVOnPoHdBswPqTSzmsrbqbLCKmPV6STTKLXwpES0kgPvw2G
 SEmrmcXAw0WRSeEp4OsgbBc12uqzwjdKjvI4U+jh3yRS7q78cXggVgDXFKNa2OPVRzeeac
 47Gkqtn5TzcVJZ4pN4RNeAS/1XDuHlU=
Date: Fri, 19 Jan 2024 21:15:06 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <ZarYSkzISyS+wuYR@duo.ucw.cz>
References: <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="sNVhZD9VvNEiSHyg"
Content-Disposition: inline
In-Reply-To: <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
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
Cc: jikos@kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Werner Sembach <wse@tuxedocomputers.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sNVhZD9VvNEiSHyg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> 2. Implement per-key keyboards as auxdisplay
> >>
> >> =A0=A0=A0 - Pro:
> >>
> >> =A0=A0=A0 =A0=A0=A0 - Already has a concept for led positions
> >>
> >> =A0=A0=A0 =A0=A0=A0 - Is conceptually closer to "multiple leds forming=
 a singular entity"
> >>
> >> =A0=A0=A0 - Con:
> >>
> >> =A0=A0=A0 =A0=A0=A0 - No preexisting UPower support
> >>
> >> =A0=A0=A0 =A0=A0=A0 - No concept for special hardware lightning modes
> >>
> >> =A0=A0=A0 =A0=A0=A0 - No support for arbitrary led outlines yet (e.g. =
ISO style enter-key)
> >=20
> > Please do this one.
>=20
> Ok, so based on the discussion so far and Pavel's feedback lets try to
> design a custom userspace API for this. I do not believe that auxdisplay
> is a good fit because:

Ok, so lets call this a "display". These days, framebuffers and drm
handles displays. My proposal is to use similar API as other displays.

> So my proposal would be an ioctl interface (ioctl only no r/w)
> using /dev/rgbkbd0 /dev/rgbkdb1, etc. registered as a misc chardev.
>=20
> For per key controllable rgb LEDs we need to discuss a coordinate
> system. I propose using a fixed size of 16 rows of 64 keys,
> so 64x16 in standard WxH notation.
>=20
> And then storing RGB in separate bytes, so userspace will then
> always send a buffer of 192 bytes per line (64x3) x 14 rows
> =3D 3072 bytes. With the kernel driver ignoring parts of
> the buffer where there are no actual keys.

That's really really weird interface. If you are doing RGB888 64x14,
lets make it a ... display? :-).

ioctl always sending 3072 bytes is really a hack.

Small displays exist and are quite common, surely we'd handle this as
a display:
https://pajenicko.cz/displeje/graficky-oled-displej-0-66-64x48-i2c-bily-wem=
os-d1-mini
It is 64x48.

And then there's this:
https://pajenicko.cz/displeje/maticovy-8x8-led-displej-s-radicem-max7219
and this:
https://pajenicko.cz/displeje/maticovy-8x32-led-displej-s-radicem-max7219

One of them is 8x8.

Surely those should be displays, too?

And yes, we'd probably want some extra ioctls on top, for example to
map from input device to this and back, and maybe for various effects,
too. And yes, I realize that display with holes in it and with some
pixels bigger than others is weird, but it still looks like a display
to me. (And phones have high-res displays with rounded corners and
holes in them, so... we'll need to deal with weird displays anyway).

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--sNVhZD9VvNEiSHyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZarYSgAKCRAw5/Bqldv6
8mh0AKCdbdt+aZYvFOmUj57gVRZ7wYfxUwCfcuKXV1EpVhd6hWel7T/V86MYINo=
=Yt0i
-----END PGP SIGNATURE-----

--sNVhZD9VvNEiSHyg--

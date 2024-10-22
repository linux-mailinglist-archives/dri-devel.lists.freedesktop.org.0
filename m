Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234669A9F07
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E01110E646;
	Tue, 22 Oct 2024 09:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="nH1wjtTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23C510E646
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:47:15 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 77B1F1C006B; Tue, 22 Oct 2024 11:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1729590434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dSDlBFL2PfLrCn7v33SNOWjYPKjIXUgPATj3s3TfkA4=;
 b=nH1wjtTAj8yQYgCeyr1tt1HHFMgJGRTOPK0nYBPoQDvGWRsmWzZ+LatoIuhPpo7mXgbwMQ
 gWnEHoCWc9Bcj289IQUTt0vyHVQnOPGpn+WzPEP7UHJ5NUru96PIJHKMt9UwjpxPMgEeAB
 PB0MZmQIqC/FibFK/knAgmvJy76HwoU=
Date: Tue, 22 Oct 2024 11:47:14 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Werner Sembach <wse@tuxedocomputers.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
References: <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
 <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="VyjLwRGdYiDTANtH"
Content-Disposition: inline
In-Reply-To: <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--VyjLwRGdYiDTANtH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Sorry for taking a bit long to respond.
> >=20
> > This "illumination" subsystem would (from my perspective) act like some=
 sort of LED subsystem
> > for devices with a high count of LEDs, like some RGB keyboards.
> >=20
> > This would allow us too:
> > - provide an abstract interface for userspace applications like OpenRGB
> > - provide an generic LED subsystem emulation on top of the illumination=
 device (optional)
> > - support future RGB controllers in a generic way
> >=20
> > Advanced features like RGB effects, etc can be added later should the n=
eed arise.
> >=20
> > I would suggest that we model it after the HID LampArray interface:
> >=20
> > - interface for querying:
> > =A0- number of LEDs
> > =A0- supported colors, etc of those LEDs
> > =A0- position of those LEDs if available
> > =A0- kind (keyboard, ...)
> > =A0- latency, etc
> > - interface for setting multiple LEDs at once
> > - interface for setting a range of LEDs at once

How are LEDs ordered? I don't believe range makes much sense.

> > I do not know if mixing sysfs (for controller attributes like number of=
 LEDs, etc) and IOCTL
> > (for setting/getting LED colors) is a good idea, any thoughts?
>=20
> I wonder what the advantage of this approach is over simply using HID Lam=
pArray
> (emulation), openRGB is already going to support HID LampArray and since =
Microsoft
> is pushing this we will likely see it getting used more and more.

There's nothing simple about "HID LampArray". Specification is long
ang ugly... and we don't want to be stuck with with OpenRGB (links to QT!).

> Using HID LampArray also has the advantage that work has landed and is la=
nding
> to allow safely handing over raw HID access to userspace programs or even
> individual graphical apps with the option to revoke that access when it is
> no longer desired for the app to have access.

HID raw is not suitable kernel interface.=20

> Personally I really like the idea to just emulate a HID LampArray device
> for this instead or rolling our own API.  I believe there need to be
> strong arguments to go with some alternative NIH API and I have not
> heard such arguments yet.

If you don't want "some alternative API", we already have perfectly
working API for 2D arrays of LEDs. I believe I mentioned it before
:-). Senzrohssre.

								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--VyjLwRGdYiDTANtH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZxd0ogAKCRAw5/Bqldv6
8m6sAJ0YT3KbWDAvOAdjM55GB5oXYxhp9ACdEtOhCVRhzSDt8MHjQdKfqxkRBy8=
=9vbl
-----END PGP SIGNATURE-----

--VyjLwRGdYiDTANtH--

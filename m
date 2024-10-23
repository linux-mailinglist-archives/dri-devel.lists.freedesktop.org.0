Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396E9AD338
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 19:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDA910E20B;
	Wed, 23 Oct 2024 17:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="CFUVwxDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E33310E20B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 17:47:43 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 0DE661C00A3; Wed, 23 Oct 2024 19:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1729705661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kU9n7eT3lhEsHYkrEomNkv21bTRvaegj4/JZP474ohU=;
 b=CFUVwxDNrqIWF0pGYifru9eA8xVj5v/SQhJMhHDLc04y1PIS8ujS+DOASUuR6IuJj9msOw
 M6HaXTedzm0tzRTkHGUtbWCa/FjQRlPvvy/rCbACsBSx4+oX4+BSPoscCA3EUp+zGI8/8r
 ltqqqQz4RjperDIJG/jatGa9I+lBWUo=
Date: Wed, 23 Oct 2024 19:47:40 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <Zxk2vD5FHA2w2jTL@duo.ucw.cz>
References: <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
 <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
 <35a98b67-d1eb-4aa9-9d3f-025c94cd6b0f@gmx.de>
 <Zxf5u9jgmt9vpz2u@duo.ucw.cz>
 <c0791e1d-a63f-40fd-bcb8-5f2eec15c59e@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="5GlMUOsLquiBPieb"
Content-Disposition: inline
In-Reply-To: <c0791e1d-a63f-40fd-bcb8-5f2eec15c59e@tuxedocomputers.com>
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


--5GlMUOsLquiBPieb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > > Personally I really like the idea to just emulate a HID LampArray=
 device
> > > > > for this instead or rolling our own API.  I believe there need to=
 be
> > > > > strong arguments to go with some alternative NIH API and I have n=
ot
> > > > > heard such arguments yet.
> > > > If you don't want "some alternative API", we already have perfectly
> > > > working API for 2D arrays of LEDs. I believe I mentioned it before
> > > > :-). Senzrohssre.
> > > We may have to support 3D arrays of LEDs, so using a simple framebuff=
er
> > > would likely cause trouble.
> > Do you have pointer for device that is 3D?
>=20
> The example from the spec is a keyboard with lightbars on the side, the we
> actually sell notebooks with similar led configurations (mostly on the fr=
ont
> and not on the side). Example is the Sirius I implemented which has a not
> yet implemented lightbar on the front.

I also have lightbar on the keyboard. Put it is still close-enough to
2D. As would be bars on side or bar in front.

> > OpenRGB manages to map keyboard into plane... so what I'd propose is
> > this:
> >=20
> > Framebuffer
> > Information for each pixel:
> > 	    present ? (displays with missing pixels are pretty common)
> > 	    list of keys related to this pixel
> > 	    width, height, length (if we know them)
> >=20
> > Pixels map to keys M:N.
>=20
> How would iso-enter be mapped here?

I guess it depends on number of LEDs under the enter. I have one LED
under it, so it would be one pixel.

> How would the q-key be mapped relative the the 1-key? (they are exactly
> halve a key offset)

That would have to be decided. I remember this from openrgb:

https://www.gamingonlinux.com/2022/01/openrgb-gets-greately-expanded-hardwa=
re-support-in-the-07-release/

and that's one option.

> ~,1,2
> tab,missing pixel,q

I'd go with this one. OpenRGB does it on one screenshot, but there are
other screenshots. Advantage is that if someone does TAB with two
LEDs, we'll have place for it.

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--5GlMUOsLquiBPieb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZxk2vAAKCRAw5/Bqldv6
8vmMAJsESJ1FBGkIBcQMWxWbEH5vkbx9OgCfVS7mQ1P/Vg76qa7u8w64nAfCKjg=
=h2uG
-----END PGP SIGNATURE-----

--5GlMUOsLquiBPieb--

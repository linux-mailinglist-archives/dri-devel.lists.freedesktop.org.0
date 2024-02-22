Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9266685FFD9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8020010E069;
	Thu, 22 Feb 2024 17:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="lM3hEXNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AA310E069
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:42:37 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 2B21C1C0080; Thu, 22 Feb 2024 18:42:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1708623756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7+iTr5gsQUOr/RFi5kEyD7spJTWKMjOx6qK/fQXts4o=;
 b=lM3hEXNVlZoJUF4FIW1VT4TSTf+3jXX1RhHjbz0USgfJbo7J8viUGgfh+SMVmSqY6JxwdS
 P5S0KNyxLRZKKCe/H+r+1mi/5AHFJeecO8TKJwT3GHwIuzXpG8VX0bmcXERaUOQjzDeabh
 DNOZaxt24SrzeEnuibgTBoDSjjVBQrc=
Date: Thu, 22 Feb 2024 18:42:35 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Gregor Riepl <onitake@gmail.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Subject: Re: Future handling of complex RGB devices on Linux v2
Message-ID: <ZdeHi/WTNXEBevAX@duo.ucw.cz>
References: <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="M3rPF2twcL7SMY4r"
Content-Disposition: inline
In-Reply-To: <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
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


--M3rPF2twcL7SMY4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > To be honest, I think the kernel shouldn't include too much high-level =
complexity. If there is a desire to implement a generic display device on t=
op of the RGB device, this should be a configurable service running in user=
 space. The kernel should provide an interface to expose this emulated disp=
lay as a "real" display to applications - unless this can also be done enti=
rely in user space in a generic way.
>=20
> We really need to stop seeing per key addressable RGB keyboards as displa=
ys:
>=20
> 1. Some "pixels" are non square
> 2. Not all "pixels" have the same width-height ratio

They are quite close to square usually.

> 3. Not all rows have the same amount of pixels

True for cellphone displays, too. Rounded corners.

> 4. There are holes in the rows like between the enter key and then numpad

True for cellphone displays, too. Hole for camera.

> 5. Some "pixels" have multiple LEDs beneath them. These might be addressa=
ble
>    per LEDs are the sub-pixels ? What about a 2 key wide backspace key vs
>    the 1 key wide + another key (some non US layouts) in place of the bac=
kspace?
>    This will be "2 pixels" in some layout and 1 pixel with maybe / maybe-=
not
>    2 subpixels where the sub-pixels may/may not be individually addressab=
le ?

Treat those "sub pixels" as pixels. They will be in same matrix as the rest.

> For all these reasons the display analogy really is a bit fit for these k=
eyboards
> we tried to come up with a universal coordinate system for these at the b=
eginning
> of the thread and we failed ...

I'd suggest trying harder this time :-).

Best regards,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--M3rPF2twcL7SMY4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZdeHiwAKCRAw5/Bqldv6
8mBLAKC9+qlX2QD/GG3KxUQ6OdUQowvJqgCZAXRtFZkC9ADxIgsvu06fsWM2LoE=
=hnzz
-----END PGP SIGNATURE-----

--M3rPF2twcL7SMY4r--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275AD11F231
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9F56E370;
	Sat, 14 Dec 2019 14:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C610C6E914
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:51:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 7A00D292C1A
Date: Fri, 13 Dec 2019 10:51:45 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Prefix interrupt handlers' names
Message-ID: <20191213155145.GC3042@kevin>
References: <20191213123942.22891-1-ezequiel@collabora.com>
 <26b59d91-f974-de29-5ca8-6fbc2db29a11@baylibre.com>
 <31fd8f77-99b3-9edf-a23b-1484d9dcf48f@arm.com>
 <ea53ddf32af4e2c9c7f5c1e1a13b85afbffce150.camel@collabora.com>
MIME-Version: 1.0
In-Reply-To: <ea53ddf32af4e2c9c7f5c1e1a13b85afbffce150.camel@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0946614754=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0946614754==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> (Feedback for kernel patches on the same day, am I dreaming??)

That's panfrost!

> > Agreed, while the current implementation may be confusing it is at leas=
t=20
> > self-consistent. TBH it would probably be sufficient to save the bother=
=20
> > of allocating strings and just settle on "panfrost-{gpu,job,mmu}", sinc=
e=20
> > upstream users are unlikely to ever come across a system with more than=
=20
> > one Mali in it ;)
> >=20
> > And FWIW note that "GPU" really is the specific hardware name of that=
=20
> > IRQ output; it's not just a generic fill-in for "the one that isn't the=
=20
> > Job or MMU IRQ".
> >=20
>=20
> Yeah, that makese sense. So how about we go for "panfrost-{job,mmu}"
> and leave the "gpu" one?
>=20
> Or "panfrost-{gpu,job,mmu}" for consistency?

I would prefer "panfrost-{gpu,job,mmu}" for consistency, I think.

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl3zs5EACgkQ/v5QWgr1
WA1o3A//YrjMhm6W0b4GWy4Ou2oCDdo4Xb3PksSas/2IYFNF1+xj0EIKujkdvkiZ
A4ZjECuFsl2RoNfBTWN4V2I6yR93MshOjyVXCi0RcyrLgfemDpGirYOExMpmP+C+
0ujs4ARcZwrX+An5CpJDTB4Ha3QE4xhYv6p0MXg37+ulFUcX22ezL0Ye7GsEmqEN
Rpe+CjEJfaQsLwCq8AhsnnEgV8iuM5oDymo4DHPmmWfprRv0/cPicYWHmBYx9gq/
D0rffOdqHaiRcK1AcINb/SfFCX0ml3ww0k3XoasHOsSlicA8GIkGc11br5Li9Y8j
NEN405h8HnM5HGMd0ZJi/eiIapmAQlF9VfRFIXQIzZJbEya5TbWmbMguKA1ObA1i
PKm1lKXdaRMazZM0eQHNS2TLxUksuch39W3C3BgkUMsFRAsM2AEJzPYlIJ0Yw9Od
9QeG+HHfy6jkPi29eK/4uJxImjEZ8qbhW2dIi8WjEyaYm3CccfgM8KUyu/YRCBG/
g1YZLCDEifgEdZOOpiwujg2yb/0G6GNAS7zzzgRGpF53dMwp0W5ivP8R40tYg4Ki
aKvhmv1sOC3sdw5ysxwfeXP+ftXJGYR1DCwTysmn+b9iWl6xDIveHbUhX/X8AEj1
iM5oqPHGveMvhw7+goy+2f/nWjJpleBJ7gf10YDl91baMuPrlYU=
=vDKq
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--

--===============0946614754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0946614754==--

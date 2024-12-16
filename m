Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B036C9F3A71
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 21:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106A510E791;
	Mon, 16 Dec 2024 20:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IcmSPuCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A3B10E791
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 20:08:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DA334A4199C;
 Mon, 16 Dec 2024 20:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E92C4CED0;
 Mon, 16 Dec 2024 20:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734379693;
 bh=4+HDgEWl3tgx+EFD0IGkfHmZ98WZWavkoqmditqQ+k8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IcmSPuCQfi5M4Y0kOO1sL5FcNdoek1I6ewlhOBCJ1I0BAZYfI7G5r9cUQBIm77SXy
 LDS0OcP/5NwUdU6Zpl+KHgIebkU6CfBwZv99REoLNLKZGcUFUaKpaVN1KEGJI24tWZ
 gEsdsJV4nvIrsM2kJ8qkHQMNbgq6DJtS6hm3w2oSDZYV3FTgCxKjyETpOyMyWkGz9c
 h7pJssMRALGAouX9Z/Fh9PSQFzQNKyOmQGmDsJ/pBE371JKe+dne/a0ks/tJ4hIO/F
 aFCVg24b1DLy+N+0swb33/JaS/Y5GXcSH9XaYdu6VeeaRFk0YkQ8GbSy/EPUFjWEfy
 3yHfeiNSmB9rQ==
Date: Mon, 16 Dec 2024 20:08:08 +0000
From: Conor Dooley <conor@kernel.org>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "dmurphy@ti.com" <dmurphy@ti.com>, "lee@kernel.org" <lee@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "danielt@kernel.org" <danielt@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "afd@ti.com" <afd@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
Message-ID: <20241216-golf-jimmy-9011f11fd446@spud>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
 <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
 <20241206-brim-talcum-f5e8c504c572@spud>
 <bea002a5838181ad5d8e1588643110ecb7c9674d.camel@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Gnuq1+5+hrelHmoe"
Content-Disposition: inline
In-Reply-To: <bea002a5838181ad5d8e1588643110ecb7c9674d.camel@siemens.com>
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


--Gnuq1+5+hrelHmoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 05:44:15PM +0000, Sverdlin, Alexander wrote:
> Hello Conor,
>=20
> On Fri, 2024-12-06 at 17:14 +0000, Conor Dooley wrote:
> > > Add Texas Instruments' LP8864/LP8866 bindings into LP8860 converting =
them
> > > into YAML format simultaneously. While here, drop the index of the "l=
ed"
> > > subnode, this one is neither used nor mandated by the drivers. All the
> > > *-cells properties are therefore not required.
> >=20
> > Are you sure this is a correct thing to do? The lp8860-q1 product link
> > cites it as being a 4-channel device. Even if the kernel only ever
> > supports it as a single-channel device, the binding should reflect what
> > it is capable of doing.
>=20
> my understanding is:
> - The whole family is multi-channel (4 or 6), but this is rather used int=
ernally
> in the chip for power balancing; separate diagnostics is provided. From t=
he user
> perspective one has only one brightness per chip.

One brightness perhaps, but what do you do where several LEDs of
different colours are connected? Or if one was to be active-low? I don't
see the benefit of changing the binding in a way that makes it less
able to describe the hardware.

> - The lp8860 driver didn't attempt to do anything with the index.

I don't see this as being relevant, the bindings need only address what
the hardware is able to do. The driver may only implement a subset of
that, and that is perfectly okay.

> I'm glad Andrew Davis had a time for a pre-public review of the new bindi=
ng
> and actually suggested this simplification.

Okay.

Thanks,
Conor.

--Gnuq1+5+hrelHmoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2CIqAAKCRB4tDGHoIJi
0hD1AQClAtkIQyEkQvzH33T8NMh8UZp9X3d5ApDNH+TfRk2O8gEAnUENd8xG/lEY
dYuPlrmvyG32ObQtm5TeGGd+fRVKww0=
=Inv6
-----END PGP SIGNATURE-----

--Gnuq1+5+hrelHmoe--

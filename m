Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E073763821
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 15:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA6D10E47E;
	Wed, 26 Jul 2023 13:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1859D10E47E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 13:54:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C00461A41;
 Wed, 26 Jul 2023 13:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E204C433C8;
 Wed, 26 Jul 2023 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690379676;
 bh=sGxSXz0cFWUM6mikGWU97zEscdT5IkbZGSscNfphwp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ia3LVzruSjPX6o2KAMdWmgQmQ2Pl4MAzDbD6mjkIhGw1N4uU6zfcDQJw/4C7R8n6m
 7NvETzHIqnlrhmCK+wjnNUIN6JnJ+AZV1g2D9yZ3GyFcp2kqbA6HLe7GkMUTMtm8z3
 WRYRWYrJZXtezvXpsOD3GulSSEwsN01iyd7MCbFB7MTxqHvU6DBoydfKxe0Cy8B4rY
 NEsX7oj9A5keo9GjJkf4lCrk1zo5nxJfby91VmBqh6hTfgyKFHFN6iRQEIb78zuZ+H
 nMs/5jBBz0ybQGhwElBguz6RtLPfG/XZXlj2b3+rHyWVElH7/giSlHNKizfW9r5vZ9
 DsvB9HRewAaDw==
Date: Wed, 26 Jul 2023 15:54:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
Message-ID: <g6bu3b26evk464x4cn77xnzjiuotsq7pfvyakfvwnir5e3ihnk@2jh4dd56fsza>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
 <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
 <874jlqlv5v.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdX+J848ckG2JqsuDkRcWzRypw_Kv=0G+Hc329xstu_nqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cczvehknair5dagk"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX+J848ckG2JqsuDkRcWzRypw_Kv=0G+Hc329xstu_nqQ@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cczvehknair5dagk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 02:33:06PM +0200, Geert Uytterhoeven wrote:
> > >> Also, Javier pointed me to a discussion you had on IRC about using d=
evm
> > >> allocation here. We can't really do that. KMS devices are only freed
> > >> once the last userspace application closes its fd to the device file=
, so
> > >> you have an unbounded window during which the driver is still callab=
le
> > >> by userspace (and thus can still trigger an atomic commit) but the
> > >> buffer would have been freed for a while.
> > >
> > > It should still be safe for (at least) the data_array buffer. That
> > > buffer is only used to store pixels in hardware format, and immediate=
ly
> > > send them to the hardware.  If this can be called that late, it will
> > > fail horribly, as you can no longer talk to the hardware at that point
> > > (as ssd130x is an i2c driver, it might actually work; but a DRM driver
> > >  that calls devm_platform_ioremap_resource() will crash when writing
> > >  to its MMIO registers)?!?
> >
> > At the very least the SPI driver will fail since the GPIO that is used =
to
> > toggle the D/C pin is allocated with devm_gpiod_get_optional(), but also
> > the regulator, backlight device, etc.
> >
> > But in any case, as mentioned it is only relevant if the data_array buf=
fer
> > is allocated at probe time, and from Maxime's explanation is more corre=
ct
> > to do it in the .atomic_check handler.
>=20
> You need (at least) data_array for clear_screen, too, which is called
> from .atomic_disable().

I'm not sure I get what your concern is?

Even if we entirely disable the plane, the state will not have been
destroyed yet so you still have at least access to the data_array from
the old state.

Maxime

--cczvehknair5dagk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMElmgAKCRDj7w1vZxhR
xV3/AQDnwMW+Ru8NZqVM/6Uv+aypaEiFS7yM6LQxS3jkrDgCJwEA9l1H6lonPdO4
pWvLJ9iOIlUU+aoy6YCiZ8LSuDgdYA4=
=pQQv
-----END PGP SIGNATURE-----

--cczvehknair5dagk--

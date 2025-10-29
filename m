Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE2C19121
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6F910E734;
	Wed, 29 Oct 2025 08:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vPg3Zagk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0682210E72B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:34:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BF1061758;
 Wed, 29 Oct 2025 08:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3DCC4CEF7;
 Wed, 29 Oct 2025 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761726896;
 bh=T5M4OYzbtGq4uNL+woM2n6WsyikovnjBbwLn9F2Otxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vPg3ZagkEoJXDNC196gMdQDa9jAew5cDxdRbtvJwE4Zt6gKxERb1EzG9jdai8DuYA
 L3MPZ5JhBuhekw5n1UfkeWj9397lJk6Bi5WuVOASSftwgcaLz4OJlTK1o4KqLwru4J
 AoGPupK4mT7OQcADSjE/62F80JCtX7rUu/EBxcsdpUTu7bnvd6eFzom3MhVGqgLFEq
 vEFDUGeVO9TaRFNw6ru1Wt853khKhdx69lq6vqyFpfhiXWI+bzd8y3lY/zwtjCdcAH
 UnAMtKseRsuvGM0R2sb+Ccpf+4I3wOiR8LBka1ux/9bsnPUkUk5y5UHxoYdf8eqgBu
 +rfxwQxlAA92w==
Date: Wed, 29 Oct 2025 09:34:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Message-ID: <k5ktlmzszlk2qzn4mteduardoda7npxyd6m5rn6avjneayoqbw@q32utxpy7lk6>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
 <2756316.lGaqSPkdTl@fedora.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tqge3ljteei5cd4q"
Content-Disposition: inline
In-Reply-To: <2756316.lGaqSPkdTl@fedora.fritz.box>
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


--tqge3ljteei5cd4q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
MIME-Version: 1.0

On Tue, Oct 28, 2025 at 08:58:05AM +0100, Francesco Valla wrote:
> On Monday, 27 October 2025 at 11:09:56 Maxime Ripard <mripard@kernel.org>=
 wrote:
> > > Once compiled inside the kernel, the client can be enabled through the
> > > command line specifying the drm_client_lib.active=3Dsplash parameter.
> > >=20
> > > =3D=3D Motivation =3D=3D
> > >=20
> > > The motivation behind this work is to offer to embedded system
> > > developers a new path for a simple activation of the display(s)
> > > connected to their system, with the following usecases:
> > >=20
> > >   - bootsplash - possibly displaying even before init;
> > >   - early activation of the display pipeline, in particular whenever =
one
> > >     component of the pipeline (e.g.: a panel) takes a non-negligible
> > >     time to initialize;
> > >   - recovery systems, where the splash client can offer a simple feed=
back
> > >     for unattended recovery tasks;
> > >   - update systems, where the splash client can offer a simple feedba=
ck
> > >     for unattended update tasks.
> >=20
> > If plymouth cannot be used by embedded systems for some reason, then you
> > should work on a plymouth alternative.
>
> Thing is: any possible alternative would still start after userspace has
> been loaded, checked (in case of secure boot, which is ubiquitous now)
> and initialized. This means, at least in my usecases, several hundreds of
> milliseconds after userspace start, to be summed to the panel initializat=
ion
> time.

Yeah, but you have a *lot* of policies even for something as simple as a
bootsplash:

  * Do you want it on all your screens or just one, if so, which one?

  * If the bootsplash image doesn't fit the screen you chose, what
    should you do? stretch, crop, keep the same resolution? If the image
    is smaller than the screen, where do you want to put it? Top left
    corner? In the center?

  * If there's BGRT, do you want to have BGRT always, bootsplash always,
    compose the bootsplash with BGRT? If so, same questions than before.

etc.

The kernel can't answer all these questions, and can't address every
possible use case. Userspace can, and that's largely why plymouth
exists.

But If the main thing you care about is boot time, U-Boot has everything
needed to setup a bootsplash early.

> > > While the first seems the most obvious one, it was the second that ac=
ted
> > > as the driver, as in the past I had to implement a ugly workaround us=
ing
> > > a systemd generator to kickstart the initialization of a display and
> > > shave ~400ms of boot time.
> > >=20
> > > The last 2 usecase, instead, are the reason I dropped the "boot" part
> > > from bootsplash.
> > >=20
> > > =3D=3D Implementation details =3D=3D
> > >=20
> > > The design is quite simple, with a kernel thread doing the heavylifti=
ng
> > > for the rendering part and some locking to protect interactions with =
it.
> > >=20
> > > The splash image is loaded using the firmware framework, with the cli=
ent
> > > expecting to find a binary dump having the right dimensions (width and
> > > height) and FOURCC format for each modeset. Given a 1920x1080 RGB888
> > > modeset, the client will for example search for a firmware named:
> > >=20
> > >    drm_splash_1920x1080_RG24.raw
> > >=20
> > > If the firmware cannot be loaded directly, the NOUEVENT sysfs fallback
> > > mechanism is used to let userspace load the appropriate image.
> > >=20
> > > =3D=3D Testing =3D=3D
> > >=20
> > > Testing was done on qemu (both with vkms and bochs drivers), on a HDMI
> > > display connected to a Beagleplay and on a ILI9341 SPI display connec=
ted
> > > to a i.MX93 FRDM board. All these platforms revealed different
> > > weaknesses that were hopefully removed.
> > >=20
> > > =3D=3D Open points / issues =3D=3D
> > >=20
> > > The reason for this being an RFC is that there are several open point=
s:
> > >=20
> > >   - Support for tiled connectors should be there, but has not been
> > >     tested. Any idea on how to test it?
> >=20
> > Did you mean tiled formats?
> >=20
>=20
> No, AFAIU the tiled connectors are different connectors that feed differe=
nt
> panels, which however are part of a single logical screen. Support for th=
is
> setup is present at drm level [1], but I'm not familiar with it.
>=20
> I've only found this used inside the i915 Intel driver [2].

TIL, thanks.

> > >   - I'm not entirely convinced that using the firmware framework to l=
oad
> > >     the images is the right path. The idea behind it was to re-use the
> > >     compressed firmware support, but then I discovered it is not there
> > >     for built-in firmware.
> >=20
> > Yeah, firmware loading for this has a few issues (being tedious to setup
> > for when built-in being one). I think just going the fbdev penguin road
> > is a better choice: you provide the path, and it's embedded in the
> > kernel directly.
> >=20
>=20
> Yes, this is already working, but if large-ish images are used, the loadi=
ng
> time for them defeats the entire purpose of an in-kernel splash.

The loading time of what exactly? If the image is in some section of the
binary, you wouldn't have to load anything.

Maxime

--tqge3ljteei5cd4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaQHRqAAKCRAnX84Zoj2+
djzCAYDaKmYFhpOkgKZJJ+Bb+IhDgJSV9GzaDbqTEpY8XdxJdV1TaCl22fNgNIFg
BhrgPE8BgNYwZoD2kVyUo/rssBBRzXJJWNVl2fj6b5Ne5C7lWCsQahWMesz3nERo
J0UAczwfMw==
=tBvk
-----END PGP SIGNATURE-----

--tqge3ljteei5cd4q--

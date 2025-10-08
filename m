Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF01BC554D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 15:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5621510E0D7;
	Wed,  8 Oct 2025 13:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XOOi85NF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4358310E0D7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 13:57:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6BD6E61EE2;
 Wed,  8 Oct 2025 13:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD56C4CEE7;
 Wed,  8 Oct 2025 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759931875;
 bh=7W274DIEAcbVbUFnAm7Dz1UUk92d5eL3JrG4sX+1xkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XOOi85NFwxmQ5r+FC5yC79G8GfIgoymwZT+B3ETxWD5pIuS9zIhcC8Bt8x76EARL6
 QZFynuAnf83EX4oSlTnMxrYMBndg7N2VOxgUafqBpkSsK07kfHZQ/LvXb5LucXeAm1
 BypCBQ0uK6JGo+wfLFWaJv3hgVcbTXOleTirQrnpaGJm6Z56kbFMjwIb3cRFQVNeI2
 tB+sKVeWgjdyn+6RJcxawl3Um4y7VXyLZD3jE8YoYQ2qFUgoWElJP3bjulW7yFomLf
 nXSN3cfxD605cA3DX9DCO/aC1CfcWFcL0NelIuc+JCXpYIS3vkaQG6x+hZCS8WPmyW
 i3a17Y5iw7ysA==
Date: Wed, 8 Oct 2025 15:57:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH 00/29] drm: Implement state readout support
Message-ID: <20251008-nondescript-snobbish-rattlesnake-d486a7@houat>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <f87700f1-ed9c-40fe-9327-efe574820139@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ikx42ojfqow65kg7"
Content-Disposition: inline
In-Reply-To: <f87700f1-ed9c-40fe-9327-efe574820139@ideasonboard.com>
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


--ikx42ojfqow65kg7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/29] drm: Implement state readout support
MIME-Version: 1.0

Hi Tomi,

Thanks for having a look.

On Wed, Oct 08, 2025 at 04:07:57PM +0300, Tomi Valkeinen wrote:
> On 02/09/2025 11:32, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's a series that implement what i915 calls "fastboot", ie,
> > initializing the initial KMS state from the hardware state at boot, to
> > skip the first modeset if the firmware already set up the display.
> >=20
> > This series creates the infrastructure in KMS to create that state by
> > relying on driver specific hooks. It also implements some infrastructure
> > to check during non-blocking commits that the readout helpers work
> > properly by reading out the state that was just committed and comparing
> > it to what was supposed to be commited.
> >=20
> > This relies on another set of driver hooks to compare the entities
> > states, with helpers providing the default implementation.
> >=20
> > It then implements the readout support in the TIDSS driver, and was
> > tested with the SK-AM62 board. This board in particular is pretty
> > interesting, since it relies on an DPI to HDMI bridge, and uses the
> > drm_bridge_connector infrastructure.
> >=20
> > So the readout works with the current state of the art on embedded-ish
> > platforms.
> >=20
> > The whole thing feels a bit clunky at the moment:
> >=20
> >   - The initial state buildup ties everything together in a state in the
> >     old state pointer. It's useful for the initial readout because
> >     accessors can then use the usual state accessors to look into the
> >     state of other entities. But one of the argument for it was also
> >     that for state comparison, it allows to compare the new state
> >     (committed) to the old state (readout). It doesn't really work in
> >     practice, since in such a case the old state contains the previous
> >     hardware state to be freed, and thus we would end up with a memory
> >     leak
> >=20
> >   - The framebuffer refcounting is broken.
> >=20
> >   - The tidss atomic_flush waits for the go bit on the initial
> >     modesetting, except that if the state is readout we didn't commit
> >     anything and the driver will wait forever, eventually resulting in
> >     commit timeout
>=20
> Isn't atomic flush part of the modeset? Why is it called if there's no
> modeset.

No, atomic_flush is ran when we update the planes, so it will trigger
here on the first page flip.

> >   - The tidss_crtc_state fields are not read properly at the moment
> >     either.
>=20
> Just because no implemented, or was there something funny with them? I
> guess there's some reverse-mapping that needs to be done.

The bus_format field isn't read properly, I wasn't quite sure what was
going on there.

And also, for bridges, I've yet to figure out a way to read / find the
input/output formats.

> > The main thing works though: the state is picked up properly, doesn't
> > trigger a modeset if what was programmed is the one the first modeset
> > tries to pick as well, will switch properly if it isn't, etc.
>=20
> This is pretty interesting work. I haven't tested, and I'm sure it still
> breaks in a million ways if used with anything else but the HW you're
> using =3D).

Thanks :D

> This is related to the boot-splash screen work I've been working on for
> quite a while, although at a different stage.

As far as I'm concerned, once this lands, your work isn't needed at all.

> In my patches I have been trying to avoid hw reset, so that if the DSS
> has been set up by the bootloader, we'll just let it run until we get
> a modeset.

We really only need to power up the hardware around
drm_mode_config_reset.

Once we're done, either the hardware will be active or inactive, but
we'll know for sure.

> And now your series would potentially remove that modeset too, so, in
> theory, we could get up to X/Weston from bootloader with just a single
> modeset in the bootloader.
>=20
> Of course, fbdev/simpledrm will mess things up there. I had some hacks
> for fbdev too, to retain the bootsplash image, but it was just hacking.

And it works also with fbdev, since fbdev or whatever will trigger a
new commit we can compare to.

Maxime

--ikx42ojfqow65kg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaOZt3AAKCRAnX84Zoj2+
duN8AYDRcC+kqLWawVkJWZWy/tituvRwMjHasePkmeDvyIH8xmjdqXaguaObaN9z
pwuLXxMBgOtuTfUQ5NTo06cqR292ZLzNu1UUTJmPRWl5Vjoro+qDRZdTBzk1LWKu
Mp5VEzI8ww==
=c02J
-----END PGP SIGNATURE-----

--ikx42ojfqow65kg7--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E0C0CE34
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777D510E012;
	Mon, 27 Oct 2025 10:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bQgqcUAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E2710E012
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:10:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 907626118D;
 Mon, 27 Oct 2025 10:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E162AC4CEF1;
 Mon, 27 Oct 2025 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761559799;
 bh=iPy9PTr3E6+/Ob+n9HMKMgQGzj72xG8nvstl1/tHSgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQgqcUAZfk9WrQ9EwaUhEg793Ot9p9gugIruVAI5kXguUun+aVKaJ6SeFg+H/WiI2
 E2xFNizI4+u1MtkE1j5HRG/ckt718iPlvLArv4dlRUpsgXVoaGdvBjxbkIH5KDHad+
 1Cv6l87yVGeay2lXjwtu1ynJhYuFnmuV3ZqRWEQfRH64ZdgSOcHtTWE+mVzu9GYuif
 LL1GvDqqiTfy4Ocl73/6sL1sunIAYB8JFMzjEksL5rE6razCE93zioC9Ik1RmjZI0j
 hgM7AWxYwNJFGYp766gKSN80WvnPZeO6mG8nUWVUkVSLpjwb5QOgycpcgqauzX2gCE
 urPqvCx2ITz4w==
Date: Mon, 27 Oct 2025 11:09:56 +0100
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
Message-ID: <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6xetpxgspicxrvf3"
Content-Disposition: inline
In-Reply-To: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
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


--6xetpxgspicxrvf3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
MIME-Version: 1.0

Hi,

On Mon, Oct 27, 2025 at 12:03:00AM +0100, Francesco Valla wrote:
> this patchset adds a new DRM client offering splash functionalities,
> able to draw to screen:
>=20
>   - a colored background;

So, I like that part, and we were recently discussing about this.

>   - a single-line text message, which can be set through sysfs or
>     directly from the kernel command line;
>   - a very simple progress bar, which can be driven through sysfs;
>   - a static image (optional).

But there's no reason to have all that in the kernel, and we already
have userspace components to do so (plymouth being the main "mainstream"
one).

> Once compiled inside the kernel, the client can be enabled through the
> command line specifying the drm_client_lib.active=3Dsplash parameter.
>=20
> =3D=3D Motivation =3D=3D
>=20
> The motivation behind this work is to offer to embedded system
> developers a new path for a simple activation of the display(s)
> connected to their system, with the following usecases:
>=20
>   - bootsplash - possibly displaying even before init;
>   - early activation of the display pipeline, in particular whenever one
>     component of the pipeline (e.g.: a panel) takes a non-negligible
>     time to initialize;
>   - recovery systems, where the splash client can offer a simple feedback
>     for unattended recovery tasks;
>   - update systems, where the splash client can offer a simple feedback
>     for unattended update tasks.

If plymouth cannot be used by embedded systems for some reason, then you
should work on a plymouth alternative.

> While the first seems the most obvious one, it was the second that acted
> as the driver, as in the past I had to implement a ugly workaround using
> a systemd generator to kickstart the initialization of a display and
> shave ~400ms of boot time.
>=20
> The last 2 usecase, instead, are the reason I dropped the "boot" part
> from bootsplash.
>=20
> =3D=3D Implementation details =3D=3D
>=20
> The design is quite simple, with a kernel thread doing the heavylifting
> for the rendering part and some locking to protect interactions with it.
>=20
> The splash image is loaded using the firmware framework, with the client
> expecting to find a binary dump having the right dimensions (width and
> height) and FOURCC format for each modeset. Given a 1920x1080 RGB888
> modeset, the client will for example search for a firmware named:
>=20
>    drm_splash_1920x1080_RG24.raw
>=20
> If the firmware cannot be loaded directly, the NOUEVENT sysfs fallback
> mechanism is used to let userspace load the appropriate image.
>=20
> =3D=3D Testing =3D=3D
>=20
> Testing was done on qemu (both with vkms and bochs drivers), on a HDMI
> display connected to a Beagleplay and on a ILI9341 SPI display connected
> to a i.MX93 FRDM board. All these platforms revealed different
> weaknesses that were hopefully removed.
>=20
> =3D=3D Open points / issues =3D=3D
>=20
> The reason for this being an RFC is that there are several open points:
>=20
>   - Support for tiled connectors should be there, but has not been
>     tested. Any idea on how to test it?

Did you mean tiled formats?

>   - I'm not entirely convinced that using the firmware framework to load
>     the images is the right path. The idea behind it was to re-use the
>     compressed firmware support, but then I discovered it is not there
>     for built-in firmware.

Yeah, firmware loading for this has a few issues (being tedious to setup
for when built-in being one). I think just going the fbdev penguin road
is a better choice: you provide the path, and it's embedded in the
kernel directly.

>   - Again on the firmware loading: CONFIG_LOADPIN would interfere with
>     sysfs loading.
>   - And again: FW_ACTION_NOUEVENT only has one user inside the kernel,
>     leading me to think it is de-facto deprecated. And still, uevents
>     for firmware loading seem frowned upon these days...=20
>   - Generating binary dumps for... basically any format is not so
>     straightforward. I crafted a Python tool with AI help which seems
>     to work quite well, but I honestly did not yet understood which is
>     the policy for AI-generated code inside the kernel, so it is not
>     included in this patch set. All client code is genuine, though.

BMP is simple enough to support so we should probably use that instead
of a custom format.

Maxime

--6xetpxgspicxrvf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaP9E9AAKCRAnX84Zoj2+
dv9HAX4ih+okolm988IsppngNpozRPH+0bTL7tTiS+WP7ElIwx/nDF3e+NDgLokO
HobomAABgO2avIRLa6ShC6ZiIhdpXMqBRPWoLDGc7sMbZFtl0lza9IpYnTIkD8Ao
Xxid+w1qBA==
=hxwS
-----END PGP SIGNATURE-----

--6xetpxgspicxrvf3--

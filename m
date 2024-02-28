Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6686B467
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4119C10E713;
	Wed, 28 Feb 2024 16:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IF29Uk+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3F10E713
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:14:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C954BCE12A1;
 Wed, 28 Feb 2024 16:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BCCC433C7;
 Wed, 28 Feb 2024 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709136844;
 bh=+5C3vqa46Z5TueGROchrOvaCvAo76c8wgPV51Z2KIGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IF29Uk+Vy1iQLc3TQ+atArn7bdmZj6yahnQjdhYGcsd0/SSi/iawTZauHyg6Ymw8V
 2iDS/Kg9dGoibjE5vPPc65LJII0QWE2Fd9pIoS/HWtArrJxD7gu/XG8WLvnxPCrAcA
 nBObrXI8i8+NDt2hEBJv0tZaJ2wiasPBy2jkxyc3O0+ZoXtkwyPpWNchqybJSelxeI
 nESehopb5bztSkIksYrz/utYZJvRw1Pa2NZVtj06cKrkCczfMb9MLjLQszvkzlH8BP
 E4GCuiTy52eeU+qL83deT9FS/ylbZdJSPKoH/yPMXQhBaQdXQMV8glTNH38qGOj2Fk
 jv4Ib5rF/GwwQ==
Date: Wed, 28 Feb 2024 17:14:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240228-nice-flat-cormorant-badff7@houat>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iwivmlctecqyfcwu"
Content-Disposition: inline
In-Reply-To: <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
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


--iwivmlctecqyfcwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 27, 2024 at 09:51:06AM +0000, Simon Ser wrote:
> On Monday, February 26th, 2024 at 18:23, Dave Stevenson <dave.stevenson@r=
aspberrypi.com> wrote:
> > > and I've also completely missed any kernel command line
> > > arguments manipulating KMS properties.
> >=20
> > "tv_mode" on the command line is handled in
> > drm_mode_parse_cmdline_options() [3], as are rotate, reflect_x,
> > reflect_y, margin_[left|right|top|bottom], and panel_orientation all
> > to set the relevant KMS properties.
> >=20
> > Having "video=3DComposite-1:PAL,tv_mode=3DMono" on the kernel command l=
ine
> > will set up connector Composite-1 with the standard 720x576 50Hz
> > interlaced timings, and DRM_MODE_TV_MODE_MONOCHROME selected on the
> > tv_mode property. Swap in different tv_mode descriptions as required
> > (eg PAL,tv_mode=3DSECAM), although some make little sense.
> >=20
> > That's the main route I'm looking at for configuring this property,
> > for situations such as having a black and white TV connected. You
> > don't get the opportunity to interrogate a composite display over what
> > it supports, so it has to be configured manually somewhere in the
> > system. If your monitor doesn't support the system default, then you
> > can't see a GUI in order to change the option, and there is no
> > guaranteed supported configuration so the command line is about the
> > only option.
> >=20
> > The use cases for runtime switching of the "tv_mode" are exceedingly
> > rare, so IMHO the property doesn't need exposing through the UAPI.
> > However it was added to the UAPI about 8 years ago for vc4 and sunxi,
> > and is also now used by other drivers, so can't be reverted. Does that
> > mean it can now never be changed without jumping through the hoop of
> > creating some userspace user?
>=20
> I don't know what the rules were 8 years ago, but the current uAPI rules
> are what they are, and a new enum entry is new uAPI.

TBF, and even if the wayland compositors support is missing, this
property is perfectly usable as it is with upstream, open-source code,
through either the command-line or X.org, and it's documented.

So it's fine by me from a UAPI requirement side.

Maxime

--iwivmlctecqyfcwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd9byAAKCRDj7w1vZxhR
xS+rAQC3pv4X/pZYkwS3813abI/HCnD/jUXKh/M9hptl1+NUAwEAwICyoyWFuXRC
HnfJKHzq7c2riNgK9SixO6u+sFrC1wI=
=EIhy
-----END PGP SIGNATURE-----

--iwivmlctecqyfcwu--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B20846CFD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 10:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1D510E744;
	Fri,  2 Feb 2024 09:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JVHC9lQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD1C10E744
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:53:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54DD061422;
 Fri,  2 Feb 2024 09:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A2DC433C7;
 Fri,  2 Feb 2024 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706867620;
 bh=Bfd/GkSJgdo+XNvnX3vfrEM+2s3tKVMNSvNG435RkV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JVHC9lQt9mU1obANrSeVdamsYY76q01QCeJgmuj4Op4N5qEpIs91Ylf59bTt/H0pV
 keXz4Up2QyG6pKjjkx0q6lyABhoXp/zvH1lXdEmPsyb852qA0dhDKCjUuPr71nSVTs
 +zwWYobiAkhZlPsC85fw5wS5UtVdD6qFT77P0FIYMNfvHrAzTHOKrkbL0d1fcLuKRd
 r08sTsdJB7RwfkrAUMROx1ARM785L4Vzcr957zldDzYN7xgxbUr1dLdYvxFuZ29rN6
 P6tePJ7EB7HNDokdhssmSpDldoyxfqxkhB6L3dKtXvOK4Ic6sky3bG+0KD2aHjPoH9
 PKZBj9AtDgpcg==
Date: Fri, 2 Feb 2024 10:53:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, marcheu@google.com, seanpaul@google.com, 
 nicolejadeyee@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
Subject: Re: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <3nofkwzgnf4yva2wfogdbii47ohpi2wm5vp6aijtg3emxyoowt@twyreqz7ai3g>
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zt2zjtvam7zfj272"
Content-Disposition: inline
In-Reply-To: <20240202102601.70b6d49c@xps-13>
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


--zt2zjtvam7zfj272
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

On Fri, Feb 02, 2024 at 10:26:01AM +0100, Miquel Raynal wrote:
> pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +0200:
>=20
> > On Thu, 01 Feb 2024 18:31:32 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >=20
> > > Change the composition algorithm to iterate over pixels instead of li=
nes.
> > > It allows a simpler management of rotation and pixel access for compl=
ex formats.
> > >=20
> > > This new algorithm allows read_pixel function to have access to x/y
> > > coordinates and make it possible to read the correct thing in a block
> > > when block_w and block_h are not 1.
> > > The iteration pixel-by-pixel in the same method also allows a simpler
> > > management of rotation with drm_rect_* helpers. This way it's not nee=
ded
> > > anymore to have misterious switch-case distributed in multiple places=
=2E =20
> >=20
> > Hi,
> >=20
> > there was a very good reason to write this code using lines:
> > performance. Before lines, it was indeed operating on individual pixels.
> >=20
> > Please, include performance measurements before and after this series
> > to quantify the impact on the previously already supported pixel
> > formats, particularly the 32-bit-per-pixel RGB variants.
> >=20
> > VKMS will be used more and more in CI for userspace projects, and
> > performance actually matters there.
> >=20
> > I'm worrying that this performance degradation here is significant. I
> > believe it is possible to keep blending with lines, if you add new line
> > getters for reading from rotated, sub-sampled etc. images. That way you
> > don't have to regress the most common formats' performance.
>=20
> While I understand performance is important and should be taken into
> account seriously, I cannot understand how broken testing could be
> considered better. Fast but inaccurate will always be significantly
> less attractive to my eyes.

AFAIK, neither the cover letter nor the commit log claimed it was fixing
something broken, just that it was "better" (according to what
criteria?).

If something is truly broken, it must be stated what exactly is so we
can all come up with a solution that will satisfy everyone.

> I am in favor of making this working first, and then improving the code
> for faster results. Maybe the line-driven approach can be dedicated to
> "simpler" formats where more complex corner cases do not happen.

Which ones?

Maxime

--zt2zjtvam7zfj272
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZby7oAAKCRDj7w1vZxhR
xXwxAPsFVsJYK4xWIWUhq8+84+oxR2kLDVawImhl/tLFMgP18wD+Kf7nPl9alhHN
QaVk2lv/sl2IZKrDqGyRJ0lq8HVPXQE=
=qz9+
-----END PGP SIGNATURE-----

--zt2zjtvam7zfj272--

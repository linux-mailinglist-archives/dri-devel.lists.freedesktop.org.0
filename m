Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C28CD627
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 16:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A08F10E5C1;
	Thu, 23 May 2024 14:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ToYIUUJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F7E10E3D8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 14:51:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5DA8162831;
 Thu, 23 May 2024 14:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FAAC2BD10;
 Thu, 23 May 2024 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716475888;
 bh=tcck0ca+KN6GJNPVstAL9bfBjAJE/Xw2wl7pB/dDWUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ToYIUUJneDWyFjY98OWXFHoRlih1OGSXJpTIzVv8QFeh35tdPT+2kcZfzf7SP9dFx
 ImQuQJgNTBfUzpR5Z5OLL5IMtUOfnyha+vAHgBY1AE1xpTXV31ArM83LgaoE7mvsMF
 9EaqkCtPIpkbQF234BM+D9lPfySgjvccDewhdDRtygb8XEFXiaVlh8m0gvjWdz/6DY
 Mdc2TWQyCJCobCRAmmTnQoMqs+dWG0PSNXajHZv/3r/HvQ19/CIo2IXXF9kKNcm3Wj
 9vSfOtAg6tJl1vWIn/KONpjxiad/jpjZOI0pNjxAssS/y9b62R8BesBOP6XeNjw/rb
 M6m1dzcdX5LcA==
Date: Thu, 23 May 2024 16:51:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, 
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240523-graceful-shellfish-of-development-db7bd8@houat>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
 <20240228-nice-flat-cormorant-badff7@houat>
 <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
 <ZeBh3N4uttG53qhU@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mi5wodqhzroznsoe"
Content-Disposition: inline
In-Reply-To: <ZeBh3N4uttG53qhU@phenom.ffwll.local>
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


--mi5wodqhzroznsoe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Reviving this thread because I'm not sure what the outcome was.

On Thu, Feb 29, 2024 at 11:52:12AM GMT, Daniel Vetter wrote:
> > The only thing I'm saying is that this breaks the usual DRM requirement=
s.
> > If, as a maintainer, you're fine with breaking the rules and have a good
> > motivation to do so, that's fine by me. Rules are meant to be broken fr=
om
> > time to time depending on the situation. But please don't pretend that
> > modetest/xrandr is valid user-space to pass the rules.
>=20
> I think it bends it pretty badly, because people running native Xorg are
> slowly going away, and the modetest hack does not clear the bar for "is it
> a joke/test/demo hack" for me.
>=20
> I think some weston (or whatever compositor you like) config file support
> to set a bunch of "really only way to configure is by hand" output
> properties would clear the bar here for me. Because that is a feature I
> already mentioned that xrandr _does_ have, and which modetest hackery very
> much does not.

The expectation (and general usage) for that property was that it was
set by the kernel command line and then was forgotten about. Old TVs
require one mode and that's it, so it doesn't make much sense to change
it while the system is live, you just want the default to work.

So it's not really a matter of "the user-space code should be open"
here, there's no user-space code, and there will likely never be given
that it's mostly used to deal with decades-old systems at this point.

Maxime

--mi5wodqhzroznsoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZk9X6AAKCRAnX84Zoj2+
dvpCAYDUeHGsrgiR2qRe/wXK8ZIpvluv3J8COc4dMwZx3bG5p96YcOShgiPTnJU/
ZHwk5AkBgO7rusLypnQqrophLuLXIHd1SFDQEZiPLZO7Wd/mkOoXM8zorNQwhiQa
+/WRM9mLJw==
=HVRd
-----END PGP SIGNATURE-----

--mi5wodqhzroznsoe--

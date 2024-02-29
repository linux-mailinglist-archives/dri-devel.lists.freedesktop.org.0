Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B786C987
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF87710E059;
	Thu, 29 Feb 2024 12:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c81NXlZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEC610E048
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:55:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 59086CE0ECA;
 Thu, 29 Feb 2024 12:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473E0C433C7;
 Thu, 29 Feb 2024 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709211327;
 bh=AAOZbfgDtX2uqx7LGFvsfYisJG7tn2CJDlp3b01p2iI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c81NXlZ5jIW0JjAQj9sDceqpzEIL/IL+Dlp0KoivZP7DQ7gWwzB3pzifc9FeWiYah
 UEmi2KCusNidZdxieS0R6znZpVCwaobeqGJez8ohospBOZvX2RuwnXhT5Z4vkI3TNV
 qeLE/4ZOMgQjYVoE+XU3LC0uR7VA5c82z5L1g6BSw3vNirXPl/sHPMhjTbD8TLK+NZ
 3K8CqhF0XMM7Q8rCozytCa6m+iUYEex1YG8WD5SKEBgmx1VDszRwZqHMZfGpkiZ2VE
 jjuJ+geK0kmQULykJ31dmaeeAApTSsrNzlI/hnWxvyAxg+MAQHwZvWYztd3x4CRuV6
 eOgHmSoPoGpgQ==
Date: Thu, 29 Feb 2024 13:55:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240229-mature-quick-squirrel-9b2c9b@houat>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
 <20240228-nice-flat-cormorant-badff7@houat>
 <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5ltxif5aa4uv66wn"
Content-Disposition: inline
In-Reply-To: <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
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


--5ltxif5aa4uv66wn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Wed, Feb 28, 2024 at 04:22:56PM +0000, Simon Ser wrote:
> On Wednesday, February 28th, 2024 at 17:14, Maxime Ripard <mripard@kernel=
=2Eorg> wrote:
>=20
> > > I don't know what the rules were 8 years ago, but the current uAPI ru=
les
> > > are what they are, and a new enum entry is new uAPI.
> >=20
> > TBF, and even if the wayland compositors support is missing, this
> > property is perfectly usable as it is with upstream, open-source code,
> > through either the command-line or X.org, and it's documented.
> >=20
> > So it's fine by me from a UAPI requirement side.
>=20
> That is not a valid way to pass the uAPI requirements IMHO. Yes, one
> can program any KMS property via modetest or xrandr. Does that mean that
> none of the new uAPI need a "real" implementation anymore? Does that mean
> that the massive patch adding a color pipeline uAPI doesn't need
> user-space anymore?

I guess it's also a matter what the API is exactly? Like, xrandr or the
kernel command line allows to use that particular API fully.

Can you fully exert the color pipeline uAPI with xrandr?

And at the time we submitted it, even with our best intent, we couldn't
totally clear the userspace requirement because the PR would have been
rejected because nobody wanted to deal with analog TV. And that's fair,
any upstream project is free to do as it wants and analog TV is
certainly not the state of the art anymore.

But we had some variation of that property used in many drivers (i915,
nouveau, vc4, sun4i and amlogic from the top of my head), all
drivers-specific, and having that kind of support was also one of the
blockers to move the few remaining fbdev drivers to KMS.

It seems a bit unfair to put that requirement now that maybe some
compositors could be interested.

> The only thing I'm saying is that this breaks the usual DRM requirements.
> If, as a maintainer, you're fine with breaking the rules and have a good
> motivation to do so, that's fine by me. Rules are meant to be broken from
> time to time depending on the situation. But please don't pretend that
> modetest/xrandr is valid user-space to pass the rules.

Ack. And indeed, modetest surely was a bad example.

Maxime

--5ltxif5aa4uv66wn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeB+vAAKCRDj7w1vZxhR
xeaDAQCHEhlhlgSgyN49msMDGAuTummJL3+95y05cVQ3uLCZJgEAj/V4WwkKfGd9
CB0Rnmg2Ok+S4p9LJ7CVLEDMXSUZIgk=
=ss+5
-----END PGP SIGNATURE-----

--5ltxif5aa4uv66wn--

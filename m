Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1A58677D8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877010F210;
	Mon, 26 Feb 2024 14:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XjCcFa0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DFF10F211
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:10:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7328602F4;
 Mon, 26 Feb 2024 14:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21825C433F1;
 Mon, 26 Feb 2024 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708956648;
 bh=WO0OJY8ah9yYRf/Y9DTI+gi19Zayaue37M56op94mCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XjCcFa0H60pr5Vc7c7YBBCqlwpXzzu4HDhJmadclVvZYw8UByy22mqsWO1uzGe7pK
 X9xgdzF2SGhy2RaSjSN8F3fojY1sWhlB3Ux19Lt/bY8XsLmZMaP23Uvcl2sfzgHjGS
 3feOjCZ9iiTGGbIar6hQqrUYsanrNIqno1NZ51H+5wSyn7U8WZdx3QE6zGdOZm8jZE
 Nhdwn9LoqgXe4aohGwjki2wR9Oy95h9WuxgXY82ZEeUoYktjLdf87g5EI3D5tVgcXM
 Ng6ji8hW21aBsEpN21dboVKHG0C2in0i8kVlvmwtxPAAsjBjMo84AHGU2KHokFeBMY
 ighlbK6CxnqBw==
Date: Mon, 26 Feb 2024 15:10:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fhl5e5nbkvfvezhe"
Content-Disposition: inline
In-Reply-To: <20240221110751.48da8190@eldfell>
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


--fhl5e5nbkvfvezhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Wed, Feb 21, 2024 at 11:07:51AM +0200, Pekka Paalanen wrote:
> On Fri, 16 Feb 2024 18:48:55 +0000
> Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
>=20
> > From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> >=20
> > Add this as a value for enum_drm_connector_tv_mode, represented
> > by the string "Mono", to generate video with no colour encoding
> > or bursts. Define it to have no pedestal (since only NTSC-M calls
> > for a pedestal).
> >=20
> > Change default mode creation to acommodate the new tv_mode value
> > which comprises both 525-line and 625-line formats.
> >=20
> > Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> since no-one else commented yet, I'd like to remind of the new UAPI
> requirements:
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-usersp=
ace-requirements
>=20
> AFAIU, adding a new value to an existing enum still counts as new UAPI.
>=20
> Maybe there is no need for the full treatment here, or maybe there is,
> I'm not sure. I think you should make some statement about how the new
> UAPI requirements have been addressed.

That property was meant to provide legacy display handling, so I don't
expect any reasonably recent codebase like Weston to suppport it, ever
:)

That being said, from the beginning, that property was meant to be
handled as a "mode-setting" property, and thus handled by either the
kernel command-line, xrandr, or any similar mechanism.

I would expect that new enum variant to be handled under the same terms:
it'll probably only show up in distro scripts or configuration files,
and never in any actual code base.

Is it what you were expecting, or did you mean something else?

Maxime

--fhl5e5nbkvfvezhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdyb5QAKCRDj7w1vZxhR
xaUUAQD/sfQIBd+saViGkVIhsLofAc3FNUz6N7rs2EefhoFClwEAsFmiSc+hV9+Y
R6kIgwYCX2+srHahZ/qUrxx4ucq+tAU=
=/aXk
-----END PGP SIGNATURE-----

--fhl5e5nbkvfvezhe--

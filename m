Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8640386B3F6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB6A10E05D;
	Wed, 28 Feb 2024 16:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HHGfeHvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A9310E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:01:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9ED4C6141D;
 Wed, 28 Feb 2024 16:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF52C43399;
 Wed, 28 Feb 2024 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709136097;
 bh=v5uD8k8+SRqt0J7QZgoOe42vpoLoognHN5BRUZnlpxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HHGfeHvtJckJKEhDzqRHiubKwl28CZpydXeHmYB6ZA66GvggOsKZeIfo1qLNN5xwk
 Fai2fpTtgU09TmOQFVk+ewsnO8YcC6/iGG3rokbOdZMdu7XDcR1tzXQMcEjPLgjI9f
 4JKBruvrMWEZa0TDEIdxBLlMev4292jHSlDfxRth4AWQ5Y8I1KCOic2Y/I+iizNKNl
 djgFEEZO1LthXIV/qH7YEiNwwn2zUU/o4TLJAY0yFEbOz4di5fSnEe2UOsRhloC4El
 G0yAz8CX5pONf0l9z1xTkV+RULnPIBi1TjSeIOaFIeWos1s5xblPgRL6Fme5oqtF+8
 DSP2t2LQdaiAA==
Date: Wed, 28 Feb 2024 17:01:34 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240228-nifty-flashy-shrew-905edc@houat>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <20240227115835.299146c9@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dy2oineuwyghgcdt"
Content-Disposition: inline
In-Reply-To: <20240227115835.299146c9@eldfell>
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


--dy2oineuwyghgcdt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:58:35AM +0200, Pekka Paalanen wrote:
> On Mon, 26 Feb 2024 17:23:24 +0000
> Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
>=20
> > Hi Pekka
> >=20
> > Sorry for the slight delay in replying.
> >=20
> > On Mon, 26 Feb 2024 at 15:11, Pekka Paalanen
> > <pekka.paalanen@haloniitty.fi> wrote:
> > >
> > > On Mon, 26 Feb 2024 15:10:45 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > > =20
> > > > Hi Pekka,
> > > >
> > > > On Wed, Feb 21, 2024 at 11:07:51AM +0200, Pekka Paalanen wrote: =20
> > > > > On Fri, 16 Feb 2024 18:48:55 +0000
> > > > > Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> > > > > =20
> > > > > > From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > > > > >
> > > > > > Add this as a value for enum_drm_connector_tv_mode, represented
> > > > > > by the string "Mono", to generate video with no colour encoding
> > > > > > or bursts. Define it to have no pedestal (since only NTSC-M cal=
ls
> > > > > > for a pedestal).
> > > > > >
> > > > > > Change default mode creation to acommodate the new tv_mode value
> > > > > > which comprises both 525-line and 625-line formats.
> > > > > >
> > > > > > Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi=
=2Ecom>
> > > > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com> =
=20
> > > > >
> > > > > since no-one else commented yet, I'd like to remind of the new UA=
PI
> > > > > requirements:
> > > > > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-sourc=
e-userspace-requirements
> > > > >
> > > > > AFAIU, adding a new value to an existing enum still counts as new=
 UAPI.
> > > > >
> > > > > Maybe there is no need for the full treatment here, or maybe ther=
e is,
> > > > > I'm not sure. I think you should make some statement about how th=
e new
> > > > > UAPI requirements have been addressed. =20
>=20
> ...
>=20
> > The use cases for runtime switching of the "tv_mode" are exceedingly
> > rare, so IMHO the property doesn't need exposing through the UAPI.
> > However it was added to the UAPI about 8 years ago for vc4 and sunxi,
> > and is also now used by other drivers, so can't be reverted. Does that
> > mean it can now never be changed without jumping through the hoop of
> > creating some userspace user?
>=20
> That is for the DRM maintainers to decide. For that, they must first
> notice that this is indeed new UAPI.
>=20
> History has shown that UAPI changes sometimes get through when they
> would have probably been rejected off-hand if a maintainer had a proper
> look. I saw an UAPI addition that was not in any way highlighted as
> such, with a topic that is probably uninteresting to most. The patch
> also did not discuss any of the details you now explained, which could
> serve as a justification. Naturally I screamed, hoping to attract
> maintainer attention.

That's definitely a valid concern. I wonder if it's something we could
add to checkpatch

Maxime

--dy2oineuwyghgcdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd9Y3QAKCRDj7w1vZxhR
xUTgAQCMzAGeHG16NXlQh42FqFfg9h3EL+ZfkIb3CCZ4BTDMKQEAr3weGDMMPMcd
joDU5Up5DgbYb2hHVKGmem4GbsoxtQU=
=S3Kh
-----END PGP SIGNATURE-----

--dy2oineuwyghgcdt--

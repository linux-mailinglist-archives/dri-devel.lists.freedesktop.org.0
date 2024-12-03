Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7FF9E17CE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E4310E9B8;
	Tue,  3 Dec 2024 09:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LAkHShM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B27510E9B7;
 Tue,  3 Dec 2024 09:36:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FF375C697C;
 Tue,  3 Dec 2024 09:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752C2C4CED6;
 Tue,  3 Dec 2024 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733218604;
 bh=SVgeimaxMCy/0f2AoMe1mCp1DAEBQJ4X3mcrC+82vu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LAkHShM8v1EaacOOI6JrMuL7F2wP7Yllbl6bdB/wML1YeWiaVxpA0AOI8R7ZFFkcm
 yVS1h5Z1QOJVAE0hN+nYE/p9qPS2vF7P7aewrv8uvhwGy6uC5IwuxGd2FWnPPs1K/X
 dneKYnd8VUilyCpVmOngztT1WfsyfEU4c8pDulzvokQ6SWWjfLuTyNifOoNBlC8Y14
 jez9X05LjYsUl99pLp6iOUISN/MH6oYNdWAY8cGforpbGlOT0fT+B7zcvgOpT5Pe31
 KrFxOy1dnbBBfW85u2Wu6cxhobf8lCusYMaWnh2sMnXXMQ6haUda2CTRlM2iit9ION
 Eg+bQSqOS+EQg==
Date: Tue, 3 Dec 2024 10:36:42 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <20241203-simple-pigeon-of-infinity-babfee@houat>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
 <20241202-real-benevolent-skunk-a9f5e0@houat>
 <87ldwy5lvb.fsf@intel.com>
 <20241202-accurate-jolly-hornet-8c2ca0@houat>
 <87bjxu5btw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="335vxtzobacwcmvi"
Content-Disposition: inline
In-Reply-To: <87bjxu5btw.fsf@intel.com>
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


--335vxtzobacwcmvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 05:44:27PM +0200, Jani Nikula wrote:
> >> It's super tempting for people to just get their jobs done. If doing
> >> the right thing adds yet another hurdle, we may see more stuff being
> >> added in drivers instead of drm core.
> >
> > I really enjoy hidden threats.
>=20
> None were implied. That's your interpretation of what I honestly think
> is a plausible outcome.

I obviously misinterpreted what you were saying then. Sorry for the
whole tone of that mail.

> I try to push people towards contributing to drm core instead of
> drivers, and it's not always easy as it is. It's just a guess, but
> I'll bet the majority of drm contributors have never run kunit tests
> themselves.

Right, but I don't think it's worth worrying over either. If one stops
contributing because they are afraid of running one documented command
that takes a few seconds, they would have done so at any other obstacle.
We have much bigger barriers of entry, at several levels.

All of them are here for a good reason, and because we have collectively
judged that the trade-off between adding a barrier and increasing the
quality of the framework was worth it.

I believe tests are worth it too.

But anyway, it's really not what I had in mind.

Maxime

--335vxtzobacwcmvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ07RJQAKCRAnX84Zoj2+
dnwxAYDe/IszcN04v4HWortlFKTA1s7i2La9lFd8X6ZIU/KRLpkp6CYZzZdyOlwM
1FT4QlQBf1zNZuEfheP4sas6up7A5DHcaMaTkoiYrRkR3pUnarv83HpYsj+PFEwh
j5vmoKYo8w==
=tMAm
-----END PGP SIGNATURE-----

--335vxtzobacwcmvi--

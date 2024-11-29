Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCC9DE8E4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 15:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3593710E4D8;
	Fri, 29 Nov 2024 14:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bb+orOM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728D410E4C9;
 Fri, 29 Nov 2024 14:46:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1DE45C3EF9;
 Fri, 29 Nov 2024 14:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CB8C4CECF;
 Fri, 29 Nov 2024 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732891591;
 bh=f2K0d4Gf4NcPcxTfrmJW92LltgMzXKs8eShY8ZRdUZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bb+orOM4Z3SiJEB3LjufZ4NJg1RY43FNWQRizQw6eSrPO1zad/Inc/L1I8+RVjw0H
 D1+pEF+DQQ6e1KCPzRkv3wV+uAWHpuOkoH8IV6RWeevtG52VhlTQIimPmQrHtgum7P
 WKRv4i3XHZIYiFKwGdi5doXyaxgmlz07azbf9FzoKJyVXcaveQW3TZwPQROnwyr7Ax
 z8cCLv2z/2T/HDwUMuG/DKFSFtthmXiByneo0KaMHL0ALDoVDJ+QPePVlYH/f6VMcK
 xCWzNESXWmiU5/QuyYYqXMCa7zQtypDH5oxlRWvVafn+Ib+RHJT2FcwPbKnag2jDKi
 29NDhLALoX27g==
Date: Fri, 29 Nov 2024 15:46:28 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <20241129-wild-cobra-of-thunder-829d1f@houat>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xcz5bvphmetbkzt2"
Content-Disposition: inline
In-Reply-To: <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
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


--xcz5bvphmetbkzt2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
MIME-Version: 1.0

On Fri, Nov 29, 2024 at 04:26:01PM +0200, Imre Deak wrote:
> Adding more people from DRM core domain. Any comment, objection to this
> change?
>=20
> On Tue, Nov 26, 2024 at 06:18:56PM +0200, Imre Deak wrote:
> > Atm when the connector is added to the drm_mode_config::connector_list,
> > the connector may not be fully initialized yet. This is not a problem
> > for user space, which will see the connector only after it's registered
> > later, it could be a problem for in-kernel users looking up connectors
> > via the above list.

It could be, or it actually is a problem? If so, in what situation?

> > To resolve the above issue, add a way to separately initialize the DRM
> > core specific parts of the connector and add it to the above list. This
> > will move adding the connector to the list after the properties on the
> > connector have been added, this is ok since these steps don't have a
> > dependency.
> >
> > v2: (Jani)
> > - Let initing DDC as well via drm_connector_init_core().
> > - Rename __drm_connector_init to drm_connector_init_core_and_add().
> >=20
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
> > Signed-off-by: Imre Deak <imre.deak@intel.com>

If we do have an actual problem to solve, we'll need kunit tests too.

Maxime

--xcz5bvphmetbkzt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0nTvgAKCRAnX84Zoj2+
dqOqAYDIlSTmWt9+l/1el1175mzeD0UaGoMeo3N6ZNVn/DrV23/MyjRCiMtZf6nI
mCpbiicBgKNiKNZNITZu3wRb2V049EWoWVEhTnnTnwMob31YeJ9n7pNkia/HwKDO
qHyaJHu1Kw==
=6vCg
-----END PGP SIGNATURE-----

--xcz5bvphmetbkzt2--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143CE8B9BC2
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 15:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4333A10F03A;
	Thu,  2 May 2024 13:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WGsuvdLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1640210FA8C;
 Thu,  2 May 2024 13:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D98D6CE16B9;
 Thu,  2 May 2024 13:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5A3C113CC;
 Thu,  2 May 2024 13:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714657341;
 bh=WKPsUxWXl4yHvgtoNsaCIYXC/ka2/toWtJoy5D7VxaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGsuvdLc+roF8Yz6mXf3HVoKntvXEZfyV56nqpAVi8hGuC39tWCvY5gB7s2zm/EaP
 b336gJCXfZQTSsfbDiCVTwMvguLhaSkEmozTDxLFxg14whPxWqB7Kilzairv/qfH4W
 DdNYer/sUprQ105G1J9XxtufEOPnqogUIRcx0alyW5E4c4/v++HgnUxQmwn2QMBGC/
 1wMhlvSwxCmiOeJlzsEoQ7Oit+Agf287brQbstKc0dmVH2+w6lf8t2R70UaoG3JsQo
 x8DkKjHyZ30T62vgyrMizG+7jK/Cl35tqIsxAbd9/E19mvNu9dEReH8pmHvjBXbF8W
 U2kNV/8A/0+RA==
Date: Thu, 2 May 2024 15:42:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Message-ID: <20240502-wakeful-rattlesnake-of-tornado-af78f5@houat>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
 <20240424-garrulous-realistic-pronghorn-fbfcd5@houat>
 <e54a0551-9484-40c9-abf7-f2e39e101497@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dpel2lgqmxvhdsml"
Content-Disposition: inline
In-Reply-To: <e54a0551-9484-40c9-abf7-f2e39e101497@linux.intel.com>
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


--dpel2lgqmxvhdsml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 06:06:52PM +0530, Aravind Iddamsetty wrote:
>=20
> On 24/04/24 17:21, Maxime Ripard wrote:
> > On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
> >> In scenarios where drm_dev_put is directly called by driver we want to
> >> release devm_drm_dev_init_release action associated with struct
> >> drm_device.
> >>
> >> v2: Directly expose the original function, instead of introducing a
> >> helper (Rodrigo)
> >>
> >> v3: add kernel-doc (Maxime Ripard)
> >>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>
> >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
> >>  include/drm/drm_drv.h     |  2 ++
> >>  2 files changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >> index 243cacb3575c..9d0409165f1e 100644
> >> --- a/drivers/gpu/drm/drm_drv.c
> >> +++ b/drivers/gpu/drm/drm_drv.c
> >> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *paren=
t,
> >>  					devm_drm_dev_init_release, dev);
> >>  }
> >> =20
> >> +/**
> >> + * devm_drm_dev_release_action - Call the final release action of the=
 device
> >> + * @dev: DRM device
> >> + *
> >> + * In scenarios where drm_dev_put is directly called by driver we wan=
t to release
> >> + * devm_drm_dev_init_release action associated with struct drm_device.
> >> + */
> > I'm not entirely sure what you mean by that documentation. "In scenarios
> > where drm_dev_put is directly called by the driver", we wouldn't need to
> > consider that function at all, right?
>=20
> the drm_dev_put is not being invoked by drivers directly but that is
> associated with devres releases and the scenario here I meant if
> drivers want to have that called by themselves.

Then that needs to be rephrased to mention both that it applies only to
drivers using devm_drm_dev_alloc, and if they want to drop their
reference earlier than anticipated.

> > Also, we should reference it in drm_dev_put and devm_drm_dev_alloc too.
>=20
> sorry I didn't get this can you please elaborate.

devm_drm_dev_alloc needs to point at this new function to mention that
we can drop the reference explicitly. And drm_dev_put needs to mention
that it only applies to non-devm drivers, and if we want to drop the
reference on a devm driver, we need to call this new function.

Maxime

--dpel2lgqmxvhdsml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjOYMgAKCRAnX84Zoj2+
dhgNAX9K9kvLmZUOCM8Pn6TejNzLHJv5HbOe+0eeQVXz/smnUT+AFA+UYvUOij4O
KfBriDYBgL25AWQPTtyjIWFhBWn/ocily10sx2PmOCT9ZO0BqlrYFCCzdmepccaf
hgWWAnOsSA==
=uaxv
-----END PGP SIGNATURE-----

--dpel2lgqmxvhdsml--

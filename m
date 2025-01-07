Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69453A044B4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B4F10EB18;
	Tue,  7 Jan 2025 15:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dn4SZWOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D0810EB18
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 15:36:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1E325C57AB;
 Tue,  7 Jan 2025 15:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C51C4CED6;
 Tue,  7 Jan 2025 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736264164;
 bh=5e0rdfkFbauFXgVBSz/EOp6/JxWQvQPtPfoTdvLyukw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Dn4SZWOe2uh0+nwWETzGL6oXerMLl2scEHEaxPdgbqZSJC8knN5y/dYvyWR/pSw18
 PVQwkjGgsBa3+DMGtA4gSaJRp6XY/6HBdB4BHpNZiTQ7mMD2PVJU6GudKz1BBaV8Rj
 bPJdO9rl7fktPK+h100wWb6kbfGcFasH9IqdX9Qtx8zvcowjXCeMjN9GYRBonf+4KG
 jHlW/TdnRBQvqhLjDvlVgLiwjMrawMNFiQn9c/4hEooLeSYeKgIMyaFrt1W6B2ogqA
 4o2U6jPSBzQW7ecH+IrESJhmB3rROkHJtuLpKPgGlCr2I4mR4o4/fQD3jSWeIHd1JL
 dysYmp7aY7KZA==
Date: Tue, 7 Jan 2025 16:36:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
Message-ID: <20250107-polite-savvy-kiwi-8ada2b@houat>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
 <20241230-google-vkms-managed-v6-7-15c7d65cd63b@bootlin.com>
 <20250106-acoustic-inescapable-locust-9d5b36@houat>
 <Z3wCnk_WStJk9B5D@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="el5lxvuccxgbbr6r"
Content-Disposition: inline
In-Reply-To: <Z3wCnk_WStJk9B5D@louis-chauvet-laptop>
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


--el5lxvuccxgbbr6r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
MIME-Version: 1.0

On Mon, Jan 06, 2025 at 05:19:42PM +0100, Louis Chauvet wrote:
> On 06/01/25 - 14:04, Maxime Ripard wrote:
> > On Mon, Dec 30, 2024 at 07:37:37PM +0100, Louis Chauvet wrote:
> > > To allows driver to only use drmm objects, add helper to create
> > > drm_writeback_connectors with automated lifetime management.
> > >=20
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c | 69 +++++++++++++++++++++++++++++++=
++++++++++
> > >  include/drm/drm_writeback.h     |  8 +++++
> > >  2 files changed, 77 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_wr=
iteback.c
> > > index 9c69f7181e02c23dabce488405608c40d4184af5..1251f65aae9e3b6fb5c5d=
e9ab9280e5430342208 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -369,6 +369,75 @@ static void drm_writeback_connector_cleanup(stru=
ct drm_device *dev,
> > >  	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
> > >  }
> > > =20
> > > +/**
> > > + * drmm_writeback_connector_init - Initialize a writeback connector =
with
> > > + * a custom encoder
> > > + *
> > > + * @dev: DRM device
> > > + * @wb_connector: Writeback connector to initialize
> > > + * @con_funcs: Connector funcs vtable
> > > + * @enc: handle to the already initialized drm encoder, optional
> > > + * @enc_funcs: Encoder funcs vtable, optional, only used when @enc i=
s NULL
> > > + * @formats: Array of supported pixel formats for the writeback engi=
ne
> > > + * @n_formats: Length of the formats array
> > > + * @possible_crtcs: if @enc is NULL, this will set the possible_crtc=
 for the
> > > + *		    newly created encoder
> > > + *
> > > + * This function initialize a writeback connector and register its c=
leanup.
> > > + *
> > > + * This function creates the writeback-connector-specific properties=
 if they
> > > + * have not been already created, initializes the connector as
> > > + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the =
property
> > > + * values.
> > > + *
> > > + * If @enc is NULL, this function will create a drm-managed encoder =
and will
> > > + * attach @enc_funcs on it. It will also attach the CRTC passed in
> > > + * @possible_crtcs
> > > + *
> > > + * Returns: 0 on success, or a negative error code
> > > + */
> > > +int drmm_writeback_connector_init(struct drm_device *dev,
> > > +				  struct drm_writeback_connector *wb_connector,
> > > +				  const struct drm_connector_funcs *con_funcs,
> > > +				  struct drm_encoder *enc,
> > > +				  const struct drm_encoder_helper_funcs *enc_funcs,
> > > +				  const u32 *formats, int n_formats,
> > > +				  u32 possible_crtcs)
> >=20
> > The name isn't really consistent with the other functions. We already
> > have a drm_writeback_connector_init that doesn't take the encoder point
> > but will just read it from wb_connector->encoder, and we have
> > drm_writeback_connector_with_encoder that assumes the encoder has
> > already been created.
> >
> > We should the name or behavior on either one of them. Why do we need an
> > optional encoder pointer? If enc is not NULL, then enc_funcs shouldn't
> > be necessary, if it's NULL, then drm_writeback_connector_init will be
> > sufficient?
>=20
> This was requested by Jani in [1]. If you prefer I can create two variant=
s=20
> for the next iteration.
>=20
> [1]:https://lore.kernel.org/all/87a5gxyrhc.fsf@intel.com/

There was another suggestion in that review though ;)

I agree with Jani's second statement here: most of the weirdness of that
API stems from the fact that it deviates from the other APIs, and fixing
that should remove that weirdness.

Ultimately, allocating the encoder in the first place is weird. I don't
think we have any other example of an init function for one entity
allocating its own entity or another.

Why should we allocate that encoder in the helper?

Maxime

--el5lxvuccxgbbr6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ31J4QAKCRAnX84Zoj2+
ds92AYDRUoRhMrCKXiusyo4ZJ4rGW3AFq1sNAK9wzAVamB6sYbZsjd32PlCLU8ov
6O0Brv0BfiZHFghqe3fwQqLjfJAp1Z2oSr4MXqLVA3o8Y4AxRPcMTHcf86o8sXP1
8HKjKRQqqw==
=CL58
-----END PGP SIGNATURE-----

--el5lxvuccxgbbr6r--

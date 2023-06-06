Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E837249B7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B229E10E389;
	Tue,  6 Jun 2023 17:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342B110E389;
 Tue,  6 Jun 2023 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2O2GYzb2zL0JSO0GykDadRS9TFPbKIP6kngAuNsWc3I=; b=VZnNsWTW9x51SRS4kl4EEi0jXj
 m4fC3woYWv6SA3D7bg0W591hOTy3JmU5CQUP9s9d3jr557W/A8EQxk+14igQFHmsfNT66c1oJSsia
 b0mknpRwW/qEj5/t1ZzixTDUqvyYvj0opc/UesS0mNRDczF1QNPED8LE7kCTh/eDzJmPEMgqcejDc
 qltTfmx7Q30rIhQBJtL4KpAqWlDHRToGgnbX/hDXjzmRLqWovbQi9f5mhuDnbJNao8L73jvA+1thv
 0DK3Ibg4UmgV5RbJL1uP055HSNCH4P5hWTWb2gkxwFC072yfdGPEnls3vIOUcXXFrwxBpLrhWPatM
 bok2nxqQ==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q6a66-009c4C-68; Tue, 06 Jun 2023 19:03:54 +0200
Date: Tue, 6 Jun 2023 16:03:47 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 21/36] drm/amd/display: add CRTC 3D LUT support
Message-ID: <20230606170347.libjx7jemm6466cl@mail.igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-22-mwen@igalia.com>
 <61fe8337-ef01-0ca9-cfd3-4d2029aee5ec@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ydmf7ezsfogrnukt"
Content-Disposition: inline
In-Reply-To: <61fe8337-ef01-0ca9-cfd3-4d2029aee5ec@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ydmf7ezsfogrnukt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O 06/01, Harry Wentland wrote:
>=20
>=20
> On 5/23/23 18:15, Melissa Wen wrote:
> > Wire up DC 3D LUT to DM CRTC color management (post-blending). On AMD
> > display HW, we have to set a shaper LUT to delinearize or normalize the
> > color space before applying a 3D LUT (since we have a reduced number of
> > LUT entries). Therefore, we map DC shaper LUT to DM CRTC color mgmt in
> > the next patch.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  17 ++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 158 +++++++++++++++++-
> >  3 files changed, 180 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 0be62fe436b0..a6dd982d7e77 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -9976,6 +9976,12 @@ static int amdgpu_dm_atomic_check(struct drm_dev=
ice *dev,
> >  			goto fail;
> >  		}
> > =20
> > +		ret =3D amdgpu_dm_verify_lut3d_size(adev, new_crtc_state);
> > +		if (ret) {
> > +			drm_dbg_driver(dev, "amdgpu_dm_verify_lut_sizes() failed\n");
> > +			goto fail;
> > +		}
> > +
> >  		if (!new_crtc_state->enable)
> >  			continue;
> > =20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index e5f9db5a43f4..eebe12c353ad 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -797,6 +797,21 @@ struct dm_crtc_state {
> > =20
> >  	int abm_level;
> > =20
> > +	/* AMD driver-private CRTC color management
> > +	 *
> > +	 * DRM provides CRTC degamma/ctm/gamma color mgmt features, but AMD HW
> > +	 * has a larger set of post-blending color calibration. Here, DC MPC
> > +	 * color caps are wired up to DM CRTC state:
> > +	 */
> > +	/**
> > +	 * @lut3d:
> > +	 *
> > +	 * Post-blending 3D Lookup table for converting pixel data. When
> > +	 * supported by HW (DCN 3+), it is positioned just before post-blendi=
ng
> > +	 * regamma and always assumes a preceding shaper LUT. The blob (if not
> > +	 * NULL) is an array of &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *lut3d;
> >          /**
> >  	 * @regamma_tf:
> >  	 *
> > @@ -868,6 +883,8 @@ void amdgpu_dm_trigger_timing_sync(struct drm_devic=
e *dev);
> >  /* 3D LUT max size is 17x17x17 */
> >  #define MAX_COLOR_3DLUT_ENTRIES 4913
> >  #define MAX_COLOR_3DLUT_BITDEPTH 12
> > +int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
> > +				const struct drm_crtc_state *crtc_state);
> >  /* 1D LUT size */
> >  #define MAX_COLOR_LUT_ENTRIES 4096
> >  /* Legacy gamm LUT users such as X doesn't like large LUT sizes */
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index 161807e19886..cef8d0d7f37b 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -364,6 +364,96 @@ static int __set_input_tf(struct dc_transfer_func =
*func,
> >  	return res ? 0 : -ENOMEM;
> >  }
> > =20
> > +static void __to_dc_lut3d_color(struct dc_rgb *rgb,
> > +				const struct drm_color_lut lut,
> > +				int bit_precision)
> > +{
> > +	rgb->red =3D drm_color_lut_extract(lut.red, bit_precision);
> > +	rgb->green =3D drm_color_lut_extract(lut.green, bit_precision);
> > +	rgb->blue  =3D drm_color_lut_extract(lut.blue, bit_precision);
> > +}
> > +
> > +static void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
> > +				    uint32_t lut3d_size,
> > +				    struct tetrahedral_params *params,
> > +				    bool use_tetrahedral_9,
> > +				    int bit_depth)
> > +{
> > +	struct dc_rgb *lut0;
> > +	struct dc_rgb *lut1;
> > +	struct dc_rgb *lut2;
> > +	struct dc_rgb *lut3;
> > +	int lut_i, i;
> > +
> > +
> > +	if (use_tetrahedral_9) {
> > +		lut0 =3D params->tetrahedral_9.lut0;
> > +		lut1 =3D params->tetrahedral_9.lut1;
> > +		lut2 =3D params->tetrahedral_9.lut2;
> > +		lut3 =3D params->tetrahedral_9.lut3;
> > +	} else {
> > +		lut0 =3D params->tetrahedral_17.lut0;
> > +		lut1 =3D params->tetrahedral_17.lut1;
> > +		lut2 =3D params->tetrahedral_17.lut2;
> > +		lut3 =3D params->tetrahedral_17.lut3;
> > +	}
> > +
> > +	for (lut_i =3D 0, i =3D 0; i < lut3d_size - 4; lut_i++, i +=3D 4) {
> > +		/* We should consider the 3dlut RGB values are distributed
> > +		 * along four arrays lut0-3 where the first sizes 1229 and the
> > +		 * other 1228. The bit depth supported for 3dlut channel is
> > +		 * 12-bit, but DC also supports 10-bit.
> > +		 *
> > +		 * TODO: improve color pipeline API to enable the userspace set
> > +		 * bit depth and 3D LUT size/stride, as specified by VA-API.
> > +		 */
> > +		__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
> > +		__to_dc_lut3d_color(&lut1[lut_i], lut[i + 1], bit_depth);
> > +		__to_dc_lut3d_color(&lut2[lut_i], lut[i + 2], bit_depth);
> > +		__to_dc_lut3d_color(&lut3[lut_i], lut[i + 3], bit_depth);
> > +	}
> > +	/* lut0 has 1229 points (lut_size/4 + 1) */
> > +	__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
> > +}
> > +
> > +/* amdgpu_dm_atomic_lut3d - set DRM 3D LUT to DC stream
> > + * @drm_lut3d: DRM CRTC (user) 3D LUT
> > + * @drm_lut3d_size: size of 3D LUT
> > + * @lut3d: DC 3D LUT
> > + *
> > + * Map DRM CRTC 3D LUT to DC 3D LUT and all necessary bits to program =
it
> > + * on DCN MPC accordingly.
> > + */
> > +static void amdgpu_dm_atomic_lut3d(const struct drm_color_lut *drm_lut,
> > +				   uint32_t drm_lut3d_size,
> > +				   struct dc_3dlut *lut)
> > +{
> > +	if (!drm_lut3d_size) {
> > +		lut->state.bits.initialized =3D 0;
> > +	} else {
> > +		/* Stride and bit depth are not programmable by API yet.
> > +		 * Therefore, only supports 17x17x17 3D LUT (12-bit).
> > +		 */
> > +		lut->lut_3d.use_tetrahedral_9 =3D false;
> > +		lut->lut_3d.use_12bits =3D true;
> > +		lut->state.bits.initialized =3D 1;
> > +		__drm_3dlut_to_dc_3dlut(drm_lut, drm_lut3d_size, &lut->lut_3d,
> > +					lut->lut_3d.use_tetrahedral_9,
> > +					MAX_COLOR_3DLUT_BITDEPTH);
> > +	}
> > +}
> > +
> > +static int amdgpu_dm_atomic_shaper_lut(struct dc_transfer_func *func_s=
haper)
> > +{
> > +	/* We don't get DRM shaper LUT yet. We assume the input color space i=
s already
> > +	 * delinearized, so we don't need a shaper LUT and we can just BYPASS
> > +	 */
>=20
> This assumption won't be true for all compositors. This comment will
> be misleading when someone looks at this in the future. I'm thinking we
> might not want to merge patches 16-22 since we have no way to exercise
> this code.

Oh, in the end it was a temporary comment that is overwritten in the
next patch. I'll remove it to avoid misunderstanding.

>=20
> We'll definitely want MPC 3DLUT support in the future, with the driver-ag=
nostic
> API. So these patches still have value.

I'm okay on remove MPC shaper+3D LUT handling from DM if you think it's
a cleaner approach. I just need to detach shaper and 3D LUT helpers from
these patches and attach to DPP shaper+3D LUT, since we reuse the
helpers for plane shaper+3D LUT support.

>=20
> Harry
>=20
> > +	func_shaper->type =3D TF_TYPE_BYPASS;
> > +	func_shaper->tf =3D TRANSFER_FUNCTION_LINEAR;
> > +
> > +	return 0;
> > +}
> > +
> >  /* amdgpu_dm_atomic_shaper_lut3d - set DRM CRTC shaper LUT and 3D LUT =
to DC
> >   * interface
> >   * @dc: Display Core control structure
> > @@ -404,6 +494,57 @@ static int amdgpu_dm_atomic_shaper_lut3d(struct dc=
 *dc,
> >  	stream->func_shaper =3D func_shaper;
> >  	stream->lut3d_func =3D lut3d_func;
> > =20
> > +	if (!acquire)
> > +		return 0;
> > +
> > +	amdgpu_dm_atomic_lut3d(drm_lut3d, drm_lut3d_size, lut3d_func);
> > +
> > +	return amdgpu_dm_atomic_shaper_lut(func_shaper);
> > +}
> > +
> > +/**
> > + * amdgpu_dm_lut3d_size - get expected size according to hw color caps
> > + * @adev: amdgpu device
> > + * @lut_size: default size
> > + *
> > + * Return:
> > + * lut_size if DC 3D LUT is supported, zero otherwise.
> > + */
> > +static uint32_t amdgpu_dm_get_lut3d_size(struct amdgpu_device *adev,
> > +					 uint32_t lut_size)
> > +{
> > +	return adev->dm.dc->caps.color.mpc.num_3dluts ? lut_size : 0;
> > +}
> > +
> > +/**
> > + * amdgpu_dm_verify_lut3d_size - verifies if 3D LUT is supported and i=
f DRM 3D
> > + * LUT matches the hw supported size
> > + * @adev: amdgpu device
> > + * @crtc_state: the DRM CRTC state
> > + *
> > + * Verifies if post-blending (MPC) 3D LUT is supported by the HW (DCN =
3.0 or
> > + * newer) and if the DRM 3D LUT matches the supported size.
> > + *
> > + * Returns:
> > + * 0 on success. -EINVAL if lut size are invalid.
> > + */
> > +int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
> > +				const struct drm_crtc_state *crtc_state)
> > +{
> > +	const struct drm_color_lut *lut3d =3D NULL;
> > +	struct dm_crtc_state *acrtc_state =3D to_dm_crtc_state(crtc_state);
> > +	uint32_t exp_size, size;
> > +
> > +	exp_size =3D amdgpu_dm_get_lut3d_size(adev, MAX_COLOR_3DLUT_ENTRIES);
> > +
> > +	lut3d =3D __extract_blob_lut(acrtc_state->lut3d, &size);
> > +
> > +	if (lut3d && size !=3D exp_size) {
> > +		drm_dbg(&adev->ddev, "Invalid 3D LUT size. Should be %u but got %u.\=
n",
> > +			exp_size, size);
> > +		return -EINVAL;
> > +	}
> > +
> >  	return 0;
> >  }
> > =20
> > @@ -478,6 +619,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crt=
c_state *crtc,
> >  	bool has_regamma, has_degamma;
> >  	bool is_legacy;
> >  	int r;
> > +	const struct drm_color_lut *lut3d;
> > +	uint32_t lut3d_size;
> > +
> > +	r =3D  amdgpu_dm_verify_lut3d_size(adev, &crtc->base);
> > +	if (r)
> > +		return r;
> > +
> > +	lut3d =3D __extract_blob_lut(crtc->lut3d, &lut3d_size);
> > =20
> >  	r =3D amdgpu_dm_verify_lut_sizes(&crtc->base);
> >  	if (r)
> > @@ -526,10 +675,17 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_cr=
tc_state *crtc,
> >  		if (r)
> >  			return r;
> >  	} else {
> > +		/* We are not exposing CRTC 3D LUT properties yet, so DC 3D LUT
> > +		 * programming is expected to be set to bypass mode, since
> > +		 * there is no user-blob.
> > +		 */
> > +		lut3d_size =3D lut3d !=3D NULL ? lut3d_size : 0;
> >  		r =3D amdgpu_dm_atomic_shaper_lut3d(adev->dm.dc, ctx, stream,
> > -						  NULL, 0, NULL, 0);
> > +						  NULL, 0,
> > +						  lut3d, lut3d_size);
> >  		if (r)
> >  			return r;
> > +
> >  		/* Note: OGAM is disabled if 3D LUT is successfully programmed.
> >  		 * See params and set_output_gamma in
> >  		 * dcn30_set_output_transfer_func()
>=20

--ydmf7ezsfogrnukt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmR/ZvMACgkQwqF3j0dL
ehzLHg//ZffhGPHBi4SuEN5GXjLKxVys0W+afPjqzQ2sFBnwEXKxdSwu7hJVdKSN
/Bx02yuTDBStsnRqfTIUJ+qQXDfr1L7Zk6JOwxfYm9KmgNMAMLdlZVFA36hAz+ex
A60Q9nCdlhI0MvXoE+xc5uieMibXYQcTuVR7q7Bh3EjqQJU6/nKdG0yi/ue5UzdL
8Cnbq/5pClg+bPbh2S8XEMAyqEBycnBIE25Z0UYkMr0yfuAYve+pD/jYS6Aq3adZ
JNLI0ZqXMI/9o8MZQY6J+h0FQ6kCcf3TLRr6m+7U6+JH8/wCrSOXcncxhusNCcFC
/oQcJvZLo2LFQ8SMWXq0V1tP8Xl7YPHBUiZv3s3osE2hcmqPRDlUzKtGlp0pbU2g
ja8GbsM4REf7ii04VQMQXN0nLby7xw6136jfFN5xR+SzYrWOHk+9pfheegcaXYDP
AzflZ2fi/Wzi/+Mlp4W9W9x5flWZOi5lxVGiaWcoZ05EP9paxGDFnDvv3WWFdbfS
MR9WvNAMedHAlCCrmDIXXlomlfzZjCwqT7x8C3Y73Pks1+i16Z61hm7UgGcJNMDQ
f3wUZUeDSbHMSo/WwotWy4BeJFTnT8eet5kfUzLgH1IJuKb/2OgCFoikK6gPRrTa
tuBocNh4Z+rqhTm6x6moV/DGHUcIc+zZKFNeeQR/hxQaFPPzbDY=
=kvOd
-----END PGP SIGNATURE-----

--ydmf7ezsfogrnukt--

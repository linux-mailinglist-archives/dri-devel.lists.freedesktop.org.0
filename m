Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA457C050
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 00:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9995618B157;
	Wed, 20 Jul 2022 22:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C560818B13C;
 Wed, 20 Jul 2022 22:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9a/A9HogH6oCSxY/7Y398wqoYg6zNM3YbuUp1KNaIj8=; b=J/CcAEYSZNCCb+PSLvn8HNmBvj
 Bpa1dANXHK0zIfa6CP8sEYr4n2V1DKOQxPxIViSnCCcgEqJvcehAITVY0WcwLG2lBCikCVvJ+bvnM
 ac3X1IOSEilLf1F1ailyYWpXtD6sai2Q5mQxuMvXb+oHuRlUAsAj+u9Oh8NaZnugF4yqS0xUquyMg
 tAfnxUG2c8hA/zrtgjEic/BVcjolfzNHwPnqysbpcJ4LiKYIF4F0EKpzNij/kj3qJxZr5XIjuD4Ei
 9oz602IWDV3G1lpShBFyVKQkXuCvqLoEHC4b+927hPWMqMtabw2OhPiRCHcVmmo/HCDfpP4FcWcH5
 7MHjJvsQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEIaH-000peI-Mn; Thu, 21 Jul 2022 00:54:25 +0200
Date: Wed, 20 Jul 2022 21:54:13 -0100
From: Melissa Wen <mwen@igalia.com>
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Subject: Re: [PATCH 1/4] Documentation/amdgpu_dm: Add DM color correction
 documentation
Message-ID: <20220720225413.3sjcfxuyakg3t7xd@mail.igalia.com>
References: <20220716222529.421115-1-mwen@igalia.com>
 <20220716222529.421115-2-mwen@igalia.com>
 <b3845482-c53e-0ea8-6893-834a93ea5444@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y3dx43a2dge4m2bk"
Content-Disposition: inline
In-Reply-To: <b3845482-c53e-0ea8-6893-834a93ea5444@gmail.com>
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y3dx43a2dge4m2bk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/17, Tales Lelo da Aparecida wrote:
> On 16/07/2022 19:25, Melissa Wen wrote:
> > AMDGPU DM maps DRM color management properties (degamma, ctm and gamma)
> > to DC color correction entities. Part of this mapping is already
> > documented as code comments and can be converted as kernel docs.
> >=20
> > v2:
> > - rebase to amd-staging-drm-next
> >=20
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   .../gpu/amdgpu/display/display-manager.rst    |   9 ++
> >   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 121 +++++++++++++-----
> >   2 files changed, 98 insertions(+), 32 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Doc=
umentation/gpu/amdgpu/display/display-manager.rst
> > index 7ce31f89d9a0..b1b0f11aed83 100644
> > --- a/Documentation/gpu/amdgpu/display/display-manager.rst
> > +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
> > @@ -40,3 +40,12 @@ Atomic Implementation
> >   .. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >      :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> > +
> > +Color Management Properties
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +   :doc: overview
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +   :internal:
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index a71177305bcd..93c813089bff 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -29,7 +29,9 @@
> >   #include "modules/color/color_gamma.h"
> >   #include "basics/conversion.h"
> > -/*
> > +/**
> > + * DOC: overview
> > + *
> >    * The DC interface to HW gives us the following color management blo=
cks
> >    * per pipe (surface):
> >    *
> > @@ -71,8 +73,8 @@
> >   #define MAX_DRM_LUT_VALUE 0xFFFF
> > -/*
> > - * Initialize the color module.
> > +/**
> > + * amdgpu_dm_init_color_mod - Initialize the color module.
> >    *
> >    * We're not using the full color module, only certain components.
> >    * Only call setup functions for components that we need.
> > @@ -82,7 +84,14 @@ void amdgpu_dm_init_color_mod(void)
> >   	setup_x_points_distribution();
> >   }
> > -/* Extracts the DRM lut and lut size from a blob. */
> > +/**
> > + * __extract_blob_lut - Extracts the DRM lut and lut size from a blob.
> > + * @blob: DRM color mgmt property blob
> > + * @size: lut size
> > + *
> > + * Returns:
> > + * DRM LUT or NULL
> > + */
> >   static const struct drm_color_lut *
> >   __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *si=
ze)
> >   {
> > @@ -90,13 +99,18 @@ __extract_blob_lut(const struct drm_property_blob *=
blob, uint32_t *size)
> >   	return blob ? (struct drm_color_lut *)blob->data : NULL;
> >   }
>=20
> I don't think everyone would approve using actual kernel-doc for these
> static functions, but I can appreciate they being formatted as such.
> Consider replacing /** with /*.

IMHO, although they are static, they provide info to understand the AMD
DM programming of DRM color correction properties. I see the value for
external contributors, but I'm not sure about kernel-doc rules about it.

>=20
> > -/*
> > - * Return true if the given lut is a linear mapping of values, i.e. it=
 acts
> > - * like a bypass LUT.
> > +/**
> > + * __is_lut_linear - check if the given lut is a linear mapping of val=
ues
> > + * @lut: given lut to check values
> > + * @size: lut size
> >    *
> >    * It is considered linear if the lut represents:
> > - * f(a) =3D (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in
> > - *                                           [0, MAX_COLOR_LUT_ENTRIES)
> > + * f(a) =3D (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in [0,
> > + * MAX_COLOR_LUT_ENTRIES)
> > + *
> > + * Returns:
> > + * True if the given lut is a linear mapping of values, i.e. it acts l=
ike a
> > + * bypass LUT. Otherwise, false.
> >    */
> >   static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t=
 size)
> >   {
> > @@ -119,9 +133,13 @@ static bool __is_lut_linear(const struct drm_color=
_lut *lut, uint32_t size)
> >   	return true;
> >   }
> > -/*
> > - * Convert the drm_color_lut to dc_gamma. The conversion depends on th=
e size
> > - * of the lut - whether or not it's legacy.
> > +/**
> > + * __drm_lut_to_dc_gamma - convert the drm_color_lut to dc_gamma.
> > + * @lut: DRM lookup table for color conversion
> > + * @gamma: DC gamma to set entries
> > + * @is_legacy: legacy or atomic gamma
> > + *
> > + * The conversion depends on the size of the lut - whether or not it's=
 legacy.
> >    */
> >   static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
> >   				  struct dc_gamma *gamma, bool is_legacy)
> > @@ -154,8 +172,11 @@ static void __drm_lut_to_dc_gamma(const struct drm=
_color_lut *lut,
> >   	}
> >   }
> > -/*
> > - * Converts a DRM CTM to a DC CSC float matrix.
> > +/**
> > + * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
> > + * @ctm: DRM color transformation matrix
> > + * @matrix: DC CSC float matrix
> > + *
> >    * The matrix needs to be a 3x4 (12 entry) matrix.
> >    */
> >   static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
> > @@ -189,7 +210,18 @@ static void __drm_ctm_to_dc_matrix(const struct dr=
m_color_ctm *ctm,
> >   	}
> >   }
> > -/* Calculates the legacy transfer function - only for sRGB input space=
=2E */
> > +/**
> > + * __set_legacy_tf - Calculates the legacy transfer function
> > + * @func: transfer function
> > + * @lut: lookup table that defines the color space
> > + * @lut_size: size of respective lut
> > + * @has_rom: if ROM can be used for hardcoded curve
> > + *
> > + * Only for sRGB input space
> > + *
> > + * Returns:
> > + * 0 in case of sucess, -ENOMEM if fails
>=20
> Typo sucess -> success
>=20
> > + */
> >   static int __set_legacy_tf(struct dc_transfer_func *func,
> >   			   const struct drm_color_lut *lut, uint32_t lut_size,
> >   			   bool has_rom)
> > @@ -218,7 +250,16 @@ static int __set_legacy_tf(struct dc_transfer_func=
 *func,
> >   	return res ? 0 : -ENOMEM;
> >   }
> > -/* Calculates the output transfer function based on expected input spa=
ce. */
> > +/**
> > + * __set_output_tf - calculates the output transfer function based on =
expected input space.
> > + * @func: transfer function
> > + * @lut: lookup table that defines the color space
> > + * @lut_size: size of respective lut
> > + * @has_rom: if ROM can be used for hardcoded curve
> > + *
> > + * Returns:
> > + * 0 in case of success. -ENOMEM if fails.
> > + */
> >   static int __set_output_tf(struct dc_transfer_func *func,
> >   			   const struct drm_color_lut *lut, uint32_t lut_size,
> >   			   bool has_rom)
> > @@ -239,7 +280,7 @@ static int __set_output_tf(struct dc_transfer_func =
*func,
> >   	__drm_lut_to_dc_gamma(lut, gamma, false);
> >   	if (func->tf =3D=3D TRANSFER_FUNCTION_LINEAR) {
> > -		/*
> > +		/**
>=20
> I don't think kernel-doc should be used inside functions, as well,
> maybe keep the "/*" from before. This occurs in more places in this patch,
> remember to replace them as well, if you concur.

hmm.. I think inline doc is good to avoid repetitions, at the same time we
expose this info and keep it near its context in the code. This is why I
chose this path.. I'll think about it.

>=20
> >   		 * Color module doesn't like calculating regamma params
> >   		 * on top of a linear input. But degamma params can be used
> >   		 * instead to simulate this.
> > @@ -262,7 +303,16 @@ static int __set_output_tf(struct dc_transfer_func=
 *func,
> >   	return res ? 0 : -ENOMEM;
> >   }
> > -/* Caculates the input transfer function based on expected input space=
=2E */
> > +/**
> > + * __set_input_tf - calculates the input transfer function based on ex=
pected
> > + * input space.
> > + * @func: transfer function
> > + * @lut: lookup table that defines the color space
> > + * @lut_size: size of respective lut.
> > + *
> > + * Returns:
> > + * 0 in case of success. -ENOMEM if fails.
> > + */
> >   static int __set_input_tf(struct dc_transfer_func *func,
> >   			  const struct drm_color_lut *lut, uint32_t lut_size)
> >   {
> > @@ -285,13 +335,15 @@ static int __set_input_tf(struct dc_transfer_func=
 *func,
> >   }
> >   /**
> > - * amdgpu_dm_verify_lut_sizes
> > + * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supp=
orted sizes
> >    * @crtc_state: the DRM CRTC state
> >    *
> > - * Verifies that the Degamma and Gamma LUTs attached to the |crtc_stat=
e| are of
> > - * the expected size.
> > + * Verifies that the Degamma and Gamma LUTs attached to the &crtc_state
> > + * are of the expected size.
> >    *
> > - * Returns 0 on success.
> > + * Returns:
> > + * 0 on success.
> > + * -EINVAL if any lut sizes are invalid.
>=20
> I don't know if you expect this to be rendered in two lines, given that y=
ou
> wrote something equivalent in a single line in other docstrings above, but
> if you do, use instead:
> ```
> * * 0 on success.
> * * -EINVAL if any lut sizes are invalid.
> ```
> As described at: https://www.kernel.org/doc/html/latest/doc-guide/kernel-=
doc.html#return-values

I expected they are in the same line, separated by dot. I'll put the
together for clarity.

Thanks,

Melissa
>=20
> >    */
> >   int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_stat=
e)
> >   {
> > @@ -327,9 +379,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crt=
c_state *crtc_state)
> >    * of the HW blocks as long as the CRTC CTM always comes before the
> >    * CRTC RGM and after the CRTC DGM.
> >    *
> > - * The CRTC RGM block will be placed in the RGM LUT block if it is non=
-linear.
> > - * The CRTC DGM block will be placed in the DGM LUT block if it is non=
-linear.
> > - * The CRTC CTM will be placed in the gamut remap block if it is non-l=
inear.
> > + * * The CRTC RGM block will be placed in the RGM LUT block if it is n=
on-linear.
> > + * * The CRTC DGM block will be placed in the DGM LUT block if it is n=
on-linear.
> > + * * The CRTC CTM will be placed in the gamut remap block if it is non=
-linear.
> >    *
> >    * The RGM block is typically more fully featured and accurate across
> >    * all ASICs - DCE can't support a custom non-linear CRTC DGM.
> > @@ -338,7 +390,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crt=
c_state *crtc_state)
> >    * management at once we have to either restrict the usage of CRTC pr=
operties
> >    * or blend adjustments together.
> >    *
> > - * Returns 0 on success.
> > + * Returns:
> > + * 0 on success.
> > + * Error code if setup fails.
> >    */
> >   int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
> >   {
> > @@ -373,7 +427,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc=
_state *crtc)
> >   	/* Setup regamma and degamma. */
> >   	if (is_legacy) {
> > -		/*
> > +		/**
> >   		 * Legacy regamma forces us to use the sRGB RGM as a base.
> >   		 * This also means we can't use linear DGM since DGM needs
> >   		 * to use sRGB as a base as well, resulting in incorrect CRTC
> > @@ -393,7 +447,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc=
_state *crtc)
> >   		if (r)
> >   			return r;
> >   	} else if (has_regamma) {
> > -		/* CRTC RGM goes into RGM LUT. */
> > +		/**
> > +		 * If atomic regamma, CRTC RGM goes into RGM LUT. */
> >   		stream->out_transfer_func->type =3D TF_TYPE_DISTRIBUTED_POINTS;
> >   		stream->out_transfer_func->tf =3D TRANSFER_FUNCTION_LINEAR;
> > @@ -402,7 +457,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc=
_state *crtc)
> >   		if (r)
> >   			return r;
> >   	} else {
> > -		/*
> > +		/**
> >   		 * No CRTC RGM means we can just put the block into bypass
> >   		 * since we don't have any plane level adjustments using it.
> >   		 */
> > @@ -410,7 +465,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc=
_state *crtc)
> >   		stream->out_transfer_func->tf =3D TRANSFER_FUNCTION_LINEAR;
> >   	}
> > -	/*
> > +	/**
> >   	 * CRTC DGM goes into DGM LUT. It would be nice to place it
> >   	 * into the RGM since it's a more featured block but we'd
> >   	 * have to place the CTM in the OCSC in that case.
> > @@ -421,7 +476,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc=
_state *crtc)
> >   	if (crtc->base.ctm) {
> >   		ctm =3D (struct drm_color_ctm *)crtc->base.ctm->data;
> > -		/*
> > +		/**
> >   		 * Gamut remapping must be used for gamma correction
> >   		 * since it comes before the regamma correction.
> >   		 *
> > @@ -452,7 +507,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc=
_state *crtc)
> >    * preparation for hardware commit. The transfer function used depend=
s on
> >    * the prepartion done on the stream for color management.
>=20
> Could you fix this typo while you are here? prepartion -> preparation
>=20
> >    *
> > - * Returns 0 on success.
> > + * Returns:
> > + * 0 on success.
> > + * ENOMEM if mem allocation fails.
> >    */
> >   int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >   				      struct dc_plane_state *dc_plane_state)
>=20
> Thanks for creating more documentation!
>=20
> Kind regards,
> Tales

--y3dx43a2dge4m2bk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLYh4YACgkQwqF3j0dL
ehy9XRAAwecISaAD7uTu4A1lMsIPIvlYj3LXpIbOH1OZHQ6D6c+M0SdgHCumeqID
e6rphQaw4cxjLHPTNUT71ttgK5mUE0iJBshH1Y8U4G2vsTmJaM30KXyuwZhpIkL5
6WC5OQSRCn2Wj+8hVrxlps78aLt861lJ78bmmZ0ujUb43iKzoZ7I/1MV6KeL/H3G
JwfRHiYnzN4CzelMXK372Isr+gB1ZaDH8w8/q+lEVnQN8EEYbUn9eWcvhlQzp0ar
9rrk9IVttEBI2pNXVKYUVN4Zdid69MaCWOlgR5kq7S0YMuyhnAZ4yXA0pW2iCOV4
fIjAd4t43Rn9XY6uFCpYi8Ihu972QFMA1c6aK0LGNF00Mxqq7xwg9uCLNQFj0f5T
LSiCdyYfIvWo6rzWk7PujOxa5BrPrUt+6BjSYepLrgQwJUEgsH1l1uZ8XbqRad3r
VTmnu3BpwlFhf4zJM00ue6z2BdPFJeVy3FKOy4ur7m10IsZAWatzRWiG5KArlF3S
EYa+F8szhyiUXcq82C0YoTLqFsVeFQ5O4SM3c5HYHGcwxMb7tbzakmt7xe5ky2rZ
KERstkMo131Sl1avPolMlwov6Wy4muJiTQXFkuHQ0W5ODLxFW4cAdsDarDu1TREI
XCV8VnGzSLpDa0YGeoRiJJ3KGVs+ykhdPMERRHdMbkorrWPtv24=
=VqPw
-----END PGP SIGNATURE-----

--y3dx43a2dge4m2bk--

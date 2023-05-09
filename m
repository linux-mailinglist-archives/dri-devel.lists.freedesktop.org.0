Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E106FCB69
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1257610E1AD;
	Tue,  9 May 2023 16:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB49710E1AD;
 Tue,  9 May 2023 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R40lkV2CFRJyCp/GbWmiXXzZrCx7rYAB8u56lzxd0dE=; b=sUWvu9WkObboIKA8N9xmaOOikB
 XovxhDb4c7DHuXa3WkeJViMcrgihe0x79b+hitUp2TGNPAiQUK7wmVdQLHFEjS9TTfJH2s6SIh1qH
 2WUSdshzxcv5tP4NgaHl8geSqADK0Fvr34+J8JL2MB/0X1yOBet1+Z76Kplzpu/Q4OlstFo4e9cK3
 mU6gR6WOMh45tDf/K01tsagGXDx8MPICGdwS0GN5qGmaNUTuYSzcUyorrMflIQmvneY9KSVct2Xyg
 1G1bunzFDioEItvVn2bXYNgL5c+bsPtJHpAdGzYPrVapXCxxPqvmOekZ7meDX6jBQaudSWkAsml8D
 7+T05F9Q==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwQKn-0052h8-6s; Tue, 09 May 2023 18:37:05 +0200
Date: Tue, 9 May 2023 15:37:01 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 12/40] drm/amd/display: add plane HDR multiplier
 driver-private property
Message-ID: <20230509163701.57lf22phumicqv37@mail.igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-13-mwen@igalia.com>
 <5bbd49b6-ad09-607f-521d-96f9d8eb3b20@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nfaok3sextt6axef"
Content-Disposition: inline
In-Reply-To: <5bbd49b6-ad09-607f-521d-96f9d8eb3b20@amd.com>
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
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nfaok3sextt6axef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/08, Harry Wentland wrote:
>=20
>=20
> On 4/23/23 10:10, Melissa Wen wrote:
> > From: Joshua Ashton <joshua@froggi.es>
> >=20
> > Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
> > transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
> > least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier =3D=
 80
> > nits for SDR content. So if you want, 203 nits for SDR content, pass in
> > (203.0 / 80.0).
> >=20
>=20
> Is gamescope intending to use this?

I don't think so. Again, I'll double check and drop it accordingly.

Melissa

>=20
> Harry
>=20
> > Co-developed-by: Melissa Wen <mwen@igalia.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 +++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 +++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 12 +++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 25 ++++++++++++++-----
> >  4 files changed, 41 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_display.c
> > index 24595906dab1..dd658f162f6f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -1326,6 +1326,12 @@ amdgpu_display_create_color_properties(struct am=
dgpu_device *adev)
> >  		return -ENOMEM;
> >  	adev->mode_info.plane_degamma_tf_property =3D prop;
> > =20
> > +	prop =3D drm_property_create_range(adev_to_drm(adev),
> > +					 0, "AMD_PLANE_HDR_MULT", 0, UINT_MAX);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_hdr_mult_property =3D prop;
> > +
> >  	return 0;
> >  }
> >  #endif
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_mode.h
> > index ab9ce6f26c90..65a9d62ffbe4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -387,6 +387,10 @@ struct amdgpu_mode_info {
> >  	 * linearize content with or without LUT.
> >  	 */
> >  	struct drm_property *plane_degamma_tf_property;
> > +	/**
> > +	 * @plane_hdr_mult_property:
> > +	 */
> > +	struct drm_property *plane_hdr_mult_property;
> >  #endif
> >  };
> > =20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index 005632c1c9ec..bb7307b9cfd5 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -51,6 +51,7 @@
> > =20
> >  #define AMDGPU_DMUB_NOTIFICATION_MAX 5
> > =20
> > +#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
> >  /*
> >  #include "include/amdgpu_dal_power_if.h"
> >  #include "amdgpu_dm_irq.h"
> > @@ -736,6 +737,17 @@ struct dm_plane_state {
> >  	 * linearize.
> >  	 */
> >  	enum drm_transfer_function degamma_tf;
> > +	/**
> > +	 * @hdr_mult:
> > +	 *
> > +	 * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
> > +	 * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
> > +	 * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
> > +	 * Therefore, 1.0 multiplier =3D 80 nits for SDR content.  So if you
> > +	 * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
> > +	 * S31.32 sign-magnitude.
> > +	 */
> > +	__u64 hdr_mult;
> >  #endif
> >  };
> > =20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 5b458cc0781c..57169dae8b3d 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1321,8 +1321,10 @@ static void dm_drm_plane_reset(struct drm_plane =
*plane)
> >  		__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
> > =20
> >  #ifdef CONFIG_STEAM_DECK
> > -	if (amdgpu_state)
> > +	if (amdgpu_state) {
> >  		amdgpu_state->degamma_tf =3D DRM_TRANSFER_FUNCTION_DEFAULT;
> > +		amdgpu_state->hdr_mult =3D AMDGPU_HDR_MULT_DEFAULT;
> > +	}
> >  #endif
> >  }
> > =20
> > @@ -1424,11 +1426,11 @@ static void dm_drm_plane_destroy_state(struct d=
rm_plane *plane,
> >  #ifdef CONFIG_STEAM_DECK
> >  int
> >  amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
> > -					       struct drm_property_blob **blob,
> > -					       uint64_t blob_id,
> > -					       ssize_t expected_size,
> > -					       ssize_t expected_elem_size,
> > -					       bool *replaced)
> > +					struct drm_property_blob **blob,
> > +					uint64_t blob_id,
> > +					ssize_t expected_size,
> > +					ssize_t expected_elem_size,
> > +					bool *replaced)
> >  {
> >  	struct drm_property_blob *new_blob =3D NULL;
> > =20
> > @@ -1482,6 +1484,10 @@ dm_plane_attach_color_mgmt_properties(struct amd=
gpu_display_manager *dm,
> >  					   dm->adev->mode_info.plane_degamma_tf_property,
> >  					   DRM_TRANSFER_FUNCTION_DEFAULT);
> >  	}
> > +	/* HDR MULT is always available */
> > +	drm_object_attach_property(&plane->base,
> > +				   dm->adev->mode_info.plane_hdr_mult_property,
> > +				   AMDGPU_HDR_MULT_DEFAULT);
> >  }
> > =20
> >  static int
> > @@ -1507,6 +1513,11 @@ dm_atomic_plane_set_property(struct drm_plane *p=
lane,
> >  			dm_plane_state->degamma_tf =3D val;
> >  			dm_plane_state->base.color_mgmt_changed =3D 1;
> >  		}
> > +	} else if (property =3D=3D adev->mode_info.plane_hdr_mult_property) {
> > +		if (dm_plane_state->hdr_mult !=3D val) {
> > +			dm_plane_state->hdr_mult =3D val;
> > +			dm_plane_state->base.color_mgmt_changed =3D 1;
> > +		}
> >  	} else {
> >  		drm_dbg_atomic(plane->dev,
> >  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> > @@ -1533,6 +1544,8 @@ dm_atomic_plane_get_property(struct drm_plane *pl=
ane,
> >  			dm_plane_state->degamma_lut->base.id : 0;
> >  	} else if (property =3D=3D adev->mode_info.plane_degamma_tf_property)=
 {
> >  		*val =3D dm_plane_state->degamma_tf;
> > +	} else if (property =3D=3D adev->mode_info.plane_hdr_mult_property) {
> > +		*val =3D dm_plane_state->hdr_mult;
> >  	} else {
> >  		return -EINVAL;
> >  	}
>=20
>=20

--nfaok3sextt6axef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRadqwACgkQwqF3j0dL
ehxMLg//UGvD/CNPh09hk0n0qT3NsizvkT1mfvtGZKGCczyWdTuhPLahM7K2fzXM
XaKlOhlDxCydvxQObxS5Ocr9aBRvAzf9a6jOMmrod2Zb8dj4b3VyU99K9TNdi/Xj
UNFd8S1ZhY3B+plRDjxeCAKGia01LrlzHAQ5pbFgKgJAK2jWPsyST9N2NQebdR92
WbtcG/5jWOHLmVLdspUW5wbFXPoLt5e1ITXjry8dWTyUQz+s3BbpaPO1ZCsinCRO
sXDBxXmX56MYfLZerntUpYMx6AHmv9vOlwEmTT1CNfu2jlUmUAqpSpBmNLUyjRAi
SwSti+FNMir9ffA7iDMMWPTcPk1PKc5cs8TuHYnAsGI47x/qQO6IMp4bTJRko5uT
9voOrhyIIMSVJ58su/1XNxFgHfpWaF4CSHZveeSSijodm1+ao1ZlLIeRmybHERCG
LBLni/g2a2obx5ex1p/gsqzmur7Gn5nlRgaV0JdxSUMn1jzfOWo0yjsYKofDp/BL
ryLWSXhv+3HmdBX3wkCI/i4W3XHtUhzZZh3E3ZLTesEWUp/uWJxuDK68D9JMpBgq
+J3KOhotWkQChz6Fuo4PmfDhtnpPSnWnyAJc5ABknpFtZBaLayor7ccnMJXjpU8I
EcNTne7BQoh1C84Gxcg/lBXXdh2etqsaVEResyEs1ciXteUNHLw=
=DTGq
-----END PGP SIGNATURE-----

--nfaok3sextt6axef--

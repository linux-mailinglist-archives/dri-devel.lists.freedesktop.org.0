Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293F06FCB64
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BDC10E19D;
	Tue,  9 May 2023 16:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBF610E192;
 Tue,  9 May 2023 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bg5Kd9t2pdkjyZXvpVR64pjQrWF+PhjNMsELu449pYc=; b=M2uNGfyfOyKcn/h9w2nmSZg1Qt
 oKDiWdlpoX14TnIhGzH11zCHOsn9a6xMmxWjRROyyZBY+JVsnew1t3dofaG3Jt+7FcHNc5o9Qk7yr
 ZS8dHlZoXGxc5ZLDXjucVGU/MGkKXm7wc1x0UOv/uBdmrlJPLOQDNCo/WNY1B1stn8rTZTjoink1g
 gyRMPjYBpKVR4Tw0FqyhEIib+r5+59Nq0Mk/FEriq+koJnIoEnRJR2jp8RcNMsERsIBWhJSe8TQKZ
 W85zdhfbpspkpEyYRCzw/Ow6OEzAxMo2Ds+9mi9QqTnxLTxzmhiZxDGvdVTITUo936pDJK4BeFy9d
 SmQEbMHA==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwQJe-0052fe-6X; Tue, 09 May 2023 18:35:54 +0200
Date: Tue, 9 May 2023 15:35:50 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 09/40] drm/amd/display: move replace blob func to dm
 plane
Message-ID: <20230509163550.jzu5rxfhnh4sr3j2@mail.igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-10-mwen@igalia.com>
 <f8871b8f-af40-61df-7a77-a632015c9201@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="owkghr2ha7ojdk2i"
Content-Disposition: inline
In-Reply-To: <f8871b8f-af40-61df-7a77-a632015c9201@amd.com>
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


--owkghr2ha7ojdk2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/08, Harry Wentland wrote:
>=20
>=20
> On 4/23/23 10:10, Melissa Wen wrote:
> > From amdgpu_dm_plane we can get it for both CRTC and plane color
> > properties. We are adding new plane properties for AMD driver-private
> > color mgmt.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 37 +------------------
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 35 ++++++++++++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  7 ++++
> >  3 files changed, 44 insertions(+), 35 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > index 79324fbab1f1..27d7a8b18013 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > @@ -344,39 +344,6 @@ dm_crtc_additional_color_mgmt(struct drm_crtc *crt=
c)
> >  					   DRM_TRANSFER_FUNCTION_DEFAULT);
> >  }
> > =20
> > -static int
> > -atomic_replace_property_blob_from_id(struct drm_device *dev,
> > -					 struct drm_property_blob **blob,
> > -					 uint64_t blob_id,
> > -					 ssize_t expected_size,
> > -					 ssize_t expected_elem_size,
> > -					 bool *replaced)
> > -{
> > -	struct drm_property_blob *new_blob =3D NULL;
> > -
> > -	if (blob_id !=3D 0) {
> > -		new_blob =3D drm_property_lookup_blob(dev, blob_id);
> > -		if (new_blob =3D=3D NULL)
> > -			return -EINVAL;
> > -
> > -		if (expected_size > 0 &&
> > -		    new_blob->length !=3D expected_size) {
> > -			drm_property_blob_put(new_blob);
> > -			return -EINVAL;
> > -		}
> > -		if (expected_elem_size > 0 &&
> > -		    new_blob->length % expected_elem_size !=3D 0) {
> > -			drm_property_blob_put(new_blob);
> > -			return -EINVAL;
> > -		}
> > -	}
> > -
> > -	*replaced |=3D drm_property_replace_blob(blob, new_blob);
> > -	drm_property_blob_put(new_blob);
> > -
> > -	return 0;
> > -}
> > -
> >  static int
> >  amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
> >  				   struct drm_crtc_state *state,
> > @@ -389,7 +356,7 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc =
*crtc,
> >  	int ret;
> > =20
> >  	if (property =3D=3D adev->mode_info.shaper_lut_property) {
> > -		ret =3D atomic_replace_property_blob_from_id(crtc->dev,
> > +		ret =3D amdgpu_dm_replace_property_blob_from_id(crtc->dev,
> >  					&acrtc_state->shaper_lut,
> >  					val,
> >  					-1, sizeof(struct drm_color_lut),
> > @@ -397,7 +364,7 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc =
*crtc,
> >  		acrtc_state->base.color_mgmt_changed |=3D replaced;
> >  		return ret;
> >  	} else if (property =3D=3D adev->mode_info.lut3d_property) {
> > -		ret =3D atomic_replace_property_blob_from_id(crtc->dev,
> > +		ret =3D amdgpu_dm_replace_property_blob_from_id(crtc->dev,
> >  					&acrtc_state->lut3d,
> >  					val,
> >  					-1, sizeof(struct drm_color_lut),
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 322668973747..4e5498153be2 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1411,6 +1411,41 @@ static void dm_drm_plane_destroy_state(struct dr=
m_plane *plane,
> >  	drm_atomic_helper_plane_destroy_state(plane, state);
> >  }
> > =20
> > +#ifdef CONFIG_STEAM_DECK
> > +int
> > +amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
> > +					       struct drm_property_blob **blob,
> > +					       uint64_t blob_id,
> > +					       ssize_t expected_size,
> > +					       ssize_t expected_elem_size,
> > +					       bool *replaced)
> > +{
> > +	struct drm_property_blob *new_blob =3D NULL;
> > +
> > +	if (blob_id !=3D 0) {
> > +		new_blob =3D drm_property_lookup_blob(dev, blob_id);
> > +		if (new_blob =3D=3D NULL)
> > +			return -EINVAL;
> > +
> > +		if (expected_size > 0 &&
> > +		    new_blob->length !=3D expected_size) {
> > +			drm_property_blob_put(new_blob);
> > +			return -EINVAL;
> > +		}
> > +		if (expected_elem_size > 0 &&
> > +		    new_blob->length % expected_elem_size !=3D 0) {
> > +			drm_property_blob_put(new_blob);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	*replaced |=3D drm_property_replace_blob(blob, new_blob);
> > +	drm_property_blob_put(new_blob);
> > +
> > +	return 0;
> > +}
>=20
> amdgpu_dm_plane doesn't seem the right place for it either. Maybe a new
> amdgpu_dm_helper.c/h?
>=20
> Alternatively would this make sense to live in DRM core as a helper?

A DRM helper sounds better for me. I'll follow this path.

Melissa

>=20
> Harry
>=20
> > +#endif
> > +
> >  static const struct drm_plane_funcs dm_plane_funcs =3D {
> >  	.update_plane	=3D drm_atomic_helper_update_plane,
> >  	.disable_plane	=3D drm_atomic_helper_disable_plane,
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> > index 930f1572f898..1b05ac4c15f6 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> > @@ -51,6 +51,13 @@ int amdgpu_dm_plane_fill_plane_buffer_attributes(str=
uct amdgpu_device *adev,
> >  				 bool tmz_surface,
> >  				 bool force_disable_dcc);
> > =20
> > +int amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
> > +					    struct drm_property_blob **blob,
> > +					    uint64_t blob_id,
> > +					    ssize_t expected_size,
> > +					    ssize_t expected_elem_size,
> > +					    bool *replaced);
> > +
> >  int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
> >  			 struct drm_plane *plane,
> >  			 unsigned long possible_crtcs,
>=20
>=20

--owkghr2ha7ojdk2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRadmYACgkQwqF3j0dL
ehzmDA//Un7neD4yKZusVn8I3pYKqbStTsF02aiWzppht/8rYFe+Q+ZOrBWXhr3G
nfgZFpuMIfPDa2MtYhwhdWsZD3NyDx0+VodNZSTdpOEoOz/79rh2rUhGgJmpbBwr
cdhN5v5cBxu1qm+zGjxOcWIvL3e1jBppooMi9FBCrvN37sdXUzUbAG8t7Co55KLo
LPSQEcTSSy44x2aFM7dTOYOYnz5NwwLtq2db1N87gFHOEP6OAw2BKWmEajMHbRva
mqRvQSOWa+S9BIh6BsLBEEsmH4nKPTVigaOXnv0JOfpUW50EztLwknpnwS50X817
x7ctjk9lnYI7rU1RixHE6Y8PGXGvK4lAY3YNjY+ANO35iy9HqnR+3tCMpO5z4i96
K8E69VP0KU72zkiIdPtnd1wV85ZkhKrvw/fkpeKrleEfvqSj36ffkgvJwB637xV4
HkSG9c5tevYgWh5iuhYWgpOzc4T496Uuc0Pjw+4gzX7ErX+hBXyAnWSbkRcVIsV6
SX1W0ZN8L1yJX8eAIO6sDvXqdhpF/wBo5tsrABhniBgo84Mhkmiac6EI0lNTlXqF
EIPC6FTV3AoYq+MXWI3Ad2yRtP8lTGk0Vt8TkG3zM80lmIt5r24v1u7U7IJgQSpz
TKf8WskuFflZYNIbgF/xS88FZob6Sv6kOs9tVjCPiEiQp5njMTU=
=OpAo
-----END PGP SIGNATURE-----

--owkghr2ha7ojdk2i--

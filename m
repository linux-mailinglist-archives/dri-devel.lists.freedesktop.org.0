Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA4788BB4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E832010E6AD;
	Fri, 25 Aug 2023 14:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89FF10E6AC;
 Fri, 25 Aug 2023 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TGt/GTv13MQd5EJYb83vy8cL8hzAXGUAw7TT+taelVc=; b=WDXQXr626TM8d9yeLpgm61Ci6b
 Od5O/Vlnv7GaotaPMWOzAD84SLVv7QTfHzJdFCyAiwgLApcSZ44UWMlZ1hvMiK5j/vMt7IA2aOwNr
 Dbfl3V4QH6lCv5QHKzVmRzgpqXNRevCzOeuLaSPv7IdsX/zv5dhSPfiEcnI06yEho8niRdd4SY4ZC
 yJCLefuRoMqDZXwLyqT2dfMXx7yA8Jw8Zcx/0C+Qsj+5Zx8v8JVljvZW3iPeYuzDXVjnK2Yi4PiSM
 Jr7g+9/tDTbnsVVH4I/ZbyXQMcUOiBqMFxLvBN41OdwIyhiR8vjFnC75qpELWlXzs7gX6bAtHlKyH
 1WkXXbFA==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qZXp0-00FJHc-Vi; Fri, 25 Aug 2023 16:29:59 +0200
Date: Fri, 25 Aug 2023 13:29:44 -0100
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping
 CRTC degamma to DC plane
Message-ID: <20230825142944.3jkibtz54f4utwuq@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="crdzpq3rjuvmqkwv"
Content-Disposition: inline
In-Reply-To: <20230822151110.3107b745.pekka.paalanen@collabora.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--crdzpq3rjuvmqkwv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/22, Pekka Paalanen wrote:
> On Thu, 10 Aug 2023 15:02:59 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>=20
> > The next patch adds pre-blending degamma to AMD color mgmt pipeline, but
> > pre-blending degamma caps (DPP) is currently in use to provide DRM CRTC
> > atomic degamma or implict degamma on legacy gamma. Detach degamma usage
> > regarging CRTC color properties to manage plane and CRTC color
> > correction combinations.
> >=20
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++------
> >  1 file changed, 41 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index 68e9f2c62f2e..74eb02655d96 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crt=
c_state *crtc)
> >  	return 0;
> >  }
> > =20
> > -/**
> > - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC =
plane.
> > - * @crtc: amdgpu_dm crtc state
> > - * @dc_plane_state: target DC surface
> > - *
> > - * Update the underlying dc_stream_state's input transfer function (IT=
F) in
> > - * preparation for hardware commit. The transfer function used depends=
 on
> > - * the preparation done on the stream for color management.
> > - *
> > - * Returns:
> > - * 0 on success. -ENOMEM if mem allocation fails.
> > - */
> > -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> > -				      struct dc_plane_state *dc_plane_state)
> > +static int
> > +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> > +			     struct dc_plane_state *dc_plane_state)
> >  {
> >  	const struct drm_color_lut *degamma_lut;
> >  	enum dc_transfer_func_predefined tf =3D TRANSFER_FUNCTION_SRGB;
> > @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crt=
c_state *crtc,
> >  						 &degamma_size);
> >  		ASSERT(degamma_size =3D=3D MAX_COLOR_LUT_ENTRIES);
> > =20
> > -		dc_plane_state->in_transfer_func->type =3D
> > -			TF_TYPE_DISTRIBUTED_POINTS;
> > +		dc_plane_state->in_transfer_func->type =3D TF_TYPE_DISTRIBUTED_POINT=
S;
> > =20
> >  		/*
> >  		 * This case isn't fully correct, but also fairly
> > @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crt=
c_state *crtc,
> >  				   degamma_lut, degamma_size);
> >  		if (r)
> >  			return r;
> > -	} else if (crtc->cm_is_degamma_srgb) {
> > +	} else {
> >  		/*
> >  		 * For legacy gamma support we need the regamma input
> >  		 * in linear space. Assume that the input is sRGB.
> > @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_cr=
tc_state *crtc,
> > =20
> >  		if (tf !=3D TRANSFER_FUNCTION_SRGB &&
> >  		    !mod_color_calculate_degamma_params(NULL,
> > -			    dc_plane_state->in_transfer_func, NULL, false))
> > +							dc_plane_state->in_transfer_func,
> > +							NULL, false))
> >  			return -ENOMEM;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC =
plane.
> > + * @crtc: amdgpu_dm crtc state
> > + * @dc_plane_state: target DC surface
> > + *
> > + * Update the underlying dc_stream_state's input transfer function (IT=
F) in
> > + * preparation for hardware commit. The transfer function used depends=
 on
> > + * the preparation done on the stream for color management.
> > + *
> > + * Returns:
> > + * 0 on success. -ENOMEM if mem allocation fails.
> > + */
> > +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> > +				      struct dc_plane_state *dc_plane_state)
> > +{
> > +	bool has_crtc_cm_degamma;
> > +	int ret;
> > +
> > +	has_crtc_cm_degamma =3D (crtc->cm_has_degamma || crtc->cm_is_degamma_=
srgb);
> > +	if (has_crtc_cm_degamma){
> > +		/* AMD HW doesn't have post-blending degamma caps. When DRM
> > +		 * CRTC atomic degamma is set, we maps it to DPP degamma block
> > +		 * (pre-blending) or, on legacy gamma, we use DPP degamma to
> > +		 * linearize (implicit degamma) from sRGB/BT709 according to
> > +		 * the input space.
>=20
> Uhh, you can't just move degamma before blending if KMS userspace
> wants it after blending. That would be incorrect behaviour. If you
> can't implement it correctly, reject it.
>=20
> I hope that magical unexpected linearization is not done with atomic,
> either.
>=20
> Or maybe this is all a lost cause, and only the new color-op pipeline
> UAPI will actually work across drivers.

I agree that crtc degamma is an optional property and should be not
exposed if not available.  I did something in this line for DCE that has
no degamma block[1].  Then, AMD DDX driver stopped to advertise atomic
API for DCE, that was not correct too[2].

But I see it as a lost cause that will only be fixed in a new generic
color API. I don't think we should change it using the current DRM CRTC
API with driver-specific props.

[1] https://lore.kernel.org/amd-gfx/20221103184500.14450-1-mwen@igalia.com/
[2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/issues/67
>=20
>=20
> Thanks,
> pq
>=20
> > +		 */
> > +		ret =3D map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
> > +		if (ret)
> > +			return ret;
> >  	} else {
> >  		/* ...Otherwise we can just bypass the DGM block. */
> >  		dc_plane_state->in_transfer_func->type =3D TF_TYPE_BYPASS;
>=20

--crdzpq3rjuvmqkwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmToutIACgkQwqF3j0dL
ehy5NA/9EdmnRFoWaC9teJxgxc6p+TJFocyVYDHQjj2O2+O0DYv9o58NWsjhqbzz
ng67Zn4MWJqEYSe4iKXnoMknROT+FNV+hVjkTn8WJyjOsjP97aqKApouAHnIWQfZ
n66xc6KCT4O/B3TjNRFfZltRdPikSM/ynpEbOGdAn0u/WqtZWcAmXeRwXIrdvO+N
Z2SjIZL4ksowDrBHgYx63cxkknRkfhp00npkohPwqiPrb38hYSmj+SuP2nXo2gXS
Xe23abhCD1L0xWB4WGlPZLE14VDU8M7Z4ILAF7J6SyA4syaPl9qtlM1USS7aq1TA
eOkgGBxCOzvW0T0DfXseD+pg3b4l+Z5tWSC9aRXcW+GnJ/lbxmdTfyld4IW6FWND
i+AcD2RNJZlI0Nc8JpmfijNvaq/wlRvFDBp9er7WUtKdjMA2yRLWHMgCjlsUXsgc
TGfDM6KtTDMkh0ZQcAbU0a4VwDuGW4kiekrz5cHIR6yZsopvcyZUkY4pRPnzKJY2
lv+uYALHOvr79n31ppW74xfMRVOU4GaNKnPCmW1aDcxJQzUqiv2KBZvVzJqfgKq9
AYXGZELjnp5uG/jwh4vkeEXgpd7x1AyIMDdOtWrDSMu3m0pKfMB1Yo0ZcY5Zm3F9
Ch/dQo33pIbRbcULhfeq7o1NSfhmvVyhlyQCa/clr0iVU3JgtAY=
=lrJv
-----END PGP SIGNATURE-----

--crdzpq3rjuvmqkwv--

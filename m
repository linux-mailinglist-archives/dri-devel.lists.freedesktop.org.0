Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2D278A76F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 10:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC2410E231;
	Mon, 28 Aug 2023 08:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F3910E231;
 Mon, 28 Aug 2023 08:17:33 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D8A4D6607186;
 Mon, 28 Aug 2023 09:17:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693210651;
 bh=YqYrAuwzzT/TiXwKqKHNdIIpO6SpQrE3yd13FQS/DQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Od1IcWa9lnjarY8OMB2cqA0NK5lY9zVmXAHth5GZw3yUKa2ZdUcKAPpnj2JRTW4GK
 C3GvynFgKmsz4DD1tU4ljzBAfzzEzd5nqbZhrPG0F3a0xj257bm50dYYTU3yXdeap7
 1058D5VjVkwWH3p6uvaYSs3p65yE3AmZzMzZ3s1060l5vMPv5Ell92Ob5u+iL6T/iI
 rwaMLP+Isw3KmhZ3d+1u0yKeZdYE0V2rlGjhfexs4bwEt3arlq89NC26gQsfubkTap
 Acn5aSxrP2srk+kIJeKZx6PYipC2To0xlh6ODKymIeTeOHzGYfku07mXTWMG9WFX0u
 819lQof5x8+ZA==
Date: Mon, 28 Aug 2023 11:17:26 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping
 CRTC degamma to DC plane
Message-ID: <20230828111726.0a39b73b.pekka.paalanen@collabora.com>
In-Reply-To: <20230825142944.3jkibtz54f4utwuq@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
 <20230825142944.3jkibtz54f4utwuq@mail.igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pLf1Uv8dW0QLbmh=jdWeWBa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/pLf1Uv8dW0QLbmh=jdWeWBa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Aug 2023 13:29:44 -0100
Melissa Wen <mwen@igalia.com> wrote:

> On 08/22, Pekka Paalanen wrote:
> > On Thu, 10 Aug 2023 15:02:59 -0100
> > Melissa Wen <mwen@igalia.com> wrote:
> >  =20
> > > The next patch adds pre-blending degamma to AMD color mgmt pipeline, =
but
> > > pre-blending degamma caps (DPP) is currently in use to provide DRM CR=
TC
> > > atomic degamma or implict degamma on legacy gamma. Detach degamma usa=
ge
> > > regarging CRTC color properties to manage plane and CRTC color
> > > correction combinations.
> > >=20
> > > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > > ---
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++----=
--
> > >  1 file changed, 41 insertions(+), 18 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > > index 68e9f2c62f2e..74eb02655d96 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > > @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_c=
rtc_state *crtc)
> > >  	return 0;
> > >  }
> > > =20
> > > -/**
> > > - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to D=
C plane.
> > > - * @crtc: amdgpu_dm crtc state
> > > - * @dc_plane_state: target DC surface
> > > - *
> > > - * Update the underlying dc_stream_state's input transfer function (=
ITF) in
> > > - * preparation for hardware commit. The transfer function used depen=
ds on
> > > - * the preparation done on the stream for color management.
> > > - *
> > > - * Returns:
> > > - * 0 on success. -ENOMEM if mem allocation fails.
> > > - */
> > > -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> > > -				      struct dc_plane_state *dc_plane_state)
> > > +static int
> > > +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> > > +			     struct dc_plane_state *dc_plane_state)
> > >  {
> > >  	const struct drm_color_lut *degamma_lut;
> > >  	enum dc_transfer_func_predefined tf =3D TRANSFER_FUNCTION_SRGB;
> > > @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_c=
rtc_state *crtc,
> > >  						 &degamma_size);
> > >  		ASSERT(degamma_size =3D=3D MAX_COLOR_LUT_ENTRIES);
> > > =20
> > > -		dc_plane_state->in_transfer_func->type =3D
> > > -			TF_TYPE_DISTRIBUTED_POINTS;
> > > +		dc_plane_state->in_transfer_func->type =3D TF_TYPE_DISTRIBUTED_POI=
NTS;
> > > =20
> > >  		/*
> > >  		 * This case isn't fully correct, but also fairly
> > > @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_c=
rtc_state *crtc,
> > >  				   degamma_lut, degamma_size);
> > >  		if (r)
> > >  			return r;
> > > -	} else if (crtc->cm_is_degamma_srgb) {
> > > +	} else {
> > >  		/*
> > >  		 * For legacy gamma support we need the regamma input
> > >  		 * in linear space. Assume that the input is sRGB.
> > > @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_=
crtc_state *crtc,
> > > =20
> > >  		if (tf !=3D TRANSFER_FUNCTION_SRGB &&
> > >  		    !mod_color_calculate_degamma_params(NULL,
> > > -			    dc_plane_state->in_transfer_func, NULL, false))
> > > +							dc_plane_state->in_transfer_func,
> > > +							NULL, false))
> > >  			return -ENOMEM;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to D=
C plane.
> > > + * @crtc: amdgpu_dm crtc state
> > > + * @dc_plane_state: target DC surface
> > > + *
> > > + * Update the underlying dc_stream_state's input transfer function (=
ITF) in
> > > + * preparation for hardware commit. The transfer function used depen=
ds on
> > > + * the preparation done on the stream for color management.
> > > + *
> > > + * Returns:
> > > + * 0 on success. -ENOMEM if mem allocation fails.
> > > + */
> > > +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> > > +				      struct dc_plane_state *dc_plane_state)
> > > +{
> > > +	bool has_crtc_cm_degamma;
> > > +	int ret;
> > > +
> > > +	has_crtc_cm_degamma =3D (crtc->cm_has_degamma || crtc->cm_is_degamm=
a_srgb);
> > > +	if (has_crtc_cm_degamma){
> > > +		/* AMD HW doesn't have post-blending degamma caps. When DRM
> > > +		 * CRTC atomic degamma is set, we maps it to DPP degamma block
> > > +		 * (pre-blending) or, on legacy gamma, we use DPP degamma to
> > > +		 * linearize (implicit degamma) from sRGB/BT709 according to
> > > +		 * the input space. =20
> >=20
> > Uhh, you can't just move degamma before blending if KMS userspace
> > wants it after blending. That would be incorrect behaviour. If you
> > can't implement it correctly, reject it.
> >=20
> > I hope that magical unexpected linearization is not done with atomic,
> > either.
> >=20
> > Or maybe this is all a lost cause, and only the new color-op pipeline
> > UAPI will actually work across drivers. =20
>=20
> I agree that crtc degamma is an optional property and should be not
> exposed if not available.  I did something in this line for DCE that has
> no degamma block[1].  Then, AMD DDX driver stopped to advertise atomic
> API for DCE, that was not correct too[2].

Did AMD go through all the trouble of making their Xorg DDX use KMS
atomic, even after the kernel took it away from X due to modesetting
DDX screwing it up? I'm surprised, what did that achieve?

I saw that between 5.15 and 6.1 amdgpu stopped advertising CRTC DEGAMMA
on my card, which seems like the right thing to do if there is no
hardware for it.

> But I see it as a lost cause that will only be fixed in a new generic
> color API. I don't think we should change it using the current DRM CRTC
> API with driver-specific props.
>=20
> [1] https://lore.kernel.org/amd-gfx/20221103184500.14450-1-mwen@igalia.co=
m/
> [2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/issues=
/67

Oh well.

Is the old CRTC GAMMA property still "safe" to use in that it is
definitely always after blending?


Thanks,
pq

> > > +		 */
> > > +		ret =3D map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
> > > +		if (ret)
> > > +			return ret;
> > >  	} else {
> > >  		/* ...Otherwise we can just bypass the DGM block. */
> > >  		dc_plane_state->in_transfer_func->type =3D TF_TYPE_BYPASS; =20
> >  =20


--Sig_/pLf1Uv8dW0QLbmh=jdWeWBa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTsWBYACgkQI1/ltBGq
qqdGJRAAg+587i/qQ3Naex4GVhDCtSsCn/2pHDErO/ul/7YC6Rh7PK+WXymFnnJh
IMz9UNg23/4pl7+/Rv+wAZjECInT5NoJtBRjpQgmW5+nxUNoS8IwpYj9xJp8vDk5
r7oem+9fkzEy+cqeKlGPSLOj8cR3Cq00KSm+UzQju1iWwvK1/ZFEzavSfJroDTvW
TfWLI9WssaTrNJSPGhllNs6oGneYIXBw9BaVnNO1oJqL0R/clNH2GH7Y9BDh8uQG
8wP/kXrpbBIWkHQQpuYm1FhqCETk3mi556HgnRZRPA0OWHGil8fyUQiqrmTBys6G
sEGuuC/TdjqxOvvigaMbVM4j1etNOIXOxFKKgrDZYJTfjSdvdpH5d7S7dAiRLhDY
6QVTUHYv2Nwr21dff3BkMddhSUfJycZhw0No7QsYekvkItqMklUGLRqUcesnNAMU
2U0WvQC2R2eXzYS6XsiU1cD8imH99Hn1oLEFtinisXwI9doss9KM12xLGtJ1N+cu
ZHIpTvosisNlraD1rfNoJTCG3cKY/Qs6aCcM4LJFSnRnVVLrJbd/dpMTUN02H9SF
LpanZRNzAT7gFeJ0RsQorvWo4KuosV16XRrQa5ASWH9YYiThu2tp9EXMrktUjbJK
iLRW6rC0tg3WhkcO98kKIHqQFml2xuEKcg3RINMF4gJvcX/LWdE=
=WhQ9
-----END PGP SIGNATURE-----

--Sig_/pLf1Uv8dW0QLbmh=jdWeWBa--

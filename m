Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D933743718
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 10:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C1410E206;
	Fri, 30 Jun 2023 08:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E81610E224;
 Fri, 30 Jun 2023 08:27:14 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b6a1fe5845so24418321fa.3; 
 Fri, 30 Jun 2023 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688113633; x=1690705633;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uRq397yy2wmcmR9HiWZwTeqw28512mp8PvQhObBNv3Q=;
 b=YBpDxTQBZpmY7Z+kFROgtuDo8+avtn4S+Y833FAxBJxkzFZyq8rEntGl9tzcRn0ha1
 NcXS33YLJpOJmuYhHXNJhB38SIgxTaBCCMoYK+TpuOcZfV7PIdPRdP4BrU9Ld006mG0d
 8eHt+iWlinxMFvPvt1s5mBFlICYVVkJrJF3fcSPtr3XTkaIC5h90y4t96VsEcVAF1XeU
 KIz8kzJoVGnPBBwolblvM3++lKT57nzFPu8CPjRKivY4XI41/E+uwKIaBLYvKz9W+mPJ
 g4neyEfu9Kqvy0Y7i/n+2lyzpX+mpM279js1eEgsaSZFRvY9uP/gHHT3Aar46DCKxh0a
 f3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688113633; x=1690705633;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uRq397yy2wmcmR9HiWZwTeqw28512mp8PvQhObBNv3Q=;
 b=LSu+RUQyIc7yE+gJ0itdhE5KDGIY89D206orNpbx1//T7oQnnxPP1GyEku+u0W+3hp
 w/NU25M716yEyO0aUf8fiQg9XwFLMtwuoTofmxwkEQjgCt78IRP7bLlWZLVbeg9HWubp
 qkPT3PYNdV/zOZV1rJXjgd5X/tJMFnnENLiEYaJgnv46QB4ox+DtzUvZCbxp/NU4RwBW
 FWxWPmZcU614kG+p3yeOsaXhKM9fqNdU1v8oGh0XxYzMEtyOoVkP91vc5chMzuahrm8q
 A+GuqipBIN7RgqLug7rvsfhDskDrxW/nzTQDnOqkVFJC5XsTA3ClUlEnbcQZkIDEfR4A
 hdlQ==
X-Gm-Message-State: ABy/qLZJf8xNUQyVLAX25MsG5qcIcZiNqX/rWvbtDxo5+FG0FFyRLKyM
 OpPhHKdX87H7ebVMmWPRSI4=
X-Google-Smtp-Source: APBJJlEsV3irr8GTIeJWblnm60MiAHMMbpZX2gYsfDtln/oKhFAtgbqE3nZChzHnvY0w7Yh1F5snyA==
X-Received: by 2002:a05:651c:218:b0:2b6:d613:2147 with SMTP id
 y24-20020a05651c021800b002b6d6132147mr413054ljn.50.1688113632666; 
 Fri, 30 Jun 2023 01:27:12 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p25-20020a2ea419000000b002b6bf924aeesm1054136ljn.31.2023.06.30.01.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 01:27:12 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:27:08 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v4 2/7] drm: Introduce pixel_source DRM plane property
Message-ID: <20230630112708.4d3a08a7@eldfell>
In-Reply-To: <6e3eec49-f798-ff91-8b4d-417d31089296@linaro.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-2-f4ec0caa742d@quicinc.com>
 <6e3eec49-f798-ff91-8b4d-417d31089296@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wsBnEBv18phX6EZRDj7SitK";
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/wsBnEBv18phX6EZRDj7SitK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Jun 2023 03:42:28 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On 30/06/2023 03:25, Jessica Zhang wrote:
> > Add support for pixel_source property to drm_plane and related
> > documentation.
> >=20
> > This enum property will allow user to specify a pixel source for the
> > plane. Possible pixel sources will be defined in the
> > drm_plane_pixel_source enum.
> >=20
> > The current possible pixel sources are DRM_PLANE_PIXEL_SOURCE_FB and
> > DRM_PLANE_PIXEL_SOURCE_COLOR. The default value is *_SOURCE_FB. =20
>=20
> I think, this should come before the solid fill property addition. First=
=20
> you tell that there is a possibility to define other pixel sources, then=
=20
> additional sources are defined.

Hi,

that would be logical indeed.

> >=20
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >   drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
> >   drivers/gpu/drm/drm_blend.c               | 81 ++++++++++++++++++++++=
+++++++++
> >   include/drm/drm_blend.h                   |  2 +
> >   include/drm/drm_plane.h                   | 21 ++++++++
> >   5 files changed, 109 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index fe14be2bd2b2..86fb876efbe6 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -252,6 +252,7 @@ void __drm_atomic_helper_plane_state_reset(struct d=
rm_plane_state *plane_state,
> >  =20
> >   	plane_state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
> >   	plane_state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
> > +	plane_state->pixel_source =3D DRM_PLANE_PIXEL_SOURCE_FB;
> >  =20
> >   	if (plane_state->solid_fill_blob) {
> >   		drm_property_blob_put(plane_state->solid_fill_blob);
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index a28b4ee79444..6e59c21af66b 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -596,6 +596,8 @@ static int drm_atomic_plane_set_property(struct drm=
_plane *plane,
> >   		drm_property_blob_put(solid_fill);
> >  =20
> >   		return ret;
> > +	} else if (property =3D=3D plane->pixel_source_property) {
> > +		state->pixel_source =3D val;
> >   	} else if (property =3D=3D plane->alpha_property) {
> >   		state->alpha =3D val;
> >   	} else if (property =3D=3D plane->blend_mode_property) { =20
>=20
> I think, it was pointed out in the discussion that drm_mode_setplane()=20
> (a pre-atomic IOCTL to turn the plane on and off) should also reset=20
> pixel_source to FB.
>=20
> > @@ -671,6 +673,8 @@ drm_atomic_plane_get_property(struct drm_plane *pla=
ne,
> >   	} else if (property =3D=3D plane->solid_fill_property) {
> >   		*val =3D state->solid_fill_blob ?
> >   			state->solid_fill_blob->base.id : 0;
> > +	} else if (property =3D=3D plane->pixel_source_property) {
> > +		*val =3D state->pixel_source;
> >   	} else if (property =3D=3D plane->alpha_property) {
> >   		*val =3D state->alpha;
> >   	} else if (property =3D=3D plane->blend_mode_property) {
> > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> > index 38c3c5d6453a..8c100a957ee2 100644
> > --- a/drivers/gpu/drm/drm_blend.c
> > +++ b/drivers/gpu/drm/drm_blend.c
> > @@ -189,6 +189,18 @@
> >    *	solid_fill is set up with drm_plane_create_solid_fill_property(). =
It
> >    *	contains pixel data that drivers can use to fill a plane.
> >    *
> > + * pixel_source:
> > + *	pixel_source is set up with drm_plane_create_pixel_source_property(=
).
> > + *	It is used to toggle the source of pixel data for the plane.

Other sources than the selected one are ignored?

> > + *
> > + *	Possible values:

Wouldn't hurt to explicitly mention here that this is an enum.

> > + *
> > + *	"FB":
> > + *		Framebuffer source
> > + *
> > + *	"COLOR":
> > + *		solid_fill source

I think these two should be more explicit. Framebuffer source is the
usual source from the property "FB_ID". Solid fill source comes from
the property "solid_fill".

Why "COLOR" and not, say, "SOLID_FILL"?

> > + *
> >    * Note that all the property extensions described here apply either =
to the
> >    * plane or the CRTC (e.g. for the background color, which currently =
is not
> >    * exposed and assumed to be black).
> > @@ -648,3 +660,72 @@ int drm_plane_create_solid_fill_property(struct dr=
m_plane *plane)
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> > +
> > +/**
> > + * drm_plane_create_pixel_source_property - create a new pixel source =
property
> > + * @plane: drm plane
> > + * @supported_sources: bitmask of supported pixel_sources for the driv=
er (NOT
> > + *                     including DRM_PLANE_PIXEL_SOURCE_FB, as it will=
 be supported
> > + *                     by default). =20
>=20
> I'd say this is too strong. I'd suggest either renaming this to=20
> extra_sources (mentioning that FB is enabled for all the planes) or=20
> allowing any source bitmask (mentioning that FB should be enabled by the=
=20
> caller, unless there is a good reason not to do so).

Right. I don't see any problem with having planes of type OVERLAY that
support only solid_fill and no FB. Planes of type PRIMARY and CURSOR I
would expect to always support at least FB.

Atomic userspace is prepared to have an OVERLAY plane fail for any
arbitrary reason. Legacy userspace probably should not ever see a plane
that does not support FB.

> > + *
> > + * This creates a new property describing the current source of pixel =
data for the
> > + * plane.
> > + *
> > + * The property is exposed to userspace as an enumeration property cal=
led
> > + * "pixel_source" and has the following enumeration values:
> > + *
> > + * "FB":
> > + *	Framebuffer pixel source
> > + *
> > + * "COLOR":
> > + *	Solid fill color pixel source
> > + *
> > + * Returns:
> > + * Zero on success, negative errno on failure.
> > + */
> > +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> > +					   unsigned int supported_sources)
> > +{
> > +	struct drm_device *dev =3D plane->dev;
> > +	struct drm_property *prop;
> > +	const struct drm_prop_enum_list enum_list[] =3D {
> > +		{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
> > +		{ DRM_PLANE_PIXEL_SOURCE_COLOR, "COLOR" },
> > +	};
> > +	unsigned int valid_source_mask =3D BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
> > +				       BIT(DRM_PLANE_PIXEL_SOURCE_COLOR); =20
>=20
>=20
> static const?
>=20
> > +	int i;
> > +
> > +	/* FB is supported by default */
> > +	supported_sources |=3D BIT(DRM_PLANE_PIXEL_SOURCE_FB);
> > +
> > +	if (WARN_ON(supported_sources & ~valid_source_mask))
> > +		return -EINVAL;
> > +
> > +	prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM, "pixel_source",

Shouldn't this be an atomic prop?


> > +			hweight32(supported_sources));
> > +
> > +	if (!prop)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(enum_list); i++) {
> > +		int ret;
> > +
> > +		if (!(BIT(enum_list[i].type) & supported_sources)) =20
>=20
> test_bit?
>=20
> > +			continue;
> > +
> > +		ret =3D drm_property_add_enum(prop, enum_list[i].type, enum_list[i].=
name);
> > + =20
>=20
> No need for an empty line in such cases. Please drop it.
>=20
> > +		if (ret) {
> > +			drm_property_destroy(dev, prop);
> > +
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	drm_object_attach_property(&plane->base, prop, DRM_PLANE_PIXEL_SOURCE=
_FB);
> > +	plane->pixel_source_property =3D prop;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_plane_create_pixel_source_property);
> > diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> > index 0338a860b9c8..31af7cfa5b1b 100644
> > --- a/include/drm/drm_blend.h
> > +++ b/include/drm/drm_blend.h
> > @@ -59,4 +59,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
> >   int drm_plane_create_blend_mode_property(struct drm_plane *plane,
> >   					 unsigned int supported_modes);
> >   int drm_plane_create_solid_fill_property(struct drm_plane *plane);
> > +int drm_plane_create_pixel_source_property(struct drm_plane *plane,
> > +					   unsigned int supported_sources);
> >   #endif
> > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > index f6ab313cb83e..73fb6cf8a5d9 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -59,6 +59,12 @@ struct drm_solid_fill {
> >   	uint32_t b;
> >   };
> >  =20
> > +enum drm_plane_pixel_source {
> > +	DRM_PLANE_PIXEL_SOURCE_FB,
> > +	DRM_PLANE_PIXEL_SOURCE_COLOR,
> > +	DRM_PLANE_PIXEL_SOURCE_MAX
> > +};

Just to be very clear that I'm not confusing you with my comment about
UAPI headers in the previous patch, this enum is already in a good
place. It does not belong in a UAPI header, because userspace
recognises enum values by the name string.


Thanks,
pq

> > +
> >   /**
> >    * struct drm_plane_state - mutable plane state
> >    *
> > @@ -152,6 +158,14 @@ struct drm_plane_state {
> >   	 */
> >   	struct drm_solid_fill solid_fill;
> >  =20
> > +	/*
> > +	 * @pixel_source:
> > +	 *
> > +	 * Source of pixel information for the plane. See
> > +	 * drm_plane_create_pixel_source_property() for more details.
> > +	 */
> > +	enum drm_plane_pixel_source pixel_source;
> > +
> >   	/**
> >   	 * @alpha:
> >   	 * Opacity of the plane with 0 as completely transparent and 0xffff =
as
> > @@ -742,6 +756,13 @@ struct drm_plane {
> >   	 */
> >   	struct drm_property *solid_fill_property;
> >  =20
> > +	/*
> > +	 * @pixel_source_property:
> > +	 * Optional pixel_source property for this plane. See
> > +	 * drm_plane_create_pixel_source_property().
> > +	 */
> > +	struct drm_property *pixel_source_property;
> > +
> >   	/**
> >   	 * @alpha_property:
> >   	 * Optional alpha property for this plane. See
> >  =20
>=20


--Sig_/wsBnEBv18phX6EZRDj7SitK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSekdwACgkQI1/ltBGq
qqcH2BAArv53WqfSF+WPxKDMFn/qvS3KgcdgICMHV3zZ8pq6OYzRYP81/uLzDyKn
tbsSTXRDD8nvHs7Llpa5z3D+BG/FTv0RgL44JDt2oAZyPH+Canlh09KbMm40nEFT
D2TEQ92K1oHPqKLaG8aG+1DEhYHuY7uLsvVDZFeriIj63dRfMNMMtpwYnFd2pVtF
DmNzvjft9cFj3i7Ebe8xfftkOd/B1+votrSG0x3BM6SBGgIu+lGdq3aNQgieJLZu
ObMyoUbEo6+jxVUg/wcrQnr6zQbGxVj3xgIm0n/nBGEpqyOWc4iuOKwCtsGpNehd
tzagwEoGrxplZ99RGdug2wP5w6nHffh7c6tpsKQ2AltIbS0b92NFZeG0aU6sxAfd
OzTssn86mi1uXwDcUPilmyXQc/qKTHEuj+hnIKwo1Q0aMfXiGGax21KmSF3Gfifs
/7oizoaUIsHPYPsTZBYZft3j1Mm38gan0ZPdnYCWbZNTEWYJEhUa0VYOmnz4LyBy
CNdKXYTRbHn+l8n6BlBosB8SeDdpw42ym9Bhdps61yXlFfDTTUTAW8B97aG4IZ3D
v/0MSAsT+q3R3URsw0xOG149KET4cT1yUb+9wCBIab0JXmmlAv3KjCZebzEV4wKD
vF3Yp/rJdcmaqOlwwRsv6Cc1Sdk4kM8ScPJJFWC00zC0u+odsPw=
=+nBf
-----END PGP SIGNATURE-----

--Sig_/wsBnEBv18phX6EZRDj7SitK--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F4D7409EB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 09:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3719410E0C7;
	Wed, 28 Jun 2023 07:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E26310E0C7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 07:54:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6afc1ceffso26285191fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687938869; x=1690530869;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hSKNRIRoOj0VLEWb64EXpNVxSB9uJGHkfFu8D008Y7w=;
 b=A5QWM6XOsN8cUpqmX6XEkHR3uexbmchC2ZW8PKbqVG/QRm5dTOyNRxbhFqVUXhf7qt
 BCZ3Kh6GamPeQymnkfjqYw3e7cVqL90YlqfJe2h2q4YYp9FFyODPKQ4ldG4CFv/4qPmo
 8AxAod+FhZcr0XRENaSDKWoW6oKKmqrwahaiTonTOzPrLw/YffxKB2weOFr+EoZ+5BW8
 9hz+H+zmM0gGG2CNvaeU+ScLc8owsPEgPQO7HKd+CLCwAE7VwmMPBnwLYxN3jsXjyhkK
 ZVKTeDwqmotf66vXaVLdIIqYmtfP95uhXJn7CReAJuDsfqSqukxweg/ThljQEXfdGH1x
 CNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687938869; x=1690530869;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hSKNRIRoOj0VLEWb64EXpNVxSB9uJGHkfFu8D008Y7w=;
 b=ipK0NEobI+osv15sZYSfmdcCjwlwKhCtqawCwHMECsuOe7Yb7aphbFsIF8yDlLUuZW
 5CXoYmbltf9dvozFS+U8DU1mK2jw8TDY+D/SEzWsOwQDp/wWyfsobxLTdTNZkDMTpMc5
 WbWO7U1qMI74iaItJNfSjNjfR4h/cjrAJYo18wDafa9Q+0pf0Aw/wr/ZM8a2dmy1fRZm
 ZvfPDBwXTXETcqvJJwYGX9kywZMASSfKX0g22fSbvpsaB1NZ7scCUaedCWGH0qOisrox
 jRDQUx9DltHzao/3VJ2NKbie4I+7lC5ncVWRWBC5YnMVPWgolCMdNO/q3Dtsv6pVBah0
 cdVg==
X-Gm-Message-State: AC+VfDyMpfKVwM9YLGhsxRHu105p6vLf4FeDa2XMtMkXRhRbcEDL/G1O
 2bEZuiuDTrhThWZj+wAPHsM=
X-Google-Smtp-Source: ACHHUZ6MvRol3k472kPDEUwYjL11T8s0StIyKhqfvr9Gw0HAtG38LRdIWPt7e8U1LU6RVOZweL7C+A==
X-Received: by 2002:a2e:8057:0:b0:2b5:7a97:d517 with SMTP id
 p23-20020a2e8057000000b002b57a97d517mr11222242ljg.46.1687938868677; 
 Wed, 28 Jun 2023 00:54:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y12-20020a05651c020c00b002b69dff891asm1682557ljn.137.2023.06.28.00.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 00:54:28 -0700 (PDT)
Date: Wed, 28 Jun 2023 10:54:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230628105424.11eb45ec@eldfell>
In-Reply-To: <20230628104106.30360b55@eldfell>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
 <20230628104106.30360b55@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P9IJ7xjfvL/y0HA3Ojm2VM8";
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, banackm@vmware.com, javierm@redhat.com,
 krastevm@vmware.com, dri-devel@lists.freedesktop.org, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/P9IJ7xjfvL/y0HA3Ojm2VM8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Jun 2023 10:41:06 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Wed, 28 Jun 2023 01:21:27 -0400
> Zack Rusin <zack@kde.org> wrote:
>=20
> > From: Zack Rusin <zackr@vmware.com>
> >=20
> > Atomic modesetting code lacked support for specifying mouse cursor
> > hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
> > the hotspot but the functionality was not implemented in the new atomic
> > paths.
> >=20
> > Due to the lack of hotspots in the atomic paths userspace compositors
> > completely disable atomic modesetting for drivers that require it (i.e.
> > all paravirtualized drivers).
> >=20
> > This change adds hotspot properties to the atomic codepaths throughtout
> > the DRM core and will allow enabling atomic modesetting for virtualized
> > drivers in the userspace.
> >=20
> > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com> =20
>=20
> Hi Zack,
>=20
> I still do not see any UAPI docs for the new properties in this patch?

If you are wondering what there could be to write about, maybe this can
give a good mindset:

Let's assume that I am a Wayland compositor developer who has never used
"hotspots" with KMS UAPI before. As I have never tested anything in a
VM, I have no idea why the kernel would ever want to know about cursor
hotspots. Display hardware never does anything with that, it just puts
the cursor plane where I tell it to and composes a single image to be
sent to the sink. The virtual driver VKMS does the same. To me, a
cursor plane is just another universal plane that may have weird
stacking order, pixel format, and size limitations.

Ideally the doc for HOTSPOT_X and HOTSPOT_Y documents not only their
possible existence and allowed/expected values, but also the reasons
to have them and what they are used for, and that if the properties
are exposed they are mandatory to program in order to use the plane.


Thanks,
pq

> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
> >  drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++
> >  drivers/gpu/drm/drm_plane.c               | 50 +++++++++++++++++++++++
> >  include/drm/drm_plane.h                   | 14 +++++++
> >  4 files changed, 98 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index 784e63d70a42..54975de44a0e 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -275,6 +275,20 @@ void __drm_atomic_helper_plane_state_reset(struct =
drm_plane_state *plane_state,
> >  			plane_state->normalized_zpos =3D val;
> >  		}
> >  	}
> > +
> > +	if (plane->hotspot_x_property) {
> > +		if (!drm_object_property_get_default_value(&plane->base,
> > +							   plane->hotspot_x_property,
> > +							   &val))
> > +			plane_state->hotspot_x =3D val;
> > +	}
> > +
> > +	if (plane->hotspot_y_property) {
> > +		if (!drm_object_property_get_default_value(&plane->base,
> > +							   plane->hotspot_y_property,
> > +							   &val))
> > +			plane_state->hotspot_y =3D val;
> > +	}
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
> > =20
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index 98d3b10c08ae..07a7b3f18df2 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -593,6 +593,22 @@ static int drm_atomic_plane_set_property(struct dr=
m_plane *plane,
> >  	} else if (plane->funcs->atomic_set_property) {
> >  		return plane->funcs->atomic_set_property(plane, state,
> >  				property, val);
> > +	} else if (property =3D=3D plane->hotspot_x_property) {
> > +		if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> > +			drm_dbg_atomic(plane->dev,
> > +				       "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
> > +				       plane->base.id, plane->name, val);
> > +			return -EINVAL;
> > +		}
> > +		state->hotspot_x =3D val;
> > +	} else if (property =3D=3D plane->hotspot_y_property) {
> > +		if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> > +			drm_dbg_atomic(plane->dev,
> > +				       "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
> > +				       plane->base.id, plane->name, val);
> > +			return -EINVAL;
> > +		}
> > +		state->hotspot_y =3D val;
> >  	} else {
> >  		drm_dbg_atomic(plane->dev,
> >  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
> > @@ -653,6 +669,10 @@ drm_atomic_plane_get_property(struct drm_plane *pl=
ane,
> >  		*val =3D state->scaling_filter;
> >  	} else if (plane->funcs->atomic_get_property) {
> >  		return plane->funcs->atomic_get_property(plane, state, property, val=
);
> > +	} else if (property =3D=3D plane->hotspot_x_property) {
> > +		*val =3D state->hotspot_x;
> > +	} else if (property =3D=3D plane->hotspot_y_property) {
> > +		*val =3D state->hotspot_y;
> >  	} else {
> >  		drm_dbg_atomic(dev,
> >  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index c6bbb0c209f4..eaca367bdc7e 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -230,6 +230,47 @@ static int create_in_format_blob(struct drm_device=
 *dev, struct drm_plane *plane
> >  	return 0;
> >  }
> > =20
> > +/**
> > + * drm_plane_create_hotspot_properties - creates the mouse hotspot
> > + * properties and attaches them to the given cursor plane
> > + *
> > + * @plane: drm cursor plane
> > + *
> > + * This function enables the mouse hotspot property on a given
> > + * cursor plane.
> > + *
> > + * RETURNS:
> > + * Zero for success or -errno
> > + */
> > +static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
> > +{
> > +	struct drm_property *prop_x;
> > +	struct drm_property *prop_y;
> > +
> > +	drm_WARN_ON(plane->dev,
> > +		    !drm_core_check_feature(plane->dev,
> > +					    DRIVER_CURSOR_HOTSPOT));
> > +
> > +	prop_x =3D drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_X=
",
> > +						  INT_MIN, INT_MAX);
> > +	if (IS_ERR(prop_x))
> > +		return PTR_ERR(prop_x);
> > +
> > +	prop_y =3D drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_Y=
",
> > +						  INT_MIN, INT_MAX);
> > +	if (IS_ERR(prop_y)) {
> > +		drm_property_destroy(plane->dev, prop_x);
> > +		return PTR_ERR(prop_y);
> > +	}
> > +
> > +	drm_object_attach_property(&plane->base, prop_x, 0);
> > +	drm_object_attach_property(&plane->base, prop_y, 0);
> > +	plane->hotspot_x_property =3D prop_x;
> > +	plane->hotspot_y_property =3D prop_y;
> > +
> > +	return 0;
> > +}
> > +
> >  __printf(9, 0)
> >  static int __drm_universal_plane_init(struct drm_device *dev,
> >  				      struct drm_plane *plane,
> > @@ -348,6 +389,10 @@ static int __drm_universal_plane_init(struct drm_d=
evice *dev,
> >  		drm_object_attach_property(&plane->base, config->prop_src_w, 0);
> >  		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
> >  	}
> > +	if (drm_core_check_feature(dev, DRIVER_CURSOR_HOTSPOT) &&
> > +	    type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> > +		drm_plane_create_hotspot_properties(plane);
> > +	}
> > =20
> >  	if (format_modifier_count)
> >  		create_in_format_blob(dev, plane);
> > @@ -1067,6 +1112,11 @@ static int drm_mode_cursor_universal(struct drm_=
crtc *crtc,
> > =20
> >  			fb->hot_x =3D req->hot_x;
> >  			fb->hot_y =3D req->hot_y;
> > +
> > +			if (plane->hotspot_x_property && plane->state)
> > +				plane->state->hotspot_x =3D req->hot_x;
> > +			if (plane->hotspot_y_property && plane->state)
> > +				plane->state->hotspot_y =3D req->hot_y;
> >  		} else {
> >  			fb =3D NULL;
> >  		}
> > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > index 51291983ea44..74e62f90a1ad 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -116,6 +116,10 @@ struct drm_plane_state {
> >  	/** @src_h: height of visible portion of plane (in 16.16) */
> >  	uint32_t src_h, src_w;
> > =20
> > +	/** @hotspot_x: x offset to mouse cursor hotspot */
> > +	/** @hotspot_y: y offset to mouse cursor hotspot */
> > +	int32_t hotspot_x, hotspot_y;
> > +
> >  	/**
> >  	 * @alpha:
> >  	 * Opacity of the plane with 0 as completely transparent and 0xffff as
> > @@ -748,6 +752,16 @@ struct drm_plane {
> >  	 * scaling.
> >  	 */
> >  	struct drm_property *scaling_filter_property;
> > +
> > +	/**
> > +	 * @hotspot_x_property: property to set mouse hotspot x offset.
> > +	 */
> > +	struct drm_property *hotspot_x_property;
> > +
> > +	/**
> > +	 * @hotspot_y_property: property to set mouse hotspot y offset.
> > +	 */
> > +	struct drm_property *hotspot_y_property;
> >  };
> > =20
> >  #define obj_to_plane(x) container_of(x, struct drm_plane, base) =20
>=20


--Sig_/P9IJ7xjfvL/y0HA3Ojm2VM8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSb5zAACgkQI1/ltBGq
qqd06g/+O8VHyR4oN1GvlDGmiwJxbqco+8gju8OSOdN10kbeiVJCP1Sl1EtVMWAL
8vA52RyDQsmvpnbEJdMdHJ9XS11sUPAQ4L1Aqe9H8EtpyW6ejqYIE8LSdVIzCQBM
Us/CKmVB/vpqNAsKwMxkMXZ2O3GBt93adjKEh43x1uZZEQ1ZuCTt8JCuf9qy5vy5
T7VTr6VHJbhIlhwxQ+mpK4MaWKg1IOgi4ubSfs6N/8OM8jkas0SskITRVJUpnjYh
rL6oCjOyHFPuryhaqs/ctmU2eAqdvT7rwnAZwQVtlp1DzGrOUZdlmXexvFiqU4cF
Z5O42SWJ1If4rKIwpK+dLrOSG0tLLBnarNz4za47kiLR0zKqrBsBaKdP6JMINCJO
2Tji3kgJgxh2VNJmNNcge3uQTIxyf1+Oj0fq0HodmgTJ8nFD3sWBTCAuvMuFGd3d
pT7XcjH7jHpna2tuh8VqOyKH6+0jItft5q0kfXzUxET+9sy3EX6piQRqlcrTopoX
efskYAxvUQotO7W5MnnkrDBfE/G/9CMH0BzD1C12wdgPT032IQdbznq8fdw1Erx9
hoHXM49oNUp5mDIJd7+DjcEgkrLQUWvoZaVlwhq0LH+nf5JQMykWMnlDHvq7Y13j
Hlk+W7aPebIKjTPK3Z95axj7nP7gxdJygShKjOGYoqccxptfrOE=
=uvpA
-----END PGP SIGNATURE-----

--Sig_/P9IJ7xjfvL/y0HA3Ojm2VM8--

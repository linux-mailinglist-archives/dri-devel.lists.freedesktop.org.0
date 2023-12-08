Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AE80A2E7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 13:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E206F10E29F;
	Fri,  8 Dec 2023 12:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0779110E29D;
 Fri,  8 Dec 2023 12:15:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50c222a022dso1663675e87.1; 
 Fri, 08 Dec 2023 04:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702037728; x=1702642528; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XgLb+UN/qO9m7WUqJSdsqIW+RpQ5k7tBSN5DF8qu4A0=;
 b=RBhwwEv0a59MZsOWqgBjhr38XKLpEWPlpbTVfeR7DnMAnX2+bT9SrADLcX+NTCL9dS
 DclV1pb5I/ZZ77D4rq6rh4sJH7E4Ha1aWNhWv9E6Tg0GiFzYDNN9dkQJ8VAkpuRDX4sV
 flCjgkr8N7IDle7iMI5GH0fGJMQMQw9Uo2BDm4vrxIssnaliwPymS9sQWbCU+Z6PQm63
 3WcY9Atl7KAP3uhjDfmafehqFMIOBd8bn7tnI4CMP/51g9ehlK4Ce+FQY4/AFP/tOFOC
 jvIudnMggCDLsYzAKv2pzTU+EuX1r99V3EoeAYdinyWGcoV5gXeCS80zuz5fDjMH2Sg+
 8uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702037728; x=1702642528;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XgLb+UN/qO9m7WUqJSdsqIW+RpQ5k7tBSN5DF8qu4A0=;
 b=TfcamzqlumCP3uVnqHhawRXCDtil5HR0fDZKTlQVMcGA4SanpxsBi90eZ4t4JxHuuD
 1yxxQkh0ZVz49AYgoCsXECSRjchwh9maSYYPitKELfW5LE/GR48vt/wqNOnIKhHBpBO7
 8mFgJyfA6ASw6xA3rcOhus1EZIqbiSXOGQCdirilHmW/MincJJsQW0il9F74hrrf0kVk
 F+6x7ixHZv/ObSBc5OT48ucIC3HvjKI+Abx3isS9xpGoEskpRBpSO1/mMUDfeXxbJvhQ
 6Gbv0xmRwiQGDPjVJnK6BXYjPWlsIiOrh1PVAoW13IxOGGBYwL6Yn6zpU1WKRgRdDMg0
 88jQ==
X-Gm-Message-State: AOJu0YzxkFs5Y12APLUuc3YLkQbFFS9n26z67mt2Q2yNr+WAJ9oARclT
 fIqYAczbnqZWt+2wyKM3mwM=
X-Google-Smtp-Source: AGHT+IFnFo1wyGOwRVS4e7EkWQX2VSj87TyuwvPcHoPI4ARbWINGgMasWK5TINdR+mbsEUd885Cg6w==
X-Received: by 2002:ac2:4a82:0:b0:50b:e3ee:5433 with SMTP id
 l2-20020ac24a82000000b0050be3ee5433mr2072388lfp.24.1702037727718; 
 Fri, 08 Dec 2023 04:15:27 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u4-20020a05651206c400b005009c4ba3f0sm199027lff.72.2023.12.08.04.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 04:15:27 -0800 (PST)
Date: Fri, 8 Dec 2023 14:15:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 15/23] drm/vkms: Add enumerated 1D curve colorop
Message-ID: <20231208141523.58746f60@eldfell>
In-Reply-To: <20231108163647.106853-16-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-16-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rc.S7FQd3ktxhqoBqW79Mzk";
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/rc.S7FQd3ktxhqoBqW79Mzk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:34 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This patch introduces a VKMS color pipeline that includes two
> drm_colorops for named transfer functions. For now the only ones
> supported are sRGB EOTF, sRGB Inverse EOTF, and a Linear TF.
> We will expand this in the future but I don't want to do so
> without accompanying IGT tests.
>=20
> We introduce a new vkms_luts.c file that hard-codes sRGB EOTF,
> sRGB Inverse EOTF, and a linear EOTF LUT. These have been
> generated with 256 entries each as IGT is currently testing
> only 8 bpc surfaces. We will likely need higher precision
> but I'm reluctant to make that change without clear indication
> that we need it. We'll revisit and, if necessary, regenerate
> the LUTs when we have IGT tests for higher precision buffers.

VKMS could just implement the sRGB TF formula rather than an opaque
array of numbers that supposedly computes the same'ish.

Why is even the identity curve (which you call linear) encoded as a LUT?

> v2:
>  - Add commit description
>  - Fix sRGB EOTF LUT definition
>  - Add linear and sRGB inverse EOTF LUTs
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/Makefile        |   4 +-
>  drivers/gpu/drm/vkms/vkms_colorop.c  |  85 +++
>  drivers/gpu/drm/vkms/vkms_composer.c |  45 ++
>  drivers/gpu/drm/vkms/vkms_drv.h      |   4 +
>  drivers/gpu/drm/vkms/vkms_luts.c     | 802 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_luts.h     |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
>  7 files changed, 953 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>=20
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 1b28a6a32948..c38455c46be4 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -6,6 +6,8 @@ vkms-y :=3D \
>  	vkms_formats.o \
>  	vkms_crtc.o \
>  	vkms_composer.o \
> -	vkms_writeback.o
> +	vkms_writeback.o \
> +	vkms_colorop.o \
> +	vkms_luts.o
> =20
>  obj-$(CONFIG_DRM_VKMS) +=3D vkms.o
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/v=
kms_colorop.c
> new file mode 100644
> index 000000000000..9a26b9fdc4a2
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <linux/slab.h>
> +#include <drm/drm_colorop.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_property.h>
> +#include <drm/drm_plane.h>
> +
> +#define MAX_COLOR_PIPELINES 5
> +
> +const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct dr=
m_prop_enum_list *list)
> +{
> +
> +	struct drm_colorop *op, *prev_op;
> +	struct drm_device *dev =3D plane->dev;
> +	int ret;
> +
> +	/* 1st op: 1d curve */
> +	op =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret =3D drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
> +	if (ret)
> +		return ret;
> +
> +	list->type =3D op->base.id;
> +	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);

This is the string name for the pipeline (enum value).

I don't think including the ID in the name is good, because the ID
might be different on every load of the driver. IIRC you said userspace
is ok to hardcode the pipeline name and look for it, instead of doing
the discovery.

> +
> +	prev_op =3D op;
> +
> +	/* 2nd op: 1d curve */
> +	op =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret =3D drm_colorop_init(dev, op, plane, DRM_COLOROP_1D_CURVE);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, op);
> +
> +	return 0;
> +}
> +
> +int vkms_initialize_colorops(struct drm_plane *plane)
> +{
> +	struct drm_device *dev =3D plane->dev;
> +	struct drm_property *prop;
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	int len =3D 0;
> +	int ret;
> +
> +	/* Add "Bypass" (i.e. NULL) pipeline */
> +	pipelines[len].type =3D 0;
> +	pipelines[len].name =3D "Bypass";
> +	len++;

Should there be a helper to replace the drm_property_create_enum() call
below that would always add "Bypass"?

Maybe that would push driver authors towards always supporting bypass
if at all possible.

It could also be called "Identity" pipeline, or is that too strict? I
wonder what happens with an YUV FB.

> +
> +	/* Add pipeline consisting of transfer functions */
> +	ret =3D vkms_initialize_tf_pipeline(plane, &(pipelines[len]));
> +	if (ret)
> +		return ret;
> +	len++;
> +
> +	/* Create COLOR_PIPELINE property and attach */
> +	prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +					"COLOR_PIPELINE",
> +					pipelines, len);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	plane->color_pipeline_property =3D prop;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +
> +	/* TODO do we even need this? */
> +	if (plane->state)
> +		plane->state->color_pipeline =3D NULL;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 25b6b73bece8..be42756e300a 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -12,6 +12,7 @@
>  #include <linux/minmax.h>
> =20
>  #include "vkms_drv.h"
> +#include "vkms_luts.h"
> =20
>  static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
> @@ -163,6 +164,47 @@ static void apply_lut(const struct vkms_crtc_state *=
crtc_state, struct line_buff
>  	}
>  }
> =20
> +static void pre_blend_color_transform(const struct vkms_plane_state *pla=
ne_state, struct line_buffer *output_buffer)
> +{
> +	struct drm_colorop *colorop =3D plane_state->base.base.color_pipeline;
> +
> +	while (colorop) {
> +		struct drm_colorop_state *colorop_state;
> +
> +		if (!colorop)
> +			return;
> +
> +		/* TODO this is probably wrong */
> +		colorop_state =3D colorop->state;
> +
> +		if (!colorop_state)
> +			return;
> +
> +		for (size_t x =3D 0; x < output_buffer->n_pixels; x++) {
> +			struct pixel_argb_u16 *pixel =3D &output_buffer->pixels[x];
> +
> +			if (colorop->type =3D=3D DRM_COLOROP_1D_CURVE &&
> +				colorop_state->bypass =3D=3D false) {
> +				switch (colorop_state->curve_1d_type) {

FWIW, for performance reasons, it would probably be better to move all
conditionals outside of the innermost loop.

> +					case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> +						pixel->r =3D apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, =
LUT_RED);
> +						pixel->g =3D apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, =
LUT_GREEN);
> +						pixel->b =3D apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, =
LUT_BLUE);
> +						break;
> +					case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> +					default:
> +						pixel->r =3D apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_=
RED);
> +						pixel->g =3D apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_=
GREEN);
> +						pixel->b =3D apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_=
BLUE);
> +						break;
> +				}
> +			}
> +		}
> +
> +		colorop =3D colorop->next;
> +	}
> +}
> +
>  /**
>   * blend - blend the pixels from all planes and compute crc
>   * @wb: The writeback frame buffer metadata
> @@ -200,6 +242,9 @@ static void blend(struct vkms_writeback_job *wb,
>  				continue;
> =20
>  			vkms_compose_row(stage_buffer, plane[i], y_pos);
> +
> +			pre_blend_color_transform(plane[i], stage_buffer);
> +
>  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>  					    output_buffer);
>  		}
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 8f5710debb1e..2bcc24c196a2 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -170,4 +170,8 @@ void vkms_writeback_row(struct vkms_writeback_job *wb=
, const struct line_buffer
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> =20
> +/* Colorops */
> +int vkms_initialize_colorops(struct drm_plane *plane);
> +
> +
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms=
_luts.c
> new file mode 100644
> index 000000000000..6553d6d442b4
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_luts.c
> @@ -0,0 +1,802 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <drm/drm_mode.h>
> +
> +#include "vkms_drv.h"
> +#include "vkms_luts.h"
> +
> +static struct drm_color_lut linear_array[LUT_SIZE] =3D {

If I was a maintainer, I would be interested in having it documented how
these tables were generated, if not even generate them at build time.


Thanks,
pq

--Sig_/rc.S7FQd3ktxhqoBqW79Mzk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzCNsACgkQI1/ltBGq
qqc6cw/+M1pE6JymtAqZbJfcPccBLWOr0HnPdBUWbFCwPsWTurmEh5eT4IEBTxn6
cUhStrlC1bOe8qHfup9OgKwDjBVmBEf/dGIPmorWQ0FULvq/AemUHZSq5jujKq5d
E5gq8IGM0ui23C6HVYOnepOlly6yCpoKNSvyeYt4srqwWUjH0BC35QOnu2Sh1VFk
vQEMYXuVn4sWwC0CC+x/mJLbh/uownsaWz8KjZeTtMWRqqsBplQrXjV61olMMkdb
3fU80eDRfCp8p+c7PDHcNWz7eClc3V8C6xU3S+QN9SVxDBheS9/Gbr+oTQPDlbpp
tyDhgG6jicGrwy2zoGiqtgau8IS3r5kQf/YCaTTlqrAEAl0Q6omYaT7DnjsP3EHC
BjdVNI7n0eDC3oqRtRFnI2lw9jiqdOerUObcozSMDIrX4bPL7CHkDRGf48gQXQnZ
GVtHXklrW5gXz9QcZQNM5iFwxhcUG/WbHnn7JKvJUU4awTL27enzdVnF+rpXCyII
8hN8K1dtu4ZUqARQ/2prc2/HwrP528JlvrbGhOoNlwlyNFlqlma2LpWcZBuJRCuq
mDKGwKf+QAkEIDfy0LDVKSu/Dvc7F8hVvPB5c0baeEXa3lS+QqvYphTf9Nh/vu9I
K0PZH3DnM3W5mkjUO5GQWzBY6gr2K5L0YiNe8c/415z3rqDUPt4=
=g9Uf
-----END PGP SIGNATURE-----

--Sig_/rc.S7FQd3ktxhqoBqW79Mzk--

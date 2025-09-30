Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE57BABC08
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DA010E28C;
	Tue, 30 Sep 2025 07:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kbD6Zxx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF0910E28C;
 Tue, 30 Sep 2025 07:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759216075;
 bh=otM6iP4yEGo0zjb88ZOEX8uXJrV14+4cIodesPrg2IU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kbD6Zxx4Q6bzLXCAKUCGs0+FTcp52cqk0bd9sUWzJIH4vSK1zbEB8rwa5NSEK3q0h
 f9cyIyEcwaVCthzx6u2MGSSOqmPO+4P4/X3SkhIFksYGYoZuIcmWDhdOBFbR70b/Vk
 YIa6izAWLadhrH2bR22ja0c/MEQ0YkwwFmAgB4d7B38cQgy3L+1d6rbASw214h14j6
 aHG+tHmNU282xQON8oXaNVd/yVcFZaUBm+pzv4vohPu2pMRdGLQn9XAvHeX+p4LmPq
 mIE8zXwTThXqO3ZABzVjFsc0bfsTdv73sa0oh84paX0uxCAbKUoqR9Ek4okHpga0R/
 zCTI2hGU233Cg==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C6CAE17E12E5;
 Tue, 30 Sep 2025 09:07:54 +0200 (CEST)
Date: Tue, 30 Sep 2025 10:07:40 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Alex Hung <alex.hung@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>, <contact@emersion.fr>,
 <mwen@igalia.com>, <jadahl@redhat.com>, <sebastian.wick@redhat.com>,
 <shashank.sharma@amd.com>, <agoins@nvidia.com>, <joshua@froggi.es>,
 <mdaenzer@redhat.com>, <aleixpol@kde.org>, <xaver.hugl@gmail.com>,
 <victoria@system76.com>, <daniel@ffwll.ch>, <uma.shankar@intel.com>,
 <quic_naseer@quicinc.com>, <quic_cbraga@quicinc.com>,
 <quic_abhinavk@quicinc.com>, <marcan@marcan.st>, <Liviu.Dudau@arm.com>,
 <sashamcintosh@google.com>, <chaitanya.kumar.borah@intel.com>,
 <louis.chauvet@bootlin.com>, <mcanal@igalia.com>,
 <nfraprado@collabora.com>, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V11 17/47] drm/vkms: Use s32 for internal color pipeline
 precision
Message-ID: <20250930100740.40b718bb@eldfell>
In-Reply-To: <20250815035047.3319284-18-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-18-alex.hung@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MSnf5_FiI7lMAh/1C811xoZ";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/MSnf5_FiI7lMAh/1C811xoZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Aug 2025 21:50:06 -0600
Alex Hung <alex.hung@amd.com> wrote:

> From: Harry Wentland <harry.wentland@amd.com>
>=20
> Certain operations require us to preserve values below 0.0 and
> above 1.0 (0x0 and 0xffff respectively in 16 bpc unorm). One
> such operation is a BT709 encoding operation followed by its
> decoding operation, or the reverse.
>=20
> We'll use s32 values as intermediate in and outputs of our
> color operations, for the operations where it matters.
>=20
> For now this won't apply to LUT operations. We might want to
> update those to work on s32 as well, but it's unclear how
> that should work for unorm LUT definitions. We'll revisit
> that once we add LUT + CTM tests.
>=20
> In order to allow for this we'll also invert the nesting of our
> colorop processing loops. We now use the pixel iteration loop
> on the outside and the colorop iteration on the inside.

Hi Alex,

is this an out-dated paragraph in the commit message?

I don't see the patch inverting the nesting of loops.

That statement worried me, because changing the loop structures has
tanked the performance before.


Thanks,
pq

>=20
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> v7:
>  - Fix checkpatch warnings
>   - Add a commit messages
>   - Fix code styles by adding and removing spaces (new lines, tabs and so=
 on)
>=20
> v6:
>  - use clamp_val instead of manual clamping (Louis Chauvet)
>=20
> v4:
>  - Clarify that we're packing 16-bit UNORM into s32, not
>    converting values to a different representation (Pekka)
>=20
> v3:
>  - Use new colorop->next pointer
>=20
>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
>  2 files changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 0f3fcd6a5925..6630dccd68a4 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -128,7 +128,7 @@ static void apply_lut(const struct vkms_crtc_state *c=
rtc_state, struct line_buff
>  	}
>  }
> =20
> -static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_color=
op *colorop)
> +static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_color=
op *colorop)
>  {
>  	struct drm_colorop_state *colorop_state =3D colorop->state;
>  	struct drm_device *dev =3D colorop->dev;
> @@ -157,9 +157,26 @@ static void apply_colorop(struct pixel_argb_u16 *pix=
el, struct drm_colorop *colo
>  static void pre_blend_color_transform(const struct vkms_plane_state *pla=
ne_state,
>  				      struct line_buffer *output_buffer)
>  {
> +	struct pixel_argb_s32 pixel;
> +
>  	for (size_t x =3D 0; x < output_buffer->n_pixels; x++) {
>  		struct drm_colorop *colorop =3D plane_state->base.base.color_pipeline;
> =20
> +		/*
> +		 * Some operations, such as applying a BT709 encoding matrix,
> +		 * followed by a decoding matrix, require that we preserve
> +		 * values above 1.0 and below 0.0 until the end of the pipeline.
> +		 *
> +		 * Pack the 16-bit UNORM values into s32 to give us head-room to
> +		 * avoid clipping until we're at the end of the pipeline. Clip
> +		 * intentionally at the end of the pipeline before packing
> +		 * UNORM values back into u16.
> +		 */
> +		pixel.a =3D output_buffer->pixels[x].a;
> +		pixel.r =3D output_buffer->pixels[x].r;
> +		pixel.g =3D output_buffer->pixels[x].g;
> +		pixel.b =3D output_buffer->pixels[x].b;
> +
>  		while (colorop) {
>  			struct drm_colorop_state *colorop_state;
> =20
> @@ -169,10 +186,16 @@ static void pre_blend_color_transform(const struct =
vkms_plane_state *plane_state
>  				return;
> =20
>  			if (!colorop_state->bypass)
> -				apply_colorop(&output_buffer->pixels[x], colorop);
> +				apply_colorop(&pixel, colorop);
> =20
>  			colorop =3D colorop->next;
>  		}
> +
> +		/* clamp values */
> +		output_buffer->pixels[x].a =3D clamp_val(pixel.a, 0, 0xffff);
> +		output_buffer->pixels[x].r =3D clamp_val(pixel.r, 0, 0xffff);
> +		output_buffer->pixels[x].g =3D clamp_val(pixel.g, 0, 0xffff);
> +		output_buffer->pixels[x].b =3D clamp_val(pixel.b, 0, 0xffff);
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 30941714cd0f..55440ec6db52 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -45,6 +45,10 @@ struct vkms_frame_info {
>  	unsigned int rotation;
>  };
> =20
> +struct pixel_argb_s32 {
> +	s32 a, r, g, b;
> +};
> +
>  /**
>   * struct pixel_argb_u16 - Internal representation of a pixel color.
>   * @a: Alpha component value, stored in 16 bits, without padding, using


--Sig_/MSnf5_FiI7lMAh/1C811xoZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmjbgbwACgkQI1/ltBGq
qqfqpQ/9EZLOoqVMV29vKrbbVrUKvfkWh5vKI0kGwrimngoXip8jMpSJXz2ZA2Hz
dWpELMpwhZjEDGIkGlU7T7qCMbTO5fZiTFjiUpOW56SqjXq6xQU2N0FGx4bKOzSV
7z/KEMWvkU4cnHSg2mlhz2sGML08FXQNQ1Yx3cqnSScR9b8OgqEhV2knP4A70jps
4s4XW9+YDCTTtattiQD139RxOjlR7l9UngZihYXtyH7RlIqDYgzPYxt5j8nWUkug
XO5iZgyrY99E2AqY8q936MOfTyuPZu70MQqQh1Sewu6ntUqtX86+7Iw9VtmXrUoH
BLYxUwbBEupdXZlZx9y62h3Yr7/qZYmZsfsQ86FlG0Ih6n3b42ar/jlXGy5K2TOk
CAHRSZBmWZ+X98lH9OjpFs5+s90ja/o2/MvsouzxhknfKrlU4DfTBKjo4JZQ5fTC
Rq/0J0AKhEQG7ov5YAOCpAzmK2TCF284ZNBYsJRFowEXfOEfybV3VEnVmzvSaFEw
uWhBRdJGrKFFlkZxQ9cxMVqLpxD7pTIr1ebkRYx9Z6PMdRi0psOPMX3I3gDGFPg5
d9R2Sp2mAYC9t+fm1gKoTDgq9BvEB9IE2mapF8FDRtScV+/oY5VUWc4yfRJAmiIB
Bi2QaZbeBuozMJpJeZ3LHwJUv0rmlHkPlkA1aERqj9HO7oTxQF4=
=ECLi
-----END PGP SIGNATURE-----

--Sig_/MSnf5_FiI7lMAh/1C811xoZ--

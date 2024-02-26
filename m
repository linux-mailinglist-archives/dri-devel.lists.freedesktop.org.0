Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338C7867347
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A4510F0BE;
	Mon, 26 Feb 2024 11:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3UMfKxln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FD410F0BE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708947415;
 bh=QyQIi/QDa67xtFce461/0GVNnGk1ZeK4FLUm0G7lJ48=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=3UMfKxlnahzVrSnv2m08QV4BF+1jj8LMVPm6a301p00qLNVi4MX+pRz8uinSQPIBR
 DgTiI+1qtJjAWA+6M7iZ1jYUDnrrtbNJuPqU8wh+8Kl0xuPYlRWC7/0GNccTwnlgtf
 frkPhnNgrzCa7MhfMxXwBsMyFLgtL2WiXKKnm+WCXiqDt00OYrEmco6fbObZ5fbpUH
 E2nagXnQ0I7KmsrBC+cNcGzW4vf1wI/fDiAz34mwYKUZlw0ErIsjwbjDhqvN7vP+Rd
 haKtn3gTpdArU+yeeP7OK6V7/ms73JY02TkMQ5udTJ3WTvHAZluNxRUj9KeEUocVTf
 7dxQ9DDou7xIw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5F18E37814B0;
 Mon, 26 Feb 2024 11:36:54 +0000 (UTC)
Date: Mon, 26 Feb 2024 13:36:46 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 4/9] drm/vkms: Add typedef and documentation for
 pixel_read and pixel_write functions
Message-ID: <20240226133646.174d3fb2.pekka.paalanen@collabora.com>
In-Reply-To: <20240223-yuv-v2-4-aa6be2827bb7@bootlin.com>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-4-aa6be2827bb7@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.ffrXulYUtCGywhVcpoe/GC";
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

--Sig_/.ffrXulYUtCGywhVcpoe/GC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Feb 2024 12:37:24 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce two typedefs: pixel_read_t and pixel_write_t. It allows the
> compiler to check if the passed functions take the correct arguments.
> Such typedefs will help ensuring consistency across the code base in
> case of update of these prototypes.
>=20
> Introduce a check around the get_pixel_*_functions to avoid using a
> nullptr as a function.
>=20
> Document for those typedefs.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h       | 23 +++++++++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_formats.c   |  8 ++++----
>  drivers/gpu/drm/vkms/vkms_formats.h   |  4 ++--
>  drivers/gpu/drm/vkms/vkms_plane.c     |  9 ++++++++-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  9 ++++++++-
>  5 files changed, 43 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 18086423a3a7..886c885c8cf5 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -53,12 +53,31 @@ struct line_buffer {
>  	struct pixel_argb_u16 *pixels;
>  };
> =20
> +/**
> + * typedef pixel_write_t - These functions are used to read a pixel from=
 a
> + * `struct pixel_argb_u16*`, convert it in a specific format and write i=
t in the @dst_pixels
> + * buffer.
> + *
> + * @dst_pixel: destination address to write the pixel
> + * @in_pixel: pixel to write
> + */
> +typedef void (*pixel_write_t)(u8 *dst_pixels, struct pixel_argb_u16 *in_=
pixel);

There are some inconsistencies in pixel_write_t and pixel_read_t. At
this point of the series they still operate on a single pixel, but you
use dst_pixels and src_pixels, plural. Yet the documentation correctly
talks about processing a single pixel.

I would also expect the source to be always const, but that's a whole
another patch to change.

> +
>  struct vkms_writeback_job {
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>  	struct vkms_frame_info wb_frame_info;
> -	void (*pixel_write)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
> +	pixel_write_t pixel_write;
>  };
> =20
> +/**
> + * typedef pixel_read_t - These functions are used to read a pixel in th=
e source frame,
> + * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> + *
> + * @src_pixels: Pointer to the pixel to read
> + * @out_pixel: Pointer to write the converted pixel
> + */
> +typedef void (*pixel_read_t)(u8 *src_pixels, struct pixel_argb_u16 *out_=
pixel);
> +
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
> @@ -69,7 +88,7 @@ struct vkms_writeback_job {
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> -	void (*pixel_read)(u8 *src_buffer, struct pixel_argb_u16 *out_pixel);
> +	pixel_read_t pixel_read;
>  };
> =20
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index cb7a49b7c8e7..1f5aeba57ad6 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -262,7 +262,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   *
>   * @format: 4cc of the format
>   */
> -void *get_pixel_conversion_function(u32 format)
> +pixel_read_t get_pixel_read_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> @@ -276,7 +276,7 @@ void *get_pixel_conversion_function(u32 format)
>  	case DRM_FORMAT_RGB565:
>  		return &RGB565_to_argb_u16;
>  	default:
> -		return NULL;
> +		return (pixel_read_t)NULL;
>  	}
>  }
> =20
> @@ -287,7 +287,7 @@ void *get_pixel_conversion_function(u32 format)
>   *
>   * @format: 4cc of the format
>   */
> -void *get_pixel_write_function(u32 format)
> +pixel_write_t get_pixel_write_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> @@ -301,6 +301,6 @@ void *get_pixel_write_function(u32 format)
>  	case DRM_FORMAT_RGB565:
>  		return &argb_u16_to_RGB565;
>  	default:
> -		return NULL;
> +		return (pixel_write_t)NULL;
>  	}
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> index cf59c2ed8e9a..3ecea4563254 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -5,8 +5,8 @@
> =20
>  #include "vkms_drv.h"
> =20
> -void *get_pixel_conversion_function(u32 format);
> +pixel_read_t get_pixel_read_function(u32 format);
> =20
> -void *get_pixel_write_function(u32 format);
> +pixel_write_t get_pixel_write_function(u32 format);
> =20
>  #endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index d5203f531d96..f68b1b03d632 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -106,6 +106,13 @@ static void vkms_plane_atomic_update(struct drm_plan=
e *plane,
>  		return;
> =20
>  	fmt =3D fb->format->format;
> +	pixel_read_t pixel_read =3D get_pixel_read_function(fmt);
> +
> +	if (!pixel_read) {
> +		DRM_WARN("Pixel format is not supported by VKMS planes. State is incha=
nged\n");

DRM_WARN() is the kernel equivalent to userspace assert(), right?
In that failing the check means an internal invariant was violated,
which means a code bug in kernel?

Maybe this could be more specific about what invariant was violated?
E.g. atomic check should have rejected this attempt already.


Thanks,
pq

> +		return;
> +	}
> +
>  	vkms_plane_state =3D to_vkms_plane_state(new_state);
>  	shadow_plane_state =3D &vkms_plane_state->base;
> =20
> @@ -124,7 +131,7 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotat=
ed),
>  			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> =20
> -	vkms_plane_state->pixel_read =3D get_pixel_conversion_function(fmt);
> +	vkms_plane_state->pixel_read =3D pixel_read;
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index c8582df1f739..c92b9f06c4a4 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -140,6 +140,13 @@ static void vkms_wb_atomic_commit(struct drm_connect=
or *conn,
>  	if (!conn_state)
>  		return;
> =20
> +	pixel_write_t pixel_write =3D get_pixel_write_function(wb_format);
> +
> +	if (!pixel_write) {
> +		DRM_WARN("Pixel format is not supported by VKMS writeback. State is in=
changed\n");
> +		return;
> +	}
> +
>  	vkms_set_composer(&vkmsdev->output, true);
> =20
>  	active_wb =3D conn_state->writeback_job->priv;
> @@ -150,7 +157,7 @@ static void vkms_wb_atomic_commit(struct drm_connecto=
r *conn,
>  	crtc_state->wb_pending =3D true;
>  	spin_unlock_irq(&output->composer_lock);
>  	drm_writeback_queue_job(wb_conn, connector_state);
> -	active_wb->pixel_write =3D get_pixel_write_function(wb_format);
> +	active_wb->pixel_write =3D pixel_write;
>  	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
>  	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
>  }
>=20


--Sig_/.ffrXulYUtCGywhVcpoe/GC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXcd84ACgkQI1/ltBGq
qqeu1RAAh3zB6DOIG+0KcNcwq/ohUyhGhDrpfkNFtEn4WKdrNVH5Kfh5O8EVjXbO
bsXisgs75FkJ92k+AxOTGpPKZepVottwuHYIhZq6/aOI+REfHuZXQFkgZX9wAaTo
VnAa2fzILZfOo03xc4vZvTI5hGEfSBfcIevuO15B4tLocuguXZ8bWWOeNB1qW/Yq
jbFvhmBuxOAd8jl7+nlM5bKAMvEyJ2MQDpAGDG3kX1FcwbwuBXxWGhygnEB9YTtO
+aT141alH1zXc9ZwVJDJDf5PL0kmyoIn98iQFyQDjKDNgmltWSi15cQdO2541r4k
qj0j3f/ecFASAFto4tM5TOcU64LjSZTDWoGwRpRfc4EJXrr9yLNtgp/xrmnK9YQg
d3QRtstx63GC+Q1dOakxfTrlYLepP4W4S/Ls4gUMg3YYu/P68ckgfBXjx1cL2dHJ
Z7PiHVd+ZD0WPnlX0+2Sr3pXYUXcF4VDkkVGhCTxqcKbqkUYcfFx1Mxy1fezmXC9
+5cPI6k16G/ESuFSkKGij0fzSV+J4fbm1wErgaAHB0S9zqqwWN1wZEdl0UbCqNxy
Ul0NbttCdjIPyI6mKlEhIoDsFANdDeGJ22xSXJ0U14EMkIbvQoN+KdjeZQv2TFRT
E0PuRkvTCMiQ/D65foxUMOyMq82q1Lh24YnLZHd/c/7XsaaKf8E=
=PvO1
-----END PGP SIGNATURE-----

--Sig_/.ffrXulYUtCGywhVcpoe/GC--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF7889E4D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3DE10E7FA;
	Mon, 25 Mar 2024 12:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="rhSNa67c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7A110E7FA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711368345;
 bh=K01HEaDiD6y1aoBKX9TsqwEwflbrBF563ZiJ+fzSf1s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rhSNa67csI0mPPwX/4g3NyykECU8II2r1+naDpHR7BQVzkce2jYvrUFWZ7pFpuKbK
 /sFbItgVLs7VQytozZFk74g2TBJFGKUrxQfqVQhUH2jEPc47KahVLzPOmyhljYxqX1
 XBh2wx5MCwNJiUBW7g7zwa6Lkq57cQdqsntMyiO2Tu8p9fzAFsrzpWEzFjqiP4+yYg
 kxZKWglUPo5DNCJW2IHPrLlK6nze4zvUPbtqC7CAwiEAFdtA14gWtHmG7xJO0RPKjd
 IGnBkExocibkm7+ltgH/L7CLTMah1x+Wx+m6jj0MOQbTQnyYd6IwQNr9UT3EddQK3N
 Y2RhdhEqBdkvQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0CF603780626;
 Mon, 25 Mar 2024 12:05:44 +0000 (UTC)
Date: Mon, 25 Mar 2024 14:05:42 +0200
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
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH v5 05/16] drm/vkms: Add dummy pixel_read/pixel_write
 callbacks to avoid NULL pointers
Message-ID: <20240325140542.4fffd42c.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-5-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-5-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ssviaODNke6a3Au+epasMDK";
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

--Sig_/ssviaODNke6a3Au+epasMDK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:44:59 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce two callbacks which does nothing. They are used in replacement
> of NULL and it avoid kernel OOPS if this NULL is called.
>=20
> If those callback are used, it means that there is a mismatch between
> what formats are announced by atomic_check and what is realy supported by
> atomic_update.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 43 +++++++++++++++++++++++++++++++=
------
>  1 file changed, 37 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 55a4365d21a4..b57d85b8b935 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -136,6 +136,21 @@ static void RGB565_to_argb_u16(u8 *in_pixel, struct =
pixel_argb_u16 *out_pixel)
>  	out_pixel->b =3D drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>  }
> =20
> +/**
> + * black_to_argb_u16() - pixel_read callback which always read black
> + *
> + * This callback is used when an invalid format is requested for plane r=
eading.
> + * It is used to avoid null pointer to be used as a function. In theory,=
 this function should
> + * never be called, except if you found a bug in the driver/DRM core.
> + */
> +static void black_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_p=
ixel)
> +{
> +	out_pixel->a =3D (u16)0xFFFF;
> +	out_pixel->r =3D 0;
> +	out_pixel->g =3D 0;
> +	out_pixel->b =3D 0;
> +}
> +
>  /**
>   * vkms_compose_row - compose a single row of a plane
>   * @stage_buffer: output line with the composed pixels
> @@ -238,6 +253,16 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct=
 pixel_argb_u16 *in_pixel)
>  	*pixel =3D cpu_to_le16(r << 11 | g << 5 | b);
>  }
> =20
> +/**
> + * argb_u16_to_nothing() - pixel_write callback with no effect
> + *
> + * This callback is used when an invalid format is requested for writeba=
ck.
> + * It is used to avoid null pointer to be used as a function. In theory,=
 this should never
> + * happen, except if there is a bug in the driver
> + */
> +static void argb_u16_to_nothing(u8 *out_pixel, struct pixel_argb_u16 *in=
_pixel)
> +{}
> +
>  /**
>   * Generic loop for all supported writeback format. It is executed just =
after the blending to
>   * write a line in the writeback buffer.
> @@ -261,8 +286,8 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
> =20
>  /**
>   * Retrieve the correct read_pixel function for a specific format.
> - * The returned pointer is NULL for unsupported pixel formats. The calle=
r must ensure that the
> - * pointer is valid before using it in a vkms_plane_state.
> + * If the format is not supported by VKMS a warn is emitted and a dummy =
"always read black"
> + * function is returned.
>   *
>   * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
>   */
> @@ -285,18 +310,21 @@ pixel_read_t get_pixel_read_function(u32 format)
>  		 * format must:
>  		 * - Be listed in vkms_formats in vkms_plane.c
>  		 * - Have a pixel_read callback defined here
> +		 *
> +		 * To avoid kernel crash, a dummy "always read black" function is used=
. It means
> +		 * that during the composition, this plane will always be black.
>  		 */
>  		WARN(true,
>  		     "Pixel format %p4cc is not supported by VKMS planes. This is a ke=
rnel bug, atomic check must forbid this configuration.\n",
>  		     &format);
> -		return (pixel_read_t)NULL;
> +		return &black_to_argb_u16;

Hi Louis,

I'm perhaps a bit paranoid in these things, but I'd make this not
black. Maybe something more "screaming" like magenta. There is a slight
chance that black might sometimes be expected, or not affect the
result. After all, blending something into black with pre-multiplied
alpha is equivalent to no-blending (a copy). The kernel warning is
good, the magenta is more like an assurance.

Anyway,

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq


>  	}
>  }
> =20
>  /**
>   * Retrieve the correct write_pixel function for a specific format.
> - * The returned pointer is NULL for unsupported pixel formats. The calle=
r must ensure that the
> - * pointer is valid before using it in a vkms_writeback_job.
> + * If the format is not supported by VKMS a warn is emitted and a dummy =
"don't do anything"
> + * function is returned.
>   *
>   * @format: DRM_FORMAT_* value for which to obtain a conversion function=
 (see [drm_fourcc.h])
>   */
> @@ -319,10 +347,13 @@ pixel_write_t get_pixel_write_function(u32 format)
>  		 * format must:
>  		 * - Be listed in vkms_wb_formats in vkms_writeback.c
>  		 * - Have a pixel_write callback defined here
> +		 *
> +		 * To avoid kernel crash, a dummy "don't do anything" function is used=
. It means
> +		 * that the resulting writeback buffer is not composed and can contain=
s any values.
>  		 */
>  		WARN(true,
>  		     "Pixel format %p4cc is not supported by VKMS writeback. This is a=
 kernel bug, atomic check must forbid this configuration.\n",
>  		     &format);
> -		return (pixel_write_t)NULL;
> +		return &argb_u16_to_nothing;
>  	}
>  }
>=20


--Sig_/ssviaODNke6a3Au+epasMDK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBaJYACgkQI1/ltBGq
qqeDkw//UGRx7bDK7LJ8EIpMD1eeu9Yl5fhc4WGSlgQMaey7PnjOV+4ic3YISi18
/N4tpm1VnFQYsRPCtemovzRJXfNQ5l/6P7/fum1IWdNw3yQoSpmZVUQV09K7N8S9
eQAKNzJd9Y7D/10amqkPzvP57yKMfYRAqsuhGI1R7VCKj0//QyUG5NzLyvktRX/3
z2Rz7oT2rDR0PzdtTqkPitFLcl6YScDWaJszBBfAtbOLuzZ5cs0DdIczaDQEUggK
LgizCbDmVuCf1AW0RdM44c2Z7+3BkAxAKsb6AkrFzsAjbGG0mZ13liHIa2GB3Vwz
6aG9MHpLxXnffFzu8HjpqavupR49lJoxdQ7xpxndkET4aRZIYWMLBKCkAFBjyFsM
sOeTcdXYRTylRiBXK2jRfdkJVKsfCaJVFIFerdsg6NAXvvlzoP5sXa5nELvo/GjH
0CJVlbWpkvg4Ow5SblHT92yIWGeoF1jv+RkxB8klcJJTlDLZElbiez/xoDDEAQoj
hlnRuClbXts5SEmBbF8kfqqmQF2SjC5nFVZhIpOxqgSpiiFa8yBIYs6XVrpqgZFs
fdAv4eQkDMBakKD2J3BajmtkYDrqWXJWFgYGBJJm7BTs1qSbLRb/624EcsWD75c8
KczZPLIwGrrgFFrzxy57/htqt9b+St67N9uqGyikTjTfZCPOrcI=
=B4v2
-----END PGP SIGNATURE-----

--Sig_/ssviaODNke6a3Au+epasMDK--

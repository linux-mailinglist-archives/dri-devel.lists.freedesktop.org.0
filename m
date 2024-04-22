Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017288ACBBA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 13:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46CC10E5E2;
	Mon, 22 Apr 2024 11:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Qf5XJ0TK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E65A10E5E2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713784353;
 bh=sb6w0vBf+6w8wloCIXWMQDH8YFgEFapAm0WcSvhGHi0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qf5XJ0TKLw6WYYYr8gS7cx2GGUcA6gs50t3CpBOJtsT/dXJmT3hAaMoiQG6BwRz62
 WjENUi1cKpJbaXfMKAHVKLXNIXrhHhvx9IagaYHksbrcpqTJWTVR5y5NKypGDJ5o3h
 6gKFAMj4pIg6cFfMTMQd2Q8h7fNX5hBIOaUoqCnHlfdBVTH9P58U6aI+fkZu5QbXJT
 Dnv8SzChM6sFFSDgeoAdvqe6HxsfnaJef4nkVvBGFgjQHXNMOYDiebB9JWPu67Q7//
 IBkJV5nUFUD8AD4iewbRqVgJw4zcWbufYuZsuA1rbClA2VuBao1ZnrIocTSkiWfg5v
 rrTbZPhsD1jSg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A4D663780C22;
 Mon, 22 Apr 2024 11:12:32 +0000 (UTC)
Date: Mon, 22 Apr 2024 14:12:31 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, arthurgrillo@riseup.net, Jonathan Corbet
 <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 08/17] drm/vkms: Avoid computing blending limits
 inside pre_mul_alpha_blend
Message-ID: <20240422141231.513f0295.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-yuv-v6-8-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-8-de1c5728fd70@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ftYzuClzH53oySJ+T+t4LAa";
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

--Sig_/ftYzuClzH53oySJ+T+t4LAa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 15:25:26 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> The pre_mul_alpha_blend is dedicated to blending, so to avoid mixing
> different concepts (coordinate calculation and color management), extract
> the x_limit and x_dst computation outside of this helper.
> It also increases the maintainability by grouping the computation related
> to coordinates in the same place: the loop in `blend`.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 40 +++++++++++++++++-------------=
------
>  1 file changed, 19 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index da0651a94c9b..45b111c74884 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -24,34 +24,30 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u1=
6 alpha)
> =20
>  /**
>   * pre_mul_alpha_blend - alpha blending equation
> - * @frame_info: Source framebuffer's metadata
>   * @stage_buffer: The line with the pixels from src_plane
>   * @output_buffer: A line buffer that receives all the blends output
> + * @x_start: The start offset
> + * @pixel_count: The number of pixels to blend
>   *
> - * Using the information from the `frame_info`, this blends only the
> - * necessary pixels from the `stage_buffer` to the `output_buffer`
> - * using premultiplied blend formula.
> + * The pixels 0..@pixel_count in stage_buffer are blended at @x_start..@=
x_start+@pixel_count in
> + * output_buffer.
>   *
>   * The current DRM assumption is that pixel color values have been alrea=
dy
>   * pre-multiplied with the alpha channel values. See more
>   * drm_plane_create_blend_mode_property(). Also, this formula assumes a
>   * completely opaque background.
>   */
> -static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
> -				struct line_buffer *stage_buffer,
> -				struct line_buffer *output_buffer)
> +static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
> +				struct line_buffer *output_buffer, int x_start, int pixel_count)
>  {
> -	int x_dst =3D frame_info->dst.x1;
> -	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> -	struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> -	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> -
> -	for (int x =3D 0; x < x_limit; x++) {
> -		out[x].a =3D (u16)0xffff;
> -		out[x].r =3D pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> -		out[x].g =3D pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> -		out[x].b =3D pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
> +	struct pixel_argb_u16 *out =3D &output_buffer->pixels[x_start];
> +	const struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> +
> +	for (int i =3D 0; i < pixel_count; i++) {
> +		out[i].a =3D (u16)0xffff;
> +		out[i].r =3D pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
> +		out[i].g =3D pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
> +		out[i].b =3D pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
>  	}
>  }
> =20
> @@ -183,7 +179,7 @@ static void blend(struct vkms_writeback_job *wb,
>  {
>  	struct vkms_plane_state **plane =3D crtc_state->active_planes;
>  	u32 n_active_planes =3D crtc_state->num_active_planes;
> -	int y_pos;
> +	int y_pos, x_dst, pixel_count;
> =20
>  	const struct pixel_argb_u16 background_color =3D { .a =3D 0xffff };
> =20
> @@ -201,14 +197,16 @@ static void blend(struct vkms_writeback_job *wb,
> =20
>  		/* The active planes are composed associatively in z-order. */
>  		for (size_t i =3D 0; i < n_active_planes; i++) {
> +			x_dst =3D plane[i]->frame_info->dst.x1;
> +			pixel_count =3D min_t(int, drm_rect_width(&plane[i]->frame_info->dst),
> +					    (int)stage_buffer->n_pixels);
>  			y_pos =3D get_y_pos(plane[i]->frame_info, y);
> =20
>  			if (!check_limit(plane[i]->frame_info, y_pos))
>  				continue;
> =20
>  			vkms_compose_row(stage_buffer, plane[i], y_pos);
> -			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> -					    output_buffer);
> +			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, pixel_count);
>  		}
> =20
>  		apply_lut(crtc_state, output_buffer);
>=20

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/ftYzuClzH53oySJ+T+t4LAa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYmRh8ACgkQI1/ltBGq
qqebhA/+LR0l18Yb4oNKfeOta5o/H/STbogfZP1N+Gfpq5ecs69Nb4QGQVuXDC//
W4858UmVBCwLruUqjeehzTe1Hvt+LIGVKbIJXpTC4qIawi7QFFOZXNlX/QRrGnHN
PfXk5PnL00NWyYlz6Fg1uGFM1M4aOzLWEjYxIFSQAa14WNXTS/bnknx2PQayjGpb
HXv4sU749qSy4AC8BWm6Z47n3nBggyojIrG7/jACrkrQueFVUGyCarlwXNLgVr4z
6cImLh5e7WzLW9NGNDjOujzaGUBmO+Cg2YB/Tg4fLCwT6HKcqeL2suFMXycNLCsc
oInHiWU2oD9MtdmGdR1NUhvAqI++F5Nc8CsC6dlpddJbBfFzoy7uR3UUhL39a5lI
PlkSGh9CqQaIZ8NmzhJtwRy+o0UdYKiXEH1MLX0Xn5A3UADdvnS21vDil8YLIehv
D1XW1PRYK70BBrM5TZ7Nbo/qt9jDqbyZJmiSF082IFb409kK8eh8b1khaeDi0sRX
uI1p7hrl/DWq38bA1Y7wUFK2kGNC7+GdmoyV9pUSXiXwHhYBE4/JHAUbblojvHre
MyWGv5vsa0D7OWfQpetyDNpeytKR9Ntwuab5tCmG09kPWqAGEiFKGc+WOy2hWr3D
djcu5dbzLDu5aQvcwW8V4hnC5Hn1B0UHfipWGHZhWa0JiF1z3M8=
=AQK4
-----END PGP SIGNATURE-----

--Sig_/ftYzuClzH53oySJ+T+t4LAa--

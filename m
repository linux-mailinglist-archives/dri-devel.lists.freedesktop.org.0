Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA3889E37
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB5410E7F9;
	Mon, 25 Mar 2024 12:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U+ZkKw88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809AC10E7F9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711368252;
 bh=7ZDq4vMz8hEt475zSnnbMd2h1vZxeifEWmL6TiXipU0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U+ZkKw88hWgf6e7+d+rfdeVwpxy/kRuHvDapcAJZ/r+WpJhUaXTU7K4Kp2wqd2mRD
 kfyABD3ud/8uSasKSARthRDIUszaPi+d4ZPlOtVMIBvCb6LnBd/ilIlhZacswtIiof
 acXmDrJQAKDufiptGuQpigE/jLgFJs+gKnv0pYZc5eSHC1u21O43d+w1vQ8CZn+Do1
 cOLnviHyS09qJ3YLKIcLxJ3xg+IlRbWkRsNfM9s6tl+O20R3HUflzIQ3dgTBhSqn5p
 xwUd95757v817So371NtHEYtE8v/TRFofexThKyEO42oFgb50SHHOIL4w0cLbD3Odd
 90aJTMWW+Rw7A==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25C9B3780626;
 Mon, 25 Mar 2024 12:04:11 +0000 (UTC)
Date: Mon, 25 Mar 2024 14:04:09 +0200
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
Subject: Re: [PATCH v5 02/16] drm/vkms: Use drm_frame directly
Message-ID: <20240325140409.654c2eb3.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-2-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-2-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BdJf3z6sTnXQ19u=UnJwhMw";
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

--Sig_/BdJf3z6sTnXQ19u=UnJwhMw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:44:56 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> From: Arthur Grillo <arthurgrillo@riseup.net>
>=20
> Remove intermidiary variables and access the variables directly from
> drm_frame. These changes should be noop.
>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks,
pq



>  drivers/gpu/drm/vkms/vkms_drv.h       |  3 ---
>  drivers/gpu/drm/vkms/vkms_formats.c   | 12 +++++++-----
>  drivers/gpu/drm/vkms/vkms_plane.c     |  3 ---
>  drivers/gpu/drm/vkms/vkms_writeback.c |  5 -----
>  4 files changed, 7 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 8f5710debb1e..b4b357447292 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -31,9 +31,6 @@ struct vkms_frame_info {
>  	struct drm_rect rotated;
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>  	unsigned int rotation;
> -	unsigned int offset;
> -	unsigned int pitch;
> -	unsigned int cpp;
>  };
> =20
>  struct pixel_argb_u16 {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 36046b12f296..172830a3936a 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -11,8 +11,10 @@
> =20
>  static size_t pixel_offset(const struct vkms_frame_info *frame_info, int=
 x, int y)
>  {
> -	return frame_info->offset + (y * frame_info->pitch)
> -				  + (x * frame_info->cpp);
> +	struct drm_framebuffer *fb =3D frame_info->fb;
> +
> +	return fb->offsets[0] + (y * fb->pitches[0])
> +			      + (x * fb->format->cpp[0]);
>  }
> =20
>  /*
> @@ -131,12 +133,12 @@ void vkms_compose_row(struct line_buffer *stage_buf=
fer, struct vkms_plane_state
>  	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
>  	int limit =3D min_t(size_t, drm_rect_width(&frame_info->dst), stage_buf=
fer->n_pixels);
> =20
> -	for (size_t x =3D 0; x < limit; x++, src_pixels +=3D frame_info->cpp) {
> +	for (size_t x =3D 0; x < limit; x++, src_pixels +=3D frame_info->fb->fo=
rmat->cpp[0]) {
>  		int x_pos =3D get_x_position(frame_info, limit, x);
> =20
>  		if (drm_rotation_90_or_270(frame_info->rotation))
>  			src_pixels =3D get_packed_src_addr(frame_info, x + frame_info->rotate=
d.y1)
> -				+ frame_info->cpp * y;
> +				+ frame_info->fb->format->cpp[0] * y;
> =20
>  		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
>  	}
> @@ -223,7 +225,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
>  	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst), src_buf=
fer->n_pixels);
> =20
> -	for (size_t x =3D 0; x < x_limit; x++, dst_pixels +=3D frame_info->cpp)
> +	for (size_t x =3D 0; x < x_limit; x++, dst_pixels +=3D frame_info->fb->=
format->cpp[0])
>  		wb->pixel_write(dst_pixels, &in_pixels[x]);
>  }
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 5a8d295e65f2..21b5adfb44aa 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -125,9 +125,6 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotat=
ed),
>  			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> =20
> -	frame_info->offset =3D fb->offsets[0];
> -	frame_info->pitch =3D fb->pitches[0];
> -	frame_info->cpp =3D fb->format->cpp[0];
>  	vkms_plane_state->pixel_read =3D get_pixel_conversion_function(fmt);
>  }
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index bc724cbd5e3a..c8582df1f739 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -149,11 +149,6 @@ static void vkms_wb_atomic_commit(struct drm_connect=
or *conn,
>  	crtc_state->active_writeback =3D active_wb;
>  	crtc_state->wb_pending =3D true;
>  	spin_unlock_irq(&output->composer_lock);
> -
> -	wb_frame_info->offset =3D fb->offsets[0];
> -	wb_frame_info->pitch =3D fb->pitches[0];
> -	wb_frame_info->cpp =3D fb->format->cpp[0];
> -
>  	drm_writeback_queue_job(wb_conn, connector_state);
>  	active_wb->pixel_write =3D get_pixel_write_function(wb_format);
>  	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
>=20


--Sig_/BdJf3z6sTnXQ19u=UnJwhMw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBaDkACgkQI1/ltBGq
qqe1Aw//Wn9n1vIBqbsxjE914w2DpwuU5EDI3PNSERhY76qxWZQd2qqyCV9+01/b
d/0o6j8TDuTUUwLxFPrzVBez0ksJFkBDfPHQ9ZjEHzamMh2sjk271tXv5wPxMAJO
NaVQv2DCyELFBrLEtVn2yA8i8EiUtRfxa8/T7vFZr7sxLSmd6nISi8nNkhiQqSZC
RfXE5c0RAptCF0xGS1QdCtx6W20A5QzP/edO+93gxL/ubC7OxuWF53RdBxnqjWlf
OxN/350Td9hljK7jnhOPkGvrLCunFuIMaygmKhJleRR7tSWyqzaYglptfXmgHPUA
r/uHk9adHCJMHDnTCRFj4n/9Qy8W23GBYXADZs8jTJGC489efDP7LW1oZv9PgaBr
ym9m6PYFTcx6/AgsdkO8p/1u7XAsYOOC2uziWkrBKoi7OwQy4QcOij+/VLcimm68
NzuP3spvs5MHWX4aaDFvUSC6RcUZQ7nGC2wQyLRd+wck4aCllsH0Tora+4lB31JB
HN3HDOC2XHNcodlgmfJJ6P2+vMBizq9LJSFDtOpfcbp/PeisqiBjEJ8i7afgM4Ir
Kmhwvntlba2KNL+6AYhj6Zo34jVss7WztDYn04J3qSax7avozzZzTOkqZVo2XIrh
itzLB9nPVrBkh2rFVDJ3A8QAQM/5qTlsnnNx6CDMxV9LQQ8VQGE=
=5MUp
-----END PGP SIGNATURE-----

--Sig_/BdJf3z6sTnXQ19u=UnJwhMw--

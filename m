Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA302889E36
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD59B10E7F8;
	Mon, 25 Mar 2024 12:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JxLzE8B1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEB510E7F8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711368244;
 bh=7jHHqk7qDzRtTMvU3NTL2HuDw9jtVH01ZEEZaWVafZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JxLzE8B1wPUWYNm5jcR9LHyMaPzypsrKPOukIUZkUH9ZXYZwwp7c77MUlfHIcP2m9
 DIN221kxLve2nEpsZXv/r9YYpS6pjoE8Y11qhvf7rMytxi6/S3xEkHk5x/Q5fpeR79
 djaqsmArB9Er2JSukPj/F2LNRCnVPk2Bq7SvnRIvYRcFUf55PlpCuhoOM2MLzAv9Rd
 9P09LEy59POFl5ugledseZIhSNFc6p3sy/0ynUWAc9iZ0Cy+7E2YNC+IsYKbWRPsFo
 G9zTRnCpZXV9m7ZMU3CBaRHhjbmJ3//yfusk6PCQjYRz7+kPcNlHTV6YkiiRkRHZ7w
 VJYwPnIBYtsEw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89D9837810C0;
 Mon, 25 Mar 2024 12:04:03 +0000 (UTC)
Date: Mon, 25 Mar 2024 14:03:45 +0200
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
Subject: Re: [PATCH v5 01/16] drm/vkms: Code formatting
Message-ID: <20240325140345.4734f165.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-1-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-1-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fpgQUd5yCj7yHb9c/ZPh1yJ";
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

--Sig_/fpgQUd5yCj7yHb9c/ZPh1yJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:44:55 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Few no-op changes to remove double spaces and fix wrong alignments.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks,
pq


> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 10 +++++-----
>  drivers/gpu/drm/vkms/vkms_crtc.c     |  6 ++----
>  drivers/gpu/drm/vkms/vkms_drv.c      |  3 +--
>  drivers/gpu/drm/vkms/vkms_plane.c    |  8 ++++----
>  4 files changed, 12 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index e7441b227b3c..c6d9b4a65809 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -96,7 +96,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>  	s64 a_fp =3D drm_int2fixp(a);
>  	s64 b_fp =3D drm_int2fixp(b);
> =20
> -	s64 delta =3D drm_fixp_mul(b_fp - a_fp,  t);
> +	s64 delta =3D drm_fixp_mul(b_fp - a_fp, t);
> =20
>  	return drm_fixp2int(a_fp + delta);
>  }
> @@ -302,8 +302,8 @@ static int compose_active_planes(struct vkms_writebac=
k_job *active_wb,
>  void vkms_composer_worker(struct work_struct *work)
>  {
>  	struct vkms_crtc_state *crtc_state =3D container_of(work,
> -						struct vkms_crtc_state,
> -						composer_work);
> +							  struct vkms_crtc_state,
> +							  composer_work);
>  	struct drm_crtc *crtc =3D crtc_state->base.crtc;
>  	struct vkms_writeback_job *active_wb =3D crtc_state->active_writeback;
>  	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> @@ -328,7 +328,7 @@ void vkms_composer_worker(struct work_struct *work)
>  		crtc_state->gamma_lut.base =3D (struct drm_color_lut *)crtc->state->ga=
mma_lut->data;
>  		crtc_state->gamma_lut.lut_length =3D
>  			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
> -		max_lut_index_fp =3D drm_int2fixp(crtc_state->gamma_lut.lut_length  - =
1);
> +		max_lut_index_fp =3D drm_int2fixp(crtc_state->gamma_lut.lut_length - 1=
);
>  		crtc_state->gamma_lut.channel_value2index_ratio =3D drm_fixp_div(max_l=
ut_index_fp,
>  									       u16_max_fp);
> =20
> @@ -367,7 +367,7 @@ void vkms_composer_worker(struct work_struct *work)
>  		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
>  }
> =20
> -static const char * const pipe_crc_sources[] =3D {"auto"};
> +static const char *const pipe_crc_sources[] =3D { "auto" };
> =20
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
>  					size_t *count)
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 61e500b8c9da..7586ae2e1dd3 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -191,8 +191,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *cr=
tc,
>  		return ret;
> =20
>  	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
> -		plane_state =3D drm_atomic_get_existing_plane_state(crtc_state->state,
> -								  plane);
> +		plane_state =3D drm_atomic_get_existing_plane_state(crtc_state->state,=
 plane);
>  		WARN_ON(!plane_state);
> =20
>  		if (!plane_state->visible)
> @@ -208,8 +207,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *cr=
tc,
> =20
>  	i =3D 0;
>  	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
> -		plane_state =3D drm_atomic_get_existing_plane_state(crtc_state->state,
> -								  plane);
> +		plane_state =3D drm_atomic_get_existing_plane_state(crtc_state->state,=
 plane);
> =20
>  		if (!plane_state->visible)
>  			continue;
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index dd0af086e7fa..83e6c9b9ff46 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -81,8 +81,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_s=
tate *old_state)
>  	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> =20
>  	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
> -		struct vkms_crtc_state *vkms_state =3D
> -			to_vkms_crtc_state(old_crtc_state);
> +		struct vkms_crtc_state *vkms_state =3D to_vkms_crtc_state(old_crtc_sta=
te);
> =20
>  		flush_work(&vkms_state->composer_work);
>  	}
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index e5c625ab8e3e..5a8d295e65f2 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -117,10 +117,10 @@ static void vkms_plane_atomic_update(struct drm_pla=
ne *plane,
>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->=
map));
>  	drm_framebuffer_get(frame_info->fb);
>  	frame_info->rotation =3D drm_rotation_simplify(new_state->rotation, DRM=
_MODE_ROTATE_0 |
> -						     DRM_MODE_ROTATE_90 |
> -						     DRM_MODE_ROTATE_270 |
> -						     DRM_MODE_REFLECT_X |
> -						     DRM_MODE_REFLECT_Y);
> +									  DRM_MODE_ROTATE_90 |
> +									  DRM_MODE_ROTATE_270 |
> +									  DRM_MODE_REFLECT_X |
> +									  DRM_MODE_REFLECT_Y);
> =20
>  	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotat=
ed),
>  			drm_rect_height(&frame_info->rotated), frame_info->rotation);
>=20


--Sig_/fpgQUd5yCj7yHb9c/ZPh1yJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBaCIACgkQI1/ltBGq
qqeR7A//ZP3P4O6DhcAZt6lM343JU/XK0AmkWgZEUE6sN5F1PVm8E5F5mxEIHqYX
vq8BrK9FZTILnbsY09ebfxDDvY3BKAbuUmbnsw0P3qgaJU5cs7JBq72Z7Qi8iTUP
qCCqDGEhWJO0Z2I67dgN/vx3h62Di1IK8xaZTL9NwIxshK2CtDCkDmR0FvVwM69X
D/pWMXmEw4xmzWK/Gh8C+/avdqVY+MG2Gm26/0/DPuo4rKvj7ZFneNX+qjUivIpj
lr0eADvZWfCuVqh/ro/SrDKcbFUzw7pOxTVkEqkMzZYbX6DIcYbd6d6pyu5dBapv
xiPAlLTlEe+5TZyzcXtfhLmp4WPBydlJt2Ktar4FUNEmAJLwcduS1ouhSu/ONCMw
WP55MaqBlloC14dAgFNDMhQXd8AZ/FWsPt3PsAeVPNL9jH2gsA1mdxW5h79yroWX
LBW1KOjRRiHK+vPTIvx41MdITn/eJmBn8L7B/aLoYHON9798OSBX9KHYGw43jtEU
8MOdgIoRKYxx+fyr6zauRX2vJ5ST7tY+xTuXzlnR4yyOAyi3yKmo4K+nh0FBZ+yS
IVUlP6UquGQ4rMtxIq4EdQ5ZPnxuO6cE2G3cGlAsx0wWpN83zhLOdmAx+9Gm+90I
iWxd8XhrsihiGUDDOUOUh+z3V30ftQEyhBpq1og7QlKvtF4I3qA=
=Hb0E
-----END PGP SIGNATURE-----

--Sig_/fpgQUd5yCj7yHb9c/ZPh1yJ--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F105086D7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D5089725;
	Wed, 20 Apr 2022 11:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0B10F217
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:23:19 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f5so1386786ljp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 04:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=F6AL/7NnjZoWjv/JClx2V6I6r0l2Bsq3GvpYKrGDzag=;
 b=pJ38fM79tsHSmjid64eeeHIObdLiOk87Vs2ptK5PUYiTj98MO7xoms/C2m6MQH72di
 DqfGJGd4Cuu5jLp1E2/RDzPQepKhos9asU2Q8t7HuIe0OH5GV2dbGMCObKPQuWFlJ0/9
 qccFp8ew111aGvzxJGEHT8MXUQhzDdGmZp88lXMK7a+4z2RXxRIgOiIPzH8Xa3eYwsI/
 HpeJDRudUf46VTEaIKin9SZzrg2A5ou1qA8CFBAC55e90W8MVEiwxg4a9y9KXVDrqA1f
 1RXtXBegB46XQR/mVZCp8H7F9oAzojZmO45liSM9J3sfJxrUcLmtJ2o15TC/6ZbyhKF7
 Rx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=F6AL/7NnjZoWjv/JClx2V6I6r0l2Bsq3GvpYKrGDzag=;
 b=IVWp+3dWw3h/9anz0kvp6RDABNGV+HbWZqBGGUxceDZSB5DbSph23xM3EwaT3vLZRE
 iSGJVBpDCMuZO+KfMoXXgDlbQJZLqrMSZsTYh9kb69ddlKy7Ny7Um8XlJjoofTt0+WQz
 23i4fGZb9FxtR2lxWSpnXHbaLv5b7QJITlJDoQEPHN/hXsyIMoYUiRAEsJv+1styY6vQ
 3tFmEN97hKHeC8nyO+YfQKatEuvLEcBTLIQFX8UhkHMfFofhBSIJvg9yuO5dblnyOJZb
 1/tYcDTLJ1SW6WIpHHb0WSaP3RL/UHLruryKYkrHowjzrfbKF0rlYmprtiTtGnbtHjd/
 ZEMA==
X-Gm-Message-State: AOAM533GLh7VY1IxL+2oDok/4wLeIrzSpJkze/th492dSCzIVKeqgKVG
 D6A96/Eo8lmC+pBFRl3uCx0=
X-Google-Smtp-Source: ABdhPJzhI3gQVVSJkiRu2T2UNntdlsy50ipP+D/+cMUfXr3xDgN2IfJ7K60tR3AyfTxrUK1bWhwwdg==
X-Received: by 2002:a2e:b892:0:b0:24b:6aa6:4095 with SMTP id
 r18-20020a2eb892000000b0024b6aa64095mr12981032ljp.193.1650453797114; 
 Wed, 20 Apr 2022 04:23:17 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 b21-20020a2e8955000000b0024da19039a8sm1719695ljk.81.2022.04.20.04.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:23:16 -0700 (PDT)
Date: Wed, 20 Apr 2022 14:23:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Message-ID: <20220420142305.3945f409@eldfell>
In-Reply-To: <20220404204515.42144-6-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-6-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7eeQTTMg1nl296E4qGG.Osj";
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7eeQTTMg1nl296E4qGG.Osj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  4 Apr 2022 17:45:11 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> This commit is the groundwork to introduce new formats to the planes and
> writeback buffer. As part of it, a new buffer metadata field is added to
> `vkms_writeback_job`, this metadata is represented by the `vkms_composer`
> struct.

Hi,

should this be talking about vkms_frame_info struct instead?

>=20
> Also adds two new function pointers (`{wb,plane}_format_transform_func`)
> are defined to handle format conversion to/from internal format.
>=20
> These things will allow us, in the future, to have different compositing
> and wb format types.
>=20
> V2: Change the code to get the drm_framebuffer reference and not copy its
>     contents(Thomas Zimmermann).
> V3: Drop the refcount in the wb code(Thomas Zimmermann).
> V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
>     and vkms_plane_state (Pekka Paalanen)
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
>  drivers/gpu/drm/vkms/vkms_drv.h       | 31 +++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_plane.c     | 10 ++++-----
>  drivers/gpu/drm/vkms/vkms_writeback.c | 20 ++++++++++++++---
>  4 files changed, 49 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 2d946368a561..95029d2ebcac 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -153,7 +153,7 @@ static void compose_plane(struct vkms_frame_info *pri=
mary_plane_info,
>  			  struct vkms_frame_info *plane_frame_info,
>  			  void *vaddr_out)
>  {
> -	struct drm_framebuffer *fb =3D &plane_frame_info->fb;
> +	struct drm_framebuffer *fb =3D plane_frame_info->fb;
>  	void *vaddr;
>  	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> =20
> @@ -175,7 +175,7 @@ static int compose_active_planes(void **vaddr_out,
>  				 struct vkms_frame_info *primary_plane_info,
>  				 struct vkms_crtc_state *crtc_state)
>  {
> -	struct drm_framebuffer *fb =3D &primary_plane_info->fb;
> +	struct drm_framebuffer *fb =3D primary_plane_info->fb;
>  	struct drm_gem_object *gem_obj =3D drm_gem_fb_get_obj(fb, 0);
>  	const void *vaddr;
>  	int i;
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 2e6342164bef..2704cfb6904b 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -22,13 +22,8 @@
> =20
>  #define NUM_OVERLAY_PLANES 8
> =20
> -struct vkms_writeback_job {
> -	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
> -	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> -};
> -
>  struct vkms_frame_info {
> -	struct drm_framebuffer fb;
> +	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
>  	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>  	unsigned int offset;
> @@ -36,6 +31,29 @@ struct vkms_frame_info {
>  	unsigned int cpp;
>  };
> =20
> +struct pixel_argb_u16 {
> +	u16 a, r, g, b;
> +};
> +
> +struct line_buffer {
> +	size_t n_pixels;
> +	struct pixel_argb_u16 *pixels;
> +};
> +
> +typedef void
> +(*wb_format_transform_func)(struct vkms_frame_info *frame_info,
> +			    const struct line_buffer *buffer, int y);
> +
> +typedef void
> +(*plane_format_transform_func)(struct line_buffer *buffer,
> +			       const struct vkms_frame_info *frame_info, int y);

It wasn't immediately obvious to me in which direction these function
types work from their names. The arguments are not wb and plane but
vkms_frame_info and line_buffer in both. The implementations of these
functions would have nothing specific to a wb or a plane either, would
they?

What about naming them frame_to_line_func and line_to_frame_func?

> +
> +struct vkms_writeback_job {
> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> +	struct vkms_frame_info frame_info;

Which frame_info is this? Should the field be called wb_frame_info?

> +	wb_format_transform_func format_func;

line_to_frame_func wb_write;

perhaps? The type explains the general type of the function, and the
field name refers to what it is used for.

> +};
> +
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
> @@ -44,6 +62,7 @@ struct vkms_frame_info {
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> +	plane_format_transform_func format_func;

Similarly here, maybe

frame_to_line_func plane_read;

perhaps?

>  };
> =20
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index a56b0f76eddd..28752af0118c 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -50,12 +50,12 @@ static void vkms_plane_destroy_state(struct drm_plane=
 *plane,
>  	struct vkms_plane_state *vkms_state =3D to_vkms_plane_state(old_state);
>  	struct drm_crtc *crtc =3D vkms_state->base.base.crtc;
> =20
> -	if (crtc) {
> +	if (crtc && vkms_state->frame_info->fb) {
>  		/* dropping the reference we acquired in
>  		 * vkms_primary_plane_update()
>  		 */
> -		if (drm_framebuffer_read_refcount(&vkms_state->frame_info->fb))
> -			drm_framebuffer_put(&vkms_state->frame_info->fb);
> +		if (drm_framebuffer_read_refcount(vkms_state->frame_info->fb))
> +			drm_framebuffer_put(vkms_state->frame_info->fb);
>  	}
> =20
>  	kfree(vkms_state->frame_info);
> @@ -110,9 +110,9 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	frame_info =3D vkms_plane_state->frame_info;
>  	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
>  	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
> -	memcpy(&frame_info->fb, fb, sizeof(struct drm_framebuffer));
> +	frame_info->fb =3D fb;

This change, replacing the memcpy with storing a pointer, seems to be
another major point of this patch. Should it be a separate patch?
It doesn't seem to fit with the current commit message.

I have no idea what kind of locking or referencing a drm_framebuffer
would need, and I suspect that would be easier to review if it was a
patch of its own.

>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->=
map));
> -	drm_framebuffer_get(&frame_info->fb);
> +	drm_framebuffer_get(frame_info->fb);

Does drm_framebuffer_get() not return anything?

To me it would be more idiomatic to write something like

	frame_info->fb =3D drm_framebuffer_get(fb);

I don't know if that pattern is used in the kernel, but I use it in
userspace to emphasise that frame_info owns a new reference rather than
borrowing someone else's.


Thanks,
pq

>  	frame_info->offset =3D fb->offsets[0];
>  	frame_info->pitch =3D fb->pitches[0];
>  	frame_info->cpp =3D fb->format->cpp[0];
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index 746cb0abc6ec..ad4bb1fb37ca 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -74,12 +74,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_c=
onnector *wb_connector,
>  	if (!vkmsjob)
>  		return -ENOMEM;
> =20
> -	ret =3D drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
> +	ret =3D drm_gem_fb_vmap(job->fb, vkmsjob->frame_info.map, vkmsjob->data=
);
>  	if (ret) {
>  		DRM_ERROR("vmap failed: %d\n", ret);
>  		goto err_kfree;
>  	}
> =20
> +	vkmsjob->frame_info.fb =3D job->fb;
> +	drm_framebuffer_get(vkmsjob->frame_info.fb);
> +
>  	job->priv =3D vkmsjob;
> =20
>  	return 0;
> @@ -98,7 +101,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_c=
onnector *connector,
>  	if (!job->fb)
>  		return;
> =20
> -	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
> +	drm_gem_fb_vunmap(job->fb, vkmsjob->frame_info.map);
> +
> +	drm_framebuffer_put(vkmsjob->frame_info.fb);
> =20
>  	vkmsdev =3D drm_device_to_vkms_device(job->fb->dev);
>  	vkms_set_composer(&vkmsdev->output, false);
> @@ -115,14 +120,23 @@ static void vkms_wb_atomic_commit(struct drm_connec=
tor *conn,
>  	struct drm_writeback_connector *wb_conn =3D &output->wb_connector;
>  	struct drm_connector_state *conn_state =3D wb_conn->base.state;
>  	struct vkms_crtc_state *crtc_state =3D output->composer_state;
> +	struct drm_framebuffer *fb =3D connector_state->writeback_job->fb;
> +	struct vkms_writeback_job *active_wb;
> +	struct vkms_frame_info *wb_frame_info;
> =20
>  	if (!conn_state)
>  		return;
> =20
>  	vkms_set_composer(&vkmsdev->output, true);
> =20
> +	active_wb =3D conn_state->writeback_job->priv;
> +	wb_frame_info =3D &active_wb->frame_info;
> +
>  	spin_lock_irq(&output->composer_lock);
> -	crtc_state->active_writeback =3D conn_state->writeback_job->priv;
> +	crtc_state->active_writeback =3D active_wb;
> +	wb_frame_info->offset =3D fb->offsets[0];
> +	wb_frame_info->pitch =3D fb->pitches[0];
> +	wb_frame_info->cpp =3D fb->format->cpp[0];
>  	crtc_state->wb_pending =3D true;
>  	spin_unlock_irq(&output->composer_lock);
>  	drm_writeback_queue_job(wb_conn, connector_state);


--Sig_/7eeQTTMg1nl296E4qGG.Osj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJf7RkACgkQI1/ltBGq
qqczjg//YMaqgN9ncP6248Ya1N30hM5Wh2I0dhwMezC+tL7bYhWhEcUQnfHqm3rK
+7d88JDwd3aYcxYVPrPn35N0FSUzOspExWyE42/48SUwJJ1NJplVEvv1yRX8zJkN
9JXz0ijs5UG0FZaygYANEVgmEpX/+b6mSF82iLfer45EbauC+vFDpBXjjUWrfAIP
EmGWO49v9alZsFMriFIbQ7wy1OvmbdTo46TJRYizpdXCcV1N7xAogIvlSa+Zr8H7
+td3PNyllQ9ryhEkXSfxGeFVskXQB0IdxgrHYWO5HztXdXT1za5YhZvN3V5I0pyC
SMM9TBevgdJCg3XFi3UKYONpU3k6M5pLFR0k49API5xKcvKX9xB5aJ1FcIohJe2A
pr2/0wSAky1AeejMgfJapK4L+2C1uibKKcu1Yiu1/F+Tp8vPhksQNrirf+I2/0NT
5Q31CXlcLMpZr5I1bIucibOLbN/n5m34tpKE7cjZn8jws5bcy3ATUZFof43y0uE2
ra+Nr3as3rsd0FuJa34sAbxePt/YWfku6DMAj3KOjasXghcxth9KWy+IY3yZPqpm
Rv1ei9bl1M/Oa7SZFl/4EoevwD6YROaWW99rdwgxhGzP62L09ybWUAwPdVFxaEaK
jPpbFo2BgKACHvB0n78t0/+x9dSdPcjQ5Oer3xMAOQFFs/scVrs=
=1sNu
-----END PGP SIGNATURE-----

--Sig_/7eeQTTMg1nl296E4qGG.Osj--

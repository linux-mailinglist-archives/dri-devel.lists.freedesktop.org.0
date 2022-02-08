Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0674AD576
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D185710E62E;
	Tue,  8 Feb 2022 10:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65410E630
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 10:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oHnoaldR/3ciiSudKMKmktNQKNMHaQ1xU9hdiHnGrGM=; b=sNCg5qwaFfiJIylYFVZexsTk9Q
 22shcaIGj8CvXygp99SdPNaxobH1pRsbk7JN5HtSGFRxJKTY5m6lM7z4QTZFgpZjLwiQrBRdVuWyp
 R+jq+x8ISxborpWUdyQZLlkbTD1WeFVDYY5ORdb4CTZOVsUV0jls92dewpzDg9MrVyZ/aEYHvKMeY
 J2YSoVnI8mV0zraXTlpDAA1uq8SKiyAJW18FdM2w4VM+zLgRurEY301czLDlM2DoBlW88QXOTCOtS
 RSxy3t2sgVOlESX3c7SxYXJNmEcMo4FAKomwbk3AyC4AC/pJw68sb9Xfeqbmwl0Xsev8TUrCVi/4o
 SvmnbxYg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nHNeB-00060Z-9d; Tue, 08 Feb 2022 11:22:55 +0100
Date: Tue, 8 Feb 2022 09:22:43 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Message-ID: <20220208102243.qhpu4nifyqdqlo6o@mail.igalia.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-6-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="77ioj3s43aysjc6y"
Content-Disposition: inline
In-Reply-To: <20220121213831.47229-6-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--77ioj3s43aysjc6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/21, Igor Torrente wrote:
> This commit is the groundwork to introduce new formats to the planes and
> writeback buffer. As part of it, a new buffer metadata field is added to
> `vkms_writeback_job`, this metadata is represented by the `vkms_composer`
> struct.
>=20
> This will allow us, in the future, to have different compositing and wb
> format types.
lgtm.

Reviewed-by: Melissa Wen <mwen@igalia.com>
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
> V2: Change the code to get the drm_framebuffer reference and not copy its
>     contents(Thomas Zimmermann).
>=20
> V3: Drop the refcount in the wb code(Thomas Zimmermann).
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
>  drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++------
>  drivers/gpu/drm/vkms/vkms_plane.c     | 10 +++++-----
>  drivers/gpu/drm/vkms/vkms_writeback.c | 20 +++++++++++++++++---
>  4 files changed, 30 insertions(+), 16 deletions(-)
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
> index 2e6342164bef..c850d755247c 100644
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
> @@ -36,6 +31,11 @@ struct vkms_frame_info {
>  	unsigned int cpp;
>  };
> =20
> +struct vkms_writeback_job {
> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> +	struct vkms_frame_info frame_info;
> +};
> +
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
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
>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->=
map));
> -	drm_framebuffer_get(&frame_info->fb);
> +	drm_framebuffer_get(frame_info->fb);
>  	frame_info->offset =3D fb->offsets[0];
>  	frame_info->pitch =3D fb->pitches[0];
>  	frame_info->cpp =3D fb->format->cpp[0];
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index 8694227f555f..de379331b236 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -75,12 +75,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_c=
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
> @@ -99,7 +102,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_c=
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
> @@ -116,14 +121,23 @@ static void vkms_wb_atomic_commit(struct drm_connec=
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
> --=20
> 2.30.2
>=20

--77ioj3s43aysjc6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmICRHMACgkQwqF3j0dL
ehzLFA/+Isjh6/IJtJmz/M0x49IQGKCtSCm/rxyF/44T1EdukUP2OHqKzCG/AVAI
aca/2SzyUeQ0RDFcqSgslZQhLACeUqMmY12Oz6m7fCDaMOq5rqE6rGpe9H+Tdprw
0uN7ZJ+Ix5/itiLLGtG0pNJ9vjlq7IuMQs1xgtAhvPB641Czz9pD9IzBuWD9MzbL
bshdqtdA6DTsOeE0FX9uvbYmLo6+xt+F0lcCyUPAh7ri1TeHrdM1XwRGhKfOkpDO
NURBLL9qV+fpLMtuQSPJ/YtJqhs+FlxixNqd1mAjJH0L7wgdHg/4ym4YCrSjViTF
+LkkL3O/g+9vb+jzXrtyHMyoeYwQBTX2Bf3RvHH4Ac7OtQVuNQZzarBR4DYfkZWk
P2Si8Em//cDYQ1zYcMLZgFBDsOY6c8zBYiRgJFo5z5n9meGdHDvISgB8eChAl+63
bqnbt2Mid7mEEFu8xGaKuzdlktvAgwi102JjdAs4he29bOHi1w2rcNc3vj6McjVt
ahllXOqUVd3F8mijEYcDOACiPs3CV1vSBl/BLBJbPlRlHKeW+dlH7kLWMpzOyutK
bRDv3Mk4jhSCQHS6/A+i+hJdyxLHamo5i0QS8ltzBOYCgCFU9ZXWin3fUyys35+p
gNu8rNyNeRRjVomQ8BIyRzQyS2h65LJAc61TUrV9DowWDoHsB/Q=
=yLu5
-----END PGP SIGNATURE-----

--77ioj3s43aysjc6y--

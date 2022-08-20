Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40059AD5F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 13:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A20E10E07A;
	Sat, 20 Aug 2022 11:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A09610E09F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Aug 2022 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3x4SqsPFwLcKJMXr7XVu7185xdAoAZc7fmX1G1ebEzE=; b=R2IvtHdqUGzsTbeLu3e7O5AEvs
 TkVSZRUuiX4jrRZBv+5upgXAPFPXE31XKabxoDCM+AzXgmY0gcIV7/53OutAoguRpRRcryZ/CKQp6
 FwdkJs8XWOk3K03xL7HGy5TYngRjUddC+bbzQjfJqazf7UolRNFSDRBWvlLKgyBvFNOZPBTqUnTWA
 s8TqqQHerrnuZ9LqTQjSKQP2QWGCECUKojJow4vlFGhB1E1c7mWg6iDX3E8VVJ8kDM/0vt5uEVPeh
 9/dSkA5kp4DFBsitGnI7fLRYM79tzjzVhBK4/sFgPjdqnD7x/gUKe+4F6fkNnpqlPZDtueh2JS8zj
 tFGDNmxw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oPMDy-00D06p-8O; Sat, 20 Aug 2022 13:01:06 +0200
Date: Sat, 20 Aug 2022 10:00:54 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [RESEND v6 2/9] drm: vkms: Rename `vkms_composer` to
 `vkms_frame_info`
Message-ID: <20220820110007.wk5wugdfpya4eb7w@mail.igalia.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
 <20220819182411.20246-3-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vydbsq5chdnxv47a"
Content-Disposition: inline
In-Reply-To: <20220819182411.20246-3-igormtorrente@gmail.com>
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
 leandro.ribeiro@collabora.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vydbsq5chdnxv47a
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="atyi5kh7yfwi5aad"
Content-Disposition: inline


--atyi5kh7yfwi5aad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/19, Igor Torrente wrote:
> Changes the name of this struct to a more meaningful name.
> A name that represents better what this struct is about.
>=20
> Composer is the code that do the compositing of the planes.
> This struct contains information on the frame used in the output
> composition. Thus, vkms_frame_info is a better name to represent
> this.
>=20
> V5: Fix a commit message typo(Melissa Wen).
>=20
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 87 ++++++++++++++--------------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  6 +-
>  drivers/gpu/drm/vkms/vkms_plane.c    | 38 ++++++------
>  3 files changed, 66 insertions(+), 65 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 775b97766e08..0aded4e87e60 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -11,11 +11,11 @@
>  #include "vkms_drv.h"
> =20
>  static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> -				 const struct vkms_composer *composer)
> +				 const struct vkms_frame_info *frame_info)
>  {
>  	u32 pixel;
> -	int src_offset =3D composer->offset + (y * composer->pitch)
> -				      + (x * composer->cpp);
> +	int src_offset =3D frame_info->offset + (y * frame_info->pitch)
> +					    + (x * frame_info->cpp);
> =20
>  	pixel =3D *(u32 *)&buffer[src_offset];
> =20
> @@ -26,24 +26,24 @@ static u32 get_pixel_from_buffer(int x, int y, const =
u8 *buffer,
>   * compute_crc - Compute CRC value on output frame
>   *
>   * @vaddr: address to final framebuffer
> - * @composer: framebuffer's metadata
> + * @frame_info: framebuffer's metadata
>   *
>   * returns CRC value computed using crc32 on the visible portion of
>   * the final framebuffer at vaddr_out
>   */
>  static uint32_t compute_crc(const u8 *vaddr,
> -			    const struct vkms_composer *composer)
> +			    const struct vkms_frame_info *frame_info)
>  {
>  	int x, y;
>  	u32 crc =3D 0, pixel =3D 0;
> -	int x_src =3D composer->src.x1 >> 16;
> -	int y_src =3D composer->src.y1 >> 16;
> -	int h_src =3D drm_rect_height(&composer->src) >> 16;
> -	int w_src =3D drm_rect_width(&composer->src) >> 16;
> +	int x_src =3D frame_info->src.x1 >> 16;
> +	int y_src =3D frame_info->src.y1 >> 16;
> +	int h_src =3D drm_rect_height(&frame_info->src) >> 16;
> +	int w_src =3D drm_rect_width(&frame_info->src) >> 16;
> =20
>  	for (y =3D y_src; y < y_src + h_src; ++y) {
>  		for (x =3D x_src; x < x_src + w_src; ++x) {
> -			pixel =3D get_pixel_from_buffer(x, y, vaddr, composer);
> +			pixel =3D get_pixel_from_buffer(x, y, vaddr, frame_info);
>  			crc =3D crc32_le(crc, (void *)&pixel, sizeof(u32));
>  		}
>  	}
> @@ -98,8 +98,8 @@ static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
>   * blend - blend value at vaddr_src with value at vaddr_dst
>   * @vaddr_dst: destination address
>   * @vaddr_src: source address
> - * @dst_composer: destination framebuffer's metadata
> - * @src_composer: source framebuffer's metadata
> + * @dst_frame_info: destination framebuffer's metadata
> + * @src_frame_info: source framebuffer's metadata
>   * @pixel_blend: blending equation based on plane format
>   *
>   * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
> @@ -111,33 +111,33 @@ static void x_blend(const u8 *xrgb_src, u8 *xrgb_ds=
t)
>   * pixel color values
>   */
>  static void blend(void *vaddr_dst, void *vaddr_src,
> -		  struct vkms_composer *dst_composer,
> -		  struct vkms_composer *src_composer,
> +		  struct vkms_frame_info *dst_frame_info,
> +		  struct vkms_frame_info *src_frame_info,
>  		  void (*pixel_blend)(const u8 *, u8 *))
>  {
>  	int i, j, j_dst, i_dst;
>  	int offset_src, offset_dst;
>  	u8 *pixel_dst, *pixel_src;
> =20
> -	int x_src =3D src_composer->src.x1 >> 16;
> -	int y_src =3D src_composer->src.y1 >> 16;
> +	int x_src =3D src_frame_info->src.x1 >> 16;
> +	int y_src =3D src_frame_info->src.y1 >> 16;
> =20
> -	int x_dst =3D src_composer->dst.x1;
> -	int y_dst =3D src_composer->dst.y1;
> -	int h_dst =3D drm_rect_height(&src_composer->dst);
> -	int w_dst =3D drm_rect_width(&src_composer->dst);
> +	int x_dst =3D src_frame_info->dst.x1;
> +	int y_dst =3D src_frame_info->dst.y1;
> +	int h_dst =3D drm_rect_height(&src_frame_info->dst);
> +	int w_dst =3D drm_rect_width(&src_frame_info->dst);
> =20
>  	int y_limit =3D y_src + h_dst;
>  	int x_limit =3D x_src + w_dst;
> =20
>  	for (i =3D y_src, i_dst =3D y_dst; i < y_limit; ++i) {
>  		for (j =3D x_src, j_dst =3D x_dst; j < x_limit; ++j) {
> -			offset_dst =3D dst_composer->offset
> -				     + (i_dst * dst_composer->pitch)
> -				     + (j_dst++ * dst_composer->cpp);
> -			offset_src =3D src_composer->offset
> -				     + (i * src_composer->pitch)
> -				     + (j * src_composer->cpp);
> +			offset_dst =3D dst_frame_info->offset
> +				     + (i_dst * dst_frame_info->pitch)
> +				     + (j_dst++ * dst_frame_info->cpp);
> +			offset_src =3D src_frame_info->offset
> +				     + (i * src_frame_info->pitch)
> +				     + (j * src_frame_info->cpp);
> =20
>  			pixel_src =3D (u8 *)(vaddr_src + offset_src);
>  			pixel_dst =3D (u8 *)(vaddr_dst + offset_dst);
> @@ -149,32 +149,33 @@ static void blend(void *vaddr_dst, void *vaddr_src,
>  	}
>  }
> =20
> -static void compose_plane(struct vkms_composer *primary_composer,
> -			  struct vkms_composer *plane_composer,
> +static void compose_plane(struct vkms_frame_info *primary_plane_info,
> +			  struct vkms_frame_info *plane_frame_info,
>  			  void *vaddr_out)
>  {
> -	struct drm_framebuffer *fb =3D &plane_composer->fb;
> +	struct drm_framebuffer *fb =3D &plane_frame_info->fb;
>  	void *vaddr;
>  	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> =20
> -	if (WARN_ON(iosys_map_is_null(&plane_composer->map[0])))
> +	if (WARN_ON(iosys_map_is_null(&primary_plane_info->map[0])))
^ here you are reintroducing an error that we were checking primary
plane repeatedly, instead of plane_composer (renamed to:
plane_frame_info here). The issue is fixed in a following patch of this
series when you decouple check_iosys_map.
But I don't mind fixing it before apply.

>  		return;
> =20
> -	vaddr =3D plane_composer->map[0].vaddr;
> +	vaddr =3D plane_frame_info->map[0].vaddr;
> =20
>  	if (fb->format->format =3D=3D DRM_FORMAT_ARGB8888)
>  		pixel_blend =3D &alpha_blend;
>  	else
>  		pixel_blend =3D &x_blend;
> =20
> -	blend(vaddr_out, vaddr, primary_composer, plane_composer, pixel_blend);
> +	blend(vaddr_out, vaddr, primary_plane_info,
> +	      plane_frame_info, pixel_blend);
>  }
> =20
>  static int compose_active_planes(void **vaddr_out,
> -				 struct vkms_composer *primary_composer,
> +				 struct vkms_frame_info *primary_plane_info,
>  				 struct vkms_crtc_state *crtc_state)
>  {
> -	struct drm_framebuffer *fb =3D &primary_composer->fb;
> +	struct drm_framebuffer *fb =3D &primary_plane_info->fb;
>  	struct drm_gem_object *gem_obj =3D drm_gem_fb_get_obj(fb, 0);
>  	const void *vaddr;
>  	int i;
> @@ -187,10 +188,10 @@ static int compose_active_planes(void **vaddr_out,
>  		}
>  	}
> =20
> -	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
> +	if (WARN_ON(iosys_map_is_null(&primary_plane_info->map[0])))
>  		return -EINVAL;
> =20
> -	vaddr =3D primary_composer->map[0].vaddr;
> +	vaddr =3D primary_plane_info->map[0].vaddr;
> =20
>  	memcpy(*vaddr_out, vaddr, gem_obj->size);
> =20
> @@ -199,8 +200,8 @@ static int compose_active_planes(void **vaddr_out,
>  	 * ((primary <- overlay) <- cursor)
>  	 */
>  	for (i =3D 1; i < crtc_state->num_active_planes; i++)
> -		compose_plane(primary_composer,
> -			      crtc_state->active_planes[i]->composer,
> +		compose_plane(primary_plane_info,
> +			      crtc_state->active_planes[i]->frame_info,
>  			      *vaddr_out);
> =20
>  	return 0;
> @@ -222,7 +223,7 @@ void vkms_composer_worker(struct work_struct *work)
>  						composer_work);
>  	struct drm_crtc *crtc =3D crtc_state->base.crtc;
>  	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> -	struct vkms_composer *primary_composer =3D NULL;
> +	struct vkms_frame_info *primary_plane_info =3D NULL;
>  	struct vkms_plane_state *act_plane =3D NULL;
>  	bool crc_pending, wb_pending;
>  	void *vaddr_out =3D NULL;
> @@ -250,16 +251,16 @@ void vkms_composer_worker(struct work_struct *work)
>  	if (crtc_state->num_active_planes >=3D 1) {
>  		act_plane =3D crtc_state->active_planes[0];
>  		if (act_plane->base.base.plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> -			primary_composer =3D act_plane->composer;
> +			primary_plane_info =3D act_plane->frame_info;
>  	}
> =20
> -	if (!primary_composer)
> +	if (!primary_plane_info)
>  		return;
> =20
>  	if (wb_pending)
>  		vaddr_out =3D crtc_state->active_writeback->data[0].vaddr;
> =20
> -	ret =3D compose_active_planes(&vaddr_out, primary_composer,
> +	ret =3D compose_active_planes(&vaddr_out, primary_plane_info,
>  				    crtc_state);
>  	if (ret) {
>  		if (ret =3D=3D -EINVAL && !wb_pending)
> @@ -267,7 +268,7 @@ void vkms_composer_worker(struct work_struct *work)
>  		return;
>  	}
> =20
> -	crc32 =3D compute_crc(vaddr_out, primary_composer);
> +	crc32 =3D compute_crc(vaddr_out, primary_plane_info);
> =20
>  	if (wb_pending) {
>  		drm_writeback_signal_completion(&out->wb_connector, 0);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 36fbab5989d1..5199c5f18e17 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -27,7 +27,7 @@ struct vkms_writeback_job {
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>  };
> =20
> -struct vkms_composer {
> +struct vkms_frame_info {
>  	struct drm_framebuffer fb;
>  	struct drm_rect src, dst;
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> @@ -39,11 +39,11 @@ struct vkms_composer {
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
> - * @composer: data required for composing computation
> + * @frame_info: data required for composing computation
>   */
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
> -	struct vkms_composer *composer;
> +	struct vkms_frame_info *frame_info;
>  };
> =20
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index d8eb674b49a6..fcae6c508f4b 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -24,20 +24,20 @@ static struct drm_plane_state *
>  vkms_plane_duplicate_state(struct drm_plane *plane)
>  {
>  	struct vkms_plane_state *vkms_state;
> -	struct vkms_composer *composer;
> +	struct vkms_frame_info *frame_info;
> =20
>  	vkms_state =3D kzalloc(sizeof(*vkms_state), GFP_KERNEL);
>  	if (!vkms_state)
>  		return NULL;
> =20
> -	composer =3D kzalloc(sizeof(*composer), GFP_KERNEL);
> -	if (!composer) {
> -		DRM_DEBUG_KMS("Couldn't allocate composer\n");
> +	frame_info =3D kzalloc(sizeof(*frame_info), GFP_KERNEL);
> +	if (!frame_info) {
> +		DRM_DEBUG_KMS("Couldn't allocate frame_info\n");
>  		kfree(vkms_state);
>  		return NULL;
>  	}
> =20
> -	vkms_state->composer =3D composer;
> +	vkms_state->frame_info =3D frame_info;
> =20
>  	__drm_gem_duplicate_shadow_plane_state(plane, &vkms_state->base);
> =20
> @@ -54,12 +54,12 @@ static void vkms_plane_destroy_state(struct drm_plane=
 *plane,
>  		/* dropping the reference we acquired in
>  		 * vkms_primary_plane_update()
>  		 */
> -		if (drm_framebuffer_read_refcount(&vkms_state->composer->fb))
> -			drm_framebuffer_put(&vkms_state->composer->fb);
> +		if (drm_framebuffer_read_refcount(&vkms_state->frame_info->fb))
> +			drm_framebuffer_put(&vkms_state->frame_info->fb);
>  	}
> =20
> -	kfree(vkms_state->composer);
> -	vkms_state->composer =3D NULL;
> +	kfree(vkms_state->frame_info);
> +	vkms_state->frame_info =3D NULL;
> =20
>  	__drm_gem_destroy_shadow_plane_state(&vkms_state->base);
>  	kfree(vkms_state);
> @@ -99,7 +99,7 @@ static void vkms_plane_atomic_update(struct drm_plane *=
plane,
>  	struct vkms_plane_state *vkms_plane_state;
>  	struct drm_shadow_plane_state *shadow_plane_state;
>  	struct drm_framebuffer *fb =3D new_state->fb;
> -	struct vkms_composer *composer;
> +	struct vkms_frame_info *frame_info;
> =20
>  	if (!new_state->crtc || !fb)
>  		return;
> @@ -107,15 +107,15 @@ static void vkms_plane_atomic_update(struct drm_pla=
ne *plane,
>  	vkms_plane_state =3D to_vkms_plane_state(new_state);
>  	shadow_plane_state =3D &vkms_plane_state->base;
> =20
> -	composer =3D vkms_plane_state->composer;
> -	memcpy(&composer->src, &new_state->src, sizeof(struct drm_rect));
> -	memcpy(&composer->dst, &new_state->dst, sizeof(struct drm_rect));
> -	memcpy(&composer->fb, fb, sizeof(struct drm_framebuffer));
> -	memcpy(&composer->map, &shadow_plane_state->data, sizeof(composer->map)=
);
> -	drm_framebuffer_get(&composer->fb);
> -	composer->offset =3D fb->offsets[0];
> -	composer->pitch =3D fb->pitches[0];
> -	composer->cpp =3D fb->format->cpp[0];
> +	frame_info =3D vkms_plane_state->frame_info;
> +	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
> +	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
> +	memcpy(&frame_info->fb, fb, sizeof(struct drm_framebuffer));
> +	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->=
map));
> +	drm_framebuffer_get(&frame_info->fb);
> +	frame_info->offset =3D fb->offsets[0];
> +	frame_info->pitch =3D fb->pitches[0];
> +	frame_info->cpp =3D fb->format->cpp[0];
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
> --=20
> 2.30.2
>=20

--atyi5kh7yfwi5aad--

--vydbsq5chdnxv47a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMAvuYACgkQwqF3j0dL
ehzcXg//etcoggfNrCzp1WkFsWNd2ABScRF/utmvfQr3EgUpwbYFTgnTgtM2zIAq
zRqU11o2b20IcnYYdH7LSfSl6spHnFJJGyG41CmM+I8/rdFhg2Wzh9BpmaA7dI1t
FHggvGYNqGTejzUlqwyhmumQa674W3vkjFmoT9Szp5gy0KK2Ggs0/jrWScEQm9xP
aBx122srIGmZ5DZMPkEeh3Fgn0x52pRVnWb2A6YF1aL/8D4dtRuZSRBwR2fypPYL
2B53EW2XNe+roGvTNLyCAurTxR1hE55PmKyIJp0ucb8I3xHp/TJ+L5AGAy80Is8n
E/rC0dRnx7Un8jx3pa+uUWErQ/TacSe0Ik8piYfy1IIPz0ZJQn2R+0bM24Jb1fq2
fTSlAdxJcrZhF5MvqGYClRM/AuMiBaBfbVnzFr39BHlKAaSOhQc7K14qe5xngvLV
CwiDkZk15f20rGF3RqO9FkpQjhbI/knuW0QwPhTBJoMF4Fj5F8r+R6FByufpyJVj
mTSQSN08RRxbogVEXOoY+dOV8QEIwxZ2mrx6ykt2QfD4Tq7qYI2ffTgsozz98+E8
CcxfgJxliliNkm7FBLSXNXPMnCXl43u8HP2yDfdnZS59e/IAOabPO1qF83wztJdz
v6znzwMYlyg/os5jAQ/4LOv14CCRGDSBnQIBwUgQnrY9geyQUII=
=Y9ck
-----END PGP SIGNATURE-----

--vydbsq5chdnxv47a--

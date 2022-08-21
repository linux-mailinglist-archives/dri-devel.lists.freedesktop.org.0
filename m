Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C359B6E6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 02:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7BA12BF4C;
	Sun, 21 Aug 2022 23:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430A812B05C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 23:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=df29iU17+uOaNJZ6FWrcG7m2l68QnBYecgCfpc0YCvM=; b=rRdX8TpUNgmuYA0g/8cNXARC3v
 0pxTz3Ls4Fm6gY81xslrCuj8VAxub/KV3ktL81sDBvUfjHAo1qKPYawaH8xDit9L45RScNuX+DOQA
 DFoM/tBxJ3uKXQstto9GYaZfPA74bkZXSHRyM7YfTZbE2sjL90sjpd893pYvZVOMFApiVFW4H5LJt
 tRC8wJubdttwYRV3hl14yr9GJVDPxh0kmNLzQ9nWejO0+NMOrgton1+gAH2Owj2V3X1XgmyUhNVrf
 9k/oya8mVmYAzzKt9fAmauUhhD6kbigiHd0F4tQP/AqizPCQJX0oNDrhHW/lhiEfwizawjlkqb3rD
 A+fBLGrg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oPuqv-00EGy3-Np; Mon, 22 Aug 2022 01:59:37 +0200
Date: Sun, 21 Aug 2022 22:59:18 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [RESEND v6 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Message-ID: <20220821235918.2ver4c2vzlcmkbaa@mail.igalia.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
 <20220819182411.20246-6-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b2scvek5xg4ouhod"
Content-Disposition: inline
In-Reply-To: <20220819182411.20246-6-igormtorrente@gmail.com>
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
 tales.aparecida@gmail.com, leandro.ribeiro@collabora.com,
 melissa.srw@gmail.com, ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--b2scvek5xg4ouhod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/19, Igor Torrente wrote:
> This commit is the groundwork to introduce new formats to the planes and
> writeback buffer. As part of it, a new buffer metadata field is added to
> `vkms_writeback_job`, this metadata is represented by the `vkms_frame_inf=
o`
> struct.
>=20
> Also adds two new function pointers (`line_to_frame_func` and
> `frame_to_line_func`) are defined to handle format conversion
> from/to internal format.
>=20
> A new internal format(`struct pixel_argb_u16`) is introduced to deal with
> all possible inputs. It consists of 16 bits fields that represent each of
> the channels.
>=20
> These things will allow us, in the future, to have different compositing
> and wb format types.
>=20
> V2: Change the code to get the drm_framebuffer reference and not copy its
>     contents (Thomas Zimmermann).
> V3: Drop the refcount in the wb code (Thomas Zimmermann).
> V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
>     and vkms_plane_state (Pekka Paalanen)
> V6: Improvements to some struct/struct members names (Pekka Paalanen).
>     Splits this patch in two (Pekka Paalanen).
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h       | 29 ++++++++++++++++++++++-----
>  drivers/gpu/drm/vkms/vkms_writeback.c | 20 +++++++++++++++---
>  2 files changed, 41 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 95d71322500b..0d407ec84f94 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -22,11 +22,6 @@
> =20
>  #define NUM_OVERLAY_PLANES 8
> =20
> -struct vkms_writeback_job {
> -	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> -	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> -};
> -
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
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
> +(*line_to_frame_func)(struct vkms_frame_info *frame_info,
> +		      const struct line_buffer *buffer, int y);
> +
> +typedef void
> +(*frame_to_line_func)(struct line_buffer *buffer,
> +		      const struct vkms_frame_info *frame_info, int y);

Checkpatch complains about this two new typedefs. In fact, I think a
better approach is to move line_to_frame_func as a element of struct
vkms_writeback_job and frame_to_line_func to vkms_plane_state and the
return type of get functions as void *, accordingly.

That said, now I think is better to send a next version that rebases,
corrects the iosys_map (an issue that I mentioned before) and addresses
this typedef issue. Also, you can already add my r-b in the next
version.

Thanks,

Melissa
> +
> +struct vkms_writeback_job {
> +	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> +	struct vkms_frame_info wb_frame_info;
> +	line_to_frame_func wb_write;
> +};
> +
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
> @@ -44,6 +62,7 @@ struct vkms_frame_info {
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> +	frame_to_line_func plane_read;
>  };
> =20
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index 250e509a298f..c87f6c89e7b4 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -74,12 +74,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_c=
onnector *wb_connector,
>  	if (!vkmsjob)
>  		return -ENOMEM;
> =20
> -	ret =3D drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
> +	ret =3D drm_gem_fb_vmap(job->fb, vkmsjob->wb_frame_info.map, vkmsjob->d=
ata);
>  	if (ret) {
>  		DRM_ERROR("vmap failed: %d\n", ret);
>  		goto err_kfree;
>  	}
> =20
> +	vkmsjob->wb_frame_info.fb =3D job->fb;
> +	drm_framebuffer_get(vkmsjob->wb_frame_info.fb);
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
> +	drm_gem_fb_vunmap(job->fb, vkmsjob->wb_frame_info.map);
> +
> +	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
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
> +	wb_frame_info =3D &active_wb->wb_frame_info;
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

--b2scvek5xg4ouhod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMCxtAACgkQwqF3j0dL
ehxw4w//dacwRGNqMP7CQYA02rP7jn+m858QeIZjTFWJLc7Hf272az1yioyHC61V
VXZUETDNpTfuEXINedDzNM/ROQk3wq+Gv/vWsEAKMD4NoLPgCBRV0ZKsDWTeyYS8
Ls6nTb9ylTJF33hAa0/fwPIW+UuIbqdcCFvEjRNTyBJtzQJ6P55tQz26aaQG3Sp6
YgXJP+eWqUFuyV4fZ5wfIF1bZEYO4tjuoyHQ6DKTj1mZDFf9K9Bh/NPPkw58jtql
AB2SJ30OlU/vpow5TYeLCI7K9h7SgsycLSwGwpai/WnXfkkKkTi82Sw+J0m3HBSR
+hHxUO7SRg2aI0ctBj11fu6xRpGXD7N3DL03rzqtoPOT4kCiVIMjj70fbm36/IzT
wEDYd1LheWmgrTbHkOrWcfL960slbp4KYJPaksyukIVXRLu3dotEypjU56Ek2Lys
fe7yBOZyzyvm0aO0peukH/dncoAosMFfDZBahWy4Osk20uy5fUYwFMkTER+oBoHK
bYQnABUrRy43w51Xx9gNDkSAE0jQki4B40nD5FtTFcIDjUS6lW03rEqawvWTPps7
6eq1ffP9IyDfYDznLaw+h3Cvqn3FWktjiHJeF17q2CbVGq32ZF0h6X+Yn6usoGEj
zL7CTQD7qMRZLhoMcUrIydegD97qVnHaz9ALupQPB4LevlRgHzw=
=jCI1
-----END PGP SIGNATURE-----

--b2scvek5xg4ouhod--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84C9DAA9E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9F710EB29;
	Wed, 27 Nov 2024 15:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ML4RfZJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4041210EB2E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:19:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A0E08A438C4;
 Wed, 27 Nov 2024 15:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA03C4CECC;
 Wed, 27 Nov 2024 15:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732720757;
 bh=PDP6M3iB3HkWPpxiPD4WO5+rYWAXmQLYqVob4tX5ZfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ML4RfZJtLjYbrhikhSpSD64w/JN4lUN8mBDRWtBnj4M3W538OaPiGZaFwKY75GKw0
 zDNgorJNgHk0l2bpgM6zNOVVNqRp3eB/C3MRtmpuwg0b5JAw+BrGm9TT02o26dfahH
 DnyxZe5GMGNH178wmj3oTouDk6sZjRrf7wYMQKbO9b8pnf/8TbiCtYWG6N7y5yxRYJ
 pRXjVFklXiPNEsUh8HAZ37ceDp0peViePmPtuqIWI+bdlad0uoUBoHPd2E05g1YH7T
 M1Dj7SRIG1Ivsbw8IppIPnwEe9fFE7Dy0cRLlewcbHxx1cT/Togp4TNPbcLJ1HQT8T
 pMM9n4DzNuU5Q==
Date: Wed, 27 Nov 2024 16:19:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/vkms: Switch to dynamic allocation for CRTC
Message-ID: <20241127-fennec-of-magic-spirit-bcfcc5@houat>
References: <20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com>
 <20241122-b4-vkms-allocated-v2-3-ff7bddbf0bfb@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kztmkcguwyxpegsy"
Content-Disposition: inline
In-Reply-To: <20241122-b4-vkms-allocated-v2-3-ff7bddbf0bfb@bootlin.com>
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


--kztmkcguwyxpegsy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/4] drm/vkms: Switch to dynamic allocation for CRTC
MIME-Version: 1.0

Hi,

On Fri, Nov 22, 2024 at 05:35:11PM +0100, Louis Chauvet wrote:
> specific allocation for the CRTC is not strictly necessary at this point,
> but in order to implement dynamic configuration of VKMS (configFS), it
> will be easier to have one allocation per CRTC.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

This one should probably be split further, there's several things going
on right now.

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 32 +++++++++++++++++------------=
---
>  drivers/gpu/drm/vkms/vkms_drv.h       |  9 +++++----
>  drivers/gpu/drm/vkms/vkms_output.c    | 26 +++++++++++++++-----------
>  drivers/gpu/drm/vkms/vkms_writeback.c | 17 +++++++++--------
>  4 files changed, 46 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index ace8d293f7da611110c1e117b6cf2f3c9e9b4381..d014dec117e7d4ec7e9e38037=
a4a4cb4bc6be4ca 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -84,9 +84,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *=
crtc,
>  				      int *max_error, ktime_t *vblank_time,
>  				      bool in_vblank_irq)
>  {
> -	struct drm_device *dev =3D crtc->dev;
> -	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
> -	struct vkms_output *output =3D &vkmsdev->output;
> +	struct vkms_output *output =3D drm_crtc_to_vkms_output(crtc);
>  	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
> =20
>  	if (!READ_ONCE(vblank->enabled)) {
> @@ -279,25 +277,29 @@ static void vkms_crtc_destroy_workqueue(struct drm_=
device *dev,
>  	destroy_workqueue(vkms_out->composer_workq);
>  }
> =20
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor)
> +struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_pl=
ane *primary,
> +				   struct drm_plane *cursor)
>  {
> -	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_output *vkms_out;
> +	struct drm_crtc *crtc;
>  	int ret;
> =20
> -	ret =3D drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> -					 &vkms_crtc_funcs, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init CRTC\n");
> -		return ret;
> +	vkms_out =3D drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
> +					       primary, cursor,
> +					       &vkms_crtc_funcs, NULL);
> +	if (IS_ERR(vkms_out)) {
> +		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
> +		return vkms_out;
>  	}
> =20
> +	crtc =3D &vkms_out->crtc;
> +
>  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> =20
>  	ret =3D drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
>  	if (ret) {
>  		DRM_ERROR("Failed to set gamma size\n");
> -		return ret;
> +		return ERR_PTR(ret);
>  	}
> =20
>  	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> @@ -307,12 +309,12 @@ int vkms_crtc_init(struct drm_device *dev, struct d=
rm_crtc *crtc,
> =20
>  	vkms_out->composer_workq =3D alloc_ordered_workqueue("vkms_composer", 0=
);
>  	if (!vkms_out->composer_workq)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
> =20
>  	ret =3D drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
>  				       vkms_out);
>  	if (ret)
> -		return ret;
> +		return ERR_PTR(ret);
> =20
> -	return ret;
> +	return vkms_out;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 19fd99b8e506c4454d7878b67f692a0441c22665..fbe7de67fb9c6a6a6964d71b4=
52b9a3ce573e0f8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -214,7 +214,6 @@ struct vkms_config {
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> -	struct vkms_output output;
>  	const struct vkms_config *config;
>  };
> =20
> @@ -241,8 +240,9 @@ struct vkms_device {
>   * @primary: primary plane to attach to the CRTC
>   * @cursor: plane to attach to the CRTC
>   */
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
> +struct vkms_output *vkms_crtc_init(struct drm_device *dev,
> +				   struct drm_plane *primary,
> +				   struct drm_plane *cursor);

You also need to update the doc.

Maxime

--kztmkcguwyxpegsy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0c4cgAKCRAnX84Zoj2+
duemAX92vtHSUEQ3IsVnAEqPNEcZCn5Y/hzSZ5XcpkcT6jZtGSKiIryldM0Hn0uu
6+gTwrABgOp1wBbdQYVRUGvd+JQtdOfnbgwir+4gF8+1K20IdrQ9iCgjbLPMvMR0
kSi0PgJGzg==
=heCp
-----END PGP SIGNATURE-----

--kztmkcguwyxpegsy--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705E36AF6F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 10:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D426E523;
	Mon, 26 Apr 2021 08:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EDC6E516
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 08:07:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id 12so86660653lfq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=jYu1Yrfku7Ee6V8Q74M53VO7n4n7OYYQE3Z8eL9yVmU=;
 b=aKhy0RyleqPYkcLTtIlR1zY+YKRg6TJ1CpGHuNG8E9F9EVh5VYIVwfbbpBCNSUaZv1
 4ohvSZaxBLzK2qcpgthWSRHZQ3aFxDfN5gbh0UlJt/TZ1OnlpHCsLwyokosHCD6d8kUo
 IyxIzWkZB2dTvvQ4D4S5KbDpGYwREY6ZB1Mmzi7RyJoROywodvzwOyvx2t763ZUWCBrr
 XnwM9LWGk6HLgFOfQTCkTtf+X9U1mKNqeJoUyZSLTlDyS+WC5Nq3xbYNxBsir4u389sP
 LqyhltthMdg3hRM5mVR0zmrEmE5Yi0BYjTcSbcOgcP7MwX3iPATOihBioGVys1ULaqOF
 /zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=jYu1Yrfku7Ee6V8Q74M53VO7n4n7OYYQE3Z8eL9yVmU=;
 b=ChJ/ZTdPvW2DVEBj9vq87mKb/OW+3VS8dlSuCJd/hiD15OPUuIR/peTIENgcE8w3CA
 /l5U8pJ6G3gMS5w2rC5cq5RRwSfWr2zxXALN3FeXE6q8LqfFvhprei9hbPAlT6VPl0nV
 8SXdvjB4fuOcd2SbcfUG+kmGISOyKwWFjOZenRdMGGW86R65oNfdwUBxi0poIx0o2+0o
 6hCY0mLC3lGxrwFPSb0mumkMSG33D4tiby3W8X5P6h02uAeRhUtJKzBvireU3SV2rOPC
 b1ptr54yN1YyYnwdcn3DVmPYDwa0LyZ5FTqabv03bVm/QftpDfHgWCCBi/HxFGrRowQI
 PPgA==
X-Gm-Message-State: AOAM531UUgbl0gTp0GIe8yH0az8IMClnZxD++BKmkXSOMNE/pytEESxn
 vmpeotL44oVxqVP6yFRI6LE=
X-Google-Smtp-Source: ABdhPJx3mQv8B4pxCSjYLFkiF1wBA4BrPg+GJT14Xc41YhB7fXb4pfN+B8uPJFvjo9yx8jZLLcRVNg==
X-Received: by 2002:a05:6512:3094:: with SMTP id
 z20mr12513994lfd.354.1619424427840; 
 Mon, 26 Apr 2021 01:07:07 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n15sm1327937lfh.237.2021.04.26.01.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 01:07:07 -0700 (PDT)
Date: Mon, 26 Apr 2021 11:07:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v4 4/4] drm/vkms: add overlay support
Message-ID: <20210426110704.7cde8c1a@eldfell>
In-Reply-To: <8261bf93d8a0e3ffaf81d8e7c9b3e9c229116be3.1619250933.git.melissa.srw@gmail.com>
References: <cover.1619250933.git.melissa.srw@gmail.com>
 <8261bf93d8a0e3ffaf81d8e7c9b3e9c229116be3.1619250933.git.melissa.srw@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1649962386=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1649962386==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Oi2/AIvfCNK0.HfvvhG35Ml"; protocol="application/pgp-signature"

--Sig_/Oi2/AIvfCNK0.HfvvhG35Ml
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 24 Apr 2021 05:26:10 -0300
Melissa Wen <melissa.srw@gmail.com> wrote:

> Add support to overlay plane, in addition to primary and cursor
> planes. In this approach, the plane composition still requires an
> active primary plane and planes are composed associatively in the
> order: (primary <- overlay) <- cursor
>=20
> It enables to run the following IGT tests successfully:
> - kms_plane_cursor:
>   - pipe-A-[overlay, primary, viewport]-size-[64, 128, 256]
> - kms_atomic:
>   - plane-overlay-legacy
> and preserves the successful execution of kms_cursor_crc,
> kms_writeback and kms_flip
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Hi,

just curious, when you need to compute a CRC without having a writeback
connector output, where do you write the blended result in order to
compute CRC?


Thanks,
pq

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++----------
>  drivers/gpu/drm/vkms/vkms_drv.c      |  5 +++++
>  drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
>  drivers/gpu/drm/vkms/vkms_output.c   | 11 ++++++++++-
>  drivers/gpu/drm/vkms/vkms_plane.c    | 15 ++++++++++++---
>  5 files changed, 45 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 7e01bc39d2a1..1b510f3dbcbf 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -176,11 +176,12 @@ static void compose_plane(struct vkms_composer *pri=
mary_composer,
> =20
>  static int compose_active_planes(void **vaddr_out,
>  				 struct vkms_composer *primary_composer,
> -				 struct vkms_composer *cursor_composer)
> +				 struct vkms_crtc_state *crtc_state)
>  {
>  	struct drm_framebuffer *fb =3D &primary_composer->fb;
>  	struct drm_gem_object *gem_obj =3D drm_gem_fb_get_obj(fb, 0);
>  	struct drm_gem_shmem_object *shmem_obj =3D to_drm_gem_shmem_obj(gem_obj=
);
> +	int i;
> =20
>  	if (!*vaddr_out) {
>  		*vaddr_out =3D kzalloc(shmem_obj->base.size, GFP_KERNEL);
> @@ -195,8 +196,14 @@ static int compose_active_planes(void **vaddr_out,
> =20
>  	memcpy(*vaddr_out, shmem_obj->vaddr, shmem_obj->base.size);
> =20
> -	if (cursor_composer)
> -		compose_plane(primary_composer, cursor_composer, *vaddr_out);
> +	/* If there are other planes besides primary, we consider the active
> +	 * planes should be in z-order and compose them associatively:
> +	 * ((primary <- overlay) <- cursor)
> +	 */
> +	for (i =3D 1; i < crtc_state->num_active_planes; i++)
> +		compose_plane(primary_composer,
> +			      crtc_state->active_planes[i]->composer,
> +			      *vaddr_out);
> =20
>  	return 0;
>  }
> @@ -218,7 +225,7 @@ void vkms_composer_worker(struct work_struct *work)
>  	struct drm_crtc *crtc =3D crtc_state->base.crtc;
>  	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
>  	struct vkms_composer *primary_composer =3D NULL;
> -	struct vkms_composer *cursor_composer =3D NULL;
> +	struct vkms_plane_state *act_plane =3D NULL;
>  	bool crc_pending, wb_pending;
>  	void *vaddr_out =3D NULL;
>  	u32 crc32 =3D 0;
> @@ -242,11 +249,11 @@ void vkms_composer_worker(struct work_struct *work)
>  	if (!crc_pending)
>  		return;
> =20
> -	if (crtc_state->num_active_planes >=3D 1)
> -		primary_composer =3D crtc_state->active_planes[0]->composer;
> -
> -	if (crtc_state->num_active_planes =3D=3D 2)
> -		cursor_composer =3D crtc_state->active_planes[1]->composer;
> +	if (crtc_state->num_active_planes >=3D 1) {
> +		act_plane =3D crtc_state->active_planes[0];
> +		if (act_plane->base.plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +			primary_composer =3D act_plane->composer;
> +	}
> =20
>  	if (!primary_composer)
>  		return;
> @@ -255,7 +262,7 @@ void vkms_composer_worker(struct work_struct *work)
>  		vaddr_out =3D crtc_state->active_writeback;
> =20
>  	ret =3D compose_active_planes(&vaddr_out, primary_composer,
> -				    cursor_composer);
> +				    crtc_state);
>  	if (ret) {
>  		if (ret =3D=3D -EINVAL && !wb_pending)
>  			kfree(vaddr_out);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 2173b82606f6..027ffe759440 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -44,6 +44,10 @@ static bool enable_writeback =3D true;
>  module_param_named(enable_writeback, enable_writeback, bool, 0444);
>  MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector s=
upport");
> =20
> +static bool enable_overlay;
> +module_param_named(enable_overlay, enable_overlay, bool, 0444);
> +MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> +
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
> =20
>  static void vkms_release(struct drm_device *dev)
> @@ -198,6 +202,7 @@ static int __init vkms_init(void)
> =20
>  	config->cursor =3D enable_cursor;
>  	config->writeback =3D enable_writeback;
> +	config->overlay =3D enable_overlay;
> =20
>  	return vkms_create(config);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 70fb79621617..ac8c9c2fa4ed 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -89,6 +89,7 @@ struct vkms_device;
>  struct vkms_config {
>  	bool writeback;
>  	bool cursor;
> +	bool overlay;
>  	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index 6979fbc7f821..04406bd3ff02 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -39,7 +39,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int i=
ndex)
>  	struct drm_connector *connector =3D &output->connector;
>  	struct drm_encoder *encoder =3D &output->encoder;
>  	struct drm_crtc *crtc =3D &output->crtc;
> -	struct vkms_plane *primary, *cursor =3D NULL;
> +	struct vkms_plane *primary, *cursor =3D NULL, *overlay =3D NULL;
>  	int ret;
>  	int writeback;
> =20
> @@ -47,6 +47,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int =
index)
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
> =20
> +	if (vkmsdev->config->overlay) {
> +		overlay =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> +		if (IS_ERR(overlay))
> +			return PTR_ERR(overlay);
> +
> +		if (!overlay->base.possible_crtcs)
> +			overlay->base.possible_crtcs =3D drm_crtc_mask(crtc);
> +	}
> +
>  	if (vkmsdev->config->cursor) {
>  		cursor =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
>  		if (IS_ERR(cursor))
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index da4251aff67f..107521ace597 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -133,7 +133,7 @@ static int vkms_plane_atomic_check(struct drm_plane *=
plane,
>  	if (IS_ERR(crtc_state))
>  		return PTR_ERR(crtc_state);
> =20
> -	if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +	if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
>  		can_position =3D true;
> =20
>  	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> @@ -200,14 +200,23 @@ struct vkms_plane *vkms_plane_init(struct vkms_devi=
ce *vkmsdev,
>  	const u32 *formats;
>  	int nformats;
> =20
> -	if (type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> +	switch (type) {
> +	case DRM_PLANE_TYPE_PRIMARY:
> +		formats =3D vkms_formats;
> +		nformats =3D ARRAY_SIZE(vkms_formats);
> +		funcs =3D &vkms_primary_helper_funcs;
> +		break;
> +	case DRM_PLANE_TYPE_CURSOR:
> +	case DRM_PLANE_TYPE_OVERLAY:
>  		formats =3D vkms_plane_formats;
>  		nformats =3D ARRAY_SIZE(vkms_plane_formats);
>  		funcs =3D &vkms_primary_helper_funcs;
> -	} else {
> +		break;
> +	default:
>  		formats =3D vkms_formats;
>  		nformats =3D ARRAY_SIZE(vkms_formats);
>  		funcs =3D &vkms_primary_helper_funcs;
> +		break;
>  	}
> =20
>  	plane =3D drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 <<=
 index,


--Sig_/Oi2/AIvfCNK0.HfvvhG35Ml
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCGdKgACgkQI1/ltBGq
qqe/ohAAs/bp9c+mCWpjwM2W3vBCjHtjKefyr+6Y3EKSYWcya0QV+C/2aFg/go8A
lD5QAYkf7Tech+vgiYNETLBhMAXvq2aSx2r9JKLd4HtFjtQXLDP5Et+jzFYPZxJf
vWXs5Tg+UM15Sj6KSAv4iQQM5j5eqyglCDcn63LLV3K1s9pUCNnwjRsWZd8fVaS2
BaIev0D5t/z+0EIJbVUhsg0zaSCARrLpfbkTHp81EIWkBrGl4XxthEy0+Ls0piXJ
tyz/XMBcgo6E7+cOX+4i4PKXhgXURyWiy1QC6vH8RCE/LaFzV4TmIugiypiA9HZ7
MvhE0MF23IAfdbXr6HzdFtxn7fuVidlpehXoR/iH6WV1Ly3JOVp2iizSQaek22wl
JoTeqV/os+4XFgddgXK/HhG5tdaEBjphkRmsYsEOku8VthtXovQRvZ4fK+hVfnQ3
crVoontsTUMe+CXe6nwi/JmHF3X0VCWdzoESi2xxRoEBC1zZTa4FFn0zczoFPrEO
qfXzT15/esfHzH3pe7Pzyv8+SGSYFgIqZs8pPLyvuqeafTo8ZcuJp1piEXpVRbck
jk7WmsRT/guz/Ho3t1atUvxkqD9dN4vVNBNiQi6hTb1qB0egzCJUcOlW1VHGJOjE
lMVGuV7g2Fl2+bgI3fSXQm19gB1Li4C1WgbAU5Wa8JY5AaDb0gc=
=h6+j
-----END PGP SIGNATURE-----

--Sig_/Oi2/AIvfCNK0.HfvvhG35Ml--

--===============1649962386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1649962386==--

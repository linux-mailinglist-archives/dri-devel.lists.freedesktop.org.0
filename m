Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C5973F6C7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666A410E2B8;
	Tue, 27 Jun 2023 08:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D727110E2B8;
 Tue, 27 Jun 2023 08:18:08 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b69923a715so37469531fa.0; 
 Tue, 27 Jun 2023 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687853887; x=1690445887;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aDcwtD5dUb123KopR26bdwMl9ONuprOUqM+yKdmN9c0=;
 b=jlQ2gQvxDhLs4c6oIgDQwYGRKdEaNxEKomPDk+ORI695SBCXAN7+x9dJPD4KB/DbRL
 Z3kAjQbrwlrMXqs7Ga1mkzJb4/Wc9p3dyqyXW/6kfrqqr/PXofvB64g039xyPICBhnoS
 9PhII/bi7WRpn9xE9QR7NXOFQf4jDa9jJd60QDW/XPRYSjDkA33z2djuxx98sfSl9ihL
 CFdcLcIKd66KU9THV1moDZnK/liFunO0LPv5wVkIJH9jEjDRr3CBvqVVv+fpIeODSx2h
 iztz8E4lzamSEBOewzj/BaGoUO2qU+Er9/kExQmSgOEkdzugAjk+Ik2n9caA0VRuyzyn
 8CoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687853887; x=1690445887;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aDcwtD5dUb123KopR26bdwMl9ONuprOUqM+yKdmN9c0=;
 b=jm9BQ5yUPDYhwWl7F2Mm4CWQ1UjYn0+E6vFshhW7udsUC+kqFN6BaNcudZztbluvNF
 KFy5YSlnWAKdYUnT3wtkxdxgnlP6QzNnFk5+DUAVWe0Ovo4IX0hCLgXibt2l3kFrRa5x
 XC9vRALypBYegMxVXcFU9ndZB4Pv5qn5ROhbXvMV4EQ+xwVnsYnh60gVZWcBJzRShxZm
 dsg+otoOCsI123noVLR2m4oTkojdjq+ophXxB8YaAW1TO4cwHupRzCu48f9RAObAavVx
 A7iCMndHw94k4x+z+0DuIx6ZTxR9DyjQSPDGXMgnOcwSgxy5x/hF994AjBdozplNel7Z
 hwwA==
X-Gm-Message-State: AC+VfDwK4cRTgrHenhGQDXjzFvHL3v2G8la5PKKZQulyJMF18gEgR4S4
 rmMuF1cdttC0cysPR7A5OPA=
X-Google-Smtp-Source: ACHHUZ5FLZn8rqUWAkxdQHm9Ebkb03Lru6KLXrl+NbgOJY0YeaeLuRriQGlPrQ27n31tEWDBOTG6HQ==
X-Received: by 2002:a2e:6a07:0:b0:2b5:7fba:18ac with SMTP id
 f7-20020a2e6a07000000b002b57fba18acmr15598565ljc.48.1687853886640; 
 Tue, 27 Jun 2023 01:18:06 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y13-20020a2e9d4d000000b002b69b44fd52sm1282062ljj.5.2023.06.27.01.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:18:06 -0700 (PDT)
Date: Tue, 27 Jun 2023 11:18:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v3 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Message-ID: <20230627111802.4953a3ae@eldfell>
In-Reply-To: <20230627035839.496399-2-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-2-zack@kde.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dn7NARskuHFZfslN0/I+jRo";
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 banackm@vmware.com, javierm@redhat.com, krastevm@vmware.com,
 spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org, iforbes@vmware.com,
 virtualization@lists.linux-foundation.org, mombasawalam@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/dn7NARskuHFZfslN0/I+jRo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jun 2023 23:58:32 -0400
Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Cursor planes on virtualized drivers have special meaning and require
> that the clients handle them in specific ways, e.g. the cursor plane
> should react to the mouse movement the way a mouse cursor would be
> expected to and the client is required to set hotspot properties on it
> in order for the mouse events to be routed correctly.
>=20
> This breaks the contract as specified by the "universal planes". Fix it
> by disabling the cursor planes on virtualized drivers while adding
> a foundation on top of which it's possible to special case mouse cursor
> planes for clients that want it.
>=20
> Disabling the cursor planes makes some kms compositors which were broken,
> e.g. Weston, fallback to software cursor which works fine or at least
> better than currently while having no effect on others, e.g. gnome-shell
> or kwin, which put virtualized drivers on a deny-list when running in
> atomic context to make them fallback to legacy kms and avoid this issue.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 681e7ec73044 ("drm: Allow userspace to ask for universal plane lis=
t (v2)")

Sounds good to me.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq



> Cc: <stable@vger.kernel.org> # v5.4+
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_plane.c          | 13 +++++++++++++
>  drivers/gpu/drm/qxl/qxl_drv.c        |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c  |  2 +-
>  include/drm/drm_drv.h                |  9 +++++++++
>  include/drm/drm_file.h               | 12 ++++++++++++
>  7 files changed, 38 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..a4a39f4834e2 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -678,6 +678,19 @@ int drm_mode_getplane_res(struct drm_device *dev, vo=
id *data,
>  		    !file_priv->universal_planes)
>  			continue;
> =20
> +		/*
> +		 * If we're running on a virtualized driver then,
> +		 * unless userspace advertizes support for the
> +		 * virtualized cursor plane, disable cursor planes
> +		 * because they'll be broken due to missing cursor
> +		 * hotspot info.
> +		 */
> +		if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR &&
> +		    drm_core_check_feature(dev, DRIVER_CURSOR_HOTSPOT)	&&
> +		    file_priv->atomic &&
> +		    !file_priv->supports_virtualized_cursor_plane)
> +			continue;
> +
>  		if (drm_lease_held(file_priv, plane->base.id)) {
>  			if (count < plane_resp->count_planes &&
>  			    put_user(plane->base.id, plane_ptr + count))
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index b30ede1cf62d..91930e84a9cd 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -283,7 +283,7 @@ static const struct drm_ioctl_desc qxl_ioctls[] =3D {
>  };
> =20
>  static struct drm_driver qxl_driver =3D {
> -	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC | DRIV=
ER_CURSOR_HOTSPOT,
> =20
>  	.dumb_create =3D qxl_mode_dumb_create,
>  	.dumb_map_offset =3D drm_gem_ttm_dumb_map_offset,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxv=
ideo/vbox_drv.c
> index 4fee15c97c34..8ecd0863fad7 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -172,7 +172,7 @@ DEFINE_DRM_GEM_FOPS(vbox_fops);
> =20
>  static const struct drm_driver driver =3D {
>  	.driver_features =3D
> -	    DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	    DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC | DRIVER_CURSOR_HOTSPOT,
> =20
>  	.fops =3D &vbox_fops,
>  	.name =3D DRIVER_NAME,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virti=
o/virtgpu_drv.c
> index a7ec5a3770da..8f4bb8a4e952 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -176,7 +176,7 @@ static const struct drm_driver driver =3D {
>  	 * If KMS is disabled DRIVER_MODESET and DRIVER_ATOMIC are masked
>  	 * out via drm_device::driver_features:
>  	 */
> -	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIV=
ER_ATOMIC,
> +	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIV=
ER_ATOMIC | DRIVER_CURSOR_HOTSPOT,
>  	.open =3D virtio_gpu_driver_open,
>  	.postclose =3D virtio_gpu_driver_postclose,
> =20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 8b24ecf60e3e..d3e308fdfd5b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1611,7 +1611,7 @@ static const struct file_operations vmwgfx_driver_f=
ops =3D {
> =20
>  static const struct drm_driver driver =3D {
>  	.driver_features =3D
> -	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM,
> +	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_CU=
RSOR_HOTSPOT,
>  	.ioctls =3D vmw_ioctls,
>  	.num_ioctls =3D ARRAY_SIZE(vmw_ioctls),
>  	.master_set =3D vmw_master_set,
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index b77f2c7275b7..8303016665dd 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -104,6 +104,15 @@ enum drm_driver_feature {
>  	 * acceleration should be handled by two drivers that are connected usi=
ng auxiliary bus.
>  	 */
>  	DRIVER_COMPUTE_ACCEL            =3D BIT(7),
> +	/**
> +	 * @DRIVER_CURSOR_HOTSPOT:
> +	 *
> +	 * Driver supports and requires cursor hotspot information in the
> +	 * cursor plane (e.g. cursor plane has to actually track the mouse
> +	 * cursor and the clients are required to set hotspot in order for
> +	 * the cursor planes to work correctly).
> +	 */
> +	DRIVER_CURSOR_HOTSPOT           =3D BIT(8),
> =20
>  	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
> =20
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 966912053cb0..91cf7f452f86 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -228,6 +228,18 @@ struct drm_file {
>  	 */
>  	bool is_master;
> =20
> +	/**
> +	 * @supports_virtualized_cursor_plane:
> +	 *
> +	 * This client is capable of handling the cursor plane with the
> +	 * restrictions imposed on it by the virtualized drivers.
> +	 *
> +	 * This implies that the cursor plane has to behave like a cursor
> +	 * i.e. track cursor movement. It also requires setting of the
> +	 * hotspot properties by the client on the cursor plane.
> +	 */
> +	bool supports_virtualized_cursor_plane;
> +
>  	/**
>  	 * @master:
>  	 *


--Sig_/dn7NARskuHFZfslN0/I+jRo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSamzoACgkQI1/ltBGq
qqev5w//bf7LGYapeDrkT7Kx5Wn2+3er1WUXQw0qS2wzQsju36GQD0vreWuKNiK+
try/OSwHPEUFxwlsaBJ97ovqnb+P8EvxLHVe2Qa2feOoKgVY/HO5JvZiDMUT6ZIp
gBH4UHeAdfpTIOyiI67Ru7qtWjsGZGamhyYBaD9JC7Qm2oRIBxCbCUBHvWmrvSG/
HOzjY0u5CFFtsB1F6TttosUBXwLuGn3FRKp/7KgiBXUR5Q9rKW0r5ncmxRyVLV8H
w5pOjD4BpAnJwvI78Yr/xaoM3+Wty4adawDysKOPA+OGXCWvRh+EkQ25kIXlms9Y
USqq9qGP03dtAKiSjg+CkjYK2PCOPys17xsTFMSWCWU4byuJ0sF6V/S1ckpai2hz
EMLPq/s3MBpWzX4ZeTAq3s4GkIbLeNgW4u1G2EeqG+obWEL7Y3fNGi4/G4BJr6Ue
zYGL4XRMAyCQTtPSr7eXHbW5j2xQxUPWYgPFwgISyeBePxcWqov9IG+gulZOMSOj
2q27CTVIjfYYKztU3JCyRxS8PTamoiDgo/7H+GqTBNRu9eOliapmp2Yo4atVXvE7
p8BBogtHMTPzXpgVoR6NoKThHsTXBo4oC7w0ttQYoDSS811/b/xza4ptScBSqkxL
1IIafFLBw5n/eBrJnQY8D2qaJR6Pj96fr8zB5to46EYwYdKpPXg=
=wBza
-----END PGP SIGNATURE-----

--Sig_/dn7NARskuHFZfslN0/I+jRo--

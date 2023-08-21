Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1A97825CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 10:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECA510E150;
	Mon, 21 Aug 2023 08:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358F610E150
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 08:49:56 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A2CCA6607033;
 Mon, 21 Aug 2023 09:49:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692607794;
 bh=PUmxT93lOOVUqxLbjiylhwoZal4cx83WD9LxN2kyqaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J3FNo9xgPnE6uHN2ThWVmCr8LTvNlTkZE7joHdaVBRVE2HdhwHmRO4azTDcNe2mDA
 hHTNA8CLAiwX2NokhnSQMbVDWQ7PXes24guwLJZKiou0FYOmXXT1UvpRUZ4O8mkDz6
 h5ikKrmZ0ayfe98GmB/GGyUuih5sCoWRRzKGx3JwJds4iFmErDra5Wnc0s4EfxEYIT
 fkzKJ0a5qv+byrzl6Bj+KyH0DIFdTADyOiudZqbQRZHh7vlIXG0gd8o/h0AMu7b1US
 K1c4HnpVGSgBMYNWDHADS/awT7Loi7RR7oaaPJBDiYUNZfQKkQDGrbV3CKiX3P85Is
 bT3yRhPsohfAw==
Date: Mon, 21 Aug 2023 11:49:43 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: document DRM_IOCTL_MODE_CREATE_DUMB
Message-ID: <20230821114943.5899aab9.pekka.paalanen@collabora.com>
In-Reply-To: <20230803100041.387404-1-contact@emersion.fr>
References: <20230803100041.387404-1-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q.iL7T/5BQz6qFd_IX5HuSg";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/q.iL7T/5BQz6qFd_IX5HuSg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Aug 2023 10:00:44 +0000
Simon Ser <contact@emersion.fr> wrote:

> The main motivation is to repeat that dumb buffers should not be
> abused for anything else than basic software rendering with KMS.
> User-space devs are more likely to look at the IOCTL docs than to
> actively search for the driver-oriented "Dumb Buffer Objects"
> section.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  Documentation/gpu/drm-kms.rst |  2 ++
>  include/uapi/drm/drm.h        | 15 +++++++++++++++
>  include/uapi/drm/drm_mode.h   | 16 ++++++++++++++--
>  3 files changed, 31 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index c92d425cb2dd..ca9210e47266 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -360,6 +360,8 @@ Format Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
>     :export:
> =20
> +.. _kms_dumb_buffer_objects:
> +
>  Dumb Buffer Objects
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 863e47200911..625dba7ddbfe 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1128,6 +1128,21 @@ extern "C" {
>  #define DRM_IOCTL_MODE_PAGE_FLIP	DRM_IOWR(0xB0, struct drm_mode_crtc_pag=
e_flip)
>  #define DRM_IOCTL_MODE_DIRTYFB		DRM_IOWR(0xB1, struct drm_mode_fb_dirty_=
cmd)
> =20
> +/**
> + * DRM_IOCTL_MODE_CREATE_DUMB - Create a new dumb buffer object.
> + *
> + * KMS dumb buffers provide a very primitive way to allocate a buffer ob=
ject
> + * suitable for scanout and map it for software rendering. KMS dumb buff=
ers are
> + * not suitable for hardware-accelerated rendering nor video decoding. K=
MS dumb
> + * buffers are not suitable to be displayed without KMS. Also see
> + * :ref:`kms_dumb_buffer_objects`.
> + *
> + * The IOCTL argument is a struct drm_mode_create_dumb.
> + *
> + * User-space is expected to create a KMS dumb buffer via this IOCTL, th=
en add
> + * it as a KMS framebuffer via &DRM_IOCTL_MODE_ADDFB and map it via
> + * &DRM_IOCTL_MODE_MAP_DUMB.
> + */
>  #define DRM_IOCTL_MODE_CREATE_DUMB DRM_IOWR(0xB2, struct drm_mode_create=
_dumb)
>  #define DRM_IOCTL_MODE_MAP_DUMB    DRM_IOWR(0xB3, struct drm_mode_map_du=
mb)
>  #define DRM_IOCTL_MODE_DESTROY_DUMB    DRM_IOWR(0xB4, struct drm_mode_de=
stroy_dumb)
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 92d96a2b6763..8a7e747f0564 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1029,13 +1029,25 @@ struct drm_mode_crtc_page_flip_target {
>  	__u64 user_data;
>  };
> =20
> -/* create a dumb scanout buffer */
> +/**
> + * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
> + * @height: buffer height in pixels
> + * @width: buffer width in pixels
> + * @bpp: bits per pixel
> + * @flags: must be zero
> + * @handle: buffer object handle
> + * @pitch: number of bytes between two consecutive lines
> + * @size: size of the whole buffer in bytes
> + *
> + * User-space fills @height, @width, @bpp and @flags. If the IOCTL succe=
eds,
> + * the kernel fills @handle, @pitch and @size.
> + */
>  struct drm_mode_create_dumb {
>  	__u32 height;
>  	__u32 width;
>  	__u32 bpp;
>  	__u32 flags;
> -	/* handle, pitch, size will be returned */
> +
>  	__u32 handle;
>  	__u32 pitch;
>  	__u64 size;

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Should there be a mention of DRM_CAP_DUMB_PREFER_SHADOW at the ioctl
doc too?

DRM_CAP_DUMB_BUFFER?
DRM_CAP_DUMB_PREFERRED_DEPTH?


Thanks,
pq

--Sig_/q.iL7T/5BQz6qFd_IX5HuSg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTjJScACgkQI1/ltBGq
qqdzYg//bNc3i+CfPWyw/7gssGAyTMvdZcnR8NIY0yOE+fEr4NTJHN1kH+vba8Ar
f5vP780Qo9zwgi+Z3Vy7B2+WnFMS+ycMh7zwy/joxJofzfed/LIrJu2sMB+45wP0
sYe7t9PVMiuB4EpHkSKIISCB4ZCVOtSMHu8vrIcu3z4UdXl+ILR9P9BSbepUMZRL
k4L7xPVVb4P2MM9uc5/EPuhZxUGxyl5F9xd3XgpwQ+zt980SxhQn57CvgYjN7vEK
gD5Kin0RPNDTupdtad+PwUXlKdIAC58bdMhusScMYj0lIQvcFiEE0TdlbSAPn7eJ
/F1WZCsz5vx0nhQV20iGD6ZTHpjTiZOD6b8V4eoitawX8LyCExUFy3lt5WquGVSP
aitjlgjwbJ7+lOi6EyHsiv3lUGjWlTNAmyc/7OI+iqlBlH+K9B7PpT9eB9J/veVi
19cf3O/tbYeMs2l4Kl6UT2K5ld60lplR2+SR5bz/8JBL1AitvhKLj6Djn4fXQY3m
c3FX+Fm9ZVfSxicxOyb4Lv9dgjsuNtQxEqeYGmxT+nMDYS+SZWY0TyXr5ogDhrK0
R7dQQThy0aysKLKiC+RQt2JgtQzOrg3KgpFT3SzOWWshcX6Gs4G5aMawPAGrUHOh
aT7+yA5s3SwrDyJcPmCC6zKjOliKHBBYS97mPFl21GMRICdQk+o=
=tdrA
-----END PGP SIGNATURE-----

--Sig_/q.iL7T/5BQz6qFd_IX5HuSg--

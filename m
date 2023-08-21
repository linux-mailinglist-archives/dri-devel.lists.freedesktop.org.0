Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A56782BFA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784C610E089;
	Mon, 21 Aug 2023 14:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2373510E089
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 14:36:31 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 924766606F57;
 Mon, 21 Aug 2023 15:36:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692628589;
 bh=zRRaqeDqB7rTEkcgZaw3Zt2lttCucfB1ROFQ1cX8Lpw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cbzu8UJ62NjzquVzsimQNIabvFjCcXBDKIHZ6FUaKho17a5YZ/naWhWt4WRkwgss1
 37MGgjX6MlT9GWXViE0qfa9czlLDej3TYKD81pGHrIk2ICZCy34ZUuaq2qrBewWQSZ
 G6hIlRwErneybKlzwRi+0Ij04Y83aa+1kQyPlrS6epY+1PXGV1DAsCfyzcNLx2L8BK
 d65IV5AI7LYuf1PAvLe/NmdmL2cThghF8f57BRnVv5bI+ETvOrd9jlEuC4+5Xerknh
 Y0Vl0HGhoQlYPJhmqI46NZMkC0QZGr2x/D7Qd7lr8b57ymcCp+iA+Dp2B4It4AjByQ
 Pdi/n2ti4kEhg==
Date: Mon, 21 Aug 2023 17:36:19 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/doc: document DRM_IOCTL_MODE_CREATE_DUMB
Message-ID: <20230821173619.00573e18.pekka.paalanen@collabora.com>
In-Reply-To: <20230821131548.269204-1-contact@emersion.fr>
References: <20230821131548.269204-1-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vL4.2oFvz+t5eBrW0XXvlFw";
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

--Sig_/vL4.2oFvz+t5eBrW0XXvlFw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Aug 2023 13:15:56 +0000
Simon Ser <contact@emersion.fr> wrote:

> The main motivation is to repeat that dumb buffers should not be
> abused for anything else than basic software rendering with KMS.
> User-space devs are more likely to look at the IOCTL docs than to
> actively search for the driver-oriented "Dumb Buffer Objects"
> section.
>=20
> v2: reference DRM_CAP_DUMB_BUFFER, DRM_CAP_DUMB_PREFERRED_DEPTH and
> DRM_CAP_DUMB_PREFER_SHADOW (Pekka)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  Documentation/gpu/drm-kms.rst |  2 ++
>  include/uapi/drm/drm.h        | 19 +++++++++++++++++++
>  include/uapi/drm/drm_mode.h   | 16 ++++++++++++++--
>  3 files changed, 35 insertions(+), 2 deletions(-)

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

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
> index 794c1d857677..7683c3f23a9b 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1134,6 +1134,25 @@ extern "C" {
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
> + *
> + * &DRM_CAP_DUMB_BUFFER indicates whether this IOCTL is supported.
> + * &DRM_CAP_DUMB_PREFERRED_DEPTH and &DRM_CAP_DUMB_PREFER_SHADOW indicate
> + * driver preferences for dumb buffers.
> + */
>  #define DRM_IOCTL_MODE_CREATE_DUMB DRM_IOWR(0xB2, struct drm_mode_create=
_dumb)
>  #define DRM_IOCTL_MODE_MAP_DUMB    DRM_IOWR(0xB3, struct drm_mode_map_du=
mb)
>  #define DRM_IOCTL_MODE_DESTROY_DUMB    DRM_IOWR(0xB4, struct drm_mode_de=
stroy_dumb)
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index ea1b639bcb28..128d09138ceb 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1032,13 +1032,25 @@ struct drm_mode_crtc_page_flip_target {
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


--Sig_/vL4.2oFvz+t5eBrW0XXvlFw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTjdmMACgkQI1/ltBGq
qqeo0g/+IHGmrLTfndSW7F4oeKq9E9/a3rR6xNytOdjpq3m0kASbqVOX8Qi6zTIu
wqqLC4LjEpuXo7MkdSFfIPDnMxEFCK9xLmLy73jcHZcJsf8DnWtI4PwyYDJNSRfT
GV6OLkcNUI/5hUc8CGkRIdisGt3rlVg4rMI4LVcBWqe1jj2vf1J0wc7Obchmsl/d
K5Hj2aZkn+bW5b6Ob5NHUv4lGOgxlSFWqgRClvinauOuEG0GyYFKrR98bX4uq7DW
38He+rhZXiW7sU4D98hP6tXuUh0u+9qA6OTKocKu7szN5CZbl1GrsRjTfUmP5Sz0
+aOFos9WVSsuPvOTg/In1XDIW7ax9A76EqruK2zorVZ2vtbti4WMAyf46IdVXpVm
6pPA/YwDzUlYoNDpyUGBELc5kmdGL9PWJh2mo/5WjR91ZyHU4TVSCHsGlBSelBww
Sd6LU7WeKv+dzWVjkQ/UfDGOHFwZzhy/V8rc27ToUJUbo1M1YY7VRa/WY3ht1RY0
tCYgadaMsaI5MXCg8Q8TLy8MdcuYtc8yuINsfbcsUgkI4A9290Zw4E/bTxWC9fKb
UJDNgqSu3y2euRlaH04nE0Xvn6NucMGUhMR/SlFmLgBAVLYTfZl3MBGR9IsXyNFn
6kJo3IMPBZZJfw1QDGizwDbu23uKrnxY//okZVn97dfhXGqctdM=
=my5e
-----END PGP SIGNATURE-----

--Sig_/vL4.2oFvz+t5eBrW0XXvlFw--

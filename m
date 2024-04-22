Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1158ACFE2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AA2112B9E;
	Mon, 22 Apr 2024 14:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LIT12U2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502AB112B9D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713797365;
 bh=ANj2lwCdF1e5x2y4t0N/qQl7GamrLnoXCuiQ6qmUnRY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LIT12U2Zq14xHhLBBEFLI3q7TtVSuT5LClXc3jRoXLYcGysNofNq+4bVb7DGFVdW5
 gmkl/GC4N8wLiF7FZam1KRR2JU5Xdgq22S0DN26y+yqLI0BSlli+QJLAaUTpBYwPlX
 Od0bl5TEOTS5ssCX7zEZ34xMuqqeRSlj3wWXDx9ny7zjCTAXxi+dWX40ZyY7X/1iVW
 DHiWjAqvavUKVCKNgJAPHm2rA7+zgpTv/7FC2t+2y1t/Shho2at5p3wyl71gKFDXT2
 /4vRYPTecym8dYkA/ICimmg0B2LduSRBnqVBP6PYTTH1MgudjyOQLhvtyi7Zcf6oEl
 UOt2zg26FYf0g==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8888E3782123;
 Mon, 22 Apr 2024 14:49:24 +0000 (UTC)
Date: Mon, 22 Apr 2024 17:49:22 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, arthurgrillo@riseup.net, Jonathan Corbet
 <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v6 13/17] drm/vkms: Add range and encoding properties to
 the plane
Message-ID: <20240422174922.6bac5683.pekka.paalanen@collabora.com>
In-Reply-To: <20240409-yuv-v6-13-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
 <20240409-yuv-v6-13-de1c5728fd70@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4k48lEW_QdEbCmFp+XKPuuC";
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

--Sig_/4k48lEW_QdEbCmFp+XKPuuC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Apr 2024 15:25:31 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> From: Arthur Grillo <arthurgrillo@riseup.net>
>=20
> Now that the driver internally handles these quantization ranges and YUV
> encoding matrices, expose the UAPI for setting them.
>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet: retained only relevant parts, updated the commit message]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c   | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 2d7445a3de93..a294744d29d6 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -238,7 +238,7 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(con=
st u16 *pixel)
>  static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8=
 channel_2,
>  						  const struct conversion_matrix *matrix)
>  {
> -	u8 r, g, b;
> +	u16 r, g, b;
>  	s64 fp_y, fp_channel_1, fp_channel_2;
>  	s64 fp_r, fp_g, fp_b;

This part belongs in the previous patch.

Otherwise,

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index d4e375913122..8f764a108b00 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -218,5 +218,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_devic=
e *vkmsdev,
>  	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
>  					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
> =20
> +	drm_plane_create_color_properties(&plane->base,
> +					  BIT(DRM_COLOR_YCBCR_BT601) |
> +					  BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> +					  DRM_COLOR_YCBCR_BT601,
> +					  DRM_COLOR_YCBCR_FULL_RANGE);
> +
>  	return plane;
>  }
>=20


--Sig_/4k48lEW_QdEbCmFp+XKPuuC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYmePMACgkQI1/ltBGq
qqePdxAAl9TTUVJlL6mpTRB9D+p6M0JTBNIqCo7ZbrR/n8GcWTvxguqpClJgxXIy
AXd/N5WYaKqf0Rrs5JefeD8inQ2yFWIv5lwjw4Kph0QzsBstnUGrSoONLG9aLQNq
SxUyE24TFz1jRH6H7Frthvv/8QebFoyaAMP9YBFDC6R7/8DJIoEAJPAoe/0F3oQw
Z5Lje7gyIaNNHDUjHxmJMCp3eSnW3N6nzA9hc0lynnkj3YdP3pjFYLkujGJ7kKPU
LOsxer8hzVOMu+5BkBIfHnqrHB/a3klSA0ar77ylJ+I4aEiFz9q4ESoVIVV2ya1P
iuvhZN1AVM9owHTrxoLOZBSzo0zuEOS7xoTZKGBH55i++DTm8yE+1fOfKQmjMioM
+NIDmHQNvtF2wV95+T0htxqJ6HnsIE56XqZPSzjmISHzrhLY3Ve2JgMp8uFoO0ZG
ty9ScqQRHdLDr3g60T4v4nWV3T72WRrile48VQ+lwtg0Tqo68Y0LzKgxbg94DU2D
rmIDNuSK+AeUySRP8xQ+dIij7NBQ7BqHCx+ZVpnvF+oSI4Pd/+51I9iVKcfkCO4b
vfezyqJwGERRo4W8nJZ0lH3cyQEzVmBQcsIxQZkfVIo5jqwE+XefAJtVkM3uudWv
jy7rswGSNevz/hZ55S0mIy/Vs279I65kvCWyP/63oBGzvlLKKDI=
=db9e
-----END PGP SIGNATURE-----

--Sig_/4k48lEW_QdEbCmFp+XKPuuC--

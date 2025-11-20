Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E68C72CC3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 09:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6345410E71B;
	Thu, 20 Nov 2025 08:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hVsZM3g3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682D010E71F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763626998;
 bh=J4+6h3UskvD1xY8ha/PXYhJqowKDNYktCAEVEyV01sw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hVsZM3g3SAXiIH0/AzEZnL0b/7o/gVkfooqQc8KhC748OH/FmaAp2rsesWe5oK1H7
 sP2w52R49CZ0qvqPovcgnhUNHttwM9Dc9SaNUy43EpTXby9cVu2ngsf9IA3zuwfhet
 93IzJOgxI0Q+oghLIJhxiUEStiCJDyp+aESlRFAvA8Mc05HaY1jwqqEK+mm1zROO1c
 2husMJ/sapu9vuy82LU5WKaxI9jvlg5EcR9HhWHj+7IIpEV27CxOo84zqAGfLeXk8W
 lrdMea8AY2wp3MmRrUQ8Ze9sWsJItOOaaxMkaySTpxSELgZyVg4bzqoRKb39mLA3aR
 nZA09M9RmAqSw==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 430E117E0117;
 Thu, 20 Nov 2025 09:23:18 +0100 (CET)
Date: Thu, 20 Nov 2025 10:22:58 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko
 <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
Message-ID: <20251120102258.0c7103da@eldfell>
In-Reply-To: <20251001-xilinx-formats-v6-4-014b076b542a@ideasonboard.com>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
 <20251001-xilinx-formats-v6-4-014b076b542a@ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qZnLldddO.m=+W4r=X_Y_v4";
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

--Sig_/qZnLldddO.m=+W4r=X_Y_v4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 01 Oct 2025 16:22:16 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
> 32-bit container.
>=20
> The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
> packed, A - 10 (as in 0xA), 4 - 4 bytes.
>=20
> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 1 +
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index a39b9d7a5b62..0d222f6c1a30 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -388,6 +388,9 @@ const struct drm_format_info *__drm_format_info(u32 f=
ormat)
>  		{ .format =3D DRM_FORMAT_XV20,		.depth =3D 0,  .num_planes =3D 2,
>  		  .char_per_block =3D { 4, 8, 0 }, .block_w =3D { 3, 3, 0 }, .block_h =
=3D { 1, 1, 0 },
>  		  .hsub =3D 2, .vsub =3D 1, .is_yuv =3D true },
> +		{ .format =3D DRM_FORMAT_Y10_P32,		.depth =3D 0,  .num_planes =3D 1,
> +		  .char_per_block =3D { 4, 0, 0 }, .block_w =3D { 3, 0, 0 }, .block_h =
=3D { 1, 0, 0 },
> +		  .hsub =3D 1, .vsub =3D 1, .is_yuv =3D true },
>  	};
> =20
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index a08f900ea2c3..4754bb48e4c3 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -469,6 +469,7 @@ extern "C" {
>   */
> =20
>  #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only =
*/
> +#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:=
Y2:Y1:Y0 2:10:10:10 little endian */
> =20
>  /*
>   * Format Modifiers:
>=20

Hi,

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/qZnLldddO.m=+W4r=X_Y_v4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmkez+IACgkQI1/ltBGq
qqeJMQ/+MJxuBnhoV1r1k4w31593kPdJG4Ha9INxg9yaQuYnT+HFZ98eYSyPgQLi
93RhCuQepdqIqaSENdD9WOfvGlum9CrufbvPyC5aSxz4m7JNgNdvbhIO1F2O0keZ
v3UiHlOAqsOqRKKX+FDwc4pLvN5eIp9AHLLw7AyluhqmwhEHTnGu5re/e+4iHUBP
IeyOFRTozdlZhy7qc7JxJkRC+78eE1QTWy5QV2tC4GrwUaXDrmhOUvpEUneKCPRp
4RcTWKvHdpeZ9RvSf4mDhq/FSGQsL7X/abLHY7f5AY3RoMk9Eg/h8WnmeVt3u8C4
1vR96pA+2nCXlFuVdS6YZjivCF5ZsUsM0X2Ez4+B1JBjJzzM7eHaKNNd0mVVplk/
JEsOUX9ZquAydqdfq0sK7KzwnM5CMAuOzcCWqv4mT6AHLgthfab8KEUzTb2Dkk5z
1MVYXlcNRUB+fJzNIYrrJnS7TNd95m6PnD0IcEJiZRJRU5pHr6FZNi4j0k+RQycf
w3Kedoh2eFhegXEnjfzFo9Tg34EIWQNWBoejfkCNds4PDnE2VcAH1ylktBuqGgsL
FCr7a6POW8mCYrfrVJKzeFiuBUlqIr0FVvZz35Ga72FUAaffVH50dpO7UP0ELx9e
1zWAepdCUNrcIB4+oesjvJx0nF4NxnGkgjH03mRhOIVEzCOJrTg=
=UJZ2
-----END PGP SIGNATURE-----

--Sig_/qZnLldddO.m=+W4r=X_Y_v4--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1876AA1368C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 10:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DAA10E90D;
	Thu, 16 Jan 2025 09:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="D/0PMgwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1722 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jan 2025 09:25:39 UTC
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BAF10E90D;
 Thu, 16 Jan 2025 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hcSBGQUuwLRsQmfD0tmlwNle5S75KZC7hJN7wq6KXnI=; b=D/0PMgwSMtDGChoMr4j+tpoIxU
 Zh20HwMed32AyYBRakasiZHnF0ri1L9BuC4DRgqMhHIebYCH7l23XfCxKKbyhY+1dmm3/hW1zRNOr
 uxq7gc4s4hjby2xnOj68hi61E8tEZOzQ0Paofbe/QPtCD7hzAqqpoBEVueNSFAOBaChGiIXE/vXVU
 7N6tpjUYmmv65FmO1C3BNa/E/jHEHPcVsHQj2fjWp550kflXjrZ/r6g2ATyA8wZIdLwBZHLxYZvez
 rVgsW3i83uB+/Jm49pENdRjuPgpEjNUCgxi3RtEmy+UfZRGJV/9utzyuMcKbYLJmu4V7D4IY2Nh8w
 Oi5OK/Zw==;
Received: from [91.154.21.62] (port=60309 helo=tisha)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tYLgO-0003Q1-0O;
 Thu, 16 Jan 2025 10:56:56 +0200
Date: Thu, 16 Jan 2025 10:56:22 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Alex Hung <alex.hung@amd.com>, <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [V7 31/45] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Message-ID: <20250116105622.577533fc@tisha>
In-Reply-To: <20241220043410.416867-32-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-32-alex.hung@amd.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NPZAZe5HHyM6nT/FUNNbYUh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/NPZAZe5HHyM6nT/FUNNbYUh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Dec 2024 21:33:37 -0700
Alex Hung <alex.hung@amd.com> wrote:

> From: Harry Wentland <harry.wentland@amd.com>
>=20
> The BT.709 and BT.2020 OETFs are the same, the only difference
> being that the BT.2020 variant is defined with more precision
> for 10 and 12-bit per color encodings.
>=20
> Both are used as encoding functions for video content, and are
> therefore defined as OETF (opto-electronic transfer function)
> instead of as EOTF (electro-optical transfer function).
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

Hi,

why would a display system ever use BT.2020 or BT.709 OETF or its
inverse?


Thanks,
pq


> ---
>  drivers/gpu/drm/drm_colorop.c |  2 ++
>  include/drm/drm_colorop.h     | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index f3391602a577..665b23900cc0 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type=
_enum_list[] =3D {
>  static const char * const colorop_curve_1d_type_names[] =3D {
>  	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
>  	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] =3D "sRGB Inverse EOTF",
> +	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] =3D "BT.2020 Inverse OETF",
> +	[DRM_COLOROP_1D_CURVE_BT2020_OETF] =3D "BT.2020 OETF",
>  	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] =3D "PQ 125 EOTF",
>  	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] =3D "PQ 125 Inverse EOTF",
>  };
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 4084a7438032..83a6bd64d48a 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -55,6 +55,25 @@ enum drm_colorop_curve_1d_type {
>  	 */
>  	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
> =20
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
> +	 *
> +	 * The inverse of &DRM_COLOROP_1D_CURVE_BT2020_OETF
> +	 */
> +	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
> +
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE_BT2020_OETF:
> +	 *
> +	 * The BT.2020/BT.709 transfer function. The BT.709 and BT.2020
> +	 * transfer functions are the same, the only difference is that
> +	 * BT.2020 is defined with more precision for 10 and 12-bit
> +	 * encodings.
> +	 *
> +	 *
> +	 */
> +	DRM_COLOROP_1D_CURVE_BT2020_OETF,
> +
>  	/**
>  	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
>  	 *
> --=20
> 2.43.0
>=20

--Sig_/NPZAZe5HHyM6nT/FUNNbYUh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmeIybYACgkQI1/ltBGq
qqfnfw//W9q/8g6DryKRpFkKwGBtFMQwmBtoA6knJ4opEDmuDUdT2ChyvmV++jq5
VcElNW/z/YLUQQulYplwDFwGIBOWXyUBLUSUcC0c8erL/ULovTzHdwEiMoeIc375
jAel2+FG+17nlYS2dzrN0FO8Xpi/d3qNDPMUX0sAk3oRMvmd4SiLgtj+n45rp3W/
gBJdXbh85GX+0+Ums0FFV7WcmPawSMU7lsp2/VhAJr1JuFqnb23qUUmbTkqOwMZg
b7kVsaNJLzemUxAF8GSH1uJ1AtbzY0aCzw3fA8ZzpY3WTF1HYrIf/liruaCvuuBT
qwBBgRmXBB9qWeiQtBS3HrjHQzN+sC9H6IwOfO4WVYFBG2mZJlYkGt11KyXUeGyO
gQ74k68AJLAGcpSdRPBbWLySxznmEmIank5alPMNMoictiekTxcRFwG5tYUmcOvT
U4Ls3GsBQSDknZbI+9DFZt0Uu8rIQK9pqA4nW9qu/uIwlOnD+h1Vq4+GBgF01b6L
WCh7EEbWjSHncYf3LQ/8TEL8/1fiX4bfnPe8UhILtKpxqdYwgE+Pi4kMJGm9Q9du
6LVznAfvsUqaDcrb9gQmvaRaoZ6TQ2Ha6Qr5n5z0QpscC6UpHN91vL8AQlNnZ9QU
pb4sWVYxtPNYn9cWQhmrLpSkLj8x/gXw/faluIjxnjkWGt4haU8=
=S8zm
-----END PGP SIGNATURE-----

--Sig_/NPZAZe5HHyM6nT/FUNNbYUh--

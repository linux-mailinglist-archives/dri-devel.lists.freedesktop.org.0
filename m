Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140C1EFF25
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 19:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3AB6E951;
	Fri,  5 Jun 2020 17:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BFA6E951
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 17:37:05 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eda825d0001>; Fri, 05 Jun 2020 10:35:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 05 Jun 2020 10:37:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 05 Jun 2020 10:37:04 -0700
Received: from localhost (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 5 Jun 2020 17:36:57 +0000
Date: Fri, 5 Jun 2020 19:36:54 +0200
From: Thierry Reding <treding@nvidia.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 3/3] drm/mipi: use dcs write for
 mipi_dsi_dcs_set_tear_scanline
Message-ID: <20200605173654.GB1265773@ulmo>
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <20200505160329.2976059-3-emil.l.velikov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200505160329.2976059-3-emil.l.velikov@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.13.1 (2019-12-14)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591378525; bh=jGoNJqUUwOzlIFu6yEov4zuQI353VgaWZAKWkyEYRgY=;
 h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
 MIME-Version:In-Reply-To:X-NVConfidentiality:User-Agent:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Disposition;
 b=hyM0en11CvkZFOadImy+v0PjMjRZ/VCexP8Kmbx29hUMKw1c6cZRYRDrDEZaaRo/Q
 4PO+pfORmUrmC6XwalkhBSCu8SO8sHS4Cx6lmSNIq08xmE8mZqISb9y1dw94G0qMys
 7r/axdnUODix3P4WSTSC+SqUygzsM4SDJvOYGcdj2k8U+B+WDbbmxj4aVrKCUVrSXP
 mFAKkGFQZakJ1NcSrTV/4qFoXbIcy0U+bSPVrnhFlti3nI9e/b31Ug+B1BBgzUmlAG
 0uRm+rlJ1gUqGd6iKngqaRjVXXRC/ogV0Rjv6aHin0tkpRgf0hd2PJdgI//704342e
 yGrK9sLwXzKfA==
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
Cc: Robert Chiras <robert.chiras@nxp.com>, Vinay Simha BN <simhavcs@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0145477053=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0145477053==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline

--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2020 at 05:03:29PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
>=20
> The helper uses the MIPI_DCS_SET_TEAR_SCANLINE, although it's currently
> using the generic write. This does not look right.
>=20
> Perhaps some platforms don't distinguish between the two writers?

I don't think platforms usually care about this level of detail. The
Tegra driver for example doesn't really look at the packet type and just
packets the data in the standard DSI format and then sends it off on the
bus. It does inspect some fields of the packet, but none that are
related to the packet type, I think.

So it's possible that the panel will accept the packet irrespective of
type and handle it correctly. I can imagine that the decoding logic in
these panels might be rather primitive, so perhaps it's not very strict
as to what exactly the type is as long as it can do something with the
data.

In any case, it does make sense to send DCS commands using the DCS type,
so I'd say let's merge this and see if somebody complains:

Reviewed-by: Thierry Reding <treding@nvidia.com>

> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Fixes: e83950816367 ("drm/dsi: Implement set tear scanline")
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> Robert, can you please test this against the only user - the Raydium
> RM67191 panel driver that you introduced.
>=20
> Thanks
>=20
> Vinay, can you confirm if this is a genuine typo or there's something
> really subtle happening.
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index b96d5b4629d7..07102d8da58f 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -1082,11 +1082,11 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_pixel_format);
>   */
>  int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16 scan=
line)
>  {
> -	u8 payload[3] =3D { MIPI_DCS_SET_TEAR_SCANLINE, scanline >> 8,
> -			  scanline & 0xff };
> +	u8 payload[2] =3D { scanline >> 8, scanline & 0xff };
>  	ssize_t err;
> =20
> -	err =3D mipi_dsi_generic_write(dsi, payload, sizeof(payload));
> +	err =3D mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_TEAR_SCANLINE, payload,
> +				 sizeof(payload));
>  	if (err < 0)
>  		return err;
> =20
> --=20
> 2.25.1
>=20

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7agrQACgkQ3SOs138+
s6F05w//coWSzmpMeKjWEliPTDqlHzdfksTvzljRdEXayYKhoLqsQ4Ee9Y1IsXxD
AWzYxTi9USR90MixbcUlVYi5bUL4g6KFr5B4Yvz6uU7irC0kK3cBM+u63hInTfhC
dSdhEy1m27wyZAMEGSqAUhe2loq+rd7fzVLe4nk7toLGIjjTiJgnZ41kJP5+bl1e
qznBFjehxPgtF80R+Pg7JXBIAcHkikAiaYjVhR1AVDVJBngT4NdLl+XeLi6i4nIt
3smcqJR8cgqUmEnUfprQcQonfT8VrJi/dikIHJ0PbEivNaUxIE1BInkxl2x8yMnc
m9iVC+xkCkGAx1bItaDsRxP5//rO6KgDEBW63aLQXqiNs8JIEgr/bSfG2ZBfYnT0
0zGnF3qAjhC95mBv3oUTGT9IGkMV37YL7/XfcYdshOPdu0f1+lEPrKojOZSliu+d
/1adPU4RlnkXt66ItZKyTZuw4c9S/2E80HcvavXCR3Dv54IcAloBTeMUIVWKE5nZ
eDGoGDyn8zMtcLhxaN+ZQFodql4ziNlLywok0aKHTL5zTPQk7PY4wSKylIF6nn+4
6hbz6tLh1Z6Su8yZr4/lLoM+D5narA6Vor1chZGHGw1dhzLp0RMx4OSkZj6qHyNH
G2R3ex19lNl50sl7R7BYuuC7Cq1Ty2EnQaxPUcwCRQpVUspHUfI=
=kem5
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--

--===============0145477053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0145477053==--

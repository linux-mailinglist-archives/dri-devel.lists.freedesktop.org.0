Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAD664EB2B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 13:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C693188F78;
	Fri, 16 Dec 2022 12:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FBF10E5BC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 12:03:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p69RT-0002qn-GD; Fri, 16 Dec 2022 13:03:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p69RQ-004udV-N0; Fri, 16 Dec 2022 13:03:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p69RQ-005Wsi-OX; Fri, 16 Dec 2022 13:03:52 +0100
Date: Fri, 16 Dec 2022 13:03:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/imx: move IPUv3 driver into separate subdirectory
Message-ID: <20221216120352.7ke5msphsqfybagb@pengutronix.de>
References: <20221125112519.3849636-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="grdawi4fbewjugcy"
Content-Disposition: inline
In-Reply-To: <20221125112519.3849636-1-l.stach@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 patchwork-lst@pengutronix.de, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--grdawi4fbewjugcy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 12:25:19PM +0100, Lucas Stach wrote:
> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
> index b644deffe948..909622864716 100644
> --- a/drivers/gpu/drm/imx/Makefile
> +++ b/drivers/gpu/drm/imx/Makefile
> @@ -1,12 +1,4 @@
> [...]
>  obj-$(CONFIG_DRM_IMX_DCSS) +=3D dcss/
> +obj-$(CONFIG_DRM_IMX) +=3D ipuv3/

I wonder if it would make sense to rename DRM_IMX to DRM_IMX_IPUV3 ?!

> diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv=
3/Kconfig
> new file mode 100644
> index 000000000000..f518eb47a18e
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
> [...]
> +config DRM_IMX_HDMI
> +	tristate "Freescale i.MX DRM HDMI"
> +	select DRM_DW_HDMI
> +	depends on DRM_IMX && OF
> +	help
> +	  Choose this if you want to use HDMI on i.MX6.
> +

Trailing empty line could be dropped.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--grdawi4fbewjugcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOcXqUACgkQwfwUeK3K
7AlI2ggAjZd0O21NdRoP3+S8twCMlc6Rr0yHPZ08FVuS1so+nQnEJlMbmsfwgxJS
JoSrHOXIdcml5eVUZFY8fkQ4zKNOLxYKZ83TQuMeFZKP+BCZyrUx+s4GFSrOMNWa
vRWhCcZo92uuSrqqMGG94Y2K5RZlGjauUMAStiwqfqfyRBzE/RyJ5MzP4QQF9cP3
95N2Pip14/K/Lv3m2sKrFOmMCHKuHoqkrIAov1x9BOMWAF+RDM5c+rqZQghvvYz2
PKvbYFQEagU6XBR9ZthgLScPzqYEaYW/5i86tQoGkPaOTn2Io7gWTXAHYKD+eN35
aq03izyys25OEuMGBpCt27WbTFLipg==
=hsc5
-----END PGP SIGNATURE-----

--grdawi4fbewjugcy--

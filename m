Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B5054F4D1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DAD10FC8D;
	Fri, 17 Jun 2022 10:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE76310FE2D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:07:02 +0000 (UTC)
Received: from mercury (dyndsl-095-033-171-130.ewe-ip-backbone.de
 [95.33.171.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DB9D660179A;
 Fri, 17 Jun 2022 11:07:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655460421;
 bh=Qr0241uhMeNOocD5ZmsRYAlhghFJg2A2/AUwt9s6mP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SsJyEaF2GIM/YVd5i0ss+ZW6frijvts2zPKrYnviHLsOww1HQaYDkFsCmN9/WAzoZ
 MsBbCwG/AXmlV9qmUxOySyYTDBZeEMZR0g2uVYu5h8Mo17n7V2o61T0mRlUji2AVu5
 nOiKiuGv/WK8GCe1jrumN5EZ72muYrRp5LrtNPqN0PKI7qJFOTa5zsJ8L1y5Y6HdiW
 C7qpKasEWGBEn5tRJ2GTjmRQKtzSSj1lNV7HuF+t2O/OpPayiNGDS/bzMnG4mlevEq
 6gvxSRd1IGLQqhAL06V9vtUOD9TthlaHkifEJtu0/WeHJuae5pKRXO2yatCBhYU+NI
 Nl62bHzH8KQ8A==
Received: by mercury (Postfix, from userid 1000)
 id CBD7B106031F; Fri, 17 Jun 2022 12:06:58 +0200 (CEST)
Date: Fri, 17 Jun 2022 12:06:58 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH v2 2/3] drm/panel: panel-dsi-cm: Use backlight helpers
Message-ID: <20220617100658.6xnb6z6nsubhcm6q@mercury.elektranox.org>
References: <20220616172316.1355133-3-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ruexnsfaenidx7od"
Content-Disposition: inline
In-Reply-To: <20220616172316.1355133-3-steve@sk2.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ruexnsfaenidx7od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 16, 2022 at 07:23:14PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>=20
> Instead of setting the power state by manually updating fields in
> struct backlight_properties, use backlight_enable() and
> backlight_disable(). These also call backlight_update_status() so the
> separate call is no longer needed.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
> Changes since v1: removed unnecessary parentheses
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 29 ++++++----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index b58cb064975f..b0213a518f9d 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -85,17 +85,10 @@ static void dsicm_bl_power(struct panel_drv_data *dda=
ta, bool enable)
>  	else
>  		return;
> =20
> -	if (enable) {
> -		backlight->props.fb_blank =3D FB_BLANK_UNBLANK;
> -		backlight->props.state =3D ~(BL_CORE_FBBLANK | BL_CORE_SUSPENDED);
> -		backlight->props.power =3D FB_BLANK_UNBLANK;
> -	} else {
> -		backlight->props.fb_blank =3D FB_BLANK_NORMAL;
> -		backlight->props.power =3D FB_BLANK_POWERDOWN;
> -		backlight->props.state |=3D BL_CORE_FBBLANK | BL_CORE_SUSPENDED;
> -	}
> -
> -	backlight_update_status(backlight);
> +	if (enable)
> +		backlight_enable(backlight);
> +	else
> +		backlight_disable(backlight);
>  }
> =20
>  static void hw_guard_start(struct panel_drv_data *ddata, int guard_msec)
> @@ -196,13 +189,7 @@ static int dsicm_bl_update_status(struct backlight_d=
evice *dev)
>  {
>  	struct panel_drv_data *ddata =3D dev_get_drvdata(&dev->dev);
>  	int r =3D 0;
> -	int level;
> -
> -	if (dev->props.fb_blank =3D=3D FB_BLANK_UNBLANK &&
> -			dev->props.power =3D=3D FB_BLANK_UNBLANK)
> -		level =3D dev->props.brightness;
> -	else
> -		level =3D 0;
> +	int level =3D backlight_get_brightness(dev);
> =20
>  	dev_dbg(&ddata->dsi->dev, "update brightness to %d\n", level);
> =20
> @@ -219,11 +206,7 @@ static int dsicm_bl_update_status(struct backlight_d=
evice *dev)
> =20
>  static int dsicm_bl_get_intensity(struct backlight_device *dev)
>  {
> -	if (dev->props.fb_blank =3D=3D FB_BLANK_UNBLANK &&
> -			dev->props.power =3D=3D FB_BLANK_UNBLANK)
> -		return dev->props.brightness;
> -
> -	return 0;
> +	return backlight_get_brightness(dev);
>  }
> =20
>  static const struct backlight_ops dsicm_bl_ops =3D {
> --=20
> 2.30.2
>=20

--ruexnsfaenidx7od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmKsUj4ACgkQ2O7X88g7
+pornRAAoIyH31A22mR6kX3RjUyE8o1ZGmKLDTaH0lEnTVaeBQN6Vn2bWJ67YeD4
Yn1Xd64zrTAU5QFPeKsjt7tNmhqbyqK7uX2P2mHOxuHVO9TiSCv4WdymakbHRVjv
rvR2a8KEnsp+nMAx6MyejluRbFeqtF7Tu+zZ55FNXtJtNcP4YmN+X8WvdAbE317u
L8g31Ax7Js5uWQ6NDTtu9IdVXlGbPj/qGB0ofvltu8ErkZ4b3NomyPEdAmtK40KC
77AIOK4zUB69I5ux2KzDdJYEzEdOR98fNi2ghq0HCclYBec6VbhzI5ZW/0DIfaux
FMJGuYk1eRuz8/HqKsxGdHnEJrNkMu8ack6ZuJWEZuKvyiuzTrzdF0V0mtawyEdJ
Awrh3/Ka94AL8qL3OxGVtzkFovd5bb81QrFD71dpXz0SlXS4ZpkpwQRCbCqJo/A2
AnyGycATX671LnKLULt4UCJtGkTo4jDeSTCX7aYgWBk3LuNX++Gy03hS9wTi05V3
gpTRu4RWyXe3qK1oHrJmNgGFMyXMNltCSR7SJcG+dhjz4BKIDVM7cOsrk7XHd2pa
u/L8zVqAqbAOAZEI0YA7OhpS974K6i3J4TvqqV+QyT0ebgz/ces8uInPqFCbwt7Q
f56slpC/dwWoS8tqKFm2i9XHFIRnp0y2s8/eu0OWwJJye4KdcaU=
=6wqd
-----END PGP SIGNATURE-----

--ruexnsfaenidx7od--

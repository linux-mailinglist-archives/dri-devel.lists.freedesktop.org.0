Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C661A2D9853
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 13:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2BA89B61;
	Mon, 14 Dec 2020 12:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574BA89B61
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 12:53:50 +0000 (UTC)
Date: Mon, 14 Dec 2020 13:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607950430;
 bh=JNK0fbQD0zMEs61k9XuSbktHsKG77yg75wDQGXVa3Y8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oe+hPif+kyba0z+m0HGTUru5WUp4byjFu2hb3qe6AO7sdCge+B35yARlGE2x5zF4F
 T+UVBvwe+vduqEYQJiAYjDMbPA8EL1orUTtw0j6PvI6++MiepIq/ACUalrOpANc0N6
 MSJdQkHvQCQTE3W60sw26WPGjPp98bwY4R5L4iUYxyzN1eSARH2hMJ715T0d0To/uI
 0ECbzAdb+GuqvXvFhphKcRvRgGjlM/O+kPfSJUUin6+2k4wBaqbYdpNJt4s5NsFAJs
 aGg26eNP3mLMfyNblbLRt0TjEAj1sMC672nJKYafBtTDCABgMDZBaqt6FsI6jvICQ2
 Q667c4zAAmLig==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 52/80] drm/omap: drop unused owner field
Message-ID: <20201214125348.j76qcwqzqfdyhz5u@earth.universe>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-53-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201124124538.660710-53-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============1973398668=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1973398668==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xqekzckk6mkpvmci"
Content-Disposition: inline


--xqekzckk6mkpvmci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 24, 2020 at 02:45:10PM +0200, Tomi Valkeinen wrote:
> dssdev->owner is set, but never used. We can drop the field.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dpi.c     | 1 -
>  drivers/gpu/drm/omapdrm/dss/dsi.c     | 1 -
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c   | 1 -
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c   | 1 -
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 2 --
>  drivers/gpu/drm/omapdrm/dss/sdi.c     | 1 -
>  drivers/gpu/drm/omapdrm/dss/venc.c    | 1 -
>  7 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/=
dss/dpi.c
> index 1d2992daef40..030f997eccd0 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dpi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
> @@ -641,7 +641,6 @@ static int dpi_init_output_port(struct dpi_data *dpi,=
 struct device_node *port)
>  	out->type =3D OMAP_DISPLAY_TYPE_DPI;
>  	out->dispc_channel =3D dpi_get_channel(dpi);
>  	out->of_port =3D port_num;
> -	out->owner =3D THIS_MODULE;
> =20
>  	r =3D omapdss_device_init_output(out, &dpi->bridge);
>  	if (r < 0) {
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 1ea490e4fc9d..c3592c6db977 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -5442,7 +5442,6 @@ static int dsi_init_output(struct dsi_data *dsi)
>  	out->name =3D dsi->module_id =3D=3D 0 ? "dsi.0" : "dsi.1";
>  	out->dispc_channel =3D dsi_get_channel(dsi);
>  	out->dsi_ops =3D &dsi_ops;
> -	out->owner =3D THIS_MODULE;
>  	out->of_port =3D 0;
>  	out->bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
>  		       | DRM_BUS_FLAG_DE_HIGH
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdr=
m/dss/hdmi4.c
> index a14fbf06cb30..13701571d59b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -707,7 +707,6 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
>  	out->type =3D OMAP_DISPLAY_TYPE_HDMI;
>  	out->name =3D "hdmi.0";
>  	out->dispc_channel =3D OMAP_DSS_CHANNEL_DIGIT;
> -	out->owner =3D THIS_MODULE;
>  	out->of_port =3D 0;
> =20
>  	r =3D omapdss_device_init_output(out, &hdmi->bridge);
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdr=
m/dss/hdmi5.c
> index b738d9750686..5d627caf90f2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -681,7 +681,6 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
>  	out->type =3D OMAP_DISPLAY_TYPE_HDMI;
>  	out->name =3D "hdmi.0";
>  	out->dispc_channel =3D OMAP_DSS_CHANNEL_DIGIT;
> -	out->owner =3D THIS_MODULE;
>  	out->of_port =3D 0;
> =20
>  	r =3D omapdss_device_init_output(out, &hdmi->bridge);
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omap=
drm/dss/omapdss.h
> index 90e41c635e45..4442e49ffc5c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -263,8 +263,6 @@ struct omapdss_dsi_ops {
>  struct omap_dss_device {
>  	struct device *dev;
> =20
> -	struct module *owner;
> -
>  	struct dss_device *dss;
>  	struct drm_bridge *bridge;
>  	struct drm_bridge *next_bridge;
> diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/=
dss/sdi.c
> index 033fd30074b0..35827b4487bd 100644
> --- a/drivers/gpu/drm/omapdrm/dss/sdi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
> @@ -314,7 +314,6 @@ static int sdi_init_output(struct sdi_device *sdi)
>  	out->dispc_channel =3D OMAP_DSS_CHANNEL_LCD;
>  	/* We have SDI only on OMAP3, where it's on port 1 */
>  	out->of_port =3D 1;
> -	out->owner =3D THIS_MODULE;
>  	out->bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	/* 15.5.9.1.2 */
>  		       | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
> =20
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm=
/dss/venc.c
> index 6e418a0f7572..8ecffe5bbd29 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -730,7 +730,6 @@ static int venc_init_output(struct venc_device *venc)
>  	out->type =3D OMAP_DISPLAY_TYPE_VENC;
>  	out->name =3D "venc.0";
>  	out->dispc_channel =3D OMAP_DSS_CHANNEL_DIGIT;
> -	out->owner =3D THIS_MODULE;
>  	out->of_port =3D 0;
> =20
>  	r =3D omapdss_device_init_output(out, &venc->bridge);
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--xqekzckk6mkpvmci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XYFwACgkQ2O7X88g7
+ppQDhAAnkO8ZN+uPJN1rrGhoCLFdhWliAYnHp52sK2Yq/nJlJsGbXwM5SyD4Bsl
TBXYHdZ6/PeF2thDC+CmdiF8eSJfX8hiNvbO6n+5R66hTwuJwS+jx5x+5l1jDNR0
uuHVdmf1rAPskHs4AGv3Zcvv9Yncrn9sjGZre/hAgxB0XPppx6Z5CIKR6CjgWpyv
wtwvRXy5tUMRw7jHsulbbt/hRgMjXuglvVSuViGOnY0c74b19fOeLuWM+Js9XBBd
40Z0m4S1egp+0i2DRQIWN18vWiLWfjaCqCDJSWziQWTmaU+SgPaZxG9HVq7LWeSM
N61O9MDWtVqlo56t4qz9F3dCwVL/oLWur1+hqwwMLc6OoxACm8gmUBRoU4TSaJw8
GGgb5xU1y1jf3NQqu+i8eBh0jegtQakckEn/BdfAkX+fUqsZDKoJ6Xp6oi8x3gj1
mt17+kTTQSD7w5aL85Dza7AXLJL7mACSgSzvh56hP7cojfNsJAv7pTpY7Jirc4XI
b5Hx7TxHHVDl1ktljIgNBo73VZdUDlsh7xkjftVepIzI3OripU6GH8UQQe/xoxlC
d2F/8EMgsx/qsfHSieKAWO9dz3366E9ErvSyxsQ1LuUf3/Lu8Chuv50sBR+9LJud
zhJI3XiVpimBiIUhOnFVdv/UffjlXRMRjAcbxdFvsUS+Tag1PzQ=
=WJno
-----END PGP SIGNATURE-----

--xqekzckk6mkpvmci--

--===============1973398668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1973398668==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F12D9C72
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371216E2EF;
	Mon, 14 Dec 2020 16:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA276E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:22:11 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:22:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607962931;
 bh=2VWV4C1cD/GCqwVaddEGeoNDPzZFGZWpQYuk1pX1xtg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=WaEh9LHKdE9Su7X6Ds19ZOL8iAlvcYH6DwWUmyuof0Yr5taNvkSYD7tJAqTrjRAxH
 ZyBZf0OeHkHoudiqZxveuyZrO/raWdvD0a3QTM+4J+foPUSgvEkboVqCrQ/Y2kVT8R
 5jhecGGaNicq5nqm7c7jBG41QgRyT5uRxYamhi6dGOl/JdiQDwXZ+7dY0RGJYai5ui
 vXzcT1QVKpjS40dbFZq/8Vt6hMyv2FF+G3PwQwYW75kSkktyJhBpAo7rGSgKJBf5aX
 4bpj+d6Y5FmQI52n99Be9rPCTRySRl3S4MyhV0umlohnty87WRkNzm0nvP3YP7wljh
 wpQBNWJxivQww==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 23/29] drm/omap: dsi: rename dsi_display_* functions
Message-ID: <20201214162209.xzymd2cniox74m4j@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-24-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-24-tomi.valkeinen@ti.com>
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
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============2014861408=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2014861408==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f22uscn3kxw2l2tc"
Content-Disposition: inline


--f22uscn3kxw2l2tc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:49PM +0200, Tomi Valkeinen wrote:
> The function names have evolved to be very confusing, and bunch of them
> have "display" in them even if the function doesn't deal with display as
> such (e.g. dsi_display_enable which just enables the DSI interface).
> Rename them by dropping the "display".
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 36 +++++++++++++++----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index d83346812810..d9c2cd849328 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -55,8 +55,8 @@
> =20
>  static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
> =20
> -static int dsi_display_init_dispc(struct dsi_data *dsi);
> -static void dsi_display_uninit_dispc(struct dsi_data *dsi);
> +static int dsi_init_dispc(struct dsi_data *dsi);
> +static void dsi_uninit_dispc(struct dsi_data *dsi);
> =20
>  static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
> =20
> @@ -3257,7 +3257,7 @@ static void dsi_enable_video_output(struct omap_dss=
_device *dssdev, int vc)
>  	u16 word_count;
>  	int r;
> =20
> -	r =3D dsi_display_init_dispc(dsi);
> +	r =3D dsi_init_dispc(dsi);
>  	if (r) {
>  		dev_err(dsi->dev, "failed to init dispc!\n");
>  		return;
> @@ -3309,7 +3309,7 @@ static void dsi_enable_video_output(struct omap_dss=
_device *dssdev, int vc)
>  		dsi_vc_enable(dsi, vc, false);
>  	}
>  err_pix_fmt:
> -	dsi_display_uninit_dispc(dsi);
> +	dsi_uninit_dispc(dsi);
>  	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
>  	return;
>  }
> @@ -3331,7 +3331,7 @@ static void dsi_disable_video_output(struct omap_ds=
s_device *dssdev, int vc)
> =20
>  	dss_mgr_disable(&dsi->output);
> =20
> -	dsi_display_uninit_dispc(dsi);
> +	dsi_uninit_dispc(dsi);
>  }
> =20
>  static void dsi_update_screen_dispc(struct dsi_data *dsi)
> @@ -3582,7 +3582,7 @@ static int dsi_configure_dispc_clocks(struct dsi_da=
ta *dsi)
>  	return 0;
>  }
> =20
> -static int dsi_display_init_dispc(struct dsi_data *dsi)
> +static int dsi_init_dispc(struct dsi_data *dsi)
>  {
>  	enum omap_channel dispc_channel =3D dsi->output.dispc_channel;
>  	int r;
> @@ -3627,7 +3627,7 @@ static int dsi_display_init_dispc(struct dsi_data *=
dsi)
>  	return r;
>  }
> =20
> -static void dsi_display_uninit_dispc(struct dsi_data *dsi)
> +static void dsi_uninit_dispc(struct dsi_data *dsi)
>  {
>  	enum omap_channel dispc_channel =3D dsi->output.dispc_channel;
> =20
> @@ -3654,7 +3654,7 @@ static int dsi_configure_dsi_clocks(struct dsi_data=
 *dsi)
>  	return 0;
>  }
> =20
> -static int dsi_display_init_dsi(struct dsi_data *dsi)
> +static int dsi_init_dsi(struct dsi_data *dsi)
>  {
>  	int r;
> =20
> @@ -3718,7 +3718,7 @@ static int dsi_display_init_dsi(struct dsi_data *ds=
i)
>  	return r;
>  }
> =20
> -static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect=
_lanes,
> +static void dsi_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
>  				   bool enter_ulps)
>  {
>  	if (enter_ulps && !dsi->ulps_enabled)
> @@ -3741,7 +3741,7 @@ static void dsi_display_uninit_dsi(struct dsi_data =
*dsi, bool disconnect_lanes,
>  	}
>  }
> =20
> -static void dsi_display_enable(struct dsi_data *dsi)
> +static void dsi_enable(struct dsi_data *dsi)
>  {
>  	int r;
> =20
> @@ -3755,7 +3755,7 @@ static void dsi_display_enable(struct dsi_data *dsi)
> =20
>  	_dsi_initialize_irq(dsi);
> =20
> -	r =3D dsi_display_init_dsi(dsi);
> +	r =3D dsi_init_dsi(dsi);
>  	if (r)
>  		goto err_init_dsi;
> =20
> @@ -3767,10 +3767,10 @@ static void dsi_display_enable(struct dsi_data *d=
si)
>  	dsi_runtime_put(dsi);
>  err_get_dsi:
>  	mutex_unlock(&dsi->lock);
> -	DSSDBG("dsi_display_ulps_enable FAILED\n");
> +	DSSDBG("dsi_enable FAILED\n");
>  }
> =20
> -static void dsi_display_disable(struct dsi_data *dsi,
> +static void dsi_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> @@ -3782,7 +3782,7 @@ static void dsi_display_disable(struct dsi_data *ds=
i,
>  	dsi_sync_vc(dsi, 2);
>  	dsi_sync_vc(dsi, 3);
> =20
> -	dsi_display_uninit_dsi(dsi, disconnect_lanes, enter_ulps);
> +	dsi_uninit_dsi(dsi, disconnect_lanes, enter_ulps);
> =20
>  	dsi_runtime_put(dsi);
> =20
> @@ -3812,7 +3812,7 @@ static void omap_dsi_ulps_work_callback(struct work=
_struct *work)
> =20
>  	dsi_enable_te(dsi, false);
> =20
> -	dsi_display_disable(dsi, false, true);
> +	dsi_disable(dsi, false, true);
> =20
>  	dsi_bus_unlock(dsi);
>  }
> @@ -3833,7 +3833,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi,=
 bool enable)
>  			return;
> =20
>  		dsi_bus_lock(dsi);
> -		dsi_display_enable(dsi);
> +		dsi_enable(dsi);
>  		dsi_enable_te(dsi, true);
>  		dsi_bus_unlock(dsi);
>  	}
> @@ -4924,7 +4924,7 @@ static void dsi_bridge_enable(struct drm_bridge *br=
idge)
> =20
>  	dsi_bus_lock(dsi);
> =20
> -	dsi_display_enable(dsi);
> +	dsi_enable(dsi);
> =20
>  	dsi_enable_video_output(dssdev, VC_VIDEO);
> =20
> @@ -4946,7 +4946,7 @@ static void dsi_bridge_disable(struct drm_bridge *b=
ridge)
> =20
>  	dsi_disable_video_output(dssdev, VC_VIDEO);
> =20
> -	dsi_display_disable(dsi, true, false);
> +	dsi_disable(dsi, true, false);
> =20
>  	dsi_bus_unlock(dsi);
>  }
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--f22uscn3kxw2l2tc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XkTEACgkQ2O7X88g7
+pq6ww/8DaEMgoDeUcfLOjqaK6FYk4PbGw3bCUUsCUp2J1je7gj4Hn+ZNAvRkTch
BO6MULoKncKH2mnTPao9/xuNJLSV3h0ZxKKHu4v/C7OF4T7EmByKEG0wvKgw2zuE
gmMe48h/DbFnad6ngdLfqkb2qE2+EAJeGVsQiSY/4c7VRKD+DSlKbc7V97H2Tm6/
yvrJBMu8UpUMf7ubNS7pLvJdxcq9ddCKKTr7YXzgSVNO7FjTBhRhwrquMElCv8hH
3wKO6BYvKwhWTYDbFnZh/EEVjV8FidnfhQbqdG2xiPynT8359UV5tX4lmykRfscm
g4R3jCtp0PgCTxvEeedDOk0mdHr1FDu9HSAqlgPZPON23kn7JnCm1LoWvSjfIoK7
eqIN1xXzvgQqcQKqgPdQX+0YLXxEDF37AbupiBS2qYjgH424IWzGT8M+ObMqh5ji
qDhpnPaTDIokJvNskhES3XfbyiRy4A1bhlxExL+yu+iuwzWlJkgk0iR0MFakXK3O
dlBsfTajsKG8HjFQlnEuSVyxCbisS5naM3mPwi7/ojvg58ce31zQIMa5E4MQwC9B
2Y/LsdHoGLnEkQnkynrLbp43FgwRhnnh98ExohofR5UGTbIp/sBJLuyV3nuTHqHO
WIx4mdVhpnf7RDY/MyQKZlOMmI/gFWIerrHiQguZFhR00K9akiQ=
=/Fo2
-----END PGP SIGNATURE-----

--f22uscn3kxw2l2tc--

--===============2014861408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2014861408==--

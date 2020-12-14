Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA812D9A0D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 15:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757AD6E17B;
	Mon, 14 Dec 2020 14:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43056E17B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:35:42 +0000 (UTC)
Date: Mon, 14 Dec 2020 15:35:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607956542;
 bh=PduyduJ87ItDILEPk7/W38JfCRlCsHM+uffWVaujy0Q=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cx7yJum3WsEDzK0IzokkpImFi0fq1fi+b2gQBRhRzo5E7/8VCTGo9mtGANM2ycgIw
 kR21sXJ1qm9tP//qtBW8ngOd6TvYlGxn0LiqftApiGwdH0gnfK/8X/Lh/OkE/f1ayx
 a55rCyISL2dDqvtIE2D1I3eCd99W8v9YQlFP/59eB/0KrfmVVD/0u3ZWrvoifXdveX
 F+k8Yo7H66OlxwAfMpLCgUJR4f5NbbOxnOaPWXSLucg2lKKdKTYLx0Qr7sjCn/e1V2
 Vedu9bU/3GXXKQvQSVOpaX6Q2RTUVMmrysf8pW3f+zsHhUD6UFWFA59kdfzoYxlM2c
 +PUFcJXv6Sihw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 09/29] drm/omap: dsi: cleanup dispc channel usage
Message-ID: <20201214143540.t3ozpc2mipgniuin@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-10-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-10-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1422827257=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1422827257==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ur6oq4h5b3dgkdyk"
Content-Disposition: inline


--ur6oq4h5b3dgkdyk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:35PM +0200, Tomi Valkeinen wrote:
> The "channel" usage in omap dsi driver is confusing. As the first step,
> change "channel" to "dispc_channel" when dealing with the dispc channel.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index c78ae99c8742..cf0dc4872d14 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3978,10 +3978,10 @@ static int dsi_configure_dispc_clocks(struct dsi_=
data *dsi)
> =20
>  static int dsi_display_init_dispc(struct dsi_data *dsi)
>  {
> -	enum omap_channel channel =3D dsi->output.dispc_channel;
> +	enum omap_channel dispc_channel =3D dsi->output.dispc_channel;
>  	int r;
> =20
> -	dss_select_lcd_clk_source(dsi->dss, channel, dsi->module_id =3D=3D 0 ?
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, dsi->module_id =3D=
=3D 0 ?
>  			DSS_CLK_SRC_PLL1_1 :
>  			DSS_CLK_SRC_PLL2_1);
> =20
> @@ -4017,19 +4017,19 @@ static int dsi_display_init_dispc(struct dsi_data=
 *dsi)
>  		dss_mgr_unregister_framedone_handler(&dsi->output,
>  				dsi_framedone_irq_callback, dsi);
>  err:
> -	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
>  	return r;
>  }
> =20
>  static void dsi_display_uninit_dispc(struct dsi_data *dsi)
>  {
> -	enum omap_channel channel =3D dsi->output.dispc_channel;
> +	enum omap_channel dispc_channel =3D dsi->output.dispc_channel;
> =20
>  	if (dsi->mode =3D=3D OMAP_DSS_DSI_CMD_MODE)
>  		dss_mgr_unregister_framedone_handler(&dsi->output,
>  				dsi_framedone_irq_callback, dsi);
> =20
> -	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
>  }
> =20
>  static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
> @@ -4846,12 +4846,12 @@ static int dsi_set_config(struct omap_dss_device =
*dssdev,
>  }
> =20
>  /*
> - * Return a hardcoded channel for the DSI output. This should work for
> + * Return a hardcoded dispc channel for the DSI output. This should work=
 for
>   * current use cases, but this can be later expanded to either resolve
>   * the channel in some more dynamic manner, or get the channel as a user
>   * parameter.
>   */
> -static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
> +static enum omap_channel dsi_get_dispc_channel(struct dsi_data *dsi)
>  {
>  	switch (dsi->data->model) {
>  	case DSI_MODEL_OMAP3:
> @@ -5403,7 +5403,7 @@ static int dsi_init_output(struct dsi_data *dsi)
> =20
>  	out->type =3D OMAP_DISPLAY_TYPE_DSI;
>  	out->name =3D dsi->module_id =3D=3D 0 ? "dsi.0" : "dsi.1";
> -	out->dispc_channel =3D dsi_get_channel(dsi);
> +	out->dispc_channel =3D dsi_get_dispc_channel(dsi);
>  	out->dsi_ops =3D &dsi_ops;
>  	out->of_port =3D 0;
>  	out->bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--ur6oq4h5b3dgkdyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XeDwACgkQ2O7X88g7
+pqOYw/+LOaXw7WWIwzdRo2u8ok5X6RPR8OzTXR9bV1XTZ8DCdOyOZwE4Vmdy09a
Sy6j+3P4Nrnv7qUxKQvsMnjQa7ZCaS85eZJ7z0AramS7cjaGdoEqbMrbdegXTcHv
vsrxDEh0bnOeDiveRIK2jrXobY6zU37FiJ+wJ5hOVlTq0X6jUat6FY4c37ppMIQ9
AabxW7Bh6COkK5vPMPojBY8EebztM34eguJN0Hqj6D7D8KznxeGl42GptiApHlw4
8wo3LokCNM16GvRzLdjlc/NLEnTd3obuWIvTCssgRX1fojnTitbpa/HN9Ok/Dq5u
tZ1RrqgeyMd2NUcAa4mrKfDC30WykNskRdRXTZKxh3WgSpokXcvnS3g3Lyk/sKku
qcXudzoL4SsVAiPAwM9k41SoSOFBl3pwFEIya60cndGC3jzzLW+e9FFMavvFA/Rt
0NMkhUGPT5rLAbn6qCc1u7aMPd1CPhqjF8q5sXe3qLSaZ5rDXaV0rXw/sFNZ4Vw9
Xu1Qy+3fcn1JtDdUc5AOA/OZzp3nzH0WMhg0ha4JiYx7TGcYwC8zM7CLL55YK/mY
c24RpM3Psex8N9XeO1kzI0BGZrmIUXb+NVtRuH6dJX3H1ZoD1G2kANgkbyRKgDhT
7NqPkoJ3ypCu3V3fxV9hh9bc22FlsqpRB3aj5DgzLne1AEZB9n8=
=xFgR
-----END PGP SIGNATURE-----

--ur6oq4h5b3dgkdyk--

--===============1422827257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1422827257==--

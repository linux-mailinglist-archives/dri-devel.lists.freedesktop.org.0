Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B14A83AC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 13:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F257B10F435;
	Thu,  3 Feb 2022 12:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BA410F435
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 12:17:40 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 415CE5C0243;
 Thu,  3 Feb 2022 07:17:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 03 Feb 2022 07:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=pwUoOS5VLLA9pF+vUjmklQeqPFPoLLHfBDBEP0
 hOcRI=; b=gJUgAD5LSNhERjNmBhQsJUP5foyUiuGoBGW9RoP9KFYGb/pbvpUZGv
 w+sqJqbvFY3EAQ9v3lN04KgHgMGenLoM1C5Qvk+A452K15yK1zHdX0Bd6S4bGwNm
 0yBo1TW3TZXtpAku5W0whx1wqzna5tAWD8ntIkPCarVlqsMnn2OgDd/1vm6EcW3P
 BJRYrdH/qdq+OniwVxIV4IeRbc2I4KWCbVZvpv/J0XTFzdJAj/OlWuc9WKvV2727
 Zg5MdqLVtkq8itMf7Za2EviLnsA5L0PNfGFux2DjANLJxU5kcl+ieDRfOEimlBmK
 vwSYCFhMTl7UbC+9GutFSJMqdAoh6gzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pwUoOS5VLLA9pF+vU
 jmklQeqPFPoLLHfBDBEP0hOcRI=; b=NXMAddSaGi1hHoRGWB72k/kfnwx+30U94
 i9bB/skgRqsMxMe3xALjNHcmDoXNUQAXJYAlf3WvBg9kUiit6Vi0J1LpG+cOK8GD
 7CyaBn+qn7sHZZ+OXD0W37evXsk3ad58DN9lRdfJ04NOnlFpRBzy+C2KGfxG4iWg
 p9W1ItcTFbNLXuQ/ht3ziYrCi7OEPc30EY//kmR9PhssZIrCHlmv6xLAtnyIFZnM
 oOQGyNBWPr/9r2h5QrxNbhTdU0aHRhhEJFBldBvV7IoF1+2PtbVjwO+bf7Wp2qj7
 Gvs7jSDGX0KKe9OSLsw6airb6Wg2c9+3yl461m5o18i5aMX6oSOkQ==
X-ME-Sender: <xms:48f7YW34X1PxgrI_HPmav5kmIad77xkbi1Poo-YMJ4OHxl6Jdm5Ivw>
 <xme:48f7YZHQgIuTQUD3h96ZL2YgqS0HNxiSxU4hp7-QSaIj6fxGYMpeYLV-5a5Qv26FF
 OEQkjUoyddJBxwvxy4>
X-ME-Received: <xmr:48f7Ye5rRxwkko0UnSip5PvazInkVmbmr7uMUtSPjO82XQkXvz2mpC64fthV7czbzgXJhqRaRwpsvUo7Xm0MKNaZfqQBIgfFIlVjwkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:48f7YX00rF1v8oIN4T9i8QBNH0WsgASdiLoDxlxdi2Aht92T7G5U2A>
 <xmx:48f7YZFr-p5AdLVrtvsGtsd3guEaOedmPoOb4euedYK7sEyiwcX-iA>
 <xmx:48f7YQ-v1hVPPpvyzU4hHVPd99H6afDdetRrCVg-LmUmNiuquVj8Ig>
 <xmx:5Mf7Ydh3b_WAEOx_V9opIvOZ9JHvVCP5x_gW_AiR-_SIJlMnpfc2lg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 07:17:39 -0500 (EST)
Date: Thu, 3 Feb 2022 13:17:37 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 12/14] drm: bridge: icn6211: Add I2C configuration support
Message-ID: <20220203121737.mbwfgh6htvkbdr7r@houat>
References: <20220114034838.546267-1-marex@denx.de>
 <20220114034838.546267-12-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="43lah437fn47tngt"
Content-Disposition: inline
In-Reply-To: <20220114034838.546267-12-marex@denx.de>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--43lah437fn47tngt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 04:48:36AM +0100, Marek Vasut wrote:
> The ICN6211 chip starts in I2C configuration mode after cold boot.
> Implement support for configuring the chip via I2C in addition to
> the current DSI LP command mode configuration support. The later
> seems to be available only on chips which have additional MCU on
> the panel/bridge board which preconfigures the ICN6211, while the
> I2C configuration mode added by this patch does not require any
> such MCU.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 219 +++++++++++++++++++----
>  1 file changed, 188 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index 8226fefeedfc9..313c588297eca 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -11,6 +11,7 @@
> =20
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
> @@ -133,14 +134,17 @@
> =20
>  struct chipone {
>  	struct device *dev;
> +	struct i2c_client *client;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
>  	struct device_node *host_node;
> +	struct mipi_dsi_device *dsi;
>  	struct gpio_desc *enable_gpio;
>  	struct regulator *vdd1;
>  	struct regulator *vdd2;
>  	struct regulator *vdd3;
>  	int dsi_lanes;
> +	bool interface_i2c;
>  };
> =20
>  static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridg=
e)
> @@ -172,20 +176,14 @@ bridge_to_mode(struct drm_bridge *bridge, struct dr=
m_atomic_state *state)
>  	return &crtc_state->adjusted_mode;
>  }
> =20
> -static inline int chipone_dsi_write(struct chipone *icn,  const void *se=
q,
> -				    size_t len)
> +static void ICN6211_DSI(struct chipone *icn, u8 reg, u8 val)
>  {
> -	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(icn->dev);
> -
> -	return mipi_dsi_generic_write(dsi, seq, len);
> +	if (icn->interface_i2c)
> +		i2c_smbus_write_byte_data(icn->client, reg, val);
> +	else
> +		mipi_dsi_generic_write(icn->dsi, (u8[]){reg, val}, 2);
>  }
> =20
> -#define ICN6211_DSI(icn, seq...)				\
> -	{							\
> -		const u8 d[] =3D { seq };				\
> -		chipone_dsi_write(icn, d, ARRAY_SIZE(d));	\
> -	}
> -
>  static void chipone_configure_pll(struct chipone *icn,
>  				  const struct drm_display_mode *mode)
>  {
> @@ -282,7 +280,10 @@ static void chipone_atomic_enable(struct drm_bridge =
*bridge,
>  	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
>  	bus_flags =3D bridge_state->output_bus_cfg.flags;
> =20
> -	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
> +	if (icn->interface_i2c)
> +		ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_I2C);
> +	else
> +		ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
> =20
>  	ICN6211_DSI(icn, HACTIVE_LI, mode->hdisplay & 0xff);
> =20
> @@ -396,11 +397,86 @@ static void chipone_atomic_post_disable(struct drm_=
bridge *bridge,
>  	gpiod_set_value(icn->enable_gpio, 0);
>  }
> =20
> +static int chipone_dsi_attach(struct chipone *icn)
> +{
> +	struct mipi_dsi_device *dsi =3D icn->dsi;
> +	int ret;
> +
> +	dsi->lanes =3D icn->dsi_lanes;
> +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> +
> +	ret =3D mipi_dsi_attach(dsi);
> +	if (ret < 0)
> +		dev_err(icn->dev, "failed to attach dsi\n");
> +
> +	return ret;
> +}
> +
> +static int chipone_dsi_setup(struct chipone *icn)
> +{
> +	struct device *dev =3D icn->dev;
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *host;
> +	int ret =3D 0;
> +
> +	const struct mipi_dsi_device_info info =3D {
> +		.type =3D "chipone",
> +		.channel =3D 0,
> +		.node =3D NULL,
> +	};
> +
> +	host =3D of_find_mipi_dsi_host_by_node(icn->host_node);
> +	if (!host) {
> +		dev_err(dev, "failed to find dsi host\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	dsi =3D mipi_dsi_device_register_full(host, &info);
> +	if (IS_ERR(dsi)) {
> +		return dev_err_probe(dev, PTR_ERR(dsi),
> +				     "failed to create dsi device\n");
> +	}
> +
> +	icn->dsi =3D dsi;
> +
> +	ret =3D chipone_dsi_attach(icn);
> +	if (ret < 0)
> +		mipi_dsi_device_unregister(dsi);
> +
> +	return ret;
> +}
> +
>  static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_att=
ach_flags flags)
>  {
>  	struct chipone *icn =3D bridge_to_chipone(bridge);
> +	struct drm_bridge *abridge =3D bridge;
> +	int ret;
> +
> +	if (icn->interface_i2c) {
> +		ret =3D chipone_dsi_setup(icn);
> +		if (ret)
> +			return ret;
> +
> +		abridge =3D &icn->bridge;

This needs to happen at probe/bind time. See:
https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#special-car=
e-with-mipi-dsi-bridges

Maxime

--43lah437fn47tngt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfvH4QAKCRDj7w1vZxhR
xedSAP0Yd9wyIUbLqFs8sUXrZKXoRfFhDdE3rvyMZ81l+sH5VQD/dfGLMEzVkjtk
FELL14HuQBmZwpGs3CfwrS/QJXsOCwg=
=1p0B
-----END PGP SIGNATURE-----

--43lah437fn47tngt--

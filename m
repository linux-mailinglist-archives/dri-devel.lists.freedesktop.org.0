Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03398ADE5D9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E3910E7DA;
	Wed, 18 Jun 2025 08:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s2SCpKkc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDD510E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:41:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C7FC749E7A;
 Wed, 18 Jun 2025 08:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD50C4CEE7;
 Wed, 18 Jun 2025 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750236113;
 bh=lqBlZ45BuFvcS1wyiT8dj4FpyJ53KdG4DblsfFPLDSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s2SCpKkcndHTKAOn/flJvC/dheyA7qv7Gv6zMp9Q9OgTt51ZEQlffmH6kJRhCkhX9
 Qt2kSIwuGl+70Ebky2GBqugVujkP26UcUzWXLji0ayKPmwPjqftzurpwyJ1w73YbRR
 S52wlXZmVfKHj1ugEd4y2KaFtJDiO+jrW9hBfg+bNOALyb4DRFy8LuaYIbPJ1iia03
 vnm8IMksPp090KPZYnbRcUxwLpopLoGm/WwbQJef9fdc+zGgJWNfmZIo6+jI5kq50b
 pe97x6QiSG6YRmHuq/Ot4FR6Ga5+XtmK9CbnmWfvictLfEeplXCR9SVftBKD0vKrOJ
 At/1ICXdKOvSA==
Date: Wed, 18 Jun 2025 10:41:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sandeep Sheriker M <sandeep.sheriker@microchip.com>
Subject: Re: [PATCH] drm/bridge: fix LVDS controller bus format
Message-ID: <20250618-fragrant-seagull-of-tranquility-c91dfd@houat>
References: <20250618-microchip-lvds-v1-1-1eae5acd7a82@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hntctm46fzjyd4a7"
Content-Disposition: inline
In-Reply-To: <20250618-microchip-lvds-v1-1-1eae5acd7a82@microchip.com>
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


--hntctm46fzjyd4a7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: fix LVDS controller bus format
MIME-Version: 1.0

Hi,

On Wed, Jun 18, 2025 at 10:02:42AM +0530, Dharma Balasubiramani wrote:
> From: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
>=20
> The current LVDS controller driver is hardcoded to map LVDS lanes to the
> JEIDA format. Consequently, connecting an LVDS display that supports the
> VESA format results in a distorted display due to the format mismatch.
>=20
> Query the panel driver and set the appropriate format to resolve the issu=
e.
>=20
> Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

It looks like there's a bit of context missing to explain why you needed
to do it that way. See below.

> ---
>  drivers/gpu/drm/bridge/microchip-lvds.c | 108 ++++++++++++++++++++++++++=
++++--
>  1 file changed, 102 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/br=
idge/microchip-lvds.c
> index 9f4ff82bc6b4..5e99c01033bb 100644
> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> @@ -11,6 +11,7 @@
>  #include <linux/component.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/devinfo.h>
> @@ -41,9 +42,11 @@
> =20
>  /* Bitfields in LVDSC_CFGR (Configuration Register) */
>  #define LVDSC_CFGR_PIXSIZE_24BITS	0
> +#define LVDSC_CFGR_PIXSIZE_18BITS	1
>  #define LVDSC_CFGR_DEN_POL_HIGH		0
>  #define LVDSC_CFGR_DC_UNBALANCED	0
>  #define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
> +#define LVDSC_CFGR_MAPPING_VESA		0
> =20
>  /*Bitfields in LVDSC_SR */
>  #define LVDSC_SR_CS	BIT(0)
> @@ -58,6 +61,7 @@ struct mchp_lvds {
>  	struct clk *pclk;
>  	struct drm_panel *panel;
>  	struct drm_bridge bridge;
> +	struct drm_connector connector;
>  	struct drm_bridge *panel_bridge;
>  };
> =20
> @@ -66,6 +70,11 @@ static inline struct mchp_lvds *bridge_to_lvds(struct =
drm_bridge *bridge)
>  	return container_of(bridge, struct mchp_lvds, bridge);
>  }
> =20
> +static inline struct mchp_lvds *drm_connector_to_mchp_lvds(struct drm_co=
nnector *connector)
> +{
> +	return container_of(connector, struct mchp_lvds, connector);
> +}
> +
>  static inline u32 lvds_readl(struct mchp_lvds *lvds, u32 offset)
>  {
>  	return readl_relaxed(lvds->regs + offset);
> @@ -79,6 +88,11 @@ static inline void lvds_writel(struct mchp_lvds *lvds,=
 u32 offset, u32 val)
>  static void lvds_serialiser_on(struct mchp_lvds *lvds)
>  {
>  	unsigned long timeout =3D jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_=
MS);
> +	struct drm_connector *connector =3D &lvds->connector;

How does that work if the bridge was attached with NO_CONNECTOR? Would
the structure be uninitialized?

> +
> +	/* default to jeida-24 */
> +	u32 bus_formats =3D MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> +	u8 map, pix_size;
> =20
>  	/* The LVDSC registers can only be written if WPEN is cleared */
>  	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
> @@ -93,24 +107,106 @@ static void lvds_serialiser_on(struct mchp_lvds *lv=
ds)
>  		usleep_range(1000, 2000);
>  	}
> =20
> +	if (connector && connector->display_info.num_bus_formats)
> +		bus_formats =3D connector->display_info.bus_formats[0];
> +
>  	/* Configure the LVDSC */
> -	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
> -				LVDSC_CFGR_DC_UNBALANCED |
> -				LVDSC_CFGR_DEN_POL_HIGH |
> -				LVDSC_CFGR_PIXSIZE_24BITS));
> +	switch (bus_formats) {
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		map =3D LVDSC_CFGR_MAPPING_JEIDA;
> +		pix_size =3D LVDSC_CFGR_PIXSIZE_18BITS;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		map =3D LVDSC_CFGR_MAPPING_VESA;
> +		pix_size =3D LVDSC_CFGR_PIXSIZE_24BITS;
> +		break;
> +	default:
> +		map =3D LVDSC_CFGR_MAPPING_JEIDA;
> +		pix_size =3D LVDSC_CFGR_PIXSIZE_24BITS;
> +		break;
> +	}
> +
> +	lvds_writel(lvds, LVDSC_CFGR, (map | LVDSC_CFGR_DC_UNBALANCED |
> +		    LVDSC_CFGR_DEN_POL_HIGH | pix_size));
> =20
>  	/* Enable the LVDS serializer */
>  	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
>  }

Aside from the bit above, that part looks fine to me.

> =20
> +static int mchp_lvds_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct mchp_lvds *lvds =3D drm_connector_to_mchp_lvds(connector);
> +
> +	return drm_panel_get_modes(lvds->panel, connector);
> +}
> +
> +static const struct drm_connector_helper_funcs mchp_lvds_connector_helpe=
r_funcs =3D {
> +	.get_modes =3D mchp_lvds_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs panel_bridge_connector_funcs =3D=
 {
> +	.reset =3D drm_atomic_helper_connector_reset,
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.destroy =3D drm_connector_cleanup,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> +};
> +
>  static int mchp_lvds_attach(struct drm_bridge *bridge,
>  			    struct drm_encoder *encoder,
>  			    enum drm_bridge_attach_flags flags)
>  {
>  	struct mchp_lvds *lvds =3D bridge_to_lvds(bridge);
> +	struct drm_connector *connector =3D &lvds->connector;
> +	int ret;
> +
> +	ret =3D drm_bridge_attach(encoder, lvds->panel_bridge,
> +				bridge, flags);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
> +	if (!encoder) {
> +		dev_err(lvds->dev, "Missing encoder\n");
> +		return -ENODEV;
> +	}
> +
> +	drm_connector_helper_add(connector,
> +				 &mchp_lvds_connector_helper_funcs);
> +
> +	ret =3D drm_connector_init(bridge->dev, connector,
> +				 &panel_bridge_connector_funcs,
> +				 DRM_MODE_CONNECTOR_LVDS);
> +	if (ret) {
> +		dev_err(lvds->dev, "Failed to initialize connector %d\n", ret);
> +		return ret;
> +	}
> =20
> -	return drm_bridge_attach(encoder, lvds->panel_bridge,
> -				 bridge, flags);
> +	drm_panel_bridge_set_orientation(connector, bridge);
> +
> +	ret =3D drm_connector_attach_encoder(&lvds->connector, encoder);
> +	if (ret) {
> +		dev_err(lvds->dev, "Failed to attach connector to encoder %d\n", ret);
> +		drm_connector_cleanup(connector);
> +		return ret;
> +	}
> +
> +	if (bridge->dev->registered) {
> +		if (connector->funcs->reset)
> +			connector->funcs->reset(connector);
> +
> +		ret =3D drm_connector_register(connector);
> +		if (ret) {
> +			dev_err(lvds->dev, "Failed to attach connector to register %d\n", ret=
);
> +			drm_connector_cleanup(connector);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;

However, this is the part I don't really get. AFAIU, you create a
connector, for the sole purpose of calling the panel get_modes. But the
panel bridge you already using is calling that function already. So
there must be something more.

Did you create the connector only to be able to access it in
lvds_serialiser_on and thus retrieve the bus_formats? If so, you should
convert enable / disable to atomic_enable / atomic_disable, pass
drm_atomic_state to lvds_serialiser_on, and then call
drm_atomic_get_new_connector_for_encoder(bridge->encoder).

Maximee

--hntctm46fzjyd4a7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFJ7zgAKCRAnX84Zoj2+
diuvAX9UfEoHd+Iv736HB3plQKOBrbGoasZtB+QdnrbrTZGlhOdkmGERMMTP0qZN
Pmn3IZoBf3W07y5YXMxwxWmi8HNPyCpq8kB4B5c8zR/T7fmu2d8zy5oxntJL/7X4
yOpiyV0pIQ==
=QQCN
-----END PGP SIGNATURE-----

--hntctm46fzjyd4a7--

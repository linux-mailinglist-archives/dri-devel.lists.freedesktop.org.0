Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434EFAE5D4E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 08:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F76710E061;
	Tue, 24 Jun 2025 06:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tr7bOapn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0BC10E061
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 06:59:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A4265C4D24;
 Tue, 24 Jun 2025 06:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3A4C4CEE3;
 Tue, 24 Jun 2025 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750748375;
 bh=jLGPvCfoQ08N6eX9uE9WM+NCPLN8fkLTJXyvmrpq8R0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tr7bOapneHO5jhGsnJpcXb6VUuxZdRweqgHcJMpTCuX+Rvt4a0o9XtpyEtS782HzE
 NRfQfBA0d82ZiGXPzvgpkT3IF9b96FNsOAfSmDxzgKeqyQqPlAE8Bop0zpKCpSjm3N
 5ICWFueK9MzewW7o056st9s//I6b0Q9cxjsr0TLtVfGSYOwDGuEXlVCGIvQ9LBWcqU
 NGqkhxnXom8iUUbcSZBi5h388O3h9YqKCt0UVXrvswSjCuHUlvRkgp4rCCBGVKYKte
 GC7ZiBOuFg9FVDoX4wR6Wzx/SsOX0CnkSofVRpUXblOw0U3XcpGl4T+ASRQUAJxVnq
 4i9MxnZsxQusA==
Date: Tue, 24 Jun 2025 08:59:32 +0200
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
Subject: Re: [PATCH v3] drm/bridge: microchip-lvds: fix bus format mismatch
 with VESA displays
Message-ID: <20250624-complex-russet-deer-c1d9b3@houat>
References: <20250624-microchip-lvds-v3-1-c3c6f1e40516@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6ngqa3iwquyt5oba"
Content-Disposition: inline
In-Reply-To: <20250624-microchip-lvds-v3-1-c3c6f1e40516@microchip.com>
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


--6ngqa3iwquyt5oba
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] drm/bridge: microchip-lvds: fix bus format mismatch
 with VESA displays
MIME-Version: 1.0

Hi,

On Tue, Jun 24, 2025 at 10:10:25AM +0530, Dharma Balasubiramani wrote:
> From: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
>=20
> The LVDS controller was hardcoded to JEIDA mapping, which leads to
> distorted output on panels expecting VESA mapping.
>=20
> Update the driver to dynamically select the appropriate mapping and
> pixel size based on the panel's advertised media bus format. This
> ensures compatibility with both JEIDA and VESA displays.
>=20
> Modernize the bridge ops to use atomic_enable/disable, and retrieve
> the bus format from the connector via the atomic bridge state.
>=20
> Additionally, drop the drm_panel field as it is unused.
>=20
> Signed-off-by: Sandeep Sheriker M <sandeep.sheriker@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Changes in v3:
> - Use BIT(0) instead of 1.
> - Drop the panel field of the mchp_lvds structure.
> - Drop the inner parentheses in write in serialiser_on().
> - Link to v2: https://lore.kernel.org/r/20250623-microchip-lvds-v2-1-8ecb=
abc6abc4@microchip.com
>=20
> Changes in v2:
> - Switch to atomic bridge functions
> - Drop custom connector creation
> - Use drm_atomic_get_new_connector_for_encoder()
> - Link to v1: https://lore.kernel.org/r/20250618-microchip-lvds-v1-1-1eae=
5acd7a82@microchip.com

Looking much better now, thanks!

I still have few comments, see below.

>  drivers/gpu/drm/bridge/microchip-lvds.c | 70 +++++++++++++++++++++++++--=
------
>  1 file changed, 54 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/br=
idge/microchip-lvds.c
> index 9f4ff82bc6b4..e7b68fb4bec0 100644
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
> +#define LVDSC_CFGR_PIXSIZE_18BITS	BIT(0)
>  #define LVDSC_CFGR_DEN_POL_HIGH		0
>  #define LVDSC_CFGR_DC_UNBALANCED	0
>  #define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
> +#define LVDSC_CFGR_MAPPING_VESA		0
> =20
>  /*Bitfields in LVDSC_SR */
>  #define LVDSC_SR_CS	BIT(0)
> @@ -56,7 +59,6 @@ struct mchp_lvds {
>  	struct device *dev;
>  	void __iomem *regs;
>  	struct clk *pclk;
> -	struct drm_panel *panel;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
>  };
> @@ -76,9 +78,10 @@ static inline void lvds_writel(struct mchp_lvds *lvds,=
 u32 offset, u32 val)
>  	writel_relaxed(val, lvds->regs + offset);
>  }
> =20
> -static void lvds_serialiser_on(struct mchp_lvds *lvds)
> +static void lvds_serialiser_on(struct mchp_lvds *lvds, u32 bus_format)
>  {
>  	unsigned long timeout =3D jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_=
MS);
> +	u8 map, pix_size;
> =20
>  	/* The LVDSC registers can only be written if WPEN is cleared */
>  	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
> @@ -93,11 +96,24 @@ static void lvds_serialiser_on(struct mchp_lvds *lvds)
>  		usleep_range(1000, 2000);
>  	}
> =20
> +	switch (bus_format) {
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
>  	/* Configure the LVDSC */
> -	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
> -				LVDSC_CFGR_DC_UNBALANCED |
> -				LVDSC_CFGR_DEN_POL_HIGH |
> -				LVDSC_CFGR_PIXSIZE_24BITS));
> +	lvds_writel(lvds, LVDSC_CFGR, map | LVDSC_CFGR_DC_UNBALANCED |
> +		    LVDSC_CFGR_DEN_POL_HIGH | pix_size);
> =20
>  	/* Enable the LVDS serializer */
>  	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
> @@ -113,7 +129,8 @@ static int mchp_lvds_attach(struct drm_bridge *bridge,
>  				 bridge, flags);
>  }

It looks like this part is originally what the patch was about...

> -static void mchp_lvds_enable(struct drm_bridge *bridge)
> +static void mchp_lvds_atomic_pre_enable(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state)
>  {
>  	struct mchp_lvds *lvds =3D bridge_to_lvds(bridge);
>  	int ret;
> @@ -129,11 +146,35 @@ static void mchp_lvds_enable(struct drm_bridge *bri=
dge)
>  		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
>  		return;
>  	}
> +}
> +
> +static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
> +{
> +	struct mchp_lvds *lvds =3D bridge_to_lvds(bridge);
> +	struct drm_connector *connector;
> +
> +	/* default to jeida-24 */
> +	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> +
> +	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->e=
ncoder);
> +	if (connector && connector->display_info.num_bus_formats)
> +		bus_format =3D connector->display_info.bus_formats[0];
> =20
> -	lvds_serialiser_on(lvds);
> +	lvds_serialiser_on(lvds, bus_format);
>  }
> =20
> -static void mchp_lvds_disable(struct drm_bridge *bridge)
> +static void mchp_lvds_atomic_disable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
> +{
> +	struct mchp_lvds *lvds =3D bridge_to_lvds(bridge);
> +
> +	/* Turn off the serialiser */
> +	lvds_writel(lvds, LVDSC_CR, 0);
> +}
> +
> +static void mchp_lvds_atomic_post_disable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
>  {
>  	struct mchp_lvds *lvds =3D bridge_to_lvds(bridge);
> =20
> @@ -143,8 +184,10 @@ static void mchp_lvds_disable(struct drm_bridge *bri=
dge)
> =20
>  static const struct drm_bridge_funcs mchp_lvds_bridge_funcs =3D {
>  	.attach =3D mchp_lvds_attach,
> -	.enable =3D mchp_lvds_enable,
> -	.disable =3D mchp_lvds_disable,
> +	.atomic_pre_enable =3D mchp_lvds_atomic_pre_enable,
> +	.atomic_enable =3D mchp_lvds_atomic_enable,
> +	.atomic_disable =3D mchp_lvds_atomic_disable,
> +	.atomic_post_disable =3D mchp_lvds_atomic_post_disable,
>  };

=2E.. But this is basically just switching the bridge to use atomic
variants of its hooks. It's not directly related to the change, so it
should be split into another patch.

The split from enable to atomic_pre_enable / atomic_enable would also be
good in another separate patch.

> =20
>  static int mchp_lvds_probe(struct platform_device *pdev)
> @@ -179,13 +222,8 @@ static int mchp_lvds_probe(struct platform_device *p=
dev)
>  			"can't find port point, please init lvds panel port!\n");
>  		return -ENODEV;
>  	}
> -
> -	lvds->panel =3D of_drm_find_panel(port);
>  	of_node_put(port);
> =20
> -	if (IS_ERR(lvds->panel))
> -		return -EPROBE_DEFER;
> -
>  	lvds->panel_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);

And this part is yet another thing.

Maxime

--6ngqa3iwquyt5oba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFpM0AAKCRAnX84Zoj2+
drjIAYDnq4ecrd/T6q7R94YP6rLPNLF2rwe9Pm3d0I20bFZPJpwVN94S42YtizBN
7yeYtmEBgIaFn6kwFgjs2At/9Dhqpf+bifvBteSHGap2vs4fQTn9NbIvMRCcO8+5
+Ljk1e3nQQ==
=wsPB
-----END PGP SIGNATURE-----

--6ngqa3iwquyt5oba--

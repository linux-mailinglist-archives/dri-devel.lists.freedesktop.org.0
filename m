Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1618D47DA
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C953D10E352;
	Thu, 30 May 2024 09:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ns7sUehu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3611010E352;
 Thu, 30 May 2024 09:01:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D8BC6271C;
 Thu, 30 May 2024 09:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B987CC4AF48;
 Thu, 30 May 2024 09:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717059693;
 bh=lZThi9wXEq1DeFIGkTm/ThLzLPGQyZuG6twuESBqFek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ns7sUehuW+37zbVY3/e76GfuDhDxdIVa+kcpIQ42lH3aHbznfIMnhhyqRx/lCLEcb
 4MkNrmkLlE+eit3K6eEns3R5XeCGhwsY7X+3Hd+mspj0REJQyyc5pCZLuyboeogpif
 6rgkAOUcLnEIXdPJkJCjvBSm+NZlDVbHImxpbbAsqtNwYU4+MpvK/xnNv8+VgbUImO
 vLCIHb3cONFRZrnw6TTyV+0XglrIKSP7nACamoYMxib5wzZsp4y0Q/E3H82TZalr/V
 3Xz4jnwnM+1BOUc1dUnRRF4QeHB7h2yGQfs3Vy/QLyYOrL5R9v4bTBT4xccy1cJvs7
 GWR7gyet/ThuQ==
Date: Thu, 30 May 2024 11:01:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] drm/bridge-connector: implement glue code for
 HDMI connector
Message-ID: <20240530-urban-friendly-kittiwake-ff663b@houat>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-3-a1d184d68fe3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ghdpgv6m7rgbkokr"
Content-Disposition: inline
In-Reply-To: <20240530-bridge-hdmi-connector-v3-3-a1d184d68fe3@linaro.org>
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


--ghdpgv6m7rgbkokr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 30, 2024 at 02:12:26AM GMT, Dmitry Baryshkov wrote:
> In order to let bridge chains implement HDMI connector infrastructure,
> add necessary glue code to the drm_bridge_connector. In case there is a
> bridge that sets DRM_BRIDGE_OP_HDMI, drm_bridge_connector will register
> itself as a HDMI connector and provide proxy drm_connector_hdmi_funcs
> implementation.
>=20
> Note, to simplify implementation, there can be only one bridge in a
> chain that sets DRM_BRIDGE_OP_HDMI. Setting more than one is considered
> an error. This limitation can be lifted later, if the need arises.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 101 +++++++++++++++++++++++++++=
+++++-
>  drivers/gpu/drm/drm_debugfs.c          |   2 +
>  include/drm/drm_bridge.h               |  82 ++++++++++++++++++++++++++
>  3 files changed, 182 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm=
_bridge_connector.c
> index e093fc8928dc..8dca3eda5381 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -18,6 +18,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/display/drm_hdmi_state_helper.h>
> =20
>  /**
>   * DOC: overview
> @@ -87,6 +88,13 @@ struct drm_bridge_connector {
>  	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
>  	 */
>  	struct drm_bridge *bridge_modes;
> +	/**
> +	 * @bridge_hdmi:
> +	 *
> +	 * The bridge in the chain that implements necessary support for the
> +	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> +	 */
> +	struct drm_bridge *bridge_hdmi;
>  };
> =20
>  #define to_drm_bridge_connector(x) \
> @@ -287,6 +295,61 @@ static const struct drm_connector_helper_funcs drm_b=
ridge_connector_helper_funcs
>  	.disable_hpd =3D drm_bridge_connector_disable_hpd,
>  };
> =20
> +static enum drm_mode_status
> +drm_bridge_connector_tmds_char_rate_valid(const struct drm_connector *co=
nnector,
> +					  const struct drm_display_mode *mode,
> +					  unsigned long long tmds_rate)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi;
> +	if (bridge)
> +		return bridge->funcs->tmds_char_rate_valid ?
> +			bridge->funcs->tmds_char_rate_valid(bridge, mode, tmds_rate) :
> +			MODE_OK;
> +
> +	return MODE_ERROR;
> +}

It's kind of a nitpick, but I think the following syntax is clearer:

if (bridge)
	if (bridge->funcs->tmds_char_rate_valid)
		return bridge->funcs->tmds_char_rate_valid(bridge, mode, tmds_rate);
	else
		return MODE_OK;

return MODE_ERROR;

> +static int drm_bridge_connector_clear_infoframe(struct drm_connector *co=
nnector,
> +						enum hdmi_infoframe_type type)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi;
> +	if (bridge)
> +		return bridge->funcs->clear_infoframe ?
> +			bridge->funcs->clear_infoframe(bridge, type) :
> +			0;
> +
> +	return -EINVAL;
> +}
> +
> +static int drm_bridge_connector_write_infoframe(struct drm_connector *co=
nnector,
> +						enum hdmi_infoframe_type type,
> +						const u8 *buffer, size_t len)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi;
> +	if (bridge)
> +		return bridge->funcs->write_infoframe(bridge, type, buffer, len);
> +
> +	return -EINVAL;
> +}
> +
> +static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_f=
uncs =3D {
> +	.tmds_char_rate_valid =3D drm_bridge_connector_tmds_char_rate_valid,
> +	.clear_infoframe =3D drm_bridge_connector_clear_infoframe,
> +	.write_infoframe =3D drm_bridge_connector_write_infoframe,
> +};
> +
>  /* ---------------------------------------------------------------------=
--------
>   * Bridge Connector Initialisation
>   */
> @@ -312,6 +375,10 @@ struct drm_connector *drm_bridge_connector_init(stru=
ct drm_device *drm,
>  	struct drm_connector *connector;
>  	struct i2c_adapter *ddc =3D NULL;
>  	struct drm_bridge *bridge, *panel_bridge =3D NULL;
> +	const char *vendor =3D "Unknown";
> +	const char *product =3D "Unknown";
> +	unsigned int supported_formats =3D BIT(HDMI_COLORSPACE_RGB);
> +	unsigned int max_bpc =3D 8;
>  	int connector_type;
>  	int ret;
> =20
> @@ -348,6 +415,25 @@ struct drm_connector *drm_bridge_connector_init(stru=
ct drm_device *drm,
>  			bridge_connector->bridge_detect =3D bridge;
>  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>  			bridge_connector->bridge_modes =3D bridge;
> +		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> +			if (bridge_connector->bridge_hdmi)
> +				return ERR_PTR(-EBUSY);
> +			if (!bridge->funcs->write_infoframe)
> +				return ERR_PTR(-EINVAL);
> +
> +			bridge_connector->bridge_hdmi =3D bridge;
> +
> +			if (bridge->supported_formats)
> +				supported_formats =3D bridge->supported_formats;
> +			if (bridge->max_bpc)
> +				max_bpc =3D bridge->max_bpc;
> +		}
> +
> +		if (bridge->vendor)
> +			vendor =3D bridge->vendor;
> +
> +		if (bridge->product)
> +			product =3D bridge->product;

I don't think we should allow HDMI bridges without a product or vendor.
We should at the very least warn or return an error there, preferably
the latter to start with. We can always relax the rule if it turns out
to be too strict later on.

>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type =3D bridge->type;
> @@ -370,9 +456,18 @@ struct drm_connector *drm_bridge_connector_init(stru=
ct drm_device *drm,
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> -	ret =3D drmm_connector_init(drm, connector,
> -				  &drm_bridge_connector_funcs,
> -				  connector_type, ddc);
> +	if (bridge_connector->bridge_hdmi)
> +		ret =3D drmm_connector_hdmi_init(drm, connector,
> +					       vendor, product,
> +					       &drm_bridge_connector_funcs,
> +					       &drm_bridge_connector_hdmi_funcs,
> +					       connector_type, ddc,
> +					       supported_formats,
> +					       max_bpc);
> +	else
> +		ret =3D drmm_connector_init(drm, connector,
> +					  &drm_bridge_connector_funcs,
> +					  connector_type, ddc);
>  	if (ret) {
>  		kfree(bridge_connector);
>  		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index dd39a5b7a711..e385d90ef893 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -762,6 +762,8 @@ static int bridges_show(struct seq_file *m, void *dat=
a)
>  			drm_puts(&p, " hpd");
>  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>  			drm_puts(&p, " modes");
> +		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> +			drm_puts(&p, " hdmi");
>  		drm_puts(&p, "\n");
>  	}
> =20
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4baca0d9107b..c45e539fe276 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -630,6 +630,54 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*hpd_disable)(struct drm_bridge *bridge);
> =20
> +	/**
> +	 * @tmds_char_rate_valid:
> +	 *
> +	 * Check whether a particular TMDS character rate is supported by the
> +	 * driver.
> +	 *
> +	 * This callback is optional and should only be implemented by the
> +	 * bridges that take part in the HDMI connector implementation. Bridges
> +	 * that implement it shall set set the DRM_BRIDGE_OP_HDMI flag in their
> +	 * &drm_bridge->ops.
> +	 *
> +	 * Returns:
> +	 *
> +	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
> +	 * in &enum drm_mode_status.
> +	 */
> +	enum drm_mode_status
> +	(*tmds_char_rate_valid)(const struct drm_bridge *bridge,
> +				const struct drm_display_mode *mode,
> +				unsigned long long tmds_rate);

Would an HDMI prefix make sense here?

> +	/**
> +	 * @clear_infoframe:
> +	 *
> +	 * This callback clears the infoframes in the hardware during commit.
> +	 * It will be called multiple times, once for every disabled infoframe
> +	 * type.
> +	 *
> +	 * This callback is optional and should only be implemented by the
> +	 * bridges that take part in the HDMI connector implementation. Bridges
> +	 * that implement it shall set set the DRM_BRIDGE_OP_HDMI flag in their
> +	 * &drm_bridge->ops.
> +	 */
> +	int (*clear_infoframe)(struct drm_bridge *bridge,
> +			       enum hdmi_infoframe_type type);

Missing newline there.

> +	/**
> +	 * @write_infoframe:
> +	 *
> +	 * Program the infoframe into the hardware. It will be called multiple
> +	 * times, once for every updated infoframe type.
> +	 *
> +	 * This callback is optional but it must be implemented by bridges that
> +	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
> +	 */
> +	int (*write_infoframe)(struct drm_bridge *bridge,
> +			       enum hdmi_infoframe_type type,
> +			       const u8 *buffer, size_t len);
> +
>  	/**
>  	 * @debugfs_init:
>  	 *
> @@ -705,6 +753,16 @@ enum drm_bridge_ops {
>  	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
>  	 */
>  	DRM_BRIDGE_OP_MODES =3D BIT(3),
> +	/**
> +	 * @DRM_BRIDGE_OP_HDMI: The bridge provides HDMI connector operations,
> +	 * including infoframes support. Bridges that set this flag must
> +	 * implement the &drm_bridge_funcs->write_infoframe callback.
> +	 *
> +	 * Note: currently there can be at most one bridge in a chain that sets
> +	 * this bit. This is to simplify corresponding glue code in connector
> +	 * drivers.
> +	 */
> +	DRM_BRIDGE_OP_HDMI =3D BIT(4),
>  };
> =20
>  /**
> @@ -773,6 +831,30 @@ struct drm_bridge {
>  	 * @hpd_cb.
>  	 */
>  	void *hpd_data;
> +
> +	/**
> +	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
> +	 * generation.
> +	 */
> +	const char *vendor;
> +
> +	/**
> +	 * @product: Name of the product to be used for the SPD InfoFrame
> +	 * generation.
> +	 */
> +	const char *product;
> +
> +	/**
> +	 * @supported_formats: Bitmask of @hdmi_colorspace listing supported
> +	 * output formats. This is only relevant if @DRM_BRIDGE_OP_HDMI is set.
> +	 */
> +	unsigned int supported_formats;
> +
> +	/**
> +	 * @max_bpc: Maximum bits per char the HDMI bridge supports. This is
> +	 * only relevant if @DRM_BRIDGE_OP_HDMI is set.
> +	 */

We could probably document that the only allowed values are 8, 10 or 12.

Thanks!
Maxime

--ghdpgv6m7rgbkokr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlhAZgAKCRAnX84Zoj2+
dlE4AX9K8dA6qluBIUXhVjPg6R9iqI8rjNxRFWQfyEtCHkca4gaSgxwK9W30/CHI
kww/id4BfjpYPdyuVqYwHKiWYGGn9RvE5dKGmJrl2l6KvMs3E74TLPTvJkQh4ZIf
K0uWt7penw==
=rH2p
-----END PGP SIGNATURE-----

--ghdpgv6m7rgbkokr--

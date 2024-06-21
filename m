Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901DC912095
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 11:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D7E10E270;
	Fri, 21 Jun 2024 09:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eZpEDC10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484A710E270
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 09:30:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 69930CE2BF4;
 Fri, 21 Jun 2024 09:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340DEC2BBFC;
 Fri, 21 Jun 2024 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718962231;
 bh=KIrnj4uU4MmljxojAoJUb2T0pdyTw9mQatfTq63sbZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eZpEDC10+mykbhCcMYrYRX5ItdEL8T9ckKbdI7C5s5cxt7D1ketwJbdVrHzM6xOeQ
 572v5zdE3Wwa26z6W41TfehS4iantG18q+mbsbDcZkS5A5VCgyeinIg8Vh7ocnjnO5
 58bzrQxYYEctWLXJL97oX1ALp8Otos0ICftPDpqbY2WwQe5ek1ccOmEt7W9i1aT55q
 SrDO6Pbv4mK7sFCyMH/zVSlDN+vtB3tymv0ggUAB76UKKkq7GlMGvptlvVYZ8+HF+F
 t0osAvjfCZO5ffuK9PZyW6f/b0F9zumsZoV2gSUOKnCONCkHk7wBkvjEQ9eHVLJaMK
 +HFFvvzGMvkIw==
Date: Fri, 21 Jun 2024 11:30:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 4/5] drm/bridge: connector: add support for HDMI
 codec framework
Message-ID: <20240621-polite-ruby-hyrax-c4020e@houat>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-4-d59fc7865ab2@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z56li3peqeaxpv66"
Content-Disposition: inline
In-Reply-To: <20240615-drm-bridge-hdmi-connector-v1-4-d59fc7865ab2@linaro.org>
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


--z56li3peqeaxpv66
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2024 at 08:53:33PM GMT, Dmitry Baryshkov wrote:
> Add necessary glue code to be able to use new HDMI codec framework from
> the DRM bridge drivers. The drm_bridge implements a limited set of the
> hdmi_codec_ops interface, with the functions accepting both
> drm_connector and drm_bridge instead of just a generic void pointer.
>=20
> This framework is integrated with the DRM HDMI Connector framework, but
> can also be used for DisplayPort connectors.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 130 +++++++++++++++++++++++++++=
+++++-
>  include/drm/drm_bridge.h               |  46 ++++++++++++
>  2 files changed, 174 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm=
_bridge_connector.c
> index 0869b663f17e..71d6fdc2391f 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -20,6 +20,8 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
> =20
> +#include <sound/hdmi-codec.h>
> +
>  /**
>   * DOC: overview
>   *
> @@ -95,6 +97,14 @@ struct drm_bridge_connector {
>  	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
>  	 */
>  	struct drm_bridge *bridge_hdmi;
> +	/**
> +	 * @bridge_hdmi_codec:
> +	 *
> +	 * The bridge in the chain that implements necessary support for the
> +	 * HDMI Audio Codec infrastructure, if any (see
> +	 * &DRM_BRIDGE_OP_HDMI_CODEC).
> +	 */
> +	struct drm_bridge *bridge_hdmi_codec;

Can we have a setup where one bridge would support the video stream and
another one the audio?

I think for now I'd rather make them both provided by the same bridge,
and we can always change that later on if we need to.

>  };
> =20
>  #define to_drm_bridge_connector(x) \
> @@ -343,10 +353,104 @@ static int drm_bridge_connector_write_infoframe(st=
ruct drm_connector *connector,
>  	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
>  }
> =20
> +static int drm_bridge_connector_audio_startup(struct device *dev, void *=
data)
> +{
> +	struct drm_connector *connector =3D data;
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi_codec;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	if (bridge->funcs->hdmi_codec_audio_startup)
> +		return bridge->funcs->hdmi_codec_audio_startup(dev, connector, bridge);
> +	else
> +		return 0;
> +}
> +
> +static int drm_bridge_connector_prepare(struct device *dev, void *data,
> +					struct hdmi_codec_daifmt *fmt,
> +					struct hdmi_codec_params *hparms)
> +{
> +	struct drm_connector *connector =3D data;
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi_codec;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	return bridge->funcs->hdmi_codec_prepare(dev, connector, bridge, fmt, h=
parms);
> +}
> +
> +static void drm_bridge_connector_audio_shutdown(struct device *dev, void=
 *data)
> +{
> +	struct drm_connector *connector =3D data;
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi_codec;
> +	if (!bridge)
> +		return;
> +
> +	bridge->funcs->hdmi_codec_audio_shutdown(dev, connector, bridge);
> +}
> +
> +static int drm_bridge_connector_mute_stream(struct device *dev, void *da=
ta,
> +					    bool enable, int direction)
> +{
> +	struct drm_connector *connector =3D data;
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi_codec;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	if (bridge->funcs->hdmi_codec_mute_stream)
> +		return bridge->funcs->hdmi_codec_mute_stream(dev, connector, bridge,
> +							     enable, direction);
> +	else
> +		return -ENOTSUPP;
> +}
> +
> +static int drm_bridge_connector_get_dai_id(struct snd_soc_component *com=
ment,
> +					   struct device_node *endpoint,
> +					   void *data)
> +{
> +	struct drm_connector *connector =3D data;
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi_codec;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	if (bridge->funcs->hdmi_codec_get_dai_id)
> +		return bridge->funcs->hdmi_codec_get_dai_id(connector, bridge, endpoin=
t);
> +	else
> +		return -ENOTSUPP;
> +}
> +
> +static const struct hdmi_codec_ops drm_bridge_connector_hdmi_codec_ops =
=3D {
> +	.audio_startup =3D drm_bridge_connector_audio_startup,
> +	.prepare =3D drm_bridge_connector_prepare,
> +	.audio_shutdown =3D drm_bridge_connector_audio_shutdown,
> +	.mute_stream =3D drm_bridge_connector_mute_stream,
> +	.get_dai_id =3D drm_bridge_connector_get_dai_id,
> +};
> +
>  static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_f=
uncs =3D {
>  	.tmds_char_rate_valid =3D drm_bridge_connector_tmds_char_rate_valid,
>  	.clear_infoframe =3D drm_bridge_connector_clear_infoframe,
>  	.write_infoframe =3D drm_bridge_connector_write_infoframe,
> +	.codec_ops =3D &drm_bridge_connector_hdmi_codec_ops,
>  };
> =20
>  /* ---------------------------------------------------------------------=
--------
> @@ -427,6 +531,23 @@ struct drm_connector *drm_bridge_connector_init(stru=
ct drm_device *drm,
>  				max_bpc =3D bridge->max_bpc;
>  		}
> =20
> +		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CODEC) {
> +			if (bridge_connector->bridge_hdmi_codec)
> +				return ERR_PTR(-EBUSY);
> +			if (!bridge->funcs->hdmi_codec_prepare ||
> +			    !bridge->funcs->hdmi_codec_audio_shutdown)
> +				return ERR_PTR(-EINVAL);
> +
> +			bridge_connector->bridge_hdmi_codec =3D bridge;
> +
> +			connector->hdmi_codec.parent_dev =3D bridge->parent;
> +			connector->hdmi_codec.i2s =3D bridge->hdmi_codec_i2s;
> +			connector->hdmi_codec.spdif =3D bridge->hdmi_codec_spdif;
> +			connector->hdmi_codec.max_i2s_channels =3D bridge->max_i2s_channels;
> +
> +			bridge->hdmi_codec =3D &connector->hdmi_codec;
> +		}
> +
>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type =3D bridge->type;
> =20
> @@ -448,7 +569,7 @@ struct drm_connector *drm_bridge_connector_init(struc=
t drm_device *drm,
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> -	if (bridge_connector->bridge_hdmi)
> +	if (bridge_connector->bridge_hdmi) {
>  		ret =3D drmm_connector_hdmi_init(drm, connector,
>  					       bridge_connector->bridge_hdmi->vendor,
>  					       bridge_connector->bridge_hdmi->product,
> @@ -457,10 +578,15 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
>  					       connector_type, ddc,
>  					       supported_formats,
>  					       max_bpc);
> -	else
> +	} else {
>  		ret =3D drmm_connector_init(drm, connector,
>  					  &drm_bridge_connector_funcs,
>  					  connector_type, ddc);
> +		if (!ret && bridge_connector->bridge_hdmi_codec) {
> +			ret =3D drmm_connector_hdmi_codec_alloc(drm, connector,
> +							      &drm_bridge_connector_hdmi_codec_ops);
> +		}
> +	}
>  	if (ret) {
>  		kfree(bridge_connector);
>  		return ERR_PTR(ret);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 75019d16be64..c4a95c489b00 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -41,6 +41,8 @@ struct drm_display_info;
>  struct drm_minor;
>  struct drm_panel;
>  struct edid;
> +struct hdmi_codec_daifmt;
> +struct hdmi_codec_params;
>  struct i2c_adapter;
> =20
>  /**
> @@ -676,6 +678,29 @@ struct drm_bridge_funcs {
>  				    enum hdmi_infoframe_type type,
>  				    const u8 *buffer, size_t len);
> =20
> +	int (*hdmi_codec_audio_startup)(struct device *dev,
> +					struct drm_connector *connector,
> +					struct drm_bridge *bridge);
> +
> +	int (*hdmi_codec_prepare)(struct device *dev,
> +				  struct drm_connector *connector,
> +				  struct drm_bridge *bridge,
> +				  struct hdmi_codec_daifmt *fmt,
> +				  struct hdmi_codec_params *hparms);
> +
> +	void (*hdmi_codec_audio_shutdown)(struct device *dev,
> +					  struct drm_connector *connector,
> +					  struct drm_bridge *bridge);
> +
> +	int (*hdmi_codec_mute_stream)(struct device *dev,
> +				      struct drm_connector *connector,
> +				      struct drm_bridge *bridge,
> +				      bool enable, int direction);
> +
> +	int (*hdmi_codec_get_dai_id)(struct drm_connector *connector,
> +				     struct drm_bridge *bridge,
> +				     struct device_node *endpoint);
> +
>  	/**
>  	 * @debugfs_init:
>  	 *
> @@ -761,6 +786,20 @@ enum drm_bridge_ops {
>  	 * drivers.
>  	 */
>  	DRM_BRIDGE_OP_HDMI =3D BIT(4),
> +	/**
> +	 * @DRM_BRIDGE_OP_HDMI_CODEC: The bridge provides HDMI Audio Codec
> +	 * operations. Bridges that set this flag must implement the
> +	 * &drm_bridge_funcs->hdmi_codec_prepare and
> +	 * &drm_bridge_funcs->hdmi_codec_audio_shutdown callbacks and set the
> +	 * relevant field in the &drm_bridge structure.
> +	 *
> +	 * This framework can be used by both HDMI and DisplayPort bridges.
> +	 *
> +	 * Note: currently there can be at most one bridge in a chain that sets
> +	 * this bit. This is to simplify corresponding glue code in connector
> +	 * drivers.
> +	 */
> +	DRM_BRIDGE_OP_HDMI_CODEC =3D BIT(5),

I think I'd go and make it one step further and make HDMI_CODEC imply HDMI.

Maxime

--z56li3peqeaxpv66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnVINAAKCRDj7w1vZxhR
xfwFAQDVfcQerhRP7FesrJHbbBhzDxuL9L3ok6NA2FxeoJyPjQD/RkeeuuGgDKvk
/Wv88F2z+vYsysmBMguLpuAE1EwqkQ0=
=G/D2
-----END PGP SIGNATURE-----

--z56li3peqeaxpv66--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CCDA59878
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 15:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DF410E04D;
	Mon, 10 Mar 2025 14:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RvW8r462";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9710E04D;
 Mon, 10 Mar 2025 14:55:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 873855C666D;
 Mon, 10 Mar 2025 14:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB405C4CEED;
 Mon, 10 Mar 2025 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741618553;
 bh=jPDs28OqTsIM6/e3RyC+XEjBAxuUlJKwyrEAgXb8e+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RvW8r462ywxgdaJEzSGcHBd1/axz+1CIHYtyL6hXofzkKPFl5WIpDZviyG2ym368X
 C+4n5/+DxaeS44hK4JeEx3Fbtf+KK+l1IBh5yBCqKuidds80HT9ULHP3i/2/drf+Kc
 GPXjfQ588TkUzEeUxhf5NlzmHu87TdjtiHdSWeC4xr0a1amw4Zsds/nKdzFe7dtlph
 ezCAjN0ra6S6e/tP2iEMxA4JaAkZ8hV0M2cHFnjzF/OXaaIHPJP/caPd8S4rV2sEIU
 icT0aNKe3vOuuZuOzzi3OVwFqTetMvo82gBn80VQaC/E0OV0LbLcQZzg59s+fXTf0k
 1KwWR7znX190w==
Date: Mon, 10 Mar 2025 15:55:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 1/2] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
Message-ID: <20250310-unnatural-puffin-of-revolution-59d726@houat>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-1-f3be215fdb78@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6kzim643ihdab7ld"
Content-Disposition: inline
In-Reply-To: <20250307-dp-hdmi-audio-v5-1-f3be215fdb78@linaro.org>
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


--6kzim643ihdab7ld
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/2] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
MIME-Version: 1.0

Hi,

On Fri, Mar 07, 2025 at 07:55:52AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20
> As pointed out by Laurent, OP bits are supposed to describe operations.
> Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
> overloading DRM_BRIDGE_OP_HDMI.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  1 +
>  drivers/gpu/drm/display/drm_bridge_connector.c | 59 +++++++++++++++++---=
------
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |  1 +
>  include/drm/drm_bridge.h                       | 23 ++++++++--
>  5 files changed, 61 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index 026803034231f78c17f619dc04119bdd9b2b6679..3b93c17e25c18ae0d13e9bb74=
553cf21dcc39f9d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1130,7 +1130,7 @@ static int lt9611_probe(struct i2c_client *client)
>  	lt9611->bridge.of_node =3D client->dev.of_node;
>  	lt9611->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>  			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
> -			     DRM_BRIDGE_OP_HDMI;
> +			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
>  	lt9611->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>  	lt9611->bridge.vendor =3D "Lontium";
>  	lt9611->bridge.product =3D "LT9611";
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index 6166f197e37b552cb8a52b7b0d23ffc632f54557..5e5f8c2f95be1f5c4633f1093=
b17a00f9425bb37 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -1077,6 +1077,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_=
device *pdev,
>  	hdmi->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
>  			   DRM_BRIDGE_OP_EDID |
>  			   DRM_BRIDGE_OP_HDMI |
> +			   DRM_BRIDGE_OP_HDMI_AUDIO |
>  			   DRM_BRIDGE_OP_HPD;
>  	hdmi->bridge.of_node =3D pdev->dev.of_node;
>  	hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..030f98d454608a63154827c65=
d4822d378df3b4c 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -98,6 +98,13 @@ struct drm_bridge_connector {
>  	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
>  	 */
>  	struct drm_bridge *bridge_hdmi;
> +	/**
> +	 * @bridge_hdmi_audio:
> +	 *
> +	 * The bridge in the chain that implements necessary support for the
> +	 * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
> +	 */
> +	struct drm_bridge *bridge_hdmi_audio;
>  };
> =20
>  #define to_drm_bridge_connector(x) \
> @@ -433,7 +440,7 @@ static int drm_bridge_connector_audio_startup(struct =
drm_connector *connector)
>  		to_drm_bridge_connector(connector);
>  	struct drm_bridge *bridge;
> =20
> -	bridge =3D bridge_connector->bridge_hdmi;
> +	bridge =3D bridge_connector->bridge_hdmi_audio;
>  	if (!bridge)
>  		return -EINVAL;
> =20
> @@ -451,7 +458,7 @@ static int drm_bridge_connector_audio_prepare(struct =
drm_connector *connector,
>  		to_drm_bridge_connector(connector);
>  	struct drm_bridge *bridge;
> =20
> -	bridge =3D bridge_connector->bridge_hdmi;
> +	bridge =3D bridge_connector->bridge_hdmi_audio;
>  	if (!bridge)
>  		return -EINVAL;
> =20
> @@ -464,7 +471,7 @@ static void drm_bridge_connector_audio_shutdown(struc=
t drm_connector *connector)
>  		to_drm_bridge_connector(connector);
>  	struct drm_bridge *bridge;
> =20
> -	bridge =3D bridge_connector->bridge_hdmi;
> +	bridge =3D bridge_connector->bridge_hdmi_audio;
>  	if (!bridge)
>  		return;
> =20
> @@ -478,7 +485,7 @@ static int drm_bridge_connector_audio_mute_stream(str=
uct drm_connector *connecto
>  		to_drm_bridge_connector(connector);
>  	struct drm_bridge *bridge;
> =20
> -	bridge =3D bridge_connector->bridge_hdmi;
> +	bridge =3D bridge_connector->bridge_hdmi_audio;
>  	if (!bridge)
>  		return -EINVAL;
> =20
> @@ -576,6 +583,21 @@ struct drm_connector *drm_bridge_connector_init(stru=
ct drm_device *drm,
>  				max_bpc =3D bridge->max_bpc;
>  		}
> =20
> +		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
> +			if (bridge_connector->bridge_hdmi_audio)
> +				return ERR_PTR(-EBUSY);
> +
> +			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> +			    !bridge->hdmi_audio_spdif_playback)
> +				return ERR_PTR(-EINVAL);
> +
> +			if (!bridge->funcs->hdmi_audio_prepare ||
> +			    !bridge->funcs->hdmi_audio_shutdown)
> +				return ERR_PTR(-EINVAL);
> +
> +			bridge_connector->bridge_hdmi_audio =3D bridge;
> +		}
> +
>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type =3D bridge->type;
> =20
> @@ -611,22 +633,6 @@ struct drm_connector *drm_bridge_connector_init(stru=
ct drm_device *drm,
>  					       max_bpc);
>  		if (ret)
>  			return ERR_PTR(ret);
> -
> -		if (bridge->hdmi_audio_max_i2s_playback_channels ||
> -		    bridge->hdmi_audio_spdif_playback) {
> -			if (!bridge->funcs->hdmi_audio_prepare ||
> -			    !bridge->funcs->hdmi_audio_shutdown)
> -				return ERR_PTR(-EINVAL);
> -
> -			ret =3D drm_connector_hdmi_audio_init(connector,
> -							    bridge->hdmi_audio_dev,
> -							    &drm_bridge_connector_hdmi_audio_funcs,
> -							    bridge->hdmi_audio_max_i2s_playback_channels,
> -							    bridge->hdmi_audio_spdif_playback,
> -							    bridge->hdmi_audio_dai_port);
> -			if (ret)
> -				return ERR_PTR(ret);
> -		}
>  	} else {
>  		ret =3D drmm_connector_init(drm, connector,
>  					  &drm_bridge_connector_funcs,
> @@ -635,6 +641,19 @@ struct drm_connector *drm_bridge_connector_init(stru=
ct drm_device *drm,
>  			return ERR_PTR(ret);
>  	}
> =20
> +	if (bridge_connector->bridge_hdmi_audio) {
> +		bridge =3D bridge_connector->bridge_hdmi_audio;
> +
> +		ret =3D drm_connector_hdmi_audio_init(connector,
> +						    bridge->hdmi_audio_dev,
> +						    &drm_bridge_connector_hdmi_audio_funcs,
> +						    bridge->hdmi_audio_max_i2s_playback_channels,
> +						    bridge->hdmi_audio_spdif_playback,
> +						    bridge->hdmi_audio_dai_port);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
>  	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
> =20
>  	if (bridge_connector->bridge_hpd)
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm=
/hdmi/hdmi_bridge.c
> index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..ab6c8bc4a30b681f7de8ca703=
1f833795d1f7d94 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -515,6 +515,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
>  	bridge->ops =3D DRM_BRIDGE_OP_HPD |
>  		DRM_BRIDGE_OP_DETECT |
>  		DRM_BRIDGE_OP_HDMI |
> +		DRM_BRIDGE_OP_HDMI_AUDIO |
>  		DRM_BRIDGE_OP_EDID;
>  	bridge->hdmi_audio_max_i2s_playback_channels =3D 8;
>  	bridge->hdmi_audio_dev =3D &hdmi->pdev->dev;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index d4c75d59fa12be1bd7375ce3ea56415235781b28..dff8cf035b30d5c7e00bfdf5d=
6e12802559823ba 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -693,8 +693,10 @@ struct drm_bridge_funcs {
>  	/**
>  	 * @hdmi_audio_prepare:
>  	 * Configures HDMI-encoder for audio stream. Can be called multiple
> -	 * times for each setup. Mandatory if HDMI audio is enabled in the
> -	 * bridge's configuration.
> +	 * times for each setup.
> +	 *
> +	 * This callback is optional but it must be implemented by bridges that
> +	 * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
>  	 *
>  	 * Returns:
>  	 * 0 on success, a negative error code otherwise
> @@ -707,8 +709,10 @@ struct drm_bridge_funcs {
>  	/**
>  	 * @hdmi_audio_shutdown:
>  	 *
> -	 * Shut down the audio stream. Mandatory if HDMI audio is enabled in
> -	 * the bridge's configuration.
> +	 * Shut down the audio stream.
> +	 *
> +	 * This callback is optional but it must be implemented by bridges that
> +	 * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
>  	 *
>  	 * Returns:
>  	 * 0 on success, a negative error code otherwise
> @@ -814,6 +818,17 @@ enum drm_bridge_ops {
>  	 * drivers.
>  	 */
>  	DRM_BRIDGE_OP_HDMI =3D BIT(4),
> +	/**
> +	 * @DRM_BRIDGE_OP_HDMI_AUDIO: The bridge provides HDMI audio operations.
> +	 * Bridges that set this flag must implement the
> +	 * &drm_bridge_funcs->hdmi_audio_prepare and
> +	 * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
> +	 *
> +	 * Note: currently there can be at most one bridge in a chain that sets
> +	 * this bit. This is to simplify corresponding glue code in connector
> +	 * drivers.
> +	 */
> +	DRM_BRIDGE_OP_HDMI_AUDIO =3D BIT(5),

We should make this conditional on HDMI being set. It doesn't make sense
to have OP_HDMI_AUDIO enabled when OP_HDMI isn't.

This should be mentioned in the documentation, and possibly with a
sanity check at initialization.

Maxime

--6kzim643ihdab7ld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ879dQAKCRDj7w1vZxhR
xelEAP9WmJlwBe2Jp0QbaQXTIMZopqZED6JWgdRvMtLkXSsJsAD+Pgj1/98v7T4N
4/5ygceNZkHMnRddG5gesVBrQPAqdQU=
=Nc1I
-----END PGP SIGNATURE-----

--6kzim643ihdab7ld--

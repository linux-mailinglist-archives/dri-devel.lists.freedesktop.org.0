Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005BE9F52C7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E98810EA2C;
	Tue, 17 Dec 2024 17:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nKG+oFPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01C310EA2B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 17:22:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 853495C5F59;
 Tue, 17 Dec 2024 17:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B3AC4CED3;
 Tue, 17 Dec 2024 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734456160;
 bh=zQbIKDRM592+hawO75Ooshipd8oyaXNk7Gf7R94zduE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nKG+oFPsrqgjfrh9Fl3Cjz4OEPORoY+mW1h60B+gRPtfaLkT6veP8tcCdupoAclb3
 RJjGQMdiQZbY9zcPxe0NcC45qMV0AVBokqiKSNOm2MWwJRiKtmRPQOW6Xw+N1Pm8N6
 MOZJvzHv+TgCflj5imjYcixhFIfdeXTg3HrdHSVgk84aPxr0ezvpGqZDgwd4sZKimT
 hKSIu1Evszr6qXicGts/ibUSct1kRQVTYOHn0W5SPLKJeO6DP+Oe64oD+o8w1ccfgO
 EFWniDle2im+G7Vdq81l67t/KaoALRrOHHXc0fa+BqXypFOjB8nsvKoQQNSlMOm05A
 hMR+N1rpfzQ4Q==
Date: Tue, 17 Dec 2024 18:22:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 03/10] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <20241217-thistle-rattlesnake-of-current-dfd247@houat>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-drm-bridge-hdmi-connector-v7-3-cb9df2b6a515@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="n5vyky243vwfzwmw"
Content-Disposition: inline
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-3-cb9df2b6a515@linaro.org>
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


--n5vyky243vwfzwmw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 03/10] drm/connector: implement generic HDMI codec
 helpers
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 02:40:25AM +0200, Dmitry Baryshkov wrote:
> Several DRM drivers implement HDMI codec support (despite its name it
> applies to both HDMI and DisplayPort drivers). Implement generic
> framework to be used by these drivers. This removes a requirement to
> implement get_eld() callback and provides default implementation for
> codec's plug handling.
>=20
> The framework is integrated with the DRM HDMI Connector framework, but
> can be used by DisplayPort drivers.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/Makefile                   |   1 +
>  drivers/gpu/drm/drm_connector.c            |   5 +
>  drivers/gpu/drm/drm_connector_hdmi_codec.c | 189 +++++++++++++++++++++++=
++++++
>  include/drm/drm_connector.h                | 125 +++++++++++++++++++
>  4 files changed, 320 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 19fb370fbc56772077973c864df71e4b8e0bf99b..46e6dbc355afe4015ff2327ba=
04211cdc011a0b7 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -42,6 +42,7 @@ drm-y :=3D \
>  	drm_cache.o \
>  	drm_color_mgmt.o \
>  	drm_connector.o \
> +	drm_connector_hdmi_codec.o \
>  	drm_crtc.o \
>  	drm_displayid.o \
>  	drm_drv.o \
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index bbdaaf7022b62d84594a29f1b60144920903a99a..4abfbded962bf45b793a2bd5b=
1b5c4d9f478a1f7 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -33,6 +33,7 @@
>  #include <drm/drm_sysfs.h>
>  #include <drm/drm_utils.h>
> =20
> +#include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/uaccess.h>
> =20
> @@ -280,6 +281,7 @@ static int __drm_connector_init(struct drm_device *de=
v,
>  	mutex_init(&connector->eld_mutex);
>  	mutex_init(&connector->edid_override_mutex);
>  	mutex_init(&connector->hdmi.infoframes.lock);
> +	mutex_init(&connector->hdmi_codec.lock);
>  	connector->edid_blob_ptr =3D NULL;
>  	connector->epoch_counter =3D 0;
>  	connector->tile_blob_ptr =3D NULL;
> @@ -632,6 +634,8 @@ void drm_connector_cleanup(struct drm_connector *conn=
ector)
>  		    DRM_CONNECTOR_REGISTERED))
>  		drm_connector_unregister(connector);
> =20
> +	platform_device_unregister(connector->hdmi_codec.codec_pdev);
> +
>  	if (connector->privacy_screen) {
>  		drm_privacy_screen_put(connector->privacy_screen);
>  		connector->privacy_screen =3D NULL;
> @@ -670,6 +674,7 @@ void drm_connector_cleanup(struct drm_connector *conn=
ector)
>  		connector->funcs->atomic_destroy_state(connector,
>  						       connector->state);
> =20
> +	mutex_destroy(&connector->hdmi_codec.lock);
>  	mutex_destroy(&connector->hdmi.infoframes.lock);
>  	mutex_destroy(&connector->mutex);
> =20
> diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm=
/drm_connector_hdmi_codec.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a6e2f27c3f7ff9d57cf19c055=
870001daff4c676
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) 2024 Linaro Ltd
> + */
> +
> +#include <linux/mutex.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_device.h>
> +
> +#include <sound/hdmi-codec.h>
> +
> +static int drm_connector_hdmi_codec_audio_startup(struct device *dev, vo=
id *data)
> +{
> +	struct drm_connector *connector =3D data;
> +	const struct drm_connector_hdmi_codec_funcs *funcs =3D
> +		connector->hdmi_codec.funcs;
> +
> +	if (funcs->audio_startup)
> +		return funcs->audio_startup(connector);
> +
> +	return 0;
> +}
> +
> +static int drm_connector_hdmi_codec_prepare(struct device *dev, void *da=
ta,
> +					    struct hdmi_codec_daifmt *fmt,
> +					    struct hdmi_codec_params *hparms)
> +{
> +	struct drm_connector *connector =3D data;
> +	const struct drm_connector_hdmi_codec_funcs *funcs =3D
> +		connector->hdmi_codec.funcs;
> +
> +	return funcs->prepare(connector, fmt, hparms);
> +}
> +
> +static void drm_connector_hdmi_codec_audio_shutdown(struct device *dev, =
void *data)
> +{
> +	struct drm_connector *connector =3D data;
> +	const struct drm_connector_hdmi_codec_funcs *funcs =3D
> +		connector->hdmi_codec.funcs;
> +
> +	return funcs->audio_shutdown(connector);
> +}
> +
> +static int drm_connector_hdmi_codec_mute_stream(struct device *dev, void=
 *data,
> +						bool enable, int direction)
> +{
> +	struct drm_connector *connector =3D data;
> +	const struct drm_connector_hdmi_codec_funcs *funcs =3D
> +		connector->hdmi_codec.funcs;
> +
> +	if (funcs->mute_stream)
> +		return funcs->mute_stream(connector, enable, direction);
> +
> +	return -ENOTSUPP;
> +}
> +
> +static int drm_connector_hdmi_codec_get_dai_id(struct snd_soc_component =
*comment,
> +		  struct device_node *endpoint,
> +		  void *data)
> +{
> +	struct drm_connector *connector =3D data;
> +	struct of_endpoint of_ep;
> +	int ret;
> +
> +	if (connector->hdmi_codec.dai_port < 0)
> +		return -ENOTSUPP;
> +
> +	ret =3D of_graph_parse_endpoint(endpoint, &of_ep);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (of_ep.port =3D=3D connector->hdmi_codec.dai_port)
> +		return 0;
> +
> +	return -EINVAL;
> +}
> +
> +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *da=
ta,
> +					    uint8_t *buf, size_t len)
> +{
> +	struct drm_connector *connector =3D data;
> +
> +	mutex_lock(&connector->eld_mutex);
> +	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> +	mutex_unlock(&connector->eld_mutex);
> +
> +	return 0;
> +}
> +
> +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> +						    void *data,
> +						    hdmi_codec_plugged_cb fn,
> +						    struct device *codec_dev)
> +{
> +	struct drm_connector *connector =3D data;
> +
> +	mutex_lock(&connector->hdmi_codec.lock);
> +
> +	connector->hdmi_codec.plugged_cb =3D fn;
> +	connector->hdmi_codec.plugged_cb_dev =3D codec_dev;
> +
> +	fn(codec_dev, connector->hdmi_codec.last_state);
> +
> +	mutex_unlock(&connector->hdmi_codec.lock);
> +
> +	return 0;
> +}
> +
> +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *conne=
ctor,
> +					     bool plugged)
> +{
> +	mutex_lock(&connector->hdmi_codec.lock);
> +
> +	connector->hdmi_codec.last_state =3D plugged;
> +
> +	if (connector->hdmi_codec.plugged_cb &&
> +	    connector->hdmi_codec.plugged_cb_dev)
> +		connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> +						 connector->hdmi_codec.last_state);
> +
> +	mutex_unlock(&connector->hdmi_codec.lock);
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> +
> +static const struct hdmi_codec_ops drm_connector_hdmi_codec_ops =3D {
> +	.audio_startup =3D drm_connector_hdmi_codec_audio_startup,
> +	.prepare =3D drm_connector_hdmi_codec_prepare,
> +	.audio_shutdown =3D drm_connector_hdmi_codec_audio_shutdown,
> +	.mute_stream =3D drm_connector_hdmi_codec_mute_stream,
> +	.get_eld =3D drm_connector_hdmi_codec_get_eld,
> +	.get_dai_id =3D drm_connector_hdmi_codec_get_dai_id,
> +	.hook_plugged_cb =3D drm_connector_hdmi_codec_hook_plugged_cb,
> +};
> +
> +/**
> + * drm_connector_hdmi_audio_init - Initialize HDMI Codec device for the =
DRM connector
> + * @connector: A pointer to the connector to allocate codec for
> + * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
> + * @funcs: callbacks for this HDMI Codec
> + * @max_i2s_playback_channels: maximum number of playback I2S channels
> + * @spdif_playback: set if HDMI codec has S/PDIF playback port
> + * @dai_port: sound DAI port, -1 if it is not enabled
> + *
> + * Create a HDMI codec device to be used with the specified connector.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_connector_hdmi_audio_init(struct drm_connector *connector,
> +				  struct device *hdmi_codec_dev,
> +				  const struct drm_connector_hdmi_codec_funcs *funcs,
> +				  unsigned int max_i2s_playback_channels,
> +				  bool spdif_playback,
> +				  int dai_port)
> +{
> +	struct hdmi_codec_pdata codec_pdata =3D {
> +		.ops =3D &drm_connector_hdmi_codec_ops,
> +		.max_i2s_channels =3D max_i2s_playback_channels,
> +		.i2s =3D !!max_i2s_playback_channels,
> +		.spdif =3D spdif_playback,
> +		.no_i2s_capture =3D true,
> +		.no_spdif_capture =3D true,
> +		.data =3D connector,
> +	};
> +	struct platform_device *pdev;
> +
> +	if (!funcs ||
> +	    !funcs->prepare ||
> +	    !funcs->audio_shutdown)
> +		return -EINVAL;
> +
> +	connector->hdmi_codec.funcs =3D funcs;
> +	connector->hdmi_codec.dai_port =3D dai_port;
> +
> +	pdev =3D platform_device_register_data(hdmi_codec_dev,
> +					     HDMI_CODEC_DRV_NAME,
> +					     PLATFORM_DEVID_AUTO,
> +					     &codec_pdata, sizeof(codec_pdata));
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
> +
> +	connector->hdmi_codec.codec_pdev =3D pdev;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_audio_init);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1e2b25e204cb523d61d30f5409faa059bf2b86eb..536d604b6fb27368c43805a2e=
cf57fac06b3d472 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -46,6 +46,8 @@ struct drm_property_blob;
>  struct drm_printer;
>  struct drm_privacy_screen;
>  struct edid;
> +struct hdmi_codec_daifmt;
> +struct hdmi_codec_params;
>  struct i2c_adapter;
> =20
>  enum drm_connector_force {
> @@ -1141,6 +1143,53 @@ struct drm_connector_state {
>  	struct drm_connector_hdmi_state hdmi;
>  };
> =20
> +struct drm_connector_hdmi_codec_funcs {
> +	/**
> +	 * @audio_startup:
> +	 *
> +	 * Called when ASoC starts an audio stream setup. The
> +	 * @hdmi_audio_startup is optional.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code otherwise
> +	 */
> +	int (*audio_startup)(struct drm_connector *connector);

With the naming comment I made on the previous version addressed, and
assuming it's been tested on a pi3 and pi4,

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--n5vyky243vwfzwmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2GzXQAKCRAnX84Zoj2+
dsKSAX9vufOsRekIa/4XJaAhDJqoEup2xB5uvighbZwIoIZEVJmmq7nHx6BHNDg4
AS6ETpsBgJTSza8YCK2DeOLYXomh9ypJXS/3syfSWF0dqa/1+Pg1mTRqhaTEip+j
vvOCsuKfcg==
=/XQn
-----END PGP SIGNATURE-----

--n5vyky243vwfzwmw--

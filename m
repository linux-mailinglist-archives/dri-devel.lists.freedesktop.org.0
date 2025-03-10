Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED222A5991A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B703110E494;
	Mon, 10 Mar 2025 15:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fKH9qsZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7672410E2B0;
 Mon, 10 Mar 2025 15:08:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49DE2A45D9B;
 Mon, 10 Mar 2025 15:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CD2C4CEE5;
 Mon, 10 Mar 2025 15:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741619319;
 bh=Omof6Xd8LarrT4and9eviwbTFWywOKED69nZ/fWp6YA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fKH9qsZwP8ugDles+JJsA8D0cjO3imwfKDmoqX2GrIgi11IFb7nO24xKbW5JAr/cM
 ww8yTgxTWNSLt0bpPz/FxQIXYfVCMW6x35II9cy0H7nYYfBgq6hrWNqGEC4Cv2ZJ53
 36hQXEWQHnC++8/un9InLLE+xgDbUl8gOtdQy7yfmSBe/J/a0LM8S6giXyjtHYNFmA
 ANvOd69bbbXXOrvqOrAiI4AXPYTgOL5f0/4pCCePQqGC/iHPRLGDZP63EKox+gGO1d
 ZbVDYEicoAm9mnFgZ/GJ3/Yj/Vn2ZUjMrlktQpZD0kH9ebw/7XivPdO++PA8l0IL/g
 p9/fgNKi67sSw==
Date: Mon, 10 Mar 2025 16:08:33 +0100
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
Subject: Re: [PATCH v5 2/2] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <20250310-daft-bittern-of-foundation-67c657@houat>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-2-f3be215fdb78@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q5m7akfsaxvrrrfh"
Content-Disposition: inline
In-Reply-To: <20250307-dp-hdmi-audio-v5-2-f3be215fdb78@linaro.org>
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


--q5m7akfsaxvrrrfh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] drm/msm/dp: reuse generic HDMI codec
 implementation
MIME-Version: 1.0

On Fri, Mar 07, 2025 at 07:55:53AM +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>=20
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/Kconfig         |   1 +
>  drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------=
------
>  drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
>  drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
>  drivers/gpu/drm/msm/dp/dp_display.h |   6 --
>  drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
>  6 files changed, 31 insertions(+), 170 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 974bc7c0ea761147d3326bdce9039d6f26f290d0..7f127e2ae44292f8f5c7ff6a9=
251c3d7ec8c9f58 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -104,6 +104,7 @@ config DRM_MSM_DPU
>  config DRM_MSM_DP
>  	bool "Enable DisplayPort support in MSM DRM driver"
>  	depends on DRM_MSM
> +	select DRM_DISPLAY_HDMI_AUDIO_HELPER
>  	select RATIONAL
>  	default y
>  	help
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/d=
p_audio.c
> index 70fdc9fe228a7149546accd8479a9e4397f3d5dd..f8bfb908f9b4bf93ad5480f07=
85e3aed23dde160 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -13,13 +13,13 @@
> =20
>  #include "dp_catalog.h"
>  #include "dp_audio.h"
> +#include "dp_drm.h"
>  #include "dp_panel.h"
>  #include "dp_reg.h"
>  #include "dp_display.h"
>  #include "dp_utils.h"
> =20
>  struct msm_dp_audio_private {
> -	struct platform_device *audio_pdev;
>  	struct platform_device *pdev;
>  	struct drm_device *drm_dev;
>  	struct msm_dp_catalog *catalog;
> @@ -160,24 +160,11 @@ static void msm_dp_audio_enable(struct msm_dp_audio=
_private *audio, bool enable)
>  	msm_dp_catalog_audio_enable(catalog, enable);
>  }
> =20
> -static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platfor=
m_device *pdev)
> +static struct msm_dp_audio_private *msm_dp_audio_get_data(struct msm_dp =
*msm_dp_display)
>  {
>  	struct msm_dp_audio *msm_dp_audio;
> -	struct msm_dp *msm_dp_display;
> -
> -	if (!pdev) {
> -		DRM_ERROR("invalid input\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> -	if (!msm_dp_display) {
> -		DRM_ERROR("invalid input\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> =20
>  	msm_dp_audio =3D msm_dp_display->msm_dp_audio;
> -
>  	if (!msm_dp_audio) {
>  		DRM_ERROR("invalid msm_dp_audio data\n");
>  		return ERR_PTR(-EINVAL);
> @@ -186,68 +173,16 @@ static struct msm_dp_audio_private *msm_dp_audio_ge=
t_data(struct platform_device
>  	return container_of(msm_dp_audio, struct msm_dp_audio_private, msm_dp_a=
udio);
>  }
> =20
> -static int msm_dp_audio_hook_plugged_cb(struct device *dev, void *data,
> -		hdmi_codec_plugged_cb fn,
> -		struct device *codec_dev)
> -{
> -
> -	struct platform_device *pdev;
> -	struct msm_dp *msm_dp_display;
> -
> -	pdev =3D to_platform_device(dev);
> -	if (!pdev) {
> -		pr_err("invalid input\n");
> -		return -ENODEV;
> -	}
> -
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> -	if (!msm_dp_display) {
> -		pr_err("invalid input\n");
> -		return -ENODEV;
> -	}
> -
> -	return msm_dp_display_set_plugged_cb(msm_dp_display, fn, codec_dev);
> -}
> -
> -static int msm_dp_audio_get_eld(struct device *dev,
> -	void *data, uint8_t *buf, size_t len)
> -{
> -	struct platform_device *pdev;
> -	struct msm_dp *msm_dp_display;
> -
> -	pdev =3D to_platform_device(dev);
> -
> -	if (!pdev) {
> -		DRM_ERROR("invalid input\n");
> -		return -ENODEV;
> -	}
> -
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> -	if (!msm_dp_display) {
> -		DRM_ERROR("invalid input\n");
> -		return -ENODEV;
> -	}
> -
> -	mutex_lock(&msm_dp_display->connector->eld_mutex);
> -	memcpy(buf, msm_dp_display->connector->eld,
> -		min(sizeof(msm_dp_display->connector->eld), len));
> -	mutex_unlock(&msm_dp_display->connector->eld_mutex);
> -
> -	return 0;
> -}
> -
> -int msm_dp_audio_hw_params(struct device *dev,
> -	void *data,
> -	struct hdmi_codec_daifmt *daifmt,
> -	struct hdmi_codec_params *params)
> +int msm_dp_audio_prepare(struct drm_connector *connector,
> +			 struct drm_bridge *bridge,
> +			 struct hdmi_codec_daifmt *daifmt,
> +			 struct hdmi_codec_params *params)
>  {
>  	int rc =3D 0;
>  	struct msm_dp_audio_private *audio;
> -	struct platform_device *pdev;
>  	struct msm_dp *msm_dp_display;
> =20
> -	pdev =3D to_platform_device(dev);
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> +	msm_dp_display =3D to_dp_bridge(bridge)->msm_dp_display;
> =20
>  	/*
>  	 * there could be cases where sound card can be opened even
> @@ -262,7 +197,7 @@ int msm_dp_audio_hw_params(struct device *dev,
>  		goto end;
>  	}
> =20
> -	audio =3D msm_dp_audio_get_data(pdev);
> +	audio =3D msm_dp_audio_get_data(msm_dp_display);
>  	if (IS_ERR(audio)) {
>  		rc =3D PTR_ERR(audio);
>  		goto end;
> @@ -281,15 +216,14 @@ int msm_dp_audio_hw_params(struct device *dev,
>  	return rc;
>  }
> =20
> -static void msm_dp_audio_shutdown(struct device *dev, void *data)
> +void msm_dp_audio_shutdown(struct drm_connector *connector,
> +			   struct drm_bridge *bridge)
>  {
>  	struct msm_dp_audio_private *audio;
> -	struct platform_device *pdev;
>  	struct msm_dp *msm_dp_display;
> =20
> -	pdev =3D to_platform_device(dev);
> -	msm_dp_display =3D platform_get_drvdata(pdev);
> -	audio =3D msm_dp_audio_get_data(pdev);
> +	msm_dp_display =3D to_dp_bridge(bridge)->msm_dp_display;
> +	audio =3D msm_dp_audio_get_data(msm_dp_display);
>  	if (IS_ERR(audio)) {
>  		DRM_ERROR("failed to get audio data\n");
>  		return;
> @@ -311,47 +245,6 @@ static void msm_dp_audio_shutdown(struct device *dev=
, void *data)
>  	msm_dp_display_signal_audio_complete(msm_dp_display);
>  }
> =20
> -static const struct hdmi_codec_ops msm_dp_audio_codec_ops =3D {
> -	.hw_params =3D msm_dp_audio_hw_params,
> -	.audio_shutdown =3D msm_dp_audio_shutdown,
> -	.get_eld =3D msm_dp_audio_get_eld,
> -	.hook_plugged_cb =3D msm_dp_audio_hook_plugged_cb,
> -};
> -
> -static struct hdmi_codec_pdata codec_data =3D {
> -	.ops =3D &msm_dp_audio_codec_ops,
> -	.max_i2s_channels =3D 8,
> -	.i2s =3D 1,
> -};
> -
> -void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_au=
dio *msm_dp_audio)
> -{
> -	struct msm_dp_audio_private *audio_priv;
> -
> -	audio_priv =3D container_of(msm_dp_audio, struct msm_dp_audio_private, =
msm_dp_audio);
> -
> -	if (audio_priv->audio_pdev) {
> -		platform_device_unregister(audio_priv->audio_pdev);
> -		audio_priv->audio_pdev =3D NULL;
> -	}
> -}
> -
> -int msm_dp_register_audio_driver(struct device *dev,
> -		struct msm_dp_audio *msm_dp_audio)
> -{
> -	struct msm_dp_audio_private *audio_priv;
> -
> -	audio_priv =3D container_of(msm_dp_audio,
> -			struct msm_dp_audio_private, msm_dp_audio);
> -
> -	audio_priv->audio_pdev =3D platform_device_register_data(dev,
> -						HDMI_CODEC_DRV_NAME,
> -						PLATFORM_DEVID_AUTO,
> -						&codec_data,
> -						sizeof(codec_data));
> -	return PTR_ERR_OR_ZERO(audio_priv->audio_pdev);
> -}
> -
>  struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
>  			struct msm_dp_catalog *catalog)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/d=
p_audio.h
> index beea34cbab77f31b33873297dc454a9cee446240..58fc14693e48bff2b57ef7278=
983e5f21ee80ac7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.h
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.h
> @@ -35,23 +35,6 @@ struct msm_dp_audio {
>  struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
>  			struct msm_dp_catalog *catalog);
> =20
> -/**
> - * msm_dp_register_audio_driver()
> - *
> - * Registers DP device with hdmi_codec interface.
> - *
> - * @dev: DP device instance.
> - * @msm_dp_audio: an instance of msm_dp_audio module.
> - *
> - *
> - * Returns the error code in case of failure, otherwise
> - * zero on success.
> - */
> -int msm_dp_register_audio_driver(struct device *dev,
> -		struct msm_dp_audio *msm_dp_audio);
> -
> -void msm_dp_unregister_audio_driver(struct device *dev, struct msm_dp_au=
dio *msm_dp_audio);
> -
>  /**
>   * msm_dp_audio_put()
>   *
> @@ -61,10 +44,12 @@ void msm_dp_unregister_audio_driver(struct device *de=
v, struct msm_dp_audio *msm
>   */
>  void msm_dp_audio_put(struct msm_dp_audio *msm_dp_audio);
> =20
> -int msm_dp_audio_hw_params(struct device *dev,
> -	void *data,
> -	struct hdmi_codec_daifmt *daifmt,
> -	struct hdmi_codec_params *params);
> +int msm_dp_audio_prepare(struct drm_connector *connector,
> +			 struct drm_bridge *bridge,
> +			 struct hdmi_codec_daifmt *daifmt,
> +			 struct hdmi_codec_params *params);
> +void msm_dp_audio_shutdown(struct drm_connector *connector,
> +			   struct drm_bridge *bridge);
> =20
>  #endif /* _DP_AUDIO_H_ */
> =20
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index bbc47d86ae9e67245c87a8365df366cce0dc529e..ece184d20c0f8bffa3c2a4821=
6015185d6cbc99e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/string_choices.h>
>  #include <drm/display/drm_dp_aux_bus.h>
> +#include <drm/display/drm_hdmi_audio_helper.h>
>  #include <drm/drm_edid.h>
> =20
>  #include "msm_drv.h"
> @@ -288,13 +289,6 @@ static int msm_dp_display_bind(struct device *dev, s=
truct device *master,
>  		goto end;
>  	}
> =20
> -
> -	rc =3D msm_dp_register_audio_driver(dev, dp->audio);
> -	if (rc) {
> -		DRM_ERROR("Audio registration Dp failed\n");
> -		goto end;
> -	}
> -
>  	rc =3D msm_dp_hpd_event_thread_start(dp);
>  	if (rc) {
>  		DRM_ERROR("Event thread create failed\n");
> @@ -316,7 +310,6 @@ static void msm_dp_display_unbind(struct device *dev,=
 struct device *master,
> =20
>  	of_dp_aux_depopulate_bus(dp->aux);
> =20
> -	msm_dp_unregister_audio_driver(dev, dp->audio);
>  	msm_dp_aux_unregister(dp->aux);
>  	dp->drm_dev =3D NULL;
>  	dp->aux->drm_dev =3D NULL;
> @@ -626,9 +619,9 @@ static void msm_dp_display_handle_plugged_change(stru=
ct msm_dp *msm_dp_display,
>  			struct msm_dp_display_private, msm_dp_display);
> =20
>  	/* notify audio subsystem only if sink supports audio */
> -	if (msm_dp_display->plugged_cb && msm_dp_display->codec_dev &&
> -			dp->audio_supported)
> -		msm_dp_display->plugged_cb(msm_dp_display->codec_dev, plugged);
> +	if (dp->audio_supported)
> +		drm_connector_hdmi_audio_plugged_notify(msm_dp_display->connector,
> +							plugged);
>  }
> =20
>  static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u=
32 data)
> @@ -907,19 +900,6 @@ static int msm_dp_display_disable(struct msm_dp_disp=
lay_private *dp)
>  	return 0;
>  }
> =20
> -int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
> -		hdmi_codec_plugged_cb fn, struct device *codec_dev)
> -{
> -	bool plugged;
> -
> -	msm_dp_display->plugged_cb =3D fn;
> -	msm_dp_display->codec_dev =3D codec_dev;
> -	plugged =3D msm_dp_display->link_ready;
> -	msm_dp_display_handle_plugged_change(msm_dp_display, plugged);
> -
> -	return 0;
> -}
> -
>  /**
>   * msm_dp_bridge_mode_valid - callback to determine if specified mode is=
 valid
>   * @bridge: Pointer to drm bridge structure
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp=
/dp_display.h
> index ecbc2d92f546a346ee53adcf1b060933e4f54317..cc6e2cab36e9c0b1527ff292e=
547cbb4d69fd95c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -7,7 +7,6 @@
>  #define _DP_DISPLAY_H_
> =20
>  #include "dp_panel.h"
> -#include <sound/hdmi-codec.h>
>  #include "disp/msm_disp_snapshot.h"
> =20
>  #define DP_MAX_PIXEL_CLK_KHZ	675000
> @@ -15,7 +14,6 @@
>  struct msm_dp {
>  	struct drm_device *drm_dev;
>  	struct platform_device *pdev;
> -	struct device *codec_dev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
>  	bool link_ready;
> @@ -25,14 +23,10 @@ struct msm_dp {
>  	bool is_edp;
>  	bool internal_hpd;
> =20
> -	hdmi_codec_plugged_cb plugged_cb;
> -
>  	struct msm_dp_audio *msm_dp_audio;
>  	bool psr_supported;
>  };
> =20
> -int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
> -		hdmi_codec_plugged_cb fn, struct device *codec_dev);
>  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_=
drm.c
> index cca57e56c906255a315e759e85a5af5982c80e9c..20b24eea0a4b619598079fbe4=
a32188485852b04 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -12,6 +12,7 @@
> =20
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> +#include "dp_audio.h"
>  #include "dp_drm.h"
> =20
>  /**
> @@ -114,6 +115,9 @@ static const struct drm_bridge_funcs msm_dp_bridge_op=
s =3D {
>  	.hpd_disable  =3D msm_dp_bridge_hpd_disable,
>  	.hpd_notify   =3D msm_dp_bridge_hpd_notify,
>  	.debugfs_init =3D msm_dp_bridge_debugfs_init,
> +
> +	.hdmi_audio_prepare =3D msm_dp_audio_prepare,
> +	.hdmi_audio_shutdown =3D msm_dp_audio_shutdown,
>  };
> =20
>  static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> @@ -320,9 +324,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display=
, struct drm_device *dev,
>  	 */
>  	if (!msm_dp_display->is_edp) {
>  		bridge->ops =3D
> +			DRM_BRIDGE_OP_HDMI_AUDIO |
>  			DRM_BRIDGE_OP_DETECT |
>  			DRM_BRIDGE_OP_HPD |
>  			DRM_BRIDGE_OP_MODES;
> +		bridge->hdmi_audio_dev =3D &msm_dp_display->pdev->dev;
> +		bridge->hdmi_audio_max_i2s_playback_channels =3D 8;
> +		bridge->hdmi_audio_dai_port =3D -1;
>  	}

I think I'd prefer the toggle to be OP_DP_AUDIO, even if the
implementation is exactly the same. That way, we'll be able to condition
it to the DP support when that arrives, and we have the latitude to
rework it to accomodate some DP subtleties without affecting the drivers
later on.

Maxime

--q5m7akfsaxvrrrfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ88AcQAKCRDj7w1vZxhR
xdoyAP4gqyo+oy1DbMYdDBWTXi+GyeSBggSLilr63lEMY5G7/QD/eH8XSVGrEDnY
1dYvK8gcF3IF1rgZ1wGXm3TwR4NLBg8=
=UBLY
-----END PGP SIGNATURE-----

--q5m7akfsaxvrrrfh--

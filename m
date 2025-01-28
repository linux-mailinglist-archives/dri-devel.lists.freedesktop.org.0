Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45542A20898
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA98010E640;
	Tue, 28 Jan 2025 10:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rlnk8Til";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45DA10E640
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:33:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B7E8A40BCF;
 Tue, 28 Jan 2025 10:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D71C4CEE4;
 Tue, 28 Jan 2025 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738060388;
 bh=W8DlBbByFnqb1POGh51232JP+KOZIr/3HnlAUPBr4bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rlnk8Til98SChBdgpfwrmxmSc7aGAleLjg2lniF0t0Gt+noCrOdeXFUZEmb5kh1kx
 UxCR+yUwOAzD+cWtB17BJjfEjtr4JtJF8oyvrtm3NHYX8J5pQktKLNyhXNNsBmL4QW
 grNbbyYTwJgl5rxHKhsl/PgyEnRqQimYl5X8fzUdu0Lte1k1f8Rx24013uOkBrG+Ux
 /1Qay8Dp/Ylp2AvAs0h3kJIZejNOzLcvfdlZdZ3K6OTdFDrCGKMa+IhT5GvPCs6u8U
 jJeRR3SNb12euekBINeUVBKzHe/yj499ucbRPEakQYehL+8xDfcE+CLaJH1SdEVU8n
 eabpUXZ54qZ5A==
Date: Tue, 28 Jan 2025 11:33:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/10] drm/connector: add CEC-related fields
Message-ID: <wchzy3tnppv5ql7k2juhynqz7kwjjsod3taykw3znxrzoomqdw@fudbksambvat>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-1-5b5b2d4956da@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rqramsz4u3ii2j5l"
Content-Disposition: inline
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-1-5b5b2d4956da@linaro.org>
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


--rqramsz4u3ii2j5l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/10] drm/connector: add CEC-related fields
MIME-Version: 1.0

On Sun, Jan 26, 2025 at 03:29:06PM +0200, Dmitry Baryshkov wrote:
> As a preparation to adding HDMI CEC helper code, add CEC-related fields
> to the struct drm_connector. Include both cec_adapter and cec_notifier,
> allowing drivers to select which one to use. The unregister callback
> is provided to let drivers unregister CEC-related data in a generic way
> without polluting drm_connector.c with dependencies on the CEC
> functions.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 13 ++++++++++++
>  include/drm/drm_connector.h     | 44 +++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 57 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..fffb718b09eaaac200e6abc75=
24bbfe98c4741f4 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device =
*dev,
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
>  	mutex_init(&connector->mutex);
> +	mutex_init(&connector->cec.mutex);
>  	mutex_init(&connector->eld_mutex);
>  	mutex_init(&connector->edid_override_mutex);
>  	mutex_init(&connector->hdmi.infoframes.lock);
> @@ -698,6 +699,16 @@ static void drm_mode_remove(struct drm_connector *co=
nnector,
>  	drm_mode_destroy(connector->dev, mode);
>  }
> =20
> +static void drm_connector_cec_unregister(struct drm_connector *connector)
> +{
> +	mutex_lock(&connector->cec.mutex);
> +
> +	if (connector->cec.funcs->unregister)
> +		connector->cec.funcs->unregister(connector);
> +
> +	mutex_unlock(&connector->cec.mutex);
> +}
> +
>  /**
>   * drm_connector_cleanup - cleans up an initialised connector
>   * @connector: connector to cleanup
> @@ -718,6 +729,8 @@ void drm_connector_cleanup(struct drm_connector *conn=
ector)
> =20
>  	platform_device_unregister(connector->hdmi_audio.codec_pdev);
> =20
> +	drm_connector_cec_unregister(connector);
> +

This should either be in a separate patch, or mentioned in the commit title=
/log

>  	if (connector->privacy_screen) {
>  		drm_privacy_screen_put(connector->privacy_screen);
>  		connector->privacy_screen =3D NULL;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f13d597370a30dc1b14c630ee00145256052ba56..6da840673b1209c84bbc39664=
3c6033679a7ec74 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -46,6 +46,7 @@ struct drm_property_blob;
>  struct drm_printer;
>  struct drm_privacy_screen;
>  struct drm_edid;
> +struct cec_adapter;
>  struct edid;
>  struct hdmi_codec_daifmt;
>  struct hdmi_codec_params;
> @@ -1191,6 +1192,19 @@ struct drm_connector_hdmi_audio_funcs {
>  			   bool enable, int direction);
>  };
> =20
> +/**
> + * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
> + */
> +struct drm_connector_cec_funcs {
> +	/**
> +	 * @adap_unregister: unregister CEC adapter / notifier.
> +	 *
> +	 * The callback to unregister CEC adapter or notifier, so that the core
> +	 * DRM layer doesn't depend on the CEC_CORE.
> +	 */
> +	void (*unregister)(struct drm_connector *connector);
> +};
> +
>  /**
>   * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
>   */
> @@ -1832,6 +1846,31 @@ struct drm_connector_hdmi {
>  	} infoframes;
>  };
> =20
> +/**
> + * struct drm_connector_cec - DRM Connector CEC-related structure
> + */
> +struct drm_connector_cec {
> +	/**
> +	 * @mutex: protects all CEC-related fields
> +	 */

All fields? Which fields require to be protected by a specific mutex
here?

Maxime

--rqramsz4u3ii2j5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5iyYAAKCRAnX84Zoj2+
duqWAYC0IY5tBgXDGbWCxpgLeApYEBcOiiEmpWxgk7m7xQr3hZVekuNEUhWTPznT
N1WGhNkBgPNbVNyMegu8Od0I7PLnMPszgasBA0tko2H2TPUCN8oOSRn6qh4mMdVV
lia7zjgFFQ==
=Pc+7
-----END PGP SIGNATURE-----

--rqramsz4u3ii2j5l--

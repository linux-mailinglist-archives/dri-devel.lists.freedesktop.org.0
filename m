Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA87A0426A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688A610EADD;
	Tue,  7 Jan 2025 14:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lE1rLJh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4050D10EAD8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:27:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4544EA415D0;
 Tue,  7 Jan 2025 14:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C54BC4CED6;
 Tue,  7 Jan 2025 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736260036;
 bh=dN+sl9rlkbqg84c0OwnbY/FIxRNG5HYvrmXWkDN2M7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lE1rLJh3xVyzUgu5Z8/DekxQTNY2Zbpuwxeg2OD4F3i2XWPmmHgNB7qoOKPKp1GjE
 GJ5JSDsdPo4LFPc9Y83MI6oR75WOTMqfQGE36wphKZ+SEf1fZC5w+jMyBEfzuydGud
 6UXD9hLzu6fEWSyyqIeaXmY2sCz6WRpAN8D+bt0c8eTXwoEaypthK3tJl4dmHkcURm
 yA4c2Dl96RZ1t68Qof/1xoVfY3W9/p/9FJc1dmZUVfAHWXP5sQS0AszPl8Np//snt8
 0gOWClKZBc4VFfF42FhzITMm3cqj6McsH8cNjUiqwn2waTzCd0G5QCdCr498Z1i4AF
 yzk8GQedff/TQ==
Date: Tue, 7 Jan 2025 15:27:13 +0100
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
Subject: Re: [PATCH RFC/RFT 1/9] drm/connector: add CEC-related fields
Message-ID: <20250107-amiable-poetic-rook-17da6e@houat>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-1-b80380c67221@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ujm2fwyxrjjflfri"
Content-Disposition: inline
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-1-b80380c67221@linaro.org>
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


--ujm2fwyxrjjflfri
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC/RFT 1/9] drm/connector: add CEC-related fields
MIME-Version: 1.0

Hi,

Thanks a lot for working on this.

On Wed, Dec 25, 2024 at 01:10:09AM +0200, Dmitry Baryshkov wrote:
> As a preparation to adding HDMI CEC helper code, add CEC-related fields
> to the struct drm_connector. Include both cec_adapter and cec_notifier,
> allowing drivers to select which one to use. The unregister callback
> is provided to let drivers unregister CEC-related data in a generic way
> without polluting drm_connector.c with dependencies on the CEC
> functions.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 23 ++++++++++++++++++++++
>  include/drm/drm_connector.h     | 43 +++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..ef299733041e2c64bebd73c3f=
e21d4492bc07d3a 100644
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
> @@ -698,6 +699,26 @@ static void drm_mode_remove(struct drm_connector *co=
nnector,
>  	drm_mode_destroy(connector->dev, mode);
>  }
> =20
> +/**
> + * drm_connector_cec_unregister - clean up CEC registration
> + * @connector: connector to cleanup
> + *
> + * Reverse corresponding CEC registration. This function is supposed to =
be
> + * called only by bridge drivers which need to handle CEC manually. Norm=
ally
> + * CEC adapter or notifier are automatically unregistered during drm_con=
nector
> + * teardown.
> + */
> +void drm_connector_cec_unregister(struct drm_connector *connector)
> +{
> +	mutex_lock(&connector->cec.mutex);
> +
> +	if (connector->cec.unregister)
> +		connector->cec.unregister(connector);
> +
> +	mutex_unlock(&connector->cec.mutex);
> +}
> +EXPORT_SYMBOL(drm_connector_cec_unregister);

Why do we need to have that function public?

>  /**
>   * drm_connector_cleanup - cleans up an initialised connector
>   * @connector: connector to cleanup
> @@ -718,6 +739,8 @@ void drm_connector_cleanup(struct drm_connector *conn=
ector)
> =20
>  	platform_device_unregister(connector->hdmi_audio.codec_pdev);
> =20
> +	drm_connector_cec_unregister(connector);
> +
>  	if (connector->privacy_screen) {
>  		drm_privacy_screen_put(connector->privacy_screen);
>  		connector->privacy_screen =3D NULL;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f13d597370a30dc1b14c630ee00145256052ba56..feecd02e7c698cc0c553b7904=
8c9130f69121012 100644
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
> @@ -1832,6 +1833,41 @@ struct drm_connector_hdmi {
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
> +	struct mutex mutex;
> +
> +	/**
> +	 * @adap: CEC adapter corresponding to the DRM connector.
> +	 */
> +	struct cec_adapter *adapter;
> +
> +	/**
> +	 * @notifier: CEC notifier corresponding to the DRM connector.
> +	 */
> +	struct cec_notifier *notifier;
> +
> +	/**
> +	 * @adap_unregister: unregister CEC adapter / notifier.
> +	 *
> +	 * The callback to unregister CEC adapter or notifier, so that the core
> +	 * DRM layer doesn't depend on the CEC_CORE.
> +	 */
> +	void (*unregister)(struct drm_connector *connector);
> +
> +	/**
> +	 * @uninit_cec_cb: teardown CEC adapter
> +	 *
> +	 * Perform additional tasks to teardown the CEC adapter.
> +	 */
> +	void (*uninit_cec)(struct drm_connector *connector);
> +};

I'd rather stay consistent with the video and audio support and have the
functions in a separate structure.

Maxime

--ujm2fwyxrjjflfri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ305uQAKCRAnX84Zoj2+
do6LAX44VLYRzaBXQD2y2JyyQOopauCLDgGo77KKpiX1fszZHZkyPHlttH7Bdqcl
XckL8qcBgOPMQvSAV/y0S5Lyev95IFYLF+f4AQALgnUIOqaPDEwPUHfezundJakl
ngHWFsieZw==
=OH2K
-----END PGP SIGNATURE-----

--ujm2fwyxrjjflfri--

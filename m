Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D59F375B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 18:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C010E3F2;
	Mon, 16 Dec 2024 17:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YBaGcecK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF67010E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 17:20:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C40A0A418A0;
 Mon, 16 Dec 2024 17:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29F4C4CED0;
 Mon, 16 Dec 2024 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734369607;
 bh=lsZu4CW9iz0IkO0ux+aw5Ej8/2IsGxdLj0arY9En0D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YBaGcecKJuSIX6KQhirAa1qTy7d84RJx1mtuyV3FWFyFtShxsSx6ncZ2o+pLNkYbd
 1LbAMTvJ3sHvy+/+nd9xPMX+gWvGfHzc5fb+jUNeCi/es8c6cGxlvhDz+BwkPCRtL1
 FkjvbaBKWFXSNMZEXy85Lh8kQyuhu3Meb7GopQEEpT/JFAo/R90CQ8FonvliIuXpps
 JPc24HcLyqUOT4LztFZufzutbjjeOGBE8GJVg25Lu2rOrLijZN2UjNpHUaSciQYsOf
 DqEVe1T4PIX0x4vxk/JFWnIraTws+pa3/QcNk1wHgUysyA0GCxkYxdN0jxTvRkcU7U
 uGXHMk9e3hSng==
Date: Mon, 16 Dec 2024 18:20:04 +0100
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
Subject: Re: [PATCH v6 06/10] drm/display/hdmi: implement hotplug functions
Message-ID: <20241216-courageous-mysterious-pelican-5a8d2e@houat>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-6-50dc145a9c06@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="b5r2eocu5g4kytpy"
Content-Disposition: inline
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-6-50dc145a9c06@linaro.org>
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


--b5r2eocu5g4kytpy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 06/10] drm/display/hdmi: implement hotplug functions
MIME-Version: 1.0

On Fri, Dec 06, 2024 at 12:16:00PM +0200, Dmitry Baryshkov wrote:
> The HDMI Connectors need to perform a variety of tasks when the HDMI
> connector state changes. Such tasks include setting or invalidating CEC
> address, notifying HDMI codec driver, updating scrambler data, etc.
>=20
> Implementing such tasks in a driver-specific callbacks is error prone.
> Start implementing the generic helper function (currently handling only
> the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
> framework.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 61 +++++++++++++++++++=
++++++
>  include/drm/display/drm_hdmi_state_helper.h     |  8 ++++
>  2 files changed, 69 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e..4cdeb63688b9e48acd8e8ae87=
a45b6253f7dd12b 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -769,3 +769,64 @@ drm_atomic_helper_connector_hdmi_clear_audio_infofra=
me(struct drm_connector *con
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> +
> +/**
> + * drm_atomic_helper_connector_hdmi_hotplug_edid - Handle the hotplug ev=
ent for the HDMI connector passing custom EDID
> + * @connector: A pointer to the HDMI connector
> + * @status: Connection status
> + * @drm_edid: EDID to process
> + *
> + * This function should be called as a part of the .detect() / .detect_c=
tx()
> + * and .force() callbacks, updating the HDMI-specific connector's data. =
Most
> + * drivers should be able to use @drm_atomic_helper_connector_hdmi_hotpl=
ug()
> + * instead.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *conn=
ector,
> +					      enum drm_connector_status status,
> +					      const struct drm_edid *drm_edid)
> +{
> +	if (status =3D=3D connector_status_disconnected) {
> +		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> +		drm_connector_hdmi_codec_plugged_notify(connector, false);
> +	}
> +
> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	if (status =3D=3D connector_status_connected) {
> +		// TODO: also handle CEC and scramber, HDMI sink is now connected.
> +		drm_connector_hdmi_codec_plugged_notify(connector, true);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_edid);

I think we discussed it in a previous version's thread after you sent
that one, but I'd rather have that helper call an edid retrieval
function than passing it edids.

Also, EDIDs are mandatory for HDMI, so I'd call the function
drm_atomic_helper_connector_hdmi_hotplug.

> +/**
> + * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event f=
or the HDMI connector
> + * @connector: A pointer to the HDMI connector
> + * @status: Connection status
> + *
> + * This function should be called as a part of the .detect() / .detect_c=
tx()
> + * and .force() callbacks, updating the HDMI-specific connector's data.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
> +					 enum drm_connector_status status)
> +{
> +	const struct drm_edid *drm_edid;
> +	int ret;
> +
> +	drm_edid =3D drm_edid_read(connector);
> +	ret =3D drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status=
, drm_edid);
> +	drm_edid_free(drm_edid);

Oh. Why do we need the two variants? Or is it to deal with drivers that
don't set connector->ddc?

Maxime

--b5r2eocu5g4kytpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2BhRAAKCRAnX84Zoj2+
duMGAYDwCfVmRQt5W/JuFEAWhXLZLjo4CeJIKFXnit8/2S+ODRFntJMw/cPpQN7U
HE28DAcBfAyu8qSgYzb4NIvRrHkIsi2wL3YWiVUclrh01Haso0u/clDsW8282oLw
FBFc2NqiHA==
=shxs
-----END PGP SIGNATURE-----

--b5r2eocu5g4kytpy--

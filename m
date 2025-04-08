Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457DBA810A5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37DC10E6EA;
	Tue,  8 Apr 2025 15:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U92RPZbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B42410E6E3;
 Tue,  8 Apr 2025 15:51:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD96DA460A3;
 Tue,  8 Apr 2025 15:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D55C4CEE5;
 Tue,  8 Apr 2025 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744127472;
 bh=fHyIFk+1JdVwh1YZHnuAzmhPYe/0ws1mktZxa7Zztis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U92RPZbzB9fHNqMYcnKtrz/GqeAT94kOVr2zBKXfoy72b/TXH1UV1Pf1iKd+FF1Mt
 fEsn+06FNEilpE9JZe4Zlklge1+NhbTctVc202lqfcvEDxj3sfuL425JMNNKbAv8Zy
 3XZ06lfKlaKvFyseN7gHRyVtS+O6zfETbsBEAg0e1albQ4vcN7UBXLpfMV13u9PmCO
 VjMZ379EgPxs5yizezEA0IXimAOEARimykKOEUJudXEx1J1Bn/fiNpJrruF/5hvVXa
 WxLGHFI56wktIKiFGnLrOz+2A1PufwrmZcAevCgKRkjYZ5K2i1sRn3kLD8oPjvHubU
 vUx4RBSwAqNqQ==
Date: Tue, 8 Apr 2025 17:51:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250408-thankful-husky-of-weather-355cae@houat>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-34-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="whaxztwnulei2tij"
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-34-42113ff8d9c0@bootlin.com>
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


--whaxztwnulei2tij
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

Hi,

On Mon, Apr 07, 2025 at 05:27:39PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>=20
> The devm lifetime management of this driver is peculiar. The underlying
> device for the panel_bridge is the panel, and the devm lifetime is tied t=
he
> panel device (panel->dev). However the panel_bridge allocation is not
> performed by the panel driver, but rather by a separate entity (typically
> the previous bridge in the encoder chain).
>=20
> Thus when that separate entoty is destroyed, the panel_bridge is not
> removed automatically by devm, so it is rather done explicitly by calling
> drm_panel_bridge_remove(). This is the function that does devm_kfree() the
> panel_bridge in current code, so update it as well to put the bridge
> reference instead.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>=20
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> To: Jonas Karlman <jonas@kwiboo.se>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Jagan Teki <jagan@amarulasolutions.com>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Douglas Anderson <dianders@chromium.org>
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Krzysztof Kozlowski <krzk@kernel.org>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Paul Kocialkowski <paulk@sys-base.io>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Herv=E9 Codina <herve.codina@bootlin.com>
> Cc: Hui Pu <Hui.Pu@gehealthcare.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: asahi@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: chrome-platform@lists.linux.dev
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/gpu/drm/bridge/panel.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index 79b009ab9396048eac57ad47631a902e949d77c6..ddd1e91970d09b93aa64f50cd=
9155939a12a2c6f 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -287,15 +287,14 @@ struct drm_bridge *drm_panel_bridge_add_typed(struc=
t drm_panel *panel,
>  	if (!panel)
>  		return ERR_PTR(-EINVAL);
> =20
> -	panel_bridge =3D devm_kzalloc(panel->dev, sizeof(*panel_bridge),
> -				    GFP_KERNEL);
> -	if (!panel_bridge)
> -		return ERR_PTR(-ENOMEM);
> +	panel_bridge =3D devm_drm_bridge_alloc(panel->dev, struct panel_bridge,=
 bridge,
> +					     &panel_bridge_bridge_funcs);
> +	if (IS_ERR(panel_bridge))
> +		return (void *)panel_bridge;
> =20
>  	panel_bridge->connector_type =3D connector_type;
>  	panel_bridge->panel =3D panel;
> =20
> -	panel_bridge->bridge.funcs =3D &panel_bridge_bridge_funcs;
>  	panel_bridge->bridge.of_node =3D panel->dev->of_node;
>  	panel_bridge->bridge.ops =3D DRM_BRIDGE_OP_MODES;
>  	panel_bridge->bridge.type =3D connector_type;
> @@ -327,7 +326,7 @@ void drm_panel_bridge_remove(struct drm_bridge *bridg=
e)
>  	panel_bridge =3D drm_bridge_to_panel_bridge(bridge);
> =20
>  	drm_bridge_remove(bridge);
> -	devm_kfree(panel_bridge->panel->dev, bridge);
> +	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
>  }
>  EXPORT_SYMBOL(drm_panel_bridge_remove);

I'm fine with it on principle, but as a temporary measure.

Now that we have the panel allocation function in place, we can just
allocate a bridge for each panel and don't need drm_panel_bridge_add_*
at all.

As I was saying before, it doesn't need to happen right now, or before
the rest of your work for hotplug goes in. But this needs to be tackled
at some point.

Maxime

--whaxztwnulei2tij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/VF6wAKCRDj7w1vZxhR
xZU9AP9+Olq0gODzONr66OWy2JUMq3Zt+9qdaFGpPxZ/7/LDgAD+JNtu7g0v4KKA
HdXhPPGzl2cAOI04En1cGAdCRKq6ZQw=
=xkvL
-----END PGP SIGNATURE-----

--whaxztwnulei2tij--

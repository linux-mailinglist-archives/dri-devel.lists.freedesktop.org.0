Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4492768B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C188510EADE;
	Thu,  4 Jul 2024 12:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RqGnOcgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0126810EAD7;
 Thu,  4 Jul 2024 12:56:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E7441CE3467;
 Thu,  4 Jul 2024 12:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7268C3277B;
 Thu,  4 Jul 2024 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720097807;
 bh=PVroVr5VS+tv2unXGroLj7wH6BRx+DmoasU5vVT6qLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RqGnOcgYwZ4oi1+bFCrkwSYSjnxslsfvgCnM91eu3i8YszOa5kuzhMvNnYIs4ZsiY
 NIy1PScgBGrwy6x2GMBOZIpoNEcUeZ0hi5HpBUrZqMrKiH/KhyOdCsehGimmynDdsk
 dNGi24wLnqPuKeBup5dIKJMun9IhC0HWLRLIfIfS/wt4dM5uFWPOpJJip5SYqxuLWF
 64i7GMNADdv3Iyb4WYoAfdNPSXrGlMd7Mbp6qhKOfP1ZjljOQv04xcnHXfgVUzGDih
 IIX+edxeQzsC4ZnPSQNevoejUTgaavvsAgud2AygURl+E3Sc4Q2BGsuVXhul+XW0Fa
 3/CdFAUftT52Q==
Date: Thu, 4 Jul 2024 14:56:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] drm/bridge-connector: reset the HDMI connector
 state
Message-ID: <20240704-jumping-saffron-shrew-d5f3b7@houat>
References: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
 <20240702-drm-bridge-connector-fix-hdmi-reset-v3-4-12b0e3124ca4@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7vwtwdy7kgdsohoy"
Content-Disposition: inline
In-Reply-To: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-4-12b0e3124ca4@linaro.org>
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


--7vwtwdy7kgdsohoy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi,

On Tue, Jul 02, 2024 at 12:48:55PM GMT, Dmitry Baryshkov wrote:
> On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> IGT chokes on the max_bpc property in several kms_properties tests due
> to the the drm_bridge_connector failing to reset HDMI-related
> properties.
>=20
> Call __drm_atomic_helper_connector_hdmi_reset() if the
> drm_bridge_connector has bridge_hdmi.
>=20
> It is impossible to call this function from HDMI bridges, there is is no
> function that corresponds to the drm_connector_funcs::reset().
>=20
> Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI =
connector")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/Kconfig                |  1 +
>  drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kc=
onfig
> index 1a192a45961b..bfd025f8c7b5 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -9,6 +9,7 @@ config DRM_DISPLAY_HELPER
>  config DRM_BRIDGE_CONNECTOR
>  	bool
>  	depends on DRM && DRM_BRIDGE && DRM_DISPLAY_HELPER
> +	select DRM_DISPLAY_HDMI_STATE_HELPER

Sorry, I notice it on that patch, but it's really on the previous one:
both DRM_BRIDGE and DRM_DISPLAY_HELPER are meant to be selected, not
depended on.

Otherwise,

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--7vwtwdy7kgdsohoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoacCwAKCRDj7w1vZxhR
xanRAQColvBTOI0QEUf8DcGVNjKDA1/UU+PpylKjFBS+1Af3UwD+NRXO6kyzueZq
/yJoJX5gAP4jYt81QeQl/Vb8tObX3g8=
=F6fl
-----END PGP SIGNATURE-----

--7vwtwdy7kgdsohoy--

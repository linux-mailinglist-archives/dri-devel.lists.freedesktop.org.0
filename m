Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF5DA042A4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79E410E3B4;
	Tue,  7 Jan 2025 14:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P9a+8IS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250EF10E3B4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:34:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDB845C62FE;
 Tue,  7 Jan 2025 14:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FCEC4CED6;
 Tue,  7 Jan 2025 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736260477;
 bh=pvvw+49AgRU9wJTP54zTr1tdROtVtxt6vHDZXCv995I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P9a+8IS1bMcsEESO5OBpI4MQwd1aYIk8/8H4h1XDEvkuTdTy12R1ZF8ydmjlSfo2E
 +mcWUea9H3urrXlll1quKp48cixK1NUaZ/7kd9pEq88wSexA9HfB+nVNCG+R7fI1Wr
 M/evqYUTHiEt8Bdje/Qj8mxaqnksk4SZPaANzF9YCwbFQkq9sNmwJNE4sB12NhmrE8
 b5iI0TZUGDRGcPOuldd7Vwn/VZO8cn2qPryptWb65WLkJWEZmfCLX4/ktU+mq8SVY2
 omKSZ/50psDLnebH5ZeJypi7KXtrv4fgkYu5FV7E/sCdTpf8WShuE8RO5JR0NIy4wd
 77UFO1CxqpbrA==
Date: Tue, 7 Jan 2025 15:34:35 +0100
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
Subject: Re: [PATCH RFC/RFT 4/9] drm/vc4: hdmi: switch to generic CEC helpers
Message-ID: <20250107-intrepid-tuna-of-growth-5f53c5@houat>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-4-b80380c67221@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4ko4to42f5lqrfuo"
Content-Disposition: inline
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-4-b80380c67221@linaro.org>
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


--4ko4to42f5lqrfuo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC/RFT 4/9] drm/vc4: hdmi: switch to generic CEC helpers
MIME-Version: 1.0

On Wed, Dec 25, 2024 at 01:10:12AM +0200, Dmitry Baryshkov wrote:
> Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> now.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/vc4/Kconfig    |  1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 92 ++++++++++++++++++++----------------=
------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
>  3 files changed, 44 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index 6cc7b7e6294a1bfa54137ca65296cd47e46b1e1e..360fbe755951cc40fecb4f9d6=
43a096a6cf92b8e 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -34,6 +34,7 @@ config DRM_VC4_HDMI_CEC
>  	bool "Broadcom VC4 HDMI CEC Support"
>  	depends on DRM_VC4
>  	select CEC_CORE
> +	select DRM_DISPLAY_HDMI_CEC_HELPER
>  	help
>  	  Choose this option if you have a Broadcom VC4 GPU
>  	  and want to use CEC.
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..3086c2ad3bb2e8fafdc1f37ba=
985aa5785d49f9a 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -32,6 +32,7 @@
>   */
> =20
>  #include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_hdmi_cec_helper.h>
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
>  #include <drm/display/drm_scdc_helper.h>
> @@ -400,16 +401,8 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi =
*vc4_hdmi,
>  	 * the lock for now.
>  	 */
> =20
> -	if (status =3D=3D connector_status_disconnected) {
> -		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> -		return;
> -	}
> -
>  	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> =20
> -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> -			connector->display_info.source_physical_address, false);
> -
>  	if (status !=3D connector_status_connected)
>  		return;
> =20
> @@ -2388,7 +2381,7 @@ static irqreturn_t vc4_cec_irq_handler_rx_thread(in=
t irq, void *priv)
>  	struct vc4_hdmi *vc4_hdmi =3D priv;
> =20
>  	if (vc4_hdmi->cec_rx_msg.len)
> -		cec_received_msg(vc4_hdmi->cec_adap,
> +		cec_received_msg(vc4_hdmi->connector.cec.adapter,
>  				 &vc4_hdmi->cec_rx_msg);
> =20
>  	return IRQ_HANDLED;
> @@ -2399,14 +2392,14 @@ static irqreturn_t vc4_cec_irq_handler_tx_thread(=
int irq, void *priv)
>  	struct vc4_hdmi *vc4_hdmi =3D priv;
> =20
>  	if (vc4_hdmi->cec_tx_ok) {
> -		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
> +		cec_transmit_done(vc4_hdmi->connector.cec.adapter, CEC_TX_STATUS_OK,
>  				  0, 0, 0, 0);

Shouldn't we create helpers for those just like we did to deal with phys_ad=
dr?

Maxime

--4ko4to42f5lqrfuo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ307egAKCRAnX84Zoj2+
dqJaAX4kx42hTI2sUkrZ7ypoU/vNqvwVXezexEtWYVBvHnGEp2OmEUbmBZYXk8QD
490m56ABf1xK3Z1asiYSGUTCiIftAEXtbAJmTDbuPFiAOLhbklnKZ0O+RlqwFJ6u
Mooj9pMRnQ==
=fPMx
-----END PGP SIGNATURE-----

--4ko4to42f5lqrfuo--

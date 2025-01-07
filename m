Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72466A0429A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D39C10E155;
	Tue,  7 Jan 2025 14:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jZP0yrbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E8710E3B4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:32:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E89785C6286;
 Tue,  7 Jan 2025 14:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E4EC4CED6;
 Tue,  7 Jan 2025 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736260338;
 bh=+WQwahVHWJ4avpH4oii/JUwTgHmIwitEytQhPjMz64o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jZP0yrbvFJjAsUvkGT5089ZaI0GH9/QKx9Gc0u6sD/JGxEGbE3rZfTRp3kUOMLH+v
 20kK7qfLCFVCjgMssB3wyJlrIxiWpNVE1dim3PRxqI+zCP3p+0FOhOoXb4RWQjgkCm
 nBycFtX/H74d1+mH6mA4PqCW4gxWEBFo7FJco5iHGPISOWa82HCj0GMgKmzf+3YuJc
 D8o4aMeD5kpo+P+dYMNr6yRESuFR6QkxsMqc0+M+o0DOTHEU/xNxHM6maK/eTGXbeq
 fLe2R95iWjInZ5B8VuC/PdYtwbCT7mA36yoXjq7lyPCgXEgFCLuhqWXyb7e0LK0wiO
 sALrB49tpzFHw==
Date: Tue, 7 Jan 2025 15:32:15 +0100
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
Subject: Re: [PATCH RFC/RFT 2/9] drm/display: add CEC helpers code
Message-ID: <20250107-psychedelic-earthworm-of-action-cf5ceb@houat>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-2-b80380c67221@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="idhxvhxu2qliw2kd"
Content-Disposition: inline
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-2-b80380c67221@linaro.org>
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


--idhxvhxu2qliw2kd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC/RFT 2/9] drm/display: add CEC helpers code
MIME-Version: 1.0

On Wed, Dec 25, 2024 at 01:10:10AM +0200, Dmitry Baryshkov wrote:
> Add generic CEC helpers to be used by HDMI drivers. Both notifier and
> and adapter are supported for registration. Once registered, the driver
> can call common set of functions to update physical address, to
> invalidate it or to unregister CEC data.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/Kconfig               |   5 +
>  drivers/gpu/drm/display/Makefile              |   2 +
>  drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 145 ++++++++++++++++++++=
++++++
>  include/drm/display/drm_hdmi_cec_helper.h     |  38 +++++++
>  4 files changed, 190 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kc=
onfig
> index 8d22b7627d41f7bc015decf24ae02a05bc00f055..49da9b768acf3e5f84f2cefae=
4bb042cfd57a50c 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -82,6 +82,11 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
>  	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
>  	  implementation).
> =20
> +config DRM_DISPLAY_HDMI_CEC_HELPER
> +	bool
> +	help
> +	  DRM display helpers for HDMI CEC implementation.
> +
>  config DRM_DISPLAY_HDMI_HELPER
>  	bool
>  	help
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/M=
akefile
> index b17879b957d5401721396e247fa346387cf6c48a..2cd078e2b81c1a9e6b336c418=
7b444bcb8a50e51 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -16,6 +16,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) +=
=3D \
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) +=3D drm_hdcp_helpe=
r.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) +=3D \
>  	drm_hdmi_audio_helper.o
> +drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) +=3D \
> +	drm_hdmi_cec_helper.o
>  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) +=3D \
>  	drm_hdmi_helper.o \
>  	drm_scdc_helper.o
> diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/=
drm/display/drm_hdmi_cec_helper.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2a3832e68232fa3b839a3c745=
7b2013779cada86
> --- /dev/null
> +++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (c) 2024 Linaro Ltd
> + */
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/display/drm_hdmi_cec_helper.h>
> +
> +#include <linux/mutex.h>
> +
> +#include <media/cec.h>
> +#include <media/cec-notifier.h>
> +
> +static void drm_connector_hdmi_cec_adapter_unregister(struct drm_connect=
or *connector)
> +{
> +	cec_unregister_adapter(connector->cec.adapter);
> +	connector->cec.adapter =3D NULL;
> +	connector->cec.unregister =3D NULL;
> +}
> +
> +int drm_connector_hdmi_cec_adapter_register(struct drm_connector *connec=
tor,
> +					    const struct cec_adap_ops *ops,
> +					    const char *name,
> +					    u8 available_las,
> +					    int (*init_cec)(struct drm_connector *connector),
> +					    void (*uninit_cec)(struct drm_connector *connector),
> +					    struct device *dev)

We're missing a documentation here. Why do we need drivers to pass both
a set of cec_adap_ops and a bunch of extra functions? Shouldn't we make
this a single structure like we did for audio?

Also, to remain consistent, we should call that function drm_connector_hdmi=
_cec_register


Maxime

--idhxvhxu2qliw2kd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3067wAKCRAnX84Zoj2+
duhZAX9vW3auAbVp6/TAgbcdkQGdcEVSdOHbP1byFKRxuSVLityacLf1FCaYcZCl
KPjyOeYBgPyaDAKsvOS6fXiAjtKxyChWIqdqXIiWNxuLsSx4o9+LeKLARqJT+PIl
IQxUSQJW/A==
=6BEw
-----END PGP SIGNATURE-----

--idhxvhxu2qliw2kd--

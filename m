Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8D149666
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 16:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29096E889;
	Sat, 25 Jan 2020 15:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEE372009;
 Sat, 25 Jan 2020 00:11:21 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id d7so1732121ywl.12;
 Fri, 24 Jan 2020 16:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=WCftLmUXMAj1ciMar+n72pOVsX+a5+2BkX85kjmRwPQ=;
 b=DcNttyQpTriAAhss8Dw2CuEakeBwYJaIyI5xvxW8aROz9qlY/kuB3pL1AntgAyTJFe
 4f29A25tC/UMTZ5csfsvQY2LwEbqjozS5PM61Vpzw6r2EoOMguPDu47mGhi2eh5kA8WR
 EIbt/4K0BYZ3/GzLA2MuCg1IUGRqKAeBwTqK8vz4bTophSoLN5oNI6q5TdhkNKnxdcGY
 fM7A/cwldFjdkQslTd8qQcOXMWG1cFW5hU66e56K2yLupItupmfuusUOU0Cn6Ngnbnm3
 i7lDvXKFpxpD1RCXCKjlbbNd1wEbj2pRyHujpbjDCBJi7r+grenANYscpC8SJl237Xnx
 wb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=WCftLmUXMAj1ciMar+n72pOVsX+a5+2BkX85kjmRwPQ=;
 b=L7o0BlY8dJ9sGNHWSHx/UuYr4XO9JRynBRY2UnyYJH0Wr/AjqdLGqaw2Uxyj4ZkN/S
 Y4exFLq5Zo44rbtQKDcz7jd5L/mGoyEja2OnaTrEOnUd1gy1ZoVVCtG9/oy5nFFiAS7s
 ziGXc9lNSmjYBl3SnFTdfyrIEr5wkZ1GmzDcAyQ1KExIYXnBnONnjv1j1LSnHuTua5zE
 F95Ifu9JuK1H1K7wbNcucIdToWpVover65id0Kz9UTv02COn7ESTxOAIttzF2X0KeD0b
 cdtNqLxrHYO/VTXfPvjYOCnYfYAxipaI1PW4XIKnRXbRsoGnquHbwpE/88KGpju0Jw2e
 Aqgw==
X-Gm-Message-State: APjAAAV9+rPG5l1cL57zz2Djj5VdY8XOmtuyY1EEroQrDAYgjXzNfIO3
 q4g9QkmUQI30sJc1ipiWZJ8=
X-Google-Smtp-Source: APXvYqzCzapu/kZhuoe1y/XAzjX9fATqs9XXji6n+j5/4fchliD2/o/QMGH/aqu/24dkXfx/EeofTw==
X-Received: by 2002:a81:452:: with SMTP id 79mr3955664ywe.307.1579911080743;
 Fri, 24 Jan 2020 16:11:20 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e21sm2815168ywa.94.2020.01.24.16.11.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jan 2020 16:11:20 -0800 (PST)
Date: Fri, 24 Jan 2020 16:11:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [v5,3/3] drm/i915: Add support for integrated privacy screens
Message-ID: <20200125001118.GA4358@roeck-us.net>
References: <20191220200353.252399-3-rajatja@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220200353.252399-3-rajatja@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 25 Jan 2020 15:47:14 +0000
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
Cc: seanpaul@google.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 jsbarnes@google.com, rajatxjain@gmail.com, intel-gfx@lists.freedesktop.org,
 mathewk@google.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>, Duncan Laurie <dlaurie@google.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 12:03:53PM -0800, Rajat Jain wrote:
> Certain laptops now come with panels that have integrated privacy
> screens on them. This patch adds support for such panels by adding
> a privacy-screen property to the intel_connector for the panel, that
> the userspace can then use to control and check the status.
> =

> Identifying the presence of privacy screen, and controlling it, is done
> via ACPI _DSM methods.
> =

> Currently, this is done only for the Intel display ports. But in future,
> this can be done for any other ports if the hardware becomes available
> (e.g. external monitors supporting integrated privacy screens?).
> =

> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v5: fix a cosmetic checkpatch warning
> v4: Fix a typo in intel_privacy_screen.h
> v3: * Change license to GPL-2.0 OR MIT
>     * Move privacy screen enum from UAPI to intel_display_types.h
>     * Rename parameter name and some other minor changes.
> v2: Formed by splitting the original patch into multiple patches.
>     - All code has been moved into i915 now.
>     - Privacy screen is a i915 property
>     - Have a local state variable to store the prvacy screen. Don't read
>       it from hardware.
> =

>  drivers/gpu/drm/i915/Makefile                 |  3 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c   | 13 +++-
>  .../gpu/drm/i915/display/intel_connector.c    | 35 +++++++++
>  .../gpu/drm/i915/display/intel_connector.h    |  1 +
>  .../drm/i915/display/intel_display_types.h    | 18 +++++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  6 ++
>  .../drm/i915/display/intel_privacy_screen.c   | 72 +++++++++++++++++++
>  .../drm/i915/display/intel_privacy_screen.h   | 27 +++++++
>  8 files changed, 171 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.h
> =

> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 90dcf09f52cc..f7067c8f0407 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -197,7 +197,8 @@ i915-y +=3D \
>  	display/intel_vga.o
>  i915-$(CONFIG_ACPI) +=3D \
>  	display/intel_acpi.o \
> -	display/intel_opregion.o
> +	display/intel_opregion.o \
> +	display/intel_privacy_screen.o
>  i915-$(CONFIG_DRM_FBDEV_EMULATION) +=3D \
>  	display/intel_fbdev.o
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/dr=
m/i915/display/intel_atomic.c
> index c2875b10adf9..c73b81c4c3f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -37,6 +37,7 @@
>  #include "intel_atomic.h"
>  #include "intel_display_types.h"
>  #include "intel_hdcp.h"
> +#include "intel_privacy_screen.h"
>  #include "intel_sprite.h"
>  =

>  /**
> @@ -57,11 +58,14 @@ int intel_digital_connector_atomic_get_property(struc=
t drm_connector *connector,
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	struct intel_digital_connector_state *intel_conn_state =3D
>  		to_intel_digital_connector_state(state);
> +	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
>  =

>  	if (property =3D=3D dev_priv->force_audio_property)
>  		*val =3D intel_conn_state->force_audio;
>  	else if (property =3D=3D dev_priv->broadcast_rgb_property)
>  		*val =3D intel_conn_state->broadcast_rgb;
> +	else if (property =3D=3D intel_connector->privacy_screen_property)
> +		*val =3D intel_conn_state->privacy_screen_status;
>  	else {
>  		DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
>  				 property->base.id, property->name);
> @@ -89,15 +93,18 @@ int intel_digital_connector_atomic_set_property(struc=
t drm_connector *connector,
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	struct intel_digital_connector_state *intel_conn_state =3D
>  		to_intel_digital_connector_state(state);
> +	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
>  =

>  	if (property =3D=3D dev_priv->force_audio_property) {
>  		intel_conn_state->force_audio =3D val;
>  		return 0;
> -	}
> -
> -	if (property =3D=3D dev_priv->broadcast_rgb_property) {
> +	} else if (property =3D=3D dev_priv->broadcast_rgb_property) {
>  		intel_conn_state->broadcast_rgb =3D val;
>  		return 0;
> +	} else if (property =3D=3D intel_connector->privacy_screen_property) {
> +		intel_privacy_screen_set_val(intel_connector, val);
> +		intel_conn_state->privacy_screen_status =3D val;
> +		return 0;
>  	}
>  =

>  	DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu=
/drm/i915/display/intel_connector.c
> index 1133c4e97bb4..f3e041c737de 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -296,3 +296,38 @@ intel_attach_colorspace_property(struct drm_connecto=
r *connector)
>  	drm_object_attach_property(&connector->base,
>  				   connector->colorspace_property, 0);
>  }
> +
> +static const struct drm_prop_enum_list privacy_screen_enum[] =3D {
> +	{ PRIVACY_SCREEN_DISABLED, "Disabled" },
> +	{ PRIVACY_SCREEN_ENABLED, "Enabled" },
> +};
> +
> +/**
> + * intel_attach_privacy_screen_property -
> + *     create and attach the connecter's privacy-screen property. *
> + * @connector: connector for which to init the privacy-screen property
> + *
> + * This function creates and attaches the "privacy-screen" property to t=
he
> + * connector. Initial state of privacy-screen is set to disabled.
> + */
> +void
> +intel_attach_privacy_screen_property(struct drm_connector *connector)
> +{
> +	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
> +	struct drm_property *prop;
> +
> +	if (!intel_connector->privacy_screen_property) {
> +		prop =3D drm_property_create_enum(connector->dev,
> +						DRM_MODE_PROP_ENUM,
> +						"privacy-screen",
> +						privacy_screen_enum,
> +					    ARRAY_SIZE(privacy_screen_enum));
> +		if (!prop)
> +			return;
> +
> +		intel_connector->privacy_screen_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop,
> +				   PRIVACY_SCREEN_DISABLED);

If intel_connector->privacy_screen_property is not NULL, prop
will be undefined, causing all kinds of fun.

I would expect this to happen whenever this function is called
for the second time.

Guenter

> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu=
/drm/i915/display/intel_connector.h
> index 93a7375c8196..61005f37a338 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.h
> +++ b/drivers/gpu/drm/i915/display/intel_connector.h
> @@ -31,5 +31,6 @@ void intel_attach_force_audio_property(struct drm_conne=
ctor *connector);
>  void intel_attach_broadcast_rgb_property(struct drm_connector *connector=
);
>  void intel_attach_aspect_ratio_property(struct drm_connector *connector);
>  void intel_attach_colorspace_property(struct drm_connector *connector);
> +void intel_attach_privacy_screen_property(struct drm_connector *connecto=
r);
>  =

>  #endif /* __INTEL_CONNECTOR_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index 0a4a04116091..a0addd2c5376 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -433,6 +433,23 @@ struct intel_connector {
>  	struct work_struct modeset_retry_work;
>  =

>  	struct intel_hdcp hdcp;
> +
> +	/* Optional "privacy-screen" property for the connector panel */
> +	struct drm_property *privacy_screen_property;
> +};
> +
> +/**
> + * enum intel_privacy_screen_status - privacy_screen status
> + *
> + * This enum is used to track and control the state of the integrated pr=
ivacy
> + * screen present on some display panels, via the "privacy-screen" prope=
rty.
> + *
> + * @PRIVACY_SCREEN_DISABLED: The privacy-screen on the panel is disabled
> + * @PRIVACY_SCREEN_ENABLED:  The privacy-screen on the panel is enabled
> + **/
> +enum intel_privacy_screen_status {
> +	PRIVACY_SCREEN_DISABLED =3D 0,
> +	PRIVACY_SCREEN_ENABLED =3D 1,
>  };
>  =

>  struct intel_digital_connector_state {
> @@ -440,6 +457,7 @@ struct intel_digital_connector_state {
>  =

>  	enum hdmi_force_audio force_audio;
>  	int broadcast_rgb;
> +	enum intel_privacy_screen_status privacy_screen_status;
>  };
>  =

>  #define to_intel_digital_connector_state(x) container_of(x, struct intel=
_digital_connector_state, base)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 93cece8e2516..d5376d667929 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -62,6 +62,7 @@
>  #include "intel_lspcon.h"
>  #include "intel_lvds.h"
>  #include "intel_panel.h"
> +#include "intel_privacy_screen.h"
>  #include "intel_psr.h"
>  #include "intel_sideband.h"
>  #include "intel_tc.h"
> @@ -6596,6 +6597,7 @@ intel_dp_add_properties(struct intel_dp *intel_dp, =
struct drm_connector *connect
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
>  	enum port port =3D dp_to_dig_port(intel_dp)->base.port;
> +	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
>  =

>  	if (!IS_G4X(dev_priv) && port !=3D PORT_A)
>  		intel_attach_force_audio_property(connector);
> @@ -6626,6 +6628,10 @@ intel_dp_add_properties(struct intel_dp *intel_dp,=
 struct drm_connector *connect
>  =

>  		/* Lookup the ACPI node corresponding to the connector */
>  		intel_acpi_device_id_update(dev_priv);
> +
> +		/* Check for integrated Privacy screen support */
> +		if (intel_privacy_screen_present(intel_connector))
> +			intel_attach_privacy_screen_property(connector);
>  	}
>  }
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_privacy_screen.c b/driver=
s/gpu/drm/i915/display/intel_privacy_screen.c
> new file mode 100644
> index 000000000000..c8a5b64f94fb
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_privacy_screen.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Intel ACPI privacy screen code
> + *
> + * Copyright =A9 2019 Google Inc.
> + */
> +
> +#include <linux/acpi.h>
> +
> +#include "intel_privacy_screen.h"
> +
> +#define CONNECTOR_DSM_REVID 1
> +
> +#define CONNECTOR_DSM_FN_PRIVACY_ENABLE		2
> +#define CONNECTOR_DSM_FN_PRIVACY_DISABLE		3
> +
> +static const guid_t drm_conn_dsm_guid =3D
> +	GUID_INIT(0xC7033113, 0x8720, 0x4CEB,
> +		  0x90, 0x90, 0x9D, 0x52, 0xB3, 0xE5, 0x2D, 0x73);
> +
> +/* Makes _DSM call to set privacy screen status */
> +static void acpi_privacy_screen_call_dsm(acpi_handle conn_handle, u64 fu=
nc)
> +{
> +	union acpi_object *obj;
> +
> +	obj =3D acpi_evaluate_dsm(conn_handle, &drm_conn_dsm_guid,
> +				CONNECTOR_DSM_REVID, func, NULL);
> +	if (!obj) {
> +		DRM_DEBUG_DRIVER("failed to evaluate _DSM for fn %llx\n", func);
> +		return;
> +	}
> +
> +	ACPI_FREE(obj);
> +}
> +
> +void intel_privacy_screen_set_val(struct intel_connector *connector,
> +				  enum intel_privacy_screen_status val)
> +{
> +	acpi_handle acpi_handle =3D connector->acpi_handle;
> +
> +	if (!acpi_handle)
> +		return;
> +
> +	if (val =3D=3D PRIVACY_SCREEN_DISABLED)
> +		acpi_privacy_screen_call_dsm(acpi_handle,
> +					     CONNECTOR_DSM_FN_PRIVACY_DISABLE);
> +	else if (val =3D=3D PRIVACY_SCREEN_ENABLED)
> +		acpi_privacy_screen_call_dsm(acpi_handle,
> +					     CONNECTOR_DSM_FN_PRIVACY_ENABLE);
> +	else
> +		DRM_WARN("%s: Cannot set privacy screen to invalid val %u\n",
> +			 dev_name(connector->base.dev->dev), val);
> +}
> +
> +bool intel_privacy_screen_present(struct intel_connector *connector)
> +{
> +	acpi_handle handle =3D connector->acpi_handle;
> +
> +	if (!handle)
> +		return false;
> +
> +	if (!acpi_check_dsm(handle, &drm_conn_dsm_guid,
> +			    CONNECTOR_DSM_REVID,
> +			    1 << CONNECTOR_DSM_FN_PRIVACY_ENABLE |
> +			    1 << CONNECTOR_DSM_FN_PRIVACY_DISABLE)) {
> +		DRM_WARN("%s: Odd, connector ACPI node but no privacy scrn?\n",
> +			 dev_name(connector->base.dev->dev));
> +		return false;
> +	}
> +	DRM_DEV_INFO(connector->base.dev->dev, "supports privacy screen\n");
> +	return true;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_privacy_screen.h b/driver=
s/gpu/drm/i915/display/intel_privacy_screen.h
> new file mode 100644
> index 000000000000..74013a7885c7
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_privacy_screen.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright =A9 2019 Google Inc.
> + */
> +
> +#ifndef __DRM_PRIVACY_SCREEN_H__
> +#define __DRM_PRIVACY_SCREEN_H__
> +
> +#include "intel_display_types.h"
> +
> +#ifdef CONFIG_ACPI
> +bool intel_privacy_screen_present(struct intel_connector *connector);
> +void intel_privacy_screen_set_val(struct intel_connector *connector,
> +				  enum intel_privacy_screen_status val);
> +#else
> +static bool intel_privacy_screen_present(struct intel_connector *connect=
or)
> +{
> +	return false;
> +}
> +
> +static void
> +intel_privacy_screen_set_val(struct intel_connector *connector,
> +			     enum intel_privacy_screen_status val)
> +{ }
> +#endif /* CONFIG_ACPI */
> +
> +#endif /* __DRM_PRIVACY_SCREEN_H__ */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

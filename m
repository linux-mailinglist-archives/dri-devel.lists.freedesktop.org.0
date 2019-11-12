Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA889FAB74
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD986E5B2;
	Wed, 13 Nov 2019 07:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2926E4E6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 19:12:52 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q2so19108408ljg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KhwlBFEbxy6SYFQ9Tvcdac1UGt4liIL9QO8kjcrB5d8=;
 b=W6Oy5rL1DmLMxwea7gEE82JO4IXJdP4YMISMYeWgJCXhSdjs0F2UW8ZWvHXPDqcsB8
 Dy4snTug4W0pS/nw5+QMgHy1yWs+Jfl5bA5aoDxGAKJSMFQCSu0lXuZ2rE7tPblrgUiR
 vUsTQTikExGQ17ZfNhIZA0ElK8JYr9/oQkb+266ISsbtFFETgT7Hb3yASKegbNTUFjs7
 3hz2P+YhhXiO7SlEMKGBoBjhVJAB5CRlMqZIqOX7wkUOsKyir/fJwSbyrvhghMSuWrJV
 KoZXPS2PkEAmQylcorTtcv2rifEyR3sJ5lVyPXif1hJRZ0sLYtO99Ur2V9iwnPqN4s4a
 Jn3w==
X-Gm-Message-State: APjAAAXR/JnaQwHnxllUPWjN16DoCQsk2WuyWH3Y3DmGmYKfSXFXEtTs
 7DcMG0Htxpx1XTwWyJFaWnL0EvSUbqeK533MWLt7Jw==
X-Google-Smtp-Source: APXvYqxChvOuYbnAzgk6Bm/ajOaV1sax7XVDV6HEiFz/E5t6UNI+oLJ6g4XkJQeDva9VzHRxYoJJz8RfSS3Gyt84a/M=
X-Received: by 2002:a2e:b4ba:: with SMTP id q26mr21060414ljm.60.1573585970042; 
 Tue, 12 Nov 2019 11:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20191023001206.15741-1-rajatja@google.com>
 <20191104194147.185642-1-rajatja@google.com>
 <20191104194147.185642-3-rajatja@google.com>
In-Reply-To: <20191104194147.185642-3-rajatja@google.com>
From: Rajat Jain <rajatja@google.com>
Date: Tue, 12 Nov 2019 11:12:13 -0800
Message-ID: <CACK8Z6HFOQO1cHxD2B=tKQu9_bEmkY1Ndy3+hZemMmqm_yEVkQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/i915: Add support for integrated privacy
 screens
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>, 
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 intel-gfx@lists.freedesktop.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mat King <mathewk@google.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Pavel Machek <pavel@denx.de>, Sean Paul <seanpaul@google.com>,
 Duncan Laurie <dlaurie@google.com>, 
 Jesse Barnes <jsbarnes@google.com>, Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KhwlBFEbxy6SYFQ9Tvcdac1UGt4liIL9QO8kjcrB5d8=;
 b=lDfM8ihHayPHRn6GuO1VyH4HbE30yQqYVdABqpEYxbJ0AC5cL/XxOKIt3jvDTzP4af
 6aCBNn62HXcy7R1zfS1AMopgVmgyVPt13CJEJHHM2Wxr6xiuGnkIoEMa666d1VcVWl4g
 IYKoJzBgkU4xBEJCDgCXap0A7DViFtfXWzxgiLrbTP+yX3EV6H/i3LRyaCTejYhf14Db
 UgovvCt9bCh7PLfcajp07Q4PKVkGD1Ec67TZsED9alhJlCRlgIOvec4/XvcpKjtJFzzb
 gAAkmBnZBJQ+qzCoq1FkdPMPYvGan9nMuCuSj0k/xSf8doxaAAXswt63hqJRHFFZ3IoD
 BokQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rajat Jain <rajatxjain@gmail.com>
Content-Type: multipart/mixed; boundary="===============1915400943=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1915400943==
Content-Type: multipart/alternative; boundary="000000000000c52be505972b0875"

--000000000000c52be505972b0875
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2019 at 11:41 AM Rajat Jain <rajatja@google.com> wrote:

> Certain laptops now come with panels that have integrated privacy
> screens on them. This patch adds support for such panels by adding
> a privacy-screen property to the intel_connector for the panel, that
> the userspace can then use to control and check the status.
>
> Identifying the presence of privacy screen, and controlling it, is done
> via ACPI _DSM methods.
>
> Currently, this is done only for the Intel display ports. But in future,
> this can be done for any other ports if the hardware becomes available
> (e.g. external monitors supporting integrated privacy screens?).
>
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Change-Id: Ic9ff07fc4a50797d2d0dfb919f11aa0821a4b548
> ---
> v2: Formed by splitting the original patch into multiple patches.
>     - All code has been moved into i915 now.
>     - Privacy screen is a i915 property
>     - Have a local state variable to store the prvacy screen. Don't read
>       it from hardware.
>


Hi Folks,

I posted a v2 taking care of the comments I received (also split it into 3
patches now, and resused some ACPI code I found in i915 driver). .
Wondering if any one got a chance to look at this?

Thanks,

Rajat


>
>  drivers/gpu/drm/i915/Makefile                 |  3 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c   | 13 +++-
>  .../gpu/drm/i915/display/intel_connector.c    | 35 ++++++++++
>  .../gpu/drm/i915/display/intel_connector.h    |  1 +
>  .../drm/i915/display/intel_display_types.h    |  4 ++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  5 ++
>  .../drm/i915/display/intel_privacy_screen.c   | 70 +++++++++++++++++++
>  .../drm/i915/display/intel_privacy_screen.h   | 25 +++++++
>  include/uapi/drm/i915_drm.h                   | 14 ++++
>  9 files changed, 166 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index 2587ea834f06..3589ebcf27bc 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -185,7 +185,8 @@ i915-y +=3D \
>         display/intel_tc.o
>  i915-$(CONFIG_ACPI) +=3D \
>         display/intel_acpi.o \
> -       display/intel_opregion.o
> +       display/intel_opregion.o \
> +       display/intel_privacy_screen.o
>  i915-$(CONFIG_DRM_FBDEV_EMULATION) +=3D \
>         display/intel_fbdev.o
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index d3fb75bb9eb1..378772d3449c 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -37,6 +37,7 @@
>  #include "intel_atomic.h"
>  #include "intel_display_types.h"
>  #include "intel_hdcp.h"
> +#include "intel_privacy_screen.h"
>  #include "intel_sprite.h"
>
>  /**
> @@ -57,11 +58,14 @@ int intel_digital_connector_atomic_get_property(struc=
t
> drm_connector *connector,
>         struct drm_i915_private *dev_priv =3D to_i915(dev);
>         struct intel_digital_connector_state *intel_conn_state =3D
>                 to_intel_digital_connector_state(state);
> +       struct intel_connector *intel_connector =3D
> to_intel_connector(connector);
>
>         if (property =3D=3D dev_priv->force_audio_property)
>                 *val =3D intel_conn_state->force_audio;
>         else if (property =3D=3D dev_priv->broadcast_rgb_property)
>                 *val =3D intel_conn_state->broadcast_rgb;
> +       else if (property =3D=3D intel_connector->privacy_screen_property=
)
> +               *val =3D intel_conn_state->privacy_screen_status;
>         else {
>                 DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
>                                  property->base.id, property->name);
> @@ -89,15 +93,18 @@ int intel_digital_connector_atomic_set_property(struc=
t
> drm_connector *connector,
>         struct drm_i915_private *dev_priv =3D to_i915(dev);
>         struct intel_digital_connector_state *intel_conn_state =3D
>                 to_intel_digital_connector_state(state);
> +       struct intel_connector *intel_connector =3D
> to_intel_connector(connector);
>
>         if (property =3D=3D dev_priv->force_audio_property) {
>                 intel_conn_state->force_audio =3D val;
>                 return 0;
> -       }
> -
> -       if (property =3D=3D dev_priv->broadcast_rgb_property) {
> +       } else if (property =3D=3D dev_priv->broadcast_rgb_property) {
>                 intel_conn_state->broadcast_rgb =3D val;
>                 return 0;
> +       } else if (property =3D=3D intel_connector->privacy_screen_proper=
ty) {
> +               intel_privacy_screen_set_val(intel_connector, val);
> +               intel_conn_state->privacy_screen_status =3D val;
> +               return 0;
>         }
>
>         DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c
> b/drivers/gpu/drm/i915/display/intel_connector.c
> index 308ec63207ee..3ccbf52aedf9 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -281,3 +281,38 @@ intel_attach_colorspace_property(struct drm_connecto=
r
> *connector)
>                 drm_object_attach_property(&connector->base,
>                                            connector->colorspace_property=
,
> 0);
>  }
> +
> +static const struct drm_prop_enum_list privacy_screen_enum[] =3D {
> +       { PRIVACY_SCREEN_DISABLED, "Disabled" },
> +       { PRIVACY_SCREEN_ENABLED, "Enabled" },
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
> +       struct intel_connector *intel_connector =3D
> to_intel_connector(connector);
> +       struct drm_property *prop;
> +
> +       if (!intel_connector->privacy_screen_property) {
> +               prop =3D drm_property_create_enum(connector->dev,
> +                                               DRM_MODE_PROP_ENUM,
> +                                               "privacy-screen",
> +                                               privacy_screen_enum,
> +
>  ARRAY_SIZE(privacy_screen_enum));
> +               if (!prop)
> +                       return;
> +
> +               intel_connector->privacy_screen_property =3D prop;
> +       }
> +
> +       drm_object_attach_property(&connector->base, prop,
> +                                  PRIVACY_SCREEN_DISABLED);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.h
> b/drivers/gpu/drm/i915/display/intel_connector.h
> index 93a7375c8196..61005f37a338 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.h
> +++ b/drivers/gpu/drm/i915/display/intel_connector.h
> @@ -31,5 +31,6 @@ void intel_attach_force_audio_property(struct
> drm_connector *connector);
>  void intel_attach_broadcast_rgb_property(struct drm_connector *connector=
);
>  void intel_attach_aspect_ratio_property(struct drm_connector *connector)=
;
>  void intel_attach_colorspace_property(struct drm_connector *connector);
> +void intel_attach_privacy_screen_property(struct drm_connector
> *connector);
>
>  #endif /* __INTEL_CONNECTOR_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c2706afc069b..83b8c98049a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -426,6 +426,9 @@ struct intel_connector {
>         struct work_struct modeset_retry_work;
>
>         struct intel_hdcp hdcp;
> +
> +       /* Optional "privacy-screen" property for the connector panel */
> +       struct drm_property *privacy_screen_property;
>  };
>
>  struct intel_digital_connector_state {
> @@ -433,6 +436,7 @@ struct intel_digital_connector_state {
>
>         enum hdmi_force_audio force_audio;
>         int broadcast_rgb;
> +       enum intel_privacy_screen_status privacy_screen_status;
>  };
>
>  #define to_intel_digital_connector_state(x) container_of(x, struct
> intel_digital_connector_state, base)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4fac408a4299..1963e92404ba 100644
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
> @@ -6358,6 +6359,10 @@ intel_dp_add_properties(struct intel_dp *intel_dp,
> struct drm_connector *connect
>
>                 /* Lookup the ACPI node corresponding to the connector */
>                 intel_connector_lookup_acpi_node(intel_connector);
> +
> +               /* Check for integrated Privacy screen support */
> +               if (intel_privacy_screen_present(intel_connector))
> +                       intel_attach_privacy_screen_property(connector);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/i915/display/intel_privacy_screen.c
> b/drivers/gpu/drm/i915/display/intel_privacy_screen.c
> new file mode 100644
> index 000000000000..4c422e38c51a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_privacy_screen.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Intel ACPI privacy screen code
> + *
> + * Copyright =C2=A9 2019 Google Inc.
> + */
> +
> +#include <linux/acpi.h>
> +
> +#include "intel_privacy_screen.h"
> +
> +#define CONNECTOR_DSM_REVID 1
> +
> +#define CONNECTOR_DSM_FN_PRIVACY_ENABLE                2
> +#define CONNECTOR_DSM_FN_PRIVACY_DISABLE               3
> +
> +static const guid_t drm_conn_dsm_guid =3D
> +       GUID_INIT(0xC7033113, 0x8720, 0x4CEB,
> +                 0x90, 0x90, 0x9D, 0x52, 0xB3, 0xE5, 0x2D, 0x73);
> +
> +/* Makes _DSM call to set privacy screen status */
> +static void acpi_privacy_screen_call_dsm(acpi_handle conn_handle, u64
> func)
> +{
> +       union acpi_object *obj;
> +
> +       obj =3D acpi_evaluate_dsm(conn_handle, &drm_conn_dsm_guid,
> +                               CONNECTOR_DSM_REVID, func, NULL);
> +       if (!obj) {
> +               DRM_DEBUG_DRIVER("failed to evaluate _DSM for fn %llx\n",
> func);
> +               return;
> +       }
> +
> +       ACPI_FREE(obj);
> +}
> +
> +void intel_privacy_screen_set_val(struct intel_connector *intel_connecto=
r,
> +                                 enum intel_privacy_screen_status val)
> +{
> +       acpi_handle acpi_handle =3D intel_connector->acpi_handle;
> +
> +       if (!acpi_handle)
> +               return;
> +
> +       if (val =3D=3D PRIVACY_SCREEN_DISABLED)
> +               acpi_privacy_screen_call_dsm(acpi_handle,
> +
> CONNECTOR_DSM_FN_PRIVACY_DISABLE);
> +       else if (val =3D=3D PRIVACY_SCREEN_ENABLED)
> +               acpi_privacy_screen_call_dsm(acpi_handle,
> +
> CONNECTOR_DSM_FN_PRIVACY_ENABLE);
> +}
> +
> +bool intel_privacy_screen_present(struct intel_connector *intel_connecto=
r)
> +{
> +       acpi_handle handle =3D intel_connector->acpi_handle;
> +
> +       if (!handle)
> +               return false;
> +
> +       if (!acpi_check_dsm(handle, &drm_conn_dsm_guid,
> +                           CONNECTOR_DSM_REVID,
> +                           1 << CONNECTOR_DSM_FN_PRIVACY_ENABLE |
> +                           1 << CONNECTOR_DSM_FN_PRIVACY_DISABLE)) {
> +               DRM_WARN("%s: Odd, connector ACPI node but no privacy
> scrn?\n",
> +                        dev_name(intel_connector->base.dev->dev));
> +               return false;
> +       }
> +       DRM_DEV_INFO(intel_connector->base.dev->dev,
> +                    "supports privacy screen\n");
> +       return true;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_privacy_screen.h
> b/drivers/gpu/drm/i915/display/intel_privacy_screen.h
> new file mode 100644
> index 000000000000..212f73349a00
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_privacy_screen.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright =C2=A9 2019 Google Inc.
> + */
> +
> +#ifndef __DRM_PRIVACY_SCREEN_H__
> +#define __DRM_PRIVACY_SCREEN_H__
> +
> +#include "intel_display_types.h"
> +
> +#ifdef CONFIG_ACPI
> +bool intel_privacy_screen_present(struct intel_connector
> *intel_connector);
> +void intel_privacy_screen_set_val(struct intel_connector *intel_connecto=
r,
> +                                 enum intel_privacy_screen_status val);
> +#else
> +bool intel_privacy_screen_present(struct intel_connector
> *intel_connector);
> +{
> +       return false;
> +}
> +void intel_privacy_screen_set_val(struct intel_connector *intel_connecto=
r,
> +                                 enum intel_privacy_screen_status val)
> +{ }
> +#endif /* CONFIG_ACPI */
> +
> +#endif /* __DRM_PRIVACY_SCREEN_H__ */
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 469dc512cca3..cf08d5636363 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2123,6 +2123,20 @@ struct drm_i915_query_engine_info {
>         struct drm_i915_engine_info engines[];
>  };
>
> +/**
> + * enum intel_privacy_screen_status - privacy_screen status
> + *
> + * This enum is used to track and control the state of the integrated
> privacy
> + * screen present on some display panels, via the "privacy-screen"
> property.
> + *
> + * @PRIVACY_SCREEN_DISABLED: The privacy-screen on the panel is disabled
> + * @PRIVACY_SCREEN_ENABLED:  The privacy-screen on the panel is enabled
> + **/
> +enum intel_privacy_screen_status {
> +       PRIVACY_SCREEN_DISABLED =3D 0,
> +       PRIVACY_SCREEN_ENABLED =3D 1,
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.24.0.rc1.363.gb1bccd3e3d-goog
>
>

--000000000000c52be505972b0875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 4, 2019 at 11:41 AM Rajat=
 Jain &lt;<a href=3D"mailto:rajatja@google.com">rajatja@google.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Certain l=
aptops now come with panels that have integrated privacy<br>
screens on them. This patch adds support for such panels by adding<br>
a privacy-screen property to the intel_connector for the panel, that<br>
the userspace can then use to control and check the status.<br>
<br>
Identifying the presence of privacy screen, and controlling it, is done<br>
via ACPI _DSM methods.<br>
<br>
Currently, this is done only for the Intel display ports. But in future,<br=
>
this can be done for any other ports if the hardware becomes available<br>
(e.g. external monitors supporting integrated privacy screens?).<br>
<br>
Signed-off-by: Rajat Jain &lt;<a href=3D"mailto:rajatja@google.com" target=
=3D"_blank">rajatja@google.com</a>&gt;<br>
Change-Id: Ic9ff07fc4a50797d2d0dfb919f11aa0821a4b548<br>
---<br>
v2: Formed by splitting the original patch into multiple patches.<br>
=C2=A0 =C2=A0 - All code has been moved into i915 now.<br>
=C2=A0 =C2=A0 - Privacy screen is a i915 property<br>
=C2=A0 =C2=A0 - Have a local state variable to store the prvacy screen. Don=
&#39;t read<br>
=C2=A0 =C2=A0 =C2=A0 it from hardware.<br></blockquote><div><br></div><div>=
<br></div><div>Hi Folks,</div><div><br></div><div>I posted a v2 taking care=
 of the comments I received (also split it into 3 patches now, and resused =
some ACPI code I found in i915 driver). . Wondering if any one got a chance=
 to look at this?</div><div><br></div><div>Thanks,</div><div><br></div><div=
>Rajat</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
=C2=A0drivers/gpu/drm/i915/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A0drivers/gpu/drm/i915/display/intel_atomic.c=C2=A0 =C2=A0| 13 +++-<br>
=C2=A0.../gpu/drm/i915/display/intel_connector.c=C2=A0 =C2=A0 | 35 ++++++++=
++<br>
=C2=A0.../gpu/drm/i915/display/intel_connector.h=C2=A0 =C2=A0 |=C2=A0 1 +<b=
r>
=C2=A0.../drm/i915/display/intel_display_types.h=C2=A0 =C2=A0 |=C2=A0 4 ++<=
br>
=C2=A0drivers/gpu/drm/i915/display/intel_dp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 5 ++<br>
=C2=A0.../drm/i915/display/intel_privacy_screen.c=C2=A0 =C2=A0| 70 ++++++++=
+++++++++++<br>
=C2=A0.../drm/i915/display/intel_privacy_screen.h=C2=A0 =C2=A0| 25 +++++++<=
br>
=C2=A0include/uapi/drm/i915_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++<br>
=C2=A09 files changed, 166 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.=
c<br>
=C2=A0create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.=
h<br>
<br>
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile<=
br>
index 2587ea834f06..3589ebcf27bc 100644<br>
--- a/drivers/gpu/drm/i915/Makefile<br>
+++ b/drivers/gpu/drm/i915/Makefile<br>
@@ -185,7 +185,8 @@ i915-y +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 display/intel_tc.o<br>
=C2=A0i915-$(CONFIG_ACPI) +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 display/intel_acpi.o \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0display/intel_opregion.o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0display/intel_opregion.o \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0display/intel_privacy_screen.o<br>
=C2=A0i915-$(CONFIG_DRM_FBDEV_EMULATION) +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 display/intel_fbdev.o<br>
<br>
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/=
i915/display/intel_atomic.c<br>
index d3fb75bb9eb1..378772d3449c 100644<br>
--- a/drivers/gpu/drm/i915/display/intel_atomic.c<br>
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c<br>
@@ -37,6 +37,7 @@<br>
=C2=A0#include &quot;intel_atomic.h&quot;<br>
=C2=A0#include &quot;intel_display_types.h&quot;<br>
=C2=A0#include &quot;intel_hdcp.h&quot;<br>
+#include &quot;intel_privacy_screen.h&quot;<br>
=C2=A0#include &quot;intel_sprite.h&quot;<br>
<br>
=C2=A0/**<br>
@@ -57,11 +58,14 @@ int intel_digital_connector_atomic_get_property(struct =
drm_connector *connector,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_private *dev_priv =3D to_i915(d=
ev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct intel_digital_connector_state *intel_con=
n_state =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_intel_digital_co=
nnector_state(state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct intel_connector *intel_connector =3D to_=
intel_connector(connector);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (property =3D=3D dev_priv-&gt;force_audio_pr=
operty)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D intel_conn=
_state-&gt;force_audio;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (property =3D=3D dev_priv-&gt;broadcast=
_rgb_property)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D intel_conn=
_state-&gt;broadcast_rgb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (property =3D=3D intel_connector-&gt;pr=
ivacy_screen_property)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D intel_conn=
_state-&gt;privacy_screen_status;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG_ATOMIC(&q=
uot;Unknown property [PROP:%d:%s]\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property-&gt;<a href=3D"http:/=
/base.id" rel=3D"noreferrer" target=3D"_blank">base.id</a>, property-&gt;na=
me);<br>
@@ -89,15 +93,18 @@ int intel_digital_connector_atomic_set_property(struct =
drm_connector *connector,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_private *dev_priv =3D to_i915(d=
ev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct intel_digital_connector_state *intel_con=
n_state =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_intel_digital_co=
nnector_state(state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct intel_connector *intel_connector =3D to_=
intel_connector(connector);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (property =3D=3D dev_priv-&gt;force_audio_pr=
operty) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intel_conn_state-&g=
t;force_audio =3D val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (property =3D=3D dev_priv-&gt;broadcast_rgb_=
property) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (property =3D=3D dev_priv-&gt;broadca=
st_rgb_property) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intel_conn_state-&g=
t;broadcast_rgb =3D val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (property =3D=3D intel_connector-&gt;=
privacy_screen_property) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_privacy_scree=
n_set_val(intel_connector, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_conn_state-&g=
t;privacy_screen_status =3D val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG_ATOMIC(&quot;Unknown property [PROP:%=
d:%s]\n&quot;,<br>
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/d=
rm/i915/display/intel_connector.c<br>
index 308ec63207ee..3ccbf52aedf9 100644<br>
--- a/drivers/gpu/drm/i915/display/intel_connector.c<br>
+++ b/drivers/gpu/drm/i915/display/intel_connector.c<br>
@@ -281,3 +281,38 @@ intel_attach_colorspace_property(struct drm_connector =
*connector)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_object_attach_p=
roperty(&amp;connector-&gt;base,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0connector-&gt;colorspace_property, 0);<br>
=C2=A0}<br>
+<br>
+static const struct drm_prop_enum_list privacy_screen_enum[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ PRIVACY_SCREEN_DISABLED, &quot;Disabled&quot;=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ PRIVACY_SCREEN_ENABLED, &quot;Enabled&quot; }=
,<br>
+};<br>
+<br>
+/**<br>
+ * intel_attach_privacy_screen_property -<br>
+ *=C2=A0 =C2=A0 =C2=A0create and attach the connecter&#39;s privacy-screen=
 property. *<br>
+ * @connector: connector for which to init the privacy-screen property<br>
+ *<br>
+ * This function creates and attaches the &quot;privacy-screen&quot; prope=
rty to the<br>
+ * connector. Initial state of privacy-screen is set to disabled.<br>
+ */<br>
+void<br>
+intel_attach_privacy_screen_property(struct drm_connector *connector)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct intel_connector *intel_connector =3D to_=
intel_connector(connector);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *prop;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!intel_connector-&gt;privacy_screen_propert=
y) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D drm_proper=
ty_create_enum(connector-&gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0DRM_MODE_PROP_ENUM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;privacy-screen&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0privacy_screen_enum,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ARRAY_SIZE(privacy_screen_enum));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prop)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_connector-&gt=
;privacy_screen_property =3D prop;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_object_attach_property(&amp;connector-&gt;b=
ase, prop,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PRIVACY_SCREEN_DISABLED);<br>
+}<br>
diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/d=
rm/i915/display/intel_connector.h<br>
index 93a7375c8196..61005f37a338 100644<br>
--- a/drivers/gpu/drm/i915/display/intel_connector.h<br>
+++ b/drivers/gpu/drm/i915/display/intel_connector.h<br>
@@ -31,5 +31,6 @@ void intel_attach_force_audio_property(struct drm_connect=
or *connector);<br>
=C2=A0void intel_attach_broadcast_rgb_property(struct drm_connector *connec=
tor);<br>
=C2=A0void intel_attach_aspect_ratio_property(struct drm_connector *connect=
or);<br>
=C2=A0void intel_attach_colorspace_property(struct drm_connector *connector=
);<br>
+void intel_attach_privacy_screen_property(struct drm_connector *connector)=
;<br>
<br>
=C2=A0#endif /* __INTEL_CONNECTOR_H__ */<br>
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/g=
pu/drm/i915/display/intel_display_types.h<br>
index c2706afc069b..83b8c98049a7 100644<br>
--- a/drivers/gpu/drm/i915/display/intel_display_types.h<br>
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h<br>
@@ -426,6 +426,9 @@ struct intel_connector {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct work_struct modeset_retry_work;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct intel_hdcp hdcp;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Optional &quot;privacy-screen&quot; property=
 for the connector panel */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *privacy_screen_property;<b=
r>
=C2=A0};<br>
<br>
=C2=A0struct intel_digital_connector_state {<br>
@@ -433,6 +436,7 @@ struct intel_digital_connector_state {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum hdmi_force_audio force_audio;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int broadcast_rgb;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum intel_privacy_screen_status privacy_screen=
_status;<br>
=C2=A0};<br>
<br>
=C2=A0#define to_intel_digital_connector_state(x) container_of(x, struct in=
tel_digital_connector_state, base)<br>
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915=
/display/intel_dp.c<br>
index 4fac408a4299..1963e92404ba 100644<br>
--- a/drivers/gpu/drm/i915/display/intel_dp.c<br>
+++ b/drivers/gpu/drm/i915/display/intel_dp.c<br>
@@ -62,6 +62,7 @@<br>
=C2=A0#include &quot;intel_lspcon.h&quot;<br>
=C2=A0#include &quot;intel_lvds.h&quot;<br>
=C2=A0#include &quot;intel_panel.h&quot;<br>
+#include &quot;intel_privacy_screen.h&quot;<br>
=C2=A0#include &quot;intel_psr.h&quot;<br>
=C2=A0#include &quot;intel_sideband.h&quot;<br>
=C2=A0#include &quot;intel_tc.h&quot;<br>
@@ -6358,6 +6359,10 @@ intel_dp_add_properties(struct intel_dp *intel_dp, s=
truct drm_connector *connect<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Lookup the ACPI =
node corresponding to the connector */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intel_connector_loo=
kup_acpi_node(intel_connector);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check for integr=
ated Privacy screen support */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (intel_privacy_s=
creen_present(intel_connector))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0intel_attach_privacy_screen_property(connector);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
diff --git a/drivers/gpu/drm/i915/display/intel_privacy_screen.c b/drivers/=
gpu/drm/i915/display/intel_privacy_screen.c<br>
new file mode 100644<br>
index 000000000000..4c422e38c51a<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/i915/display/intel_privacy_screen.c<br>
@@ -0,0 +1,70 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Intel ACPI privacy screen code<br>
+ *<br>
+ * Copyright =C2=A9 2019 Google Inc.<br>
+ */<br>
+<br>
+#include &lt;linux/acpi.h&gt;<br>
+<br>
+#include &quot;intel_privacy_screen.h&quot;<br>
+<br>
+#define CONNECTOR_DSM_REVID 1<br>
+<br>
+#define CONNECTOR_DSM_FN_PRIVACY_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 2<br>
+#define CONNECTOR_DSM_FN_PRIVACY_DISABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A03<br>
+<br>
+static const guid_t drm_conn_dsm_guid =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GUID_INIT(0xC7033113, 0x8720, 0x4CEB,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x90, 0x90, =
0x9D, 0x52, 0xB3, 0xE5, 0x2D, 0x73);<br>
+<br>
+/* Makes _DSM call to set privacy screen status */<br>
+static void acpi_privacy_screen_call_dsm(acpi_handle conn_handle, u64 func=
)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0union acpi_object *obj;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D acpi_evaluate_dsm(conn_handle, &amp;drm=
_conn_dsm_guid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONNECTOR_DSM_REVID, func, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&q=
uot;failed to evaluate _DSM for fn %llx\n&quot;, func);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ACPI_FREE(obj);<br>
+}<br>
+<br>
+void intel_privacy_screen_set_val(struct intel_connector *intel_connector,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum intel_privacy_screen_stat=
us val)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_handle acpi_handle =3D intel_connector-&gt=
;acpi_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!acpi_handle)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val =3D=3D PRIVACY_SCREEN_DISABLED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_privacy_screen=
_call_dsm(acpi_handle,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 CONNECTOR_DSM_FN_PRIVACY_DISABLE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (val =3D=3D PRIVACY_SCREEN_ENABLED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_privacy_screen=
_call_dsm(acpi_handle,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 CONNECTOR_DSM_FN_PRIVACY_ENABLE);<br>
+}<br>
+<br>
+bool intel_privacy_screen_present(struct intel_connector *intel_connector)=
<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_handle handle =3D intel_connector-&gt;acpi=
_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!handle)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!acpi_check_dsm(handle, &amp;drm_conn_dsm_g=
uid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0CONNECTOR_DSM_REVID,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01 &lt;&lt; CONNECTOR_DSM_FN_PRIVACY_ENABLE |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01 &lt;&lt; CONNECTOR_DSM_FN_PRIVACY_DISABLE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_WARN(&quot;%s: =
Odd, connector ACPI node but no privacy scrn?\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_name(intel_connector-&gt;base.dev-&gt;dev));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEV_INFO(intel_connector-&gt;base.dev-&gt;d=
ev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;supports privacy screen\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
+}<br>
diff --git a/drivers/gpu/drm/i915/display/intel_privacy_screen.h b/drivers/=
gpu/drm/i915/display/intel_privacy_screen.h<br>
new file mode 100644<br>
index 000000000000..212f73349a00<br>
--- /dev/null<br>
+++ b/drivers/gpu/drm/i915/display/intel_privacy_screen.h<br>
@@ -0,0 +1,25 @@<br>
+/* SPDX-License-Identifier: GPL-2.0-or-later */<br>
+/*<br>
+ * Copyright =C2=A9 2019 Google Inc.<br>
+ */<br>
+<br>
+#ifndef __DRM_PRIVACY_SCREEN_H__<br>
+#define __DRM_PRIVACY_SCREEN_H__<br>
+<br>
+#include &quot;intel_display_types.h&quot;<br>
+<br>
+#ifdef CONFIG_ACPI<br>
+bool intel_privacy_screen_present(struct intel_connector *intel_connector)=
;<br>
+void intel_privacy_screen_set_val(struct intel_connector *intel_connector,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum intel_privacy_screen_stat=
us val);<br>
+#else<br>
+bool intel_privacy_screen_present(struct intel_connector *intel_connector)=
;<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+}<br>
+void intel_privacy_screen_set_val(struct intel_connector *intel_connector,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum intel_privacy_screen_stat=
us val)<br>
+{ }<br>
+#endif /* CONFIG_ACPI */<br>
+<br>
+#endif /* __DRM_PRIVACY_SCREEN_H__ */<br>
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h<br>
index 469dc512cca3..cf08d5636363 100644<br>
--- a/include/uapi/drm/i915_drm.h<br>
+++ b/include/uapi/drm/i915_drm.h<br>
@@ -2123,6 +2123,20 @@ struct drm_i915_query_engine_info {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_i915_engine_info engines[];<br>
=C2=A0};<br>
<br>
+/**<br>
+ * enum intel_privacy_screen_status - privacy_screen status<br>
+ *<br>
+ * This enum is used to track and control the state of the integrated priv=
acy<br>
+ * screen present on some display panels, via the &quot;privacy-screen&quo=
t; property.<br>
+ *<br>
+ * @PRIVACY_SCREEN_DISABLED: The privacy-screen on the panel is disabled<b=
r>
+ * @PRIVACY_SCREEN_ENABLED:=C2=A0 The privacy-screen on the panel is enabl=
ed<br>
+ **/<br>
+enum intel_privacy_screen_status {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PRIVACY_SCREEN_DISABLED =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PRIVACY_SCREEN_ENABLED =3D 1,<br>
+};<br>
+<br>
=C2=A0#if defined(__cplusplus)<br>
=C2=A0}<br>
=C2=A0#endif<br>
-- <br>
2.24.0.rc1.363.gb1bccd3e3d-goog<br>
<br>
</blockquote></div></div>

--000000000000c52be505972b0875--

--===============1915400943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1915400943==--

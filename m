Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E5813368
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 15:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A863410E2E8;
	Thu, 14 Dec 2023 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAD610E2E8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 14:43:55 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-d9caf5cc948so7708906276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 06:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1702565034; x=1703169834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7VOHEjr6SIYFxsxke5CLr2wLl4zzX23oxof/KhSpGBM=;
 b=lZXnO+pc6yKN79QX5wmPkuokSOv//HeX3IPMsf7dP3pYVmAs34Eg10e4OCXWU7PKt5
 8Ulnc/I2v5uiCDq6TfYTlZYpfuCFbJoGxm30k8fuH3SEmUDTUX4u/wnE9PJn+3k/Pnh+
 7vLjNv0XX64SsUx5TEkJIL8usNQUmNiOfD41oXdA6LKDyQtYEg3+VMT56ckO7A3pS3Oq
 apSwOPITZkLeZvAaKKXd4l9VOBORLcuhVS98aQnB6ssyadFDrSacH35js4akC8mlbDy5
 hOUMvszNUIqAH2IP11zN8SK8MGXQXO/nlmCnhtjA3I7dyRL3UnxL5ZBYPKj5Z3fWAI32
 3XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702565034; x=1703169834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7VOHEjr6SIYFxsxke5CLr2wLl4zzX23oxof/KhSpGBM=;
 b=ZCByCe69Bg2n07HEj5QLONith4HraYLcFeOYzLJpp+zn2rYJ1r55xluQKXNOKreHEz
 lDGNGzcs7mOQiIDMRKgPTFDfymlocjf5swSCt8BuLSAJEy6eC21jTh7zm/eqyVujxtAX
 ncNGPq2yhKKufTRSX+3obupXqb6Wzz2VYMra84kpqcLKojilGQ+iu8Aqm5fJVGRHCXxP
 WrWLXiwgM5tobn4rkPXqLc01g75NatDHqQ4PZ1GZkEjGt1LYvbfBQD5sMNZU2v2XjRQQ
 oSdxarorluzV40BD9nzm+3dZAxnhrtNS0Ch9eN47K5lOVnAMD7HlLtXsMRfZGLDMxLt5
 /BOA==
X-Gm-Message-State: AOJu0YxVEvMsO+5sUXlkEIoOlsYTh1pRCmSvoYwipL7Kvhrh8YEA03/s
 Xagun7IJ9Xk/qn7LaASpgb/XOHk54wLxF7mxtYmscQ==
X-Google-Smtp-Source: AGHT+IGbhsUP6HZcOFCjbXTQUwWLcxiTogvfJ0J4kYjI3b0d61AO2k2FRDmU5RCSdr1Bo33bR4ySvTgjASA9nwZqiiw=
X-Received: by 2002:a05:6902:1ac1:b0:db9:9125:4050 with SMTP id
 db1-20020a0569021ac100b00db991254050mr6465946ybb.30.1702565034246; Thu, 14
 Dec 2023 06:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 14:43:37 +0000
Message-ID: <CAPY8ntCs9EAYsxwjkscms3kqoC0N8+CcTHoyrG+gFMc0Mh=cwg@mail.gmail.com>
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
>
> The i915 driver has a property to force the RGB range of an HDMI output.
> The vc4 driver then implemented the same property with the same
> semantics. KWin has support for it, and a PR for mutter is also there to
> support it.
>
> Both drivers implementing the same property with the same semantics,
> plus the userspace having support for it, is proof enough that it's
> pretty much a de-facto standard now and we can provide helpers for it.
>
> Let's plumb it into the newly created HDMI connector.

To have such a significant proportion of the patch being kunit tests
when there was no reference to such in the commit text was slightly
unexpected.

> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  Documentation/gpu/kms-properties.csv               |   1 -
>  drivers/gpu/drm/drm_atomic.c                       |   5 +
>  drivers/gpu/drm/drm_atomic_state_helper.c          |  17 +
>  drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +
>  drivers/gpu/drm/drm_connector.c                    |  76 +++++
>  drivers/gpu/drm/tests/Makefile                     |   1 +
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 376 +++++++++++++++=
++++++
>  drivers/gpu/drm/tests/drm_connector_test.c         | 117 ++++++-
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 ++++++
>  include/drm/drm_connector.h                        |  36 ++
>  10 files changed, 737 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms=
-properties.csv
> index 0f9590834829..caef14c532d4 100644
> --- a/Documentation/gpu/kms-properties.csv
> +++ b/Documentation/gpu/kms-properties.csv
> @@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Property =
Values,Object attached,De
>  ,Virtual GPU,=E2=80=9Csuggested X=E2=80=9D,RANGE,"Min=3D0, Max=3D0xfffff=
fff",Connector,property to suggest an X offset for a connector
>  ,,=E2=80=9Csuggested Y=E2=80=9D,RANGE,"Min=3D0, Max=3D0xffffffff",Connec=
tor,property to suggest an Y offset for a connector
>  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Conn=
ector,TDB
> -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limi=
ted 16:235"" }",Connector,"When this property is set to Limited 16:235 and =
CTM is set, the hardware will be programmed with the result of the multipli=
cation of CTM by the limited range matrix to ensure the pixels normally in =
the range 0..1.0 are remapped to the range 16/255..235/255."
>  ,,=E2=80=9Caudio=E2=80=9D,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on=
"" }",Connector,TBD
>  ,SDVO-TV,=E2=80=9Cmode=E2=80=9D,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_4=
43"", ""PAL_B"" } etc.",Connector,TBD
>  ,,"""left_margin""",RANGE,"Min=3D0, Max=3D SDVO dependent",Connector,TBD
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index c31fc0b48c31..1465a7f09a0b 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1142,6 +1142,11 @@ static void drm_atomic_connector_print_state(struc=
t drm_printer *p,
>         drm_printf(p, "\tmax_requested_bpc=3D%d\n", state->max_requested_=
bpc);
>         drm_printf(p, "\tcolorspace=3D%s\n", drm_get_colorspace_name(stat=
e->colorspace));
>
> +       if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> +           connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB)
> +               drm_printf(p, "\tbroadcast_rgb=3D%s\n",
> +                          drm_hdmi_connector_get_broadcast_rgb_name(stat=
e->hdmi.broadcast_rgb));
> +
>         if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK=
)
>                 if (state->writeback_job && state->writeback_job->fb)
>                         drm_printf(p, "\tfb=3D%d\n", state->writeback_job=
->fb->base.id);
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index e69c0cc1c6da..10d98620a358 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -583,6 +583,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
>  void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *conn=
ector,
>                                               struct drm_connector_state =
*new_state)
>  {
> +       new_state->hdmi.broadcast_rgb =3D DRM_HDMI_BROADCAST_RGB_AUTO;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
>
> @@ -650,6 +651,22 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
>  int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connect=
or,
>                                            struct drm_atomic_state *state=
)
>  {
> +       struct drm_connector_state *old_state =3D
> +               drm_atomic_get_old_connector_state(state, connector);
> +       struct drm_connector_state *new_state =3D
> +               drm_atomic_get_new_connector_state(state, connector);
> +
> +       if (old_state->hdmi.broadcast_rgb !=3D new_state->hdmi.broadcast_=
rgb) {
> +               struct drm_crtc *crtc =3D new_state->crtc;
> +               struct drm_crtc_state *crtc_state;
> +
> +               crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +               if (IS_ERR(crtc_state))
> +                       return PTR_ERR(crtc_state);
> +
> +               crtc_state->mode_changed =3D true;
> +       }
> +
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index aee4a65d4959..3eb4f4bc8b71 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -818,6 +818,8 @@ static int drm_atomic_connector_set_property(struct d=
rm_connector *connector,
>                 state->max_requested_bpc =3D val;
>         } else if (property =3D=3D connector->privacy_screen_sw_state_pro=
perty) {
>                 state->privacy_screen_sw_state =3D val;
> +       } else if (property =3D=3D connector->broadcast_rgb_property) {
> +               state->hdmi.broadcast_rgb =3D val;
>         } else if (connector->funcs->atomic_set_property) {
>                 return connector->funcs->atomic_set_property(connector,
>                                 state, property, val);
> @@ -901,6 +903,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>                 *val =3D state->max_requested_bpc;
>         } else if (property =3D=3D connector->privacy_screen_sw_state_pro=
perty) {
>                 *val =3D state->privacy_screen_sw_state;
> +       } else if (property =3D=3D connector->broadcast_rgb_property) {
> +               *val =3D state->hdmi.broadcast_rgb;
>         } else if (connector->funcs->atomic_get_property) {
>                 return connector->funcs->atomic_get_property(connector,
>                                 state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index d9961cce8245..929b0a911f62 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1183,6 +1183,29 @@ static const u32 dp_colorspaces =3D
>         BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
>         BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
>
> +static const struct drm_prop_enum_list broadcast_rgb_names[] =3D {
> +       { DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
> +       { DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
> +       { DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
> +};
> +
> +/*
> + * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI =
connector RGB broadcast selection
> + * @broadcast_rgb: Broadcast RGB selection to compute name of
> + *
> + * Returns: the name of the Broadcast RGB selection, or NULL if the type
> + * is not valid.
> + */
> +const char *
> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb br=
oadcast_rgb)
> +{
> +       if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
> +               return NULL;
> +
> +       return broadcast_rgb_names[broadcast_rgb].name;
> +}
> +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> +
>  /**
>   * DOC: standard connector properties
>   *
> @@ -1655,6 +1678,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
>  /**
>   * DOC: HDMI connector properties
>   *
> + * Broadcast RGB
> + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> + *      Infoframes will be generated according to that value.
> + *
> + *      The value of this property can be one of the following:
> + *
> + *      Automatic:
> + *              RGB Range is selected automatically based on the mode
> + *              according to the HDMI specifications.
> + *
> + *      Full:
> + *              Full RGB Range is forced.
> + *
> + *      Limited 16:235:
> + *              Limited RGB Range is forced. Unlike the name suggests,
> + *              this works for any number of bits-per-component.
> + *
> + *      Drivers can set up this property by calling
> + *      drm_connector_attach_broadcast_rgb_property().
> + *
>   * content type (HDMI specific):
>   *     Indicates content type setting to be used in HDMI infoframes to i=
ndicate
>   *     content type for the external device, so that it adjusts its disp=
lay
> @@ -2517,6 +2560,39 @@ int drm_connector_attach_hdr_output_metadata_prope=
rty(struct drm_connector *conn
>  }
>  EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
>
> +/**
> + * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" =
property
> + * @connector: connector to attach the property on.
> + *
> + * This is used to add support for forcing the RGB range on a connector
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *co=
nnector)
> +{
> +       struct drm_device *dev =3D connector->dev;
> +       struct drm_property *prop;
> +
> +       prop =3D connector->broadcast_rgb_property;
> +       if (!prop) {
> +               prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ENUM=
,
> +                                               "Broadcast RGB",
> +                                               broadcast_rgb_names,
> +                                               ARRAY_SIZE(broadcast_rgb_=
names));
> +               if (!prop)
> +                       return -EINVAL;
> +
> +               connector->broadcast_rgb_property =3D prop;
> +       }
> +
> +       drm_object_attach_property(&connector->base, prop,
> +                                  DRM_HDMI_BROADCAST_RGB_AUTO);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_broadcast_rgb_property);
> +
>  /**
>   * drm_connector_attach_colorspace_property - attach "Colorspace" proper=
ty
>   * @connector: connector to attach the property on.
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makef=
ile
> index d6183b3d7688..b29ddfd90596 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) +=3D \
>         drm_kunit_helpers.o
>
>  obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \
> +       drm_atomic_state_helper_test.o \
>         drm_buddy_test.o \
>         drm_cmdline_parser_test.o \
>         drm_connector_test.o \
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drive=
rs/gpu/drm/tests/drm_atomic_state_helper_test.c
> new file mode 100644
> index 000000000000..21e6f796ee13
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Kunit test for drm_atomic_state_helper functions
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <drm/drm_print.h>
> +#include "../drm_crtc_internal.h"
> +
> +#include <kunit/test.h>
> +
> +#include "drm_kunit_edid.h"
> +
> +struct drm_atomic_helper_connector_hdmi_priv {
> +       struct drm_device drm;
> +       struct drm_plane *plane;
> +       struct drm_crtc *crtc;
> +       struct drm_encoder encoder;
> +       struct drm_connector connector;
> +
> +       const char *current_edid;
> +       size_t current_edid_len;
> +};
> +
> +#define connector_to_priv(c) \
> +       container_of_const(c, struct drm_atomic_helper_connector_hdmi_pri=
v, connector)
> +
> +static struct drm_display_mode *find_preferred_mode(struct drm_connector=
 *connector)
> +{
> +       struct drm_device *drm =3D connector->dev;
> +       struct drm_display_mode *mode, *preferred;
> +
> +       mutex_lock(&drm->mode_config.mutex);
> +       preferred =3D list_first_entry(&connector->modes, struct drm_disp=
lay_mode, head);
> +       list_for_each_entry(mode, &connector->modes, head)
> +               if (mode->type & DRM_MODE_TYPE_PREFERRED)
> +                       preferred =3D mode;
> +       mutex_unlock(&drm->mode_config.mutex);
> +
> +       return preferred;
> +}
> +
> +static int light_up_connector(struct kunit *test,
> +                             struct drm_device *drm,
> +                             struct drm_crtc *crtc,
> +                             struct drm_connector *connector,
> +                             struct drm_display_mode *mode,
> +                             struct drm_modeset_acquire_ctx *ctx)
> +{
> +       struct drm_atomic_state *state;
> +       struct drm_connector_state *conn_state;
> +       struct drm_crtc_state *crtc_state;
> +       int ret;
> +
> +       state =3D drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       conn_state =3D drm_atomic_get_connector_state(state, connector);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +       ret =3D drm_atomic_set_crtc_for_connector(conn_state, crtc);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +       ret =3D drm_atomic_set_mode_for_crtc(crtc_state, mode);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       crtc_state->enable =3D true;
> +       crtc_state->active =3D true;
> +
> +       ret =3D drm_atomic_commit(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       return 0;
> +}
> +
> +static int set_connector_edid(struct kunit *test, struct drm_connector *=
connector,
> +                             const char *edid, size_t edid_len)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv =3D
> +               connector_to_priv(connector);
> +       struct drm_device *drm =3D connector->dev;
> +       int ret;
> +
> +       priv->current_edid =3D edid;
> +       priv->current_edid_len =3D edid_len;
> +
> +       mutex_lock(&drm->mode_config.mutex);
> +       ret =3D connector->funcs->fill_modes(connector, 4096, 4096);
> +       mutex_unlock(&drm->mode_config.mutex);
> +       KUNIT_ASSERT_GT(test, ret, 0);
> +
> +       return 0;
> +}
> +
> +static int dummy_connector_get_modes(struct drm_connector *connector)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv =3D
> +               connector_to_priv(connector);
> +       const struct drm_edid *edid;
> +       unsigned int num_modes;
> +
> +       edid =3D drm_edid_alloc(priv->current_edid, priv->current_edid_le=
n);
> +       if (!edid)
> +               return -EINVAL;
> +
> +       drm_edid_connector_update(connector, edid);
> +       num_modes =3D drm_edid_connector_add_modes(connector);
> +
> +       drm_edid_free(edid);
> +
> +       return num_modes;
> +}
> +
> +static const struct drm_connector_helper_funcs dummy_connector_helper_fu=
ncs =3D {
> +       .atomic_check   =3D drm_atomic_helper_connector_hdmi_check,
> +       .get_modes      =3D dummy_connector_get_modes,
> +};
> +
> +static void dummy_hdmi_connector_reset(struct drm_connector *connector)
> +{
> +       drm_atomic_helper_connector_reset(connector);
> +       __drm_atomic_helper_connector_hdmi_reset(connector, connector->st=
ate);
> +}
> +
> +static const struct drm_connector_funcs dummy_connector_funcs =3D {
> +       .atomic_destroy_state   =3D drm_atomic_helper_connector_destroy_s=
tate,
> +       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate=
_state,
> +       .fill_modes             =3D drm_helper_probe_single_connector_mod=
es,
> +       .reset                  =3D dummy_hdmi_connector_reset,
> +};
> +
> +static
> +struct drm_atomic_helper_connector_hdmi_priv *
> +drm_atomic_helper_connector_hdmi_init(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_connector *conn;
> +       struct drm_encoder *enc;
> +       struct drm_device *drm;
> +       struct device *dev;
> +       int ret;
> +
> +       dev =3D drm_kunit_helper_alloc_device(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +       priv =3D drm_kunit_helper_alloc_drm_device(test, dev,
> +                                                struct drm_atomic_helper=
_connector_hdmi_priv, drm,
> +                                                DRIVER_MODESET | DRIVER_=
ATOMIC);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> +       test->priv =3D priv;
> +
> +       drm =3D &priv->drm;
> +       priv->plane =3D drm_kunit_helper_create_primary_plane(test, drm,
> +                                                           NULL,
> +                                                           NULL,
> +                                                           NULL, 0,
> +                                                           NULL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->plane);
> +
> +       priv->crtc =3D drm_kunit_helper_create_crtc(test, drm,
> +                                                 priv->plane, NULL,
> +                                                 NULL,
> +                                                 NULL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->crtc);
> +
> +       enc =3D &priv->encoder;
> +       ret =3D drmm_encoder_init(drm, enc, NULL, DRM_MODE_ENCODER_TMDS, =
NULL);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       enc->possible_crtcs =3D drm_crtc_mask(priv->crtc);
> +
> +       conn =3D &priv->connector;
> +       ret =3D drmm_connector_hdmi_init(drm, conn,
> +                                      &dummy_connector_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      NULL);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
> +       drm_connector_attach_encoder(conn, enc);
> +
> +       drm_mode_config_reset(drm);
> +
> +       ret =3D set_connector_edid(test, conn,
> +                                test_edid_hdmi_1080p_rgb_max_200mhz,
> +                                ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_=
200mhz));
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       return priv;
> +}
> +
> +/*
> + * Test that if we change the RGB quantization property to a different
> + * value, we trigger a mode change on the connector's CRTC, which will
> + * in turn disable/enable the connector.
> + */
> +static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit =
*test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *old_conn_state;
> +       struct drm_connector_state *new_conn_state;
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv =3D drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       ctx =3D drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       conn =3D &priv->connector;
> +       preferred =3D find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +       drm =3D &priv->drm;
> +       crtc =3D priv->crtc;
> +       ret =3D light_up_connector(test, drm, crtc, conn, preferred, ctx)=
;
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state =3D drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +       old_conn_state =3D drm_atomic_get_old_connector_state(state, conn=
);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +       new_conn_state->hdmi.broadcast_rgb =3D DRM_HDMI_BROADCAST_RGB_FUL=
L;
> +
> +       KUNIT_ASSERT_NE(test,
> +                       old_conn_state->hdmi.broadcast_rgb,
> +                       new_conn_state->hdmi.broadcast_rgb);
> +
> +       ret =3D drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       new_conn_state =3D drm_atomic_get_new_connector_state(state, conn=
);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +       KUNIT_EXPECT_EQ(test, new_conn_state->hdmi.broadcast_rgb, DRM_HDM=
I_BROADCAST_RGB_FULL);
> +
> +       crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +       KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
> +}
> +
> +/*
> + * Test that if we set the RGB quantization property to the same value,
> + * we don't trigger a mode change on the connector's CRTC and leave the
> + * connector unaffected.
> + */
> +static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct ku=
nit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_modeset_acquire_ctx *ctx;
> +       struct drm_connector_state *old_conn_state;
> +       struct drm_connector_state *new_conn_state;
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_atomic_state *state;
> +       struct drm_display_mode *preferred;
> +       struct drm_connector *conn;
> +       struct drm_device *drm;
> +       struct drm_crtc *crtc;
> +       int ret;
> +
> +       priv =3D drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       ctx =3D drm_kunit_helper_acquire_ctx_alloc(test);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +       conn =3D &priv->connector;
> +       preferred =3D find_preferred_mode(conn);
> +       KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +       drm =3D &priv->drm;
> +       crtc =3D priv->crtc;
> +       ret =3D light_up_connector(test, drm, crtc, conn, preferred, ctx)=
;
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       state =3D drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +       new_conn_state =3D drm_atomic_get_connector_state(state, conn);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +       old_conn_state =3D drm_atomic_get_old_connector_state(state, conn=
);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +       new_conn_state->hdmi.broadcast_rgb =3D old_conn_state->hdmi.broad=
cast_rgb;
> +
> +       ret =3D drm_atomic_check_only(state);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       old_conn_state =3D drm_atomic_get_old_connector_state(state, conn=
);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +       new_conn_state =3D drm_atomic_get_new_connector_state(state, conn=
);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +       KUNIT_EXPECT_EQ(test,
> +                       old_conn_state->hdmi.broadcast_rgb,
> +                       new_conn_state->hdmi.broadcast_rgb);
> +
> +       crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +       KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
> +}
> +
> +static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] =
=3D {
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
> +       { }
> +};
> +
> +static struct kunit_suite drm_atomic_helper_connector_hdmi_check_test_su=
ite =3D {
> +       .name           =3D "drm_atomic_helper_connector_hdmi_check",
> +       .test_cases     =3D drm_atomic_helper_connector_hdmi_check_tests,
> +};
> +
> +/*
> + * Test that the value of the Broadcast RGB property out of reset is set
> + * to auto.
> + */
> +static void drm_test_check_broadcast_rgb_value(struct kunit *test)
> +{
> +       struct drm_atomic_helper_connector_hdmi_priv *priv;
> +       struct drm_connector_state *conn_state;
> +       struct drm_connector *conn;
> +
> +       priv =3D drm_atomic_helper_connector_hdmi_init(test);
> +       KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +       conn =3D &priv->connector;
> +       conn_state =3D conn->state;
> +       KUNIT_EXPECT_EQ(test, conn_state->hdmi.broadcast_rgb, DRM_HDMI_BR=
OADCAST_RGB_AUTO);
> +}
> +
> +static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] =
=3D {
> +       KUNIT_CASE(drm_test_check_broadcast_rgb_value),
> +       { }
> +};
> +
> +static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_su=
ite =3D {
> +       .name           =3D "drm_atomic_helper_connector_hdmi_reset",
> +       .test_cases     =3D drm_atomic_helper_connector_hdmi_reset_tests,
> +};
> +
> +kunit_test_suites(
> +       &drm_atomic_helper_connector_hdmi_check_test_suite,
> +       &drm_atomic_helper_connector_hdmi_reset_test_suite,
> +);
> +
> +MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm=
/tests/drm_connector_test.c
> index 8f070cacab3b..41d33dea30af 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -12,6 +12,8 @@
>
>  #include <kunit/test.h>
>
> +#include "../drm_crtc_internal.h"
> +
>  struct drm_connector_init_priv {
>         struct drm_device drm;
>         struct drm_connector connector;
> @@ -357,10 +359,123 @@ static struct kunit_suite drm_get_tv_mode_from_nam=
e_test_suite =3D {
>         .test_cases =3D drm_get_tv_mode_from_name_tests,
>  };
>
> +struct drm_hdmi_connector_get_broadcast_rgb_name_test {
> +       unsigned int kind;
> +       const char *expected_name;
> +};
> +
> +#define BROADCAST_RGB_TEST(_kind, _name)       \
> +       {                                       \
> +               .kind =3D _kind,                  \
> +               .expected_name =3D _name,         \
> +       }
> +
> +static void drm_test_drm_hdmi_connector_get_broadcast_rgb_name(struct ku=
nit *test)
> +{
> +       const struct drm_hdmi_connector_get_broadcast_rgb_name_test *para=
ms =3D
> +               test->param_value;
> +
> +       KUNIT_EXPECT_STREQ(test,
> +                          drm_hdmi_connector_get_broadcast_rgb_name(para=
ms->kind),
> +                          params->expected_name);
> +}
> +
> +static const
> +struct drm_hdmi_connector_get_broadcast_rgb_name_test
> +drm_hdmi_connector_get_broadcast_rgb_name_valid_tests[] =3D {
> +       BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic"),
> +       BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_FULL, "Full"),
> +       BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:23=
5"),
> +};
> +
> +static void
> +drm_hdmi_connector_get_broadcast_rgb_name_valid_desc(const struct drm_hd=
mi_connector_get_broadcast_rgb_name_test *t,
> +                                                    char *desc)
> +{
> +       sprintf(desc, "%s", t->expected_name);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_broadcast_rgb_name_valid,
> +                 drm_hdmi_connector_get_broadcast_rgb_name_valid_tests,
> +                 drm_hdmi_connector_get_broadcast_rgb_name_valid_desc);
> +
> +static void drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid(s=
truct kunit *test)
> +{
> +       KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_broadcast_rgb_name=
(3));
> +};
> +
> +static struct kunit_case drm_hdmi_connector_get_broadcast_rgb_name_tests=
[] =3D {
> +       KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_broadcast_rgb_na=
me,
> +                        drm_hdmi_connector_get_broadcast_rgb_name_valid_=
gen_params),
> +       KUNIT_CASE(drm_test_drm_hdmi_connector_get_broadcast_rgb_name_inv=
alid),
> +       { }
> +};
> +
> +static struct kunit_suite drm_hdmi_connector_get_broadcast_rgb_name_test=
_suite =3D {
> +       .name =3D "drm_hdmi_connector_get_broadcast_rgb_name",
> +       .test_cases =3D drm_hdmi_connector_get_broadcast_rgb_name_tests,
> +};
> +
> +static void drm_test_drm_connector_attach_broadcast_rgb_property(struct =
kunit *test)
> +{
> +       struct drm_connector_init_priv *priv =3D test->priv;
> +       struct drm_connector *connector =3D &priv->connector;
> +       struct drm_property *prop;
> +       int ret;
> +
> +       ret =3D drmm_connector_init(&priv->drm, connector,
> +                                 &dummy_funcs,
> +                                 DRM_MODE_CONNECTOR_HDMIA,
> +                                 &priv->ddc);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ret =3D drm_connector_attach_broadcast_rgb_property(connector);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       prop =3D connector->broadcast_rgb_property;
> +       KUNIT_ASSERT_NOT_NULL(test, prop);
> +       KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector-=
>base, prop->base.id));
> +}
> +
> +static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_co=
nnector(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv =3D test->priv;
> +       struct drm_connector *connector =3D &priv->connector;
> +       struct drm_property *prop;
> +       int ret;
> +
> +       ret =3D drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      &priv->ddc);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +       ret =3D drm_connector_attach_broadcast_rgb_property(connector);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       prop =3D connector->broadcast_rgb_property;
> +       KUNIT_ASSERT_NOT_NULL(test, prop);
> +       KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector-=
>base, prop->base.id));
> +}
> +
> +static struct kunit_case drm_connector_attach_broadcast_rgb_property_tes=
ts[] =3D {
> +       KUNIT_CASE(drm_test_drm_connector_attach_broadcast_rgb_property),
> +       KUNIT_CASE(drm_test_drm_connector_attach_broadcast_rgb_property_h=
dmi_connector),
> +       { }
> +};
> +
> +static struct kunit_suite drm_connector_attach_broadcast_rgb_property_te=
st_suite =3D {
> +       .name =3D "drm_connector_attach_broadcast_rgb_property",
> +       .init =3D drm_test_connector_init,
> +       .test_cases =3D drm_connector_attach_broadcast_rgb_property_tests=
,
> +};
> +
>  kunit_test_suites(
>         &drmm_connector_hdmi_init_test_suite,
>         &drmm_connector_init_test_suite,
> -       &drm_get_tv_mode_from_name_test_suite
> +       &drm_connector_attach_broadcast_rgb_property_test_suite,
> +       &drm_get_tv_mode_from_name_test_suite,
> +       &drm_hdmi_connector_get_broadcast_rgb_name_test_suite
>  );
>
>  MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
> diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tes=
ts/drm_kunit_edid.h
> new file mode 100644
> index 000000000000..2bba316de064
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
> @@ -0,0 +1,106 @@
> +#ifndef DRM_KUNIT_EDID_H_
> +#define DRM_KUNIT_EDID_H_
> +
> +/*
> + * edid-decode (hex):
> + *
> + * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
> + * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
> + * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
> + * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
> + * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
> + * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
> + * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
> + *
> + * 02 03 1b 81 e3 05 00 20 41 10 e2 00 4a 6d 03 0c
> + * 00 12 34 00 28 20 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0
> + *
> + * ----------------
> + *
> + * Block 0, Base EDID:
> + *   EDID Structure Version & Revision: 1.3
> + *   Vendor & Product Identification:
> + *     Manufacturer: LNX
> + *     Model: 42
> + *     Made in: 2023
> + *   Basic Display Parameters & Features:
> + *     Digital display
> + *     DFP 1.x compatible TMDS
> + *     Maximum image size: 160 cm x 90 cm
> + *     Gamma: 2.20
> + *     Monochrome or grayscale display
> + *     First detailed timing is the preferred timing
> + *   Color Characteristics:
> + *     Red  : 0.0000, 0.0000
> + *     Green: 0.0000, 0.0000
> + *     Blue : 0.0000, 0.0000
> + *     White: 0.0000, 0.0000
> + *   Established Timings I & II:
> + *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.1=
75000 MHz
> + *   Standard Timings: none
> + *   Detailed Timing Descriptors:
> + *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.5000=
00 MHz (1600 mm x 900 mm)
> + *                  Hfront   88 Hsync  44 Hback  148 Hpol P
> + *                  Vfront    4 Vsync   5 Vback   36 Vpol P
> + *     Display Product Name: 'Test EDID'
> + *     Display Range Limits:
> + *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150=
 MHz
> + *     Dummy Descriptor:
> + *   Extension blocks: 1
> + * Checksum: 0x92
> + *
> + * ----------------
> + *
> + * Block 1, CTA-861 Extension Block:
> + *   Revision: 3
> + *   Underscans IT Video Formats by default
> + *   Native detailed modes: 1
> + *   Colorimetry Data Block:
> + *     sRGB
> + *   Video Data Block:
> + *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.50=
0000 MHz
> + *   Video Capability Data Block:
> + *     YCbCr quantization: No Data
> + *     RGB quantization: Selectable (via AVI Q)
> + *     PT scan behavior: No Data
> + *     IT scan behavior: Always Underscanned
> + *     CE scan behavior: Always Underscanned
> + *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> + *     Source physical address: 1.2.3.4
> + *     Maximum TMDS clock: 200 MHz
> + *     Extended HDMI video details:
> + * Checksum: 0xd0  Unused space in Extension Block: 100 bytes
> + */
> +const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] =3D {
> +  0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78=
,
> +  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20=
,
> +  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01=
,
> +  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38=
,
> +  0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e=
,
> +  0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44=
,
> +  0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32=
,
> +  0x46, 0x00, 0x00, 0xc4, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20=
,
> +  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x41, 0x02, 0x03, 0x1b, 0x81=
,
> +  0xe3, 0x05, 0x00, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x6d, 0x03, 0x0c=
,
> +  0x00, 0x12, 0x34, 0x00, 0x28, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
,
> +  0x00, 0x00, 0x00, 0xd0
> +};
> +
> +#endif // DRM_KUNIT_EDID_H_
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 000a2a156619..3867a4c01b78 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -368,6 +368,30 @@ enum drm_panel_orientation {
>         DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>
> +/**
> + * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for an HDMI @dr=
m_connector
> + */
> +enum drm_hdmi_broadcast_rgb {
> +       /**
> +        * @DRM_HDMI_BROADCAST_RGB_AUTO: The RGB range is selected
> +        * automatically based on the mode.
> +        */
> +       DRM_HDMI_BROADCAST_RGB_AUTO,
> +
> +       /**
> +        * @DRM_HDMI_BROADCAST_RGB_FULL: Full range RGB is forced.
> +        */
> +       DRM_HDMI_BROADCAST_RGB_FULL,
> +
> +       /**
> +        * @DRM_HDMI_BROADCAST_RGB_LIMITED: Limited range RGB is forced.
> +        */
> +       DRM_HDMI_BROADCAST_RGB_LIMITED,
> +};
> +
> +const char *
> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb br=
oadcast_rgb);
> +
>  /**
>   * struct drm_monitor_range_info - Panel's Monitor range in EDID for
>   * &drm_display_info
> @@ -1037,6 +1061,11 @@ struct drm_connector_state {
>          * @drm_atomic_helper_connector_hdmi_check().
>          */
>         struct {
> +               /**
> +                * @broadcast_rgb: Connector property to pass the
> +                * Broadcast RGB selection value.
> +                */
> +               enum drm_hdmi_broadcast_rgb broadcast_rgb;
>         } hdmi;
>  };
>
> @@ -1706,6 +1735,12 @@ struct drm_connector {
>          */
>         struct drm_property *privacy_screen_hw_state_property;
>
> +       /**
> +        * @broadcast_rgb_property: Connector property to set the
> +        * Broadcast RGB selection to output with.
> +        */
> +       struct drm_property *broadcast_rgb_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -2026,6 +2061,7 @@ int drm_connector_attach_scaling_mode_property(stru=
ct drm_connector *connector,
>                                                u32 scaling_mode_mask);
>  int drm_connector_attach_vrr_capable_property(
>                 struct drm_connector *connector);
> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *co=
nnector);
>  int drm_connector_attach_colorspace_property(struct drm_connector *conne=
ctor);
>  int drm_connector_attach_hdr_output_metadata_property(struct drm_connect=
or *connector);
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state =
*old_state,
>
> --
> 2.43.0
>

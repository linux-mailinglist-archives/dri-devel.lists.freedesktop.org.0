Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583678D7A5B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 05:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAAA10E169;
	Mon,  3 Jun 2024 03:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XXeMtc+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D30210E169
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 03:05:41 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2eaad2c673fso8629921fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 20:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717383939; x=1717988739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qjbofJ4QhGtFV8hR/G9Tjboy1h+3aztsLKcxB9QZ+1s=;
 b=XXeMtc+Whj1R7kuTeVwT20hmBeWhX0bb1JLpqavfYAaqThlzYgV9nafBIKwT/GMR3N
 amuF7IBLPiiLm8uqyLikM1pKsH94SWiZhU+rcTdhsQ4AxBXOehzqwxM1YgQa6XSfTXnJ
 Y7FPGg5d9ufqsvwpmeAHF3Tq1unD5PmIAo4l4BljQhpWE8UhnGLuJV/O1Mef0Ctsus8H
 Zvay7Ys85CY/PNPMGXemVn16wmHkg5eZgK6cZTZr1XIVb6wv7cVtCv51so52P4FjFelU
 hMFaR4H0snou8E1bcIqtYpJ5aN8coFROOJbdckFJ0w5ZNSlf91vTjZi5fL+hrzprDV3+
 bpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717383939; x=1717988739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qjbofJ4QhGtFV8hR/G9Tjboy1h+3aztsLKcxB9QZ+1s=;
 b=PEKq7k3YQhLLce/5GUprGIZXOQU11qLjFrFab411AfaYehqNJwMEIcTlgyC2Yizz5c
 J0lwcPHRhmYhrDE8iPQNG1ICwPZzLHtrp0E1b42CnDzkGiT12kN9517D9tBKliTEIVpj
 /IPGlGhrjuwF+Vr1S6w1LBkwQdU/HirR9PywuGs7U3LsyB4sqK8ZOkh63MRY9KT0cqZ+
 3lTYw3wvn+/r/jXIWJWPxJxEDHzpq/d/XuE34C9BS2NoPM1HmgZFfo8azxF9bkkdQiSS
 0GuqmAJ2KXrc9hn9LoXHEs1EjB5jGBwZ32RVsaBju4493sJkJI3XVcbmz/N2qsv5LLJv
 9DIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfX6cXKhQojBKxr/XG5DZVKE7xLR0f8iun/OPLapY7hhjN/7u7DvpOCCMZvcF9fiXVtT2o9x6gd3LbDGmnHMovI3FPrEKxCp5oZmrSjti5
X-Gm-Message-State: AOJu0Yy7w1vkGlAONotpGgfgSf8JoC9I/BCr1muy1G8cA2v7qN1dywt8
 R5Q6iWTziwciYxG7veyTWfm3/EnFVKUTXTBIT1a5QSH23nCVSJvOe41j348sNTZXSDu1cAiLrLe
 3/jW5UxZeIWCAX+4b8vLhaLEljTQ=
X-Google-Smtp-Source: AGHT+IGAy9L5QmUGuRFXmfHd42nmRBDmJWy1EV2xrDLPHLiwUr4qkqY9jQgDywNed/Xl7l5P7xkbPH0kNLImzsAsUSo=
X-Received: by 2002:a05:651c:2059:b0:2ea:7a2a:4d1c with SMTP id
 38308e7fff4ca-2ea950e93b3mr62175161fa.8.1717383938853; Sun, 02 Jun 2024
 20:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
 <20240602-drm-imx-cleanup-v3-11-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-11-e549e2a43100@linaro.org>
From: Chris Healy <cphealy@gmail.com>
Date: Sun, 2 Jun 2024 20:05:27 -0700
Message-ID: <CAFXsbZrGR8uX3i-vR_+B2HjZMM+y0+j6tVy69fA2JRF7ZMZ0Tg@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] drm/imx: parallel-display: switch to
 imx_legacy_bridge / drm_bridge_connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 2, 2024 at 5:04=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Use the imx_legacy bridge driver instead of handlign display modes via
> the connector node.

fix spelling of "handling"
>
> All existing usecases already support attaching using
> the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, while the imx_legacy bridge
> doesn't support creating connector at all. Switch to
> drm_bridge_connector at the same time.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 100 ++++++---------------=
------
>  1 file changed, 20 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/d=
rm/imx/ipuv3/parallel-display.c
> index 9ac2a94fa62b..70f62e89622e 100644
> --- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> +++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
> @@ -12,19 +12,18 @@
>  #include <linux/platform_device.h>
>  #include <linux/videodev2.h>
>
> -#include <video/of_display_timing.h>
> -
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <drm/bridge/imx.h>
>
>  #include "imx-drm.h"
>
>  struct imx_parallel_display_encoder {
> -       struct drm_connector connector;
>         struct drm_encoder encoder;
>         struct drm_bridge bridge;
>         struct imx_parallel_display *pd;
> @@ -33,51 +32,14 @@ struct imx_parallel_display_encoder {
>  struct imx_parallel_display {
>         struct device *dev;
>         u32 bus_format;
> -       u32 bus_flags;
> -       struct drm_display_mode mode;
>         struct drm_bridge *next_bridge;
>  };
>
> -static inline struct imx_parallel_display *con_to_imxpd(struct drm_conne=
ctor *c)
> -{
> -       return container_of(c, struct imx_parallel_display_encoder, conne=
ctor)->pd;
> -}
> -
>  static inline struct imx_parallel_display *bridge_to_imxpd(struct drm_br=
idge *b)
>  {
>         return container_of(b, struct imx_parallel_display_encoder, bridg=
e)->pd;
>  }
>
> -static int imx_pd_connector_get_modes(struct drm_connector *connector)
> -{
> -       struct imx_parallel_display *imxpd =3D con_to_imxpd(connector);
> -       struct device_node *np =3D imxpd->dev->of_node;
> -       int num_modes;
> -
> -       if (np) {
> -               struct drm_display_mode *mode =3D drm_mode_create(connect=
or->dev);
> -               int ret;
> -
> -               if (!mode)
> -                       return 0;
> -
> -               ret =3D of_get_drm_display_mode(np, &imxpd->mode,
> -                                             &imxpd->bus_flags,
> -                                             OF_USE_NATIVE_MODE);
> -               if (ret) {
> -                       drm_mode_destroy(connector->dev, mode);
> -                       return 0;
> -               }
> -
> -               drm_mode_copy(mode, &imxpd->mode);
> -               mode->type |=3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREF=
ERRED;
> -               drm_mode_probed_add(connector, mode);
> -               num_modes++;
> -       }
> -
> -       return num_modes;
> -}
> -
>  static const u32 imx_pd_bus_fmts[] =3D {
>         MEDIA_BUS_FMT_RGB888_1X24,
>         MEDIA_BUS_FMT_BGR888_1X24,
> @@ -171,7 +133,6 @@ static int imx_pd_bridge_atomic_check(struct drm_brid=
ge *bridge,
>  {
>         struct imx_crtc_state *imx_crtc_state =3D to_imx_crtc_state(crtc_=
state);
>         struct drm_display_info *di =3D &conn_state->connector->display_i=
nfo;
> -       struct imx_parallel_display *imxpd =3D bridge_to_imxpd(bridge);
>         struct drm_bridge_state *next_bridge_state =3D NULL;
>         struct drm_bridge *next_bridge;
>         u32 bus_flags, bus_fmt;
> @@ -183,10 +144,8 @@ static int imx_pd_bridge_atomic_check(struct drm_bri=
dge *bridge,
>
>         if (next_bridge_state)
>                 bus_flags =3D next_bridge_state->input_bus_cfg.flags;
> -       else if (di->num_bus_formats)
> -               bus_flags =3D di->bus_flags;
>         else
> -               bus_flags =3D imxpd->bus_flags;
> +               bus_flags =3D di->bus_flags;
>
>         bus_fmt =3D bridge_state->input_bus_cfg.format;
>         if (!imx_pd_format_supported(bus_fmt))
> @@ -202,19 +161,16 @@ static int imx_pd_bridge_atomic_check(struct drm_br=
idge *bridge,
>         return 0;
>  }
>
> -static const struct drm_connector_funcs imx_pd_connector_funcs =3D {
> -       .fill_modes =3D drm_helper_probe_single_connector_modes,
> -       .destroy =3D imx_drm_connector_destroy,
> -       .reset =3D drm_atomic_helper_connector_reset,
> -       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate=
_state,
> -       .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
> -};
> +static int imx_pd_bridge_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{
> +       struct imx_parallel_display *imxpd =3D bridge_to_imxpd(bridge);
>
> -static const struct drm_connector_helper_funcs imx_pd_connector_helper_f=
uncs =3D {
> -       .get_modes =3D imx_pd_connector_get_modes,
> -};
> +       return drm_bridge_attach(bridge->encoder, imxpd->next_bridge, bri=
dge, flags);
> +}
>
>  static const struct drm_bridge_funcs imx_pd_bridge_funcs =3D {
> +       .attach =3D imx_pd_bridge_attach,
>         .atomic_reset =3D drm_atomic_helper_bridge_reset,
>         .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> @@ -239,7 +195,6 @@ static int imx_pd_bind(struct device *dev, struct dev=
ice *master, void *data)
>                 return PTR_ERR(imxpd_encoder);
>
>         imxpd_encoder->pd =3D imxpd;
> -       connector =3D &imxpd_encoder->connector;
>         encoder =3D &imxpd_encoder->encoder;
>         bridge =3D &imxpd_encoder->bridge;
>
> @@ -247,28 +202,14 @@ static int imx_pd_bind(struct device *dev, struct d=
evice *master, void *data)
>         if (ret)
>                 return ret;
>
> -       /* set the connector's dpms to OFF so that
> -        * drm_helper_connector_dpms() won't return
> -        * immediately since the current state is ON
> -        * at this point.
> -        */
> -       connector->dpms =3D DRM_MODE_DPMS_OFF;
> -
>         bridge->funcs =3D &imx_pd_bridge_funcs;
> -       drm_bridge_attach(encoder, bridge, NULL, 0);
> -
> -       if (imxpd->next_bridge) {
> -               ret =3D drm_bridge_attach(encoder, imxpd->next_bridge, br=
idge, 0);
> -               if (ret < 0)
> -                       return ret;
> -       } else {
> -               drm_connector_helper_add(connector,
> -                                        &imx_pd_connector_helper_funcs);
> -               drm_connector_init(drm, connector, &imx_pd_connector_func=
s,
> -                                  DRM_MODE_CONNECTOR_DPI);
> -
> -               drm_connector_attach_encoder(connector, encoder);
> -       }
> +       drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CON=
NECTOR);
> +
> +       connector =3D drm_bridge_connector_init(drm, encoder);
> +       if (IS_ERR(connector))
> +               return PTR_ERR(connector);
> +
> +       drm_connector_attach_encoder(connector, encoder);
>
>         return 0;
>  }
> @@ -292,12 +233,11 @@ static int imx_pd_probe(struct platform_device *pde=
v)
>
>         /* port@1 is the output port */
>         imxpd->next_bridge =3D devm_drm_of_get_bridge(dev, np, 1, 0);
> +       if (imxpd->next_bridge =3D=3D ERR_PTR(-ENODEV))
> +               imxpd->next_bridge =3D devm_imx_drm_legacy_bridge(dev, np=
, DRM_MODE_CONNECTOR_DPI);
>         if (IS_ERR(imxpd->next_bridge)) {
>                 ret =3D PTR_ERR(imxpd->next_bridge);
> -               if (ret !=3D -ENODEV)
> -                       return ret;
> -
> -               imxpd->next_bridge =3D NULL;
> +               return ret;
>         }
>
>         ret =3D of_property_read_string(np, "interface-pix-fmt", &fmt);
>
> --
> 2.39.2
>

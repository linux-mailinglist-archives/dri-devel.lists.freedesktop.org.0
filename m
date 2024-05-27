Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3658D045F
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF3E10EE1A;
	Mon, 27 May 2024 14:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fQo454uE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D55210ECD0;
 Mon, 27 May 2024 14:44:23 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2bdfa8ef0c3so2940231a91.0; 
 Mon, 27 May 2024 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716821062; x=1717425862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33epQlN6HkJRhJOgQtZxq9FfffiSVKippP5QOan7qrs=;
 b=fQo454uE6oGuBKbSFPcm1ay9HxjXW7WFyMd7kKUbE9a/uEsl6Q4NJzNLyPxAnOUgQ/
 pdXYl1Rgcq8RVXmGwOOEzNSrUyY1BVD0AZ2sOiRGQaZyuIpFrNk/n+AiwZra3GWKXRWa
 glOtvesfCKEVDSrSHFupBpw2Jg+0raQzro+JFjysNo+Me5J3reCQtjb/+N2lNbSaQSDl
 rxwOSxYRhnyal4uJC+jjuLCn85JoF6Yzgk5VNTHdIov3FPXqxu4bWdpe8wbcix+BazIf
 G0woDRU5xe1Z0K+s21hZ193Nt1GN6pc3H3XXvCacl+pVZelgYS9fO9f1+2s/Md8AcHKC
 6l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716821062; x=1717425862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=33epQlN6HkJRhJOgQtZxq9FfffiSVKippP5QOan7qrs=;
 b=OPm/KEUpg2BZd++Muz+JqYlNLPKurGvxFk4B5SqF2bDG3RHrJQ3v1W0xzSoa8GP/lw
 o2FMHAVuD3+3wM/W1ug3sDbCM1MSefIWoxWxSTaUgYPt9/ZgmHQNVIKimImhRGYyeUT8
 iSYttgqrfYFC6cY4D29uIPYl2qW4M6mhT25b0t/sIpU58VtA5dJPziHTmoewPwcd6YfX
 gH4T6CcWeZh51E9fjud1cw6DzP7VRW5tIS1EEVVPZ+ekOSSz1q5OVZb32z2Rxa3MJJ+L
 WIaWwSTStaUNzjd7X8lpng45w/9qPxVU8i2nJxlENFLEQInpB7fvUYVb8BFI2dNKsc2V
 jVtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgk3LzDu8X+Id3tf3MkX6aplLNhSnyj4fSysQGKVEjREXlCEkNXMFeUaiS0b9gWUpJc7ybQNLZufsKwPHoJ4+1aAKSY2CWSjDacvkhKA==
X-Gm-Message-State: AOJu0YyNqmR8TqZsQOsgeOyvE7IBoY76LfDsgz/zUpKVG1bmEiudopcE
 bJxnT/qmy/LAk7tneMfnljtiyH6tXzfrwWwk+L7ejHJphi6L1bkKJ0KJ7m2URuBrhvbv+AEwY1H
 dr9Zi7dEOViXkw3ry0/5Fs5U+eOk=
X-Google-Smtp-Source: AGHT+IFm4UmAs6X0gy4NyYZ2+/6TjuN/HpBLYgaJx0duaa4fvNf+tI9o8AmCS25QUej7Si8DFMKmmT76q4H8I9wXtHA=
X-Received: by 2002:a17:90b:1085:b0:2bd:ec55:9f38 with SMTP id
 98e67ed59e1d1-2bf5ee1ff20mr8201233a91.29.1716821062404; Mon, 27 May 2024
 07:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240527142311.3053-1-mario.limonciello@amd.com>
In-Reply-To: <20240527142311.3053-1-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 May 2024 10:44:10 -0400
Message-ID: <CADnq5_MxA3JkUkYfu7baP30NKs1W49w-AEA8fM3W+XbTEMdOXw@mail.gmail.com>
Subject: Re: [PATCH] drm/client: Detect when ACPI lid is closed during
 initialization
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
 Chris Bainbridge <chris.bainbridge@gmail.com>
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

On Mon, May 27, 2024 at 10:32=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> If the lid on a laptop is closed when eDP connectors are populated
> then it remains enabled when the initial framebuffer configuration
> is built.
>
> When creating the initial framebuffer configuration detect the ACPI
> lid status and if it's closed disable any eDP connectors.
>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index 31af5cf37a09..b76438c31761 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include "drm/drm_modeset_lock.h"
> +#include <acpi/button.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> @@ -257,6 +258,27 @@ static void drm_client_connectors_enabled(struct drm=
_connector **connectors,
>                 enabled[i] =3D drm_connector_enabled(connectors[i], false=
);
>  }
>
> +static void drm_client_match_edp_lid(struct drm_device *dev,
> +                                    struct drm_connector **connectors,
> +                                    unsigned int connector_count,
> +                                    bool *enabled)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < connector_count; i++) {
> +               struct drm_connector *connector =3D connectors[i];
> +
> +               if (connector->connector_type !=3D DRM_MODE_CONNECTOR_eDP=
 || !enabled[i])

Might want to check for LVDS here as well since a lot of laptops used
LVDS prior to eDP.

Alex

> +                       continue;
> +
> +               if (!acpi_lid_open()) {
> +                       drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed=
, disabling\n",
> +                                   connector->base.id, connector->name);
> +                       enabled[i] =3D false;
> +               }
> +       }
> +}
> +
>  static bool drm_client_target_cloned(struct drm_device *dev,
>                                      struct drm_connector **connectors,
>                                      unsigned int connector_count,
> @@ -844,6 +866,7 @@ int drm_client_modeset_probe(struct drm_client_dev *c=
lient, unsigned int width,
>                 memset(crtcs, 0, connector_count * sizeof(*crtcs));
>                 memset(offsets, 0, connector_count * sizeof(*offsets));
>
> +               drm_client_match_edp_lid(dev, connectors, connector_count=
, enabled);
>                 if (!drm_client_target_cloned(dev, connectors, connector_=
count, modes,
>                                               offsets, enabled, width, he=
ight) &&
>                     !drm_client_target_preferred(dev, connectors, connect=
or_count, modes,
> --
> 2.43.0
>

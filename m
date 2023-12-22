Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B181CEBB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 20:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543A310E2D3;
	Fri, 22 Dec 2023 19:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3DF10E2D3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 19:27:53 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5e54d40cca2so16674367b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 11:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703273273; x=1703878073; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qcU9r4AVrvbf4WtHpqcHBpTh4EF03JkTAkr1e7pqyOs=;
 b=qmEOd4m9ti0skXVYpIfw8AES/yHoubKRHbuZqBt018Xn7l2nii3Ko9BlwL6N8OtDC0
 Iqw4nP7Ox8MxX7DJSDZbZm6G/V+9gmfWwulPRJcCfn/PVUtmtn8f2dKqDv0SCwGd1td1
 +3tCXf1+x/qwRBCtZTio18pno2fEkXGI8AznTdBwwIVF5L0weAY7ZOo0jhkTL479dF4D
 1t8C9rtOIBeNDVikB08eySwraEWzA1rtSB3HRCnNfZrh8iXh16GIL3MsRbWU3uxIUR+q
 HjgxW1+z0igH3+u/LdbLyEzm9ZiRZtxDsln7CXd2CaFs2PJhWvRS+tN+9MsLNonVTrWd
 mL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703273273; x=1703878073;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qcU9r4AVrvbf4WtHpqcHBpTh4EF03JkTAkr1e7pqyOs=;
 b=NA5BLT3/CAovomUEg9tAoDdIhZmfEQeInC/9LBDCuZEw/CAC6EkhhyohY1Tm+A4tLC
 u/hVl+qJmcm3DzGQXji+MrNnRGxM+aa394uoVhfDa9WgD4ZUBNbpTeSAODRNucMaDaQr
 W885IDj7U/7iyaVj24tV/cvW+fYyz1Ix0shPDoyIC1PcKX1rMsxtgiV/gSUFHwWm3hUV
 UYCjLSkdhHkvfkxPJwjtSwS1BMeL5HXwFjFO34D0+tfv4FZeAYRHcqlFDaB8HTJ92v35
 WpWfh36+k2jm8pnVrsWF/gNQgVVmEoPpRY5TJEsMGZw1PUnLtHpYUj9gLWLz2Dd5bmO0
 T+Kw==
X-Gm-Message-State: AOJu0YxoBdJHUzg/tlgSVRTC78gkqcbnBVtCJlRHOVC34kgaqiDoRHbT
 EqwjfZFK6A++c9qO6fL31vfiK8aHro1N1fvXoT7zByzDXDbuZw==
X-Google-Smtp-Source: AGHT+IGeaSYUG1cyrn3ypOpX9BrwgZ5g1vm+eRi1MomBm7xA9GGBF0W8jrXpfOmFxw8h9lJcSd3TusgaxjlIwkjChJU=
X-Received: by 2002:a81:5483:0:b0:5e5:39aa:2b4e with SMTP id
 i125-20020a815483000000b005e539aa2b4emr1274633ywb.26.1703273272787; Fri, 22
 Dec 2023 11:27:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1698312534.git.jani.nikula@intel.com>
 <daa4703cc30ee05836fb477a1a8da4b89a391afd.1698312534.git.jani.nikula@intel.com>
In-Reply-To: <daa4703cc30ee05836fb477a1a8da4b89a391afd.1698312534.git.jani.nikula@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Dec 2023 21:27:40 +0200
Message-ID: <CAA8EJprSKWXZ20-=1-Wx+TkG+6BnYMvqTwtqFA1nwFr=6Rn1Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: add ->edid_read hook and
 drm_bridge_edid_read()
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023 at 12:40, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Add new struct drm_edid based ->edid_read hook and
> drm_bridge_edid_read() function to call the hook.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 46 +++++++++++++++++++++++++++++++++++-
>  include/drm/drm_bridge.h     | 33 ++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 30d66bee0ec6..e1cfba2ff583 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -27,8 +27,9 @@
>  #include <linux/mutex.h>
>
>  #include <drm/drm_atomic_state_helper.h>
> -#include <drm/drm_debugfs.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_of.h>
> @@ -1206,6 +1207,47 @@ int drm_bridge_get_modes(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
>
> +/**
> + * drm_bridge_edid_read - read the EDID data of the connected display
> + * @bridge: bridge control structure
> + * @connector: the connector to read EDID for
> + *
> + * If the bridge supports output EDID retrieval, as reported by the
> + * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.edid_read to get
> + * the EDID and return it. Otherwise return NULL.
> + *
> + * If &drm_bridge_funcs.edid_read is not set, fall back to using
> + * drm_bridge_get_edid() and wrapping it in struct drm_edid.
> + *
> + * RETURNS:
> + * The retrieved EDID on success, or NULL otherwise.

Wouldn't it be better to return an ERR_PTR instead of NULL?

> + */
> +const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
> +                                           struct drm_connector *connector)
> +{
> +       if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
> +               return NULL;
> +
> +       /* Transitional: Fall back to ->get_edid. */
> +       if (!bridge->funcs->edid_read) {
> +               const struct drm_edid *drm_edid;
> +               struct edid *edid;
> +
> +               edid = drm_bridge_get_edid(bridge, connector);
> +               if (!edid)
> +                       return NULL;
> +
> +               drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
> +
> +               kfree(edid);
> +
> +               return drm_edid;
> +       }
> +
> +       return bridge->funcs->edid_read(bridge, connector);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_edid_read);

[skipped the rest]

-- 
With best wishes
Dmitry

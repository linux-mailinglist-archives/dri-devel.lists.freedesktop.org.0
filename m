Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90EC7761C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 15:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7089F10E43E;
	Wed,  9 Aug 2023 13:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD3C10E43E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 13:54:28 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-586b78aa26eso54909397b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691589267; x=1692194067;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KRic2viRJqVGrRf335aaYT7DkzmuJlPl+TpKJUtXSeI=;
 b=hi6bKCzHD2hS/5LIYWwtewtgLUJVYth9yonouJxdXSEXVPMT32HHF8uS9hmEaA3i7x
 Ti1PaLjHHpu8seGhsnYYtLj3t/ATKNdfGDNecSd7SAI04PgIEUemF3EB2ru2huVs7njk
 jPB4u/bB7uXF7hTS3pMwbD0DmepbZ6pVF1scGdPIm999QfGajKKKpTWb7VW5jyVPc7nJ
 xba2KSClrSxk82BLwlwGPE9qnN012tP6Qd9gr0afoh8TmMev9cEimIsxp6TDB7ZInmyE
 jWCjuitYGKIOiUWOX0GCibDP3/Y6FVh8Bm9QTxkEl/axF4zVOPENxco06CMP/K095uM4
 TBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691589267; x=1692194067;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRic2viRJqVGrRf335aaYT7DkzmuJlPl+TpKJUtXSeI=;
 b=krzh1pdXZIMmK6dhahl2NdAD42QSGZDkG2+ZpAzPTCEFHHUvZrDLNnsC/nCVSREIQf
 CdyJTSV4siBTh/qzSBE4glvUrZm8ZsFBuYUIIegoOqKDqjfDrtKKx6bTOkeAp0qfLL9d
 2zAU0YjLQ940mLCfwCMN4pnHUgv5uSiYzXNyrfnKxFpjJON1Mu+nFn9CtS6ESQ1XtfSR
 +FCvZgwCqj23mBGDtT/xGIGkIUgzzoiWifuFQLU11UPtOXTKCi6zP7PJ8+EPR3SOD8se
 0Ex58z9HZICsDFu1noMrPTq+ykZuKacHB2URjjLcTM8FZkLUEtoPP8yzciXL0VB+KBrD
 K3FQ==
X-Gm-Message-State: AOJu0YwMPSnpnFEI+oS/CjbKroU5cc1sP/IXiHKhi+Xrs8sCHbzta5QF
 DGBuVRSCe/CtBHTNsh8ShgqFWMgZnnEYDv0/SjK7MQ==
X-Google-Smtp-Source: AGHT+IFr5CrIGXlmkWlMVi4AD4DBEzpMJgAJGRsze7AWCE+wtKy6+ZUI1MHbo4o0A4ovQoHgpw+08jhYMawreTDDZYg=
X-Received: by 2002:a0d:c945:0:b0:579:e318:4c01 with SMTP id
 l66-20020a0dc945000000b00579e3184c01mr3347169ywd.19.1691589267383; Wed, 09
 Aug 2023 06:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230807061115.3244501-1-victor.liu@nxp.com>
In-Reply-To: <20230807061115.3244501-1-victor.liu@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Aug 2023 15:53:51 +0200
Message-ID: <CAPDyKFpyQqojAFtmY5NP1gQjL9ag1V-kHLUBRAx2UHBZ6rgVSg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: panel: Add a device link between drm
 device and panel device
To: Liu Ying <victor.liu@nxp.com>
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com, rfoss@kernel.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Aug 2023 at 08:06, Liu Ying <victor.liu@nxp.com> wrote:
>
> Add the device link when panel bridge is attached and delete the link
> when panel bridge is detached.  The drm device is the consumer while
> the panel device is the supplier.  This makes sure that the drm device
> suspends eariler and resumes later than the panel device, hence resolves
> problems where the order is reversed, like the problematic case mentioned
> in the below link.
>
> Link: https://lore.kernel.org/lkml/CAPDyKFr0XjrU_udKoUKQ_q8RWaUkyqL+8fV-7s1CTMqi7u3-Rg@mail.gmail.com/T/
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Looks good to me! Just a minor question though, don't we need to
manage runtime PM too - or this is solely for system wide
suspend/resume?

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> v2->v3:
> * Improve commit message s/swapped/reversed/.
>
> v1->v2:
> * Fix bailout for panel_bridge_attach() in case device_link_add() fails.
>
>  drivers/gpu/drm/bridge/panel.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 9316384b4474..a6587d233505 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -4,6 +4,8 @@
>   * Copyright (C) 2017 Broadcom
>   */
>
> +#include <linux/device.h>
> +
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_connector.h>
> @@ -19,6 +21,7 @@ struct panel_bridge {
>         struct drm_bridge bridge;
>         struct drm_connector connector;
>         struct drm_panel *panel;
> +       struct device_link *link;
>         u32 connector_type;
>  };
>
> @@ -60,6 +63,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>  {
>         struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>         struct drm_connector *connector = &panel_bridge->connector;
> +       struct drm_panel *panel = panel_bridge->panel;
> +       struct drm_device *drm_dev = bridge->dev;
>         int ret;
>
>         if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> @@ -70,6 +75,14 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>                 return -ENODEV;
>         }
>
> +       panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
> +                                            DL_FLAG_STATELESS);
> +       if (!panel_bridge->link) {
> +               DRM_ERROR("Failed to add device link between %s and %s\n",
> +                         dev_name(drm_dev->dev), dev_name(panel->dev));
> +               return -EINVAL;
> +       }
> +
>         drm_connector_helper_add(connector,
>                                  &panel_bridge_connector_helper_funcs);
>
> @@ -78,6 +91,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>                                  panel_bridge->connector_type);
>         if (ret) {
>                 DRM_ERROR("Failed to initialize connector\n");
> +               device_link_del(panel_bridge->link);
>                 return ret;
>         }
>
> @@ -100,6 +114,8 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
>         struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>         struct drm_connector *connector = &panel_bridge->connector;
>
> +       device_link_del(panel_bridge->link);
> +
>         /*
>          * Cleanup the connector if we know it was initialized.
>          *
> --
> 2.37.1
>

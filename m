Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292336DCCC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77C6E139;
	Wed, 28 Apr 2021 16:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2FF6EBD0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 16:16:35 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id t94so21396712ybi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6XXKhWivBSiK0NUKDt4xItDduSTkSI/DwmkHBVIryfE=;
 b=YD7+rQwZcFk9G5WfMpF2SXvysZJiFPSNUB3ux7Ts9/pxBovPkuuYtjCpojtGEwY0zf
 /kkrBf94JI9OFohX2Vu1j7vth1Ang5WI3vJKsFfby8hG6HRoj5fDAVQR+wG+J0HTU1Fx
 6WETSMYtWrCaC+3T2iIL10+a43BNMyUKmazERfc21vzI+zSj88vK4HbAoW6MDAeCH8Y2
 aAfDMyns5pgBnV6tOx1hfniDKHe3HXlJmCgSY8rZFuAf5FrYbga6vhoUITc+aDFeM5nH
 ay+BaVxn0K/jK+e+rN45JiDT90J8yhCdXE8dQms+0o295Gr+GCfVdzDZWnytjy1ArE3M
 rmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6XXKhWivBSiK0NUKDt4xItDduSTkSI/DwmkHBVIryfE=;
 b=TNViaTX3ICN+BHPohi//hHtDXAs4NjpMzwkLzzEL8UE9fCJiHpboHIcH8PrGMZixeS
 6ami+ruqV9gbIaFL+Ye7iagMUmLHcWiEquE6ZF3IUW/gaQvM4sK7mWt/wC9qNeiqog6a
 TZF8mOC4haZEzwQpQWYK5JoklG4B5n63XgYGCAFfwx4nDXB9OYkFiNmzaUboRQ8R8E2h
 Ssmqq51IOpQ6tAx9DixX7zdESUJsAnP7chVhLE2fzpoUtOng5cm9gYERUvpnWOq05cfq
 Fk1x7Bj8fsF7JqvfuGwguoErhkkTlaDAbrBRUcSPtB03KYLTrwugeT/7EglrMlSIoZ8O
 VyBg==
X-Gm-Message-State: AOAM532bGZjlPpn6htqwHt4qTenLKxTvlQ09kk0H6Eq0ztvy4BoSW5tE
 gn2rXVPEIDyGulcVww4jDixxqL7eHxcFDRs4id1HhA==
X-Google-Smtp-Source: ABdhPJyk+0pdGni0YhDJHRrFSzkV+84hkmtaaAKvqYezlshGZOUwoDR3b5BQB/gwJO2y45E+fpNGPMjUpRVSeso7ysM=
X-Received: by 2002:a25:be09:: with SMTP id h9mr42591798ybk.239.1619626595052; 
 Wed, 28 Apr 2021 09:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210428045533.564724-1-hsinyi@chromium.org>
In-Reply-To: <20210428045533.564724-1-hsinyi@chromium.org>
From: Sean Paul <sean@poorly.run>
Date: Wed, 28 Apr 2021 12:15:59 -0400
Message-ID: <CAMavQKKJp-d-ji6Ao8=1Mnx0pA0+YBregZ4aS0OS1sEqKCoE8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] gpu: drm: separate panel orientation property
 creating and value setting
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 12:55 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>


Thank you for revising the patchset, this looks much better to me!


/snip

>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 7631f76e7f34..cda83314d7ad 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c

/snip

> @@ -2173,8 +2173,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>   * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   *
> - * This function sets the connector's panel_orientation and attaches
> - * a "panel orientation" property to the connector.
> + * This function sets the connector's panel_orientation value. If the property
> + * doesn't exist, it will create one first.

I still don't think this function should overload initialization and
assignment. I'd prefer we just removed the creation from
set_panel_orientation entirely so this WARN can't be hit.


>   *
>   * Calling this function on a connector where the panel_orientation has
>   * already been set is a no-op (e.g. the orientation has been overridden with
> @@ -2206,18 +2206,16 @@ int drm_connector_set_panel_orientation(
>
>         prop = dev->mode_config.panel_orientation_property;
>         if (!prop) {
> -               prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> -                               "panel orientation",
> -                               drm_panel_orientation_enum_list,
> -                               ARRAY_SIZE(drm_panel_orientation_enum_list));
> -               if (!prop)
> -                       return -ENOMEM;
> +               int ret;
>
> -               dev->mode_config.panel_orientation_property = prop;
> +               ret = drm_connector_init_panel_orientation_property(connector);
> +               if (ret)
> +                       return ret;
> +               prop = dev->mode_config.panel_orientation_property;
>         }
>
> -       drm_object_attach_property(&connector->base, prop,
> -                                  info->panel_orientation);
> +       drm_object_property_set_value(&connector->base, prop,
> +                                     info->panel_orientation);
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation);
> @@ -2225,7 +2223,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>  /**
>   * drm_connector_set_panel_orientation_with_quirk -
>   *     set the connector's panel_orientation after checking for quirks
> - * @connector: connector for which to init the panel-orientation property.
> + * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   * @width: width in pixels of the panel, used for panel quirk detection
>   * @height: height in pixels of the panel, used for panel quirk detection
> @@ -2252,6 +2250,40 @@ int drm_connector_set_panel_orientation_with_quirk(
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
>
> +/**
> + * drm_connector_init_panel_orientation_property -
> + *     create the connector's panel orientation property
> + *
> + * This function attaches a "panel orientation" property to the connector
> + * and initializes its value to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
> + *
> + * The value of the property can be set by drm_connector_set_panel_orientation()
> + * or drm_connector_set_panel_orientation_with_quirk() later.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_init_panel_orientation_property(
> +       struct drm_connector *connector)
> +{
> +       struct drm_device *dev = connector->dev;
> +       struct drm_property *prop;
> +
> +       prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> +                       "panel orientation",
> +                       drm_panel_orientation_enum_list,
> +                       ARRAY_SIZE(drm_panel_orientation_enum_list));
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       dev->mode_config.panel_orientation_property = prop;
> +       drm_object_attach_property(&connector->base, prop,
> +                                  DRM_MODE_PANEL_ORIENTATION_UNKNOWN);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_init_panel_orientation_property);
> +
>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>                                     struct drm_property *property,
>                                     uint64_t value)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1922b278ffad..4396c1c4a5db 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1696,6 +1696,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>         struct drm_connector *connector,
>         enum drm_panel_orientation panel_orientation,
>         int width, int height);
> +int drm_connector_init_panel_orientation_property(
> +       struct drm_connector *connector);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>                                           int min, int max);
>
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

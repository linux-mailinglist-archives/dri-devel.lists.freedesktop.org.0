Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F0472392
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F8410E569;
	Mon, 13 Dec 2021 09:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA97F10E28D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:15:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z5so50476692edd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 01:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5NhzS4v8p0Aq48VMWQsxY/1QIuCZQIXugq+OL9/l7M0=;
 b=UiRNUMqPlcC0t3KXW9Ze0P5bOyO/aPLimGK7hiQPGMC1goMKh+zC/9Lu4C6bCGWf2h
 2b5Y4GtV/vP2XmM/EKqlUWFrCPu9L885Z7DUpWFRB7J0UsIQHv06Q5vXKy3iZYfP/zy3
 h8MWVhBiA9YKUO2QFVYR4USupnn5Hhn38ULWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5NhzS4v8p0Aq48VMWQsxY/1QIuCZQIXugq+OL9/l7M0=;
 b=ptszO2deTO4G8Roo9xYFKpNXvNH6iMpoa2lHtK9Nuv4S3vVME2rcFhTjMv+2kaR7Q4
 vzinjZ3Ca7SLbyh5Ddb8imgt6NDxw+etwbvODNtVAkZvw3drFnx7bRnso8Uim/gdNrPG
 TgC8BI7Qg3t68kAEvZhIbfdb8u5SGz/8sYJhz3KuqmCJdwpyQ8LAIQyIH3Kr+hhnE7u1
 RZutNERwFpRZQVWAHZx7qyN3lOtQwulcEFAGnuOr4r68lkseDgs/CQkIp54nC6ER05X9
 eikvnxA/IgcTTqY5rMv7XcW+eHXizvvuSrNUhKfowrl+wfaBLU78o37P8znvdKmtabUw
 mxAg==
X-Gm-Message-State: AOAM533WQuip8U+OmyISt9NB2YJn7elXO0Zfsw7N2Cn3esGZsvGCRgcZ
 Oc0P6ztDh3ls2eGDaAEYu/44XCVMQfLDxNBdVCnveA==
X-Google-Smtp-Source: ABdhPJyd6p84GySkokIMb+Kq3/cEEawGKiCMiaOxTiZOGrgJaiaEovCZEGuBzW2/1Y9qAiVw7tNRZ/dTZA0J2xZjY+s=
X-Received: by 2002:a17:906:52cf:: with SMTP id
 w15mr43202229ejn.122.1639386906318; 
 Mon, 13 Dec 2021 01:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20211212181416.3312656-1-jagan@amarulasolutions.com>
 <20211212181416.3312656-3-jagan@amarulasolutions.com>
 <0894ca20-71c8-0fbe-2ca4-70f42e5ed75d@intel.com>
In-Reply-To: <0894ca20-71c8-0fbe-2ca4-70f42e5ed75d@intel.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 13 Dec 2021 14:44:55 +0530
Message-ID: <CAMty3ZAjEkbEaDeg8KZv3RMdzaOjbF_YJeO6TRyOCR+yoFWUoA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm: exynos: dsi: Use drm panel_bridge API
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Mon, Dec 13, 2021 at 2:39 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
>
> On 12.12.2021 19:14, Jagan Teki wrote:
> > Replace the manual panel handling code by a drm panel_bridge via
> > devm_drm_of_get_bridge().
> >
> > Adding panel_bridge handling,
> >
> > - Drops drm_connector and related operations as drm_bridge_attach
> >    creates connector during attachment.
> >
> > - Drops panel pointer and iterate the bridge, so-that it can operate
> >    the normal bridge and panel_bridge in constitutive callbacks.
> >
> > This simplifies the driver and allows all components in the display
> > pipeline to be treated as bridges.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - fix port number
> > - add print for attached device
> > Changes for v2:
> > - new patch
> >
> >   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 165 ++++--------------------
> >   1 file changed, 26 insertions(+), 139 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index 0bb44e476633..d1039628b6f2 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -221,6 +221,11 @@ enum exynos_dsi_transfer_type {
> >       EXYNOS_DSI_RX,
> >   };
> >
> > +enum {
> > +     DSI_PORT_IN,
> > +     DSI_PORT_OUT
> > +};
> > +
> >   struct exynos_dsi_transfer {
> >       struct list_head list;
> >       struct completion completed;
> > @@ -254,8 +259,6 @@ struct exynos_dsi_driver_data {
> >   struct exynos_dsi {
> >       struct drm_encoder encoder;
> >       struct mipi_dsi_host dsi_host;
> > -     struct drm_connector connector;
> > -     struct drm_panel *panel;
> >       struct list_head bridge_chain;
> >       struct drm_bridge *out_bridge;
> >       struct device *dev;
> > @@ -285,7 +288,6 @@ struct exynos_dsi {
> >   };
> >
> >   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
> > -#define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
> >
> >   static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
> >   {
> > @@ -1391,42 +1393,21 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
> >
> >       dsi->state |= DSIM_STATE_ENABLED;
> >
> > -     if (dsi->panel) {
> > -             ret = drm_panel_prepare(dsi->panel);
> > -             if (ret < 0)
> > -                     goto err_put_sync;
> > -     } else {
> > -             list_for_each_entry_reverse(iter, &dsi->bridge_chain,
> > -                                         chain_node) {
> > -                     if (iter->funcs->pre_enable)
> > -                             iter->funcs->pre_enable(iter);
> > -             }
> > +     list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> > +             if (iter->funcs->pre_enable)
> > +                     iter->funcs->pre_enable(iter);
> >       }
> >
> >       exynos_dsi_set_display_mode(dsi);
> >       exynos_dsi_set_display_enable(dsi, true);
> >
> > -     if (dsi->panel) {
> > -             ret = drm_panel_enable(dsi->panel);
> > -             if (ret < 0)
> > -                     goto err_display_disable;
> > -     } else {
> > -             list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> > -                     if (iter->funcs->enable)
> > -                             iter->funcs->enable(iter);
> > -             }
> > +     list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> > +             if (iter->funcs->enable)
> > +                     iter->funcs->enable(iter);
> >       }
> >
> >       dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> >       return;
> > -
> > -err_display_disable:
> > -     exynos_dsi_set_display_enable(dsi, false);
> > -     drm_panel_unprepare(dsi->panel);
> > -
> > -err_put_sync:
> > -     dsi->state &= ~DSIM_STATE_ENABLED;
> > -     pm_runtime_put(dsi->dev);
> >   }
> >
> >   static void exynos_dsi_disable(struct drm_encoder *encoder)
> > @@ -1439,17 +1420,12 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
> >
> >       dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
> >
> > -     if (dsi->panel)
> > -             drm_panel_disable(dsi->panel);
> > -
> >       list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> >               if (iter->funcs->disable)
> >                       iter->funcs->disable(iter);
> >       }
> >
> >       exynos_dsi_set_display_enable(dsi, false);
> > -     if (dsi->panel)
> > -             drm_panel_unprepare(dsi->panel);
> >
> >       list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> >               if (iter->funcs->post_disable)
> > @@ -1460,70 +1436,6 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
> >       pm_runtime_put_sync(dsi->dev);
> >   }
> >
> > -static enum drm_connector_status
> > -exynos_dsi_detect(struct drm_connector *connector, bool force)
> > -{
> > -     return connector->status;
> > -}
> > -
> > -static void exynos_dsi_connector_destroy(struct drm_connector *connector)
> > -{
> > -     drm_connector_unregister(connector);
> > -     drm_connector_cleanup(connector);
> > -     connector->dev = NULL;
> > -}
> > -
> > -static const struct drm_connector_funcs exynos_dsi_connector_funcs = {
> > -     .detect = exynos_dsi_detect,
> > -     .fill_modes = drm_helper_probe_single_connector_modes,
> > -     .destroy = exynos_dsi_connector_destroy,
> > -     .reset = drm_atomic_helper_connector_reset,
> > -     .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > -     .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > -};
> > -
> > -static int exynos_dsi_get_modes(struct drm_connector *connector)
> > -{
> > -     struct exynos_dsi *dsi = connector_to_dsi(connector);
> > -
> > -     if (dsi->panel)
> > -             return drm_panel_get_modes(dsi->panel, connector);
> > -
> > -     return 0;
> > -}
> > -
> > -static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
> > -     .get_modes = exynos_dsi_get_modes,
> > -};
> > -
> > -static int exynos_dsi_create_connector(struct drm_encoder *encoder)
> > -{
> > -     struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> > -     struct drm_connector *connector = &dsi->connector;
> > -     struct drm_device *drm = encoder->dev;
> > -     int ret;
> > -
> > -     connector->polled = DRM_CONNECTOR_POLL_HPD;
> > -
> > -     ret = drm_connector_init(drm, connector, &exynos_dsi_connector_funcs,
> > -                              DRM_MODE_CONNECTOR_DSI);
> > -     if (ret) {
> > -             DRM_DEV_ERROR(dsi->dev,
> > -                           "Failed to initialize connector with drm\n");
> > -             return ret;
> > -     }
> > -
> > -     connector->status = connector_status_disconnected;
> > -     drm_connector_helper_add(connector, &exynos_dsi_connector_helper_funcs);
> > -     drm_connector_attach_encoder(connector, encoder);
> > -     if (!drm->registered)
> > -             return 0;
> > -
> > -     connector->funcs->reset(connector);
> > -     drm_connector_register(connector);
> > -     return 0;
> > -}
> > -
> >   static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
> >       .enable = exynos_dsi_enable,
> >       .disable = exynos_dsi_disable,
> > @@ -1537,31 +1449,20 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >       struct exynos_dsi *dsi = host_to_dsi(host);
> >       struct drm_encoder *encoder = &dsi->encoder;
> >       struct drm_device *drm = encoder->dev;
> > -     struct drm_bridge *out_bridge;
> > -
> > -     out_bridge  = of_drm_find_bridge(device->dev.of_node);
> > -     if (out_bridge) {
> > -             drm_bridge_attach(encoder, out_bridge, NULL, 0);
> > -             dsi->out_bridge = out_bridge;
> > -             list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> > -     } else {
> > -             int ret = exynos_dsi_create_connector(encoder);
> > -
> > -             if (ret) {
> > -                     DRM_DEV_ERROR(dsi->dev,
> > -                                   "failed to create connector ret = %d\n",
> > -                                   ret);
> > -                     drm_encoder_cleanup(encoder);
> > -                     return ret;
> > -             }
> > +     int ret;
> >
> > -             dsi->panel = of_drm_find_panel(device->dev.of_node);
> > -             if (IS_ERR(dsi->panel))
> > -                     dsi->panel = NULL;
> > -             else
> > -                     dsi->connector.status = connector_status_connected;
> > +     dsi->out_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, DSI_PORT_OUT, 0);
> > +     if (IS_ERR(dsi->out_bridge)) {
> > +             ret = PTR_ERR(dsi->out_bridge);
> > +             DRM_DEV_ERROR(dsi->dev, "failed to find the bridge: %d\n", ret);
> > +             return ret;
> >       }
> >
> > +     DRM_DEV_INFO(dsi->dev, "Attached %s device\n", device->name);
> > +
> > +     drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
> > +     list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> > +
> >       /*
> >        * This is a temporary solution and should be made by more generic way.
> >        *
> > @@ -1569,7 +1470,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >        * TE interrupt handler.
> >        */
> >       if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> > -             int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
> > +             ret = exynos_dsi_register_te_irq(dsi, &device->dev);
> >               if (ret)
> >                       return ret;
> >       }
> > @@ -1596,18 +1497,9 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
> >       struct exynos_dsi *dsi = host_to_dsi(host);
> >       struct drm_device *drm = dsi->encoder.dev;
> >
> > -     if (dsi->panel) {
> > -             mutex_lock(&drm->mode_config.mutex);
> > -             exynos_dsi_disable(&dsi->encoder);
> > -             dsi->panel = NULL;
> > -             dsi->connector.status = connector_status_disconnected;
> > -             mutex_unlock(&drm->mode_config.mutex);
> > -     } else {
> > -             if (dsi->out_bridge->funcs->detach)
> > -                     dsi->out_bridge->funcs->detach(dsi->out_bridge);
> > -             dsi->out_bridge = NULL;
> > -             INIT_LIST_HEAD(&dsi->bridge_chain);
> > -     }
> > +     if (dsi->out_bridge->funcs->detach)
> > +             dsi->out_bridge->funcs->detach(dsi->out_bridge);
> > +     INIT_LIST_HEAD(&dsi->bridge_chain);
>
>
> This is fishy. Currently the only bridge used with exynos_dsi (tc358764)
> on detach callback unregisters/puts the connector it has created.

I have a patch to drop the existing connector and add panel_bridge for
tc358764. I believe this solve the connector stuff.

>
> With this code panel_bridge on detach will call drm_connector_cleanup,
> which will WARN about unregistered connector - ie it assumes detach
> should be called at least AFTER unregistration of exynos_drm device (???).

Same will sort out if downstream bridge has panel_bridge conversation i think.

>
> Since panel/bridge unbind in general case is not handled properly maybe
> it is not an issue :)

i.e what I belive.

Jagan.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E563BEB4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7094510E264;
	Tue, 29 Nov 2022 11:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0797C10E264
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:15:58 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s206so14795271oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 03:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PDXPonnT0zeNWUqR818AQzT6+Peln13kiO+qN6JF9cA=;
 b=E3ezopdOKhQKFLS3lehcWyRCe+HPEUSLcCyCR81ge62lnW1XQ0igSa5Lqc+VnIAlPs
 DTcqQskHJTIhDNI164z9pEQR7OBlnYWzczziZUu2q3sEbPPSmQ+rqWYA/646KM2a2WXM
 onbUn/U+nNF8HDjB8UlIvsGrjSG21PeRbBr33aJlgCYrAcfzGX/Ct7cPhh+7yAgA/swg
 EnvKt0X8bP1sDJllws2rRlWzIIR//Sh4/8Oc0IScaT+PkBqbKq5CXkqCo6qOV1QjHd9l
 tmXEgUpYvzOZTiZUrMqNcmlWgHBobJ3CZvTbE1dit2pZ1C84vk/wCGVZlJ3AMQ765GLB
 FHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PDXPonnT0zeNWUqR818AQzT6+Peln13kiO+qN6JF9cA=;
 b=mbNrpDmwG2JqHJQHzl4vwqxJoTxD/SmTYQWWlE64aC6zW+6XssG8E/7Miz/YTa/+tr
 PEy857kZdC4RHdyuEyNtyNxWxegPnXLT6Nhu/X6KfspguciFY1zbqKjEUjlHqMhuyNwI
 8uentjJWi3jS+9DIX65+1kMty6wXbum5NPF74GPvbtcS14wYWlB3KZOH8waujeXGez9m
 xLrAqjlSK7mLblC6YR5g9zxUBYKypVdYpp7+z9IVYBOIiQuPtF318tadje7tPqu0QUrR
 WQHFa8aGuor1nLcDYEQ/2ZKXFYf/RSyRHnvqLf0kWUHA9XQlVMJJnAMU/cToqrMMX4NY
 kolg==
X-Gm-Message-State: ANoB5pmBAhs/Pkf1EMrsLAD+QD/LbwSSI8fDRNu3RytAMnW3ji+dS84E
 nVXk2y5J68I53j30UKOF1DpeLbm0LUsJyiG2DKOIuA==
X-Google-Smtp-Source: AA0mqf70TY6BZg6lhmChcsi/9xBVTiyv6MAEsViNzOhIb+BZ3ZBCmKOTlVSKyMF94GAllbTaMX6gw84HeiBz97aO1SI=
X-Received: by 2002:aca:2801:0:b0:35a:13f4:d875 with SMTP id
 1-20020aca2801000000b0035a13f4d875mr29605804oix.190.1669720557113; Tue, 29
 Nov 2022 03:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20221128112320.25708-1-francesco@dolcini.it>
In-Reply-To: <20221128112320.25708-1-francesco@dolcini.it>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 12:15:46 +0100
Message-ID: <CAG3jFysnd9S2b4WCmHqKzJPhO=3sOLWHEExrsGPBn-e_6F5p6g@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: lt8912b: Add hot plug detection
To: Francesco Dolcini <francesco@dolcini.it>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Nov 2022 at 12:23, Francesco Dolcini <francesco@dolcini.it> wrote:
>
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> Enable hot plug detection when it is available on the HDMI port.
> Without this connecting to a different monitor with incompatible timing
> before the 10 seconds poll period will lead to a broken display output.
>
> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> index a98efef0ba0e..5f0c9cd2a970 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -517,14 +517,27 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
>         return 0;
>  }
>
> +static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
> +{
> +       struct lt8912 *lt = data;
> +
> +       if (lt->bridge.dev)
> +               drm_helper_hpd_irq_event(lt->bridge.dev);
> +}
> +
>  static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
>  {
>         int ret;
>         struct lt8912 *lt = bridge_to_lt8912(bridge);
>         struct drm_connector *connector = &lt->connector;
>
> -       connector->polled = DRM_CONNECTOR_POLL_CONNECT |
> -                           DRM_CONNECTOR_POLL_DISCONNECT;
> +       if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD) {
> +               drm_bridge_hpd_enable(lt->hdmi_port, lt8912_bridge_hpd_cb, lt);
> +               connector->polled = DRM_CONNECTOR_POLL_HPD;
> +       } else {
> +               connector->polled = DRM_CONNECTOR_POLL_CONNECT |
> +                                   DRM_CONNECTOR_POLL_DISCONNECT;
> +       }
>
>         ret = drm_connector_init(bridge->dev, connector,
>                                  &lt8912_connector_funcs,
> @@ -578,6 +591,10 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
>
>         if (lt->is_attached) {
>                 lt8912_hard_power_off(lt);
> +
> +               if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
> +                       drm_bridge_hpd_disable(lt->hdmi_port);
> +
>                 drm_connector_unregister(&lt->connector);
>                 drm_connector_cleanup(&lt->connector);
>         }
> --
> 2.25.1
>


Reviewed-by: Robert Foss <robert.foss@linaro.org>

Snoozing this patch, will apply it in a few days if no issues are found.

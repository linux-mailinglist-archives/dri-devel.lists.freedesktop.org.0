Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C85662292
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8B510E39F;
	Mon,  9 Jan 2023 10:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000C10E39F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:10:13 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id a64so8050131vsc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BFmXd/4UPgu9PVqNm6AoWBgVTa6i3g45dnuCERHZ2NU=;
 b=WE0liED5Ie5eQRiaAGOQPuSdlhQLG5j7HuHrVbP1gPaqIdGF6HPe9F+Fl7aIFsgP1w
 +zX09nmDVwU4BStTcFX224IgsQsAyjzkXXkgrvHA8/C6yUrlmTre922pIfb0EU3E/KFH
 xDTSsgR8Tta0VXepTvmkaqjG0iwVjWnuTGlLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BFmXd/4UPgu9PVqNm6AoWBgVTa6i3g45dnuCERHZ2NU=;
 b=v9IEoOe2iMJIle6xEz27M3qZ4OklEQ5Dih6IycfNeTtcbR46h9e14tdAuQt2nucGFd
 PObOKi020aLpGr/2ccww9nSjda1csnm3WIHgCtDQ6P0QMiaFC3e1BQ43/AohtCDIKf6g
 +A2FoNT2LAgk/J6EnVGMkcXxpNYBi5vfrf90Jh8wiq7+O8q6H1jau9V7GGgNULjxbN7W
 lnTOuFcqSCfPgFsox0HTiYH7Ws4s4sBNEdk5jVncQcKiVEV6to16NszQNZ2OZrxYWNg1
 9gdu2JPm1pJuSVZqthHjPdMmk3vhEVQFhY0M+nNmhclg+BpXwfB3qzgR01wyqmhX5Ozv
 3CyA==
X-Gm-Message-State: AFqh2krzUuk8rWjtBfPsiP0U/Mh9X+YGeA1G+ZIQXK9JslzBszXIYI2F
 x9NztxSDP1mLIdBA5pm5x5at8cDT4bfiaADpUKsI9Q==
X-Google-Smtp-Source: AMrXdXswh5fHslW6qG2CKCrGJyPGVtfkg3sYDGWs2LeCd5aO4LLL2z1s6q88e5jJJhhVmRcH4ARrlwrJQirdLbbhANg=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr7195348vsv.9.1673259012171; Mon, 09 Jan
 2023 02:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-4-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-4-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 18:10:01 +0800
Message-ID: <CAGXv+5G2bUNrA5zfmzZeXJjOgvKc0tFq_qd3UR11qeyNb=xNHQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] drm/display: Add Type-C switch helpers
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 4:41 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Add helpers to register and unregister Type-C "switches" for bridges
> capable of switching their output between two downstream devices.
>
> The helper registers USB Type-C mode switches when the "mode-switch"
> and the "data-lanes" properties are available in Device Tree.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192 based Hayato (ASUS Chromebook Flip CM3200).

> ---
>
> (no changes since v8)
>
> Changes in v8:
> - Fixed the build issue when CONFIG_TYPEC=m
> - Fixed some style issues
>
> Changes in v7:
> - Extracted the common codes to a helper function
> - New in v7
>
>  drivers/gpu/drm/display/drm_dp_helper.c | 132 ++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  16 +++
>  2 files changed, 148 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 16565a0a5da6..fb9e23744c08 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -30,11 +30,13 @@
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
>  #include <linux/string_helpers.h>
> +#include <linux/usb/typec_mux.h>
>  #include <linux/dynamic_debug.h>
>
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_panel.h>
> @@ -3891,3 +3893,133 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
>  EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>
>  #endif
> +
> +#if IS_REACHABLE(CONFIG_TYPEC)
> +static int drm_dp_register_mode_switch(struct device *dev, struct device_node *node,
> +                                      struct drm_dp_typec_switch_desc *switch_desc,
> +                                      void *data, void *mux_set)
> +{
> +       struct drm_dp_typec_port_data *port_data;
> +       struct typec_mux_desc mux_desc = {};
> +       char name[32];
> +       u32 dp_lanes[2];
> +       int ret, num_lanes, port_num = -1;
> +
> +       num_lanes = drm_of_get_data_lanes_count(node, 0, 2);
> +       if (num_lanes <= 0) {
> +               dev_err(dev, "Error on getting data lanes count: %d\n",
> +                       num_lanes);

Also printing out the full node name (endpoint@N) would be more helpful.

> +               return num_lanes;
> +       }
> +
> +       ret = of_property_read_u32_array(node, "data-lanes", dp_lanes, num_lanes);
> +       if (ret) {
> +               dev_err(dev, "Failed to read the data-lanes variable: %d\n",
> +                       ret);

Same here.

> +               return ret;
> +       }
> +
> +       port_num = dp_lanes[0] / 2;
> +
> +       port_data = &switch_desc->typec_ports[port_num];
> +       port_data->data = data;
> +       mux_desc.fwnode = &node->fwnode;
> +       mux_desc.drvdata = port_data;
> +       snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
> +       mux_desc.name = name;
> +       mux_desc.set = mux_set;
> +
> +       port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> +       if (IS_ERR(port_data->typec_mux)) {
> +               ret = PTR_ERR(port_data->typec_mux);
> +               dev_err(dev, "Mode switch register for port %d failed: %d\n",
> +                       port_num, ret);
> +       }
> +
> +       return ret;
> +}
> +
> +/**
> + * drm_dp_register_typec_switches() - register Type-C switches
> + * @dev: Device that registers Type-C switches
> + * @port: Device node for the switch
> + * @switch_desc: A Type-C switch descriptor
> + * @data: Private data for the switches
> + * @mux_set: Callback function for typec_mux_set
> + *
> + * This function registers USB Type-C switches for DP bridges that can switch
> + * the output signal between their output pins.
> + *
> + * Currently only mode switches are implemented, and the function assumes the
> + * given @port device node has endpoints with "mode-switch" property.
> + * Register the endpoint as port 0 if the "data-lanes" property falls in 0/1,
> + * and register it as port 1 if "data-lanes" falls in 2/3.
> + */
> +int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
> +                                  struct drm_dp_typec_switch_desc *switch_desc,
> +                                  void *data, void *mux_set)
> +{
> +       struct device_node *sw;
> +       int ret;
> +
> +       for_each_child_of_node(port, sw) {
> +               if (of_property_read_bool(sw, "mode-switch"))
> +                       switch_desc->num_typec_switches++;
> +       }
> +
> +       if (!switch_desc->num_typec_switches) {
> +               dev_warn(dev, "No Type-C switches node found\n");

Maybe change this to dev_info or even dev_debug? A warning would be too
noisy if the bridge drivers are calling this helper unconditionally.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

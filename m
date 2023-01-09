Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CADFF66242C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFF210E3D8;
	Mon,  9 Jan 2023 11:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD5E10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:26:44 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id l3so651023vkk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 03:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bo9l2JVUA1McBtZKQkN0F54d6hhYCb2UnGDrUfplMvw=;
 b=Y/bFXrLP7WAMZou8niwk7rQsUkfbc3zSSZnzK+H1y9HIj2x6aPpkEkzo1pthHM8CRG
 86/iqchNl+vKpsCgsRSKwCB84c9t7dymtwzVd7kuEaXXLqiyu+fWxJpSbMQYxzHzQsNs
 T6Szigx/avepoCNwU5QIXcSKzGNj/yv6jNQ5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bo9l2JVUA1McBtZKQkN0F54d6hhYCb2UnGDrUfplMvw=;
 b=dclgXTOpKwf26CLttS/KssI9/kQ07NTToWHGz1IjreyQi0Uy0T3xsW+Nmc8AH8plfH
 3h0mrmWluOqrQIG2grC8DvzkDYUPxFgTRqI4BXmu1tH3q1/HSaY0RwUWnup5/vRilMYk
 RFioBD1O4xgoYFQoo5DFczR5aaM3KOk8dHHKWgwbZ9p4vZ9Xc+VusW/hi6lp3z188xOC
 sejo3um4wJpW6nDQLYlvPCMj2POvuGIirEBWgHyqjR+lu7hun5QfcFwfSDdbHcdd2NKA
 J3j4CN+l4Fq4TzQr4rXamgDtzKl4GhEAwSV5ZRg/Ks0UMpi8xd2sxwpbLoB7ZeygnWMP
 STZg==
X-Gm-Message-State: AFqh2kprTiDyQjT7cOclJ6bo3Yy24CMRZcq31wnmEqjbbAeVQ+S+xSaf
 yh9hab/0+AXUQMFMZDE5rrxM7vITdp/VPFChYx+RGg==
X-Google-Smtp-Source: AMrXdXtRqsnvaHVT65xQiCvm+AgHkuJFCN48Cuhs9Iwq7hEJZjw6WgLwkUsflSUoSemDXcCVgmmcJ2Y4qqOo4cGwVIE=
X-Received: by 2002:a1f:df84:0:b0:3d5:9e3a:538 with SMTP id
 w126-20020a1fdf84000000b003d59e3a0538mr4564465vkg.22.1673263603882; Mon, 09
 Jan 2023 03:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-7-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-7-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 19:26:32 +0800
Message-ID: <CAGXv+5E=-=cPGSi1eEDAkTm+RvuJNU4zeZOxunpR7r4+RgzNYA@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] drm/bridge: anx7625: Register Type C mode switches
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
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
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the crosspoint
           ^ ports

> switch based on the entered alternate mode for a specific Type-C
> connector.

You should also mention that the "one mode switch" scenario is not
covered in this implementation, due to lack of actual hardware.

> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> (no changes since v7)
>
> Changes in v7:
> - Fixed style issues in anx7625 driver
> - Removed DT property validation in anx7625 driver.
> - Extracted common codes to another commit.
>
> Changes in v6:
> - Squashed to a single patch
>
>  drivers/gpu/drm/bridge/analogix/Kconfig   |  1 +
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 88 +++++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h | 13 ++++
>  3 files changed, 102 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> index 173dada218ec..992b43ed1dd7 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -34,6 +34,7 @@ config DRM_ANALOGIX_ANX7625
>         tristate "Analogix Anx7625 MIPI to DP interface support"
>         depends on DRM
>         depends on OF
> +       depends on TYPEC || TYPEC=n
>         select DRM_DISPLAY_DP_HELPER
>         select DRM_DISPLAY_HDCP_HELPER
>         select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 1cf242130b91..2bb504a8d789 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -15,6 +15,8 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_mux.h>
>  #include <linux/workqueue.h>
>
>  #include <linux/of_gpio.h>
> @@ -2572,6 +2574,86 @@ static void anx7625_runtime_disable(void *data)
>         pm_runtime_disable(data);
>  }
>
> +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> +                                         enum typec_orientation orientation)
> +{
> +       if (orientation == TYPEC_ORIENTATION_NORMAL) {
> +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +                                 SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +                                 SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
> +       } else if (orientation == TYPEC_ORIENTATION_REVERSE) {
> +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +                                 SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> +               anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +                                 SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> +       }
> +}
> +
> +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> +{
> +       struct drm_dp_typec_switch_desc switch_desc = ctx->switch_desc;
> +       /* Check if both ports available and do nothing to retain the current one */
> +       if (switch_desc.typec_ports[0].dp_connected && switch_desc.typec_ports[1].dp_connected)
> +               return;
> +
> +       if (switch_desc.typec_ports[0].dp_connected)
> +               anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> +       else if (switch_desc.typec_ports[1].dp_connected)
> +               anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> +}
> +
> +static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> +                                struct typec_mux_state *state)
> +{
> +       struct drm_dp_typec_port_data *port_data = typec_mux_get_drvdata(mux);
> +       struct anx7625_data *ctx = (struct anx7625_data *) port_data->data;
> +       struct device *dev = &ctx->client->dev;
> +       struct drm_dp_typec_switch_desc switch_desc = ctx->switch_desc;
> +       bool new_dp_connected, old_dp_connected;
> +

And place a TODO note here.

Otherwise this looks OK.

Also,

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
on MT8192 based Hayato (ASUS Chromebook Flip CM3200).

And this also uncovered a deadlock in the unplug & disable path.
I'll send a fix for that later once I figure out all the details.

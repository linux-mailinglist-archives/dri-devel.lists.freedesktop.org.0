Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C432166F1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0D96E20F;
	Tue,  7 Jul 2020 07:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318156E20F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 07:01:37 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id q15so11210533vso.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 00:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qbsHVyeK2Vstzqb6QmhJv9+M3wOOHcWN7GhZMwhEauo=;
 b=EEyqfv3lnLwactKiE8HZ/CTLLA9oHPzdCHG+biD5AwMuhpZB+6M4SlswZoR/xFBP/T
 7BVPdd4f+5VxTBjYxixYeitZbYSKWgJJKhSWFL5MxXSr7PKGu3zp/5IMUVhFpv3V/Wdt
 CjZU+UXTjLwhhLIQOa+VmBjJNqT/DdPK3ndHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qbsHVyeK2Vstzqb6QmhJv9+M3wOOHcWN7GhZMwhEauo=;
 b=hKVHlfYlR6P7JczC4km3ChVaIHvVcTIfct5J2w0PSRaUT4K4UGX6JyonKWnF9ZfmUj
 NVYLy6iPfsxu1/zwVc4AVHZtTvyumITiKDfOJNH47GmR3Tl5Kq013udHe4jS1p5wBFkH
 Mm5xb+itwgX/IWOm7v+Ze+bXn8vVHUJt2jBS021rP4iDDY+W1eEPSjHumhyN8pWXA2eU
 KYen1HYXG/yAK5lpYvbusl0ZY+n+4lDQjUK8PTvpneoIC6X5K/pPYcpUl2LNqOnHWGxm
 4iAOfo9tafKovsghdtlDNvQQD33q7JmzBGJMQPREXDp5USfn7aNIFKL3GTJ8uvkGkNZ7
 pu5g==
X-Gm-Message-State: AOAM530Tq95SxMikzuw6z8IvH2YtEc6+/TJCiznG2rQemmw2zZElX0aB
 r2bB4Lx2ya/gbr8yV2eVvCvXH5agtYWmU0dxFsdl+w==
X-Google-Smtp-Source: ABdhPJwA2s7xYWSfCkrCts/eUUgdQUXG/H9gqkpnvbcbSGwQe1S7omc1CbDKZxVIZgleI9cmUmc7kJ36DVKAqlSmoE0=
X-Received: by 2002:a67:8e49:: with SMTP id q70mr3322116vsd.14.1594105296201; 
 Tue, 07 Jul 2020 00:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591345160.git.xji@analogixsemi.com>
 <a18316c118c7b8ac201911b0b96d41c84653a00f.1591345160.git.xji@analogixsemi.com>
In-Reply-To: <a18316c118c7b8ac201911b0b96d41c84653a00f.1591345160.git.xji@analogixsemi.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 7 Jul 2020 15:01:25 +0800
Message-ID: <CANMq1KDnoLSUxxYr82o=1eGBR7E3PxoYUr8h1sEVTyqYyHCC-Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP
To: Xin Ji <xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Pi-Hsun Shih <pihsun@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Shawn Ku <shawnku@google.com>, Jonas Karlman <jonas@kwiboo.se>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 9, 2020 at 3:20 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> for portable device. It converts MIPI DSI/DPI to DisplayPort 1.3 4K.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/Kconfig   |    9 +
>  drivers/gpu/drm/bridge/analogix/Makefile  |    1 +
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1999 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  397 ++++++
>  4 files changed, 2406 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
>  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
>
> [snip]
> +static int anx7625_parse_dt(struct device *dev,
> +                           struct anx7625_platform_data *pdata)
> +{
> +       struct device_node *np = dev->of_node;
> +       struct device_node *panel_node, *out_ep;
> +
> +       pdata->node.mipi_dsi_host_node = of_graph_get_remote_node(np, 0, 0);
> +       if (!pdata->node.mipi_dsi_host_node) {
> +               DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> +               return -EPROBE_DEFER;

This does not look correct. I don't think of_graph_get_remote_node
will ever return NULL if the device tree is configured properly, and
it's useless to retry later (EPROBE_DEFER). You should just fail (e.g.
return EINVAL).

> +       }
> +
> +       of_node_put(pdata->node.mipi_dsi_host_node);

You are using pdata->node.mipi_dsi_host_node in other places in the
code, so I don't think it's ok to call of_node_put?

> +       DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> +
> +       pdata->node.panel_node = of_graph_get_port_by_id(np, 1);
> +       if (!pdata->node.panel_node) {
> +               DRM_DEV_ERROR(dev, "fail to get panel node.\n");
> +               return -EPROBE_DEFER;

-EINVAL.

> +       }
> +
> +       of_node_put(pdata->node.panel_node);
> +       out_ep = of_get_child_by_name(pdata->node.panel_node,
> +                                     "endpoint");
> +       if (!out_ep) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "cannot get endpoint.\n");

DRM_DEV_ERROR seems more appropriate

> +               return -EPROBE_DEFER;

-EINVAL

> +       }
> +
> +       panel_node = of_graph_get_remote_port_parent(out_ep);
> +       of_node_put(out_ep);
> +       pdata->panel = of_drm_find_panel(panel_node);
> +       DRM_DEV_DEBUG_DRIVER(dev, "get panel node.\n");
> +
> +       of_node_put(panel_node);
> +       if (IS_ERR_OR_NULL(pdata->panel))
> +               return -EPROBE_DEFER;

of_drm_find_panel cannot return NULL, so, do this instead:

if (IS_ERR(pdata->panel))
   return PTR_ERR(pdata->panel);

(which actually _may_ return EPROBE_DEFER)

> +
> +       return 0;
> +}
> [snip]
> +static int anx7625_i2c_probe(struct i2c_client *client,
> +                            const struct i2c_device_id *id)
> +{
> +       struct anx7625_data *platform;
> +       struct anx7625_platform_data *pdata;
> +       int ret = 0;
> +       struct device *dev = &client->dev;
> +
> +       if (!i2c_check_functionality(client->adapter,
> +                                    I2C_FUNC_SMBUS_I2C_BLOCK)) {
> +               DRM_DEV_ERROR(dev, "anx7625's i2c bus doesn't support\n");
> +               return -ENODEV;
> +       }
> +
> +       platform = kzalloc(sizeof(*platform), GFP_KERNEL);
> +       if (!platform) {
> +               DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
> +               return -ENOMEM;
> +       }
> +
> +       pdata = &platform->pdata;
> +
> +       ret = anx7625_parse_dt(dev, pdata);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "fail to parse devicetree.\n");

Please do not print this error (or at least not if err == -EPROBE_DEFER).

> +               goto free_platform;
> +       }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

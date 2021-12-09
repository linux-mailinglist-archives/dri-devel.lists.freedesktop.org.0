Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7284146EE83
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9528B10E7DF;
	Thu,  9 Dec 2021 16:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AB810E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 07:05:01 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g14so15997818edb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 23:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVU5Loc6hksTp1952+Z9jZgUOebCMuiLV3i1M3R7u/E=;
 b=doCHp4Kq4AF0PDScixlzQBJCNH1ws9hIs0ub9VwDZ7mR1+4izBKgBN6KpNRnn4ze/w
 cn8RnXEueo697Yc6vv1gsXrMQ6UKLY+DG1D9BV3CtbF087/zxc6emw9SSMs1R2tYf7+1
 oVZoeQ7t7MUfIBddhgEer2OLv2//p/ANqVB08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVU5Loc6hksTp1952+Z9jZgUOebCMuiLV3i1M3R7u/E=;
 b=Ze6ls/Rd7sfIkRYW3vEv+plZz/i2o9fuJu/VGJcrlLf/r6MeK6wacbKpXGp03o9kdf
 z4tqq9NPjINDFWM7wJ1ZRsud6UXVmbXbEYpyQeWNHzMbu0Cr+Itty92Ogy1Feg0OieGR
 9rqfeGTEaFpPyciNHHszMnHg/SmLQU/hjydpUTjLqxwhPmyqxw/BhTb0UiEn7LjscHxi
 EPgXQzTgr5rVi35cLMLktki7gH/+xjNFKBNpfaPc4VOMndrzhguk7Vmk5r0shy3lQmw4
 4kLddhBI27RYPu6g9AVyZfiJpfYTuHsOsGTxJOdJhiThud3/3i40ugnRZlFIDNWsf4oa
 tjZA==
X-Gm-Message-State: AOAM532uvMjJ0fLEJfWMsNTOs9osEd6U0IVBK/16vy8PkyqsymGCVifo
 9oNeQRrgzLE5JgFfIwA6c3leYVbOUy1PshTl6EF1rw==
X-Google-Smtp-Source: ABdhPJwrjTA8RhjI1067mxUfhRrV0zOMawErdKNO7fuIBJSU8tX+H8HT66FUPa6ZclkaRuZTdTjz8FF3/mmGTR+dOw8=
X-Received: by 2002:a17:907:1c82:: with SMTP id
 nb2mr12787011ejc.218.1639033500339; 
 Wed, 08 Dec 2021 23:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
 <20211118091955.3009900-5-alexander.stein@ew.tq-group.com>
In-Reply-To: <20211118091955.3009900-5-alexander.stein@ew.tq-group.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 9 Dec 2021 12:34:49 +0530
Message-ID: <CAMty3ZCQ+JDvojX0QiLEJLSA=J+kzi9kY1QE+dzf35fgO3T4aQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: ti-sn65dsi83: Add vcc supply regulator
 support
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 2:50 PM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> VCC needs to be enabled before releasing the enable GPIO.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 065610edc37a..54d18e82ed74 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -33,6 +33,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -143,6 +144,7 @@ struct sn65dsi83 {
>         struct mipi_dsi_device          *dsi;
>         struct drm_bridge               *panel_bridge;
>         struct gpio_desc                *enable_gpio;
> +       struct regulator                *vcc;
>         int                             dsi_lanes;
>         bool                            lvds_dual_link;
>         bool                            lvds_dual_link_even_odd_swap;
> @@ -337,6 +339,12 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>         u16 val;
>         int ret;
>
> +       ret = regulator_enable(ctx->vcc);
> +       if (ret) {
> +               dev_err(ctx->dev, "Failed to enable vcc\n");
> +               return;
> +       }

Better check the vcc and enable it since it is an optional one.

Jagan.

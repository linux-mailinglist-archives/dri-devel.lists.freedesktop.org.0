Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842040BC98
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 02:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C20E6E870;
	Wed, 15 Sep 2021 00:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C506E870
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 00:27:15 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 c8-20020a9d6c88000000b00517cd06302dso1104196otr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 17:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=SN0wr5T1oWZLC7OMWguWNpqj/fohCLowDltatcxEkTU=;
 b=WU2MQDEx3s01BJ/oFkDjBDj3qHQaODxp2KcwWPiuvwombsGYhFWuve+QFXzcGFds/f
 sw73fsScUZMGy0tTG7dpICNgv4/4wW4doJif8CKWZmum/kUKqgD0tDIVtvKZcehHc0si
 +q5/fIPImhHMcjbsb20iwZQ0ADyrlbI+trFYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=SN0wr5T1oWZLC7OMWguWNpqj/fohCLowDltatcxEkTU=;
 b=4Qpmna/+bEzhX+aDITQnY+KFfRC2aSmi6bUP8+kdiQ/w3PEn6KI+YC0hE/pV04c//n
 AWAHtIsc5nL55pJv7cMiF/QZGIMdhgP95if8c+EZXgc+9W3qjvp8J9J7/tj8BmrOHaPh
 63GXyUTA5AhpOEed/BtG68l0y3+Zqw7vsWO7XcHMJYtM2UnUPxK0o/L5bSu+XVW43Xs4
 FzJLszcd8H/WLWwWeLeHaJpHFfRWuM7uzUgFPBBWopNCsuJnuClp/Jkb6bDuIa/YUttE
 swGfj8jovOCWYfTi2corYB906/rYzVxT4v3Gnx4bHNG7yzFXB7ZQz2z0VweONUhGzouo
 Tf0w==
X-Gm-Message-State: AOAM531BwI3awiukHePAj8BjeRZLqPapkEaM5Zn927vMdWGdxGMP40aa
 hrMxFi/roUt4p7sO9sEH21lnnZoha/7X2NtdEmxNSg==
X-Google-Smtp-Source: ABdhPJwtktFIoB9nUZS0Hg0Bb5h5EonNfMac+l6E13vcItJOtaUG+LTRZnmA0YaSfB86wdXxhSuslbX9Gr4eLmSQoVc=
X-Received: by 2002:a05:6830:1212:: with SMTP id
 r18mr16496618otp.159.1631665634859; 
 Tue, 14 Sep 2021 17:27:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Sep 2021 17:27:14 -0700
MIME-Version: 1.0
In-Reply-To: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 14 Sep 2021 17:27:14 -0700
Message-ID: <CAE-0n53izRN8trQ0b4mpO-W_A7sOXqSF=NNjtFsPcaCBGMpr4Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/bridge: parade-ps8640: Improve logging at
 probing
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Philip Chen (2021-09-14 16:28:43)
> Use dev_err_probe() to add logs for error cases at probing time.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>

Can you use a cover-letter for more than one patch series?

> (no changes since v1)
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 685e9c38b2db..e340af381e05 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -332,8 +332,10 @@ static int ps8640_probe(struct i2c_client *client)
>                 return -ENODEV;
>
>         ps_bridge->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> -       if (IS_ERR(ps_bridge->panel_bridge))
> -               return PTR_ERR(ps_bridge->panel_bridge);
> +       if (IS_ERR(ps_bridge->panel_bridge)) {
> +               return dev_err_probe(dev, PTR_ERR(ps_bridge->panel_bridge),
> +                                    "Error creating bridge device\n");

From what I can tell it never returns -EPROBE_DEFER? So this isn't
useful.

> +       }
>
>         ps_bridge->supplies[0].supply = "vdd33";
>         ps_bridge->supplies[1].supply = "vdd12";
> @@ -344,16 +346,20 @@ static int ps8640_probe(struct i2c_client *client)
>
>         ps_bridge->gpio_powerdown = devm_gpiod_get(&client->dev, "powerdown",
>                                                    GPIOD_OUT_HIGH);
> -       if (IS_ERR(ps_bridge->gpio_powerdown))
> -               return PTR_ERR(ps_bridge->gpio_powerdown);
> +       if (IS_ERR(ps_bridge->gpio_powerdown)) {
> +               return dev_err_probe(dev, PTR_ERR(ps_bridge->gpio_powerdown),
> +                                    "Error getting gpio_powerdown\n");

This looks ok, except we don't want braces on single statement ifs.

> +       }
>
>         /*
>          * Assert the reset to avoid the bridge being initialized prematurely
>          */
>         ps_bridge->gpio_reset = devm_gpiod_get(&client->dev, "reset",
>                                                GPIOD_OUT_HIGH);
> -       if (IS_ERR(ps_bridge->gpio_reset))
> -               return PTR_ERR(ps_bridge->gpio_reset);
> +       if (IS_ERR(ps_bridge->gpio_reset)) {
> +               return dev_err_probe(dev, PTR_ERR(ps_bridge->gpio_reset),
> +                                    "Error getting gpio_reset\n");

Same.

> +       }
>
>         ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
>         ps_bridge->bridge.of_node = dev->of_node;

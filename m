Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A0490BC2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F7010E681;
	Mon, 17 Jan 2022 15:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5354310E64F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:49:52 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b3so12580027plc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dx8fnWE+qOBeQr9kWBJW6eoNu5QGa/KK1NgfQeSied0=;
 b=NPslNjmG+eWwHB4BtfIVCYR/L1b7WXwleBapn1UxMXM+0hYxNssNCjNwMG12tN1QBb
 /fm7PzlXOTqJyEk4jK9gV8YzP07uhWLhxUMFCForGuawYMNXa0J3gHQ78yYFrGhZ1sft
 NqGqkP/wf9uFBs7xEzqT3h+6oDriJo6uMgwjyzvaNCLZpMh5Ul1WPa9MF6ZcikwmRmce
 oCHtO1dTHUt5sZ79e0jQK1l7W3fbxyuds66AvJdSDhJdDZoR9O4IHxIpZk7umIYBjGb7
 2tQT+NknALyO62g/bLLIWbwCTvlAK7QgsXsxP8QRR5uzZRhMVv2Vg1InCdTfrZwNwXDu
 +GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dx8fnWE+qOBeQr9kWBJW6eoNu5QGa/KK1NgfQeSied0=;
 b=o3ST0AbffB5OzAwm/Y9IxZrasnkF9UFSb+tDretS+Lq3Fyb4t37IDMZpIObU4QRPfe
 h8GFq+I0nZJvt9wNsBjtSwEOHCr5NmYRd1Ek6GsHGwVnHDLc7JlHMUHo+4sA/VlmNLGI
 snNCxQftKPbrF/hn+BvrD2zL6iviOLvSH99YKPYnxzm3rdxJKZfC/20jJe2sPfoNmqUM
 pCN8hBSfJjblzyJBC28gejAK9zVN1ENK/SK1wytPe1KTsF+yx7AYK8zvxRtH/remLXCr
 fsY2AN2CWaR0qMjKEUhXhNz/lUKTWT86n89NbJdAHvEJl4o3Z3VIfCxNQjyjyrXfu79B
 Mulw==
X-Gm-Message-State: AOAM5305eyFR3hPZPSHGnV0Mt739rGn5fwplrHeLY1H1Tk/Nimc1HSBy
 OKbblrx+LKECi466Nj5KETnjxHi1itbUcJoF/F2Iuw==
X-Google-Smtp-Source: ABdhPJx438y5P/pXbWn13UAH3bdxpvZwSPVeO84ILQCgrWjMtGNUu/plW6d6LoxJo/0nGn6EOb1T0M4Sha0cjXqw+VE=
X-Received: by 2002:a17:902:b189:b0:149:6c45:24c with SMTP id
 s9-20020a170902b18900b001496c45024cmr22987695plr.21.1642434591811; Mon, 17
 Jan 2022 07:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20220117154150.5145-1-lzmlzmhh@gmail.com>
In-Reply-To: <20220117154150.5145-1-lzmlzmhh@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 Jan 2022 16:49:40 +0100
Message-ID: <CAG3jFyuEpiSdzNQ9=U30Bvr4bC+diG3XJHX6Kz38Mw62a5YVGA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: Remove extra device acquisition method of
 i2c client in lt9611 driver
To: Zhiming Liu <lzmlzmhh@gmail.com>
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Zhiming,

On Mon, 17 Jan 2022 at 16:42, Zhiming Liu <lzmlzmhh@gmail.com> wrote:
>
> drm/bridge: Remove extra device acquisition method of i2c client in lt9611 driver.

The commit title is already in the email title, it doesn't need to be
sent twice, sorry if I was unclear about this.

>
> We have got the device of i2c client in probe function.So we should remove extra

This line is too long, and `checkpatch.pl --strict` complains about its length.

> device acquisition method of i2c client.
>
> Signed-off-by: Zhiming Liu <lzmlzmhh@gmail.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 4 ++--
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index dafb1b47c15f..feb128a4557d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1090,7 +1090,7 @@ static int lt9611_probe(struct i2c_client *client,
>         if (!lt9611)
>                 return -ENOMEM;
>
> -       lt9611->dev = &client->dev;
> +       lt9611->dev = dev;
>         lt9611->client = client;
>         lt9611->sleep = false;
>
> @@ -1100,7 +1100,7 @@ static int lt9611_probe(struct i2c_client *client,
>                 return PTR_ERR(lt9611->regmap);
>         }
>
> -       ret = lt9611_parse_dt(&client->dev, lt9611);
> +       ret = lt9611_parse_dt(dev, lt9611);
>         if (ret) {
>                 dev_err(dev, "failed to parse device tree\n");
>                 return ret;
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 33f9716da0ee..3d62e6bf6892 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -860,7 +860,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
>         if (!lt9611uxc)
>                 return -ENOMEM;
>
> -       lt9611uxc->dev = &client->dev;
> +       lt9611uxc->dev = dev;
>         lt9611uxc->client = client;
>         mutex_init(&lt9611uxc->ocm_lock);
>
> @@ -870,7 +870,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
>                 return PTR_ERR(lt9611uxc->regmap);
>         }
>
> -       ret = lt9611uxc_parse_dt(&client->dev, lt9611uxc);
> +       ret = lt9611uxc_parse_dt(dev, lt9611uxc);
>         if (ret) {
>                 dev_err(dev, "failed to parse device tree\n");
>                 return ret;
> --

I fixed the two remaining issues in your patch, but in the future I
would suggest running `checkpatch.pl --strict` on every patch before
emailing them out. It's very easy to miss something.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.

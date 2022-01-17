Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDC490B50
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473B810E2BD;
	Mon, 17 Jan 2022 15:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D2810E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:23:50 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id n8so8392755plc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VnjA2KHofUEKHkQNqNXo62wzKavO8JJRdKbV0UahKN4=;
 b=OE78WGgL1nowrWRV3NUTn32yF5ldeaiahSnJ5YblR9gfaPeDcPDNvdiP2XPFzLOzo5
 M5c+jvWqEK+OJ8ni0tweiYW+iuKT9iijVE5W3QtywcMa1tZrQREEqbkxDG6lce2EOXX+
 pkptFj1pMJ1kQlk5xe40o0At/1b0mDUTg57vczFNLO6k9Fw6nvagALJ0TCCCc+luHMxY
 444lbBpGdfmbGCIAYGGQMYxSR7+0YliaFZ2+f4w1LavyL3XPuyJPXw4xhM0egQvVflMl
 U7mDV7DMLUuOgc5DU2+Ty+TCqROQkGHcHYqB1PkJvS6giNlUjYUIOeht73sSB3lSns9h
 aj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VnjA2KHofUEKHkQNqNXo62wzKavO8JJRdKbV0UahKN4=;
 b=GOAhpeXBtTnJZX7qfp7GO1bwutIZ3qjRpB6r0GJZcHFl3i0HB1VPpHGJ5cHC4drjCh
 2BPytJHD+By+RqD9a/2ReCn6gTCXmAC8YlURRY/ucKW+Dnu1S26FWmTbVwD+74lGjC7U
 quWjAAp7jRtv0QpczMKeLKgsDBJAJ4d7dr85zHJfTqSHP8ovbE9a3KmEXOhEE2KhayHy
 +5soOcbRq+SdRjv3Je4LcZEtW7KwJaEeQwWwWtcX3t4UruLOpF3EDGGL9ANyT3vGrOLQ
 3PlaWQ6V3fFkcD/EM1A/MPMtZngmXk4HHspiD1K3cdSAJMgnp+tUWAbVTHYG9yMoCfEh
 g+ng==
X-Gm-Message-State: AOAM531k3iAURmDff8A4F3XD39XVAgG3s5z0suwIT3iitKS90cQQ2Osk
 cw3aIUdk3JAWm89oOVoKcD1ibv3fe3mKiBOVQpD9xxIVO+jqjbhz
X-Google-Smtp-Source: ABdhPJwyV1xILkVOjDtTwNStAJk4uTHz5Fm7df/Lvq9bkEM2w1UKdOaqrnXM1IFq3J2cy6VzPcXnBeodoC6Bk7Xa5+8=
X-Received: by 2002:a17:90b:4a92:: with SMTP id
 lp18mr7416140pjb.152.1642433030103; 
 Mon, 17 Jan 2022 07:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20220113125201.22544-1-lzmlzmhh@gmail.com>
In-Reply-To: <20220113125201.22544-1-lzmlzmhh@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 Jan 2022 16:23:39 +0100
Message-ID: <CAG3jFyuZK8BLLicm8BLCGgdZaZ4O6x1W0VY4mn4JvJLDGDxpgw@mail.gmail.com>
Subject: Re: [PATCH v2] Remove extra device acquisition method of i2c client
 in lt9611 driver
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

Again, I think the code is good, but let's fix some small stuff with
the patch submission and then I'll happily apply this.

On Thu, 13 Jan 2022 at 13:52, Zhiming Liu <lzmlzmhh@gmail.com> wrote:
>
> Signed-off-by: Zhiming Liu <lzmlzmhh@gmail.com>

The tags like Signed-off-by come after the body of the commit message.

>
> bridge : drm : Remove extra device acquisition method of i2c client in lt9611 driver.

This line has to come first, since it is the title of the commit message.

>
> We have get the device of i2c client in probe function.So we should
> remove extra device acquisition method of i2c client.

^^^ this is the body of the commit message.

Put the tags like Signed-off-by here.

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
> 2.25.1
>

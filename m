Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F30E525764
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 23:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C11A10E64A;
	Thu, 12 May 2022 21:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C30910E64A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 21:52:12 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id v59so12158974ybi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 14:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rN+CwqR+bH7StWcAdqh6rJz6EZ5daE9SrwU7kGYAAg=;
 b=uey7p3FPmlV8ybbB7CX62wvjMDfYMimWgr7YFNG/RN0kUBvJdIH6yAWPwDblMqcaom
 44H8zJ5WAZxERa36MnwbaP4ed62zhA5aDd1uF0Orwt5+v7Z3DDA0K3j3dbInN9yIu5Nj
 XFqhuzYE4eUestUpSIlEffLtN97Yg9+RT92Dgvn+eZtm0DwdQdYI48v7P2nSwQ3jgulR
 1+JcUs826xZLmLrM6z4OwDDLdy4td6XfnpsVUuH/oNkCS0QFnP5jekD/06uM5gGZNPEP
 VxsohkXFP5y3Dq7eSWVX5MsDKfnPxV5TyPhLA3N6lksUvuI0fTIGzmwFWa/N1XZxemvW
 9VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rN+CwqR+bH7StWcAdqh6rJz6EZ5daE9SrwU7kGYAAg=;
 b=oW5XzUfJljmV/axXb+HX4rlJdigmBKhyVM9bfy6oVZJ+ANDA5IzOKUGjRTY6Yi8sU0
 dUMGEFlQl6V46m8+707+MkiIZkis6OOceyDGpOgFk41uvTTPLcBKTfP2dzQtjXweiYeZ
 Hj7mFy4U1TM6Cq0/oefeJ3GLNh5xSPL8nsdVbIWgbbGbF7f6pDKrkiLektU8Agw7yoV1
 xMH2icOT87vpcTyqJ83Qqq671yHvGxTV61+B90gA+a8e/3oBQEJ1XGW1MSRKltKMffVB
 rPce6tc8sZu3CaeSONuNQ0j65Are0KVUzJTetSN2y7wRRkdhtAr+E82GC5MOE6Ui3vlY
 bWRg==
X-Gm-Message-State: AOAM533SNdU7yY8j8bbdV5r+FPybWLhCUoi3BFP2yST24GMndaks3rpl
 fqkbB/6bigTcBeX6XYPthcKzRrUR0OU9Rp/24g9eNw==
X-Google-Smtp-Source: ABdhPJzBciKJzRYibXRHHMHUQNthVJZ1oMHtE0x2iIbQxYaAk1bpoVS2cWCVmfOZEPSsSxUQs6HB561kBnOxHA40g/E=
X-Received: by 2002:a25:2905:0:b0:649:7a2b:ca72 with SMTP id
 p5-20020a252905000000b006497a2bca72mr1891393ybp.492.1652392331408; Thu, 12
 May 2022 14:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651835715.git.jo@jsfamily.in>
 <BY5PR02MB7009B91FB7306503B58C264BD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009B91FB7306503B58C264BD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 May 2022 23:51:59 +0200
Message-ID: <CACRpkdYhkP9RYj98Lu=zkt+6aefx172R=8JtvOFpvh2uJ4byKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: introduce ebbg,ft8719 panel
To: Joel Selvaraj <jo@jsfamily.in>
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
Cc: devicetree@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 6, 2022 at 2:18 PM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI video mode
> panel, which can be found on some Xiaomi Poco F1 phones. The panel's
> backlight is managed through QCOM WLED driver.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>

Cool!

> +#define dsi_generic_write_seq(dsi, seq...) do {                                \
> +               static const u8 d[] = { seq };                          \
> +               int ret;                                                \
> +               ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));    \
> +               if (ret < 0)                                            \
> +                       return ret;                                     \
> +       } while (0)
> +
> +#define dsi_dcs_write_seq(dsi, seq...) do {                            \
> +               static const u8 d[] = { seq };                          \
> +               int ret;                                                \
> +               ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)); \
> +               if (ret < 0)                                            \
> +                       return ret;                                     \
> +       } while (0)

First I don't see what the do {} while (0) buys you, just use
a basic block {}.

Second look at mipi_dbi_command() in include/drm/drm_mipi_dbi.h
this is very similar.

So this utility macro should be in a generic file such as
include/drm/drm_mipi_dsi.h. (Can be added in a separate
patch.)

Third I think you need only one macro (see below).

> +static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
> +{
> +       struct mipi_dsi_device *dsi = ctx->dsi;
> +       struct device *dev = &dsi->dev;
> +       int ret;
> +
> +       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +       dsi_dcs_write_seq(dsi, 0x00, 0x00);
> +       dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19, 0x01);

It's dubious that you always have dsi_dcs_write_seq()
followed by dsi_generic_write_seq().

That means mipi_dsi_generic_write() followed by
mipi_dsi_dcs_write_buffer(). But if you look at these
commands in drivers/gpu/drm/drm_mipi_dsi.c
you see that they do the same thing!

Doesn't it work to combine them into one call for each
pair?

> +       dsi_dcs_write_seq(dsi, 0x00, 0x80);
> +       dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19);

Lots of magic numbers. You don't have a datasheet do you?
So you could #define some of the magic?

> +       if (ctx->prepared)
> +               return 0;
(...)
> +       ctx->prepared = true;
> +       return 0;
(...)
> +       if (!ctx->prepared)
> +               return 0;
(...)
> +       ctx->prepared = false;
> +       return 0;

Drop this state variable it is a reimplementation of something
that the core will track for you.

The rest looks nice!

Yours,
Linus Walleij

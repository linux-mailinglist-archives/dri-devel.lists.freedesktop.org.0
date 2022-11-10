Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2D623DEB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D82110E68F;
	Thu, 10 Nov 2022 08:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FB610E68F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:50:40 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id f7so2025306edc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 00:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+/0zI2jI6FYsEnOqb22IvUzFOZdF0rtkWAEWPsANlNE=;
 b=RbiH0RwK0PSQtei4cjoWTFlrWi3WyDlTAl/SM43otykv3VeUYmJLKxqQSBDbg6EqRa
 hEFVUQehvwcHFhlmBsOI0PGFw28JPIZfFR66W8M4g1+ob8xi2dyTeOxwUiuaL8p42apu
 kcmNVoQIzRaShYt82Nc4ZNKaA0rRo1/N8Gx5oOHRU0dhGXLwv3qgundaHOuLfrl7PG1f
 u/QdcGj2dhiLP53j9euIAMgvbsBbvuq7jHh5+ssyeFiyur7ZbLDuzNrWRKU+6X6xRdNe
 F/1kjshAdLmxcJYqeg9j7fz8t+KtyRwrvM5tyDSIl+VYlevC84zxFAgbvihm64libFLc
 GHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+/0zI2jI6FYsEnOqb22IvUzFOZdF0rtkWAEWPsANlNE=;
 b=mS2AOg5qBybiQG+aRocVLSzI2HkEildbqz8WSEwpc9Sn/VAgZjrOMe0wTx9HzONreo
 iylnfjKNakhTC75Y6VOhFUeTs6t6Hy3+zz14viH616pyLe1xltPRWIk4P6YDdGkFs1wt
 7WpbjcshgWUUAVhb54HnCU9ZIVUxo6HOHJD2OZg3LSpVbM3WqxmdSNoIIFr5FWyRtjCI
 mIJPJ8LbYz5h9RQaROAkH9ry5OcPwXOxv8d6aF9UX0DbkZq9JPGa6Gub63uNchigjMq3
 Ms04Dgf3IwUossTw30ZvQnGFaPIVr9fsgtwbYRmIDwqwtConffOzcrV6Kk48h4IUmQgw
 Qpmg==
X-Gm-Message-State: ACrzQf3dvPpCJbFreZGiJYL8tY+VDjFTpQ84nHHn6lvt5sadvrsXc303
 sSNLcE0cG+mMH9afuQr+rgZMS1LIUJ6wwZN2ecLgJw==
X-Google-Smtp-Source: AMsMyM5EvvqS8SaVjeVz+ADM4dzJk//5A5i2I8oIYOAoumJBV2yvSDCTByjZRSlFG9pcCtT3nFyEpRrX58so41S/h0I=
X-Received: by 2002:a05:6402:659:b0:463:a83c:e0af with SMTP id
 u25-20020a056402065900b00463a83ce0afmr1824173edx.158.1668070238553; Thu, 10
 Nov 2022 00:50:38 -0800 (PST)
MIME-Version: 1.0
References: <20221028205009.15105-1-macroalpha82@gmail.com>
 <20221028205009.15105-4-macroalpha82@gmail.com>
In-Reply-To: <20221028205009.15105-4-macroalpha82@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Nov 2022 09:50:27 +0100
Message-ID: <CACRpkdZ5q8y2iH7ZhfLUGXyxuVePE6Lz-_=TKYTbAqxZZMQTAw@mail.gmail.com>
Subject: Re: [PATCH V4 3/3] drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

thanks for your patch!

On Fri, Oct 28, 2022 at 10:50 PM Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Support NewVision NV3051D panels as found on the Anbernic RG353P and
> RG353V. The underlying LCD part number for the RG353x devices is
> unknown, so the device name and a fallback for the driver IC is
> used instead.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

(...)
> +struct panel_nv3051d {
> +       struct device *dev;
> +       struct drm_panel panel;
> +       struct gpio_desc *reset_gpio;
> +       const struct nv3051d_panel_info *panel_info;
> +       struct regulator *vdd;
> +       bool prepared;

I think you want to get rid of prepared. The framework keeps track of state.

> +#define dsi_dcs_write_seq(dsi, cmd, seq...) do {                       \
> +               static const u8 b[] = { cmd, seq };                     \
> +               int ret;                                                \
> +               ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b)); \
> +               if (ret < 0)                                            \
> +                       return ret;                                     \
> +       } while (0)

This is a reimplementation of mipi_dsi_dcs_write_seq() so use that
instead. (Found in include/drm/drm_mipi_dsi.h)

> +       /*
> +        * Init sequence was supplied by device vendor with no
> +        * documentation.
> +        */

Grrrr but not your fault. What *can* work is to look in related
datasheets and infer some of the magic variables from there.
Anyways best effort is best effort and as long as it's working
that's OK.

An experiment you can do if you have time is to see if you can read out
MTP ID from the panel (3 bytes, check how other drivers do it)
and use that to figure out who manufactured the actual display
controller. It's a bit of sleuthing.

> +       ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(ctx->reset_gpio)) {
> +               dev_err(dev, "cannot get reset gpio\n");
> +               return PTR_ERR(ctx->reset_gpio);
> +       }

I usually get it with GPIOD_OUT_HIGH so that reset i asserted at probe().

You do have active low flagged in your DTS do you not?

Yours,
Linus Walleij

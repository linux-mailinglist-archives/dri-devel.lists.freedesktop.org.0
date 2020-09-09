Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F4262E40
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 13:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FC96EE66;
	Wed,  9 Sep 2020 11:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4C66EE66
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 11:58:01 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b19so3106850lji.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 04:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=veMOlwm85HGnlMSTVN952J/Jqjc/7rvdCvDfPKEre0c=;
 b=Lq0jJ4whRo5WT/1EwrgGOl0XtPUPtvtGXLC81q5hE5FLoHPxnCgByqRckcoRWhj69y
 8POlYqx76p1PczfUYqXfb+R7q5w0oL+bb5PyhrPpsQU6UKMKeUmSKkDaAL+s7kMke30d
 YiGusFifL3kjDo2Y3BUUdRoscclcabbbQiDZACAMH/75Q1mpxTyMd9tTtFm3ATcURbyg
 04CbyAHdOELljt3QOr0smY9DXjCBobqHTrbDupSNhYUX41fkK4Xwy4UFEbq3Cdo/dBpR
 ZqwdOCqg5JfSW9dyYIRNMjwnVLuw8KhzqqZqiD74IP0vOQ4EN43WzK6XOkONzPBpOh5Y
 r9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=veMOlwm85HGnlMSTVN952J/Jqjc/7rvdCvDfPKEre0c=;
 b=aVH38dZ253yDPoQbTej/4RseLUs3i7ycZQBmw0LYq2OdmKhcOXGiQF45lIS9dOUTc5
 ijVJfrdFyEStYnQ7HRXpJGU8HaTKZbALJpfMQlN6yGHCGsH76zsQxCURubeI41/Qdw5a
 lbWPUOuCY0Ai5IO1oHhqWoFsWiV/26LLif+iN/S7h1kNoW9KAwnFpG3oCAYMGBZg29la
 h/tTwgHLzxK7Th9ORACKq27etwGSCLbTsMbZY0k9bH6X/tvTU73X5IQD9gaSb8Frb0wf
 bh4lzMsepcwuvdQ9isOEMZnaycws79bsFdDZThmzWNoUCSL9a6QUA1vMxTmz+1GEuKIg
 IWJQ==
X-Gm-Message-State: AOAM530Hm/Ab6kEXPxiwrHO0SjZWwgKlrByK8QWQcGu9uiHfZGdMCaDl
 jpZmg4e1xq/TBoNlkHuPa9wleC/R8Cq0AjsI2E4z0A==
X-Google-Smtp-Source: ABdhPJwCf3FmxgZrTisFeaRuj2pxBcn3CZA8Jzyk/0TkRmXwR5H+xd9VJWHscFXDHtkwCveC2Trx20irnwH9IVujNcM=
X-Received: by 2002:a2e:a177:: with SMTP id u23mr1687459ljl.104.1599652679725; 
 Wed, 09 Sep 2020 04:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200822163250.63664-1-paul@crapouillou.net>
 <20200822163250.63664-4-paul@crapouillou.net>
In-Reply-To: <20200822163250.63664-4-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Sep 2020 13:57:48 +0200
Message-ID: <CACRpkdaN7S9PoYd2d-hxUNq9NXA52P0TugwRzyFuCTCc6Onp=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm: Add SPI DBI host driver
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, od@zcrc.me,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

I looked a bit at this patch

On Sat, Aug 22, 2020 at 6:33 PM Paul Cercueil <paul@crapouillou.net> wrote:

> +config DRM_MIPI_DBI_SPI
> +       tristate "SPI host support for MIPI DBI"
> +       depends on DRM && OF && SPI

I think you want to depend on SPI_HOST actually.

> +       struct gpio_desc *dc;

This dc is very much undocumented, so I can only guess what
it is for, please add some kerneldoc explaining what it is.
I suppose it is in the DBI spec but I don't have it.

> +       gpiod_set_value_cansleep(dbi->dc, 0);

Since it is optional I usually prefer to do it like this:

if (dbi->dc)
   gpiod_set_value_cansleep(dbi->dc, 0);

> +  gpiod_set_value_cansleep(dbi->dc, 1);

Since you drive this low when you assert it and
high when you de-assert it, inverse this and mark the
GPIO line as GPIO_ACTIVE_LOW in the device tree
instead.

> +       dbi->dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> +       if (IS_ERR(dbi->dc)) {
> +               dev_err(dev, "Failed to get gpio 'dc'\n");
> +               return PTR_ERR(dbi->dc);
> +       }

Currently you are requesting the line asserted according to the
above logic. Is that what you want?

If you change the DT to GPIO_ACTIVE_LOW then this seems
correct.

But I am overall a bit curious about this "dc" thing. What is it
really? It seems suspiciously similar to a SPI chip select,
and then that is something that should be handled by the
SPI core and set as cs-gpios in the device tree instead.
It is certainly used exactly like a chip select as far as I can
tell.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

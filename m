Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0DA3A3724
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 00:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A3C6EE06;
	Thu, 10 Jun 2021 22:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC176EE06
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 22:30:54 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id k11so27451851qkk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LdEi1vgw3pZQgSczpHslc2dctfep1K4UsCmZ+W2MEZs=;
 b=JeMZSYnYZ+lmhPbuueZMggwh/2ShgSXvu1DlmoPCta2AnyNysmktw6sSp+KPvEXwwX
 KaIqls//oIfDu5hqoBUscaKlZ0vub6/PrAdIE0h0gknixaGOqL7D2cJhN3JjaXkaFWDd
 z+Ew36JG8IjQrWHwZHjrE1XzsFe1mBSwv2ISY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LdEi1vgw3pZQgSczpHslc2dctfep1K4UsCmZ+W2MEZs=;
 b=iifVX62M/8kvif/T4O2wjypKLqerRywq2V98nSqqDwcjZuzMprlwN9s0dTCJujh5ul
 kUoi/7AQ/prAOcHCe0Se1LABa7gDkKAVhjOv7iRB7ZL4uxxEwZEYjn5ZvZ3MnEFkKNvE
 1v86BxihxilsWToc9r7v1jnogMRp5DDZafYmsUijLhdzYIQbYZ5OxFoA88PrL0DOp5pX
 q01whGOcUjw2UrmafJRbnEyYATlruhQTIIr1yN/xxKuBNWXxNU6srFfoaC1EGM1eE/uN
 q3GBoBVMYEYxuc1B3iODdfcgOyXCfQ3jTatOf2Ieb1vIbtywUqFb6l4ALJiWKJXn3uNR
 4dOw==
X-Gm-Message-State: AOAM530iXySOHTvvQnpC1q/FqbQTQrgEtVXQiov9y7G3H7ER/S0C/VoW
 7bfolgRtyrNDRe77u44jUhez3UL3BZZ8QA==
X-Google-Smtp-Source: ABdhPJyv+nhO9SDLdc0lCkqXzqond2uiWTKULzTOs5/nolexwTxObzXQ5Omz9iMvA5/wftnJOOryOw==
X-Received: by 2002:a37:8386:: with SMTP id f128mr933792qkd.444.1623364252966; 
 Thu, 10 Jun 2021 15:30:52 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id o66sm3243584qkd.60.2021.06.10.15.30.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 15:30:51 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id i4so1571901ybe.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:30:51 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr1362324ybp.476.1623364251089; 
 Thu, 10 Jun 2021 15:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210610220527.366432-1-linus.walleij@linaro.org>
In-Reply-To: <20210610220527.366432-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Jun 2021 15:30:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVCNZTPmvLPx7uvU8r8uuHai2Mxpxt0-Jv-ryD=grAMw@mail.gmail.com>
Message-ID: <CAD=FV=XVCNZTPmvLPx7uvU8r8uuHai2Mxpxt0-Jv-ryD=grAMw@mail.gmail.com>
Subject: Re: [PATCH v5] drm/panel: db7430: Add driver for Samsung DB7430
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 10, 2021 at 3:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panel driver for the Samsung LMS397KF04 480x800 DPI RGB panel.
> + * According to the data sheet the display controller is called DB7430.
> + * Found in the Samsung Galaxy Beam GT-I8350 mobile phone.
> + * Linus Walleij <linus.walleij@linaro.org>
> + */
> +#include <drm/drm_modes.h>
> +#include <drm/drm_mipi_dbi.h>

nit that "mipi" sorts before "modes"


> +static int db7430_power_on(struct db7430 *db)
> +{
> +       struct mipi_dbi *dbi = &db->dbi;
> +       int ret;
> +
> +       /* Power up */
> +       ret = regulator_bulk_enable(ARRAY_SIZE(db->regulators),
> +                                   db->regulators);
> +       if (ret) {
> +               dev_err(db->dev, "failed to enable regulators: %d\n", ret);
> +               return ret;
> +       }
> +       msleep(50);
> +
> +       /* Assert reset >=1 ms */
> +       gpiod_set_value_cansleep(db->reset, 1);
> +       usleep_range(1000, 5000);
> +       /* De-assert reset */
> +       gpiod_set_value_cansleep(db->reset, 0);
> +       /* Wait >= 10 ms */
> +       msleep(10);
> +       dev_dbg(db->dev, "de-asserted RESET\n");
> +
> +       /*
> +        * This is set to 0x0a (RGB/BGR order + horizontal flip) in order
> +        * to make the display behave normally. If this is not set the displays
> +        * normal output behaviour is horizontally flipped and BGR ordered. Do
> +        * it twice because the first message doesn't always "take".
> +        */
> +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);

I would still prefer it if there was some type of error checking since
SPI commands can fail and could potentially fail silently. What about
at least this (untested):

#define db7430_dbi_cmd(_db, _cmd, _seq...) \
  do {
    int _ret = mipi_dbi_command(_db->dbi, _cmd, _seq);
    if (_ret)
      dev_warn(_db->dev, "DBI cmd %d failed (%d)\n", _cmd, _ret);
  } while (0)

Then at least you know _something_ will show up in the logs if there's
a transfer failure instead of silence?

If you truly don't want the error checking then I guess I won't
insist, but it feels like the kind of thing that will bite someone
eventually... In any case, I'm happy to add this now (especially since
the DBI stuff is Acked now).

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I presume that you'd commit it to drm-misc yourself?

-Doug

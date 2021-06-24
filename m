Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7EC3B329E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046EC6EC24;
	Thu, 24 Jun 2021 15:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5173C6EC24
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 15:32:17 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j4so10966938lfc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=04JLKQO/fFyUkOGcPqBL7gujdp8kkZAbX0MtPTll5vk=;
 b=JArqNkSlZaSXwPoifYE4gZ1v0dG7zlhwLa8GNdYgG+9JRwcLa1pU5tNBwDuwJmzQWt
 D9u5zRUOEIPiVOX640qgnHBqK+HGjwyX44j3FIceBSs4RuYZ+JIwjdhlyxBfTbqFXjmX
 mGDOmzAQUXO8Q4IPRfejKbSV4RYj3lZkLY9nxn9BdwYwAC5Y4A/XPZGL/Gt4vaOBsBtq
 EBQbsz76PUgzhqjQ2VcfwHHjcaS4nv3kN8OQDUcdbVW4ItIjpAuqkLuDOgu4IRp7R9wY
 dP63H3Y4ug8hi+z/mP0t/OzKfXenKK0Kqx00dJkzTgY7KylvnMTKTUh00JQOV6KzRyz+
 TFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=04JLKQO/fFyUkOGcPqBL7gujdp8kkZAbX0MtPTll5vk=;
 b=kvcH3j92uKiHDyUbRQ/bFaJlxobRbDDfzE6/HN3ek9IiHNftfGYdlagxbaZi50XBJO
 BlhnboNi+DM9Q6RjcKZx9vFJW/Y42UWdoWE1HR/L52bUx+okTmK27XQ4aPUwk+2TRQ3O
 VtI5cqRKlWm1ShnU9EXGYYZSG6c7yzE7cfN8dw23qfmqWWXAsLQvKpcbPR8u/44hWKcd
 dHA3p2FnqdDTQnDg42WLgIuAwvcZf4stoKVu3Veg1JVYlTjif6X++1SyKtjeiOGzIxzJ
 O9PETo6wkQ6dUkoGEpfWanrZ3wnUb4pEuBIq38ltq6Koo4eJFs99J2XUAUdlX508Qufq
 QltQ==
X-Gm-Message-State: AOAM533Pa2AIsOgvZ005j5V8Ko2n9+N5FbQXgaPMbmxBCNNoEljLQyF0
 wztZ8qjyhb/DPfrn0FMHO1IQrDU55MQOCMXrDD0OTA==
X-Google-Smtp-Source: ABdhPJxs7rnOO/BgTWo9qd7jVgTTntGtpEBOuLOjuElmlZzwGEGI4e1z1SM7AgDZqF2e7uG2v5GyqhsTn1JVO9E0HUg=
X-Received: by 2002:a19:6e44:: with SMTP id q4mr4362200lfk.586.1624548735768; 
 Thu, 24 Jun 2021 08:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210502014146.85642-1-caleb@connolly.tech>
 <20210502014146.85642-3-caleb@connolly.tech>
In-Reply-To: <20210502014146.85642-3-caleb@connolly.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Jun 2021 17:32:04 +0200
Message-ID: <CACRpkdb8tduLtQAmQWT3L3cwi470kuvhHKnzNs4VqGOCbWAxbA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm: panel: sofef00: remove reset GPIO handling
To: Caleb Connolly <caleb@connolly.tech>
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
Cc: David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 " <~postmarketos/upstreaming@lists.sr.ht>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 2, 2021 at 3:43 AM Caleb Connolly <caleb@connolly.tech> wrote:

> Resetting the panel on fajita causes it to never come back, we aren't
> quite sure why this is so for now lets remove reset handling as it is
> effectively broken. It is also not needed on enchilada.

Where are the device trees for these platforms?

Are there schematics so we/someone with access to the schematics
can figure it out?

It's not something trivial like forgotten to put GPIO_ACTIVE_LOW
on the gpio phandle?

> -static void sofef00_panel_reset(struct sofef00_panel *ctx)
> -{
> -       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> -       usleep_range(5000, 6000);
> -       gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -       usleep_range(2000, 3000);
> -       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> -       usleep_range(12000, 13000);
> -}

This code looks a bit weird to begin with, I don't see the point
with the first setting the gpiod low, either it was low already or
high already neither matters, driving it asserted will assert it
either way.

No big deal though.

> -       ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

As Bjorn says: just use *_optional and comment the line out in the
device tree if there is a problem.

Yours,
Linus Walleij

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE11CF456
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 14:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D8F6E0DE;
	Tue, 12 May 2020 12:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB03F6E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 12:28:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h26so10396412lfg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ci9MuSNpgNkICVw/NtiMvuvEvN60deLYNaqZ7/dVyys=;
 b=fSnUIdKavHP0yBG0luv9jQGqxwhngzmZBdsyY6LVXVPr3K8/ULmToG+A5ni5w2SWwA
 AFP9qQQ7alGnTRkI0nZQAfagGJ54zHMv6MZcAnY//ILHl6LwRCm/sx0Fogibzb9hXIId
 D1qSxnpSZTlI75ojfik+fif5BDf0v1y7XQTSffzyO6oulsDkHiwakKce14jRJzZS/ClD
 cLuKIM2EN21uNPvtsk337DK+thEWDMzIoC9tagFNxBtkLhfZy2BOx8Qv8eXTuf91jiUt
 JipY/au8ZMmpsC2sRCQuUid34LxXCcnRqinSbxwtSBQB9Q8b8apUyGAyfVgSY9aYh93F
 F+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ci9MuSNpgNkICVw/NtiMvuvEvN60deLYNaqZ7/dVyys=;
 b=VDwrfQOWdzEUr90TpMepXBRAb7eiHWimWM76twpB73BiiSOV9TIjRQTieIJ/l3Gwts
 6njjLc5bxm9Er+/bzzyNzepGnV+BoMFOJeFDUZpoCEtfLkU5qaWNhqCcaDgpeEW01PsZ
 AjNiA9wPNG2I51HB4DfRAWc9H9IjsKUOZ604KGhlV8lWUPIOFOUOMxZqMZJhg7GcOi4J
 wkeu2Y1NFk6NIQw+Ed17UvmrA2IPEe36LOuobBxQSDjKe9O6IJjQHws1QTjf6Z2exwPu
 90tFaIsIkHu8Q3qtX5ByOR4lrDH2QzOMFRo5rDcSPWHsCm6Eli4/PyGe8jU+P1AL6A/8
 YzLw==
X-Gm-Message-State: AOAM533qg3lY80w9ncsNBShiX8hTeeFw2D7eNfpW/CWNq70LBnYvbo5v
 im1zJJyc8UPcTxV3NbbnObOOM0IszsN7JtJq28bPRw==
X-Google-Smtp-Source: ABdhPJyjUo62CQFHTMX+lQZOoVcS0GX/votkBwNQiN68NXhVyDaGDhxULLZNoY+A2+hq214L/cetCwyqHglHNLzAXt0=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr14363688lfi.21.1589286516127; 
 Tue, 12 May 2020 05:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200507143354.v5.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
In-Reply-To: <20200507143354.v5.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 May 2020 14:28:25 +0200
Message-ID: <CACRpkdYedMY1Byrg4uyw-DkjLX0NVh5uFngUT+1F2tdfNMx29A@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 7, 2020 at 11:35 PM Douglas Anderson <dianders@chromium.org> wrote:

> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM
>
> Let's expose these pins as GPIOs.  A few notes:
> - Access to ti-sn65dsi86 is via i2c so we set "can_sleep".
> - These pins can't be configured for IRQ.
> - There are no programmable pulls or other fancy features.
> - Keeping the bridge chip powered might be expensive.  The driver is
>   setup such that if all used GPIOs are only inputs we'll power the
>   bridge chip on just long enough to read the GPIO and then power it
>   off again.  Setting a GPIO as output will keep the bridge powered.
> - If someone releases a GPIO we'll implicitly switch it to an input so
>   we no longer need to keep the bridge powered for it.
>
> Because of all of the above limitations we just need to implement a
> bare-bones GPIO driver.  The device tree bindings already account for
> this device being a GPIO controller so we only need the driver changes
> for it.
>
> NOTE: Despite the fact that these pins are nominally muxable I don't
> believe it makes sense to expose them through the pinctrl interface as
> well as the GPIO interface.  The special functions are things that the
> bridge chip driver itself would care about and it can just configure
> the pins as needed.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Looks good mostly!

> +       pdata->gchip.label = dev_name(pdata->dev);
> +       pdata->gchip.parent = pdata->dev;
> +       pdata->gchip.owner = THIS_MODULE;
> +       pdata->gchip.of_xlate = tn_sn_bridge_of_xlate;
> +       pdata->gchip.of_gpio_n_cells = 2;
> +       pdata->gchip.free = ti_sn_bridge_gpio_free;
> +       pdata->gchip.get_direction = ti_sn_bridge_gpio_get_direction;
> +       pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
> +       pdata->gchip.direction_output = ti_sn_bridge_gpio_direction_output;
> +       pdata->gchip.get = ti_sn_bridge_gpio_get;
> +       pdata->gchip.set = ti_sn_bridge_gpio_set;
> +       pdata->gchip.can_sleep = true;
> +       pdata->gchip.names = ti_sn_bridge_gpio_names;
> +       pdata->gchip.ngpio = SN_NUM_GPIOS;

Please add:
pdata->gchip.base = -1;

So it is clear that you use dynamically assigned GPIO numbers,
with that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

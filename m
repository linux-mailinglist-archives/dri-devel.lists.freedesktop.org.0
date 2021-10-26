Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D816543BB0A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75FE6E863;
	Tue, 26 Oct 2021 19:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF8A6E863
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:36:25 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id n63so147916oif.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 12:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/L9zxAjJJySGUMIg0XED9nw/dqrOKwLK8zXSIkYpfT0=;
 b=jzMLcW5uA2WnsQKrrF5mFUfrtYgp6gV61oiLCj1oIaEQWo5Z3oL7OXyru1NPaPDc1x
 H1p75JvahzCvKeYA3Fi0Hx9Pp+UYo02xLDL5vHVzSHyOYpgej5eNcdE8gnEvbPjYfEo3
 4ULX53Wk7w8A/k9E2u/PC5eBFNJjtgJlRs+R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/L9zxAjJJySGUMIg0XED9nw/dqrOKwLK8zXSIkYpfT0=;
 b=rf26rf8+ZpgGL11iE6XnI6Rq+o1flcpq4Yqg5u844Qu0LCRrK2b3m88hSIOffceZ3m
 0edkbLYa3ZOBZgX6RKG7W7IppXzRc3mOgjmevxT0gAC9g8Lj6Y81H+7BhQ/XgMfZgEjc
 rZ+NC34dVD3tv7RALnGUYsoWdEcT6me7Ms1FKMLVq7EflHdnKKjsAqTcRKehl2QyaDma
 C8TNv8RLv+WkIVsBs1wXdyqNWIIIt9fOYNaG/ZqZjHHIjORp33th1rtVSjlN0GSeUqrJ
 urELbha7qUff7qQP7Ig9POgZUocosj2niudXkqKBPR1w0/Q+un1fYUaq2ac+GD2ujZfM
 Oy0g==
X-Gm-Message-State: AOAM5334F4rXVvI2mcG/EsMo3FGtYjxw70bKdAPWacIV270+NNAO4Hy5
 FR4aD+jkljzj7B9F+enslSSahukVCzaWu2JSi1JuKA==
X-Google-Smtp-Source: ABdhPJyi8T0lV7Ybo4JQXXI6MrAlS2+rpxwjPPjxwdN3D/0+4+YM1H1L1xzczkm5DKsF7JHdhMZQxOyHCMEWvLDZ6nM=
X-Received: by 2002:a05:6808:1d9:: with SMTP id
 x25mr567814oic.64.1635276984552; 
 Tue, 26 Oct 2021 12:36:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Oct 2021 12:36:24 -0700
MIME-Version: 1.0
In-Reply-To: <20211026121058.v3.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
References: <20211026121058.v3.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 26 Oct 2021 12:36:24 -0700
Message-ID: <CAE-0n50C82He9KCyXRTQGwQxqS6CWhm3w6Vv-5ayKYEfZyt-jg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
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

Quoting Philip Chen (2021-10-26 12:11:09)
> Fit ps8640 driver into runtime power management framework:
>
> First, break _poweron() to 3 parts: (1) turn on power and wait for
> ps8640's internal MCU to finish init (2) check panel HPD (which is
> proxied by GPIO9) (3) the other configs. As runtime_resume() can be
> called before panel is powered, we only add (1) to _resume() and leave
> (2)(3) to _pre_enable(). We also add (2) to _aux_transfer() as we want
> to ensure panel HPD is asserted before we start AUX CH transactions.
>
> Second, the original driver has a mysterious delay of 50 ms between (2)
> and (3). Since Parade's support can't explain what the delay is for,
> and we don't see removing the delay break any boards at hand, remove
> the delay to fit into this driver change.
>
> In addition, rename "powered" to "pre_enabled" and don't check for it
> in the pm_runtime calls. The pm_runtime calls are already refcounted
> so there's no reason to check there. The other user of "powered",
> _get_edid(), only cares if pre_enable() has already been called.
>
> Lastly, change some existing DRM_...() logging to dev_...() along the
> way, since DRM_...() seem to be deprecated in [1].
>
> [1] https://patchwork.freedesktop.org/patch/454760/
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Fix typo/wording in the commit message.
> - Add ps8640_aux_transfer_msg() for AUX operation. In
>   ps8640_aux_transfer(), wrap around ps8640_aux_transfer_msg()
>   with PM operations and HPD check.
> - Document why autosuspend_delay is set to 500ms.
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 186 +++++++++++++++----------
>  1 file changed, 115 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 3aaa90913bf8..ac42a3473770 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -9,6 +9,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>
> @@ -100,7 +101,7 @@ struct ps8640 {
>         struct regulator_bulk_data supplies[2];
>         struct gpio_desc *gpio_reset;
>         struct gpio_desc *gpio_powerdown;
> -       bool powered;
> +       bool pre_enabled;
>  };
>
>  static const struct regmap_config ps8640_regmap_config[] = {
> @@ -148,8 +149,29 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
>         return container_of(aux, struct ps8640, aux);
>  }
>
> -static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> -                                  struct drm_dp_aux_msg *msg)
> +static void ps8640_ensure_hpd(struct ps8640 *ps_bridge)

static int ps8640_ensure_hpd?

> +{
> +       struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> +       struct device *dev = &ps_bridge->page[PAGE2_TOP_CNTL]->dev;
> +       int status;
> +       int ret;
> +
> +       /*
> +        * Apparently something about the firmware in the chip signals that
> +        * HPD goes high by reporting GPIO9 as high (even though HPD isn't
> +        * actually connected to GPIO9).
> +        */
> +       ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> +                               status & PS_GPIO9, 20 * 1000, 200 * 1000);
> +
> +       if (ret < 0)
> +               dev_warn(dev, "HPD didn't go high: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
> +                                      struct drm_dp_aux_msg *msg)
>  {
>         struct ps8640 *ps_bridge = aux_to_ps8640(aux);
>         struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

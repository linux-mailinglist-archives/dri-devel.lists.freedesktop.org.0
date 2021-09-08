Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CA404103
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 00:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172746E321;
	Wed,  8 Sep 2021 22:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D976E321
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 22:27:17 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id n27so25698oij.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 15:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fN9T/lWgQuO5TWu+ahwvrRqBE8y7qWBx0EbQNso4oIc=;
 b=ck9dyRSbeFo05NGhtEK+sic0Ej4Ty12UgOGV3HcYa1xOsT6RxbUAsPZzuf5kWJhIHw
 MC6Ci8IopT3fNqH2CdSWx1ljZ9HCBpnW2BpfDJvtKTFQZsrxSNIO/n9ylzAcFQqQbkgA
 8qRUBZnqhGZK5J+rLhCXoyg16Bghczb/dCaSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fN9T/lWgQuO5TWu+ahwvrRqBE8y7qWBx0EbQNso4oIc=;
 b=XUmObIDt70EfzAXzWNbvF2WulH7jSZ0Ubq+xETHCZzVLNt9KpFbR6rlYJ4ihmQwJiv
 is9gqipovx0/GzxqszURGGvX2f5AcI/p1T8wJUOoAEM1fS3DxaunHJDvRRD48xlQhcxn
 Vr/zqGEGiBlrGWaQFvh0QPDbtekqfzhqaSicIM4KtxaJbQ/Y6sSlVieIhszkPOCmnTOj
 aJMvoeg+NhTva5rqdTk/H2TH7g1NW1DL3I+Y7iN+KRJfe6hyO0kAbF/FYst/GtEeq0/u
 YebJFtmeoO1RpBc6qKxqIv6l/IHk5K5IvOc94mZpT0CctI5e5USo5s5hgv/t4saQohgF
 sRXw==
X-Gm-Message-State: AOAM532bcJQbU3rCjpxbmXJzNQ465RaxajvNdF5luw0LJB6wTdatm+Wl
 52FtuAom16inRt+J38xLEf5agABlUyoCNaIcGGTykaJJGGo=
X-Google-Smtp-Source: ABdhPJyDtZuOeYv5iIyL9JyrwTSgG1sYOWHK4gjJqusSz2chhuch7KYv/BVnalj1tsy1dSeOV+JkvW6Dd81UQnBgXos=
X-Received: by 2002:aca:2310:: with SMTP id e16mr284271oie.64.1631140026865;
 Wed, 08 Sep 2021 15:27:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Sep 2021 22:27:06 +0000
MIME-Version: 1.0
In-Reply-To: <20210908111500.2.Iac57921273b27d7f7d65e12ff7be169657f4c1eb@changeid>
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <20210908111500.2.Iac57921273b27d7f7d65e12ff7be169657f4c1eb@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 8 Sep 2021 22:27:06 +0000
Message-ID: <CAE-0n50mp5F79iJ+zVrbt4ZP7V+UUOcVQe9H3TwEcFFyZWMoNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: parade-ps8640: Add support for AUX channel
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

Quoting Philip Chen (2021-09-08 11:18:06)
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index a16725dbf912..3f0241a60357 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -93,6 +115,102 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
>         return container_of(e, struct ps8640, bridge);
>  }
>
> +static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
> +{
> +       return container_of(aux, struct ps8640, aux);
> +}
> +
> +static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> +                                  struct drm_dp_aux_msg *msg)
> +{
> +       struct ps8640 *ps_bridge = aux_to_ps8640(aux);
> +       struct i2c_client *client = ps_bridge->page[PAGE0_DP_CNTL];
> +       struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
> +       unsigned int len = msg->size;
> +       unsigned int data;
> +       int ret;
> +       u8 request = msg->request &
> +                    ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
> +       u8 *buf = msg->buffer;
> +       bool is_native_aux = false;
> +
> +       if (len > DP_AUX_MAX_PAYLOAD_BYTES)
> +               return -EINVAL;
> +
> +       pm_runtime_get_sync(&client->dev);

Is this driver using runtime PM? Probably can't add this until it is
actually runtime PM enabled.

> +
> +       switch (request) {
> +       case DP_AUX_NATIVE_WRITE:
> +       case DP_AUX_NATIVE_READ:
> +               is_native_aux = true;
> +       case DP_AUX_I2C_WRITE:
> +       case DP_AUX_I2C_READ:
> +               regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               goto exit;
> +       }
> +
> +       /* Assume it's good */
> +       msg->reply = 0;
> +
> +       data = ((request << 4) & AUX_CMD_MASK) |
> +              ((msg->address >> 16) & AUX_ADDR_19_16_MASK);
> +       regmap_write(map, PAGE0_AUX_ADDR_23_16, data);
> +       data = (msg->address >> 8) & 0xff;
> +       regmap_write(map, PAGE0_AUX_ADDR_15_8, data);
> +       data = msg->address & 0xff;
> +       regmap_write(map, PAGE0_AUX_ADDR_7_0, msg->address & 0xff);

Can we pack this into a three byte buffer and write it in one
regmap_bulk_write()? That would be nice because it looks like the
addresses are all next to each other in the i2c address space.

> +
> +       data = (len - 1) & AUX_LENGTH_MASK;
> +       regmap_write(map, PAGE0_AUX_LENGTH, data);
> +
> +       if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE) {
> +               ret = regmap_noinc_write(map, PAGE0_AUX_WDATA, buf, len);
> +               if (ret < 0) {
> +                       DRM_ERROR("failed to write PAGE0_AUX_WDATA");

Needs a newline.

> +                       goto exit;
> +               }
> +       }
> +
> +       regmap_write(map, PAGE0_AUX_CTRL, AUX_START);
> +
> +       regmap_read(map, PAGE0_AUX_STATUS, &data);
> +       switch (data & AUX_STATUS_MASK) {
> +       case AUX_STATUS_DEFER:
> +               if (is_native_aux)
> +                       msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
> +               else
> +                       msg->reply |= DP_AUX_I2C_REPLY_DEFER;
> +               goto exit;
> +       case AUX_STATUS_NACK:
> +               if (is_native_aux)
> +                       msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
> +               else
> +                       msg->reply |= DP_AUX_I2C_REPLY_NACK;
> +               goto exit;
> +       case AUX_STATUS_TIMEOUT:
> +               ret = -ETIMEDOUT;
> +               goto exit;
> +       }
> +
> +       if (request == DP_AUX_NATIVE_READ || request == DP_AUX_I2C_READ) {
> +               ret = regmap_noinc_read(map, PAGE0_AUX_RDATA, buf, len);
> +               if (ret < 0)
> +                       DRM_ERROR("failed to read PAGE0_AUX_RDATA");

Needs a newline.

> +       }
> +
> +exit:
> +       pm_runtime_mark_last_busy(&client->dev);
> +       pm_runtime_put_autosuspend(&client->dev);
> +
> +       if (ret)
> +               return ret;
> +
> +       return len;
> +}
> +
>  static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
>                                      const enum ps8640_vdo_control ctrl)
>  {

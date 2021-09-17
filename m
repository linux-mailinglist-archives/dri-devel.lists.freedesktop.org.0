Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9541018E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 00:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8FA6EE95;
	Fri, 17 Sep 2021 22:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00536EE95
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 22:57:55 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id 72so10597273qkk.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6lgeJKVJKOQIrK6odrN/+DZV6dI8ar1fofmxpO3UA78=;
 b=DihsbX2XtnfrQLOZyL4/NeHYIqPkN2TCy2rTyP9wVg3CYZVLa7yy7Ye8YUHNBqZU5j
 xNjHkCEdlBmETAoegMN0Retc4wVQ37qT+uCKGucMx9kTiF8uE9gdfqf3PK/MhaL9pT6U
 BBorpBnAqR9HbUud/HkmFyof6ToSeLkXWQGvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6lgeJKVJKOQIrK6odrN/+DZV6dI8ar1fofmxpO3UA78=;
 b=hjRt5ajuPUbUdvIf2fVcswsn08aVX+ajeugkh7lHZGbTWVihnqJMFY62yc0NZpxDYa
 yiwk9pF511FiyD10hEIlXHet4vpaf3QlixPf77+ofupDOs3Mjw3k9ChkdEl+cUXRYeqx
 uZvQXEDGKrdPYcXekHFw883xqbUC/fl3C/LF7f79dG11OkXY72dpkvSXfmAzCrj/fqE6
 FqhrBnkFUOZtmBYqv6fRHmwu66iEgMgfmoZuym2nsb4rYUbvoSCZEw92wlzo/Ts64VS4
 m16WpWgDbqgtvgqbxYi5hhGVtugWHxoZhO2LGGWwzpYkpTWQjqy5b6U+4V5t1xvhAQFQ
 N1fw==
X-Gm-Message-State: AOAM530eB1JFAKFsSLmS5+uQlEnvuu9gsaQpQlmdbikk2bjoFCS+uVZj
 dQEHxz+98sYOfOm1ANOAagR0vuTNVbzzdhxuuqJdFg==
X-Google-Smtp-Source: ABdhPJw5ixX+FkUa7atKX1/av/rRVka/vB0o3VHFe5IPbVMHYP1waN7Y697iM4OulOopYq1HQrTmiNRKRBZqkEqImO4=
X-Received: by 2002:a25:478b:: with SMTP id
 u133mr15893807yba.532.1631919474520; 
 Fri, 17 Sep 2021 15:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.3.Ibf9b125434e3806b35f9079f6d8125578d76f138@changeid>
 <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
In-Reply-To: <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Fri, 17 Sep 2021 15:57:43 -0700
Message-ID: <CA+cxXhmhH76RkPwJvBzj=VQL468WmUjrL9W6tntaj+WLYobWUw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi

On Tue, Sep 14, 2021 at 5:57 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-09-14 16:28:45)
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index 8d3e7a147170..dc349d729f5a 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -117,6 +144,129 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> [...]
> > +       case DP_AUX_I2C_WRITE:
> > +       case DP_AUX_I2C_READ:
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
> > +       if (ret) {
> > +               dev_err(dev, "failed to write PAGE0_AUXCH_CFG3: %d\n", ret);
>
> Can we use DRM_DEV_ERROR()?
Sure. Done in v4.
PTAL.
>
> > +               return ret;
> > +       }
> > +
> > +       /* Assume it's good */
> > +       msg->reply = 0;
> > +
> > +       addr_len[0] = msg->address & 0xff;
> > +       addr_len[1] = (msg->address >> 8) & 0xff;
> > +       addr_len[2] = ((msg->request << 4) & SWAUX_CMD_MASK) |
> > +               ((msg->address >> 16) & SWAUX_ADDR_19_16_MASK);
>
> It really feels like this out to be possible with some sort of
> cpu_to_le32() API. We're shoving msg->address into 3 bytes and then
> adding in the request and some length. So we could do something like:
>
>         u32 addr_len;
>
>         addr_len = FIELD_PREP(SWAUX_ADDR_MASK, msg->address);
>         addr_len |= FIELD_PREP(SWAUX_CMD_MASK, msg->request);
>         if (len)
>                 addr_len |= FIELD_PREP(LEN_MASK, len - 1);
>         else
>                 addr_len |= FIELD_PREP(LEN_MASK, SWAUX_NO_PAYLOAD );
>
>         cpu_to_le32s(&addr_len);
>
>         regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, &addr_len, sizeof(addr_len));
>
> > +       addr_len[3] = (len == 0) ? SWAUX_NO_PAYLOAD :
> > +                       ((len - 1) & SWAUX_LENGTH_MASK);
> > +
> > +       regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
> > +                         ARRAY_SIZE(addr_len));
> > +
> > +       if (len && (request == DP_AUX_NATIVE_WRITE ||
> > +                   request == DP_AUX_I2C_WRITE)) {
> > +               /* Write to the internal FIFO buffer */
> > +               for (i = 0; i < len; i++) {
> > +                       ret = regmap_write(map, PAGE0_SWAUX_WDATA, buf[i]);
> > +                       if (ret) {
> > +                               dev_err(dev, "failed to write WDATA: %d\n",
>
> DRM_DEV_ERROR?
Sure. Done in v4.
PTAL.
>
> > +                                       ret);
> > +                               return ret;
> > +                       }
> > +               }
> > +       }
> > +
> > +       regmap_write(map, PAGE0_SWAUX_CTRL, SWAUX_SEND);
> > +
> > +       /* Zero delay loop because i2c transactions are slow already */
> > +       regmap_read_poll_timeout(map, PAGE0_SWAUX_CTRL, data,
> > +                                !(data & SWAUX_SEND), 0, 50 * 1000);
> > +
> > +       regmap_read(map, PAGE0_SWAUX_STATUS, &data);
> > +       if (ret) {
> > +               dev_err(dev, "failed to read PAGE0_SWAUX_STATUS: %d\n", ret);
>
> DRM_DEV_ERROR?
Sure. Done in v4.
PTAL.
>
> > +               return ret;
> > +       }
> > +
> > +       switch (data & SWAUX_STATUS_MASK) {
> > +       /* Ignore the DEFER cases as they are already handled in hardware */
> > +       case SWAUX_STATUS_NACK:
> > +       case SWAUX_STATUS_I2C_NACK:
> > +               /*
> > +                * The programming guide is not clear about whether a I2C NACK
> > +                * would trigger SWAUX_STATUS_NACK or SWAUX_STATUS_I2C_NACK. So
> > +                * we handle both cases together.
> > +                */
> > +               if (is_native_aux)
> > +                       msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
> > +               else
> > +                       msg->reply |= DP_AUX_I2C_REPLY_NACK;
> > +
> > +               len = data & SWAUX_M_MASK;
> > +               return len;
>
> Why no 'return data & SWAUX_M_MASK;' and skip the assignment?
>
> > +       case SWAUX_STATUS_ACKM:
>
> Move this up and add fallthrough?
>
> > +               len = data & SWAUX_M_MASK;
> > +               return len;
> > +       case SWAUX_STATUS_INVALID:
> > +               return -EOPNOTSUPP;
> > +       case SWAUX_STATUS_TIMEOUT:
> > +               return -ETIMEDOUT;
> > +       }
> > +
> > +       if (len && (request == DP_AUX_NATIVE_READ ||
> > +                   request == DP_AUX_I2C_READ)) {
> > +               /* Read from the internal FIFO buffer */
> > +               for (i = 0; i < len; i++) {
> > +                       ret = regmap_read(map, PAGE0_SWAUX_RDATA, &data);
> > +                       buf[i] = data;
>
> Can drop a line
Sure. Done in v4.
PTAL.
>
>                 ret = regmap_read(map, PAGE0_SWAUX_RDATA, buf + i);
>
> > +                       if (ret) {
> > +                               dev_err(dev, "failed to read RDATA: %d\n",
> > +                                       ret);
> > +                               return ret;
> > +                       }
> > +               }
> > +       }
> > +
> > +       return len;
> > +}

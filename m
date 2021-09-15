Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D340CEC2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 23:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141D6EA67;
	Wed, 15 Sep 2021 21:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C486E6EA67
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 21:27:54 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id c19so3735891qte.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xdzl68kgUwZsmDH1EOQb6npCsfHZBZag3uzeD/gnyF0=;
 b=dXtqHIzgU5z0jfyNbPBAdO6dyOruzGJqO7SF8KPSfg+bsVT/RjMQd049CA7t89Gysc
 +WgEUpfDGwtgJloX3zzSa1FOvOYu3f8dw7VO6TL5Anyu6ciPSOIYFD2yXSUlolcsRzlv
 8srN5A8mW91oOQksU6orqNMRDt9SAmZSbXIsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xdzl68kgUwZsmDH1EOQb6npCsfHZBZag3uzeD/gnyF0=;
 b=Pem0PHk6pZjNuMn7f7lbDNAb66Z4KeE22ewTkzvJdI3sq9XNki9xU7DIso8FPwPGMo
 GkPrQwGgSKhDVph3RqkGk1UbcDKlJYnwaPz7YeQIMqj9Pe6OMMH9q2ZoKQxct5iFriXQ
 f0s+EgRNnGAUOTnHfBiThV7E7X22IyqRMG4h25IBfpHxJYUAPW43pj05P5XlUxelL6xT
 bBBpqsO+lBnPgczxPDLVZGbP2fFvfy/Vm/pq7Zthq7pIVUO1KmGtjPqNtP1J8QIN2rNv
 dvTT81sAOitwC/osmhsmrRJ1JXvt4bAicADGN8p0yk4ESJRbME02YTX4i5oDvbrAaget
 Wlew==
X-Gm-Message-State: AOAM533qf1xRD/FdhBZeTMr0d+7WT+8x0m9q68b/hDB15o4WVzozth39
 NQELwr2UZkIr3nD4tR5IUKM+/ie9wjWYNg==
X-Google-Smtp-Source: ABdhPJy6hNITW/TvkgrxB1zpGpluVkj2Zhi5z4JzC1aUvNZCBxeiKm3Ll0cLlE29wEOWX3FED6SuIw==
X-Received: by 2002:ac8:5247:: with SMTP id y7mr1953050qtn.289.1631741273381; 
 Wed, 15 Sep 2021 14:27:53 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id h70sm949518qke.54.2021.09.15.14.27.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 14:27:53 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id s16so8792052ybe.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:27:52 -0700 (PDT)
X-Received: by 2002:a25:bb93:: with SMTP id y19mr2716698ybg.266.1631741272077; 
 Wed, 15 Sep 2021 14:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.3.Ibf9b125434e3806b35f9079f6d8125578d76f138@changeid>
 <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
In-Reply-To: <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Sep 2021 14:27:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtC3AQr44idgzVe9RCjb9i=+ekJ_wKKnKMcHRSQX7dfQ@mail.gmail.com>
Message-ID: <CAD=FV=WtC3AQr44idgzVe9RCjb9i=+ekJ_wKKnKMcHRSQX7dfQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>,
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

Hi,

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

I've never gotten clear guidance here. For instance, in some other
review I suggested using the DRM wrapper and got told "no" [1]. ;-)
The driver landed without the DRM_ERROR versions. I don't really care
lots so it's fine with me to use use DRM_DEV_ERROR, I just wish I
understood the rules...

[1] https://lore.kernel.org/all/49db7ef3-fa53-a274-7c69-c2d840b13058@denx.de/


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

You're arguing that your version of the code is more efficient? Easier
to understand? Something else? To me, Philip's initial version is
crystal clear and easy to map to the bridge datasheet but I need to
think more to confirm that your version is right. Thinking is hard and
I like to avoid it when possible.

In any case, it's definitely bikeshedding and I'll yield if everyone
likes the other version better. ;-)


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

Actually, I think it's the "return" that's a bug, isn't it? If we're
doing a "read" and we're returning a positive number of bytes then we
need to actually _read_ them. Reading happens below, doesn't it?


-Doug

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF6405CE0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 20:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8A36E8FB;
	Thu,  9 Sep 2021 18:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C346E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 18:29:31 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id y13so5757290ybi.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfi0O5z3YUYhbW7zXo4IckbIgfrbajr/CKgbbY2Zyf4=;
 b=gj+1nfSfrs6Zv+O6sehty2rxFgfE2r+s0x7zwUZC+u+U0mXZzRWJkh+cB+Q5xjmkiO
 3SRnImL9HDvlYj8Jfbm+DsrHk0TmO52i7ycoJnOA09deIWUfaE0JT1VtIggHWYd2/gFT
 W6xXUfTP0KotOdpRwzeW++EQyn67B0RUZ+RsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfi0O5z3YUYhbW7zXo4IckbIgfrbajr/CKgbbY2Zyf4=;
 b=Q6xaVbuTTwtzUWEc6ZU+JEiN1bd6M2g7nqpJcxxUnM1Hbb7fwB2EApfAP4XZcxoq0E
 J+gmu0qrQVcut0FKHxmpqpph4BPsUmD7/LXQxtXp6pHPsAdOmvEI5Ikn2Wapko4uODvS
 RIOI3ozAvvFL7bswgjmBD9z93nBjfk0/Ht5tuOZRbdWkwPtmchY96Lbf24Pj2/fOGR+R
 GBg5Ssr/0Zan8NU7crWFpFCmL4kp8I+iH1rBDdAdx+7cUs1uc9UdKg2znP70OAS6RlKp
 CDyU2EOhgEpoOs3eMMm2pnX88vgft7XY5hGsHJ5swLhoOBZ8IjGkl435JhV8KJu8NGzD
 6QLw==
X-Gm-Message-State: AOAM531FV6wrJa+79o3L0yZx/ffP7HUGJmzY9aWsc0nlhyb0FzJzCw/H
 ZeJEPK/CzcNnnNRaI8bb2VHEKeGeq7b/i7/7iG/kBQ==
X-Google-Smtp-Source: ABdhPJwKdoS+6eFhIHsa8XBFo0m3Sjd0aYt1yBdRfyKP2io/xudp0Anc9afhfFHCv162xklYocQOh3LGLI6ldwZFqqM=
X-Received: by 2002:a25:478b:: with SMTP id u133mr5451813yba.532.1631212170654; 
 Thu, 09 Sep 2021 11:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <CAE-0n52ia_Em6GYU-ketmzi4OQxcdux3uLjMGhzVTUJbC0Yz-Q@mail.gmail.com>
In-Reply-To: <CAE-0n52ia_Em6GYU-ketmzi4OQxcdux3uLjMGhzVTUJbC0Yz-Q@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Thu, 9 Sep 2021 11:29:19 -0700
Message-ID: <CA+cxXh=FJtvAzb0UeMXYs3PKxcdoR7hG23BJQ5Xtj_ywjLUQ_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: parade-ps8640: Use regmap APIs
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

Hi,

On Wed, Sep 8, 2021 at 2:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-09-08 11:18:05)
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index 685e9c38b2db..a16725dbf912 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -64,12 +65,29 @@ struct ps8640 {
> >         struct drm_bridge *panel_bridge;
> >         struct mipi_dsi_device *dsi;
> >         struct i2c_client *page[MAX_DEVS];
> > +       struct regmap   *regmap[MAX_DEVS];
> >         struct regulator_bulk_data supplies[2];
> >         struct gpio_desc *gpio_reset;
> >         struct gpio_desc *gpio_powerdown;
> >         bool powered;
> >  };
> >
> > +static const struct regmap_range ps8640_volatile_ranges[] = {
> > +       { .range_min = 0, .range_max = 0xff },
>
> Is the plan to fill this out later or is 0xff the max register? If it's
> the latter then I think adding the max register to regmap_config is
> simpler.
It's the former.
The real accessible register range is different per page, E.g.:
- For page0, the register range is 0x00 - 0xbf.
- For page1, the register range is 0x00 - 0xff.
- For page2, the register range is 0x80 - 0xff.
Even if we don't specify the accurate per-page register range later,
the default register range here (0x00 - 0xff) can cover the available
registers in each page.
>
> > +};
> > +
> > +static const struct regmap_access_table ps8640_volatile_table = {
> > +       .yes_ranges = ps8640_volatile_ranges,
> > +       .n_yes_ranges = ARRAY_SIZE(ps8640_volatile_ranges),
> > +};
> > +
> > +static const struct regmap_config ps8640_regmap_config = {
> > +       .reg_bits = 8,
> > +       .val_bits = 8,
> > +       .volatile_table = &ps8640_volatile_table,
> > +       .cache_type = REGCACHE_NONE,
> > +};
> > +
> >  static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> >  {
> >         return container_of(e, struct ps8640, bridge);
> > @@ -78,13 +96,13 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> >  static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
> >                                      const enum ps8640_vdo_control ctrl)
> >  {
> > -       struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
> > -       u8 vdo_ctrl_buf[] = { VDO_CTL_ADD, ctrl };
> > +       struct regmap *map = ps_bridge->regmap[PAGE3_DSI_CNTL1];
> > +       u8 vdo_ctrl_buf[] = {VDO_CTL_ADD, ctrl};
>
> Nitpick: Add a space after { and before }.
Thanks. Will fix this in the next version.
>
> >         int ret;
> >
> > -       ret = i2c_smbus_write_i2c_block_data(client, PAGE3_SET_ADD,
> > -                                            sizeof(vdo_ctrl_buf),
> > -                                            vdo_ctrl_buf);
> > +       ret = regmap_bulk_write(map, PAGE3_SET_ADD,
> > +                               vdo_ctrl_buf, sizeof(vdo_ctrl_buf));
> > +
> >         if (ret < 0) {
> >                 DRM_ERROR("failed to %sable VDO: %d\n",
> >                           ctrl == ENABLE ? "en" : "dis", ret);

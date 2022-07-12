Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F835715ED
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 11:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10D93E03;
	Tue, 12 Jul 2022 09:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51A893E09
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 09:41:11 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id r3so12998157ybr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ap4l5XvEX4U5y4HXdhNjnDCI2p/ybo07t52ucHAEl58=;
 b=nF5jk4IbkWMGbIvw6tuAwseMZKQOb4ZuSAzGDcOJ6hXjhVuy5eJJvBwMgRRJKyQTok
 R88q4K0mceZid2iijl+74nhtOqj+jdMd/PaLJmi1NaA24/LA6+6TXm9v7UxfZofiD0CW
 XaP6nyYSFoHb5NPejvOBbiHaG1D3SuT886+Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ap4l5XvEX4U5y4HXdhNjnDCI2p/ybo07t52ucHAEl58=;
 b=bKOphKyLExKsVcHSMgGMLcF1AVFnuGB+hvC9AkwNjEpZzJtosiwINwAmeCHVmLfsWK
 3egy9KqE/uRy87IZBndNnsRvyWCdbHtJHNTk4mzl2ARScg/U8S7Sq8u69fZp8zPvtgyV
 4QBIrr1Ea5zu7J4i+PWB7/TkK8LjfD9TYjZUy3XcXEIHx2zO27Db/axThNn34L4TUuBz
 36sfyBj9p6ordyOXnBVobKoXmrp6ZwTI/1vFBiHHQb7rXK0qXjtTzJxgTpkQ7il5fBxO
 VCb9j7dOAveNo+MvUoKe7ymIBZBqOxpsrH0HCdc1ghzz4diI28hmNZFM27cC37KpgiCm
 Cw0g==
X-Gm-Message-State: AJIora9k51x8r4eb/aKhLKB6XoovBhXRKaT6GMPGnI/nruWtohgORARV
 zHvVxPrlia4L+86JKzhQM6EavLnYngrdh//k3R3x8w==
X-Google-Smtp-Source: AGRyM1ueFTwJTwmZe47+iw7VZHKOxIEWEBZvmpXenIjQL5R+ILXsO8/oHHqMY6GdJ5+VnIf5wvoGvPY5MBQuREGAMf8=
X-Received: by 2002:a05:6902:728:b0:66e:8f7b:a252 with SMTP id
 l8-20020a056902072800b0066e8f7ba252mr20510340ybt.584.1657618871004; Tue, 12
 Jul 2022 02:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220707080600.49041-1-allen.chen@ite.com.tw>
 <20220707080600.49041-2-allen.chen@ite.com.tw>
 <CAG3jFystTA3sD2nWJHPYq39WxRwjVt4qj2DMDk2Khh1kR=8ntg@mail.gmail.com>
In-Reply-To: <CAG3jFystTA3sD2nWJHPYq39WxRwjVt4qj2DMDk2Khh1kR=8ntg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 Jul 2022 17:41:00 +0800
Message-ID: <CAGXv+5HcU6paJJzm4nLe6mmSYUaR-pp5LBsy9aev0RRX+FKmcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: it6505: Modified power sequence
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pin-yen Lin <treapking@google.com>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 4:08 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Hi Allen,
>
> On Thu, 7 Jul 2022 at 10:06, allen <allen.chen@ite.com.tw> wrote:
> >
> > From: allen chen <allen.chen@ite.com.tw>
> >
> > Change power sequence to meet it6505 data sheet requirement when boot on.
> >
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> >
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> > index 2d119e3016b3..aa5e0aa1af85 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -3029,7 +3029,7 @@ static int it6505_init_pdata(struct it6505 *it6505)
> >                 return PTR_ERR(pdata->ovdd);
> >         }
> >
> > -       pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +       pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>
> Making this change is problematic since it requires a corresponding
> change in all of the device trees that use this device. It's against
> policy to change this interface after it has been introduced.
>
> Unless anyone thinks otherwise, I would like to see this patch dropped.

I think you're confusing GPIO_ACTIVE_{LOW,HIGH} flags in the device tree
vs GPIOD_OUT_{LOW,HIGH}, which just sets the "default" state the GPIO
should be in when it is requested.

This change doesn't impact the device tree.


Regards
ChenYu

> >         if (IS_ERR(pdata->gpiod_reset)) {
> >                 dev_err(dev, "gpiod_reset gpio not found");
> >                 return PTR_ERR(pdata->gpiod_reset);
> > --
> > 2.25.1
> >

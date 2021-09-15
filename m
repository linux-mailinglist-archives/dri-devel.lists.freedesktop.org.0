Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4764C40BDA9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 04:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743956E896;
	Wed, 15 Sep 2021 02:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B46D6E896
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 02:17:17 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id q14so1293238ils.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q9q2xLJ1hwg8ZonS652P1/WWF9+E7349Lf8vX2F81hA=;
 b=aBiLRw4HynCYfAhxL7il0axQugRkZZwmT0cOn2zJAoW7y7IH/zmLn+JuAiHqfDJJSw
 V/UvG9H6mE3qFO4FG5pZXojyrrfwppyilJ9dS61IU/MuI2nWyp4hIvcRIQrH4+4Vb4AM
 X6O0mnVwjUMSzxLU9jGH53TgmHpBGrf2iv97g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9q2xLJ1hwg8ZonS652P1/WWF9+E7349Lf8vX2F81hA=;
 b=NyDRcrg4CBYSxajL8K/s7efd+ik99z7jEsQM/iGwNr9N+ugouKAdOLkqev3GJAdXdS
 A9YIbBeU8Y9jRoVhLH5C7yNQE2U3Zl6QLpUkFqSWNKfa9mUC+ba1ZEbUeu7yv3NTEkSd
 JpaFLuK4xOXS/qbmonP8xKe/dsTc0CntkfjVS/8BwKjvEITpMQDnefZFN4NGMZBFI9yi
 NcfJl2quJgruxoDXsGPOYg2eaw2GAAv28lB4izZrjzBhtFCaqZuGw+rOWgv0ngZk86b7
 uU53imMbOwDh/cVT6HrP53gS0CAFndnGdwDXeudQoWHkrIeRYOSNdZDcEEJdbLi8MxCw
 jUcQ==
X-Gm-Message-State: AOAM532w16RvYSv/lleu3Q2fXsggJs6TabJ3/q0hwjgYWWV1TVeIWrpD
 FYZzrCx1MhOO4/zu+KcF/5pYsJbMGC6LKg==
X-Google-Smtp-Source: ABdhPJzuh74+9G//oKbVUELd6QZJx59KoPBuLPMa5MQDbMIftsiS9dXHcUTq3azi+ZEikBJMFDbY8w==
X-Received: by 2002:a05:6e02:2194:: with SMTP id
 j20mr13681586ila.268.1631672236429; 
 Tue, 14 Sep 2021 19:17:16 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173])
 by smtp.gmail.com with ESMTPSA id v1sm7683246ile.83.2021.09.14.19.17.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 19:17:15 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id h20so1233551ilj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:17:15 -0700 (PDT)
X-Received: by 2002:a05:6e02:1847:: with SMTP id
 b7mr2164174ilv.180.1631672234933; 
 Tue, 14 Sep 2021 19:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.2.Ib06997ddd73e2ac29e185f039d85cfa8e760d641@changeid>
 <CAE-0n53BXh3_6jEW5oTbPA-V=MSaN=RvqaU8uoY9GNOm-0Pv_g@mail.gmail.com>
In-Reply-To: <CAE-0n53BXh3_6jEW5oTbPA-V=MSaN=RvqaU8uoY9GNOm-0Pv_g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Sep 2021 19:17:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKQg-fU1jaSOh3RTa5HpSAiTzt2-Sycwt59uv1WemYxg@mail.gmail.com>
Message-ID: <CAD=FV=WKQg-fU1jaSOh3RTa5HpSAiTzt2-Sycwt59uv1WemYxg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: parade-ps8640: Use regmap APIs
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

On Tue, Sep 14, 2021 at 5:29 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-09-14 16:28:44)
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index e340af381e05..8d3e7a147170 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -368,6 +396,12 @@ static int ps8640_probe(struct i2c_client *client)
> >
> >         ps_bridge->page[PAGE0_DP_CNTL] = client;
> >
> > +       ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client, ps8640_regmap_config);
> > +       if (IS_ERR(ps_bridge->regmap[PAGE0_DP_CNTL])) {
> > +               return dev_err_probe(dev, PTR_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]),
> > +                                    "Error initting page 0 regmap\n");
>
> This one also doesn't return -EPROBE_DEFER? The dev_err_probe() should
> really only be used on "get" style APIs that can defer.

Any reason why you say that dev_err_probe() should only be used on
"get" style APIs that can defer? Even if an API can't return
-EPROBE_DEFER, using dev_err_probe() still (IMO) makes the code
cleaner and should be used for any error cases like this during probe.
Why?

* It shows the error code in a standard way for you.
* It returns the error code you passed it so you can make your error
return "one line" instead of 2.

Is there some bad thing about dev_err_probe() that makes it
problematic to use? If not then the above advantages should be a net
win, right?

-Doug

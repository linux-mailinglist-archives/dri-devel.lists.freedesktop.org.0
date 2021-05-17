Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C35386B25
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84206EAAE;
	Mon, 17 May 2021 20:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12406EA96
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:18:07 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id k127so7111542qkc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4npjzmtC1fi2rBbQF51lCYO1znRO3Y5vzRV2CUdYnQc=;
 b=mo4MtdIdBaqbn0rvbr8Al9VDijDLMpxhpo1BvG5iLNvjR/wDHjiz9muEDpBrRiJwhq
 40AbhDao1bx3W+JWbGgI5nfwUcteM8Zd+n+cdxkHNVLJIhCrfPxsrrDyOXCzkoFa631r
 y569Dmf48XwRvjZOlRusp5uwaGn3EwmBMfYdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4npjzmtC1fi2rBbQF51lCYO1znRO3Y5vzRV2CUdYnQc=;
 b=AspulUv3P3EE67vIsddoQq837NlIDmPjj3RwDrAnqv+AEv96FSI+aqXcMDkrtDyPSM
 zrm4XWEyhaikp955UzkC0/V/zQW1oxg/KmxmIIf0Z4DaUMK/fEj/MAVObDuxWyGcE5C+
 g+V/4d8sKidEJ+hoGJ9fvJHHfJ8NslIzjxtuzKZKXCqpdfa6/a/AyGqzI+qcWNjXpaBX
 ASQlCJi1GK5jxgYHLw5F/Hmbq8Qp3fDSQLPlhxd4W1ijqOaOE27UfpMqOeWYqtUJBTYx
 lh6H33C4NRIA55t6VtzTX9wJszVP8buNhzYDEcZ/gwq/Oae8LovKIwNLqixBUMMLyHqE
 kYHg==
X-Gm-Message-State: AOAM533IOoxr0ysoEQ6c6G+AYhq+cZEJbphBGRVc/2rk+L16aSKURmSJ
 xfv41cIvMPVyQpt+Rfi0i5jhBQAyHrMaIg==
X-Google-Smtp-Source: ABdhPJw6IX0HrkKFL+TG93i3g/GQly2rIrX/ve8DJ6UvLViSffPr1c1BSWjKrF54GKWR5PJ9tbE/gQ==
X-Received: by 2002:a37:a751:: with SMTP id q78mr1620413qke.482.1621282686984; 
 Mon, 17 May 2021 13:18:06 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id b3sm9895258qtg.55.2021.05.17.13.18.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 13:18:05 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id r8so10211619ybb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:18:05 -0700 (PDT)
X-Received: by 2002:a05:6902:1023:: with SMTP id
 x3mr2203165ybt.79.1621282684676; 
 Mon, 17 May 2021 13:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210503215844.2996320-1-dianders@chromium.org>
 <20210503145750.v6.2.Iff8f2957d86af40f2bfcfb5a7163928481fccea4@changeid>
 <8eedeb02dc56ecaed5d2f3cb8d929a3675b2c3da.camel@redhat.com>
 <20210507220036.GI2484@yoga>
 <22632aba5bc118f5e96e155f240445b1547733c7.camel@redhat.com>
 <871ra9tvje.fsf@intel.com>
In-Reply-To: <871ra9tvje.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 May 2021 13:17:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VkwMjXz_vrMHOk1ZOx-gg5yq8cDbRWA-iXojUf+Ffddg@mail.gmail.com>
Message-ID: <CAD=FV=VkwMjXz_vrMHOk1ZOx-gg5yq8cDbRWA-iXojUf+Ffddg@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] drm/dp: Allow an early call to register DDC i2c bus
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Clark <robdclark@chromium.org>,
 Ville Syrjala <ville.syrjala@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 David Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, LKML <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-i2c <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 14, 2021 at 4:16 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Fri, 07 May 2021, Lyude Paul <lyude@redhat.com> wrote:
> > On Fri, 2021-05-07 at 17:00 -0500, Bjorn Andersson wrote:
> >> On Fri 07 May 16:18 CDT 2021, Lyude Paul wrote:
> >>
> >> > Adding ville from Intel to also get their take on this.
> >> >
> >> > In general we've been trying to move DRM to a design where we don't expose
> >> > any
> >> > devices until everything is ready. That's pretty much the main reason that
> >> > we
> >> > register things during bridge attach time. Note though that even before
> >> > the
> >> > DDC bus is registered it should still be usable, just things like
> >> > get_device()
> >> > won't work.
> >> >
> >> > This isn't the first time we've run into a problem like the one you're
> >> > trying
> >> > to solve though, Tegra currently has a similar issue. Something we
> >> > discussed
> >> > as a possible long-term solution for this was splitting i2c_add_adapter()
> >> > into
> >> > a minimal initialization function and a registration function. Linux's
> >> > device
> >> > core already allows for this (device_initialize() and device_add(), which
> >> > are
> >> > called together when device_register() is called). Would this be a
> >> > solution
> >> > that might work for you (and even better, would you possibly be willing to
> >> > write the patches? :)
> >> >
> >>
> >> It's not enough that the adapter is half-baked, because the bridge's
> >> initialization depends on that the panel device is done probing, and the
> >> panel driver will only complete its probe if it can find it's resources.
> >>
> >> So we need a mechanism to fully create the resources exposed by the
> >> bridge chip (i2c bus, gpio chip and (soon) a pwm chip), then allow the
> >> panel to probe and after that initialize the bridge.
> >>
> >> We did discuss possible ways to register these resources and then
> >> "sleep for a while" before resolving the panel, but what we came up with
> >> was definitely suboptimal - and ugly.
> >
> > Sigh, I'm really starting to wonder if we should reconsider the rules on
> > exposing ddc adapters early...
> >
> > Danvet, Jani, and/or airlied: can I get your take on this?
>
> Granted, I did not study this in detail, but it sounds like we'd need to
> be able to add and use an i2c adapter in kernel, before deciding to
> register it with the userspace. But that does not seem to be as trivial
> as making it possible to call the now-static i2c_register_adapter()
> separately.

To close the loop: I think the point is now moot in v7. Now crossing
my fingers that approach can gain momentum. If not, I might come back
here. ;-)

-Doug

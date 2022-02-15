Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F04B7ABA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 23:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3833810E5CD;
	Tue, 15 Feb 2022 22:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EED210E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 22:52:02 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so425067ooi.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1FB9vEgE7XNXDYnECZNocmKPYP8d5C7TWz0lgDEn7xk=;
 b=fjG712BlrOTYrfwnSRNCBRY8yRQW9o6qR1hiZlZWQq91Sm5fVmIhzlRa+s7C/PBz2T
 eJ4cgsB9JemF8urXL4CrzCBOFzhtwz5N7W5Kotgar0OKQBgyUhdOiRujxY9FKvRk0roG
 NZoBf1wVhyOnoD6NCrsjPrRQ5hEQ7qliayxC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1FB9vEgE7XNXDYnECZNocmKPYP8d5C7TWz0lgDEn7xk=;
 b=AFU+qyHjxCjRzjaXAkgyWGC6WijEu0PRqJwphGJPvcGr6EfnGkkP8D99GGJltJpv7Y
 0GKMIITSj7Iz5G6H5lBpBiCyvZpUTe1lWEt/HI5XE/tm2bgLqM9Z3PFKF7z4n/ty9ClZ
 iVtNPuVEIA+Txg7KDbJmG8HJBs02hh3x031ooEYt/+XMT2XY0PiRylUvYOaXzR67YxaH
 sp1uaa3DdSCkWHJQK2scgP8UG6lH/tYV8Kts4wubK7qB3NpKwapBDpKH1UH5wgv4zShf
 XHW8XzjAZveEgwU4GLvXEECaY65NlIWRnbYMZ1x3nOJSNfuZqSp811t9o/o9GZ9Vaox5
 bW4Q==
X-Gm-Message-State: AOAM532AMpgjFXI49ObgNAXpzBnOk4xaPxWboFPu8XoxmNql60qTO0mM
 QEv9F3hnOMfXznb/PzEkPyLyy6AgiOiGqg==
X-Google-Smtp-Source: ABdhPJyxA41fUh2+MrbDFR+m6TY9J3aL+g7t9RK83Uy/MlGIF+MfRz34UVkO2K8R60SqQfITeUwlJg==
X-Received: by 2002:a05:6870:3a35:b0:d2:c787:ceea with SMTP id
 du53-20020a0568703a3500b000d2c787ceeamr2278422oab.96.1644965521388; 
 Tue, 15 Feb 2022 14:52:01 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
 [209.85.210.42])
 by smtp.gmail.com with ESMTPSA id t192sm893840oie.14.2022.02.15.14.51.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 14:51:58 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso286404otv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:51:58 -0800 (PST)
X-Received: by 2002:a9d:755a:: with SMTP id b26mr513845otl.230.1644965517513; 
 Tue, 15 Feb 2022 14:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20211001144212.v2.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <CAD=FV=XU0bYVZk+-jPWZVoODW79QXOJ=NQy+RH=fYyX+LCZb2Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XU0bYVZk+-jPWZVoODW79QXOJ=NQy+RH=fYyX+LCZb2Q@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 15 Feb 2022 14:51:46 -0800
X-Gmail-Original-Message-ID: <CA+ASDXPXKVwcZGYoagJYPm4E7DzaJmEVEv2FANhLH-juJw+r+Q@mail.gmail.com>
Message-ID: <CA+ASDXPXKVwcZGYoagJYPm4E7DzaJmEVEv2FANhLH-juJw+r+Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Grab runtime PM reference for
 DP-AUX
To: Doug Anderson <dianders@chromium.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "# 4.0+" <stable@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 1:31 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,

Hi!

> On Fri, Oct 1, 2021 at 2:50 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > If the display is not enable()d, then we aren't holding a runtime PM
> > reference here. Thus, it's easy to accidentally cause a hang, if user
> > space is poking around at /dev/drm_dp_aux0 at the "wrong" time.
> >
> > Let's get the panel and PM state right before trying to talk AUX.

> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > index b7d2e4449cfa..6fc46ac93ef8 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -1632,8 +1632,27 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
...
> > +       pm_runtime_get_sync(dp->dev);
> > +       ret = analogix_dp_transfer(dp, msg);
> > +       pm_runtime_put(dp->dev);
>
> I've spent an unfortunate amount of time digging around the DP AUX bus
> recently, so I can at least say that I have some experience and some
> opinions here.

Thanks! Experience is welcome, and opinions too sometimes ;)

> IMO:
>
> 1. Don't power the panel on. If the panel isn't powered on then the DP
> AUX transfer will timeout. Tough nuggies. Think of yourself more like
> an i2c controller and of this as an i2c transfer implementation. The
> i2c controller isn't in charge of powering up the i2c devices on the
> bus. If userspace does an "i2c detect" on an i2c bus and some of the
> devices aren't powered then they won't be found. If you try to
> read/write from a powered off device that won't work either.

I guess this, paired with the driver examples below (ti-sn65dsi86.c,
especially, which specifically throws errors if the panel isn't on),
makes some sense. It's approximately (but more verbosely) what Andrzej
was recommending too, I guess. It still makes me wonder what the point
of the /dev/drm_dp_aux<N> interface is though, because it seems like
you're pretty much destined to not have reliable operation through
that means.

Also note: I found that the AUX bus is really not working properly at
all (even with this patch) in some cases due to self-refresh. Not only
do we need the panel enabled, but we need to not be in self-refresh
mode. Self-refresh is not currently exposed to user space, so user
space has no way of knowing the panel is currently active, aside from
racily inducing artificial display activity.

But if we're OK with "just throw errors" or "just let stuff time out",
then I guess that's not a big deal. My purpose is to avoid hanging the
system, not to make /dev/drm_dp_aux<N> useful.

> 2. In theory if the DP driver can read HPD (I haven't looked through
> the analogix code to see how it handles it) then you can fail an AUX
> transfer right away if HPD isn't asserted instead of timing out. If
> this is hard, it's probably fine to just time out though.

This driver does handle HPD, but it also has overrides because
apparently it doesn't work on some systems. I might see if we can
leverage it, or I might just follow the bridge-enabled state (similar
to ti-sn65dsi86.c's 'comms_enabled').

> 3. Do the "pm_runtime" calls, but enable "autosuspend" with something
> ~1 second autosuspend delay. When using the AUX bus to read an EDID
> the underlying code will call your function 16 times in quick
> succession. If you're powering up and down constantly that'll be a bit
> of a waste.

Does this part really matter? For properly active cases, the bridge
remains enabled, and it holds a runtime PM reference. For "maybe
active" (your "tough nuggies" situation above), you're probably right
that it's inefficient, but does it matter, when it's going to be a
slow timed-out operation anyway? The AUX failure will be much slower
than the PM transition.

I guess I can do this anyway, but frankly, I'll just be copy/pasting
stuff from other drivers, because the runtime PM documentation still
confuses me, and moreso once you involve autosuspend.

> For a reference, you could look at
> `drivers/gpu/drm/bridge/ti-sn65dsi86.c`. Also
> `drivers/gpu/drm/bridge/parade-ps8640.c`

Thanks for these. They look like reasonable patterns to follow.


Brian

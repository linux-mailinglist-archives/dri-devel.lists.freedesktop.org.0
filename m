Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777A5A687A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 18:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6920510E1C8;
	Tue, 30 Aug 2022 16:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C9410E1C8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 16:33:08 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id y17so905185ilb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ciXFSEs9r0N1LD91dtfpuJIFP0vahmRP9WDesA1Qhrw=;
 b=lgwfbgVg+azcvOZPzBts94TKWwBwKKtdinKOHcL+PKZYUqzkypjPZ48kCmvwv2Nw5l
 3ZlFmIetZFXi/KM2ARrCl1E8q+5dhDSK6khN5SktQvRQyq6Lk3+LNe4932E38304io8d
 Qgpv9b1tqmK0sUYUZtgvGmPiw6wktQuO06WXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ciXFSEs9r0N1LD91dtfpuJIFP0vahmRP9WDesA1Qhrw=;
 b=Ej7gxxTi/N6SEq8/DLGsurRXJXGmYJfdtWy6WBZWIyDbBxtzQwqtPJpK4t4AgxbRss
 ca9HWAZ4zE6nOzXIu2y27OYsLprVs1VYeu5QRc5MnIHFBoVNvsULf8icFg3pYSqOCPZR
 uWpx4QgbvQave9ic3NfZ+s6Soi/g2tHkF1/XEPLnqdhUEB9cJqsQFx7Pi5YPKtyqZXlB
 FrXBnSVc36RSeRy01VvgSPwasIsvcYTM0aYjqFnehQL3it6cpZhMxwpPV/YKOvMRpHlH
 Y4g3TUAQKYRDdMauWg9h9vHteZ/XrYipvpotGS281/sRCYjxlkTAfwzjoQXbceqM/XdD
 fATw==
X-Gm-Message-State: ACgBeo3dOPh464MAw6x7UGwjgf+MhbDy2V/xNiSsZr3x9rZgSAUqA6JT
 h1D6VC/ORnDg+cZVnX3lE5PwftYkp2ufCyJi
X-Google-Smtp-Source: AA6agR4488STKdSf4uupZsUXFAL4OjLhghOkHPrent1Tcuap48YRDAO0Wy9UXEYvRzywJeTX4fKmTw==
X-Received: by 2002:a05:6e02:1685:b0:2ea:447a:df8b with SMTP id
 f5-20020a056e02168500b002ea447adf8bmr12628236ila.66.1661877187210; 
 Tue, 30 Aug 2022 09:33:07 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52]) by smtp.gmail.com with ESMTPSA id
 i7-20020a02a0c7000000b00349d044cddfsm5626716jah.119.2022.08.30.09.33.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 09:33:06 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id 62so9689804iov.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:33:06 -0700 (PDT)
X-Received: by 2002:a6b:5f0b:0:b0:688:c460:87ff with SMTP id
 t11-20020a6b5f0b000000b00688c46087ffmr11002214iob.56.1661877185716; Tue, 30
 Aug 2022 09:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
 <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
 <ed60ea8b-bcc4-4a99-5133-8cd4b010d09b@ideasonboard.com>
 <CAD=FV=VuJnFa+Egkw0_yckwRd_05rUi+Y-hzxzof0Ki=8BOdMg@mail.gmail.com>
 <61274dc0-1377-9330-67b6-0d8abff6e21b@ideasonboard.com>
In-Reply-To: <61274dc0-1377-9330-67b6-0d8abff6e21b@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Aug 2022 09:32:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UW34fvZ0kOMtvt0nDk4AhnUbJjxdV+Avd8BjHwdBU85g@mail.gmail.com>
Message-ID: <CAD=FV=UW34fvZ0kOMtvt0nDk4AhnUbJjxdV+Avd8BjHwdBU85g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Aug 30, 2022 at 9:11 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> >>> eDP the _correct_ implementation for detect is to always return true.
> >>> Yes, there is a line called HPD for eDP and yes that line is used for
> >>> full DisplayPort for detecting a display. For eDP, though, HPD does
> >>> not detect the presence of a display. A display is always there.
> >>
> >> But for eDP it still signals the actual availability of the display,
> >> similarly to DP, doesn't it? You can't communicate with the monitor or
> >> read the EDID until you get the HPD.
> >
> > It signals that the display has finished booting, _not_ whether the
> > display is there. The display is always there.
> >
> > There are simply two concepts:
> > 1. Is a display there?
> > 2. Can I talk to the display?
> >
> > I assert that the way that "detect" is used in the DRM core is for #1.
>
> Why is that? Can you point to any specific piece of code?
>
> I didn't look it closely, but I believe in my testing I saw that the
> framework expects to be able to read EDID after detect() reports that
> the display is connected. And if EDID read fails, then you get only the
> default modes, even if the display was ready very soon afterwards. If so
> that hints more towards 2.

I guess it's mostly the chicken and egg problem. In your model, how
does the panel get turned on? Let's say that the eDP panel is off at
bootup, right? So "HPD" will not be high. detect() will say that
nothing is there. Since nothing is there, nobody will ever try to call
get_edid() nor will they ever try turning on the panel. ...and since
nobody turns on the panel HPD will never be high.

Now let's imagine that there is some rule to turn the panel on once at
bootup. Great, you'll see the panel at bootup. ...but then what
happens when you go through a modeset or suspend/resume or similar?
We'll turn the panel off as part of the modeset, HPD will go low, and
it will look like the panel is gone forever.

This is why detect() has to always say that an eDP panel is present.
If this isn't true the panel will never be turned on because we'll
never know it's there.


> > In theory one could try to conflate the two. Everyone keeps trying
>
> I agree here, they are not the same.
>
> > until they think about it more. Probably because the signal is named
> > HPD and everyone reads that as "hot plug detect". Worst. Name. Ever.
> > In any case, here lies dragons. Specifically if you conflate these two
> > concepts then when do you know to provide power to the display?
> > Remember, you can't detect the display until it's powered. ...but why
> > would you power it if you thought it wasn't there? You could power it
> > once at bootup, but then if someone turns the display off how will you
> > ever know that you can power it back on? It'll look like the display
> > was removed...
>
> But here's my question: if detect() tells whether the display is
> physically there, why do we need it?
>
> If the display is not hot-pluggable, then, as you say, it's always
> there, and detect() is unnecessary. The panel driver always assumes the
> panel is there and will power it up. So detect is not really needed.

Right. I conflated these two, sorry. Having detect() unimplemented and
having it always return true are the same thing and the DRM core
treats them the same as far as I'm aware.


> > It gets down to making sure things are powered. If the eDP controller
> > implements get_edid() then the eDP controller needs to know how to
> > power on the panel in response to that get_edid(). Remember, this is
> > eDP and we have to _always_ say the panel is there even when HPD
> > hasn't been asserted. See the above rant^H^H^H^H explanation. While
> > it's possible to have the eDP controller call down the bridge chain to
> > power the panel temporarily for get_edid() (early patches of mine did
> > that), in the end we decided it made more sense to have this driven by
> > the panel driver.
>
> I agree here, the panel driver has to drive the process. That's actually
> how I designed the old omapfb display subsystem (well, DP didn't exist
> then), everything originated from the display driver, not the crtc side.
>
> However, my argument is that someone, be it the display or the source
> driver, should offer detect() and get_edid(),

If you implement get_edid() I believe it won't be the end of the world
because the panel's version will be picked first. However, it feels
clearer to me to not implement it if it's not going to be used / won't
work for eDP.


> and afaics it makes sense
> for detect() to report whether the display is ready or not (usually HPD
> if it is connected, but could be via some other means).

I think detect() is actually harmful for eDP, as per my argument
above. If we detect the panel is "gone" then we'll turn off the power
to the panel. We'll never detect the panel again and we'll never again
have a reason to power the panel on.


> However, I have to say this is perhaps sidetracking this patch =). I can
> drop the comment in question from the description as it's somewhat
> irrelevant wrt. this patch.

Sounds good!

-Doug

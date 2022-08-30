Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCB5A66B5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F6610E109;
	Tue, 30 Aug 2022 14:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2BB10E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 14:56:13 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id s11so2328734iln.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0lJJNHTBUH5Vo2Gv/p9y3jfye2qvLfzkXcSPcIljcyQ=;
 b=gtEKVYAhCgbqLolTLe1A+vk539qNg1LFhMzjeZBvtFNaXoQBTEg6AtbfFR8hdZ+wl7
 xvdoV8PK072mz7W33kXUMBtupojNMx57S1NKYydB9CYCpTm5KuLYrUij6WuarHZSJgSm
 +1TcQeVt6lorbyDWPn4/MCtziselbS5fEjbG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0lJJNHTBUH5Vo2Gv/p9y3jfye2qvLfzkXcSPcIljcyQ=;
 b=4SQjXsAj13IcK0Au2EODLr0KHCJQn1X/UqT/uGCkdYHLlzAHY0MyC3BydJdAQZUQto
 XDz8CXA+3Ol7JJ6iOb3L0lrjHWXanN5E6IfkVThuuVLfx0Xb1Xus/w4+0++NH9HrhqlO
 7Hg0IPOlLsnZmu8J6IGbh6ZlU8uHY51sN4hkv/52kFwCFHwUJcXkOQeBJATKjRNwair9
 IgqFhnKMX9gjN96MYkQtnhY2ZyyBqxozJUKQJSyXe3MS8v6Kc/4/O0QiX2KXjU64Bq6T
 h9KKxD3lV2JbQB0kzwFLZaP4NNdC7nDKEi2Z7vNJbwBedyAPVtrWH7rzU27di/a3wpxq
 UV3A==
X-Gm-Message-State: ACgBeo12LgPk1qqhGO78coI/TJ8zO38W/OsDTPFGCTmb8xkQr57Y7Oii
 QdEC3LOcF7HicG+ceN8z0p+04nZlV+8yb4yz
X-Google-Smtp-Source: AA6agR5wPFZCAQMf661ip6K/gvKCq2ZKw+65ZOrfN1aRzdt47CaLF4OnnlpV9bOPau18fsKs7iuj4w==
X-Received: by 2002:a92:2a05:0:b0:2e5:f1b3:c9cf with SMTP id
 r5-20020a922a05000000b002e5f1b3c9cfmr12885936ile.136.1661871372570; 
 Tue, 30 Aug 2022 07:56:12 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 t8-20020a056602140800b006892048f548sm6302190iov.43.2022.08.30.07.56.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 07:56:11 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e7so4643231ilc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:56:11 -0700 (PDT)
X-Received: by 2002:a92:c544:0:b0:2eb:7d50:5ff9 with SMTP id
 a4-20020a92c544000000b002eb7d505ff9mr277219ilj.187.1661871370921; Tue, 30 Aug
 2022 07:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
 <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
 <ed60ea8b-bcc4-4a99-5133-8cd4b010d09b@ideasonboard.com>
In-Reply-To: <ed60ea8b-bcc4-4a99-5133-8cd4b010d09b@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Aug 2022 07:55:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuJnFa+Egkw0_yckwRd_05rUi+Y-hzxzof0Ki=8BOdMg@mail.gmail.com>
Message-ID: <CAD=FV=VuJnFa+Egkw0_yckwRd_05rUi+Y-hzxzof0Ki=8BOdMg@mail.gmail.com>
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

On Tue, Aug 30, 2022 at 2:00 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 29/08/2022 20:38, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>
> >> Implement the bridge connector-related .get_edid() and .detect()
> >> operations, and report the related bridge capabilities and type.
> >>
> >> These ops are only added for DP mode. They should also be used for eDP
> >> mode, but the driver seems to be mostly used for eDP and, according to
> >> the comments, they've had issues with eDP panels and HPD. So better be
> >> safe and only enable them for DP for now.
> >
> > Just to be clear: the "They should also be used for eDP" is not correct.
> >
> > * The detect() function should be returning whether the display is
> > physically there. For eDP it is _always_ physically there. Thus for
>
> Really? I thought detect() is the polling counter-part of HPD interrupt.
> What is the point of returning true from detect() if the display is
> there, but cannot be used?

The critical thing to realize is that for eDP the "HPD" signal does
not mean "hot plug detect". Worst. Name. Ever. The HPD signal in eDP
should be read as "panel IRQ" or "panel ready" or "panel attention" or
something. Anything but "hot plug detect". eDP is not hot plugged. You
can't take your laptop and, while it's on, pop the panel out and put
in another. It's simply not designed for it.

Specifically, eDP is _designed_ such that when the panel is turned off
the system should remove power to the panel. ...and when you remove
power to the panel then HPD goes low. Yet the panel is still there.
How do you know? You simply assume that since this is an eDP port that
it has a panel attached to it. You power it on and you use the "HPD"
signal (AKA "panel ready") to tell when it's finished powering on.

This is like every other non-hot-pluggable device in your system. If
your board has an audio codec then you just know it's there. You power
it on, wait a fixed amount of time for it to boot (or maybe wait until
it asserts a GPIO that says it's ready) and then you use it. That
i2c-controlled trackpad? Same thing. Your eMMC chip? You assume it's
there and power it up.


> > eDP the _correct_ implementation for detect is to always return true.
> > Yes, there is a line called HPD for eDP and yes that line is used for
> > full DisplayPort for detecting a display. For eDP, though, HPD does
> > not detect the presence of a display. A display is always there.
>
> But for eDP it still signals the actual availability of the display,
> similarly to DP, doesn't it? You can't communicate with the monitor or
> read the EDID until you get the HPD.

It signals that the display has finished booting, _not_ whether the
display is there. The display is always there.

There are simply two concepts:
1. Is a display there?
2. Can I talk to the display?

I assert that the way that "detect" is used in the DRM core is for #1.

In theory one could try to conflate the two. Everyone keeps trying
until they think about it more. Probably because the signal is named
HPD and everyone reads that as "hot plug detect". Worst. Name. Ever.
In any case, here lies dragons. Specifically if you conflate these two
concepts then when do you know to provide power to the display?
Remember, you can't detect the display until it's powered. ...but why
would you power it if you thought it wasn't there? You could power it
once at bootup, but then if someone turns the display off how will you
ever know that you can power it back on? It'll look like the display
was removed...


> > * For eDP implementing get_edid() is done in the panel so that power
> > sequencing can be done properly. While it could have been designed
> > other ways, that's how we ended up in the end. Thus eDP controllers
> > don't implement get_edid().
>
> Ok. I guess eDP panels do what they want and the drivers cannot rely on
> the HPD.
>
> Or is the whole point here that because eDP panel drivers deal with the
> panel quirks, the get_edid() and also detect (if any) is handled by the
> eDP panel driver, and thus the bridge should not implement get_edid()
> nor detect() for eDP?

It gets down to making sure things are powered. If the eDP controller
implements get_edid() then the eDP controller needs to know how to
power on the panel in response to that get_edid(). Remember, this is
eDP and we have to _always_ say the panel is there even when HPD
hasn't been asserted. See the above rant^H^H^H^H explanation. While
it's possible to have the eDP controller call down the bridge chain to
power the panel temporarily for get_edid() (early patches of mine did
that), in the end we decided it made more sense to have this driven by
the panel driver.


> >> @@ -1163,10 +1165,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >>          pm_runtime_put_sync(pdata->dev);
> >>   }
> >>
> >> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> >> +{
> >> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >> +       int val = 0;
> >> +
> >> +       pm_runtime_get_sync(pdata->dev);
> >> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> >> +       pm_runtime_put_autosuspend(pdata->dev);
> >> +
> >> +       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> >> +                                        : connector_status_disconnected;
> >> +}
> >
> > I thought in the end we decided that you _could_ get a hot plug detect
> > interrupt if you just did a pm_runtime_get_sync() sometime earlier in
> > the case of DP. Basically you're just saying that if you're DP that
> > you always powered up. Doing some searches makes me find some
> > discussion at:
> >
> > https://lore.kernel.org/r/20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com
> >
> > Specifically, the right answer is: "In general the pm_runtime_get
> > reference need to go with the IRQ enabling"
> >
> > In any case, if we want to start with just implementing "detect"
> > that's OK with me...
>
> Yes, I have the HPD interrupt working in my branch, kind of. The problem
> is that with the HPD interrupt I encountered issues (even if the monitor
> was always connected): every now and then the dsi86 does not display
> anything and I get a spam of LOSS_OF_DP_SYNC_LOCK_ERR errors, and I
> couldn't figure out the problem. All the registers on the DSI source and
> DSI sink side looked identical, so it hints to some kind of race issue,
> which might well be there even with polling, but just doesn't seem to
> trigger.
>
> To make things worse, the board in question is a remote board and I
> can't actually test the HPD, i.e. plugging in and out the cable,
> changing the monitors, powering up/down the monitors, etc.
>
> On top of that, a few years back I had a lot of problems working on
> Cadence DP controller, dealing with all kinds of corner case race issues
> with DP HPD and trying to comply with the DP spec, which made me realize
> that DP is just really complex.
>
> So, I thought it's better if I just try to get a minimum version working
> so that we can have a picture on a monitor, without even trying to claim
> real HPD support.

Weird. OK. I guess we can see if someone later comes along and tries
to implement interrupt support. :-)

-Doug

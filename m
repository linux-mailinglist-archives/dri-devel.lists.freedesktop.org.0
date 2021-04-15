Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A4035FF2F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2D56E987;
	Thu, 15 Apr 2021 01:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0996E987
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 01:18:44 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id c123so18808017qke.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 18:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D57YEe3Guw0rkAcbubjcbs5fWzM1lNld8P0agFB2S84=;
 b=cr5pmWp5esXb0vQ1Eg6coHa/AeW5noxGZrUHDDSspfLXRjJgwNj5DmPNZRJIyUL4vs
 a8hVz3xdXlZLMn7Y2ZBeWXpzsBpC6s6YBjg7XrRutXLaiL4jCRLo32NxeA58hMizhCxn
 Cjec6/G1rbuCFNnzdgCqoqF2MsuNy9B71sxzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D57YEe3Guw0rkAcbubjcbs5fWzM1lNld8P0agFB2S84=;
 b=cYnBYk/ILnY+W9JtY0XrMHNe8pzghJrr6DAmykTEq6BYueT1LQZTMwdhNOcrzM8W89
 NHJUdDvlKo+LLI14h9KpuDTW+f7JhO/EVHEv0WcibRcNEnJA2wtyIAHiFpIjKxeXQBw7
 MDTYHF8mw9J2Htz+AvD7ettXJfim8czH/7NPoJq0Ll6D0hq22mpBwTElPOS7jE7EyHlX
 PSjlqUhYMNeTVd04CSM4T3BKkIJmwbhOcZaiJSP3hDwKeAlFWSh4FzyuShpvbOrz8TXh
 dTmI4qHGOWuVkzYuS0vRLbQXhCHQ2ee3L3QHrGU5UqW/8TYmASuLNqg/ogSE9q3xXhKs
 SAKA==
X-Gm-Message-State: AOAM5304bxVsbHquubC6YZOqDwMCLRyRWoPrpNmuq/MyrtXcTHaOFG31
 e+nyoeq916x7yK1/oIlmwjr57oq+lq3W+A==
X-Google-Smtp-Source: ABdhPJwAtKKOdH3tlHonMgKfW3mJVw/mVk/N9CjEryjwVVCCgCvmXaB+nIWwUNI/C2OMvQir53Se4A==
X-Received: by 2002:a05:620a:12f0:: with SMTP id
 f16mr1239968qkl.376.1618449522341; 
 Wed, 14 Apr 2021 18:18:42 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id l124sm909218qkf.31.2021.04.14.18.18.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 18:18:41 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id n12so24265766ybf.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 18:18:41 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr1114285ybb.257.1618449520411; 
 Wed, 14 Apr 2021 18:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b@eucas1p1.samsung.com>
 <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
 <8887ded7-d1ab-844c-e3a3-f39f6ef6264a@samsung.com>
 <CAD=FV=XJ5qtMDn5B431ObPS0JU3-P3755N7jzLZbbcc6XpqYtg@mail.gmail.com>
 <b3c08808-204c-6a3c-3e58-a2766985b5ef@samsung.com>
 <CAD=FV=WS8=hi07tA=t_5xOfPkb8TqY63A712uhJg4H8pUPCRJw@mail.gmail.com>
 <7bc4ce04-4110-8b8a-067b-824296b52480@samsung.com>
In-Reply-To: <7bc4ce04-4110-8b8a-067b-824296b52480@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Apr 2021 18:18:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UL7EiKE0djnfy4t1x-NKqAaaFcLL4c_NCY+2i9zYHMzA@mail.gmail.com>
Message-ID: <CAD=FV=UL7EiKE0djnfy4t1x-NKqAaaFcLL4c_NCY+2i9zYHMzA@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] drm/bridge: ti-sn65dsi86: Power things properly
 for reading the EDID
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Steev Klimaszewski <steev@kali.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 6, 2021 at 9:52 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Hello again after easter,

Sorry, I was out last week and I'm just getting back to this now.


> I have looked little bit more at sn65* driver and its application to
> have better background.
>
> I miss only info what panel do you have, how it is enabled/power controlled.

I am personally working on "sc7180-trogdor" boards right now
(arch/arm64/boot/dts/qcom/sc7180-trogdor*.dts). However I believe that
this patch series also enables proper EDID reading on
"sdm850-lenovo-yoga-c630.dts". That board, while also a Qualcomm
board, has completely different heritage than the trogdor ones. It's a
laptop that ships with Windows and (as far as I know) was designed
mostly independently.

On the trogdor boards the bridge has some power rails and an enable
line hooked up to it and the bridge itself can work when these rails
are turned on. The panel is on a separate power rail and you can't
talk to the panel at all until it's powered on and then asserts HPD to
us to say it finished its boot sequence.


> W dniu 01.04.2021 o 16:57, Doug Anderson pisze:
> > Hi,
> >
> > On Thu, Apr 1, 2021 at 4:12 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >>
> >> W dniu 31.03.2021 o 16:48, Doug Anderson pisze:
> >>> Hi,
> >>>
> >>> On Wed, Mar 31, 2021 at 4:08 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >>>> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> >>>>> eDP panels won't provide their EDID unless they're powered on. Let's
> >>>>> chain a power-on before we read the EDID. This roughly matches what
> >>>>> was done in 'parade-ps8640.c'.
> >>>>>
> >>>>> NOTE: The old code attempted to call pm_runtime_get_sync() before
> >>>>> reading the EDID. While that was enough to power the bridge chip on,
> >>>>> it wasn't enough to talk to the panel for two reasons:
> >>>>> 1. Since we never ran the bridge chip's pre-enable then we never set
> >>>>>       the bit to ignore HPD. This meant the bridge chip didn't even _try_
> >>>>>       to go out on the bus and communicate with the panel.
> >>>>> 2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
> >>>>>       if the panel wasn't on.
> >>>>>
> >>>>> One thing that's a bit odd here is taking advantage of the EDID that
> >>>>> the core might have cached for us. See the patch ("drm/edid: Use the
> >>>>> cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
> >>>>> by:
> >>>>> - Instantly failing aux transfers if we're not powered.
> >>>>> - If the first read of the EDID fails we try again after powering.
> >>>>>
> >>>>> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
> >>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>> ---
> >>>>> Depending on what people think of the other patches in this series,
> >>>>> some of this could change.
> >>>>> - If everyone loves the "runtime PM" in the panel driver then we
> >>>>>      could, in theory, put the pre-enable chaining straight in the "aux
> >>>>>      transfer" function.
> >>>>> - If everyone hates the EDID cache moving to the core then we can
> >>>>>      avoid some of the awkward flow of things and keep the EDID cache in
> >>>>>      the sn65dsi86 driver.
> >>>> I wonder if this shouldn't be solved in the core - ie caller of
> >>>> get_modes callback should be responsible for powering up the pipeline,
> >>>> otherwise we need to repeat this stuff in every bridge/panel driver.
> >>>>
> >>>> Any thoughts?
> >>> Yeah, I did look at this a little bit. Presumably it would only make
> >>> sense to do it for eDP connections since:
> >>>
> >>> a) The concept of reading an EDID doesn't make sense for things like MIPI.
> >> I guess you mean MIPI DSI
> > Yes, sorry! I'll try to be more clear.
> >
> >
> >> and yes I agree, more generally it usually(!)
> >> doesn't make sense for any setup with fixed display panel.
> >>
> >> On the other hand there are DSI/HDMI or DSI/DP adapters which usually
> >> have EDID reading logic.
> >>
> >> And the concept makes sense for most connectors accepting external
> >> displays: HDMI, DP, MHL, VGA...
> > So, actually, IMO the concept doesn't make sense for anything with an
> > external connector. Here's the logic for a handful of connectors:
> >
> > 1. MIPI DSI: there is no EDID so this doesn't make sense.
> >
> > 2. An external connector (HDMI, DP, etc): the display that's plugged
> > in is externally powered so doesn't need us to power it up to read the
> > EDID. By definition, when the HPD signal is asserted then it's OK to
> > read the EDID and we don't even know if a display is plugged in until
> > HPD is asserted. Thus no special power sequencing is needed to read
> > the EDID.  (Yes, we need to make sure that the eDP controller itself
> > is powered, but that doesn't seem like it's the core's business).
>
> Not true IMO, even if external device is powered on, you must enable
> EDID-reader logic.
>
> I guess it is not uncommon to have different power states for EDID
> reading and bridge/panel pre-enablement (especially in embedded world).
> In fact there are setups where EDID-reader is totally different device
> than the bridge itself, and these devices should be
> powered/enabled/operational only for time of EDID reading.

Right, I'm not saying that no components on the motherboard need to be
powered in order to read the EDID. I'm only saying that:

1. For external DP we can't know if the sink is there until HPD is asserted.

2. For external DP we have to provide some power to the sink _before_
the sync can assert HPD.

3. As soon as the sink asserts HPD (subject to debouncing rules) we
can immediately read the EDID as far as the sink is concerned

Said another way: we never get into a state with external DP where we
want to read an EDID of an unpowered sink because we don't even know
that the sink is there until it is powered and we can read the EDID
from it.

As far as powering up components on the motherboard goes, I think
that's a much simpler problem and I don't think we have to worry about
it here, do we? This falls squarely in the purvue of the bridge driver
itself or, if the DDC bus is some other i2c bus, it should be handled
by the normal methods.


> > 3. eDP: this is where it matters. This is because:
> >
> > 3a) eDP displays aren't powered all the time. If you just boot up or
> > you blank your screen, likely the display has no power at all.
> >
> > 3b) Because the display has no power, the "HPD" signal doesn't assert.
> > In fact, for eDP the "HPD" signal really should mean "display ready"
> > or "display finished powering up".
> >
> > 3c) Even though we never get a HPD signal, we still simply assume that
> > a display is present because this is an "embedded" device.
> >
> > So eDP is unique (as far as I know) in that it's a type of display
> > that has an EDID but that we will report "a display is here" before
> > we've powered up the display and before we can read the EDID.
> >
> >>> b) For something with an external connector (DP and HDMI) you don't
> >>> even know they're inserted unless the EDID is ready to read (these
> >>> devices are, essentially, always powered).
> >> Usually there are two elements which are not the same:
> >>
> >> 1. HotPlug signal/wire.
> >>
> >> 2. EDID reading logic.
> >>
> >> The logic responsible for reading EDID needs to be enabled only for time
> >> required for EDID reading :) So it's power state often must be
> >> controlled explicitly by the bridge driver. So even if in many cases
> >> pre_enable powers on the logic for EDID reading it does not make it the
> >> rule, so I must step back from my claim that it is up to caller :)
> > OK, I'll plan to keep it in the bridge chip driver now.
> >
> >
> >>> So I started off trying to do this in the core for eDP, but then it
> >>> wasn't completely clear how to write this code in a way that was super
> >>> generic. Specifically:
> >>>
> >>> 1. I don't think it's a 100% guarantee that everything is powered on
> >>> in pre-enable and powered off in post-disable. In this bridge chip
> >>> it's true, but maybe not every eDP driver? Would you want me to just
> >>> assume this, or add a flag?
> >> Ok, pre_enable should power on the chip, but for performing
> >> initialization of video transport layer. Assumption it will power on
> >> EDID logic is incorrect, so my claim seems wrong, but also this patch
> >> looks incorrect :)
> >>
> >> In general only device containing EDID logic knows how to power it up.
> > I still believe my patch is correct. Specifically I don't need to make
> > any assumptions about display elements upstream of me (sources of the
> > bridge chip). I only need to make assumptions about the pre-enable of
> > the bridge driver itself and anything downstream of it.
> >
> > At the moment downstream of this particular bridge chip is always a
> > panel device. Even further, all known downstream devices are
> > "simple-panel". That is known to power up the panel enough to read the
> > EDID in the "prepare" stage.
> >
> > Sure, someone _could_ add another bridge downstream in some design,
> > but it would be up to that person to either fix that downstream driver
> > to power itself in pre-enable or to add some type of quirk disabling
> > the EDID reading.
> >
> >
> >> Since I do not know your particular case I can propose few possible ways
> >> to investigate:
> >>
> >> - call bridge.next->get_modes - you leave responsibility for powering up
> >> to the downstream device.
> > The "next" bridge is the panel, so I don't think this works.
>
>
> Then drm_panel_get_modes will work then.
>
> >> - ddc driver on i2c request should power up the panel - seems also correct,
> > Right, so I could put the
> > "drm_bridge_chain_pre_enable(&pdata->bridge)" into the
> > ti_sn_aux_transfer() function. I talked about that a little bit "after
> > the cut" in my post where I said:
> >
> >> - If everyone loves the "runtime PM" in the panel driver then we
> >>    could, in theory, put the pre-enable chaining straight in the "aux
> >>    transfer" function.
> > The reason for the dependence on "runtime PM" in the panel driver is
> > that we are doing DDC over AUX and it breaks the EDID reading into
> > lots of chunks so if we did the powering up and powering down there it
> > would be crazy slow without the delayed poweroff.
>
>
> OK, it resembles to me DSI-controlled panel - to query/configure panel
> panel driver asks DSI-host to transfer some bytes to the panel and/or
> back via DSI-bus.
>
> In case of eDP panels we could do similar thing to read edid - we call
> drm_panel_get_modes - it calls drm_panel_funcs.get_modes callback and it
> decides (based on DT) if it should fill modes according to hardcoded
> info into the driver or to ask the physical panel via DP-controller -
> this way all the players (the panel, AUX/DDC device) will know what to
> power-up.
>
> I guess there is missing pieces - there is no DP bus :), I am not sure
> if there is straight way to access panel's aux/ddc from the panel
> driver, maybe somehow via drm_connector ???
>
> Of course this only my idea - to be discussed with others.

OK, I can see how this could work. At least in simple-panel there is
already a "ddc-i2c-bus" property that can be used to give the panel
access to the DDC bus. Today, when simple-panel tries to use this, it
_doesn't_ power on the panel first. I'm not sure how/why that works. I
guess maybe it doesn't actually work (you run with a hardcoded mode
the first time?) or all the current users have panels where you can
always read the EDID? We could probably co-opt this and, possibly, add
a boolean property in the simple-panel struct saying whether a panel
needs to be turned on to read its modes?

One issue, though, is that we're going to end up with the
chicken-and-egg problem again. The bridge chip provides the DDC bus at
"attach" time. The panel won't probe until the DDC bus is there. The
bridge chip won't probe (and certainly won't attach) until the panel
is there.

OK, so as I was writing this it looks like Laurent responded too...
So I think Laurent is saying that keeping the EDID reading in the
bridge chip (like I'm doing) is fine. I was debating this a bit with
myself this afternoon...

Part of me thought: there's no reason to reorganize the world to solve
the chicken-and-egg problem. The bridge chip can read the EDID fine
and I think that for this bridge chip it's pretty easy to argue that
after pre-enable of the bridge (and anything after it) that it's valid
to read the EDID. Yes, you could organize it like you said but I
wasn't sure the advantages. It felt like the bridge chip chaining was
designed specifically so that the EDID reading could be in the bridge
like I was doing...

...but then another part of me was thinking about another patch series
that was just sent out:

https://lore.kernel.org/r/1618418390-15055-1-git-send-email-rajeevny@codeaurora.org/

In that patch series we need to figure out how to control the
backlight of a panel which requires DDC transactions to happen. It
might (?) make sense to have that backlight control in the panel
driver (maybe?) and doing so would require exposing the "ddc" bus to
the panel driver. Once you start thinking of doing that then Andrzej's
proposal maybe makes more sense? I'm definitely looking for guidance
here.

I did try to prototype up Andrzej's and I feel like I was close but
there was still a bug or two, and my chicken-and-egg solution was a
big hack, too. I'll plan to keep poking at it tomorrow unless you say
I shouldn't.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

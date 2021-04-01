Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AFA3515D4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 17:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3911D6E199;
	Thu,  1 Apr 2021 15:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE166E199
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 15:05:40 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id b5so1353608vsl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nCK+9gyhJ+QTOf23dV8336ka6cbFD0kpJr3qSmWMf/A=;
 b=a12ULmvhqA5tQeB47VPUgbZnQyq/OtOTne66EZZHLr6NeodGaZ1M9FdCCRPYJi67YL
 D9rtL73mcziJjG8xq7Knwil1/c5HvTK5XiEhLltYFWA0e7Rl2k8taKVFkKwuAX5oq5Ui
 Zk6m74paHw+LzBRqvEVUgjxIFclMSvtMVwuHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nCK+9gyhJ+QTOf23dV8336ka6cbFD0kpJr3qSmWMf/A=;
 b=DrK8imTkzwL5Y1jm4uzOYylNQXtPNWF9Ju0peCVMX5Mf8oOH7ycTTHLeRPTWz3e8gk
 OVitRrAqJDrgW5/PL5YFYjOswmT/lWgzZ2d2t7Xry59zrmGyXB08wSDQ15N8+3Gc9E6r
 hLthKgw7+/qQM0NDeu0n04yMXZ/RK0enkSgjmyQs/Aa02ec9mu+5an/ASqiritay22Dr
 NmgEwIZ5iWBKHqc8K+oDnbnqjkOGWJtCHklKFvzn+KcX3SltxziOmLi3ES/arvlzzFxm
 OtJflEsTETMCuJtXIaCDCCZK7YhBujIIFup6w9FF9ewfpeO/44oM30XsKrBhxAO8p9J8
 +ctA==
X-Gm-Message-State: AOAM532dsTOhX4md3tnfAFqhkMKOfFTRGHxjKLS2Lls0jVuLZi9fZrrf
 ge+iuJ3vARzGqHEhT+aNC9GPTUEt6QcvAg==
X-Google-Smtp-Source: ABdhPJxXnSykGMQAeqNYiKjJyQeZLNBTuEvRHwvy0T0eX7mnJsb3YEc9QNlcPRj20wCSFk6ayGsLhQ==
X-Received: by 2002:a67:ecd8:: with SMTP id i24mr5310214vsp.8.1617289539123;
 Thu, 01 Apr 2021 08:05:39 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id m19sm623546vsa.4.2021.04.01.08.05.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:05:38 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id b7so592364uam.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:05:38 -0700 (PDT)
X-Received: by 2002:a25:8712:: with SMTP id a18mr6421390ybl.79.1617289064490; 
 Thu, 01 Apr 2021 07:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b@eucas1p1.samsung.com>
 <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
 <8887ded7-d1ab-844c-e3a3-f39f6ef6264a@samsung.com>
 <CAD=FV=XJ5qtMDn5B431ObPS0JU3-P3755N7jzLZbbcc6XpqYtg@mail.gmail.com>
 <b3c08808-204c-6a3c-3e58-a2766985b5ef@samsung.com>
In-Reply-To: <b3c08808-204c-6a3c-3e58-a2766985b5ef@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Apr 2021 07:57:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WS8=hi07tA=t_5xOfPkb8TqY63A712uhJg4H8pUPCRJw@mail.gmail.com>
Message-ID: <CAD=FV=WS8=hi07tA=t_5xOfPkb8TqY63A712uhJg4H8pUPCRJw@mail.gmail.com>
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

On Thu, Apr 1, 2021 at 4:12 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 31.03.2021 o 16:48, Doug Anderson pisze:
> > Hi,
> >
> > On Wed, Mar 31, 2021 at 4:08 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >>
> >> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> >>> eDP panels won't provide their EDID unless they're powered on. Let's
> >>> chain a power-on before we read the EDID. This roughly matches what
> >>> was done in 'parade-ps8640.c'.
> >>>
> >>> NOTE: The old code attempted to call pm_runtime_get_sync() before
> >>> reading the EDID. While that was enough to power the bridge chip on,
> >>> it wasn't enough to talk to the panel for two reasons:
> >>> 1. Since we never ran the bridge chip's pre-enable then we never set
> >>>      the bit to ignore HPD. This meant the bridge chip didn't even _try_
> >>>      to go out on the bus and communicate with the panel.
> >>> 2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
> >>>      if the panel wasn't on.
> >>>
> >>> One thing that's a bit odd here is taking advantage of the EDID that
> >>> the core might have cached for us. See the patch ("drm/edid: Use the
> >>> cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
> >>> by:
> >>> - Instantly failing aux transfers if we're not powered.
> >>> - If the first read of the EDID fails we try again after powering.
> >>>
> >>> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>> Depending on what people think of the other patches in this series,
> >>> some of this could change.
> >>> - If everyone loves the "runtime PM" in the panel driver then we
> >>>     could, in theory, put the pre-enable chaining straight in the "aux
> >>>     transfer" function.
> >>> - If everyone hates the EDID cache moving to the core then we can
> >>>     avoid some of the awkward flow of things and keep the EDID cache in
> >>>     the sn65dsi86 driver.
> >>
> >> I wonder if this shouldn't be solved in the core - ie caller of
> >> get_modes callback should be responsible for powering up the pipeline,
> >> otherwise we need to repeat this stuff in every bridge/panel driver.
> >>
> >> Any thoughts?
> > Yeah, I did look at this a little bit. Presumably it would only make
> > sense to do it for eDP connections since:
> >
> > a) The concept of reading an EDID doesn't make sense for things like MIPI.
>
> I guess you mean MIPI DSI

Yes, sorry! I'll try to be more clear.


> and yes I agree, more generally it usually(!)
> doesn't make sense for any setup with fixed display panel.
>
> On the other hand there are DSI/HDMI or DSI/DP adapters which usually
> have EDID reading logic.
>
> And the concept makes sense for most connectors accepting external
> displays: HDMI, DP, MHL, VGA...

So, actually, IMO the concept doesn't make sense for anything with an
external connector. Here's the logic for a handful of connectors:

1. MIPI DSI: there is no EDID so this doesn't make sense.

2. An external connector (HDMI, DP, etc): the display that's plugged
in is externally powered so doesn't need us to power it up to read the
EDID. By definition, when the HPD signal is asserted then it's OK to
read the EDID and we don't even know if a display is plugged in until
HPD is asserted. Thus no special power sequencing is needed to read
the EDID.  (Yes, we need to make sure that the eDP controller itself
is powered, but that doesn't seem like it's the core's business).

3. eDP: this is where it matters. This is because:

3a) eDP displays aren't powered all the time. If you just boot up or
you blank your screen, likely the display has no power at all.

3b) Because the display has no power, the "HPD" signal doesn't assert.
In fact, for eDP the "HPD" signal really should mean "display ready"
or "display finished powering up".

3c) Even though we never get a HPD signal, we still simply assume that
a display is present because this is an "embedded" device.

So eDP is unique (as far as I know) in that it's a type of display
that has an EDID but that we will report "a display is here" before
we've powered up the display and before we can read the EDID.


> > b) For something with an external connector (DP and HDMI) you don't
> > even know they're inserted unless the EDID is ready to read (these
> > devices are, essentially, always powered).
>
> Usually there are two elements which are not the same:
>
> 1. HotPlug signal/wire.
>
> 2. EDID reading logic.
>
> The logic responsible for reading EDID needs to be enabled only for time
> required for EDID reading :) So it's power state often must be
> controlled explicitly by the bridge driver. So even if in many cases
> pre_enable powers on the logic for EDID reading it does not make it the
> rule, so I must step back from my claim that it is up to caller :)

OK, I'll plan to keep it in the bridge chip driver now.


> > So I started off trying to do this in the core for eDP, but then it
> > wasn't completely clear how to write this code in a way that was super
> > generic. Specifically:
> >
> > 1. I don't think it's a 100% guarantee that everything is powered on
> > in pre-enable and powered off in post-disable. In this bridge chip
> > it's true, but maybe not every eDP driver? Would you want me to just
> > assume this, or add a flag?
>
> Ok, pre_enable should power on the chip, but for performing
> initialization of video transport layer. Assumption it will power on
> EDID logic is incorrect, so my claim seems wrong, but also this patch
> looks incorrect :)
>
> In general only device containing EDID logic knows how to power it up.

I still believe my patch is correct. Specifically I don't need to make
any assumptions about display elements upstream of me (sources of the
bridge chip). I only need to make assumptions about the pre-enable of
the bridge driver itself and anything downstream of it.

At the moment downstream of this particular bridge chip is always a
panel device. Even further, all known downstream devices are
"simple-panel". That is known to power up the panel enough to read the
EDID in the "prepare" stage.

Sure, someone _could_ add another bridge downstream in some design,
but it would be up to that person to either fix that downstream driver
to power itself in pre-enable or to add some type of quirk disabling
the EDID reading.


> Since I do not know your particular case I can propose few possible ways
> to investigate:
>
> - call bridge.next->get_modes - you leave responsibility for powering up
> to the downstream device.

The "next" bridge is the panel, so I don't think this works.


> - ddc driver on i2c request should power up the panel - seems also correct,

Right, so I could put the
"drm_bridge_chain_pre_enable(&pdata->bridge)" into the
ti_sn_aux_transfer() function. I talked about that a little bit "after
the cut" in my post where I said:

> - If everyone loves the "runtime PM" in the panel driver then we
>   could, in theory, put the pre-enable chaining straight in the "aux
>   transfer" function.

The reason for the dependence on "runtime PM" in the panel driver is
that we are doing DDC over AUX and it breaks the EDID reading into
lots of chunks so if we did the powering up and powering down there it
would be crazy slow without the delayed poweroff.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

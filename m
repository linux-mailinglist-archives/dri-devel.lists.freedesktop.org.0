Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5E3502A4
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 16:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796D06EAB5;
	Wed, 31 Mar 2021 14:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CC46EAB5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 14:48:20 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id i19so14595133qtv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3lwR7HXndtvl1w7O6ZpDHif+FQe2GlWLZc8UMd7kr0w=;
 b=Q5gB522Cib9/yr2J2bN+e8A1FXsZWvmP2Me2QWawupdm+sCa3WkCW71rbPYdbEelXU
 o3S3qH2G76n8cjtY2HV8faFVosUovgnrTf1IBz9Xn5ajC7Jm8KubPmM93fU+T3oL7RwE
 5BrtIGKHxKZdSxirTzZE+F8UgLfdOrkDS6KjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3lwR7HXndtvl1w7O6ZpDHif+FQe2GlWLZc8UMd7kr0w=;
 b=f8B/1hPQ3DH254teZsM01jhuVTXhzvl+nwaTmnPswHFaM+H2mlE6uzkhuDQC3HvmIe
 b6uuqadBPmNEfvjQpKefXhyWRGF7Kb0fZphFDZtg3V2+tYf2B4bwV9SV5WnQ43BO3Osc
 +vDqT5J+lA5zDbkIxoLxvwm7tV/g/gWCAd6OVQN8kZt7gfiSbRWqiljZoYfTGkmnTe0a
 AkMi6hF5/0cNsuZk18e5VGIWcldzKpZPcwuGYpgCIyJJoI0JYTVyRrqUtyVj9evvOoSN
 uICbdsxWgoTfCasRQ16qwGUqNaCI+2/OaRxTXfsE+jdLzTSb3qgIwtP9xjvxeJ0zAluh
 bCew==
X-Gm-Message-State: AOAM5304flZzNgta/+dQHGhNPnwp9LrHet/qCy5hX5tC9TDEWP7LAGdL
 6F+KmNnJKGTbjn2zHVBYaVkVhsMlIiHoLQ==
X-Google-Smtp-Source: ABdhPJw6C1gS/L2gE0UglP7iX/U5plr1OUf7xkg/uuGHkHM4EjPBhYC7D8WofrDYTretb7wt365ixg==
X-Received: by 2002:ac8:7f53:: with SMTP id g19mr2714565qtk.249.1617202099175; 
 Wed, 31 Mar 2021 07:48:19 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
 by smtp.gmail.com with ESMTPSA id a20sm1588201qkg.61.2021.03.31.07.48.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 07:48:17 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id g38so21400894ybi.12
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 07:48:17 -0700 (PDT)
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr4829154ybv.79.1617202097234; 
 Wed, 31 Mar 2021 07:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <CGME20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b@eucas1p1.samsung.com>
 <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
 <8887ded7-d1ab-844c-e3a3-f39f6ef6264a@samsung.com>
In-Reply-To: <8887ded7-d1ab-844c-e3a3-f39f6ef6264a@samsung.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 07:48:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJ5qtMDn5B431ObPS0JU3-P3755N7jzLZbbcc6XpqYtg@mail.gmail.com>
Message-ID: <CAD=FV=XJ5qtMDn5B431ObPS0JU3-P3755N7jzLZbbcc6XpqYtg@mail.gmail.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 4:08 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> > eDP panels won't provide their EDID unless they're powered on. Let's
> > chain a power-on before we read the EDID. This roughly matches what
> > was done in 'parade-ps8640.c'.
> >
> > NOTE: The old code attempted to call pm_runtime_get_sync() before
> > reading the EDID. While that was enough to power the bridge chip on,
> > it wasn't enough to talk to the panel for two reasons:
> > 1. Since we never ran the bridge chip's pre-enable then we never set
> >     the bit to ignore HPD. This meant the bridge chip didn't even _try_
> >     to go out on the bus and communicate with the panel.
> > 2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
> >     if the panel wasn't on.
> >
> > One thing that's a bit odd here is taking advantage of the EDID that
> > the core might have cached for us. See the patch ("drm/edid: Use the
> > cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
> > by:
> > - Instantly failing aux transfers if we're not powered.
> > - If the first read of the EDID fails we try again after powering.
> >
> > Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Depending on what people think of the other patches in this series,
> > some of this could change.
> > - If everyone loves the "runtime PM" in the panel driver then we
> >    could, in theory, put the pre-enable chaining straight in the "aux
> >    transfer" function.
> > - If everyone hates the EDID cache moving to the core then we can
> >    avoid some of the awkward flow of things and keep the EDID cache in
> >    the sn65dsi86 driver.
>
>
> I wonder if this shouldn't be solved in the core - ie caller of
> get_modes callback should be responsible for powering up the pipeline,
> otherwise we need to repeat this stuff in every bridge/panel driver.
>
> Any thoughts?

Yeah, I did look at this a little bit. Presumably it would only make
sense to do it for eDP connections since:

a) The concept of reading an EDID doesn't make sense for things like MIPI.

b) For something with an external connector (DP and HDMI) you don't
even know they're inserted unless the EDID is ready to read (these
devices are, essentially, always powered).

So I started off trying to do this in the core for eDP, but then it
wasn't completely clear how to write this code in a way that was super
generic. Specifically:

1. I don't think it's a 100% guarantee that everything is powered on
in pre-enable and powered off in post-disable. In this bridge chip
it's true, but maybe not every eDP driver? Would you want me to just
assume this, or add a flag?

2. It wasn't totally clear to me which state to use for telling if the
bridge had already been pre-enabled so I could avoid double-calling
it. I could dig more if need be but I spent a bit of time looking and
was coming up empty. If you have advice I'd appreciate it, though.

3. It wasn't clear to me if I should be using the atomic version
(drm_atomic_bridge_chain_pre_enable) if I put this in the core and how
exactly to do this, though I am a self-admitted DRM noob. I can do
more digging if need be. Again, advice is appreciated.

4. Since I got feedback that the EDID caching belongs in the driver,
not in the core [1] then we might end up powering things up
pointlessly since the core wouldn't know if the driver was going to
return the cache or not.

Given that this patch isn't too much code and not too complicated (and
will be even less complicated if I move the EDID caching back into the
driver), maybe we can land it and if we see the pattern repeat a bunch
more times then think about moving it to the core?


[1] https://lore.kernel.org/dri-devel/YGMvO3PNDCiBmqov@intel.com/

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

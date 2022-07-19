Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A85579FEC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 15:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534D110FBC7;
	Tue, 19 Jul 2022 13:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA4910F624
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 13:46:02 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id mf4so27289027ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/fONPX+6aYrYpHaErN2a6d0U17SNseybDGx+QMO+6k=;
 b=o5XCgjWtgai8HwvJ0H4vs1RRX+aPKoRCeVKfelI5PCpIc/1skjvN4e4RHMRitVKI4c
 ssDXspMW42jewnQosnlfgc/8YWHjeyH5qrEqUqaWeH6RmG65lSZFMkWjMejqLn1bJmwZ
 Ew91QeRd6Zw/cYcQTy2V0/avAdA550cnBF3PQV7HIf2qJNKWaNH5G3SkKUlxC9+krlQu
 uKbIgD/aunWflkqcs8iYww43J9J2c3u1GbXeF6uPztqORJQ+yLmgLXpfpgYiSTTY33iq
 SxaTzIvLGH9tAKxZfpBMyK+f0+dijQ7ppa5srgkY3s6TSwCkpCpWkViTmcvv0PyKQ0Aw
 T2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/fONPX+6aYrYpHaErN2a6d0U17SNseybDGx+QMO+6k=;
 b=QcFIUvJWL6GVJlBDeMYzJ2+A4R0LqcC1o7oZ66AOX5VDT8f2fMXQGHv+Q4loQKnRrj
 4qprMRi2W1nKeN65ci6kDT2zF6zJDkbSILniyqevfWWZYmjEcF/V0dF1JuTUvsxRi6m/
 638dxiX6jC5yJ5ImyJ6Y/xODfp9n2iWV7eJb48Qw6KBoywlgI0XOj5DZUfxal6R1Aaod
 VAQ22Qfm3kGoUDVTKqTv5iYOTaYrjnK+x59i6UiyEHFco1qMWZmGmfmj071xzAbVsj27
 CVw6xlEMZeEnlUvWk/76be6vLVFGEY9Zed0QoXldbINFlKzVvQ+w8X+5XGbTAu4sO5IF
 ErLg==
X-Gm-Message-State: AJIora9w7cB28Bptc4bjqU0dFrdhqNGd7fSLNlDmJOIKrplMADZ0e43j
 lZ53mD1Z5VvBjMwx8cdqLM0sfSJZ+eSJV8YrZ0tOwQ==
X-Google-Smtp-Source: AGRyM1szBcaG7dV9LVbx3Awr0LzEDxYalQAkkAUMkmoiPz3oNZtlh8MEe6QPEMh5rX6ryz+ctV1mdCGPdgyUuXtmkWY=
X-Received: by 2002:a17:907:2718:b0:72b:6b65:37dc with SMTP id
 w24-20020a170907271800b0072b6b6537dcmr30477332ejk.425.1658238360362; Tue, 19
 Jul 2022 06:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <YtXIEg0rRZLLYS75@ravnborg.org>
In-Reply-To: <YtXIEg0rRZLLYS75@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 14:45:43 +0100
Message-ID: <CAPY8ntCfXuZ6nPcJ77FLP5bgdcbXOeh-7rieb5PS-7oPFg7xnQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam

On Mon, 18 Jul 2022 at 21:52, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dave,
>
> a long overdue reply on this series.
>
> On Fri, Mar 04, 2022 at 03:17:55PM +0000, Dave Stevenson wrote:
> > Hi All
> >
> > Changes from v1:
> > - New patch to refactor drm_bridge_chain_post_disable and drm_bridge_chain_pre_enable
> >   to reuse drm_atomic_bridge_chain_post_disable / drm_atomic_bridge_chain_pre_enable
> >   but with a NULL state.
> > - New patch that adds a pre_enable_upstream_first to drm_panel.
> > - changed from an OPS flag to a bool "pre_enable_upstream_first" in drm_bridge.
> > - Followed Andrzej's suggestion of using continue in the main loop to avoid
> >   needing 2 additional loops (one forward to find the last bridge wanting
> >   upstream first, and the second backwards again).
> > - Actioned Laurent's review comments on docs patch.
> >
> > Original cover letter:
> >
> > Hopefully I've cc'ed all those that have bashed this problem around previously,
> > or are otherwise linked to DRM bridges.
> >
> > There have been numerous discussions around how DSI support is currently broken
> > as it doesn't support initialising the PHY to LP-11 and potentially the clock
> > lane to HS prior to configuring the DSI peripheral. There is no op where the
> > interface is initialised but HS video isn't also being sent.
> > Currently you have:
> > - peripheral pre_enable (host not initialised yet)
> > - host pre_enable
> > - encoder enable
> > - host enable
> > - peripheral enable (video already running)
> >
> > vc4 and exynos currently implement the DSI host as an encoder, and split the
> > bridge_chain. This fails if you want to switch to being a bridge and/or use
> > atomic calls as the state of all the elements split off are not added by
> > drm_atomic_add_encoder_bridges.
>
> A typically chain looks like this:
>
> CRTC => Encoder => Bridge A => Bridge B
>
> We have in DRM bridges established what is the "next" bridge - indicated
> with the direction of the arrows in the drawing.
>
> This set of patches introduces the concept of "upstream" bridges.
>
> pre_enable_prev_bridge_first would be easier to understand as it uses
> the current terminology.
> I get that "upstream" is used in the DSI specification - but we are
> dealing with bridges that happens to support DSI and more, and mixing
> the two terminologies is not good.
>
> Note: Upstream is also used in a bridge doc section - here it should
>       most likely be updated too.

Sure, I have no issues with switching to prev/next from upstream/downstream.
To the outsider it can be confusing - in pre_enable and disable, the
next bridge to be called is the previous one. At least it is
documented.

> The current approach set a flag that magically makes the core do something
> else. Have you considered a much more explicit approach?
>
> A few helpers like:
>
>         drm_bridge_pre_enable_prev_bridge()
>         drm_bridge_enable_prev_bridge()
>         drm_bridge_disable_prev_bridge()
>         drm_bridge_post_disable_prev_bridge()

No point in drm_bridge_enable_prev_bridge() and
drm_bridge_post_disable_prev_bridge() as the call order down the chain
will mean that they have already been called.
drm_bridge_enable_next_bridge() and
drm_bridge_post_disable_next_bridge() possibly.

> And then update the core so the relevant function is only called once
> for a bridge.
> Then the need for DSI lanes in LP-11 can be archived by a call to
>
>         drm_bridge_pre_enable_prev_bridge()

Unfortunately it gets ugly with post_disable.
The DSI host controller post_disable will have been called before the
DSI peripheral's post_disable, and there are conditions where the
peripheral needs to send DSI commands in post_disable (eg
panel-asus-z00t-tm5p5-n35596 [1]). Changing all DSI hosts to call
drm_bridge_post_disable_next_bridge feels like the wrong thing to do.
There are currently hacks in dw-mipi-dsi that do call the next
panel/bridge post_disable [2] and it would be nice to get rid of them.
Currently the calls aren't tracked for state, so you end up with
post_disable being called twice, and panels having to track state (eg
jdi_lt070me050000 [3]).

[1] tm5p5_nt35596_unprepare() calls tm5p5_nt35596_off()
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c#L107
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L889
[3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c#L44

> This is more explicit than a flag that triggers some magic behaviour.
> It may even see uses we have not realised yet.

Personally it feels like more boilerplate in almost all DSI drivers,
and generally I see a push to remove boilerplate.

> It is late here - so maybe the above is not a good idea tomorrow - but
> right now I like the simplicity of it.
>
> Other than the above I read that a mipi_dsi_host_init() is planned,
> which is also explicit and simple - good.

It's been raised, but the justification for most use cases hasn't been
made. The Exynos conversion looks to be doing the wrong thing in
checking state, and that's why it is currently needing it.
Again it's also more boilerplate.

TC358767 is an odd one as it wants the DSI interface enabled very
early in order to have a clock for the DP aux channel well before
video is running. I had a thought on that, but It looks like I haven't
hit send on a reply to Lucas on that one - too many distractions.

> Have we seen a new revision of some of these?
> Chances are high that I have missed it then.

No, still on V2. Other than Dmitry's comment over updating
parade-ps8640 and dropping drm_bridge_chain_*, no real comments had
been made.

  Dave

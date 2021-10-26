Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C4643A963
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6626E0FF;
	Tue, 26 Oct 2021 00:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F107D6E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:45:06 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso290910pjt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xQ1OrVCbGCVV5oWohccFx71BLSpPgX7Blm3VuI0GzyM=;
 b=g3p4boJ1pHhnG+QH8WPAZATY7m761MFfrJO4ifiyWecAougt5n2QvAcQEmx3lfXLkS
 F684tafJDhiUww16/wKyIfL4XYb9pKtT34K8l+Lk/GdKYp71Z+YhlsPDwwP/aZhtlXZf
 Zm+XIEOX9MPU4BgAivw6VO/PvH0PaxG1eue1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xQ1OrVCbGCVV5oWohccFx71BLSpPgX7Blm3VuI0GzyM=;
 b=4sFfZnQFw/gskUnZna6mOMW9ASTkrJ4X1XN9lLD+XCixAOajt6IFpaZ3vtB7MwTB8h
 8goXNBrZ6hutbXqrpxfYcMs7DRgtWUMySNAwZN8GL49+eiOc0ur1BcDEM/Z5UZ3j4i6x
 0RTSL+Oh85CC+yWY4Go53gTrWcdW1tEOBCdHqCUCFdsAWROrZQr0b6wgn8j+26ydSTcv
 6hj4m3ihKekMmcqwcSdnk4Jx0CS0IkYCkgH8krPTXRHkMrFytLENh5xofAPmat8NTdAa
 i76I1XlPJAvo/2/u4cYvsgHdpEzCfA2Aa2599bepf3G/b6JRXFsETjpeqcwZWPqaNzh1
 PRYg==
X-Gm-Message-State: AOAM531+O3Uej+IQ98PT4C+jETuCFFPK/ppFT2OT/8euR1pr3lFmIwJB
 Hb1kA6al34qPCoQbW7Wj0j7jqrp+3Y8=
X-Google-Smtp-Source: ABdhPJxhUhZ/MBHzBYFOc69lEjeDSooYIErVHoYW1n2yDBzpoYVl6r/vB7iqae3/KipbVWcQ1t445Q==
X-Received: by 2002:a17:902:ec82:b0:13f:663c:87cc with SMTP id
 x2-20020a170902ec8200b0013f663c87ccmr19530801plg.24.1635209106258; 
 Mon, 25 Oct 2021 17:45:06 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172])
 by smtp.gmail.com with ESMTPSA id m2sm17235347pgd.70.2021.10.25.17.45.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 17:45:06 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id g184so12376323pgc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:45:06 -0700 (PDT)
X-Received: by 2002:a6b:ee10:: with SMTP id i16mr2460605ioh.98.1635208634774; 
 Mon, 25 Oct 2021 17:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
 <YXHLrnAliqxmrrho@ravnborg.org>
 <cdcd19de-19e6-83ed-606f-defebdcc0997@intel.com>
 <YXaTJ+bwm7vSTGpv@pendragon.ideasonboard.com>
 <0e17993d-1e9f-2673-7fee-abf3787de431@intel.com>
In-Reply-To: <0e17993d-1e9f-2673-7fee-abf3787de431@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Oct 2021 17:37:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UVtjz4Bh82PekoiS8VQciWro4ADGxm7R_e+HX8o7rDnw@mail.gmail.com>
Message-ID: <CAD=FV=UVtjz4Bh82PekoiS8VQciWro4ADGxm7R_e+HX8o7rDnw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Fix the bridge chain order for pre_enable /
 post_disable
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Philip Chen <philipchen@chromium.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Jagan Teki <jagan@amarulasolutions.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>
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

On Mon, Oct 25, 2021 at 1:12 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
> >>>> This can be important when using the DP AUX bus to instantiate a
> >>>> panel. The DP AUX bus is likely part of a bridge driver and is a
> >>>> parent of the panel. We'd like the bridge to be pre_enabled before the
> >>>> panel and the panel to be post_disabled before the
> >>>> bridge. Specifically, this allows pm_runtime_put_sync_suspend() in a
> >>>> bridge driver's post_suspend to work properly even a panel is under
> >>>> it.

So with further thought, I _think_ I actually have a solution to my
problem at hand (pm_runtime_put_sync_suspend() is returning -EBUSY in
the ps8640 bridge driver with Philip's most recent patches). I need to
get access to the hardware to test it, but I suspect that the bridge
driver just needs this in its probe:

pm_suspend_ignore_children(dev, true);

Basically I think we just need to tell PM Runtime to "butt out" and
not try to manage power between the bridge driver and the panel even
though there's a parent-child relationship between them (when you use
DP AUX bus).

If that works then the urgency of this problem goes _way_ down for me.
While it still seems like we could run into problems at least they
won't be affecting me anymore in the short term.


> >>>> NOTE: it's entirely possible that this change could break someone who
> >>>> was relying on the old order. Hopefully this isn't the case, but if
> >>>> this does break someone it seems like it's better to do it sonner
> >>>> rather than later so we can fix everyone to handle the order that
> >>>> makes the most sense.
> >> It will break for sure. So the question is: if it is worth changing?
> >>
> >> New order seems good for eDP, DSI sinks [1], probably other as well.
> >>
> >> Old order is better for example for THC63LVD1024 [2 p. 20], I guess for
> >> many other sinks as well.
> >>
> >> I am not even sure if it is protocol specific (LVDS, RGB, HDMI,...), or
> >> it depends on specific hw pairs (source->sink).
> >>
> >> This is why I complain about the bridge chain - assumption that one
> >> fixed call order will work for all setups seems to me ridiculous.
> >>
> >> Going back to the question - changing the order from fixed one to
> >> another fixed one will not solve general issue.
> >>
> >> What can we do then?
> >>
> >> 1. Configurable call order? Probably doable: every chain element should
> >> expose info if it's call should be before or after source, then some
> >> core helper will create queue of callbacks. Seems quite complicated,
> >> hides the logic from implementer and not fully flexible (for example,
> >> there are protocols which require to perform sth on source, then on
> >> sink, then again on the source).
> >>
> >> 2. Stop using bridge chain and call sink ops directly from the source
> >> (this is what Exynos and VC4 do): is flexible and straightforward, gives
> >> full control to the source.
> > And breaks interoperability, because different sources end up calling
> > operations in different orders. We end up having different sinks that
> > expect calls in different ways, and divide the world in sink/source
> > groups that don't interoperate :-(
>
>
> I have an impression you describe current status :) More seriously, it
> is matter of proper specification/documentation/implementations of the
> operations. If we really need strict constraints we could try to
> implement them on protocol level.
>
>
> >
> >> 3. Use different abstractions to enforce proper initialization order
> >> (like extending mipi_dsi_host_ops): requires existence of transport bus
> >> abstraction (only DSI at the moment(?)).
> > A real bus seems overkill, but we could have drm_bridge operations
> > specific to particular hardware interfaces.
> >
> >> ... other ideas?
> > I don't like it because of the amount of work it would require to switch
> > to such a model, but I'm really starting to think that a variation of
> > the second option would be best, where the sink controls the source
> > instead of having the source controlling the sink. It's the sink that
> > knows about its enabling/disabling sequence, and about how the source
> > needs to be controlled to match it.
>
>
> I am afraid it depends on the protocol and cross-calls (source->sink,
> sink->source) can be hard to avoid in case of some protocols.

I'll continue to point out that I'm wearing a noob hat on my head (so
take my opinions for what they're worth), but I'm biased towards
somehow sticking with the existing "bridge chains" just because it
feels like re-designing everything is not something that will get done
in a reasonable time frame. I'm not saying that it's not worth doing
(I have no idea!) and if there's someone who has the vision for it and
wants to make it work then great! ...but personally it would be a bit
much.

How about this as a proposal if it's not too ugly:

1. Add two new bridge functions: after_pre_enable() and
before_post_disable(). Yeah, I don't like the names much either, so
yell if you have better ones.

2. The existing drm_atomic_bridge_chain_pre_enable() /
drm_bridge_chain_pre_enable() (until it's deleted) will call BOTH
pre_enable() and after_pre_enable()

3. The existing drm_atomic_bridge_chain_post_disable() /
drm_bridge_chain_post_disable() (until it's deleted) will call BOTH
before_post_disable() and post_disable()

4. The order for calls for after_pre_enable() and
before_post_disable() will match the "enable" calls.

Writing it out:

pre_enable:          start from connector and move to encoder
after_pre_enable:    start from encoder and move to connector
enable:              start from encoder and move to connector
disable:             start from connector and move to encoder
before_post_disable: start from encoder and move to connector
post_disable:        start from encoder and move to connector

Then the eDP panel code would move to using only after_pre_enable() /
before_post_disable() for powering itself on/off because This is
saying that for eDP panels that you'd want to power the panel up after
the connector. ...and if there was some eDP panel that was different
it wouldn't be too hard to add a quirk for that panel and have it
power on in pre_enable.

The question is: is the above just a hack to get us out of the current
situation or is it a reasonable design? Let's think about it. In
general the above design allows bridges closer to the connector to
control whether they are powered before or after bridges that are
farther from the connector. So if we have:

encoder (A) -> bridge (B) -> bridge (C) -> connector (D)

* D is in control of whether it gets powered before or after A/B/C
* C is in control of whether it gets powered before or after A/B
* B is in control of whether it gets powered before or after A

Here the encoder has the least flexibility. In much of the discussion
so far, however, it sounded like the connector was the piece that
needed the most control, so I think this is right.

Now let's think about if we could do better, like perhaps giving "full
flexibility" where everything in the chain can request whether they
get pre_enable() before or after their sources / sinks. Looking at
this a little, I don't think the "full flexibility" can really work
and also accomplish interoperability well. You can simply imagine two
bridges, like (B) and (C) above, where:

* Bridge B says that it needs to be pre_enabled before its output (AKA Bridge C)
* Bridge C says that it needs to be pre_enabled before its input (AKA Bridge B)

That would simply be impossible to resolve. Trying to figure out what
to do here and in general all the rules for honoring the requests for
all the bridges in the chain seems really complex and I'm not
convinced that the result would be better than the simple "give the
control to whatever's closer to the connector" that my scheme
accomplishes.

So I guess I'd summarize by saying that the above proposal, while not
a panacea, seems like it has real beneficial properties and maybe
isn't a "hack"?


-Doug

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37833E2F5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 01:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF71589B33;
	Wed, 17 Mar 2021 00:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBAE89B33
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 00:45:24 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id g24so255720qts.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 17:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aO/OZ4zO5c+UReCZXfD9/ue3OlGDOu+K9xY/v16MWOM=;
 b=Yjxx9s2kQ4DOhIjHj6+/pNSGqV161HlvXedt3ioyBFMJpaown9V/+E6jKZL9S8hlvD
 /g20NMV4xosL3HCIgWPtGpkvEXYezGYew1XCpu4lMFetz9DROLcwY0BqVdgEc/puWbj2
 CSWigEl1OnH/gTE+ZVG39hnrhmWVqAbwq5ils=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aO/OZ4zO5c+UReCZXfD9/ue3OlGDOu+K9xY/v16MWOM=;
 b=ujoztaC2ZYijlt6Xx5pdMwzXwkMN6eVHGTPTPc1UpQ3MjVKibdszAs2eUv2f3W+uRw
 oOgrywRL/r4dKttw9e3Q9GNuLtNdHTdyAdbocgZ3uGtIajjnb+UNAhCJoM0Miq5tj6JW
 fBxWJ+YcakMjWMlJ6x4aTlRTFuBxfKnNml89/zjqoVGM/vWNuhaLSfFg5p/yeoUDDPU8
 BDhnb+mIYT53Iws+yOl/i1I/yjHJP9iEXaC3+ua8DEEwSlu/K/uH1rxS3iE8weyTSzrG
 47esnZpMMNGLkqHEi36z13FiOtsR9Jo7bAtW6lWaOm38xnyTBdBseTBG6dsRXvU2lRvT
 omSg==
X-Gm-Message-State: AOAM531GsUK+cZR6TG6W7A6vDNG2a0XoZ/lqY1UJsfNzIpbyBFaXiurD
 PG9vqx8WbYIVnk1W9sWGusWNG2X+z2qarQ==
X-Google-Smtp-Source: ABdhPJygC50v/I75wjoAK+cuTkEONUTuebNMXF7eCQGFStqXByYOTLRSTWy6qkEqwVJp9jZrhhoQZw==
X-Received: by 2002:ac8:5448:: with SMTP id d8mr1482709qtq.392.1615941923197; 
 Tue, 16 Mar 2021 17:45:23 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id q2sm16048450qkq.59.2021.03.16.17.45.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:45:14 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id p186so38813708ybg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 17:45:12 -0700 (PDT)
X-Received: by 2002:a25:1883:: with SMTP id 125mr1752626yby.465.1615941912101; 
 Tue, 16 Mar 2021 17:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid>
 <YE0ru4JpXfX/4Awe@pendragon.ideasonboard.com>
 <CAD=FV=UY_S8jPkXwK6AGs99XrE=pno2sCgLE7qcPWfmoyYVXiw@mail.gmail.com>
 <YFEnKgwEOWdeQBK6@pendragon.ideasonboard.com>
In-Reply-To: <YFEnKgwEOWdeQBK6@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Mar 2021 17:44:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W5fpyEf4AqJ+dZ7i_rD_PE40MyNsYNydhPi4BHkEfQcQ@mail.gmail.com>
Message-ID: <CAD=FV=W5fpyEf4AqJ+dZ7i_rD_PE40MyNsYNydhPi4BHkEfQcQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Properly get the EDID, but
 only if refclk
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 16, 2021 at 2:46 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Mon, Mar 15, 2021 at 09:25:37AM -0700, Doug Anderson wrote:
> > On Sat, Mar 13, 2021 at 1:17 PM Laurent Pinchart wrote:
> > > On Thu, Mar 04, 2021 at 03:52:01PM -0800, Douglas Anderson wrote:
> > > > In commit 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over
> > > > DDC") we attempted to make the ti-sn65dsi86 bridge properly read the
> > > > EDID from the panel. That commit kinda worked but it had some serious
> > > > problems.
> > > >
> > > > The problems all stem from the fact that userspace wants to be able to
> > > > read the EDID before it explicitly enables the panel. For eDP panels,
> > > > though, we don't actually power the panel up until the pre-enable
> > > > stage and the pre-enable call happens right before the enable call
> > > > with no way to interject in-between. For eDP panels, you can't read
> > > > the EDID until you power the panel. The result was that
> > > > ti_sn_bridge_connector_get_modes() was always failing to read the EDID
> > > > (falling back to what drm_panel_get_modes() returned) until _after_
> > > > the EDID was needed.
> > > >
> > > > To make it concrete, on my system I saw this happen:
> > > > 1. We'd attach the bridge.
> > > > 2. Userspace would ask for the EDID (several times). We'd try but fail
> > > >    to read the EDID over and over again and fall back to the hardcoded
> > > >    modes.
> > > > 3. Userspace would decide on a mode based only on the hardcoded modes.
> > > > 4. Userspace would ask to turn the panel on.
> > > > 5. Userspace would (eventually) check the modes again (in Chrome OS
> > > >    this happens on the handoff from the boot splash screen to the
> > > >    browser). Now we'd read them properly and, if they were different,
> > > >    userspace would request to change the mode.
> > > >
> > > > The fact that userspace would always end up using the hardcoded modes
> > > > at first significantly decreases the benefit of the EDID
> > > > reading. Also: if the modes were even a tiny bit different we'd end up
> > > > doing a wasteful modeset and at boot.
> > >
> > > s/and at/at/ ?
> >
> > Sure, I can correct if/when I respin or it can be corrected when landed.
> >
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > index 491c9c4f32d1..af3fb4657af6 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -16,6 +16,7 @@
> > > >  #include <linux/pm_runtime.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/regulator/consumer.h>
> > > > +#include <linux/workqueue.h>
> > > >
> > > >  #include <asm/unaligned.h>
> > > >
> > > > @@ -130,6 +131,12 @@
> > > >   * @ln_assign:    Value to program to the LN_ASSIGN register.
> > > >   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
> > > >   *
> > > > + * @pre_enabled_early: If true we did an early pre_enable at attach.
> > > > + * @pre_enable_timeout_work: Delayed work to undo the pre_enable from attach
> > > > + *                           if a normal pre_enable never came.
> > >
> > > Could we simplify this by using the runtime PM autosuspend feature ? The
> > > configuration of the bridge would be moved from pre_enable to the PM
> > > runtime resume handler, the clk_disable_unprepare() call moved from
> > > post_disable to the runtime suspend handler, and the work queue replaced
> > > by usage of pm_runtime_put_autosuspend().
> >
> > It's an interesting idea but I don't think I can make it work, at
> > least not in a generic enough way. Specifically we can also use this
> > bridge chip as a generic GPIO provider in Linux. When someone asks us
> > to read a GPIO then we have to power the bridge on
> > (pm_runtime_get_sync()) and when someone asks us to configure a GPIO
> > as an output then we actually leave the bridge powered until they stop
> > requesting it as an output. At the moment the only user of this
> > functionality (that I know of) is for the HPD pin on trogdor boards
> > (long story about why we don't use the dedicated HPD) but the API
> > supports using these GPIOs for anything and I've tested that it works.
> > It wouldn't be great to have to keep the panel on in order to access
> > the GPIOs.
>
> The issue you're trying to fix doesn't seem specific to this bridge, so
> handling it in the bridge driver bothers me :-S Is there any way we
> could handle this in the DRM core ? I don't want to see similar
> implementations duplicated in all HDMI/DP bridges.

Yes, it is true that this problem could affect other drivers.  ...and
in full disclosure I think there are other similar workarounds already
present. I haven't personally worked on those chips, but in
ps8640_bridge_get_edid() there is a somewhat similar workaround to
chain a pre-enable (though maybe it's not quite as optimized?). I'm
told that maybe something had to be handled for anx7625 (in
anx7625_get_edid()?) but that definitely doesn't look at all like it's
doing a pre-enable, so maybe things for that bridge just work
differently.

One thing that makes me hesitant about trying to moving this to the
core is that even in sn65dsi86 there is a case where it won't work. As
I mentioned in the patch I'm not aware of anyone using it in
production, but if someone was using the MIPI clock as input to the
bridge chip instead of a fixed "refclk" then trying to get the EDID
after just "pre-enable" falls over.  Said another way: I can say that
with this particular bridge chip, if you're using a fixed refclk, you
can read the EDID after the pre-enable. I don't know if that's always
true with all other bridge chips.

So I guess in summary: I think I could put my code in the core, but I
don't _think_ I can just make it automatically enabled.

* In sn65dsi I'd have to only enable it if we have a fixed refclk.

* Maybe in ps8640 I could just always enable it and replace the
existing code? I'd have to find someone to test.

* In anx7625 things look totally different.

Can you give me any advice on how you'd like me to proceed?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

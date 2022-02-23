Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C084C1758
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75F310E6E9;
	Wed, 23 Feb 2022 15:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D1110E5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 15:43:43 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id qk11so53408282ejb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 07:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNj6ryohEmGxkSudgErczfib5Ibt/V3cLh7GtBRzD10=;
 b=gJaQwx4eevOVwsKrwWXNsstVK35l21ZhxUXcexV97F4OMPT7FBMwqOtg9P1x6V85jW
 CMgV2yl9NHMLDrVtF6f9wSMvDmSt1iGQqEQ4L2z/CeKBU4GbzbO0aPHxLD4VDoKRCVtX
 i/dgoOQ//jF55Uh3YPeiI2eds1LYYSJE3ZtmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNj6ryohEmGxkSudgErczfib5Ibt/V3cLh7GtBRzD10=;
 b=px7Ou9R8YDDfvhrUSQ/sr0dBlRgAydb6NqT5yKu9XbTmnBquWiXMndu2AI3JpA5tmd
 b6846N3hEZFCsh4x7Mp16Dc/tVC9RL78zP/eKBOAwvPh+in8AkQgwKOoEYW98lT5V2CG
 LP1YQ4oMHv9+3ytx+3Pq50RwDRGKRPcmUt3l6vsWnd2WlWMlpgnZgdJ1XlOmXym+bAjR
 vuidwjyiFA71zb3T+bv31GKeZ7E+v2ApUT7ljp4s/+KvxGfzFrEP+HKUO40/3gasejNS
 Bz/sBdYemZ6HeWT6C6orSCSkoxsZrEISmPyQ3ClbZQQv3A49vdrd9vI1nU2QzXbcLI8E
 fEtA==
X-Gm-Message-State: AOAM532w5oZJgFbc+WlYt9mv2Mthp/uJOGiBg2ZqEs54pUTeK+tGIKzq
 nSNbmxSQQ3R+JKlrsnPWHajy76vpn2wwnv54Uek=
X-Google-Smtp-Source: ABdhPJzzMHrNWUfnHZeTTBV/dJifblm7Jirvr5LVYxXTSVzscJV+iVkfruBzu/bK02p4gptEBkxQnA==
X-Received: by 2002:a17:907:2087:b0:6cf:e170:171 with SMTP id
 pv7-20020a170907208700b006cfe1700171mr257847ejb.163.1645631021728; 
 Wed, 23 Feb 2022 07:43:41 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id v23sm4177ejy.178.2022.02.23.07.43.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 07:43:40 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id p9so40291926wra.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 07:43:40 -0800 (PST)
X-Received: by 2002:adf:e4c2:0:b0:1e3:3e5d:bd65 with SMTP id
 v2-20020adfe4c2000000b001e33e5dbd65mr183769wrm.422.1645631020228; Wed, 23 Feb
 2022 07:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20220222141838.1.If784ba19e875e8ded4ec4931601ce6d255845245@changeid>
 <CACRpkdbQ9U22afR74YiZs95qCm7dnLb2k4_nT3Le__hJPpDGUw@mail.gmail.com>
 <YhXBIxbx63IXBU7L@pendragon.ideasonboard.com>
In-Reply-To: <YhXBIxbx63IXBU7L@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Feb 2022 07:43:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UV+3PNF=O8Zv4UJK50gvDx=WHbamLLhH5ANZUBeCxjdQ@mail.gmail.com>
Message-ID: <CAD=FV=UV+3PNF=O8Zv4UJK50gvDx=WHbamLLhH5ANZUBeCxjdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Properly undo autosuspend
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Brian Norris <briannorris@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 22, 2022 at 9:08 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Feb 22, 2022 at 11:44:54PM +0100, Linus Walleij wrote:
> > On Tue, Feb 22, 2022 at 11:19 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > The PM Runtime docs say:
> > >   Drivers in ->remove() callback should undo the runtime PM changes done
> > >   in ->probe(). Usually this means calling pm_runtime_disable(),
> > >   pm_runtime_dont_use_autosuspend() etc.
> > >
> > > We weren't doing that for autosuspend. Let's do it.
> > >
> > > Fixes: 9bede63127c6 ("drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Hm. I know a few places in drivers where I don't do this :/
>
> It seems to be a very common problem indeed, I haven't seen any driver
> yet that uses pm_runtime_dont_use_autosuspend(). We could play a game of
> whack-a-mole, but we'll never win. Could this be solved in the runtime
> PM framework instead ? pm_runtime_disable() could disable auto-suspend.
> If there are legitimate use cases for disabling runtime PM temporarily
> without disabling auto-suspend, then a new function designed
> specifically for remove() that would take care of cleaning everything up
> could be another option.

Yeah, it would be good. It's probably not a yak I have time to shave
right now, though. :(

I _suspect_ that there are legitimate reasons we can't just magically
do it in pm_runtime_disable(). If nothing else I believe there are
legitimate code paths during normal operation that look like this:

  pm_runtime_disable();
  do_something_that_needs_pm_runtime_disabled();
  pm_runtime_enable();

Also: if it were really a simple problem to solve one would have
thought that it would have been solved initially instead of adding
documentation particularly mentioning
pm_runtime_dont_use_autosuspend()

How about a middle ground, though: we could add a devm function that
does all the magic. Somewhat recently devm_pm_runtime_enable() was
added. What if we add a variant for those that use autosuspend, like:

devm_pm_runtime_enable_with_autosuspend(dev, initial_delay)

That would:
* pm_runtime_enable()
* pm_runtime_set_autosuspend_delay()
* pm_runtime_use_autosuspend()
* Use devm_add_action_or_reset() to undo everything.

Assuming that the pm_runtime folks are OK with that, we could
transition things over to the new function once it rolls into
mainline.

So this doesn't magically fix all existing code but provides a path to
make this more discoverable.

-Doug

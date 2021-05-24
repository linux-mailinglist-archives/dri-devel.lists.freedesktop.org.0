Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5438E11F
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 08:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2DB6E0F0;
	Mon, 24 May 2021 06:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905406E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 06:45:48 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id h9so26245115oih.4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=DaL3exz5N7QMjuysP8/tZCFH35mQo+0m0u3b2etRRBw=;
 b=Hndq02nqqlr60x2Y3R0ZohOgFLVwfJyrZ/AewBOpUnvsAShydRgC97Ilw0Rci7y9i8
 qHQxrnBi5LtDzqcwXsZS5Rf2o0YaUaAQAIEDar4tna2nE6EtVWkQQEuYzHh6Tx5KgPQQ
 9vWU16GO85emv7jJv6Gpij/mujPYYBOjhefC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=DaL3exz5N7QMjuysP8/tZCFH35mQo+0m0u3b2etRRBw=;
 b=tmLhHUFeGBNjzqcPTgkwxGIZwKLct2m3rsWNXSWuLen46csIN/ZM+fL78VELY8r88i
 VWbDf20V9y/GotLJcrfbBVdq65PIYnQXdGBgM1xW03DcxnPzUPZFKrn1pJ/3YRJyDxD3
 uK7HoAO9HsE8GgVSVZ284RbI5+JEGOzeelf/tjt8m9VqEKN1ShOKqEhpwHoH6tLJNs35
 C7n0xnYpgpoCbNg54aSeflcRdty0fN6TytL4JO1JggesB6/YnY26KR7qQJL6VbGNYtfJ
 6vQ+ErnyXCshRR4Vw9WgOLCMxYfQWv1gl8eprf3jXZA4uXEuVQnU7mIQ9CFwyaBe3J/7
 Gf+A==
X-Gm-Message-State: AOAM53024miEHBelzCryESk+HPJ585v9AiDOGyNbfmChLN0T7HmF3mCz
 0kCMaDEahK1KLkserDIaI+Nt/n26zsI/DbgBDI+V+Q==
X-Google-Smtp-Source: ABdhPJzRC1J2nQytOFwYL51hVg9GKGiRpvNA2dHDRA9P5Z/4UbcgCjiYlEVw8H3qKUQx+4tLbPJ0POSpm0WkV3w9lmE=
X-Received: by 2002:a54:4501:: with SMTP id l1mr9973998oil.19.1621838747750;
 Sun, 23 May 2021 23:45:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 23 May 2021 23:45:47 -0700
MIME-Version: 1.0
In-Reply-To: <YKa/fEuVqHhV9CPC@phenom.ffwll.local>
References: <20210520002519.3538432-1-swboyd@chromium.org>
 <20210520002519.3538432-8-swboyd@chromium.org>
 <YKa/fEuVqHhV9CPC@phenom.ffwll.local>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sun, 23 May 2021 23:45:47 -0700
Message-ID: <CAE-0n51H1Wd5Cj-JLTqcb5Eo3qc=V8-jCx3-+e0g3mGoP+xRkA@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/msm: Migrate to aggregate driver
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-05-20 12:58:52)
> On Wed, May 19, 2021 at 05:25:19PM -0700, Stephen Boyd wrote:
> > @@ -1306,7 +1322,8 @@ static int msm_pdev_probe(struct platform_device *pdev)
> >       if (ret)
> >               goto fail;
> >
> > -     ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
> > +     msm_drm_aggregate_driver.match = match;
>
> This is a bit awkward design, because it means the driver struct can't be
> made const, and it will blow up when you have multiple instance of the
> same driver. I think the match should stay as part of the register
> function call, and be stored in the aggregate_device struct somewhere.

Got it. The driver struct can't be const for other reasons but I agree
it is awkward. I'm currently using the match pointer to figure out if
this aggregate driver is related to the aggregate device. The match
pointer is already stored in the aggregate_device. The problem is we
need to know if some driver is associated with some aggregate_device,
and so I took the easy way out and registered the aggregate_device at
the same time that the aggregate_driver is registered and stashed the
match pointer in both structures to match them up later during driver
binding.

If we want to support multiple aggregate_devices for an aggregate_driver
then I'll have to come up with some other way of associating the
aggregate_devices created in the component code with the aggregate
driver that registered it. I suppose a list of aggregate_devices will
work. Is any sort of driver doing this right now and registering the
bind/unbind ops with multiple devices? I just wonder if there's any
point in doing it if it will always be a 1:1 relationship between
aggregate device and driver.

>
> Otherwise I think this looks really solid and fixes your issue properly.
> Obviously needs careful review from Greg KH for the device model side of
> things, and from Rafael Wysocki for pm side.

Yeah apparently it fixes my issue because the aggregate_device is added
after all the other devices described in DT (and the i2c bridge) have
been added to the dpm list. Otherwise I would still have problems, but
using device links should help me guarantee the aggregate_device is in
the right location on the list. I still have to check that the i2c
bridge is linked to the DSI encoder though.

>
> Bunch of thoughts from a very cursory reading:
>
> - I think it'd be good if we pass the aggregate_device to all components
>   when we bind them, plus the void * parameter just to make this less
>   disruptive. Even more device model goodies.

So the idea is to pass aggregate_device into the struct
component_ops::{bind,unbind}() functions? Right now it takes the parent
device, so we'll need to introduce another set of function pointers for
the "modern" way of doing things in the component and then pass the
aggregate_device pointer instead of the parent. I can roll that into
another patch and then deprecate the bind/unbind function pointers.

I'll pass the aggregate_device instead of a device pointer so that
compilation will break if the code isn't migrated properly. I also see
that in the msm case the component driver probe is mostly just punted
into the component bind ops. I'd like to change that so the component
drivers get all their resources in their real probe, i.e. platform
driver probe, and then only do things related to making the graphics
card "whole" in their bind. This mostly means that power management
stuff will move out of the bind callback and into the probe callback and
then only once the power management stuff is ready will we actually
register the component device.

>
> - Maybe splatter a pile of sysfs links around so that this all becomes
>   visible? Could be interesting for debugging ordering issues. Just an
>   idea, feel free to entirely ignore.

Sure. I'll do the device link stuff from the components to the aggregate
driver and that should help, as Saravana mentioned earlier.

>
> - Needs solid kerneldoc for everything exposed to drivers and good
>   overview DOC:

Ok I'll layer that on at the end.

>
> - Needs deprecation warnings in the kerneldoc for all the
>   component_master_* and if feasible with a mechanical conversion,
>   converting existing users. I'd like to not be stuck with the old model
>   forever, plus this will give a pile more people to review this code
>   here.

Ok. I'll dust off coccinelle or just do it by hand. There aren't that
many. I hope.

>
> Anyway the name changes in probe and remove hooks below are already worth
> this on their own imo. That's why I'd like to see them in all drivers.
>

Cool, thanks for taking a look. It may take me a couple more days to get
v2 out the door and I'll have to spend a bunch of time converting more
drivers to shake out more problems.

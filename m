Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB061733E7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 10:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58F66EE9F;
	Fri, 28 Feb 2020 09:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87916EEA2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 09:27:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m3so2443811wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 01:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9/5aSuOnLbh8GxGcND8KueDA6BbfrtwQdaxM7wlqBvY=;
 b=yqJhgiPi1dBgj54WKl1L/iWtM3CGrSfqQ1nqhpzBuca9oO0CJI4R7Ik2noxXmIj/EB
 9gPury+qNfJT/uqla/JQsTShz02LCpi0+4BucU3gX2bYgn4xZaYx0+Ba5GEM+sA/4AuJ
 m2FHcm4cFZSss08tWHBZzMUoHAwh+Ye4xdNGU07aHshzfvv0IM1OzWuqSgAgF1Yz5Icm
 nkXgyTUaUsHCrivrt80kYQG/K9i0HIFIgavXgEmsHdu3XoEW8XDd5YQXlc4fu9PONrd8
 16M0F81mi0aMHSmh6mczVM5X7aqq+Sju30/omu08tW3RUWLYhQkC4VQUzu3b9er2I62E
 kmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9/5aSuOnLbh8GxGcND8KueDA6BbfrtwQdaxM7wlqBvY=;
 b=cFQu4BYbHcZ0AA9hyavuYrCmVrfETZOXH1UFKp2XJSWXwEKBEwAySOS0UyGLM9zXm0
 xZaNfz8FGqg2k415S2SAPYC9vUSdlw5KzdLjSj8CNrgu3ZWGDM4lywT1iORke6ZQOO9b
 4hogeMnJOrF1MrmMlbfBbtOfJ1DyhSJOHKwk22xCEksbu0kPwe4UXkBYfdbLsga5XmvF
 UBc8OeNHU0RBxz7e3n2Goap/7HEnxcdhwWW276YikK4E1TBvUG+J5FMEq5A/mEY0OOYE
 y7IYfqbdgkOikUa4unKa1607veYp+bZmnZYJuPJhoGYV9+MpZa12nNg7ErwP3uVfNv7G
 zdng==
X-Gm-Message-State: APjAAAW0Wi1fuTBZ6QtxXsVQUaa2GivEC81oqoWuDBJiQEgncow6BXtm
 Mn0Acs8KBKioQrbHTrfMfpdsb69tPpTZzl3MqTmM/w==
X-Google-Smtp-Source: APXvYqyakrBmSvGBUTH02Z6YVQ30POGjosExZ/J8rznjy7IRp+xsAuUv8In4AlH41CGP75yrtJFiHu0XMqgdgndJlB8=
X-Received: by 2002:a7b:c08d:: with SMTP id r13mr3965555wmh.84.1582882024203; 
 Fri, 28 Feb 2020 01:27:04 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <CAPj87rM76W9y_76WUHR35NS3V4_-RFi9ZM3GA=aED3dD3hWYkg@mail.gmail.com>
 <CAPM=9txN-RKGwinzsSPrmT_xFjS2J_XUhXVsRQ2pSSe529wpEA@mail.gmail.com>
In-Reply-To: <CAPM=9txN-RKGwinzsSPrmT_xFjS2J_XUhXVsRQ2pSSe529wpEA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Feb 2020 09:26:23 +0000
Message-ID: <CAPj87rMc9zE01uWHhLHwCTkK+15UBfi0z-cJy2pFhtaJh3qB6A@mail.gmail.com>
Subject: Re: [Intel-gfx] gitlab.fd.o financial situation and impact on services
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 gstreamer-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Feb 2020 at 08:48, Dave Airlie <airlied@gmail.com> wrote:
> On Fri, 28 Feb 2020 at 18:18, Daniel Stone <daniel@fooishbar.org> wrote:
> > The last I looked, Google GCP / Amazon AWS / Azure were all pretty
> > comparable in terms of what you get and what you pay for them.
> > Obviously providers like Packet and Digital Ocean who offer bare-metal
> > services are cheaper, but then you need to find someone who is going
> > to properly administer the various machines, install decent
> > monitoring, make sure that more storage is provisioned when we need
> > more storage (which is basically all the time), make sure that the
> > hardware is maintained in decent shape (pretty sure one of the fd.o
> > machines has had a drive in imminent-failure state for the last few
> > months), etc.
> >
> > Given the size of our service, that's a much better plan (IMO) than
> > relying on someone who a) isn't an admin by trade, b) has a million
> > other things to do, and c) hasn't wanted to do it for the past several
> > years. But as long as that's the resources we have, then we're paying
> > the cloud tradeoff, where we pay more money in exchange for fewer
> > problems.
>
> Admin for gitlab and CI is a full time role anyways. The system is
> definitely not self sustaining without time being put in by you and
> anholt still. If we have $75k to burn on credits, and it was diverted
> to just pay an admin to admin the real hw + gitlab/CI would that not
> be a better use of the money? I didn't know if we can afford $75k for
> an admin, but suddenly we can afford it for gitlab credits?

s/gitlab credits/GCP credits/

I took a quick look at HPE, which we previously used for bare metal,
and it looks like we'd be spending $25-50k (depending on how much
storage you want to provision, how much room you want to leave to
provision more storage later, how much you care about backups) to run
a similar level of service so that'd put a bit of a dint in your
year-one budget.

The bare-metal hosting providers also add up to more expensive than
you might think, again especially if you want either redundancy or
just backups.

> > Yes, we could federate everything back out so everyone runs their own
> > builds and executes those. Tinderbox did something really similar to
> > that IIRC; not sure if Buildbot does as well. Probably rules out
> > pre-merge testing, mind.
>
> Why? does gitlab not support the model? having builds done in parallel
> on runners closer to the test runners seems like it should be a thing.
> I guess artifact transfer would cost less then as a result.

It does support the model but if every single build executor is also
compiling Mesa from scratch locally, how long do you think that's
going to take?

> > Again, if you want everything to be centrally
> > designed/approved/monitored/controlled, that's a fine enough idea, and
> > I'd be happy to support whoever it was who was doing that for all of
> > fd.o.
>
> I don't think we have any choice but to have someone centrally
> controlling it, You can't have a system in place that lets CI users
> burn largs sums of money without authorisation, and that is what we
> have now.

OK, not sure who it is who's going to be approving every update to
every .gitlab-ci.yml in the repository, or maybe we just have zero
shared runners and anyone who wants to do builds can BYO.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

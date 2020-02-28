Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661A21740FB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 21:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812A56F4C1;
	Fri, 28 Feb 2020 20:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A046F4BF;
 Fri, 28 Feb 2020 20:31:03 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id h9so3790750otj.11;
 Fri, 28 Feb 2020 12:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FNB/vdXgS21Pl+73YXup9CChCyeEkhvIEpEg9saL9GA=;
 b=plAf0HmoeZIpCj8l7vMN46oBhe3sd/xVh85/ogDlq05S+2SEapuhyvh2zs1CG+2iio
 JOaU3oESqXjy1yh7rGHeaBQ+Xpr6ORwGV3K/TOpqsrKu0VwiLiUCkfmOtvthOb4LABRh
 iNeHWmGbpz23YylkhPGQa3RCT/yb6lRiB8+IO0X9PjBHNsIIp23nMN/E46CZE3HfQu0t
 6OHfurMHyN06SrhAZXVxxEvr4oUXz/gjud/aAcWKaRS0uNrpkB0YtskVuh6pFwhqLjwe
 ThtEuW6Pt2J2JnzHknaNR8y0E1mVcpTxqn7x+ewX7QaD44QsA6oCt2O/PdiScyN05Js0
 bvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FNB/vdXgS21Pl+73YXup9CChCyeEkhvIEpEg9saL9GA=;
 b=FH2aZGK2eD/IqnisdHMgv9asKBHdCh37cXE18lRhyEaCPjBh8ofsACSLZO6cBwDQMP
 Rtb6k73RDsLF3eOUFKloCYDm5H6rKjkx9/XHvt+0Wuz9SQP2tl3dCcUu+0WAtqfX2pBs
 kYefnvuT7WIdC7F/+dRkhvQwIJhWo4eVrqUMPaUlbDe7gzA0mKDojPDJ3nv4KL5sxmUa
 zUIB9aEoC/yakWhXVmO5ugVwjM1oFgqmszxXT4foJ+Uh5TaMe2inG/K6t6Z7sfmGeztc
 Z0ablpgbaVyOf4qt084Ny+vZB83J3COfreYi1aDHegEk8IWgOJ/IB7XfoC9/n4DaVJTE
 jzCQ==
X-Gm-Message-State: APjAAAVI+X6n3ZnmzYF63Tvk2aOc26UclUobSjJV00jKZczevXZtbQQo
 wTRoyPqPmQvkUHmSrfvx32w+xeWFb4DRWtFRCm3XJ4A5vws=
X-Google-Smtp-Source: APXvYqy5WHHPQbTT0i23zIbM8ddT2qX87Nwkh2zqPAaPBUBpZJHH7STaPpB03tE4Sbk6aK9DflFdtJ6/Srmv0J9twWQ=
X-Received: by 2002:a9d:7f18:: with SMTP id j24mr5033394otq.78.1582921862099; 
 Fri, 28 Feb 2020 12:31:02 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <CAPj87rM76W9y_76WUHR35NS3V4_-RFi9ZM3GA=aED3dD3hWYkg@mail.gmail.com>
 <CAPM=9txN-RKGwinzsSPrmT_xFjS2J_XUhXVsRQ2pSSe529wpEA@mail.gmail.com>
 <CADaigPUjYZ-Mqd91eyR3Luo=PxLHratUhvodJmCJHf__MnPozA@mail.gmail.com>
In-Reply-To: <CADaigPUjYZ-Mqd91eyR3Luo=PxLHratUhvodJmCJHf__MnPozA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 29 Feb 2020 06:30:49 +1000
Message-ID: <CAPM=9tyhoagJmzMtwDKU-rjsCUPjokUp2ECOV0FdbkO5CQdZ2w@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
To: Eric Anholt <eric@anholt.net>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, Mesa Dev <mesa-dev@lists.freedesktop.org>,
 gstreamer-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Feb 2020 at 05:34, Eric Anholt <eric@anholt.net> wrote:
>
> On Fri, Feb 28, 2020 at 12:48 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Fri, 28 Feb 2020 at 18:18, Daniel Stone <daniel@fooishbar.org> wrote:
> > >
> > > On Fri, 28 Feb 2020 at 03:38, Dave Airlie <airlied@gmail.com> wrote:
> > > > b) we probably need to take a large step back here.
> > > >
> > > > Look at this from a sponsor POV, why would I give X.org/fd.o
> > > > sponsorship money that they are just giving straight to google to pay
> > > > for hosting credits? Google are profiting in some minor way from these
> > > > hosting credits being bought by us, and I assume we aren't getting any
> > > > sort of discounts here. Having google sponsor the credits costs google
> > > > substantially less than having any other company give us money to do
> > > > it.
> > >
> > > The last I looked, Google GCP / Amazon AWS / Azure were all pretty
> > > comparable in terms of what you get and what you pay for them.
> > > Obviously providers like Packet and Digital Ocean who offer bare-metal
> > > services are cheaper, but then you need to find someone who is going
> > > to properly administer the various machines, install decent
> > > monitoring, make sure that more storage is provisioned when we need
> > > more storage (which is basically all the time), make sure that the
> > > hardware is maintained in decent shape (pretty sure one of the fd.o
> > > machines has had a drive in imminent-failure state for the last few
> > > months), etc.
> > >
> > > Given the size of our service, that's a much better plan (IMO) than
> > > relying on someone who a) isn't an admin by trade, b) has a million
> > > other things to do, and c) hasn't wanted to do it for the past several
> > > years. But as long as that's the resources we have, then we're paying
> > > the cloud tradeoff, where we pay more money in exchange for fewer
> > > problems.
> >
> > Admin for gitlab and CI is a full time role anyways. The system is
> > definitely not self sustaining without time being put in by you and
> > anholt still. If we have $75k to burn on credits, and it was diverted
> > to just pay an admin to admin the real hw + gitlab/CI would that not
> > be a better use of the money? I didn't know if we can afford $75k for
> > an admin, but suddenly we can afford it for gitlab credits?
>
> As I think about the time that I've spent at google in less than a
> year on trying to keep the lights on for CI and optimize our
> infrastructure in the current cloud environment, that's more than the
> entire yearly budget you're talking about here.  Saying "let's just
> pay for people to do more work instead of paying for full-service
> cloud" is not a cost optimization.
>
>
> > > Yes, we could federate everything back out so everyone runs their own
> > > builds and executes those. Tinderbox did something really similar to
> > > that IIRC; not sure if Buildbot does as well. Probably rules out
> > > pre-merge testing, mind.
> >
> > Why? does gitlab not support the model? having builds done in parallel
> > on runners closer to the test runners seems like it should be a thing.
> > I guess artifact transfer would cost less then as a result.
>
> Let's do some napkin math.  The biggest artifacts cost we have in Mesa
> is probably meson-arm64/meson-arm (60MB zipped from meson-arm64,
> downloaded by 4 freedreno and 6ish lava, about 100 pipelines/day,
> makes ~1.8TB/month ($180 or so).  We could build a local storage next
> to the lava dispatcher so that the artifacts didn't have to contain
> the rootfs that came from the container (~2/3 of the insides of the
> zip file), but that's another service to build and maintain.  Building
> the drivers once locally and storing it would save downloading the
> other ~1/3 of the inside of the zip file, but that requires a big
> enough system to do builds in time.
>
> I'm planning on doing a local filestore for google's lava lab, since I
> need to be able to move our xml files off of the lava DUTs to get the
> xml results we've become accustomed to, but this would not bubble up
> to being a priority for my time if I wasn't doing it anyway.  If it
> takes me a single day to set all this up (I estimate a couple of
> weeks), that costs my employer a lot more than sponsoring the costs of
> the inefficiencies of the system that has accumulated.

I'm not trying to knock the engineering works the CI contributors have
done at all, but I've never seen a real discussion about costs until
now. Engineers aren't accountants.

The thing we seem to be missing here is fiscal responsibility. I know
this email is us being fiscally responsible, but it's kinda after the
fact.

I cannot commit my employer to spending a large amount of money (> 0
actually) without a long and lengthy process with checks and bounds.
Can you?

The X.org board has budgets and procedures as well. I as a developer
of Mesa should not be able to commit the X.org foundation to spending
large amounts of money without checks and bounds.

The CI infrastructure lacks any checks and bounds. There is no link
between editing .gitlab-ci/* and cashflow. There is no link to me
adding support for a new feature to llvmpipe that blows out test times
(granted it won't affect CI budget but just an example).

The fact that clouds run on credit means that it's not possible to say
budget 30K and say when that runs out it runs out, you end up getting
bills for ever increasing amounts that you have to cover, with nobody
"responsible" for ever reducing those bills. Higher Faster Further
baby comes to mind.

Has X.org actually allocated the remaining cash in it's bank account
to this task previously? Was there plans for this money that can't be
executed now because we have to pay the cloud fees? If we continue to
May and the X.org bank account hits 0, can XDC happen?

Budgeting and cloud is hard, the feedback loops are messy. In the old
system the feedback loop was simple, we don't have admin time or money
for servers we don't get the features, cloud allows us to get the
features and enjoy them and at some point in the future the bill gets
paid by someone else. Credit cards lifestyles all the way.

Like maybe we can grow up here and find sponsors to cover all of this,
but it still feels a bit backwards from a fiscal pov.

Again I'm not knocking the work people have done at all, CI is very
valuable to the projects involved, but that doesn't absolve us from
costs.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

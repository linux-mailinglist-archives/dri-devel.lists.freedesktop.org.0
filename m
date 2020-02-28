Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC5174164
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 22:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8336F4D3;
	Fri, 28 Feb 2020 21:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782F16F4DC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 21:22:29 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id x97so3940522ota.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 13:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvAFayIp+hFiq4OYzgyDZqTgk8u4sJMbapTf8GoDZe0=;
 b=c9oW3yClIYqyEUBfQq2yDWWEyamFL387Lm/8Io+SAc+NmCdt/RT1vt+BOZ1QVv9f7O
 dY5SKS6LbJFlEzPoE+QHgC69uamnAZWgNjU5G70mXnLpgSCsxqkkUVFKUrSUm9X0Zv3A
 sFeiaT/1t1KDfei0K4tl/WJ+cWwL4bTDF/Irk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvAFayIp+hFiq4OYzgyDZqTgk8u4sJMbapTf8GoDZe0=;
 b=LWcD5h90ThJx2527ty33llxplz6ERTmAI0peGTxccqKq8RjveJbaM07nYyB6H5OLeq
 pO9qe1M8CRc7KRTloM/+j39k/a0FqPKtrTRpxIf3145KIuGwGkt5pOBrpa8N5aBjTUko
 FFW+Sz5/7fdu7Jo46mce69LcSlzpk8guOtb/W8nt2hInvhW8k7plModbqFHAcGKhtSDr
 zFzNiFWmdGBi7zVjn1a6FjSLQgm1Xj0H1qg32Wo0f4s6wfAkOqKWzl3DBzP+D9MuvL9q
 w/AEXh2AdHGMB1s8KUn7EZkQU1rgzVvOd0tJ1wq0Y4tt8I+X1suGycprRtfKU5zTyAKs
 LnOg==
X-Gm-Message-State: APjAAAUyZEzXIz22f9ynkhAPaZlF87TL1FUmiEzLv1LwODmvQFMuBP2P
 Ax5MHr80T+MBgdmdnOz+hlfs5ue21pQvLIVwHo4LF7kn7uQ=
X-Google-Smtp-Source: APXvYqyhJpdAR5D0XSfdUrW7vJsBeDuOzXg3j3bFg63cXbYS166tXEcnfEkOQyA9ELZOIDYV+FneMoZSYAfmAlQNppQ=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr5172332otl.188.1582924948464; 
 Fri, 28 Feb 2020 13:22:28 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <CAPj87rM76W9y_76WUHR35NS3V4_-RFi9ZM3GA=aED3dD3hWYkg@mail.gmail.com>
 <CAPM=9txN-RKGwinzsSPrmT_xFjS2J_XUhXVsRQ2pSSe529wpEA@mail.gmail.com>
 <CADaigPUjYZ-Mqd91eyR3Luo=PxLHratUhvodJmCJHf__MnPozA@mail.gmail.com>
 <CAPM=9tyhoagJmzMtwDKU-rjsCUPjokUp2ECOV0FdbkO5CQdZ2w@mail.gmail.com>
In-Reply-To: <CAPM=9tyhoagJmzMtwDKU-rjsCUPjokUp2ECOV0FdbkO5CQdZ2w@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 28 Feb 2020 22:22:16 +0100
Message-ID: <CAKMK7uG-HwYX4M8sSAU6Qee_hUTFZZNHngsR+_K+Ewrqu8=ZDg@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
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

On Fri, Feb 28, 2020 at 9:31 PM Dave Airlie <airlied@gmail.com> wrote:
>
> On Sat, 29 Feb 2020 at 05:34, Eric Anholt <eric@anholt.net> wrote:
> >
> > On Fri, Feb 28, 2020 at 12:48 AM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > On Fri, 28 Feb 2020 at 18:18, Daniel Stone <daniel@fooishbar.org> wrote:
> > > >
> > > > On Fri, 28 Feb 2020 at 03:38, Dave Airlie <airlied@gmail.com> wrote:
> > > > > b) we probably need to take a large step back here.
> > > > >
> > > > > Look at this from a sponsor POV, why would I give X.org/fd.o
> > > > > sponsorship money that they are just giving straight to google to pay
> > > > > for hosting credits? Google are profiting in some minor way from these
> > > > > hosting credits being bought by us, and I assume we aren't getting any
> > > > > sort of discounts here. Having google sponsor the credits costs google
> > > > > substantially less than having any other company give us money to do
> > > > > it.
> > > >
> > > > The last I looked, Google GCP / Amazon AWS / Azure were all pretty
> > > > comparable in terms of what you get and what you pay for them.
> > > > Obviously providers like Packet and Digital Ocean who offer bare-metal
> > > > services are cheaper, but then you need to find someone who is going
> > > > to properly administer the various machines, install decent
> > > > monitoring, make sure that more storage is provisioned when we need
> > > > more storage (which is basically all the time), make sure that the
> > > > hardware is maintained in decent shape (pretty sure one of the fd.o
> > > > machines has had a drive in imminent-failure state for the last few
> > > > months), etc.
> > > >
> > > > Given the size of our service, that's a much better plan (IMO) than
> > > > relying on someone who a) isn't an admin by trade, b) has a million
> > > > other things to do, and c) hasn't wanted to do it for the past several
> > > > years. But as long as that's the resources we have, then we're paying
> > > > the cloud tradeoff, where we pay more money in exchange for fewer
> > > > problems.
> > >
> > > Admin for gitlab and CI is a full time role anyways. The system is
> > > definitely not self sustaining without time being put in by you and
> > > anholt still. If we have $75k to burn on credits, and it was diverted
> > > to just pay an admin to admin the real hw + gitlab/CI would that not
> > > be a better use of the money? I didn't know if we can afford $75k for
> > > an admin, but suddenly we can afford it for gitlab credits?
> >
> > As I think about the time that I've spent at google in less than a
> > year on trying to keep the lights on for CI and optimize our
> > infrastructure in the current cloud environment, that's more than the
> > entire yearly budget you're talking about here.  Saying "let's just
> > pay for people to do more work instead of paying for full-service
> > cloud" is not a cost optimization.
> >
> >
> > > > Yes, we could federate everything back out so everyone runs their own
> > > > builds and executes those. Tinderbox did something really similar to
> > > > that IIRC; not sure if Buildbot does as well. Probably rules out
> > > > pre-merge testing, mind.
> > >
> > > Why? does gitlab not support the model? having builds done in parallel
> > > on runners closer to the test runners seems like it should be a thing.
> > > I guess artifact transfer would cost less then as a result.
> >
> > Let's do some napkin math.  The biggest artifacts cost we have in Mesa
> > is probably meson-arm64/meson-arm (60MB zipped from meson-arm64,
> > downloaded by 4 freedreno and 6ish lava, about 100 pipelines/day,
> > makes ~1.8TB/month ($180 or so).  We could build a local storage next
> > to the lava dispatcher so that the artifacts didn't have to contain
> > the rootfs that came from the container (~2/3 of the insides of the
> > zip file), but that's another service to build and maintain.  Building
> > the drivers once locally and storing it would save downloading the
> > other ~1/3 of the inside of the zip file, but that requires a big
> > enough system to do builds in time.
> >
> > I'm planning on doing a local filestore for google's lava lab, since I
> > need to be able to move our xml files off of the lava DUTs to get the
> > xml results we've become accustomed to, but this would not bubble up
> > to being a priority for my time if I wasn't doing it anyway.  If it
> > takes me a single day to set all this up (I estimate a couple of
> > weeks), that costs my employer a lot more than sponsoring the costs of
> > the inefficiencies of the system that has accumulated.
>
> I'm not trying to knock the engineering works the CI contributors have
> done at all, but I've never seen a real discussion about costs until
> now. Engineers aren't accountants.
>
> The thing we seem to be missing here is fiscal responsibility. I know
> this email is us being fiscally responsible, but it's kinda after the
> fact.
>
> I cannot commit my employer to spending a large amount of money (> 0
> actually) without a long and lengthy process with checks and bounds.
> Can you?
>
> The X.org board has budgets and procedures as well. I as a developer
> of Mesa should not be able to commit the X.org foundation to spending
> large amounts of money without checks and bounds.
>
> The CI infrastructure lacks any checks and bounds. There is no link
> between editing .gitlab-ci/* and cashflow. There is no link to me
> adding support for a new feature to llvmpipe that blows out test times
> (granted it won't affect CI budget but just an example).

We're working to get the logging in place to know which projects
exactly burn down the money so that we can take specific actions. If
needed. So pretty soon you wont be able to just burn down endless
amounts of cash with a few gitlab-ci commits. Or at least not for long
until we catch you and you either fix things up or CI is gone for your
project.

> The fact that clouds run on credit means that it's not possible to say
> budget 30K and say when that runs out it runs out, you end up getting
> bills for ever increasing amounts that you have to cover, with nobody
> "responsible" for ever reducing those bills. Higher Faster Further
> baby comes to mind.

We're working on this, since it's the boards responsibility to be on
top of stuff. It's simply that we didn't expect a massive growth of
this scale and this quickly, so we're a bit behind on the controlling
aspect.

Also I guess it wasnt clear, but the board decision yesterday was the
stop loss order where we cut the cord (for CI at least). So yeah the
short term budget is firmly in place now.

> Has X.org actually allocated the remaining cash in it's bank account
> to this task previously? Was there plans for this money that can't be
> executed now because we have to pay the cloud fees? If we continue to
> May and the X.org bank account hits 0, can XDC happen?

There's numbers elsewhere in this thread, but if you'd read the
original announcement it states that the stop loss would still
guarantee that we can pay for everything for at least one year. We're
not going to get even close to 0 in the bank account.

So yeah XDC happens, and it'll also still happen next year. Also fd.o
servers will keep running. The only thing we might need to switch off
is the CI support.

> Budgeting and cloud is hard, the feedback loops are messy. In the old
> system the feedback loop was simple, we don't have admin time or money
> for servers we don't get the features, cloud allows us to get the
> features and enjoy them and at some point in the future the bill gets
> paid by someone else. Credit cards lifestyles all the way.

Uh ... where exactly do you get the credit card approach from? SPI is
legally not allowed to extend us a credit (we're not a legal org
anymore), so if we hit 0 it's out real quick. No credit for us. If SPI
isnt on top of that it's their loss (but they're getting pretty good
at tracking stuff with the contractor they now have and all that).

Which is not going to happen btw, if you've read the announcement mail
and all that.

Cheers, Daniel

> Like maybe we can grow up here and find sponsors to cover all of this,
> but it still feels a bit backwards from a fiscal pov.
>
> Again I'm not knocking the work people have done at all, CI is very
> valuable to the projects involved, but that doesn't absolve us from
> costs.
>
> Dave.



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

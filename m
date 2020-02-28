Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7881731F9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF566EE0B;
	Fri, 28 Feb 2020 07:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B6A6EE0F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 07:45:00 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id z9so1770218oth.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 23:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kf61Oc2Mm+EJmlvGuBiP3kaVR2kC8B2rZBEYbGPQudo=;
 b=FHVP1LaGA7l2CJFtXP2//tKLcBZhhyTM9YQVEz914rhNtP/Ic5uQ2xEHtt0tHMNiBH
 euSgA1pjK2UW/RzWk3h1Dkrx+rNCFbDz2OLHmyvDD3ouMX5SHI9AJr+0kydG6pFNDzRa
 CBke/xz8DIE3ejuHPsDgFnSMBhtCc7X+zZLf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kf61Oc2Mm+EJmlvGuBiP3kaVR2kC8B2rZBEYbGPQudo=;
 b=rOvXXhW6ZzsqBn/BArmobtdgw1wLrTaFu6nsndh/W93yhxq8k/x4lsPCnTrxVBhUHd
 K4hTwq8depL5zASOmg0OgZV9kIxYxuDQ8GJq49DVeWdE0dpFbPwkMkAOKuOr26Uy83s+
 J3nUYYJZK+5l973bfc1wJ6OvOMI3FN3pB9IUDYoIPnsIrTQf5vv77XdA5/IICI+20/xT
 JHv/uA4GG/DnzB1BwAoqdLYPRqWKWX+WEdOJHITKYIKI4XDq1IpoWeUJgLhrHE5lUnIu
 OZ2a2xERKZ/hLDkonvxCE88T+ysybC/esxSBgIpGkYRnJlLmjSbMLyfd5k2sTXX4tb3N
 PJcw==
X-Gm-Message-State: APjAAAU2ZwkC6C2XjkgmVvvaGXsCubYhau41kV+VypQ8HWTPsvlKT2+M
 WfMiVtL/dbFyHP/GMqC+fLM10UA7cdR3oQWqvzSP1w==
X-Google-Smtp-Source: APXvYqxOBvaV1MvAFAljq/YMZus/S7fG3rxYAl5Ogj/YnG00VQwqO0s2+HZ8k60fPSPOk3r/hcCLQWMyFuKD3cXkHnk=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr2403211otq.281.1582875899756; 
 Thu, 27 Feb 2020 23:44:59 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
In-Reply-To: <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 28 Feb 2020 08:44:48 +0100
Message-ID: <CAKMK7uHJy0v0Bdi10hcKUOwWrez_3rFT_kEOUxfPje-ruYO8AQ@mail.gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>, gstreamer-devel@lists.freedesktop.org,
 Mesa Dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 4:38 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 28 Feb 2020 at 07:27, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Hi all,
> >
> > You might have read the short take in the X.org board meeting minutes
> > already, here's the long version.
> >
> > The good news: gitlab.fd.o has become very popular with our
> > communities, and is used extensively. This especially includes all the
> > CI integration. Modern development process and tooling, yay!
> >
> > The bad news: The cost in growth has also been tremendous, and it's
> > breaking our bank account. With reasonable estimates for continued
> > growth we're expecting hosting expenses totalling 75k USD this year,
> > and 90k USD next year. With the current sponsors we've set up we can't
> > sustain that. We estimate that hosting expenses for gitlab.fd.o
> > without any of the CI features enabled would total 30k USD, which is
> > within X.org's ability to support through various sponsorships, mostly
> > through XDC.
> >
> > Note that X.org does no longer sponsor any CI runners themselves,
> > we've stopped that. The huge additional expenses are all just in
> > storing and serving build artifacts and images to outside CI runners
> > sponsored by various companies. A related topic is that with the
> > growth in fd.o it's becoming infeasible to maintain it all on
> > volunteer admin time. X.org is therefore also looking for admin
> > sponsorship, at least medium term.
> >
> > Assuming that we want cash flow reserves for one year of gitlab.fd.o
> > (without CI support) and a trimmed XDC and assuming no sponsor payment
> > meanwhile, we'd have to cut CI services somewhere between May and June
> > this year. The board is of course working on acquiring sponsors, but
> > filling a shortfall of this magnitude is neither easy nor quick work,
> > and we therefore decided to give an early warning as soon as possible.
> > Any help in finding sponsors for fd.o is very much appreciated.
>
> a) Ouch.
>
> b) we probably need to take a large step back here.
>
> Look at this from a sponsor POV, why would I give X.org/fd.o
> sponsorship money that they are just giving straight to google to pay
> for hosting credits? Google are profiting in some minor way from these
> hosting credits being bought by us, and I assume we aren't getting any
> sort of discounts here. Having google sponsor the credits costs google
> substantially less than having any other company give us money to do
> it.
>
> If our current CI architecture is going to burn this amount of money a
> year and we hadn't worked this out in advance of deploying it then I
> suggest the system should be taken offline until we work out what a
> sustainable system would look like within the budget we have, whether
> that be never transferring containers and build artifacts from the
> google network, just having local runner/build combos etc.

Google has sponsored 30k in hosting credits last year, these simply
ran out _much_ faster than anyone planned for. So this is by far not a
free thing for them. Plus there's also other companies sponsoring CI
runners and what not else in equally substantial amounts, plus the
biggest thing, sponsored admin time (more or less officially). So
there's a _lot_ of room for companies like Red Hat to sponsor without
throwing any money in google's revenue stream.

Or it doesn't happen, and then yeah the decision has already been made
to shutter the CI services. So this is also a question of whether we
(as a community and all the companies benefitting from the work done)
really want this, or maybe not quite.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEBB17460D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D086E1B7;
	Sat, 29 Feb 2020 10:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898C66EEA3;
 Fri, 28 Feb 2020 09:29:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kusma) with ESMTPSA id 8B71B2969AA
Message-ID: <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 28 Feb 2020 10:28:57 +0100
In-Reply-To: <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
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

On Fri, 2020-02-28 at 13:37 +1000, Dave Airlie wrote:
> On Fri, 28 Feb 2020 at 07:27, Daniel Vetter <daniel.vetter@ffwll.ch>
> wrote:
> > Hi all,
> > 
> > You might have read the short take in the X.org board meeting
> > minutes
> > already, here's the long version.
> > 
> > The good news: gitlab.fd.o has become very popular with our
> > communities, and is used extensively. This especially includes all
> > the
> > CI integration. Modern development process and tooling, yay!
> > 
> > The bad news: The cost in growth has also been tremendous, and it's
> > breaking our bank account. With reasonable estimates for continued
> > growth we're expecting hosting expenses totalling 75k USD this
> > year,
> > and 90k USD next year. With the current sponsors we've set up we
> > can't
> > sustain that. We estimate that hosting expenses for gitlab.fd.o
> > without any of the CI features enabled would total 30k USD, which
> > is
> > within X.org's ability to support through various sponsorships,
> > mostly
> > through XDC.
> > 
> > Note that X.org does no longer sponsor any CI runners themselves,
> > we've stopped that. The huge additional expenses are all just in
> > storing and serving build artifacts and images to outside CI
> > runners
> > sponsored by various companies. A related topic is that with the
> > growth in fd.o it's becoming infeasible to maintain it all on
> > volunteer admin time. X.org is therefore also looking for admin
> > sponsorship, at least medium term.
> > 
> > Assuming that we want cash flow reserves for one year of
> > gitlab.fd.o
> > (without CI support) and a trimmed XDC and assuming no sponsor
> > payment
> > meanwhile, we'd have to cut CI services somewhere between May and
> > June
> > this year. The board is of course working on acquiring sponsors,
> > but
> > filling a shortfall of this magnitude is neither easy nor quick
> > work,
> > and we therefore decided to give an early warning as soon as
> > possible.
> > Any help in finding sponsors for fd.o is very much appreciated.
> 
> a) Ouch.
> 
> b) we probably need to take a large step back here.
> 

I kinda agree, but maybe the step doesn't have to be *too* large?

I wonder if we could solve this by restructuring the project a bit. I'm
talking purely from a Mesa point of view here, so it might not solve
the full problem, but:

1. It feels silly that we need to test changes to e.g the i965 driver
on dragonboards. We only have a big "do not run CI at all" escape-
hatch.

2. A lot of us are working for a company that can probably pay for
their own needs in terms of CI. Perhaps moving some costs "up front" to
the company that needs it can make the future of CI for those who can't
do this 

3. I think we need a much more detailed break-down of the cost to make
educated changes. For instance, how expensive is Docker image
uploads/downloads (e.g intermediary artifacts) compared to build logs
and final test-results? What kind of artifacts?

One suggestion would be to do something more similar to what the kernel
does, and separate into different repos for different subsystems. This
could allow us to have separate testing-pipelines for these repos,
which would mean that for instance a change to RADV didn't trigger a
full Panfrost test-run.

This would probably require us to accept using a more branch-heavy
work-flow. I don't personally think that would be a bad thing.

But this is all kinda based on an assumption that running hardware-
testing is the expensive part. I think that's quite possibly the case,
but some more numbers would be helpful. I mean, it might turn out that
just throwing up a Docker cache inside the organizations that host
runners might be sufficient for all I know...

We could also do stuff like reducing the amount of tests we run on each
commit, and punt some testing to a per-weekend test-run or someting
like that. We don't *need* to know about every problem up front, just
the stuff that's about to be released, really. The other stuff is just
nice to have. If it's too expensive, I would say drop it.

I would really hope that we can consider approaches like this before we
throw out the baby with the bathwater...

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

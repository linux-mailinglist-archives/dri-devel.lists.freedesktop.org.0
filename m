Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D7173342
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 09:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6B66EE82;
	Fri, 28 Feb 2020 08:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF5D6EE7F;
 Fri, 28 Feb 2020 08:48:46 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id b3so1895204otp.4;
 Fri, 28 Feb 2020 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qlqcbHzLGRHY3M4I1/OUYzXJJe8cppDvyu4IteJROqQ=;
 b=Lm7qN7/0eapEKsVQo4dBy0J3g+JvL9toKdHY+NB0p7EaBrv2u/DeLJbo4xH1BjQKDS
 RlCbMDgJlAHpcbrxFFC4PYA00Yh06QM8Hb4QFyQVyiIS8fK+XPqDb/xy1Nnpi3RZh/k/
 pMRRswxuFDA93GE87Yhs4WzutlLSFyraIjRiYnzB/QiVUclwvdiTwLLI0uJKzn25jaNi
 a77898dsNuz8wXYum2aKRwAdO5mcA5qlXPyEsCrGBEz3D+94OhZuqnXLE8FaQFZRYarI
 4KucFL9/S0oQFu4gUfBT07ES0+Zb0mPgT6hhA9VDkyEfAlScK0M6DwRTuCY2FJ60VBSF
 Y5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qlqcbHzLGRHY3M4I1/OUYzXJJe8cppDvyu4IteJROqQ=;
 b=SoMeTrsL3aaPFBljIPcbWLNWfDATDCjX8HEdhGlG3TD5vhqlBnmUaAZblVkdJpgkxY
 hHR4pU1Rc9wu/uKTx7av+b81Exc+g/BXQe64eZeZP1utI1uEqBWDUQpGtBzIQqLm2yCC
 MqZZNDv07+D8dqlC+zJzOnQvr4fXzd2t3Kw/9kC7RcehjPStfhWFOJfk2wcveRxbaav8
 e80RtFg87uTOTY/7re6yvfUI5GoaMKXNkG+IORu2Y4CX5ocZJnWa/RG2Q9iAxHkkTJuZ
 P72PA+TPfwDZusv7/wy6brU300+3EwLadMsF7h5cLt3Bk/kJjnqkmoStOllve9+g0iib
 12SA==
X-Gm-Message-State: APjAAAWEPpxVl/kG5h2W8HOH7C8uMs86VFo7lQe+MzukILUKgbYVsaGL
 Fn7a9WbCb77633gBuKfrI/0KrdjdFkn6VSsQj0Q=
X-Google-Smtp-Source: APXvYqwVBOFl1TpJXZXKtDtiipbMYTeXRYob7LKHbziFADEK5HywFJjm/VMF4PIRai0Dygxg+py8tsbGUJWf6XL1OHE=
X-Received: by 2002:a9d:3bc4:: with SMTP id k62mr2497597otc.186.1582879725260; 
 Fri, 28 Feb 2020 00:48:45 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <CAPj87rM76W9y_76WUHR35NS3V4_-RFi9ZM3GA=aED3dD3hWYkg@mail.gmail.com>
In-Reply-To: <CAPj87rM76W9y_76WUHR35NS3V4_-RFi9ZM3GA=aED3dD3hWYkg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Feb 2020 18:48:33 +1000
Message-ID: <CAPM=9txN-RKGwinzsSPrmT_xFjS2J_XUhXVsRQ2pSSe529wpEA@mail.gmail.com>
Subject: Re: [Intel-gfx] gitlab.fd.o financial situation and impact on services
To: Daniel Stone <daniel@fooishbar.org>
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

On Fri, 28 Feb 2020 at 18:18, Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Fri, 28 Feb 2020 at 03:38, Dave Airlie <airlied@gmail.com> wrote:
> > b) we probably need to take a large step back here.
> >
> > Look at this from a sponsor POV, why would I give X.org/fd.o
> > sponsorship money that they are just giving straight to google to pay
> > for hosting credits? Google are profiting in some minor way from these
> > hosting credits being bought by us, and I assume we aren't getting any
> > sort of discounts here. Having google sponsor the credits costs google
> > substantially less than having any other company give us money to do
> > it.
>
> The last I looked, Google GCP / Amazon AWS / Azure were all pretty
> comparable in terms of what you get and what you pay for them.
> Obviously providers like Packet and Digital Ocean who offer bare-metal
> services are cheaper, but then you need to find someone who is going
> to properly administer the various machines, install decent
> monitoring, make sure that more storage is provisioned when we need
> more storage (which is basically all the time), make sure that the
> hardware is maintained in decent shape (pretty sure one of the fd.o
> machines has had a drive in imminent-failure state for the last few
> months), etc.
>
> Given the size of our service, that's a much better plan (IMO) than
> relying on someone who a) isn't an admin by trade, b) has a million
> other things to do, and c) hasn't wanted to do it for the past several
> years. But as long as that's the resources we have, then we're paying
> the cloud tradeoff, where we pay more money in exchange for fewer
> problems.

Admin for gitlab and CI is a full time role anyways. The system is
definitely not self sustaining without time being put in by you and
anholt still. If we have $75k to burn on credits, and it was diverted
to just pay an admin to admin the real hw + gitlab/CI would that not
be a better use of the money? I didn't know if we can afford $75k for
an admin, but suddenly we can afford it for gitlab credits?

> Yes, we could federate everything back out so everyone runs their own
> builds and executes those. Tinderbox did something really similar to
> that IIRC; not sure if Buildbot does as well. Probably rules out
> pre-merge testing, mind.

Why? does gitlab not support the model? having builds done in parallel
on runners closer to the test runners seems like it should be a thing.
I guess artifact transfer would cost less then as a result.

> The reason we hadn't worked everything out in advance of deploying is
> because Mesa has had 3993 MRs in the not long over a year since
> moving, and a similar number in GStreamer, just taking the two biggest
> users. At the start it was 'maybe let's use MRs if you want to but
> make sure everything still goes through the list', and now it's
> something different. Similarly the CI architecture hasn't been
> 'designed', so much as that people want to run dEQP and Piglit on
> their hardware pre-merge in an open fashion that's actually accessible
> to people, and have just done it.
>
> Again, if you want everything to be centrally
> designed/approved/monitored/controlled, that's a fine enough idea, and
> I'd be happy to support whoever it was who was doing that for all of
> fd.o.

I don't think we have any choice but to have someone centrally
controlling it, You can't have a system in place that lets CI users
burn largs sums of money without authorisation, and that is what we
have now.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

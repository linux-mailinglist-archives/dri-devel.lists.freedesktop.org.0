Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB58D1DAD91
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 10:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182B48945B;
	Wed, 20 May 2020 08:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAB88945B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 08:34:31 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 23so1013787oiq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1L1JOS2/7OGTnjyzE28TzRr49jWHnoSPZa2y83NoajY=;
 b=Qn5uiJsI1CiTUY1rMY/hdjYr4HiyDhfSz/K8IUT9Ct0Li9bZDcjTdmeeXfA+hvr4ye
 La4sGIwutRbBBmkURH52DondGQmalrdmlRIin7Ill0HhbtbF6vFYpxeVZtTbZ9uc0pM2
 QzWq0FNBS5CUP5cJj0ELZ9iBqOymG/dGQAeYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1L1JOS2/7OGTnjyzE28TzRr49jWHnoSPZa2y83NoajY=;
 b=DcqHgjYnWRToRytslUFb90LsTuXK3FFx1HmjFcNzGL3vGYwZIbx8B/J2pyhaHyJUSm
 EnSRJDQRkV3egIWAgp3/DHLEtBs2ZDZkHI93DZPl+5bnTV9/GFVFUVIN5SBcvR7ArPjM
 qM10wjczi+Cu4VDCCdKj7ZCZ0NlNmVHLpu8nicy8gu2PozwJpZLLonMvapcWachs6/Bm
 XM50aeD1LlOPB/6VAztAJ/zewt7ZE7uuC86dJ06fCXE0hHrqP5PvjUiey6SGKqUCb58R
 +3NNWwOpJNYI9Fr8RyJ0C87RlOt+EoeNG5HzYP2fPhM33RvERBBjkROzTmX23Bjwf8RI
 rCXA==
X-Gm-Message-State: AOAM532MugT4F+TdIp5suxs0YUkG0cviz58/ugGCK79xs8LcfJTs+siz
 L+kL9dLjPkD/cgdCOWWNSet5oCgrDRUZ3WGEFqAZhKX9
X-Google-Smtp-Source: ABdhPJzRbDLGTxxiGJOBqDYbay1jUZRZiOz0ftQQbB6lk0Qs5tbLJUocvqI+dvatbwDgQkZMRCmeij1RrgUlJ6saFTg=
X-Received: by 2002:a05:6808:282:: with SMTP id
 z2mr2215511oic.101.1589963670477; 
 Wed, 20 May 2020 01:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
 <20200520051536.GA2141566@kroah.com>
In-Reply-To: <20200520051536.GA2141566@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 May 2020 10:34:19 +0200
Message-ID: <CAKMK7uEbwTK68sxhf452fPHzAreQqRbRc7=RLGX-9SesXnJnLQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Olof Johansson <olof.johansson@gmail.com>, wufan@codeaurora.org,
 Arnd Bergmann <arnd@arndb.de>, Jeffrey Hugo <jhugo@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, pratanan@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 7:15 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:
> > On Tue, May 19, 2020 at 07:41:20PM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, May 19, 2020 at 08:57:38AM -0600, Jeffrey Hugo wrote:
> > > > On 5/18/2020 11:08 PM, Dave Airlie wrote:
> > > > > On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> > > > > >
> > > > > > Introduction:
> > > > > > Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
> > > > > > SoC ASIC for the purpose of efficently running Deep Learning inference
> > > > > > workloads in a data center environment.
> > > > > >
> > > > > > The offical press release can be found at -
> > > > > > https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
> > > > > >
> > > > > > The offical product website is -
> > > > > > https://www.qualcomm.com/products/datacenter-artificial-intelligence
> > > > > >
> > > > > > At the time of the offical press release, numerious technology news sites
> > > > > > also covered the product.  Doing a search of your favorite site is likely
> > > > > > to find their coverage of it.
> > > > > >
> > > > > > It is our goal to have the kernel driver for the product fully upstream.
> > > > > > The purpose of this RFC is to start that process.  We are still doing
> > > > > > development (see below), and thus not quite looking to gain acceptance quite
> > > > > > yet, but now that we have a working driver we beleive we are at the stage
> > > > > > where meaningful conversation with the community can occur.
> > > > >
> > > > >
> > > > > Hi Jeffery,
> > > > >
> > > > > Just wondering what the userspace/testing plans for this driver.
> > > > >
> > > > > This introduces a new user facing API for a device without pointers to
> > > > > users or tests for that API.
> > > >
> > > > We have daily internal testing, although I don't expect you to take my word
> > > > for that.
> > > >
> > > > I would like to get one of these devices into the hands of Linaro, so that
> > > > it can be put into KernelCI.  Similar to other Qualcomm products. I'm trying
> > > > to convince the powers that be to make this happen.
> > > >
> > > > Regarding what the community could do on its own, everything but the Linux
> > > > driver is considered proprietary - that includes the on device firmware and
> > > > the entire userspace stack.  This is a decision above my pay grade.
> > >
> > > Ok, that's a decision you are going to have to push upward on, as we
> > > really can't take this without a working, open, userspace.
> >
> > Uh wut.
> >
> > So the merge criteria for drivers/accel (atm still drivers/misc but I
> > thought that was interim until more drivers showed up) isn't actually
> > "totally-not-a-gpu accel driver without open source userspace".
> >
> > Instead it's "totally-not-a-gpu accel driver without open source
> > userspace" _and_ you have to be best buddies with Greg. Or at least
> > not be on the naughty company list. Since for habanalabs all you
> > wanted is a few test cases to exercise the ioctls. Not the entire
> > userspace.
>
> Also, to be fair, I have changed my mind after seeing the mess of
> complexity that these "ioctls for everyone!" type of pass-through
> these kinds of drivers are creating.  You were right, we need open
> userspace code in order to be able to properly evaluate and figure out
> what they are doing is right or not and be able to maintain things over
> time correctly.
>
> So I was wrong, and you were right, my apologies for my previous
> stubbornness.

Awesome and don't worry, I'm pretty sure we've all been stubborn
occasionally :-)

From a drivers/gpu pov I think still not quite there since we also
want to see the compiler for these programmable accelerator thingies.
But just having a fairly good consensus that "userspace library with
all the runtime stuff excluding compiler must be open" is a huge step
forward. Next step may be that we (kernel overall, drivers/gpu will
still ask for the full thing) have ISA docs for these programmable
things, so that we can also evaluate that aspect and gauge how many
security issues there might be. Plus have a fighting chance to fix up
the security leaks when (post smeltdown I don't really want to
consider this an if) someone finds a hole in the hw security wall. At
least in drivers/gpu we historically have a ton of drivers with
command checkers to validate what userspace wants to run on the
accelerator thingie. Both in cases where the hw was accidentally too
strict, and not strict enough.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

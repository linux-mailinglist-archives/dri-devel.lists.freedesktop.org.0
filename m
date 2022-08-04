Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE38E58A00C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 19:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103F9BFF6;
	Thu,  4 Aug 2022 17:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E380B9E2A6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 17:53:34 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id q184so251069oif.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=geQKvVgUIrbIYqUyW/DcQqiSd9imQnwOiLDTjM9ijiM=;
 b=EEuFgw/lIJQA/31pdk+fOk++kLMbRbd9jGZAr/sPZdCKoZaK9L9bJZ6pJqLvfvkblm
 hXhLKeIe6Vpqt2Iz3ofypgNATKNk7cOQAsbbI3hIscEuApeb+xdDyZJ/VNODlAzdStSm
 kw1e6bt0PdUqFPhepSmCp9w26ACgmITzUlDdgo2zhLNuFpqCw6xPgWWZyB0engV4+TuP
 o/KwoG4uMp4oBuRjMDqIH0xf7bu+3EUgZx3nFCEPd2WbEiXgusg1H7O0J7maxLFhGmFQ
 m3+11Em/XXPOeJTdAMrGfvK0gTPvVY+lddfbzFBAcYCmYohK2Jb1K6vnjhKBxL2FpYX/
 nIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=geQKvVgUIrbIYqUyW/DcQqiSd9imQnwOiLDTjM9ijiM=;
 b=Cd9fp4Mqfc250ZsUgUTjamq21miIlzjTlnIvxMvcNOqU8NuqWXu/uY7lwhPLqAUc/8
 d6zlDc+mg/Px3yCOR1uZw0pp81y0EiKM5ypXER8BnYBPvBo1j/8JABmoQ7OqGbGX+GPW
 Xf4o1RrkCft13nHph1mKFcm2uR8lmgf3z4C/KG7DBlHCaJsZQNl/Dkvb4L8KCjpM8n+k
 iwJ6MHvMG+shN2hlM/pJr/ZGQAgVsMDGs5+03ks+aarmK5qhnMUkRtF8i3YQLFsoxeZM
 7RFAS44nozNUDeEk2gc4dUF1qSYiq/OjHkV2nLagvc4/D3ayqlWknTGNiuRV0EXgE293
 JRJA==
X-Gm-Message-State: ACgBeo3KYNn0uNBxv2J1O3FV/zoHbvSoNoGfkL/lUz7XRx+RW8iIJhdI
 PgjAyCvIkXv5l+drYSkLkIDKk44dmxg5RqSX4aI=
X-Google-Smtp-Source: AA6agR61XlZ3sqh/frADT6/ObtuMMuW2jCbC/8voPeg9czkI8z4sn5r+2KMGL5+VAOXTQcE2hive+AORaMmUR1xk6Gg=
X-Received: by 2002:a05:6808:11cc:b0:32e:7fc5:3a49 with SMTP id
 p12-20020a05680811cc00b0032e7fc53a49mr1341752oiv.166.1659635613886; Thu, 04
 Aug 2022 10:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <e9250ec3-1e29-5b38-c4eb-7e380f1eed4f@linux.intel.com>
 <a869ef99-9cc6-d3a0-ddcc-7257eac32f01@quicinc.com>
In-Reply-To: <a869ef99-9cc6-d3a0-ddcc-7257eac32f01@quicinc.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Thu, 4 Aug 2022 20:53:06 +0300
Message-ID: <CAFCwf1309BW80F0d+uweswpKh7TOuVnn+AyVymw23TiWCRENDQ@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 6:04 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 8/4/2022 6:00 AM, Tvrtko Ursulin wrote:
> >
> > On 04/08/2022 00:54, Dave Airlie wrote:
> >> On Thu, 4 Aug 2022 at 06:21, Oded Gabbay <oded.gabbay@gmail.com> wrote:
> >>>
> >>> On Wed, Aug 3, 2022 at 10:04 PM Dave Airlie <airlied@gmail.com> wrote:
> >>>>
> >>>> On Sun, 31 Jul 2022 at 22:04, Oded Gabbay <oded.gabbay@gmail.com>
> >>>> wrote:
> >>>>>
> >>>>> Hi,
> >>>>> Greg and I talked a couple of months ago about preparing a new accel
> >>>>> subsystem for compute/acceleration devices that are not GPUs and I
> >>>>> think your drivers that you are now trying to upstream fit it as well.
> >>>>
> >>>> We've had some submissions for not-GPUs to the drm subsystem recently.
> >>>>
> >>>> Intel GNA, Intel VPU, NVDLA, rpmsg AI processor unit.
> >>>>
> >>>> why is creating a new subsystem at this time necessary?
> >>>>
> >>>> Are we just creating a subsystem to avoid the open source userspace
> >>>> consumer rules? Or do we have some concrete reasoning behind it?
> >>>>
> >>>> Dave.
> >>>
> >>> Hi Dave.
> >>> The reason it happened now is because I saw two drivers, which are
> >>> doing h/w acceleration for AI, trying to be accepted to the misc
> >>> subsystem.
> >>> Add to that the fact I talked with Greg a couple of months ago about
> >>> doing a subsystem for any compute accelerators, which he was positive
> >>> about, I thought it is a good opportunity to finally do it.
> >>>
> >>> I also honestly think that I can contribute much to these drivers from
> >>> my experience with the habana driver (which is now deployed in mass at
> >>> AWS) and contribute code from the habana driver to a common framework
> >>> for AI drivers.
> >>
> >> Why not port the habana driver to drm now instead? I don't get why it
> >> wouldn't make sense?
> >>
> >> Stepping up to create a new subsystem is great, but we need rules
> >> around what belongs where, we can't just spawn new subsystems when we
> >> have no clear guidelines on where drivers should land.
> >>
> >> What are the rules for a new accel subsystem? Do we have to now
> >> retarget the 3 drivers that are queued up to use drm for accelerators,
> >> because 2 drivers don't?
> >
> > Isn't there three on the "don't prefer drm" side as well? Habana,
> > Toshiba and Samsung? Just so the numbers argument is not misrepresented.
> > Perhaps a poll like a) prefer DRM, b) prefer a new subsystem, c) don't
> > care in principle; is in order?
>
> I'll chime in with my opinions.  Take them for what you will.
>
> I would say I fall into the C category, but I'm targeting DRM and will
> be the 5th(?) accel device to do so.
>
> I'll say that the ksummit (from what I see in the LWN article) made me
> very happy.  Finally, the community had clear rules for accel drivers.
> When I targeted misc in the past, it seemed like Greg moved the goal
> post just for me, which stalled our attempt.  It was even more
> frustrating to see that the high bar Greg set for us was not applied to
> other devices of the same "class" in following submissions.
>
> However, the past is the past, and based on ksummit, we've spent a
> number of months retargeting DRM.  In a week (or two), I plan to post
> something to start up the discussions again.
>
> As far as the DRM userspace requirements, unless we've misunderstood
> something, they've been easier to satisfy (pending review I suppose)
> than what misc has set.
I think it is quite the opposite. In misc originally there was very
minimal userspace requirements, but when my driver started to use
dma-buf, Dave asked for more.
e.g. a driver that wants to get accepted to DRM and use a fork of LLVM
must not only open-source his code, but also to upstream his fork to
the mainline LLVM tree. In misc there is nothing that closely comes to
that requirement afaik.
>
> I would say that Dave Airlie's feedback on this discussion resonates
> with me.  From the perspective of a vendor wanting to be a part of the
> community, clear rules are important and ksummit seemed to set that.
> Oded's announcement has thrown all of that into the wind.  Without a
That wasn't my intention. I simply wanted to:
1. Offload Greg with these types of drivers.
2. Offer to the new drivers a standard char device handling
3. Start a community of kernel hackers that are writing device drivers
for compute accelerators.

> proposal to evaluate (eg show me the code with clear guidelines), I
> cannot seriously consider Oded's idea, and I'm not sure I want to sit by
> another few years to see it settle out.
I thought of posting something quick (but not dirty) but this backlash
has made me rethink that.

>
> I expect to move forward with what we were planning prior to seeing this
> thread which is targeting DRM.  We'll see what the DRM folks say when
> they have something to look at.  If our device doesn't fit in DRM per an
> assessment of the DRM folks, then I sure hope they can suggest where we
> do fit because then we'll have tried misc and DRM, and not found a home.
>   Since "drivers/accel" doesn't exist, and realistically won't for a
> long time if ever, I don't see why we should consider it.
>
> Why DRM?  We consume dma_buf and might look to p2pdma in the future.
> ksummit appears clear - we are a DRM device.  Also, someone could
> probably run openCL on our device if they were so inclined to wire it
> up.  Over time, I've come to the thinking that we are a GPU, just
> without display.  Yes, it would have helped if DRM and/or drivers/gpu
> were renamed, but I think I'm past that point.  Once you have everything
> written, it doesn't seem like it matters if the uAPI device is called
> /dev/drmX, /dev/miscX, or /dev/magic.
>
> I will not opine on other devices as I am no expert on them.  Today, my
> opinion is that DRM is the best place for me.  We'll see where that goes.
>
> > More to the point, code sharing is a very compelling argument if it can
> > be demonstrated to be significant, aka not needing to reinvent the same
> > wheel.
> >
> > Perhaps one route forward could be a) to consider is to rename DRM to
> > something more appropriate, removing rendering from the name and
> > replacing with accelerators, co-processors, I don't know... Although I
> > am not sure renaming the codebase, character device node names and
> > userspace headers is all that feasible. Thought to mention it
> > nevertheless, maybe it gives an idea to someone how it could be done.
> >
> > And b) allow the userspace rules to be considered per driver, or per
> > class (is it a gpu or not should be a question that can be answered).
> > Shouldn't be a blocker if it still matches the rules present elsewhere
> > in the kernel.
> >
> > Those two would remove the two most contentions points as far as I
> > understood the thread.
> >
> > Regards,
> >
> > Tvrtko
> >
>

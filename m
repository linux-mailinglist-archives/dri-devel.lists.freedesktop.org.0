Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A328127752B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 17:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A2F6EB1D;
	Thu, 24 Sep 2020 15:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7569A6EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 15:23:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so4038573wmm.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7286v2n5MsKNIWaDNjy3w7lnkrAjciTfY1U8kqoxZQs=;
 b=V1HbQ0SGQPBcZyu/T+PtWOHlNSTDGeXxYBiZVZbJDmjiRpNDDhzl2qHiUkzU6s93YA
 pTquOpoRoknVz8i6YirNK7quZfh2VTEW85j+O0tJ9/Y8VXB+JZf7DVJU6M5swufm3YCT
 bpYr/TGzwR8wwxWPRRia8EqHi97KSuWm9aw19jDueELlRSLH8h4te86Q7R/tdCCHwrLc
 k1Hv6a3cuXzhaE9Y6YpEHjFStuKxFsl3ZU6qLHs0RvaZo+kyH+14mBIDGjdJjdVLmDiT
 STy5kyLvE1UEtfMI4wSrTHSCU1u5UU6JA8WL7EbAV8mDqOT/fwu+ZFjG+SXqy4SDWMFu
 xs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7286v2n5MsKNIWaDNjy3w7lnkrAjciTfY1U8kqoxZQs=;
 b=e1hDcZl2mXOe/iahCRzE2enfEkuqiyJU958IRvDB5LCtw0SeUSdh5b/isTrBt9XSG+
 IzFB9kbMkL2iWx0DEVFH4LZfKRF9mDc1bRi8kSOV5CPIAEehOZA+SgMiywqomfvHCNky
 ROFLNKyz/J2CQ4R1F8nqEMu2HuKcPR/HYXo2yDp62EW9DweLhmAGsGGIaAoh++69yE/w
 olYlmjs6WOsNWyfcuxPp6cnJYH/QC5mzf5sEuGj1+ZywiOOMrAatNjTZabAihHCdtHnp
 aGI5OZ92bFnTPaMb3NPOJEzZPg7xJsfZWbxxooh+llXjUxgZy04eNM4lKJPxZil9zrAV
 DgSw==
X-Gm-Message-State: AOAM533iY/LuL85Y0IpE0vOxiJlU79LL5mA7CiOSx2I8SnO2fbj7TYQf
 +l27CrlVKKNUMV/+pcfGc3y+xBQv0xwF3LMXiz/0YkNz
X-Google-Smtp-Source: ABdhPJzAAHwCZBGWgG8Ih+dVEfLlrq+rE83hkHZb956tO4J6xMktEkZnLNyK+z5MV/UDBVB0SP+UeWo+jR5L67QbWSo=
X-Received: by 2002:a05:600c:2183:: with SMTP id
 e3mr5625462wme.49.1600961015780; 
 Thu, 24 Sep 2020 08:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200921092154.GJ438822@phenom.ffwll.local>
 <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
 <CAKMK7uEqDD-oDAQKyA9DQbxkCgEjC5yyjvKR7d8T0Gj0SqEZ4A@mail.gmail.com>
 <CAF6AEGtYAn+W8HxP7SXtxPr5FsEB1hYGU91WrHCtwX89UmUR5w@mail.gmail.com>
 <20200923152545.GQ438822@phenom.ffwll.local>
 <CAF6AEGs9xDOoG3n4E_+6iDaiJXp_hqvSV1VKE=vpvG-twYPoew@mail.gmail.com>
 <20200924084950.GY438822@phenom.ffwll.local>
In-Reply-To: <20200924084950.GY438822@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 24 Sep 2020 08:24:37 -0700
Message-ID: <CAF6AEGt9-2Fo=eWt0cZaS4mEDoSbEOVTJoraqm7gB_Cuue4snA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Tim Murray <timmurray@google.com>, Tejun Heo <tj@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 1:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 23, 2020 at 07:33:17PM -0700, Rob Clark wrote:
> > On Wed, Sep 23, 2020 at 8:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Sep 22, 2020 at 07:48:10AM -0700, Rob Clark wrote:
> > > > On Mon, Sep 21, 2020 at 11:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Mon, Sep 21, 2020 at 5:16 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > > >
> > > > > > On Mon, Sep 21, 2020 at 2:21 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > >
> > > > > > > On Sat, Sep 19, 2020 at 12:37:23PM -0700, Rob Clark wrote:
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > >
> > > > > > > > The android userspace treats the display pipeline as a realtime problem.
> > > > > > > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > > > > > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > > > > > > that I found.)
> > > > > > > >
> > > > > > > > But this presents a problem with using workqueues for non-blocking
> > > > > > > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > > > > > > preempt the worker.  Which is not really the outcome you want.. once
> > > > > > > > the required fences are scheduled, you want to push the atomic commit
> > > > > > > > down to hw ASAP.
> > > > > > > >
> > > > > > > > But the decision of whether commit_work should be RT or not really
> > > > > > > > depends on what userspace is doing.  For a pure CFS userspace display
> > > > > > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > > > > > >
> > > > > > > > To handle this, convert non-blocking commit_work() to use per-CRTC
> > > > > > > > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > > > > > > > used to avoid serializing commits when userspace is using a per-CRTC
> > > > > > > > update loop.
> > > > > > > >
> > > > > > > > A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> > > > > > > > priority commit work.
> > > > > > > >
> > > > > > > > A potential issue is that since 616d91b68cd ("sched: Remove
> > > > > > > > sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> > > > > > > > meaning that commit_work() ends up running at the same priority level
> > > > > > > > as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> > > > > > > > use of vblank-work at this point.  And if it could be arranged that
> > > > > > > > vblank-work is scheduled before signaling out-fences and/or sending
> > > > > > > > pageflip events, it could probably work ok to use a single priority
> > > > > > > > level for both commit-work and vblank-work.
> > > > > > >
> > > > > > > The part I don't like about this is that it all feels rather hacked
> > > > > > > together, and if we add more stuff (or there's some different thing in the
> > > > > > > system that also needs rt scheduling) then it doesn't compose.
> > > > > >
> > > > > > The ideal thing would be that userspace is in control of the
> > > > > > priorities.. the setclientcap approach seemed like a reasonable way to
> > > > > > give the drm-master a way to opt in.
> > > > > >
> > > > > > I suppose instead userspace could use sched_setscheduler().. but that
> > > > > > would require userspace to be root, and would require some way to find
> > > > > > the tid.
> > > > >
> > > > > Userspace already needs that for the SCHED_FIFO for surface-flinger.
> > > > > Or is the problem that CAP_SYS_NICE is only good for your own
> > > > > processes?
> > > >
> > > > tbh, I'm not completely sure offhand what gives surfaceflinger
> > > > permission to set itself SCHED_FIFO
> > > >
> > > > (But on CrOS there are a few more pieces to the puzzle)
> > > >
> > > > > Other question I have for this is whether there's any recommendations
> > > > > for naming the kthreads (since I guess that name is what becomes the
> > > > > uapi for userspace to control this)?
> > > > >
> > > > > Otherwise I think "userspace calls sched_setscheduler on the right
> > > > > kthreads" sounds like a good interface, since it lets userspace decide
> > > > > how it all needs to fit together and compose. Anything we hard-code in
> > > > > an ioctl is kinda lost cause. And we can choose the default values to
> > > > > work reasonably well when the compositor runs at normal priority
> > > > > (lowest niceness or something like that for the commit work).
> > > >
> > > > I don't really like the naming convention approach.. what is to stop
> > > > some unrelated process to name it's thread the same thing to get a
> > > > SCHED_FIFO boost..
> > > >
> > > > But we can stick with my idea to expose the thread id as a read-only
> > > > CRTC property, for userspace to find the things to call
> > > > sched_setscheduler() on.  If for whatever reason the drm master is not
> > > > privileged (or is running in a sandbox, etc), a small helper that has
> > > > the necessary permissions could open the drm device to find the CRTC
> > > > thread-ids and call sched_setscheduler()..
> > >
> > > Hm thread ids don't translate too well across PID namespaces I think ...
> > > So that's another can of worms. And pidfd doesn't really work as a
> > > property.
> >
> > hmm, I was kinda hoping there was already a solution for translating
> > thread-id's, but hadn't had a chance to dig through it yet
>
> You can translate them, and it happens automatically in process context
> (iirc at least). But when we set the read-only prop we don't know which
> process namespace the compositor is sitting in, so that translation isn't
> doing us any good.

Well, that only requires writing some code.. when I mentioned
read-only, I just meant that it is read-only from the userspace
standpoint.  But we would need some hook when the property is read to
do the translation so userspace sees the appropriate value

BR,
-R

> I think there's a root namespace that the kernel uses, but tbh I'm not
> sure how this all works.
>
> > > I also thought kernel threads can be distinguished from others, so
> > > userspace shouldn't be able to sneak in and get elevated by accident.
> >
> > I guess maybe you could look at the parent?  I still would like to
> > think that we could come up with something a bit less shaking than
> > matching thread names by regexp..
>
> ps marks up kernel threads with [], so there is a way. But I haven't
> looked at what it is exactly that tells kernel threads apart from others.
>
> But aside from that sounds like "match right kernel thread with regex and
> set its scheduler class" is how this is currently done, if I'm
> understanding what Tejun and Peter said correctly.
>
> Not pretty, but also *shrug* ...
> -Daniel
>
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > -Daniel
> > > > >
> > > > > > Is there some way we could arrange for the per-crtc kthread's to be
> > > > > > owned by the drm master?  That would solve the "must be root" issue.
> > > > > > And since the target audience is an atomic userspace, I suppose we
> > > > > > could expose the tid as a read-only property on the crtc?
> > > > > >
> > > > > > BR,
> > > > > > -R
> > > > > >
> > > > > > > So question to rt/worker folks: What's the best way to let userspace set
> > > > > > > the scheduling mode and priorities of things the kernel does on its
> > > > > > > behalf? Surely we're not the first ones where if userspace runs with some
> > > > > > > rt priority it'll starve out the kernel workers that it needs. Hardcoding
> > > > > > > something behind a subsystem ioctl (which just means every time userspace
> > > > > > > changes what it does, we need a new such flag or mode) can't be the right
> > > > > > > thing.
> > > > > > >
> > > > > > > Peter, Tejun?
> > > > > > >
> > > > > > > Thanks, Daniel
> > > > > > >
> > > > > > > >
> > > > > > > > Rob Clark (3):
> > > > > > > >   drm/crtc: Introduce per-crtc kworker
> > > > > > > >   drm/atomic: Use kthread worker for nonblocking commits
> > > > > > > >   drm: Add a client-cap to set scheduling mode
> > > > > > > >
> > > > > > > >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
> > > > > > > >  drivers/gpu/drm/drm_auth.c          |  4 ++++
> > > > > > > >  drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
> > > > > > > >  drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
> > > > > > > >  include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
> > > > > > > >  include/drm/drm_crtc.h              | 10 ++++++++
> > > > > > > >  include/uapi/drm/drm.h              | 13 ++++++++++
> > > > > > > >  7 files changed, 117 insertions(+), 4 deletions(-)
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.26.2
> > > > > > > >
> > > > > > > > _______________________________________________
> > > > > > > > dri-devel mailing list
> > > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > > > _______________________________________________
> > > > > > dri-devel mailing list
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

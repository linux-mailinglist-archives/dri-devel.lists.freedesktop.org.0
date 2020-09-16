Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B926CB87
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 22:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CC36EB23;
	Wed, 16 Sep 2020 20:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624626EB21
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 20:29:18 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g96so7883184otb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jfgJnSB2bhKQDSQtNR/O8X7GsVYOAbT1ea08kPi1xE8=;
 b=Hg8y851ePYZ8WQiMJoPwyU+sXO5H1E4m1YWgJB25Vi80MlW/sWDUqOxp2mcpnbFjRA
 JQaXwZKjvCdBn7KFi5t/HBjntwthC3FY/aIkSk+md/+gwxuei9VHD6ldDA1E5QelovRK
 REsPW2xBPjZrnpKbi5tB6r38dw//jdnXVvQX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jfgJnSB2bhKQDSQtNR/O8X7GsVYOAbT1ea08kPi1xE8=;
 b=Tsjsms/IecmTww/jzldVSgazCcYyx5FTw6+W5YlBCf5ZYOuIV4Bh78b1KXORQaKrDa
 WaLQeQFMEdvlda9NkRBkx107l3lqS37YithzOFUIWeJckj6FtG6q8A8OpGjzXXDrb4Ad
 L85vGeS2MJLscjoCGitzLmh9/oJ+JMF5EhXpA78Nfaik51J/qh0IvmesDuchdSHQ7S5l
 4uRG9URsnchOIxquULM9qjLbJPeem7dz6DQD+MAG8IJ0EZUV5NcrebfJCJYjbyxCgDfy
 Y2pHLXQ0PgISxH0ico5yCOC7nhyO3JhFbxnpyfCJ8dExykJ6i6Zs7Y/SM9DUC7wXjWPT
 zHiQ==
X-Gm-Message-State: AOAM530IkvXdtB1aLQ9rfjwlLEE8y84RvmF3JTYDnXnPIghe7Gx/0c6Y
 II2MzeKLRr0eu1OK426flsqwLJZiuca3x+9Xp25fJQ==
X-Google-Smtp-Source: ABdhPJyp9Of+LYn6qLPki7Nl/8rfmMLDV2B7cI3AVOwAQ4KqtvLG8pHiS+TQrmOMl+LluaOA2Eov6ysFmH7fg1w3xeE=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr18605193otq.188.1600288157601; 
 Wed, 16 Sep 2020 13:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de>
 <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
 <CAKMK7uHAk9-Vy2cof0ws=DrcD52GHiCDiyHbjLd19CgpBU2rKQ@mail.gmail.com>
 <20200916152956.GV29330@paulmck-ThinkPad-P72>
In-Reply-To: <20200916152956.GV29330@paulmck-ThinkPad-P72>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 16 Sep 2020 22:29:06 +0200
Message-ID: <CAKMK7uGFyfhEyt=jmdk2jDO-hq0_Pf0ck+cKSELHjr2U3rPuYQ@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Linux-MM <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Brian Cain <bcain@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Ard Biesheuvel <ardb@kernel.org>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 Shuah Khan <shuah@kernel.org>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 5:29 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Sep 16, 2020 at 09:37:17AM +0200, Daniel Vetter wrote:
> > On Tue, Sep 15, 2020 at 7:35 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > On Tue, Sep 15, 2020 at 1:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> > > >
> > > > OTOH, having a working 'preemptible()' or maybe better named
> > > > 'can_schedule()' check makes tons of sense to make decisions about
> > > > allocation modes or other things.
> > >
> > > No. I think that those kinds of decisions about actual behavior are
> > > always simply fundamentally wrong.
> > >
> > > Note that this is very different from having warnings about invalid
> > > use. THAT is correct. It may not warn in all configurations, but that
> > > doesn't matter: what matters is that it warns in common enough
> > > configurations that developers will catch it.
> > >
> > > So having a warning in "might_sleep()" that doesn't always trigger,
> > > because you have a limited configuration that can't even detect the
> > > situation, that's fine and dandy and intentional.
> > >
> > > But having code like
> > >
> > >        if (can_schedule())
> > >            .. do something different ..
> > >
> > > is fundamentally complete and utter garbage.
> > >
> > > It's one thing if you test for "am I in hardware interrupt context".
> > > Those tests aren't great either, but at least they make sense.
> > >
> > > But a driver - or some library routine - making a difference based on
> > > some nebulous "can I schedule" is fundamentally and basically WRONG.
> > >
> > > If some code changes behavior, it needs to be explicit to the *caller*
> > > of that code.
> > >
> > > So this is why GFP_ATOMIC is fine, but "if (!can_schedule())
> > > do_something_atomic()" is pure shite.
> > >
> > > And I am not IN THE LEAST interested in trying to help people doing
> > > pure shite. We need to fix them. Like the crypto code is getting
> > > fixed.
> >
> > Just figured I'll throw my +1 in from reading too many (gpu) drivers.
> > Code that tries to cleverly adjust its behaviour depending upon the
> > context it's running in is harder to understand and blows up in more
> > interesting ways. We still have drm_can_sleep() and it's mostly just
> > used for debug code, and I've largely ended up just deleting
> > everything that used it because when you're driver is blowing up the
> > last thing you want is to realize your debug code and output can't be
> > relied upon. Or worse, that the only Oops you have is the one in the
> > debug code, because the real one scrolled away - the original idea
> > behind drm_can_sleep was to make all the modeset code work
> > automagically both in normal ioctl/kworker context and in the panic
> > handlers or kgdb callbacks. Wishful thinking at best.
> >
> > Also at least for me that extends to everything, e.g. I much prefer
> > explicit spin_lock and spin_lock_irq vs magic spin_lock_irqsave for
> > locks shared with interrupt handlers, since the former two gives me
> > clear information from which contexts such function can be called.
> > Other end is the memalloc_no*_save/restore functions, where I recently
> > made a real big fool of myself because I didn't realize how much that
> > impacts everything that's run within - suddenly "GFP_KERNEL for small
> > stuff never fails" is wrong everywhere.
> >
> > It's all great for debugging and sanity checks (and we run with all
> > that stuff enabled in our CI), but really semantic changes depending
> > upon magic context checks freak my out :-)
>
> All fair, but some of us need to write code that must handle being
> invoked from a wide variety of contexts.  Now perhaps you like the idea of
> call_rcu() for schedulable contexts, call_rcu_nosched() when preemption
> is disabled, call_rcu_irqs_are_disabled() when interrupts are disabled,
> call_rcu_raw_atomic() from contexts where (for example) raw spinlocks
> are held, and so on.  However, from what I can see, most people instead
> consistently prefer that the RCU API instead be consolidated.
>
> Some in-flight cache-efficiency work for kvfree_rcu() and call_rcu()
> needs to be able to allocate memory occasionally.  It can do that when
> invoked from some contexts, but not when invoked from others.  Right now,
> in !PREEMPT kernels, it cannot tell, and must either do things to the
> memory allocators that some of the MM hate or must unnecessarily invoke
> workqueues.  Thomas's patches would allow the code to just allocate in
> the common case when these primitives are invoked from contexts where
> allocation is permitted.
>
> If we want to restrict access to the can_schedule() or whatever primitive,
> fine and good.  We can add a check to checkpatch.pl, for example.  Maybe
> we can go back to the old brlock approach of requiring certain people's
> review for each addition to the kernel.
>
> But there really are use cases that it would greatly help.

We can deadlock in random fun places if random stuff we're calling
suddenly starts allocating. Sometimes. Maybe once in a blue moon, to
make it extra fun to reproduce. Maybe most driver subsystems are less
brittle, but gpu drivers definitely need to know about the details for
exactly this example. And yes gpu drivers use rcu for freeing
dma_fence structures, and that tends to happen in code that we only
recently figured out should really not allocate memory.

I think minimally you need to throw in an unconditional
fs_reclaim_acquire();fs_reclaim_release(); so that everyone who runs
with full debugging knows what might happen. It's kinda like
might_sleep, but a lot more specific. might_sleep() alone is not
enough, because in the specific code paths I'm thinking of (and
created special lockdep annotations for just recently) sleeping is
allowed, but any memory allocations with GFP_RECLAIM set are no-go.

Cheers, Daniel




--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

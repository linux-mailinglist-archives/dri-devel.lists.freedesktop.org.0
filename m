Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DA3EF52B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 23:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B836E252;
	Tue, 17 Aug 2021 21:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8347B6E245
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 21:49:48 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 w2-20020a4a9e420000b02902859adadf0fso92108ook.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xz8zuSthoyZIRP05hlqEeVhJtvIzUt/IODad5FgoUVc=;
 b=RyC0HPBf0e+Hourz3SQXYdmCfWpL7sE649SMz9QkdG/M/tCqOU1PYzZeSiaCWTxwp5
 60rUwjVx/PNNw4c5YkH55euZkUSX6uEGlpjg5uCgOfG414PNxerxnFoQefi7k+kAI6uM
 a1EjfFBShN+q1cFEagT8cLfV0Y9OhXdMQ3k7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xz8zuSthoyZIRP05hlqEeVhJtvIzUt/IODad5FgoUVc=;
 b=EBX331Yv6SsXCINVflFYCTI4G6sQRNPMLV7oJaGEWKRSN12g+sKlcoN3E+5CH0o/al
 lNwQaL8aMQHYYuafn/LIRTTAQGlCdAcPYVY0r6PucQ00S/Do+OxpDDiGjXON+GgYmyMm
 hX4fEG4vasD8nIqIXpHKA9EZ5GkUCSnHwxDsZ+Qxa2tjc0QeK2JpQ6w1B03yOyXxSwq2
 J4TrgcULIPphKgHKxyFGDmsslHWjH/ZRY376/f1qbA0/IKnLqN/LGbFEKRRnoffHHOuL
 y1Ml2kFS9cE2jYCfjzdp94U8Yul68uMl5wmdIj0QtXp+sNpRIDihz8NFfeY0Aia3XqLf
 cE7w==
X-Gm-Message-State: AOAM533dGgPfc2zdOL2u0FIjj/8xsuqWQbIvtxhJtpuNKUlvwsGn+POs
 xNmuq9iKOTpa9XuOfeX8PevnJlGXSDqvh7ka+s8GZA==
X-Google-Smtp-Source: ABdhPJxTsetn0uFgXdIvCBQWglhI0ZOcb8W87jwG7kTumTHUHjtuxdqI320BazDpCdumSVGdjsjvchLCoFNUwz2NtC8=
X-Received: by 2002:a4a:2549:: with SMTP id v9mr4100528ooe.28.1629236987676;
 Tue, 17 Aug 2021 14:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-23-matthew.brost@intel.com>
 <YRuZbTJmeUAElOZj@phenom.ffwll.local>
 <20210817163647.GA30445@jons-linux-dev-box>
 <YRvv3Sbihp5ogz2u@phenom.ffwll.local>
 <d239000d-0382-2bd5-ff92-80c0925bfd92@intel.com>
 <YRvzMkaqPbQjvIlW@phenom.ffwll.local>
 <0fbbf0fa-1e3e-4896-d462-7e7a9a02db84@intel.com>
In-Reply-To: <0fbbf0fa-1e3e-4896-d462-7e7a9a02db84@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 Aug 2021 23:49:36 +0200
Message-ID: <CAKMK7uGxcLno2K5s+d3eTy2AobAauNZk464Y99fgOvoaJ22QQA@mail.gmail.com>
Subject: Re: [PATCH 22/22] drm/i915/guc: Add GuC kernel doc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 10:41 PM Michal Wajdeczko
<michal.wajdeczko@intel.com> wrote:
> On 17.08.2021 19:34, Daniel Vetter wrote:
> > On Tue, Aug 17, 2021 at 07:27:18PM +0200, Michal Wajdeczko wrote:
> >> On 17.08.2021 19:20, Daniel Vetter wrote:
> >>> On Tue, Aug 17, 2021 at 09:36:49AM -0700, Matthew Brost wrote:
> >>>> On Tue, Aug 17, 2021 at 01:11:41PM +0200, Daniel Vetter wrote:
> >>>>> On Mon, Aug 16, 2021 at 06:51:39AM -0700, Matthew Brost wrote:
> >>>>>> Add GuC kernel doc for all structures added thus far for GuC submission
> >>>>>> and update the main GuC submission section with the new interface
> >>>>>> details.
> >>>>>>
> >>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>>>
> >>>>> There's quite a bit more, e.g. intel_guc_ct, which has it's own world of
> >>>>> locking design that also doesn't feel too consistent.
> >>>>>
> >>>>
> >>>> That is a different layer than GuC submission so I don't we should
> >>>> mention anything about that layer here. Didn't really write that layer
> >>>> and it super painful to touch that code so I'm going to stay out of any
> >>>> rework you think we need to do there.
> >>>
> >>> Well there's three locks
> >>
> >> It's likely me.
> >>
> >> There is one lock for the recv CTB, one for the send CTB, one for the
> >> list of read messages ready to post process - do you want to use single
> >> lock for both CTBs or single lock for all cases in CT ?
> >>
> >> Michal
> >>
> >> disclaimer: outstanding_g2h are not part of the CTB layer
> >
> > Why? Like apparently there's not enough provided by that right now, so
> > Matt is now papering over that gap with more book-keeping in the next
> > layer. If the layer is not doing a good job it's either the wrong layer,
> > or shouldn't be a layer.
>
> Note that all "outstanding g2h" used by Matt are kind of unsolicited
> "event" messages received from the GuC, that CTB layer is unable
> correlate. CTB only tracks "requests" messages for which "response" (or
> "error") reply is expected. Thus if CTB client is expecting some extra
> message for its previous communication with GuC, it must track it on its
> own, as only client knows where in the CTB message payload, actual
> correlation data (like context ID) is stored.

I thought there's some patches already to reserve g2h space because
guc dies if there's none left? Which would mean ctb should know
already whent there's more coming.

The problem is if every user of guc has to track this themselves we
get a pretty bad spaghetti monster around guc reset. Currently it's
only guc submission, so we could fix it there by wrapping a lock
around all guc submissions it does, but already on the wakeup side
it's more tricky. That really feels like work around issues somewhere
else.

> > And yeah the locking looks like serious amounts of overkill, was it
> > benchmarked that we need the 3 separate locks for this?
>
> I'm not aware of any (micro)benchmarking, but definitely we need some,
> we were just gradually moving from single threaded blocking CTB calls
> (waiting for CTB descriptor updates under mutex) to non-blocking calls
> (protecting only reads/writes to CTB descriptors with spinlock - to
> allow CTB usage from tasklet/irq).

Spinlock is fine, it it really protects everything (I've found a bunch
of checks outside of these locks that leave me wondering). Multiple
spinlocks needs justification since at least to my understand there's
a pile of overlapping stuff you need to protect. Like the reservations
of g2h space.

> And I was just assuming that we can sacrifice few more integers [1] and
> have dedicated spinlocks and avoid early over-optimization.

None of this has anything to do with saving memory, that's entirely
irrelevant here, but about complexity. Any lock you add makes the
complexity worse, and I'm not understanding why ctb needs 3 spinlocks
instead of just one.

If the only justification for this is that maybe it makes things
faster, and it was not properly benchmarked first (microbenchhmarks
don't count if it's not a relevant end use case that umds actually
care about) then it has to go and be simplified. Really should have
never landed, because taking locking complexity out is much harder
than adding it in the first place.

And the current overall i915-gem code is definitely on the wrong side
of "too complex locking design", so there's no wiggle room here for
exceptions.

> > While reading ctb code I also noticed that a bunch of stuff is checked
> > before we grab the relevant spinlocks, and it's not
> > - wrapped in a WARN_ON or GEM_BUG_ON or similar to just check everything
> >   works as expected
> > - there's no other locks
> >
> > So either racy, buggy or playing some extremely clever tricks. None of
> > which is very good.
>
> I'm open to improve that code as needed, but maybe in exchange and to
> increase motivation please provide feedback on already posted fixes [2] ;)

Sure can try, but also these patches have been sitting on the list for
almost 7 weeks now with absolutely. It's your job as submitter to make
sure these move forward, or escalate if necessary. Not wait for some
kind of mircale, those don't happen.
-Daniel

> Michal
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/arch/ia64/include/asm/spinlock_types.h#L10
> [2] https://patchwork.freedesktop.org/series/92118/
>
> > -Daniel
> >
> >>
> >>
> >>> there plus it leaks out (you have your
> >>> outstanding_submission_g2h atomic_t which is very closed tied to well,
> >>> outstanding guc transmissions), so I guess I need someone else for that?
> >>>
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

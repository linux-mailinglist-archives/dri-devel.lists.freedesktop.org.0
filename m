Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D6F4D3EE7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 02:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBA310E30D;
	Thu, 10 Mar 2022 01:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id C582710E30D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 01:46:20 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.51 with ESMTP; 10 Mar 2022 10:46:18 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 10 Mar 2022 10:46:18 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Thu, 10 Mar 2022 10:45:49 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220310014549.GA24568@X58A-UD3R>
References: <YiQq6Ou39uzHC0mu@mit.edu>
 <1646563902-6671-1-git-send-email-byungchul.park@lge.com>
 <YiTC3j6Igkw7xvIM@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiTC3j6Igkw7xvIM@mit.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 09:19:10AM -0500, Theodore Ts'o wrote:
> On Sun, Mar 06, 2022 at 07:51:42PM +0900, Byungchul Park wrote:
> > > 
> > > Users of DEPT must not have to understand how DEPT works in order to
> > 
> > Users must not have to understand how Dept works for sure, and haters
> > must not blame things based on what they guess wrong.
> 
> For the record, I don't hate DEPT.  I *fear* that DEPT will result in
> my getting spammed with a huge number of false posiives once automated
> testing systems like Syzkaller, zero-day test robot, etcs., get a hold
> of it once it gets merged and start generating hundreds of automated
> reports.

Agree. Dept should not be a part of *automated testing system* until it
finally works as much as Lockdep in terms of false positives. However,
it's impossible to achieve it by doing it out of the tree.

Besides automated testing system, Dept works great in the middle of
developing something that is so complicated in terms of synchronization.
They don't have to worry about real reports anymore, that should be
reported, from getting prevented by a false positve.

I will explicitely describe EXPERIMENTAL and "Dept might false-alarm" in
Kconfig until it's considered a few-false-alarming tool.

> > Sure, it should be done manually. I should do it on my own when that
> > kind of issue arises.
> 
> The question here is how often will it need to be done, and how easy

I guess it's gonna rarely happens. I want to see too.

> will it be to "do it manually"?  Suppose we mark all of the DEPT false

Very easy. Equal to or easier than the way we do for lockdep. But the
interest would be wait/event objects rather than locks.

> positives before it gets merged?  How easy will it be able to suppress
> future false positives in the future, as the kernel evolves?

Same as - or even better than - what we do for Lockdep.

And we'd better consider those activies as a code-documentation. Not
only making things just work but organizing code and documenting
in code, are also very meaningful.

> Perhaps one method is to haved a way to take a particular wait queue,
> or call to schedule(), or at the level of an entire kernel source
> file, and opt it out from DEPT analysis?  That way, if DEPT gets
> merged, and a maintainer starts getting spammed by bogus (or

Once Dept gets stable - hoplefully now that Dept is working very
conservatively, there might not be as many false positives as you're
concerning. The situation is in control.

> That way we don't necessarily need to have a debate over how close to
> zero percent false positives is necessary before DEPT can get merged.

Non-sense. I would agree with you if it was so when Lockdep was merged.
But I'll try to achieve almost zero false positives, again, it's
impossible to do it out of tree.

> And we avoid needing to force maintainers to prove that a DEPT report

So... It'd be okay if Dept goes not as a part of automated testing
system. Right?

> is a false positive, which is from my experience hard to do, since
> they get accused of being DEPT haters and not understanding DEPT.

Honestly, it's not a problem of that they don't understand other
domians than what they are familiar with, but another issue. I won't
mention it.

And it sounds like you'd do nothing unless it turns out to be
problematic 100%. It's definitely the *easiest* way to maintain
something because it's the same as not checking its correctness at all.

Even if it's so hard to do, checking if the code is safe for real
repeatedly, is what it surely should be done. Again, I understand it
would be freaking hard. But it doesn't mean we should avoid it.

Here, there seems to be two points you'd like to say:

1. Fundamental question. Does Dept track wait and event correctly?
2. Even if so, can Dept consider all the subtle things in the kernel?

For 1, I'm willing to response to whatever it is. And not only me but we
can make it perfectly work if the concept and direction is *right*.
For 2, I need to ask things and try my best to fix those if it exists.

Again. Dept won't be a part of *automated testing system* until it
finally works as much as Lockdep in terms of false positives. Hopefully
you are okay with it.

---
Byungchul

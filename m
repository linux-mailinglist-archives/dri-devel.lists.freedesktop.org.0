Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 533E04CEFB8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 03:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97AD10E0AC;
	Mon,  7 Mar 2022 02:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id D995910E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 02:43:53 +0000 (UTC)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
 by 156.147.23.52 with ESMTP; 7 Mar 2022 11:43:50 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.127 with ESMTP; 7 Mar 2022 11:43:50 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Mon, 7 Mar 2022 11:43:25 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220307024325.GA6323@X58A-UD3R>
References: <YiAow5gi21zwUT54@mit.edu>
 <1646285013-3934-1-git-send-email-byungchul.park@lge.com>
 <YiDSabde88HJ/aTt@mit.edu> <20220304004237.GB6112@X58A-UD3R>
 <YiLYX0sqmtkTEM5U@mit.edu> <20220305141538.GA31268@X58A-UD3R>
 <YiN8M4FwAeW/UAoN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiN8M4FwAeW/UAoN@google.com>
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
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, paulmck@kernel.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, Theodore Ts'o <tytso@mit.edu>,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 05, 2022 at 03:05:23PM +0000, Joel Fernandes wrote:
> On Sat, Mar 05, 2022 at 11:15:38PM +0900, Byungchul Park wrote:
> > Almost all you've been blaming at Dept are totally non-sense. Based on
> > what you're saying, I'm conviced that you don't understand how Dept
> > works even 1%. You don't even try to understand it before blame.
> > 
> > You don't have to understand and support it. But I can't response to you
> > if you keep saying silly things that way.
> 
> Byungchul, other than ext4 have there been any DEPT reports that other
> subsystem maintainers' agree were valid usecases?

Not yet.

> Regarding false-positives, just to note lockdep is not without its share of
> false-positives. Just that (as you know), the signal-to-noise ratio should be
> high for it to be useful. I've put up with lockdep's false positives just
> because it occasionally saves me from catastrophe.

I love your insight. Agree. A tool would be useful only when it's
*actually* helpful. I hope Dept would be so.

> > > In any case, if DEPT is going to report these "circular dependencies
> > > as bugs that MUST be fixed", it's going to be pure noise and I will
> > > ignore all DEPT reports, and will push back on having Lockdep replaced
> > 
> > Dept is going to be improved so that what you are concerning about won't
> > be reported.
> 
> Yeah I am looking forward to learning more about it however I was wondering
> about the following: lockdep can already be used for modeling "resource
> acquire/release" and "resource wait" semantics that are unrelated to locks,
> like we do in mm reclaim. I am wondering why we cannot just use those existing
> lockdep mechanisms for the wait/wake usecases (Assuming that we can agree

1. Lockdep can't work with general waits/events happening across
   contexts basically. To get over this, manual tagging of
   acquire/release can be used at each section that we suspect. But
   unfortunately, we cannot use the method if we cannot simply identify
   the sections. Furthermore, it's inevitable to miss sections that
   shouldn't get missed.

2. Some cases should be correctly tracked via wait/event model, not
   acquisition order model. For example, read-lock in rwlock should be
   defined as a waiter waiting for write-unlock, write-lock in rwlock
   as a waiter waiting for either read-unlock or write-unlock.
   Otherwise, if we try to track those cases using acquisition order,
   it cannot completely work. Don't you think it looks werid?

3. Tracking what we didn't track before means both stronger detection
   and new emergence of false positives, exactly same as Lockdep at its
   beginning when it started to track what we hadn't tracked before.
   Even though the emergence was allowed at that time, now that Locdkep
   got stable enough, folks would be more strict on new emergences. It's
   gonna get even worse if valid reports are getting prevented by false
   positives.

   For that reason, multi reporting functionality is essential. I was
   thinking to improve Lockdep to allow multi reporting. But it might be
   needed to change more than developing a new tool from scratch. Plus
   it might be even more difficult cuz Lockdep already works not badly.
   So even for Lockdep, I thought the new thing should be developed
   independently leaving Lockdep as it is.

4. (minor reason) The concept and name of acquisition and release is not
   for general wait/event. The design and implementation are not,
   either. I wanted to address the issue as soon as possible before we
   squeeze out Lockdep to use for general wait/event more and the kernel
   code gets weird. Of course, it doesn't mean Dept is more stable than
   Lockdep. However, I can tell Dept works what a dependency tool should
   do and we need to make the code go right.

> that circular dependencies on related to wait/wake is a bad thing. Or perhaps
> there's a reason why Peter Zijlstra did not use lockdep for wait/wake
> dependencies (such as multiple wake sources) considering he wrote a lot of
> that code.
> 
> Keep kicking ass brother, you're doing great.

Thank you! I'll go through this in a right way so as not to disappoint
you!

Thanks,
Byungchul

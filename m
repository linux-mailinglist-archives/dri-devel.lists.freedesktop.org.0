Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE25307C4
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 04:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AAA10ED38;
	Mon, 23 May 2022 02:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id D230710ED38
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 02:45:13 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.52 with ESMTP; 23 May 2022 11:45:12 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 23 May 2022 11:45:12 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Mon, 23 May 2022 11:43:21 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <20220523024321.GB16721@X58A-UD3R>
References: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
 <1651795895-8641-1-git-send-email-byungchul.park@lge.com>
 <YnYd0hd+yTvVQxm5@hyeyoo> <20220509001637.GA6047@X58A-UD3R>
 <YnpJ9Mtf+pjx4JYm@hyeyoo> <20220510233929.GB18445@X58A-UD3R>
 <YnuKQ9UIhk9WYoz7@hyeyoo> <YoYXvsgVJwwaWrrZ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoYXvsgVJwwaWrrZ@arm.com>
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
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 19, 2022 at 11:11:10AM +0100, Catalin Marinas wrote:
> On Wed, May 11, 2022 at 07:04:51PM +0900, Hyeonggon Yoo wrote:
> > On Wed, May 11, 2022 at 08:39:29AM +0900, Byungchul Park wrote:
> > > On Tue, May 10, 2022 at 08:18:12PM +0900, Hyeonggon Yoo wrote:
> > > > On Mon, May 09, 2022 at 09:16:37AM +0900, Byungchul Park wrote:
> > > > > CASE 1.
> > > > > 
> > > > >    lock L with depth n
> > > > >    lock_nested L' with depth n + 1
> > > > >    ...
> > > > >    unlock L'
> > > > >    unlock L
> > > > > 
> > > > > This case is allowed by Lockdep.
> > > > > This case is allowed by DEPT cuz it's not a deadlock.
> > > > > 
> > > > > CASE 2.
> > > > > 
> > > > >    lock L with depth n
> > > > >    lock A
> > > > >    lock_nested L' with depth n + 1
> > > > >    ...
> > > > >    unlock L'
> > > > >    unlock A
> > > > >    unlock L
> > > > > 
> > > > > This case is allowed by Lockdep.
> > > > > This case is *NOT* allowed by DEPT cuz it's a *DEADLOCK*.
> > > > 
> > > > Yeah, in previous threads we discussed this [1]
> > > > 
> > > > And the case was:
> > > > 	scan_mutex -> object_lock -> kmemleak_lock -> object_lock
> > > > And dept reported:
> > > > 	object_lock -> kmemleak_lock, kmemleak_lock -> object_lock as
> > > > 	deadlock.
> > > > 
> > > > But IIUC - What DEPT reported happens only under scan_mutex and it
> > > > is not simple just not to take them because the object can be
> > > > removed from the list and freed while scanning via kmemleak_free()
> > > > without kmemleak_lock and object_lock.
> 
> The above kmemleak sequence shouldn't deadlock since those locks, even
> if taken in a different order, are serialised by scan_mutex. For various
> reasons, trying to reduce the latency, I ended up with some
> fine-grained, per-object locking.

I understand why you introduced the fine-grained lock. However, the
different order should be avoided anyway. As Steven said, Lockdep also
should've detected this case, say, this would have been detected if
Lockdep worked correctly.

It's not a technical issue to make a tool skip the reversed order when
it's already protected by another lock. Because each lock has its own
purpose as you explained, no body knows if the cases might arise that
use kmemleak_lock and object_lock only w/o holding scan_mutex someday.

I'm wondering how other folks think this case should be handled tho.

> For object allocation (rbtree modification) and tree search, we use
> kmemleak_lock. During scanning (which can take minutes under
> scan_mutex), we want to prevent (a) long latencies and (b) freeing the
> object being scanned. We release the locks regularly for (a) and hold
> the object->lock for (b).
> 
> In another thread Byungchul mentioned:
> 
> |    context X			context Y
> | 
> |    lock mutex A		lock mutex A
> |    lock B			lock C
> |    lock C			lock B
> |    unlock C			unlock B
> |    unlock B			unlock C
> |    unlock mutex A		unlock mutex A
> | 
> | In my opinion, lock B and lock C are unnecessary if they are always
> | along with lock mutex A. Or we should keep correct lock order across all
> | the code.
> 
> If these are the only two places, yes, locks B and C would be
> unnecessary. But we have those locks acquired (not nested) on the
> allocation path (kmemleak_lock) and freeing path (object->lock). We
> don't want to block those paths while scan_mutex is held.
> 
> That said, we may be able to use a single kmemleak_lock for everything.
> The object freeing path may be affected slightly during scanning but the
> code does release it every MAX_SCAN_SIZE bytes. It may even get slightly
> faster as we'd hammer a single lock (I'll do some benchmarks).
> 
> But from a correctness perspective, I think the DEPT tool should be
> improved a bit to detect when such out of order locking is serialised by
> an enclosing lock/mutex.

Again, I don't think this is a technical issue.

	Byungchul
> 
> -- 
> Catalin

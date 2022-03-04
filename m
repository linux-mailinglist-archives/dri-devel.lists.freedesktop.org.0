Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3A4CCACB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED6210E3F5;
	Fri,  4 Mar 2022 00:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1553910E3F5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:28:33 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.52 with ESMTP; 4 Mar 2022 09:28:31 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 4 Mar 2022 09:28:31 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Fri, 4 Mar 2022 09:28:09 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Subject: Re: [PATCH v3 00/21] DEPT(Dependency Tracker)
Message-ID: <20220304002809.GA6112@X58A-UD3R>
References: <1646042220-28952-1-git-send-email-byungchul.park@lge.com>
 <Yh70VkRkUfwIjPWv@ip-172-31-19-208.ap-northeast-1.compute.internal>
 <Yh74VbNZZt35wHZD@ip-172-31-19-208.ap-northeast-1.compute.internal>
 <20220303001812.GA20752@X58A-UD3R>
 <YiB2SZFzgBEcywgg@ip-172-31-19-208.ap-northeast-1.compute.internal>
 <20220303094824.GA24977@X58A-UD3R>
 <YiC2z2NDbiYd2nEA@ip-172-31-19-208.ap-northeast-1.compute.internal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiC2z2NDbiYd2nEA@ip-172-31-19-208.ap-northeast-1.compute.internal>
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
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 Catalin Marinas <catalin.marinas@arm.com>, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 12:38:39PM +0000, Hyeonggon Yoo wrote:
> On Thu, Mar 03, 2022 at 06:48:24PM +0900, Byungchul Park wrote:
> > On Thu, Mar 03, 2022 at 08:03:21AM +0000, Hyeonggon Yoo wrote:
> > > On Thu, Mar 03, 2022 at 09:18:13AM +0900, Byungchul Park wrote:
> > > > Hi Hyeonggon,
> > > > 
> > > > Dept also allows the following scenario when an user guarantees that
> > > > each lock instance is different from another at a different depth:
> > > >
> > > >    lock A0 with depth
> > > >    lock A1 with depth + 1
> > > >    lock A2 with depth + 2
> > > >    lock A3 with depth + 3
> > > >    (and so on)
> > > >    ..
> > > >    unlock A3
> > > >    unlock A2
> > > >    unlock A1
> > > >    unlock A0
> > 
> 
> [+Cc kmemleak maintainer]
> 
> > Look at this. Dept allows object->lock -> other_object->lock (with a
> > different depth using *_lock_nested()) so won't report it.
> >
> 
> No, It did.

Yes, you are right. I should've asked you to resend the AA deadlock
report when I found [W]'s stacktrace was missed in what you shared and
should've taken a look at it more.

Dept normally doesn't report this type of AA deadlock. But it does
when the case happens, that we are talking about, say, another lock
class cut in between the nesting locks. I will fix it. The AA deadlock
report here doesn't make sense. Thank you.

However, the other report below still makes sense.

> > > > >   45  *   scan_mutex [-> object->lock] -> kmemleak_lock -> other_object->lock (SINGLE_DEPTH_NESTING)
> > > > >   46  *
> > > > >   47  * No kmemleak_lock and object->lock nesting is allowed outside scan_mutex
> > > > >   48  * regions.
> > > 
> > > lock order in kmemleak is described above.
> > > 
> > > and DEPT detects two cases as deadlock:
> > > 
> > > 1) object->lock -> other_object->lock
> > 
> > It's not a deadlock *IF* two have different depth using *_lock_nested().
> > Dept also allows this case. So Dept wouldn't report it.
> >
> > > 2) object->lock -> kmemleak_lock, kmemleak_lock -> other_object->lock
> >
> > But this usage is risky. I already explained it in the mail you replied
> > to. I copied it. See the below.
> >
> 
> I understand why you said this is risky.
> Its lock ordering is not good.
> 
> > context A
> > > >    lock A0 with depth
> > > >    lock B
> > > >    lock A1 with depth + 1
> > > >    lock A2 with depth + 2
> > > >    lock A3 with depth + 3
> > > >    (and so on)
> > > >    ..
> > > >    unlock A3
> > > >    unlock A2
> > > >    unlock A1
> > > >    unlock B
> > > >    unlock A0
> >
> > ...
> >
> > context B
> > > >    lock A1 with depth
> > > >    lock B
> > > >    lock A2 with depth + 1
> > > >    lock A3 with depth + 2
> > > >    (and so on)
> > > >    ..
> > > >    unlock A3
> > > >    unlock A2
> > > >    unlock B
> > > >    unlock A1
> > 
> > where Ax : object->lock, B : kmemleak_lock.
> > 
> > A deadlock might occur if the two contexts run at the same time.
> >
> 
> But I want to say kmemleak is getting things under control. No two contexts
> can run at same time.

So.. do you think the below is also okay? Because lock C and lock B are
under control?

   context X			context Y

   lock mutex A			lock mutex A
   lock B			lock C
   lock C			lock B
   unlock C			unlock B
   unlock B			unlock C
   unlock mutex A		unlock mutex A

In my opinion, lock B and lock C are unnecessary if they are always
along with lock mutex A. Or we should keep correct lock order across all
the code.

> > > And in kmemleak case, 1) and 2) is not possible because it must hold
> > > scan_mutex first.
> > 
> > This is another issue. Let's focus on whether the order is okay for now.
> >
> 
> Why is it another issue?

You seem to insist that locking order is not important *if* they are
under control by serializing the sections. I meant this is another issue.

> > > I think the author of kmemleak intended lockdep to treat object->lock
> > > and other_object->lock as different class, using raw_spin_lock_nested().
> > 
> > Yes. The author meant to assign a different class according to its depth
> > using a Lockdep API. Strictly speaking, those are the same class anyway
> > but we assign a different class to each depth to avoid Lockdep splats
> > *IF* the user guarantees the nesting lock usage is safe, IOW, guarantees
> > each lock instance is different at a different depth.
> 
> Then why DEPT reports 1) and 2) as deadlock?

1) will be fixed so that Dept doesn't report it. But I still think the
case 2) should be reported for the wrong usage.

Thanks,
Byungchul

> Does DEPT assign same class unlike Lockdep?
> 
> > I was fundamentally asking you... so... is the nesting lock usage safe
> > for real?
> 
> I don't get what the point is. I agree it's not a good lock ordering.
> But in kmemleak case, I think kmemleak is getting things under control.
> 
> -- 
> Thank you, You are awesome!
> Hyeonggon :-)
> 
> > I hope you distinguish between the safe case and the risky
> > case when *_lock_nested() is involved. Thoughts?
> >
> > Thanks,
> > Byungchul
> > 
> > > Am I missing something?
> > > 
> > > Thanks.
> > > 
> > > >    lock A1 with depth
> > > >    lock B
> > > >    lock A2 with depth + 1
> > > >    lock A3 with depth + 2
> > > >    (and so on)
> > > >    ..
> > > >    unlock A3
> > > >    unlock A2
> > > >    unlock B
> > > >    unlock A1
> > > > 
> > > > It's a deadlock. That's why Dept reports this case as a problem. Or am I
> > > > missing something?
> > > >
> > > > Thanks,
> > > > Byungchul
> > > > 
> > > > > ---------------------------------------------------
> > > > > context A's detail
> > > > > ---------------------------------------------------
> > > > > context A
> > > > >     [S] __raw_spin_lock_irqsave(&object->lock:0)
> > > > >     [W] __raw_spin_lock_irqsave(kmemleak_lock:0)
> > > > >     [E] spin_unlock(&object->lock:0)
> > > > > 
> > > > > [S] __raw_spin_lock_irqsave(&object->lock:0):
> > > > > [<ffffffc00810302c>] scan_gray_list+0x84/0x13c
> > > > > stacktrace:
> > > > >       dept_ecxt_enter+0x88/0xf4
> > > > >       _raw_spin_lock_irqsave+0xf0/0x1c4
> > > > >       scan_gray_list+0x84/0x13c
> > > > >       kmemleak_scan+0x2d8/0x54c
> > > > >       kmemleak_scan_thread+0xac/0xd4
> > > > >       kthread+0xd4/0xe4
> > > > >       ret_from_fork+0x10/0x20
> > > > > 
> > > > > [W] __raw_spin_lock_irqsave(kmemleak_lock:0):
> > > > > [<ffffffc008102ebc>] scan_block+0x3c/0x128
> > > > > stacktrace:
> > > > >       __dept_wait+0x8c/0xa4
> > > > >       dept_wait+0x6c/0x88
> > > > >       _raw_spin_lock_irqsave+0xb8/0x1c4
> > > > >       scan_block+0x3c/0x128
> > > > >       scan_gray_list+0xc4/0x13c
> > > > >       kmemleak_scan+0x2d8/0x54c
> > > > >       kmemleak_scan_thread+0xac/0xd4
> > > > >       kthread+0xd4/0xe4
> > > > >       ret_from_fork+0x10/0x20
> > > > > 
> > > > > [E] spin_unlock(&object->lock:0):
> > > > > [<ffffffc008102ee0>] scan_block+0x60/0x128
> > > > > 
> > > > > ---------------------------------------------------
> > > > > context B's detail
> > > > > ---------------------------------------------------
> > > > > context B
> > > > >     [S] __raw_spin_lock_irqsave(kmemleak_lock:0)
> > > > >     [W] _raw_spin_lock_nested(&object->lock:0)
> > > > >     [E] spin_unlock(kmemleak_lock:0)
> > > > > 
> > > > > [S] __raw_spin_lock_irqsave(kmemleak_lock:0):
> > > > > [<ffffffc008102ebc>] scan_block+0x3c/0x128
> > > > > stacktrace:
> > > > >       dept_ecxt_enter+0x88/0xf4
> > > > >       _raw_spin_lock_irqsave+0xf0/0x1c4
> > > > >       scan_block+0x3c/0x128
> > > > >       kmemleak_scan+0x19c/0x54c
> > > > >       kmemleak_scan_thread+0xac/0xd4
> > > > >       kthread+0xd4/0xe4
> > > > >       ret_from_fork+0x10/0x20
> > > > > 
> > > > > [W] _raw_spin_lock_nested(&object->lock:0):
> > > > > [<ffffffc008102f34>] scan_block+0xb4/0x128
> > > > > stacktrace:
> > > > >       dept_wait+0x74/0x88
> > > > >       _raw_spin_lock_nested+0xa8/0x1b0
> > > > >       scan_block+0xb4/0x128
> > > > >       kmemleak_scan+0x19c/0x54c
> > > > >       kmemleak_scan_thread+0xac/0xd4
> > > > >       kthread+0xd4/0xe4
> > > > >       ret_from_fork+0x10/0x20
> > > > > [E] spin_unlock(kmemleak_lock:0):
> > > > > [<ffffffc008102ee0>] scan_block+0x60/0x128
> > > > > stacktrace:
> > > > >       dept_event+0x7c/0xfc
> > > > >       _raw_spin_unlock_irqrestore+0x8c/0x120
> > > > >       scan_block+0x60/0x128
> > > > >       kmemleak_scan+0x19c/0x54c
> > > > >       kmemleak_scan_thread+0xac/0xd4
> > > > >       kthread+0xd4/0xe4
> > > > >       ret_from_fork+0x10/0x20
> > > > > ---------------------------------------------------
> > > > > information that might be helpful
> > > > > ---------------------------------------------------
> > > > > CPU: 1 PID: 38 Comm: kmemleak Tainted: G        W         5.17.0-rc1+ #1
> > > > > Hardware name: linux,dummy-virt (DT)
> > > > > Call trace:
> > > > >  dump_backtrace.part.0+0x9c/0xc4
> > > > >  show_stack+0x14/0x28
> > > > >  dump_stack_lvl+0x9c/0xcc
> > > > >  dump_stack+0x14/0x2c
> > > > >  print_circle+0x2d4/0x438
> > > > >  cb_check_dl+0x6c/0x70
> > > > >  bfs+0xc0/0x168
> > > > >  add_dep+0x88/0x11c
> > > > >  add_wait+0x2d0/0x2dc
> > > > >  __dept_wait+0x8c/0xa4
> > > > >  dept_wait+0x6c/0x88
> > > > >  _raw_spin_lock_irqsave+0xb8/0x1c4
> > > > >  scan_block+0x3c/0x128
> > > > >  scan_gray_list+0xc4/0x13c
> > > > >  kmemleak_scan+0x2d8/0x54c
> > > > >  kmemleak_scan_thread+0xac/0xd4
> > > > >  kthread+0xd4/0xe4
> > > > >  ret_from_fork+0x10/0x20
> > > > > 
> > > > > > ===================================================
> > > > > > DEPT: Circular dependency has been detected.
> > > > > > 5.17.0-rc1+ #1 Tainted: G        W
> > > > > > ---------------------------------------------------
> > > > > > summary
> > > > > > ---------------------------------------------------
> > > > > > *** AA DEADLOCK ***
> > > > > > 
> > > > > > context A
> > > > > >     [S] __raw_spin_lock_irqsave(&object->lock:0)
> > > > > >     [W] _raw_spin_lock_nested(&object->lock:0)
> > > > > >     [E] spin_unlock(&object->lock:0)
> > > > > > 
> > > > > > [S]: start of the event context
> > > > > > [W]: the wait blocked
> > > > > > [E]: the event not reachable
> > > > > > ---------------------------------------------------
> > > > > > context A's detail
> > > > > > ---------------------------------------------------
> > > > > > context A
> > > > > >     [S] __raw_spin_lock_irqsave(&object->lock:0)
> > > > > >     [W] _raw_spin_lock_nested(&object->lock:0)
> > > > > >     [E] spin_unlock(&object->lock:0)
> > > > > > 
> > > > > > [S] __raw_spin_lock_irqsave(&object->lock:0):
> > > > > > [<ffffffc00810302c>] scan_gray_list+0x84/0x13c
> > > > > > stacktrace:
> > > > > >       dept_ecxt_enter+0x88/0xf4
> > > > > >       _raw_spin_lock_irqsave+0xf0/0x1c4
> > > > > >       scan_gray_list+0x84/0x13c
> > > > > >       kmemleak_scan+0x2d8/0x54c
> > > > > >       kmemleak_scan_thread+0xac/0xd4
> > > > > >       kthread+0xd4/0xe4
> > > > > >       ret_from_fork+0x10/0x20
> > > > > > 
> > > > > > [E] spin_unlock(&object->lock:0):
> > > > > > [<ffffffc008102ee0>] scan_block+0x60/0x128
> > > > > > ---------------------------------------------------
> > > > > > information that might be helpful
> > > > > > ---------------------------------------------------
> > > > > > CPU: 1 PID: 38 Comm: kmemleak Tainted: G        W         5.17.0-rc1+ #1
> > > > > > Hardware name: linux,dummy-virt (DT)
> > > > > > Call trace:
> > > > > >  dump_backtrace.part.0+0x9c/0xc4
> > > > > >  show_stack+0x14/0x28
> > > > > >  dump_stack_lvl+0x9c/0xcc
> > > > > >  dump_stack+0x14/0x2c
> > > > > >  print_circle+0x2d4/0x438
> > > > > >  cb_check_dl+0x44/0x70
> > > > > >  bfs+0x60/0x168
> > > > > >  add_dep+0x88/0x11c
> > > > > >  add_wait+0x2d0/0x2dc
> > > > > >  __dept_wait+0x8c/0xa4
> > > > > >  dept_wait+0x6c/0x88
> > > > > >  _raw_spin_lock_nested+0xa8/0x1b0
> > > > > >  scan_block+0xb4/0x128
> > > > > >  scan_gray_list+0xc4/0x13c
> > > > > >  kmemleak_scan+0x2d8/0x54c
> > > > > >  kmemleak_scan_thread+0xac/0xd4
> > > > > >  kthread+0xd4/0xe4
> > > > > >  ret_from_fork+0x10/0x20
> > > > > >
> > > > > [...]
> > > > > 
> > > > > --
> > > > > Thank you, You are awesome!
> > > > > Hyeonggon :-)
> > > 
> > > -- 
> > > Thank you, You are awesome!
> > > Hyeonggon :-)

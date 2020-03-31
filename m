Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6C19A5CA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFC26E8E3;
	Wed,  1 Apr 2020 07:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238426E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 10:19:02 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id v7so22401123qkc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HzNurC8m2BgER49ycEMEtlBfddUEOvSlWj/tf+H1wCY=;
 b=LuNFoNFC8TXQngMjWPdYR8nHhN29U4SK5C/6tu+C6Z+PgEZak1OdwmNwOwVU1VCNX8
 5FFNFZzh/c3BjbWbwjiCJ/Px8B3CJYWOU0jKrkqngnC8Z3geASSUwfcxngVJ9pyA2k+B
 GK821BnTbwITarKSs0rPfntebe3NC3+eh+7Xe6jabLQDHgxYSd8Cw9LZICdLhAFfJK2F
 bBf5z/hdULxDQ5F3/JfyloyIoJ/14dPwO5HKdKRssBNBSpFPGY9LNWtiNxX9LFsT08Wo
 tsecSlt49ZGCgU2UOucZHKuyp/u+YgFHzwmpUgqvb/fPtcJf5o84lnrY3A+KeX+d2j0F
 8NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HzNurC8m2BgER49ycEMEtlBfddUEOvSlWj/tf+H1wCY=;
 b=AcTyOL4JoCxzfjtjocUTv5d1JbU5z5j4qanTxHE9kAzeTn9Pske67RSl+exuCZDoWd
 WTRHd0SqHOPelze7hHd9gNuVKDYOJyoFbUFJQkGVVsql3UNlSUlr6K6n/silM3CP1qAu
 aPBOhKTnqp37v8Ytk3t9KA9wR/qDtOMBMpNNxKjI/btdvVOsQ0mx29dPjBc2wYnFNkAr
 613eWPKEUhSIYhuLZHb2BalIikNsiLaS/DCLJplEbmhRKVbToAGUItE3/YmCaFbpvkWB
 EXQybZf8s9rJsMc7L+ygje9E/F7HgrN0vGXLHsOpb7uk/+bam7FMopSxMw11I/4mOx2N
 7R2Q==
X-Gm-Message-State: ANhLgQ0nAuoKo6YrZNNuZJVljOaUORDB1oEhHWnStf2HylkPyIEtTiIz
 CGShicurorjg5S7eNpzgnDxjbKuLZNxwb+YHceLReQ==
X-Google-Smtp-Source: ADFU+vt5VB3XZM3XDJ4oOkj4wPSxUd+9SkOx1m0xsv+BrY3woUVq5c+khDRiYmVZHffq+/U/ZpzyS1ldKBsjZWQnyIs=
X-Received: by 2002:a37:8d86:: with SMTP id p128mr4267320qkd.250.1585649940834; 
 Tue, 31 Mar 2020 03:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ec257905a21f7415@google.com>
 <20200331095737.GO20730@hirez.programming.kicks-ass.net>
In-Reply-To: <20200331095737.GO20730@hirez.programming.kicks-ass.net>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 31 Mar 2020 12:18:49 +0200
Message-ID: <CACT4Y+bqBCqDPQZ1Nk8G+8y2vu8aaT2S54J4UqRPaFNUcusbYw@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in try_to_wake_up
To: Peter Zijlstra <peterz@infradead.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
X-Mailman-Approved-At: Wed, 01 Apr 2020 07:03:42 +0000
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
Cc: syzbot <syzbot+e84d7ebd1361da13c356@syzkaller.appspotmail.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 11:57 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Mar 30, 2020 at 10:01:12PM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    9420e8ad Merge tag 'for-linus' of git://git.kernel.org/pub..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1206ed4be00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=27392dd2975fd692
> > dashboard link: https://syzkaller.appspot.com/bug?extid=e84d7ebd1361da13c356
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > Unfortunately, I don't have any reproducer for this crash yet.
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+e84d7ebd1361da13c356@syzkaller.appspotmail.com
> >
> > INFO: trying to register non-static key.
> > the code is fine but needs lockdep annotation.
> > turning off the locking correctness validator.
> > CPU: 1 PID: 1014 Comm: syz-executor.0 Not tainted 5.6.0-rc7-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Call Trace:
> >  <IRQ>
> >  __dump_stack lib/dump_stack.c:77 [inline]
> >  dump_stack+0x188/0x20d lib/dump_stack.c:118
> >  assign_lock_key kernel/locking/lockdep.c:880 [inline]
> >  register_lock_class+0x14c4/0x1540 kernel/locking/lockdep.c:1189
> >  __lock_acquire+0xfc/0x3ca0 kernel/locking/lockdep.c:3836
> >  lock_acquire+0x197/0x420 kernel/locking/lockdep.c:4484
> >  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
> >  _raw_spin_lock_irqsave+0x8c/0xbf kernel/locking/spinlock.c:159
> >  try_to_wake_up+0x9f/0x17c0 kernel/sched/core.c:2547
>
> That's p->pi_lock, which gets initialized in rt_mutex_init_task() in
> copy_process(). This should be impossible. Very odd.

The stack mentions fbdev, which is a red flag at the moment. There are
a dozen of bad bugs in fbdev and around. Just few days ago Andy
pointed to another "impossible" crash "general protection fault in
do_syscall_64" which is related to dri:
https://syzkaller.appspot.com/bug?id=0ec7b2602b1ff40f0d34f38baa4ba1640727c3d9
https://groups.google.com/forum/#!msg/syzkaller-bugs/ePqhfYx0-8M/Q_Urt97iAAAJ

There are probably more random manifestations of these bugs already,
and I guess we will be getting more.

+fbdev maintainers



> >  wake_up_worker kernel/workqueue.c:836 [inline]
> >  insert_work+0x2ad/0x3a0 kernel/workqueue.c:1337
> >  __queue_work+0x50d/0x1280 kernel/workqueue.c:1488
> >  call_timer_fn+0x195/0x760 kernel/time/timer.c:1404
> >  expire_timers kernel/time/timer.c:1444 [inline]
> >  __run_timers kernel/time/timer.c:1773 [inline]
> >  __run_timers kernel/time/timer.c:1740 [inline]
> >  run_timer_softirq+0x412/0x1600 kernel/time/timer.c:1786
> >  __do_softirq+0x26c/0x99d kernel/softirq.c:292
> >  invoke_softirq kernel/softirq.c:373 [inline]
> >  irq_exit+0x192/0x1d0 kernel/softirq.c:413
> >  exiting_irq arch/x86/include/asm/apic.h:546 [inline]
> >  smp_apic_timer_interrupt+0x19e/0x600 arch/x86/kernel/apic/apic.c:1146
> >  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
> >  </IRQ>
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20200331095737.GO20730%40hirez.programming.kicks-ass.net.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

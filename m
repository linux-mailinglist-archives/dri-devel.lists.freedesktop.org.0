Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1B68A9AF7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 15:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBA110F66C;
	Thu, 18 Apr 2024 13:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eWWnZ6KH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF8C10F66C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 13:14:22 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-61af74a010aso8483827b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713446062; x=1714050862; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNjZ+JFWThO2oRRWVjmyz4uwK7PF7VdFjmp+2S0zMDM=;
 b=eWWnZ6KHwEAVoQvrVMWku0J6HfjZXU5hK5mOL7chLp30bbi92LEtP97e9iIYMSkCyx
 86WPSZjAMe1D3jiBco0VJHkRxQFYjx0DsMfJqdDT7N6YWZ11Y+0GKZXuZ+ARVmRAci0/
 3AbGAmqx0Sant28jCl9JbyMK5N10rlnbXpMgutL/2V+Kr20EI944T4Alk1jsDFHUM0nA
 DmfLmPnB5iSHLkjW4THYrju0piBcNdyGYWgxOJYCnQnU8sN0Mn2ST0H1sbzEvL4kf+kI
 m9l99xlD15XeUyCucybtChEMViCfdgCXLS52OozxFvvFRJEGNoR5xFqZtnEdJBDhzGX6
 k9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713446062; x=1714050862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNjZ+JFWThO2oRRWVjmyz4uwK7PF7VdFjmp+2S0zMDM=;
 b=Oa4z/Kl/kf9uwxSWXVq1YF/JGCqTmZPnCGk0SRvTuwp7IAdZaatkPaGTVeLTvsc+m6
 LuVOwZj+7VvHFld0di63k/vWkj5q3vpITWarAH6n6zw/VuXqR9t95M3/EQa3Dejs41m1
 Hr+7E8Z57krGG31WrMOr3guY0WVrAudqHtynt68KejUhCZ+ejyhpD7uFAr1QBf3C3ABj
 s844wSJBY65RTTOGdnu1s4mBCol7HKgnRaozRoa9alk12V+2u1/ZdFCUlkGjO/YmknFf
 TmGRzovcIKNw11w+6MFGtjfw9c8n7Y18Ff8s0FnoczIuxcQdF5lwaWb8FW2WxfyXcO5M
 2Seg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTq3QGugGyYp6PniLLkorsgGfYW+aJRB9c5fQCFhzsZ6jNr/gIt9HbEVdEzK1/XQXSlxTJasoZTWjVL9MuI/nQiWobCXLhYv2rnmFy2Tla
X-Gm-Message-State: AOJu0Yz7cjg76hwsZ2ipTDaA/fWyngo3tK+pF6jnazr2WH3qDG8xjUyV
 9Sgjti2hpZL4NG7syAAkpY664+mbEa6lGShVSMxBLuY9oQ997wnYBqrk+diU7eA1a/mHo/2IfUd
 ulD1LhucLcaOR/zswxpYEpvCBSz0=
X-Google-Smtp-Source: AGHT+IHyshJ2GxWnhl8vTw5wqDcDvPrOYVbWPsoQRYRQznFuBkh6VrGmriGzy9oc9DBFSzcvHBtl4wRrOOG1UiL0t6o=
X-Received: by 2002:a05:690c:708c:b0:61a:d30f:90ba with SMTP id
 jg12-20020a05690c708c00b0061ad30f90bamr2568502ywb.5.1713446061737; Thu, 18
 Apr 2024 06:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
In-Reply-To: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 18 Apr 2024 15:14:10 +0200
Message-ID: <CAMeQTsbCESSTrEyHgqF9HreSuzQ9kMBnGpKLT0QNJ+n4hv9qOw@mail.gmail.com>
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: jayalk@intworks.biz, Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, tiwai@suse.de, 
 namcao@linutronix.de, bigeasy@linutronix.de, 
 LKML <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>, 
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 18, 2024 at 2:40=E2=80=AFPM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Hi,
>
> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung
> bug in fb_deferred_io_work()
>
>
> This is in 5.15.149 tag, and this is introduced by a set of commits:
>
> 2655757a3f10 fbdev: flush deferred IO before closing
> 15492bab7393 fbdev: Fix incorrect page mapping clearance at
> fb_deferred_io_release()
> 87b9802ca824 fbdev: Fix invalid page access after closing deferred I/O
> devices
> 9a95fc04261f fbdev: Rename pagelist to pagereflist for deferred I/O
> 186b89659c4c fbdev: Track deferred-I/O pages in pageref struct
> e79b2b2aadef fbdev: defio: fix the pagelist corruption
> 0616b00a31d6 fbdev: Don't sort deferred-I/O pages by default
> 5d3aff76a316 fbdev/defio: Early-out if page is already enlisted
>
> I then tried if it could be reproducible on upstream kernel as well, and
> it did. below is the call trace with latest 6.9-rc4 based kernel. I have
> enabled the LOCKDEP to get locking related information.
>
>   INFO: task kworker/0:3:1077 blocked for more than 122 seconds.
>         Not tainted 6.9.0-rc4+ #54
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>   task:kworker/0:3     state:D stack:0     pid:1077  tgid:1077  ppid:2
>     flags:0x00004000
>   Workqueue: events fb_deferred_io_work
>   Call Trace:
>    <TASK>
>   __schedule (kernel/sched/core.c:5409 kernel/sched/core.c:6746)
>   ? __pfx___schedule (kernel/sched/core.c:6617)
>   ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
>   ? __pfx___lock_release (kernel/locking/lockdep.c:5406)
>   ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
>   schedule (./arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6824
> kernel/sched/core.c:6838)
>   io_schedule (kernel/sched/core.c:9019 kernel/sched/core.c:9045)
>   folio_wait_bit_common (mm/filemap.c:1272)
>   ? __pfx_folio_wait_bit_common (mm/filemap.c:1206)
>   ? __pfx___mutex_lock (kernel/locking/mutex.c:751)
>   ? lock_acquire.part.0 (kernel/locking/lockdep.c:467
> kernel/locking/lockdep.c:5756)
>   ? __pfx_wake_page_function (mm/filemap.c:1091)
>   ? __pfx_lock_acquire.part.0 (kernel/locking/lockdep.c:5719)
>   fb_deferred_io_work (./include/linux/pagemap.h:1069
> drivers/video/fbdev/core/fb_defio.c:248)
>   ? lock_acquire (./include/trace/events/lock.h:24
> kernel/locking/lockdep.c:5725)
>   process_one_work (kernel/workqueue.c:3254)
>   ? __pfx_lock_acquire.part.0 (kernel/locking/lockdep.c:5719)
>   ? __pfx_process_one_work (kernel/workqueue.c:3156)
>   ? assign_work (kernel/workqueue.c:1210)
>   worker_thread (kernel/workqueue.c:3329 kernel/workqueue.c:3416)
>   ? __kthread_parkme (kernel/kthread.c:293)
>   ? __pfx_worker_thread (kernel/workqueue.c:3362)
>   kthread (kernel/kthread.c:388)
>   ? __pfx_kthread (kernel/kthread.c:341)
>   ret_from_fork (arch/x86/kernel/process.c:147)
>   ? __pfx_kthread (kernel/kthread.c:341)
>   ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
>    </TASK>
>   INFO: task r:2664 blocked for more than 123 seconds.
>         Not tainted 6.9.0-rc4+ #54
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>   task:r               state:D stack:0     pid:2664  tgid:2664
> ppid:2618   flags:0x00000002
>   Call Trace:
>    <TASK>
>   __schedule (kernel/sched/core.c:5409 kernel/sched/core.c:6746)
>   ? __pfx___schedule (kernel/sched/core.c:6617)
>   ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
>   ? __pfx___lock_release (kernel/locking/lockdep.c:5406)
>   ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
>   schedule (./arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6824
> kernel/sched/core.c:6838)
>   schedule_timeout (kernel/time/timer.c:2559)
>   ? __pfx_schedule_timeout (kernel/time/timer.c:2544)
>   ? mark_lock.part.0 (./arch/x86/include/asm/bitops.h:227
> ./arch/x86/include/asm/bitops.h:239
> ./include/asm-generic/bitops/instrumented-non-atomic.h:142
> kernel/locking/lockdep.c:228 kernel/locking/lockdep.c:4656)
>   ? mark_held_locks (kernel/locking/lockdep.c:4274)
>   ? lockdep_hardirqs_on_prepare.part.0 (kernel/locking/lockdep.c:4300
> kernel/locking/lockdep.c:4359)
>   __wait_for_common (kernel/sched/completion.c:95
> kernel/sched/completion.c:116)
>   ? __pfx_schedule_timeout (kernel/time/timer.c:2544)
>   ? __pfx___wait_for_common (kernel/sched/completion.c:110)
>   ? start_flush_work (kernel/workqueue.c:4192)
>   __flush_work (kernel/workqueue.c:4207)
>   ? __pfx___flush_work (kernel/workqueue.c:4195)
>   ? __pfx_wq_barrier_func (kernel/workqueue.c:3742)
>   ? flush_delayed_work (kernel/workqueue.c:4249)
>   ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
>   fb_deferred_io_lastclose (drivers/video/fbdev/core/fb_defio.c:321)
>   ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
>   fb_deferred_io_release (drivers/video/fbdev/core/fb_defio.c:333)
>   fb_release (drivers/video/fbdev/core/fb_chrdev.c:383)
>   ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
>   __fput (fs/file_table.c:422)
>   task_work_run (kernel/task_work.c:180 (discriminator 1))
>   ? __pfx_task_work_run (kernel/task_work.c:148)
>   ? do_raw_spin_unlock (./arch/x86/include/asm/paravirt.h:589
> ./arch/x86/include/asm/qspinlock.h:57 kernel/locking/spinlock_debug.c:142=
)
>   do_exit (kernel/exit.c:879)
>   ? do_raw_spin_lock (./arch/x86/include/asm/atomic.h:115
> ./include/linux/atomic/atomic-arch-fallback.h:2170
> ./include/linux/atomic/atomic-instrumented.h:1302
> ./include/asm-generic/qspinlock.h:111 kernel/locking/spinlock_debug.c:116=
)
>   ? __pfx_do_exit (kernel/exit.c:819)
>   ? __pfx_do_raw_spin_lock (kernel/locking/spinlock_debug.c:114)
>   do_group_exit (kernel/exit.c:1008)
>   __x64_sys_exit_group (kernel/exit.c:1036)
>   do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
>   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
>   RIP: 0033:0x7f9cfe71e5f1
>   RSP: 002b:00007ffd636aec08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
>   RAX: ffffffffffffffda RBX: 00007f9cfe7fc510 RCX: 00007f9cfe71e5f1
>   RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
>   RBP: 0000000000000000 R08: ffffffffffffff80 R09: 0000000000000000
>   R10: 0000000000000020 R11: 0000000000000246 R12: 00007f9cfe7fc510
>   R13: 0000000000000000 R14: 00007f9cfe7fc9e8 R15: 00007f9cfe7fca00
>    </TASK>
>
>   Showing all locks held in the system:
>   1 lock held by khungtaskd/50:
>   #0: ffffffff950219c0 (rcu_read_lock){....}-{1:2}, at:
> debug_show_all_locks (./include/linux/rcupdate.h:329 (discriminator 1)
> ./include/linux/rcupdate.h:781 (discriminator 1)
> kernel/locking/lockdep.c:6614 (discriminator 1))
>   3 locks held by kworker/0:3/1077:
>   #0: ffff88810005ad48 ((wq_completion)events){+.+.}-{0:0}, at:
> process_one_work (kernel/workqueue.c:3229)
>   #1: ffff8881080dfd98
> ((work_completion)(&(&info->deferred_work)->work)){+.+.}-{0:0}, at:
> process_one_work (kernel/workqueue.c:3230)
>   #2: ffff88811416db38 (&fbdefio->lock){+.+.}-{3:3}, at:
> fb_deferred_io_work (drivers/video/fbdev/core/fb_defio.c:246)
>   1 lock held by r/2664:
>   #0: ffff8881141fe078 (&fb_info->lock){+.+.}-{3:3}, at: fb_release
> (drivers/video/fbdev/core/fb_chrdev.c:380)
>
>
>
> Syzkaller initially generated a long reproducer, Vegard simplified it to
> the one below
>
> C repro:
>
> #define _GNU_SOURCE
> #include <sys/mman.h>
> #include <fcntl.h>
> #include <stdlib.h>
> #include <unistd.h>
>
> int main(void)
> {
>          int fd =3D open("/dev/fb0", O_RDWR, 0);
>
>          char *ptr =3D (char *) 0x20000000ul;
>
>          mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000)=
;
>          *ptr =3D 0;
>
>          mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0);
>          *ptr =3D 0;
>
>          return 0;
> }
>
> This needs to be run as root to see the hang in 122 seconds.
>
> 238 static void fb_deferred_io_work(struct work_struct *work)
> 239 {
> 240         struct fb_info *info =3D container_of(work, struct fb_info,
> deferred_work.work);
> 241         struct fb_deferred_io_pageref *pageref, *next;
> 242         struct fb_deferred_io *fbdefio =3D info->fbdefio;
> 243
> 244         /* here we mkclean the pages, then do all deferred IO */
> 245         mutex_lock(&fbdefio->lock);
> 246         list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
> 247                 struct page *cur =3D pageref->page;
> 248                 lock_page(cur);
> 249                 page_mkclean(cur);
> 250                 unlock_page(cur);
> 251         }
>
> It is stalling on lock_page() in fb_deferred_io_work()
>
> I will be happy to try any patches and report back.

Hi,
This sounds similar to the SUSE bug [1]. We fixed it by reverting [2]
in the SUSE kernel. The problem seems to be that flush_delayed_work()
kills the timer and re-queues the work but doesn't guarantee that it
is finished when returning. So when the device is closed, the
fb_deferred_io_work() function can still be queued and tries to access
memory that's been freed.

Patch [2] tries to solve the problem of not throwing away pending data
when closing the device. Perhaps calling cancel_delayed_work_sync()
and then follow up with a manual call to fb_deferred_io_work() would
be enough to flush the remaining data?

-Patrik

[1] https://bugzilla.suse.com/show_bug.cgi?id=3D1221814
[2] 33cd6ea9c067 fbdev: flush deferred IO before closing

>
>
> Thanks,
> Harshit

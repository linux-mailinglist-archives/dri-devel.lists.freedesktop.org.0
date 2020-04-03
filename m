Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5BF19E4F4
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B56B6E190;
	Sat,  4 Apr 2020 12:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B246E6E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 08:58:07 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id v7so7251214qkc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/fMTu9YPirg7Oe+WQpcx+ru33Csg9jun3QSGySXC/HE=;
 b=L8fRM1d56HsWAvRUyQ5XoM0HgTTGfbtFGPC+42OW5EH8/+iUfDHiYfS4RhMquwg9lz
 YCy1+PxlR/P3KmPM2PftfvhSoeizYab/YGf5ot+4AsJRHhQ7lhNiGyuEYqgX6SYRoAZY
 K53iFoa0GRM+5lzSxURAILsHXR/RLyaJKc+5vHXMEvP5gFbkVm+XhYAVpMIc0wX71TBK
 wODo96H9rSVZxsqR/y94QDkNWwBlPmKwWopBZGnbZzk2pA/4MquXODaSxdO81ClSxO1v
 ql8SnQYEtN/NEdnEhWZEkmw6OSI+pkSetH+W61gbLYDtB7tKKTU23c7DTQhZz4LuEuH9
 1byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/fMTu9YPirg7Oe+WQpcx+ru33Csg9jun3QSGySXC/HE=;
 b=e0zs3E9gu4/ontjdhiS41yh1M+eS+KqidbMwKhvN8ovVeUIyYXLhqJZS2RcagLOEvE
 dk6IcYBWfUQLdPd6a6raMt6kl0C5X+TBJa6aloO6OTUAoDs+D6kpbRGuyM3Hlk7Ta4yd
 kzlawg3Msn6BK9DeL10jFdNxEhDakCBAeaUkK+WO15zRdlPn0TseDDnc80j4rmMhKrTX
 6J3eD3l+47ShxsVOeL90p0Bx6+/geV0bvwGNUf2qO4cZ8sxduD67gW0wS52erXTkDwxl
 NOoQ5O962XiqmbI/5RmImUq9vr70mMJe204nNYPvYwNle0mJCKTtaz3MnAQVZBaKBDLt
 3Bfg==
X-Gm-Message-State: AGi0PuZWuln8Vouh9KTaXhP0aKq2kqs4I2noCGHv5chKWrkLx5/UDvTH
 YEJt5t1GJE3MnfKiL8fYKFc9or/L2DkuKsS784kVlw==
X-Google-Smtp-Source: APiQypIKQ9Q7tDsIWkY8R8OpBoSAnP2oDbVXYV+fjPe3tON+mWT3k0wTSJXrY39iJHQ3bTEYPrCgBcewWCidMgbHh5Q=
X-Received: by 2002:a37:6115:: with SMTP id v21mr7418908qkb.43.1585904286347; 
 Fri, 03 Apr 2020 01:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ec257905a21f7415@google.com>
 <20200331095737.GO20730@hirez.programming.kicks-ass.net>
 <CGME20200331101907eucas1p1ce5d3f7c49c2c724c4e85f5c19c7108d@eucas1p1.samsung.com>
 <CACT4Y+bqBCqDPQZ1Nk8G+8y2vu8aaT2S54J4UqRPaFNUcusbYw@mail.gmail.com>
 <7641fb29-20ec-0963-d04c-bfbf49fd3ebc@samsung.com>
 <CAKMK7uF5zZH3CaHueWsLR96-AzT==wP8=MpymTqx-T+SRsXWHA@mail.gmail.com>
 <CACT4Y+Y_i86-MPG_3jo-+_5WTLvcNi6HTR=mQkVdwJb5ATqDsQ@mail.gmail.com>
 <CAKMK7uHCZK8L_Ho3yBq-=QnKm9F60KtRTqr8pAHxVjUcFjnd_w@mail.gmail.com>
 <CAKMK7uH4PzdtZmg8_j91g571aXd98XPfq18mg7aN6=e9XLoDgg@mail.gmail.com>
In-Reply-To: <CAKMK7uH4PzdtZmg8_j91g571aXd98XPfq18mg7aN6=e9XLoDgg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 3 Apr 2020 10:57:54 +0200
Message-ID: <CACT4Y+bhyXRF_AOOqh9D7XnU3jJT=sQR_BY69v5CXq1Getrf9g@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in try_to_wake_up
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:44 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@google.com>,
 syzkaller <syzkaller@googlegroups.com>, Borislav Petkov <bp@alien8.de>,
 DRI <dri-devel@lists.freedesktop.org>,
 syzbot <syzbot+e84d7ebd1361da13c356@syzkaller.appspotmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 1, 2020 at 11:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Tue, Mar 31, 2020 at 2:18 PM Bartlomiej Zolnierkiewicz
> > > > <b.zolnierkie@samsung.com> wrote:
> > > > >
> > > > >
> > > > > On 3/31/20 12:18 PM, Dmitry Vyukov wrote:
> > > > > > On Tue, Mar 31, 2020 at 11:57 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > > > >>
> > > > > >> On Mon, Mar 30, 2020 at 10:01:12PM -0700, syzbot wrote:
> > > > > >>> Hello,
> > > > > >>>
> > > > > >>> syzbot found the following crash on:
> > > > > >>>
> > > > > >>> HEAD commit:    9420e8ad Merge tag 'for-linus' of git://git.kernel.org/pub..
> > > > > >>> git tree:       upstream
> > > > > >>> console output: https://protect2.fireeye.com/url?k=0756a78d-5a9a6c49-07572cc2-0cc47a314e9a-e4dc8b657d340686&u=https://syzkaller.appspot.com/x/log.txt?x=1206ed4be00000
> > > > > >>> kernel config:  https://protect2.fireeye.com/url?k=43211072-1eeddbb6-43209b3d-0cc47a314e9a-3bd45a19932c37c8&u=https://syzkaller.appspot.com/x/.config?x=27392dd2975fd692
> > > > > >>> dashboard link: https://protect2.fireeye.com/url?k=bf7a6153-e2b6aa97-bf7bea1c-0cc47a314e9a-c64073ee605efb7b&u=https://syzkaller.appspot.com/bug?extid=e84d7ebd1361da13c356
> > > > > >>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > > > >>>
> > > > > >>> Unfortunately, I don't have any reproducer for this crash yet.
> > > > > >>>
> > > > > >>> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > > >>> Reported-by: syzbot+e84d7ebd1361da13c356@syzkaller.appspotmail.com
> > > > > >>>
> > > > > >>> INFO: trying to register non-static key.
> > > > > >>> the code is fine but needs lockdep annotation.
> > > > > >>> turning off the locking correctness validator.
> > > > > >>> CPU: 1 PID: 1014 Comm: syz-executor.0 Not tainted 5.6.0-rc7-syzkaller #0
> > > > > >>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > > > > >>> Call Trace:
> > > > > >>>  <IRQ>
> > > > > >>>  __dump_stack lib/dump_stack.c:77 [inline]
> > > > > >>>  dump_stack+0x188/0x20d lib/dump_stack.c:118
> > > > > >>>  assign_lock_key kernel/locking/lockdep.c:880 [inline]
> > > > > >>>  register_lock_class+0x14c4/0x1540 kernel/locking/lockdep.c:1189
> > > > > >>>  __lock_acquire+0xfc/0x3ca0 kernel/locking/lockdep.c:3836
> > > > > >>>  lock_acquire+0x197/0x420 kernel/locking/lockdep.c:4484
> > > > > >>>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
> > > > > >>>  _raw_spin_lock_irqsave+0x8c/0xbf kernel/locking/spinlock.c:159
> > > > > >>>  try_to_wake_up+0x9f/0x17c0 kernel/sched/core.c:2547
> > > > > >>
> > > > > >> That's p->pi_lock, which gets initialized in rt_mutex_init_task() in
> > > > > >> copy_process(). This should be impossible. Very odd.
> > > > > >
> > > > > > The stack mentions fbdev, which is a red flag at the moment. There are
> > > > > > a dozen of bad bugs in fbdev and around. Just few days ago Andy
> > > > > > pointed to another "impossible" crash "general protection fault in
> > > > > > do_syscall_64" which is related to dri:
> > > > > > https://protect2.fireeye.com/url?k=0cb8ad06-517466c2-0cb92649-0cc47a314e9a-a20c11191483c65b&u=https://syzkaller.appspot.com/bug?id=0ec7b2602b1ff40f0d34f38baa4ba1640727c3d9
> > > > > > https://protect2.fireeye.com/url?k=614292e3-3c8e5927-614319ac-0cc47a314e9a-aeda6d72c01a7b0e&u=https://groups.google.com/forum/#!msg/syzkaller-bugs/ePqhfYx0-8M/Q_Urt97iAAAJ
> > > > > >
> > > > > > There are probably more random manifestations of these bugs already,
> > > > > > and I guess we will be getting more.
> > > > > >
> > > > > > +fbdev maintainers
> > > > >
> > > > > Thank you for the report.
> > > > >
> > > > > fbdev is in the maintenance mode and no new features or drivers are
> > > > > being added so syzbot reports are not for a new bugs (regressions) and
> > > > > are not a priority (at least to me).
> > > >
> > > > Yup same here, I've seen a pile of syzbot reports for fbdev (and also
> > > > vt, or combinations of them since fbdev is linked to vt through fbcon)
> > > > fly by. But I really don't have to deal with these, my recommendation
> > > > to anyone who cares about security are:
> > > > - Don't enable vt
> > > > - Don't enable fbdev
> > >
> > > 1. How do we deliver this message to relevant people?
> > >
> > > Because:
> > >
> > > $ grep FBDEV syzkaller/dashboard/config/upstream-kasan.config
> > > CONFIG_DRM_FBDEV_EMULATION=y
> > > CONFIG_DRM_FBDEV_OVERALLOC=100
> > > # CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
> > > CONFIG_XEN_FBDEV_FRONTEND=y
> > >
> > > and my current work machine:
> > >
> > > $ grep FBDEV /boot/config-5.2.17-1-amd64
> > > CONFIG_DRM_FBDEV_EMULATION=y
> > > CONFIG_DRM_FBDEV_OVERALLOC=100
> > > # CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
> > > CONFIG_XEN_FBDEV_FRONTEND=y
> >
> > Yeah I know it's been like this since forever. In theory you could
> > build a fbdev/fbcon less distro since years (the last bit for a proof
> > of concept was kmscon/systemd-consoled), but the amount of investment
> > into classic linux desktop is so little that it's impossible to get
> > this funded. CrOS fixed this a while ago iirc though.
> >
> > I think to fix the syzbot issues all we'd need is a competent intern
> > for a few months, that should take care of the worst stuff. Obviously
> > wont include getting a test suite going, nor fixing any of the
> > fundamental issues. But duct-taping over all the bugs should be
> > possible (it's what we've been doing for well over 10 years by now in
> > fbdev/fbocn/vt code anyway). I'd be willing to help mentoring, but
> > that's about all I can do.
> >
> > Adding Matthew Garret, I have discussed with him in the past finding
> > some funding for linux desktop stuff like this.

I will keep this in mind. We _may_ get some interns this year who
_may_ be interested in fixing Linux kernel bugs (but otherwise
extending syzkaller descriptions).

FTR, there is also some follow up on twitter re extending
https://github.com/a13xp0p0v/kconfig-hardened-check to capture such
recommendations:
https://twitter.com/dvyukov/status/1245969522869309441
https://github.com/a13xp0p0v/kconfig-hardened-check/issues/38


> > > 2. What do we do with fbdev testing on syzbot? Is there a way to
> > > disable all of the unsupported stuff? But if we disable it, we don't
> > > find any regressions as well. And in the end that's what is in the
> > > mainline kernel and is still enabled in distros (at least in the 2
> > > real configs I can grep now).
> >
> > This would be bad I agree, but it's not any worse than the state of
> > things the past 10 years. That's roughly for as long as fbdev has been
> > in maintainance only mode, meaning "we'll apply patches if they come".
> > Without Bart volunteering, we wouldn't even have that much really.
>
> Oh wrt disabling fbdev: Make sure CONFIG_FB isn't set. Unfortunately a
> pile of other things select that, for convenience (like
> CONFIG_DRM_KMS_FB_HELPER).
>
> That should get rid of all the problematic fbdev code.
>
> From what I've seen in some of the syzbot mails flying by we also have
> issues in vt and console code blowing up (not just on fbcon/fbdev, but
> also e.g. on vgacon). That stuff you'll still hit. But maybe you can
> trick Greg KH into fixing the vt/console.c issues, he just claimed
> that :-P
> -Daniel
>
> >
> > > > All that code has been developed long ago, in a much more innocent
> > > > time. If someone wants to fix this you'd not just need to fix all the
> > > > syzbot stuff, but also ramp up a full testsuite for all the ioctl, and
> > > > all the corner-cases. Plus also fix some of the horrendous locking in
> > > > there, probably.
> > > >
> > > > Multi-year effort, easily.
> > > >
> > > > Regressions I'll obviously try to handle, but none of these are. It's
> > > > just syzbot has become smarter at hitting bugs in fbdev and vt
> > > > subsystems (or maybe the hw the virtual machines emulate has become
> > > > more varied, some of the reports are for fun stuff like vgacon ...).
> > > >
> > > > Cheers, Daniel
> > > >
> > > > > I have only resources to review/merge pending fbdev patches from time
> > > > > to time so any help in fixing these syzbot reports is welcomed (there
> > > > > have been a few fbdev related syzbot reports recently).
> > > > >
> > > > > Also please note that fbdev is maintained through drm-misc tree so
> > > > > patches can also be handled by other drm-misc maintainers in case I'm
> > > > > not available / busy with other things.
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Bartlomiej Zolnierkiewicz
> > > > > Samsung R&D Institute Poland
> > > > > Samsung Electronics
> > > > >
> > > > > >>>  wake_up_worker kernel/workqueue.c:836 [inline]
> > > > > >>>  insert_work+0x2ad/0x3a0 kernel/workqueue.c:1337
> > > > > >>>  __queue_work+0x50d/0x1280 kernel/workqueue.c:1488
> > > > > >>>  call_timer_fn+0x195/0x760 kernel/time/timer.c:1404
> > > > > >>>  expire_timers kernel/time/timer.c:1444 [inline]
> > > > > >>>  __run_timers kernel/time/timer.c:1773 [inline]
> > > > > >>>  __run_timers kernel/time/timer.c:1740 [inline]
> > > > > >>>  run_timer_softirq+0x412/0x1600 kernel/time/timer.c:1786
> > > > > >>>  __do_softirq+0x26c/0x99d kernel/softirq.c:292
> > > > > >>>  invoke_softirq kernel/softirq.c:373 [inline]
> > > > > >>>  irq_exit+0x192/0x1d0 kernel/softirq.c:413
> > > > > >>>  exiting_irq arch/x86/include/asm/apic.h:546 [inline]
> > > > > >>>  smp_apic_timer_interrupt+0x19e/0x600 arch/x86/kernel/apic/apic.c:1146
> > > > > >>>  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
> > > > > >>>  </IRQ>
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

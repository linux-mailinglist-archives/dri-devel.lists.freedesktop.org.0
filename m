Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD85338FC2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31D36F551;
	Fri, 12 Mar 2021 14:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10546F551
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:22:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so15291891wmj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=e4w+I/qltVMaZpzAv1nWIPtn2ghNS5HKzhAOV/OcQBU=;
 b=ZYTGcYys+/Zea+0jtFGoBgrWP4bQgPF8DqoyJQuuNraBgNLduERLGUjUFfNKrLCAay
 x/pNzXQ9s7dkNUWv7LyPpqBYR4fr+GAOZGB1Fql7/BuvRHHbzww5RcIa+gqeJSS5UD85
 SbyHtbv+Iqz5L2wYNxJg2tqcy6e/ExkQbIamg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=e4w+I/qltVMaZpzAv1nWIPtn2ghNS5HKzhAOV/OcQBU=;
 b=oZqfMwxFa8Df+qR6/b8yUYFNKk6vtzRAiecENoHxgm2uRperhg2ajbdR7pZAKcdP2X
 /oy4uxZBZ9CETPhU1Gk0t1SL1Xv7zt/QDYgWCMwpWREidrpu9ZessSG5JYPcSdio+WUb
 LGG5Q1dxbxZb8YbrxPNWKVVJ4jW3myC4BXPVEK8ZX5IzvJ0169dmZ0J8gh5IUex1E5Or
 ElcH/XD4ZskqMp1j79/UTZJAE0FI1M9ckCfpGJdFMMYsibeSdWhWjJ/Y0XoABgbuwrVm
 9AwnPv+ojzTjCWFjRbkvgMjAJck0LhoewKhuY4K3461Hf9vdXgxTeIFAb8+l3KWD27wU
 fGAA==
X-Gm-Message-State: AOAM531W+Z5TUJNAA3Tk0sCpzX7ct9aHE95VriLw0XO9+8be23WvaoeW
 x1hI0qyfrlGhrFlgHdBIrS6Y2Q==
X-Google-Smtp-Source: ABdhPJywmBqLmetHNuc/QkxjjAKDl0Slt139sCD0THqtTaiLOFSRCggU+h02FT33MwVQ3UuK4U3Ylg==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr13376756wmh.166.1615558964430; 
 Fri, 12 Mar 2021 06:22:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m17sm8169334wrx.92.2021.03.12.06.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:22:43 -0800 (PST)
Date: Fri, 12 Mar 2021 15:22:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [syzbot] upstream boot error: WARNING in vkms_vblank_simulate
Message-ID: <YEt5MfyAB7YCFFhl@phenom.ffwll.local>
Mail-Followup-To: Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+333bd014262fd5d0a418@syzkaller.appspotmail.com>,
 David Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, melissa.srw@gmail.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <0000000000009cd8d505bd545452@google.com>
 <CACT4Y+a68cidsRa1zd8h=rNVkwyYKdihBtO2YBPyyxwc2Twpng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+a68cidsRa1zd8h=rNVkwyYKdihBtO2YBPyyxwc2Twpng@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 syzbot <syzbot+333bd014262fd5d0a418@syzkaller.appspotmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 melissa.srw@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 11:46:27AM +0100, Dmitry Vyukov wrote:
> On Fri, Mar 12, 2021 at 11:26 AM syzbot
> <syzbot+333bd014262fd5d0a418@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    f78d76e7 Merge tag 'drm-fixes-2021-03-12-1' of git://anong..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=11c16ba2d00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=dc02c6afcb046874
> > dashboard link: https://syzkaller.appspot.com/bug?extid=333bd014262fd5d0a418
> > userspace arch: arm
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+333bd014262fd5d0a418@syzkaller.appspotmail.com
> 
> This WARNING seems to be happening just randomly.
> It was already reported as:
> 
> #syz dup: WARNING in vkms_vblank_simulate (2)
> https://syzkaller.appspot.com/bug?id=9b10491371879700d6a21c15684c2232ff015084
> 
> It now has whooping 48589 crashes and also crashes slow qemu tcg instances.

Yeah your box is too slow. We're trying to simulate hw here, which means
if we can process less than 1 hrtimer per vblank (standard every 16ms)
then we scream, because things go very wrong with the simulated hw. And
the hrtimer is really not that big, all the expensive processing is pushed
to worker, where we have code to handle if it falls back too much.

So either patch this out or make the code robust against a kernel that
somehow can't process a single hrtimer every 16ms.
-Daniel

> 
> 
> 
> > ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 0 at drivers/gpu/drm/vkms/vkms_crtc.c:21 vkms_vblank_simulate+0x26c/0x2f4 drivers/gpu/drm/vkms/vkms_crtc.c:41
> > Modules linked in:
> > CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc2-syzkaller-00338-gf78d76e72a46 #0
> > Hardware name: linux,dummy-virt (DT)
> > pstate: 20000085 (nzCv daIf -PAN -UAO -TCO BTYPE=--)
> > pc : vkms_vblank_simulate+0x26c/0x2f4 drivers/gpu/drm/vkms/vkms_crtc.c:21
> > lr : hrtimer_forward_now include/linux/hrtimer.h:510 [inline]
> > lr : vkms_vblank_simulate+0x90/0x2f4 drivers/gpu/drm/vkms/vkms_crtc.c:19
> > sp : ffff00006a693cd0
> > x29: ffff00006a693cd0 x28: ffff00000c9d1e58
> > x27: dfff800000000000 x26: ffff00006a67f540
> > x25: 1fffe0000d4cfeb1 x24: 1fffe0000d4cfeaa
> > x23: ffff00000c9d0d30 x22: 0000000000fe4c00
> > x21: ffff00006a67f540 x20: ffff00000c9d0e58
> > x19: ffff00000c9d1e58 x18: ffff00006a6a1b48
> > x17: 1fffe00001952345 x16: 0000000000000000
> > x15: ffff8000197bf810 x14: 1fffe0000d4d2750
> > x13: 0000000000000001 x12: 0000000000000033
> > x11: 1ffff00002fb4936 x10: 0000000000000007
> > x9 : 1ffff00002fb4943 x8 : ffff800017d14c00
> > x7 : 00000000f1f1f1f1 x6 : dfff800000000000
> > x5 : 7fffffffffffffff x4 : 00000008e44f6b90
> > x3 : 00000008e54db790 x2 : 00000008e44f6b90
> > x1 : 00000008e54db790 x0 : 0000000000000002
> > Call trace:
> >  vkms_vblank_simulate+0x26c/0x2f4 drivers/gpu/drm/vkms/vkms_crtc.c:41
> >  __run_hrtimer kernel/time/hrtimer.c:1519 [inline]
> >  __hrtimer_run_queues+0x590/0xe40 kernel/time/hrtimer.c:1583
> >  hrtimer_interrupt+0x2d4/0x810 kernel/time/hrtimer.c:1645
> >  timer_handler drivers/clocksource/arm_arch_timer.c:647 [inline]
> >  arch_timer_handler_phys+0x4c/0x70 drivers/clocksource/arm_arch_timer.c:665
> >  handle_percpu_devid_irq+0x19c/0x330 kernel/irq/chip.c:930
> >  generic_handle_irq_desc include/linux/irqdesc.h:158 [inline]
> >  generic_handle_irq kernel/irq/irqdesc.c:652 [inline]
> >  __handle_domain_irq+0x11c/0x1f0 kernel/irq/irqdesc.c:689
> >  handle_domain_irq include/linux/irqdesc.h:176 [inline]
> >  gic_handle_irq+0x5c/0x1b0 drivers/irqchip/irq-gic.c:370
> >  el1_irq+0xb4/0x180 arch/arm64/kernel/entry.S:669
> >  arch_local_irq_restore arch/arm64/include/asm/irqflags.h:124 [inline]
> >  queue_work_on+0x74/0x110 kernel/workqueue.c:1528
> >  queue_work include/linux/workqueue.h:507 [inline]
> >  cursor_timer_handler+0x64/0x100 drivers/video/fbdev/core/fbcon.c:397
> >  call_timer_fn+0x1d4/0x9c4 kernel/time/timer.c:1431
> >  expire_timers kernel/time/timer.c:1476 [inline]
> >  __run_timers.part.0+0x530/0xa00 kernel/time/timer.c:1745
> >  __run_timers kernel/time/timer.c:1726 [inline]
> >  run_timer_softirq+0xa4/0x1a0 kernel/time/timer.c:1758
> >  _stext+0x2b4/0x1084
> >  do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
> >  invoke_softirq kernel/softirq.c:228 [inline]
> >  __irq_exit_rcu+0x46c/0x510 kernel/softirq.c:422
> >  irq_exit+0x14/0x84 kernel/softirq.c:446
> >  __handle_domain_irq+0x120/0x1f0 kernel/irq/irqdesc.c:692
> >  handle_domain_irq include/linux/irqdesc.h:176 [inline]
> >  gic_handle_irq+0x5c/0x1b0 drivers/irqchip/irq-gic.c:370
> >  el1_irq+0xb4/0x180 arch/arm64/kernel/entry.S:669
> >  arch_local_irq_enable+0xc/0x14 arch/arm64/include/asm/irqflags.h:37
> >  default_idle_call+0x64/0xf4 kernel/sched/idle.c:112
> >  cpuidle_idle_call kernel/sched/idle.c:194 [inline]
> >  do_idle+0x38c/0x4ec kernel/sched/idle.c:300
> >  cpu_startup_entry+0x28/0x80 kernel/sched/idle.c:397
> >  rest_init+0x1d0/0x2cc init/main.c:721
> >  arch_call_rest_init+0x10/0x1c
> >  start_kernel+0x3b0/0x3e8 init/main.c:1064
> >  0x0
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >
> > --
> > You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000009cd8d505bd545452%40google.com.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

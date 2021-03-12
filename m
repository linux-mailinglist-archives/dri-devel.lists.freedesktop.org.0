Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8348E338AD4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 12:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3716F56C;
	Fri, 12 Mar 2021 11:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849AB6F552
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 10:26:18 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id r10so17419130iod.20
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 02:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=tJa6oqa08GYKi+qhu6DZh8mHiL2tQzWmrTZOkAl7CMM=;
 b=fM9fabMWdq/euVw9IPls/+4i9eC8Qb3ZVoVkSKp6ADwCfalkef8pv0028jJbZeQiTu
 UPhHuuFmooJZgST7Awy2lvFJaj+lYKTKAu2Mzvq/8uqKVHiDX+KI48/PSlIOJ0QrGnfD
 OIdvoR9r7YNeP8m0PSmr1a+K3aj5RWTm37gvZkkUXCRPnMa3Jk+B81HS9op3qKxzRg2y
 p+LVAFJ4EVMUEDHoxpYq2B+JTlsR4QtIAEjNh7Yc+utrRscWPY6JhtSilw0T7TCQIZlG
 q03ZRsiGWF3oSXbTX53jnF1cnfp0WRucR2H8HGcT5QFP33dWmOFsY6Qz5h9GfqrT0JmC
 AfMg==
X-Gm-Message-State: AOAM532+Jat48XUuiggDYcLPAxJM1YOQc7m8/hMWebTQu2nRx9ReLmDy
 37VlM1PRiGpSgamxcgGr7LMF0UnMlt157BfPCD6697Pf4xmw
X-Google-Smtp-Source: ABdhPJwcwmTQxDJTIFOnFrB96MvW3LdlzucStZqyl2xQP1R4+iVMpwcn5/9UsrbCcScSdGCVHhCEd+RUNRBkFH+xlk86W1Kphi2w
MIME-Version: 1.0
X-Received: by 2002:a02:c985:: with SMTP id b5mr7967419jap.86.1615544778019;
 Fri, 12 Mar 2021 02:26:18 -0800 (PST)
Date: Fri, 12 Mar 2021 02:26:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009cd8d505bd545452@google.com>
Subject: [syzbot] upstream boot error: WARNING in vkms_vblank_simulate
From: syzbot <syzbot+333bd014262fd5d0a418@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, melissa.srw@gmail.com, 
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Fri, 12 Mar 2021 11:00:06 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    f78d76e7 Merge tag 'drm-fixes-2021-03-12-1' of git://anong..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11c16ba2d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dc02c6afcb046874
dashboard link: https://syzkaller.appspot.com/bug?extid=333bd014262fd5d0a418
userspace arch: arm

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+333bd014262fd5d0a418@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at drivers/gpu/drm/vkms/vkms_crtc.c:21 vkms_vblank_simulate+0x26c/0x2f4 drivers/gpu/drm/vkms/vkms_crtc.c:41
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc2-syzkaller-00338-gf78d76e72a46 #0
Hardware name: linux,dummy-virt (DT)
pstate: 20000085 (nzCv daIf -PAN -UAO -TCO BTYPE=--)
pc : vkms_vblank_simulate+0x26c/0x2f4 drivers/gpu/drm/vkms/vkms_crtc.c:21
lr : hrtimer_forward_now include/linux/hrtimer.h:510 [inline]
lr : vkms_vblank_simulate+0x90/0x2f4 drivers/gpu/drm/vkms/vkms_crtc.c:19
sp : ffff00006a693cd0
x29: ffff00006a693cd0 x28: ffff00000c9d1e58 
x27: dfff800000000000 x26: ffff00006a67f540 
x25: 1fffe0000d4cfeb1 x24: 1fffe0000d4cfeaa 
x23: ffff00000c9d0d30 x22: 0000000000fe4c00 
x21: ffff00006a67f540 x20: ffff00000c9d0e58 
x19: ffff00000c9d1e58 x18: ffff00006a6a1b48 
x17: 1fffe00001952345 x16: 0000000000000000 
x15: ffff8000197bf810 x14: 1fffe0000d4d2750 
x13: 0000000000000001 x12: 0000000000000033 
x11: 1ffff00002fb4936 x10: 0000000000000007 
x9 : 1ffff00002fb4943 x8 : ffff800017d14c00 
x7 : 00000000f1f1f1f1 x6 : dfff800000000000 
x5 : 7fffffffffffffff x4 : 00000008e44f6b90 
x3 : 00000008e54db790 x2 : 00000008e44f6b90 
x1 : 00000008e54db790 x0 : 0000000000000002 
Call trace:
 vkms_vblank_simulate+0x26c/0x2f4 drivers/gpu/drm/vkms/vkms_crtc.c:41
 __run_hrtimer kernel/time/hrtimer.c:1519 [inline]
 __hrtimer_run_queues+0x590/0xe40 kernel/time/hrtimer.c:1583
 hrtimer_interrupt+0x2d4/0x810 kernel/time/hrtimer.c:1645
 timer_handler drivers/clocksource/arm_arch_timer.c:647 [inline]
 arch_timer_handler_phys+0x4c/0x70 drivers/clocksource/arm_arch_timer.c:665
 handle_percpu_devid_irq+0x19c/0x330 kernel/irq/chip.c:930
 generic_handle_irq_desc include/linux/irqdesc.h:158 [inline]
 generic_handle_irq kernel/irq/irqdesc.c:652 [inline]
 __handle_domain_irq+0x11c/0x1f0 kernel/irq/irqdesc.c:689
 handle_domain_irq include/linux/irqdesc.h:176 [inline]
 gic_handle_irq+0x5c/0x1b0 drivers/irqchip/irq-gic.c:370
 el1_irq+0xb4/0x180 arch/arm64/kernel/entry.S:669
 arch_local_irq_restore arch/arm64/include/asm/irqflags.h:124 [inline]
 queue_work_on+0x74/0x110 kernel/workqueue.c:1528
 queue_work include/linux/workqueue.h:507 [inline]
 cursor_timer_handler+0x64/0x100 drivers/video/fbdev/core/fbcon.c:397
 call_timer_fn+0x1d4/0x9c4 kernel/time/timer.c:1431
 expire_timers kernel/time/timer.c:1476 [inline]
 __run_timers.part.0+0x530/0xa00 kernel/time/timer.c:1745
 __run_timers kernel/time/timer.c:1726 [inline]
 run_timer_softirq+0xa4/0x1a0 kernel/time/timer.c:1758
 _stext+0x2b4/0x1084
 do_softirq_own_stack include/asm-generic/softirq_stack.h:10 [inline]
 invoke_softirq kernel/softirq.c:228 [inline]
 __irq_exit_rcu+0x46c/0x510 kernel/softirq.c:422
 irq_exit+0x14/0x84 kernel/softirq.c:446
 __handle_domain_irq+0x120/0x1f0 kernel/irq/irqdesc.c:692
 handle_domain_irq include/linux/irqdesc.h:176 [inline]
 gic_handle_irq+0x5c/0x1b0 drivers/irqchip/irq-gic.c:370
 el1_irq+0xb4/0x180 arch/arm64/kernel/entry.S:669
 arch_local_irq_enable+0xc/0x14 arch/arm64/include/asm/irqflags.h:37
 default_idle_call+0x64/0xf4 kernel/sched/idle.c:112
 cpuidle_idle_call kernel/sched/idle.c:194 [inline]
 do_idle+0x38c/0x4ec kernel/sched/idle.c:300
 cpu_startup_entry+0x28/0x80 kernel/sched/idle.c:397
 rest_init+0x1d0/0x2cc init/main.c:721
 arch_call_rest_init+0x10/0x1c
 start_kernel+0x3b0/0x3e8 init/main.c:1064
 0x0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

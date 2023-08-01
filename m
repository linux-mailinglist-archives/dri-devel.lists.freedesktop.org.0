Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C7F76BE13
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 21:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E4B10E1D5;
	Tue,  1 Aug 2023 19:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com
 [209.85.161.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBD310E1DD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 19:48:58 +0000 (UTC)
Received: by mail-oo1-f80.google.com with SMTP id
 006d021491bc7-5662c34e5cdso269351eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 12:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690919338; x=1691524138;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dJA1hRJ7xlbH3Utw+J7CbKya52GbjgGCnvWGB24TPP8=;
 b=PA+ZRMnF4HOHrGoFRX1QrTCaZX1ITUFl6FMH9MQy3F19q/MLIM+JwpGV5MLDgyZ3Le
 sz6xbHbilsTSUHfKqUeqUE47W4Mel5QHaV9Wor9qvEnPToXco41LyAiP5lufyCg/dNn6
 wpAuAfNATab823rrCBzkH62niyIWosXDCBDJSxbsJ5uGJQkxAWpSzN6uP5xWDMEwQl5K
 XSOiIcrFpMA8skxY8s5cQTnioey9ZQ3DkiNn4dPZZagrmfiCCfDCsNvgY1HxVbZ6Z/lh
 JmU5ROsLdFs+Ir2GPkRlXj71FMQKstWHydHKg0doj6G3zQQFXmCdVqMnlv0TGxxnbiID
 QfXw==
X-Gm-Message-State: ABy/qLaL7yNWWXDtbWSXYcyADXG899BPtWt8fl/XKX3XKQ8JlfoCtWQD
 uzP2w78NbIVRrqTddiSrlSlFEaOKvnZM9KDPFK3KWvA54EDS
X-Google-Smtp-Source: APBJJlFr8WJJl9KhEIZDHraw37ddHs/+Lgw1NezvN6WMdHcpGorjo08LS9M0ZiGJojIOkoZLGjC1jRaWHeNx6WLC4SwrteCjxGca
MIME-Version: 1.0
X-Received: by 2002:a05:6870:ee08:b0:1bb:89c9:87f0 with SMTP id
 ga8-20020a056870ee0800b001bb89c987f0mr22700929oab.1.1690919338109; Tue, 01
 Aug 2023 12:48:58 -0700 (PDT)
Date: Tue, 01 Aug 2023 12:48:58 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007e04080601e1d6de@google.com>
Subject: [syzbot] [virt?] [dri?] upstream boot error: INFO: task hung in
 drm_atomic_get_plane_state
From: syzbot <syzbot+f0f99b966af80ec818db@syzkaller.appspotmail.com>
To: airlied@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 gurchetansingh@chromium.org, kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 olvaffe@gmail.com, syzkaller-bugs@googlegroups.com, 
 virtualization@lists.linux-foundation.org
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

Hello,

syzbot found the following issue on:

HEAD commit:    f837f0a3c948 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13c9adbea80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d98efd5949c43d64
dashboard link: https://syzkaller.appspot.com/bug?extid=f0f99b966af80ec818db
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-f837f0a3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eafb76f00a9a/vmlinux-f837f0a3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e48f89fd580f/bzImage-f837f0a3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f0f99b966af80ec818db@syzkaller.appspotmail.com

INFO: task swapper/0:1 blocked for more than 143 seconds.
      Not tainted 6.5.0-rc3-syzkaller-00225-gf837f0a3c948 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:swapper/0       state:D stack:22144 pid:1     ppid:0      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5381 [inline]
 __schedule+0xee1/0x59f0 kernel/sched/core.c:6710
 schedule+0xe7/0x1b0 kernel/sched/core.c:6786
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:6845
 __mutex_lock_common kernel/locking/mutex.c:679 [inline]
 __ww_mutex_lock.constprop.0+0x133b/0x2f50 kernel/locking/mutex.c:754
 ww_mutex_lock+0x37/0x140 kernel/locking/mutex.c:871
 modeset_lock+0x482/0x6b0 drivers/gpu/drm/drm_modeset_lock.c:314
 drm_modeset_lock drivers/gpu/drm/drm_modeset_lock.c:396 [inline]
 drm_modeset_lock+0x59/0x90 drivers/gpu/drm/drm_modeset_lock.c:392
 drm_atomic_get_plane_state+0x199/0x580 drivers/gpu/drm/drm_atomic.c:544
 drm_client_modeset_commit_atomic+0x246/0x810 drivers/gpu/drm/drm_client_modeset.c:1003
 drm_client_modeset_commit_locked+0x14d/0x570 drivers/gpu/drm/drm_client_modeset.c:1154
 pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1370 [inline]
 drm_fb_helper_pan_display+0x2a5/0x990 drivers/gpu/drm/drm_fb_helper.c:1430
 fb_pan_display+0x477/0x7c0 drivers/video/fbdev/core/fbmem.c:819
 bit_update_start+0x49/0x1f0 drivers/video/fbdev/core/bitblit.c:390
 fbcon_switch+0xbb1/0x12e0 drivers/video/fbdev/core/fbcon.c:2167
 redraw_screen+0x2bd/0x750 drivers/tty/vt/vt.c:970
 con2fb_init_display drivers/video/fbdev/core/fbcon.c:805 [inline]
 set_con2fb_map+0x793/0x1050 drivers/video/fbdev/core/fbcon.c:864
 do_fb_registered drivers/video/fbdev/core/fbcon.c:3004 [inline]
 fbcon_fb_registered+0x21d/0x660 drivers/video/fbdev/core/fbcon.c:3020
 do_register_framebuffer drivers/video/fbdev/core/fbmem.c:1497 [inline]
 register_framebuffer+0x530/0x940 drivers/video/fbdev/core/fbmem.c:1571
 __drm_fb_helper_initial_config_and_unlock+0xd7c/0x1600 drivers/gpu/drm/drm_fb_helper.c:1871
 drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1936 [inline]
 drm_fb_helper_initial_config+0x44/0x60 drivers/gpu/drm/drm_fb_helper.c:1928
 drm_fbdev_generic_client_hotplug+0x1a7/0x270 drivers/gpu/drm/drm_fbdev_generic.c:280
 drm_client_register+0x195/0x280 drivers/gpu/drm/drm_client.c:149
 drm_fbdev_generic_setup+0x11c/0x330 drivers/gpu/drm/drm_fbdev_generic.c:342
 virtio_gpu_probe+0x1be/0x3b0 drivers/gpu/drm/virtio/virtgpu_drv.c:105
 virtio_dev_probe+0x56c/0x870 drivers/virtio/virtio.c:305
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x234/0xc90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x4b0 drivers/base/dd.c:798
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:828
 __driver_attach+0x274/0x570 drivers/base/dd.c:1214
 bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:368
 bus_add_driver+0x2e9/0x630 drivers/base/bus.c:673
 driver_register+0x15c/0x4a0 drivers/base/driver.c:246
 do_one_initcall+0x117/0x630 init/main.c:1232
 do_initcall_level init/main.c:1294 [inline]
 do_initcalls init/main.c:1310 [inline]
 do_basic_setup init/main.c:1329 [inline]
 kernel_init_freeable+0x5bd/0x8f0 init/main.c:1546
 kernel_init+0x1c/0x2a0 init/main.c:1437
 ret_from_fork+0x2c/0x70 arch/x86/kernel/process.c:145
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:296
RIP: 0000:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 0000000000000000
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task kworker/0:1:8 blocked for more than 143 seconds.
      Not tainted 6.5.0-rc3-syzkaller-00225-gf837f0a3c948 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:1     state:D stack:27952 pid:8     ppid:2      flags:0x00004000
Workqueue: events virtio_gpu_dequeue_ctrl_func
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5381 [inline]
 __schedule+0xee1/0x59f0 kernel/sched/core.c:6710
 schedule+0xe7/0x1b0 kernel/sched/core.c:6786
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:6845
 __mutex_lock_common kernel/locking/mutex.c:679 [inline]
 __mutex_lock+0x967/0x1340 kernel/locking/mutex.c:747
 drm_client_dev_hotplug drivers/gpu/drm/drm_client.c:227 [inline]
 drm_client_dev_hotplug+0x169/0x3c0 drivers/gpu/drm/drm_client.c:214
 virtio_gpu_cmd_get_display_info_cb+0x3e1/0x550 drivers/gpu/drm/virtio/virtgpu_vq.c:674
 virtio_gpu_dequeue_ctrl_func+0x209/0x7d0 drivers/gpu/drm/virtio/virtgpu_vq.c:235
 process_one_work+0xaa2/0x16f0 kernel/workqueue.c:2597
 worker_thread+0x687/0x1110 kernel/workqueue.c:2748
 kthread+0x33a/0x430 kernel/kthread.c:389
 ret_from_fork+0x2c/0x70 arch/x86/kernel/process.c:145
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:296
RIP: 0000:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 0000000000000000
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task kworker/0:2:821 blocked for more than 143 seconds.
      Not tainted 6.5.0-rc3-syzkaller-00225-gf837f0a3c948 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:2     state:D stack:27416 pid:821   ppid:2      flags:0x00004000
Workqueue: events drm_fb_helper_damage_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5381 [inline]
 __schedule+0xee1/0x59f0 kernel/sched/core.c:6710
 schedule+0xe7/0x1b0 kernel/sched/core.c:6786
 virtio_gpu_queue_ctrl_sgs drivers/gpu/drm/virtio/virtgpu_vq.c:341 [inline]
 virtio_gpu_queue_fenced_ctrl_buffer+0x497/0xff0 drivers/gpu/drm/virtio/virtgpu_vq.c:415
 virtio_gpu_resource_flush drivers/gpu/drm/virtio/virtgpu_plane.c:152 [inline]
 virtio_gpu_primary_plane_update+0x1057/0x1590 drivers/gpu/drm/virtio/virtgpu_plane.c:227
 drm_atomic_helper_commit_planes+0x477/0xc00 drivers/gpu/drm/drm_atomic_helper.c:2756
 drm_atomic_helper_commit_tail+0x69/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1738
 commit_tail+0x32c/0x410 drivers/gpu/drm/drm_atomic_helper.c:1823
 drm_atomic_helper_commit+0x2f9/0x380 drivers/gpu/drm/drm_atomic_helper.c:2061
 drm_atomic_commit+0x20b/0x2d0 drivers/gpu/drm/drm_atomic.c:1513
 drm_atomic_helper_dirtyfb+0x611/0x7b0 drivers/gpu/drm/drm_damage_helper.c:181
 drm_fbdev_generic_helper_fb_dirty+0x823/0xbb0 drivers/gpu/drm/drm_fbdev_generic.c:231
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:390 [inline]
 drm_fb_helper_damage_work+0x283/0x5e0 drivers/gpu/drm/drm_fb_helper.c:413
 process_one_work+0xaa2/0x16f0 kernel/workqueue.c:2597
 process_scheduled_works kernel/workqueue.c:2664 [inline]
 worker_thread+0x896/0x1110 kernel/workqueue.c:2750
 kthread+0x33a/0x430 kernel/kthread.c:389
 ret_from_fork+0x2c/0x70 arch/x86/kernel/process.c:145
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:296
RIP: 0000:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 0000000000000000
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Showing all locks held in the system:
9 locks held by swapper/0/1:
 #0: ffff88810512c170 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:958 [inline]
 #0: ffff88810512c170 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1093 [inline]
 #0: ffff88810512c170 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x269/0x570 drivers/base/dd.c:1213
 #1: ffff88801fb722f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_register+0x54/0x280 drivers/gpu/drm/drm_client.c:135
 #2: ffffffff8d3e3e28 (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x7a/0x940 drivers/video/fbdev/core/fbmem.c:1570
 #3: ffffffff8c990da0 (console_lock){+.+.}-{0:0}, at: fbcon_fb_registered+0x3c/0x660 drivers/video/fbdev/core/fbcon.c:3016
 #4: ffff88810611e280 (&helper->lock){+.+.}-{3:3}, at: drm_fb_helper_pan_display+0xd5/0x990 drivers/gpu/drm/drm_fb_helper.c:1423
 #5: ffff88801fb721b0 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x21/0x70 drivers/gpu/drm/drm_auth.c:457
 #6: ffff88810611e098 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x4c/0x570 drivers/gpu/drm/drm_client_modeset.c:1152
 #7: ffffc90000267330 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0xd0/0x810 drivers/gpu/drm/drm_client_modeset.c:990
 #8: ffff88801e4cd8b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x482/0x6b0 drivers/gpu/drm/drm_modeset_lock.c:314
3 locks held by kworker/0:1/8:
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:20 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: raw_atomic64_set include/linux/atomic/atomic-arch-fallback.h:2608 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: raw_atomic_long_set include/linux/atomic/atomic-long.h:79 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:3196 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:675 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:702 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x96a/0x16f0 kernel/workqueue.c:2567
 #1: ffffc900002d7d80 ((work_completion)(&vgvq->dequeue_work)){+.+.}-{0:0}, at: process_one_work+0x99e/0x16f0 kernel/workqueue.c:2571
 #2: ffff88801fb722f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_dev_hotplug drivers/gpu/drm/drm_client.c:227 [inline]
 #2: ffff88801fb722f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_dev_hotplug+0x169/0x3c0 drivers/gpu/drm/drm_client.c:214
1 lock held by rcu_tasks_kthre/13:
 #0: ffffffff8c9a2730 (rcu_tasks.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x2c/0xe20 kernel/rcu/tasks.h:522
1 lock held by rcu_tasks_trace/14:
 #0: ffffffff8c9a2430 (rcu_tasks_trace.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x2c/0xe20 kernel/rcu/tasks.h:522
1 lock held by khungtaskd/40:
 #0: ffffffff8c9a3340 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x55/0x340 kernel/locking/lockdep.c:6615
2 locks held by kworker/u17:2/54:
 #0: ffff888012878138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:20 [inline]
 #0: ffff888012878138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: raw_atomic64_set include/linux/atomic/atomic-arch-fallback.h:2608 [inline]
 #0: ffff888012878138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: raw_atomic_long_set include/linux/atomic/atomic-long.h:79 [inline]
 #0: ffff888012878138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:3196 [inline]
 #0: ffff888012878138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:675 [inline]
 #0: ffff888012878138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:702 [inline]
 #0: ffff888012878138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x96a/0x16f0 kernel/workqueue.c:2567
 #1: ffffc90000c87d80 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: process_one_work+0x99e/0x16f0 kernel/workqueue.c:2571
5 locks held by kworker/0:2/821:
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:20 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: raw_atomic64_set include/linux/atomic/atomic-arch-fallback.h:2608 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: raw_atomic_long_set include/linux/atomic/atomic-long.h:79 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:3196 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:675 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:702 [inline]
 #0: ffff888012869d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x96a/0x16f0 kernel/workqueue.c:2567
 #1: ffffc90004cb7d80 ((work_completion)(&helper->damage_work)){+.+.}-{0:0}, at: process_one_work+0x99e/0x16f0 kernel/workqueue.c:2571
 #2: ffffc90004cb7a40 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_atomic_helper_dirtyfb+0xb5/0x7b0 drivers/gpu/drm/drm_damage_helper.c:123
 #3: ffff88801e4cd8b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x482/0x6b0 drivers/gpu/drm/drm_modeset_lock.c:314
 #4: ffffffff8d51c4b0 (drm_unplug_srcu){.+.+}-{0:0}, at: drm_dev_enter+0x4/0x160 drivers/gpu/drm/drm_drv.c:450

=============================================



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

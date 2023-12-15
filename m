Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C5D813EBD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 01:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55C510E2FC;
	Fri, 15 Dec 2023 00:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2AD10E323
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 00:35:25 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-28b1fb8bd41so127111a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 16:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702600525; x=1703205325;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PpiBzlfrnyqIuQMXcxxAE3wrYIST7IEhD0UwkZce/1Q=;
 b=ovFaqtTmeehSLfl+GlUAQbn9HX50Wb7Y8o82Q37p8/yavJdX8GxqxkP5TkVAxKZGWK
 CQgHWihaEeUVgPSvYVapBXqHT9cOzQAvor8bUHxRcPtIC1ZKNMMkUhTRFZUawsgrTFtW
 N7Fys1lsw7628YJDZTPysckkDLtPeCIMemU2JDvOVlaWrEHzykWVNyrFB+4WLNTzK3/F
 u2lbMFQUe/snNWDEASQV4b+IBoWwV4fEB8N6WZF/jJjwAybrQFhQgPsXBIFjDmTfLj8Z
 4rBsOpOV4NNcC6TR1CzJ+PW9Ni9FrsezTy+ZJAsTUxodbUlFWnXRfyIR5J9NlW2SU+Hk
 KlBQ==
X-Gm-Message-State: AOJu0Yw6LpVD55PKOq5Ebs6QnpfMfdcDb4WVWZ1VexNa0cR/4+srwFsP
 zEX5d7hKMGYgkWtkM73XVlKn2aqPTn/mt1JaMwLy0HtlDqux
X-Google-Smtp-Source: AGHT+IGaIzMF79kOfKHIq2JDhG1lXUHqCodVYyI/W4O0MR6qTozBuCullboeEuAuEmknQK2FwXVBmLN7FknkaMBU0yQ3UfraJGWk
MIME-Version: 1.0
X-Received: by 2002:a17:90b:1c88:b0:28b:2844:c35e with SMTP id
 oo8-20020a17090b1c8800b0028b2844c35emr216736pjb.5.1702600525206; Thu, 14 Dec
 2023 16:35:25 -0800 (PST)
Date: Thu, 14 Dec 2023 16:35:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007fdc93060c819337@google.com>
Subject: [syzbot] [dri?] [virtualization?] upstream boot error: INFO: task
 hung in drm_atomic_get_plane_state (2)
From: syzbot <syzbot+7e3df8432b2f284f38dc@syzkaller.appspotmail.com>
To: airlied@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 gurchetansingh@chromium.org, kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, olvaffe@gmail.com, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, 
 virtualization@lists.linux.dev
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

HEAD commit:    a39b6ac3781d Linux 6.7-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15277d6ce80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b6602324d4e5a4a9
dashboard link: https://syzkaller.appspot.com/bug?extid=7e3df8432b2f284f38dc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-a39b6ac3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/87b10cd1584b/vmlinux-a39b6ac3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/15b2b9a9ed4f/bzImage-a39b6ac3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7e3df8432b2f284f38dc@syzkaller.appspotmail.com

INFO: task swapper/0:1 blocked for more than 143 seconds.
      Not tainted 6.7.0-rc5-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:swapper/0       state:D stack:22160 pid:1     tgid:1     ppid:0      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5376 [inline]
 __schedule+0xedb/0x5af0 kernel/sched/core.c:6688
 __schedule_loop kernel/sched/core.c:6763 [inline]
 schedule+0xe9/0x270 kernel/sched/core.c:6778
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:6835
 __mutex_lock_common kernel/locking/mutex.c:679 [inline]
 __ww_mutex_lock.constprop.0+0xf57/0x2660 kernel/locking/mutex.c:754
 ww_mutex_lock+0x37/0x140 kernel/locking/mutex.c:871
 modeset_lock+0x484/0x6c0 drivers/gpu/drm/drm_modeset_lock.c:314
 drm_modeset_lock drivers/gpu/drm/drm_modeset_lock.c:396 [inline]
 drm_modeset_lock+0x59/0x90 drivers/gpu/drm/drm_modeset_lock.c:392
 drm_atomic_get_plane_state+0x199/0x580 drivers/gpu/drm/drm_atomic.c:544
 drm_client_modeset_commit_atomic+0x246/0x810 drivers/gpu/drm/drm_client_modeset.c:1003
 drm_client_modeset_commit_locked+0x14d/0x580 drivers/gpu/drm/drm_client_modeset.c:1154
 pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1370 [inline]
 drm_fb_helper_pan_display+0x2a5/0x990 drivers/gpu/drm/drm_fb_helper.c:1430
 fb_pan_display+0x477/0x7c0 drivers/video/fbdev/core/fbmem.c:191
 bit_update_start+0x49/0x1f0 drivers/video/fbdev/core/bitblit.c:390
 fbcon_switch+0xbb3/0x12e0 drivers/video/fbdev/core/fbcon.c:2170
 redraw_screen+0x2bd/0x750 drivers/tty/vt/vt.c:969
 con2fb_init_display drivers/video/fbdev/core/fbcon.c:808 [inline]
 set_con2fb_map+0x793/0x1050 drivers/video/fbdev/core/fbcon.c:867
 do_fb_registered drivers/video/fbdev/core/fbcon.c:3007 [inline]
 fbcon_fb_registered+0x21d/0x660 drivers/video/fbdev/core/fbcon.c:3023
 do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
 register_framebuffer+0x4b2/0x860 drivers/video/fbdev/core/fbmem.c:515
 __drm_fb_helper_initial_config_and_unlock+0xd7c/0x1600 drivers/gpu/drm/drm_fb_helper.c:1871
 drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1936 [inline]
 drm_fb_helper_initial_config+0x44/0x60 drivers/gpu/drm/drm_fb_helper.c:1928
 drm_fbdev_generic_client_hotplug+0x1a7/0x270 drivers/gpu/drm/drm_fbdev_generic.c:279
 drm_client_register+0x195/0x280 drivers/gpu/drm/drm_client.c:149
 drm_fbdev_generic_setup+0x11c/0x330 drivers/gpu/drm/drm_fbdev_generic.c:341
 virtio_gpu_probe+0x1be/0x3c0 drivers/gpu/drm/virtio/virtgpu_drv.c:105
 virtio_dev_probe+0x56e/0x870 drivers/virtio/virtio.c:305
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x234/0xc90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x4b0 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
 __driver_attach+0x274/0x570 drivers/base/dd.c:1216
 bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:368
 bus_add_driver+0x2e9/0x630 drivers/base/bus.c:673
 driver_register+0x15c/0x4a0 drivers/base/driver.c:246
 do_one_initcall+0x11c/0x650 init/main.c:1236
 do_initcall_level init/main.c:1298 [inline]
 do_initcalls init/main.c:1314 [inline]
 do_basic_setup init/main.c:1333 [inline]
 kernel_init_freeable+0x687/0xc10 init/main.c:1551
 kernel_init+0x1c/0x2a0 init/main.c:1441
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
 </TASK>
INFO: task kworker/0:0:7 blocked for more than 143 seconds.
      Not tainted 6.7.0-rc5-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:0     state:D stack:28704 pid:7     tgid:7     ppid:2      flags:0x00004000
Workqueue: events virtio_gpu_dequeue_ctrl_func
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5376 [inline]
 __schedule+0xedb/0x5af0 kernel/sched/core.c:6688
 __schedule_loop kernel/sched/core.c:6763 [inline]
 schedule+0xe9/0x270 kernel/sched/core.c:6778
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:6835
 __mutex_lock_common kernel/locking/mutex.c:679 [inline]
 __mutex_lock+0x5b9/0x9d0 kernel/locking/mutex.c:747
 drm_client_dev_hotplug drivers/gpu/drm/drm_client.c:227 [inline]
 drm_client_dev_hotplug+0x169/0x3c0 drivers/gpu/drm/drm_client.c:214
 virtio_gpu_cmd_get_display_info_cb+0x3e0/0x550 drivers/gpu/drm/virtio/virtgpu_vq.c:674
 virtio_gpu_dequeue_ctrl_func+0x21b/0x9a0 drivers/gpu/drm/virtio/virtgpu_vq.c:235
 process_one_work+0x886/0x15d0 kernel/workqueue.c:2627
 process_scheduled_works kernel/workqueue.c:2700 [inline]
 worker_thread+0x8b9/0x1290 kernel/workqueue.c:2781
 kthread+0x2c6/0x3a0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
 </TASK>
INFO: task kworker/2:1:36 blocked for more than 143 seconds.
      Not tainted 6.7.0-rc5-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/2:1     state:D stack:26720 pid:36    tgid:36    ppid:2      flags:0x00004000
Workqueue: events drm_fb_helper_damage_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5376 [inline]
 __schedule+0xedb/0x5af0 kernel/sched/core.c:6688
 __schedule_loop kernel/sched/core.c:6763 [inline]
 schedule+0xe9/0x270 kernel/sched/core.c:6778
 virtio_gpu_queue_ctrl_sgs drivers/gpu/drm/virtio/virtgpu_vq.c:341 [inline]
 virtio_gpu_queue_fenced_ctrl_buffer+0x497/0xff0 drivers/gpu/drm/virtio/virtgpu_vq.c:415
 virtio_gpu_resource_flush drivers/gpu/drm/virtio/virtgpu_plane.c:152 [inline]
 virtio_gpu_primary_plane_update+0x1059/0x1590 drivers/gpu/drm/virtio/virtgpu_plane.c:227
 drm_atomic_helper_commit_planes+0x92f/0xfe0 drivers/gpu/drm/drm_atomic_helper.c:2798
 drm_atomic_helper_commit_tail+0x69/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1747
 commit_tail+0x353/0x410 drivers/gpu/drm/drm_atomic_helper.c:1832
 drm_atomic_helper_commit+0x2f9/0x380 drivers/gpu/drm/drm_atomic_helper.c:2070
 drm_atomic_commit+0x20b/0x2d0 drivers/gpu/drm/drm_atomic.c:1513
 drm_atomic_helper_dirtyfb+0x611/0x7b0 drivers/gpu/drm/drm_damage_helper.c:181
 drm_fbdev_generic_helper_fb_dirty+0x827/0xbb0 drivers/gpu/drm/drm_fbdev_generic.c:230
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:390 [inline]
 drm_fb_helper_damage_work+0x283/0x5e0 drivers/gpu/drm/drm_fb_helper.c:413
 process_one_work+0x886/0x15d0 kernel/workqueue.c:2627
 process_scheduled_works kernel/workqueue.c:2700 [inline]
 worker_thread+0x8b9/0x1290 kernel/workqueue.c:2781
 kthread+0x2c6/0x3a0 kernel/kthread.c:388
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
 </TASK>

Showing all locks held in the system:
9 locks held by swapper/0/1:
 #0: ffff888102fd6170 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:992 [inline]
 #0: ffff888102fd6170 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1095 [inline]
 #0: ffff888102fd6170 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x269/0x570 drivers/base/dd.c:1215
 #1: ffff8881067782f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_register+0x54/0x280 drivers/gpu/drm/drm_client.c:135
 #2: ffffffff8dab0f68 (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x7a/0x860 drivers/video/fbdev/core/fbmem.c:514
 #3: ffffffff8cf958c0 (console_lock){+.+.}-{0:0}, at: fbcon_fb_registered+0x3c/0x660 drivers/video/fbdev/core/fbcon.c:3019
 #4: ffff888106bb2a80 (&helper->lock){+.+.}-{3:3}, at: drm_fb_helper_pan_display+0xd5/0x990 drivers/gpu/drm/drm_fb_helper.c:1423
 #5: ffff8881067781b0 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x21/0x70 drivers/gpu/drm/drm_auth.c:458
 #6: ffff888106bb2898 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x4c/0x580 drivers/gpu/drm/drm_client_modeset.c:1152
 #7: ffffc90000267328 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0xd0/0x810 drivers/gpu/drm/drm_client_modeset.c:990
 #8: ffff88801d5538b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x484/0x6c0 drivers/gpu/drm/drm_modeset_lock.c:314
3 locks held by kworker/0:0/7:
 #0: ffff888013069d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x789/0x15d0 kernel/workqueue.c:2602
 #1: ffffc900002c7d80 ((work_completion)(&vgvq->dequeue_work)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15d0 kernel/workqueue.c:2603
 #2: ffff8881067782f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_dev_hotplug drivers/gpu/drm/drm_client.c:227 [inline]
 #2: ffff8881067782f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_dev_hotplug+0x169/0x3c0 drivers/gpu/drm/drm_client.c:214
5 locks held by kworker/2:1/36:
 #0: ffff888013069d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x789/0x15d0 kernel/workqueue.c:2602
 #1: ffffc90000b27d80 ((work_completion)(&helper->damage_work)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15d0 kernel/workqueue.c:2603
 #2: ffffc90000b27a40 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_atomic_helper_dirtyfb+0xb5/0x7b0 drivers/gpu/drm/drm_damage_helper.c:123
 #3: ffff88801d5538b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x484/0x6c0 drivers/gpu/drm/drm_modeset_lock.c:314
 #4: ffffffff8dbe7f90 (drm_unplug_srcu){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:116 [inline]
 #4: ffffffff8dbe7f90 (drm_unplug_srcu){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:215 [inline]
 #4: ffffffff8dbe7f90 (drm_unplug_srcu){.+.+}-{0:0}, at: drm_dev_enter+0x49/0x160 drivers/gpu/drm/drm_drv.c:450
1 lock held by khungtaskd/38:
 #0: ffffffff8cfa82e0 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:301 [inline]
 #0: ffffffff8cfa82e0 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:747 [inline]
 #0: ffffffff8cfa82e0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x75/0x340 kernel/locking/lockdep.c:6614
2 locks held by kworker/u16:6/366:
 #0: ffff888013079938 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x789/0x15d0 kernel/workqueue.c:2602
 #1: ffffc90003377d80 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15d0 kernel/workqueue.c:2603

=============================================



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

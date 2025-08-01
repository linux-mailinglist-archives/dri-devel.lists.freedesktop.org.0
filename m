Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C529DB17DD3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 09:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A9510E807;
	Fri,  1 Aug 2025 07:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com
 [209.85.166.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2AC10E3C8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 07:54:31 +0000 (UTC)
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3e3e973055fso37466255ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 00:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754034871; x=1754639671;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DRpGRn8hYeC25Ss0A0YV3ZmMvuPG8PwTQovY7aWP98E=;
 b=aks/MhuiP7r/W/vAG3VbhtOcQmWtJuX/SngbwPwHUUHlvg1EYLQ8n2meSf25OxcP2g
 48bepR/lT9fvGVdDkU24VLUMIZrPPS/mO6waribh0CDk4sgAprq3dqJtIjwwrZxVTIVq
 AU5x7kMWrut8skSGEIbQNBba8380yrf60mMyX33OSNM0Xkkf+WTXypQNAHAZ0y3wqIrZ
 5nWpS0n5N8E6IkfhS3AfY+OZ0B10ths7VQhPoGCJbpP//rc2xEn8KTIKVX06IAo+Bmzh
 Rpv0x7hd/5FyXA4FdCBi0FmR9RYmfYlTySGzy0eFlx3D+S7qkNWJQ0ZbXSQMTc1nV3hL
 o+9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMhvqn9NBNFyCTbQHvLUEaF1bJv+sOPlrHoIV9TGtJHkh9dQndrJlpQ3gap5TSv7aJxuZdsJtEa4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbH1yZ0Bd+OEOGGPIq5fBSTc9zPI5zqGdYWqTHH1Xs0qz25NUV
 ZJd3PiTuODiX/Pa30UmmWBJggqW5oXP+zlf07kKJyI4g/BSc2NwLuU+aU049Y/48hFRhEOlZV19
 n1wjRqpDB/WajpDtCMopfLiYN3ocTP1o0azgwTKIebftKIgSZ8D2cwtgJpZY=
X-Google-Smtp-Source: AGHT+IFez52A5y9zXJBHRaDbzzr2sDEVBYhVKvs5WfVLm7l9qjA837BPixCJ/CVeY6H8dPVWI24TWQAcn2m83mqp/e5ZsYb9QJkZ
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2483:b0:3e4:1162:6761 with SMTP id
 e9e14a558f8ab-3e4116275a6mr7669275ab.9.1754034870892; Fri, 01 Aug 2025
 00:54:30 -0700 (PDT)
Date: Fri, 01 Aug 2025 00:54:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <688c72b6.a00a0220.26d0e1.0064.GAE@google.com>
Subject: [syzbot] [dri?] upstream test error: WARNING in __ww_mutex_wound
From: syzbot <syzbot+c4f4e64f6ac2733325f9@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
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

HEAD commit:    f2d282e1dfb3 Merge tag 'bitmap-for-6.17' of https://github..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=122cd2a2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b44f1a914fd00509
dashboard link: https://syzkaller.appspot.com/bug?extid=c4f4e64f6ac2733325f9
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-f2d282e1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2ef45393ac9e/vmlinux-f2d282e1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8200ce1bbcbf/bzImage-f2d282e1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c4f4e64f6ac2733325f9@syzkaller.appspotmail.com

9p: Installing v9fs 9p2000 file system support
NILFS version 2 loaded
befs: version: 0.9.3
ocfs2: Registered cluster interface o2cb
ocfs2: Registered cluster interface user
OCFS2 User DLM kernel interface loaded
gfs2: GFS2 installed
ceph: loaded (mds proto 32)
cryptd: max_cpu_qlen set to 1000
NET: Registered PF_ALG protocol family
xor: automatically using best checksumming function   avx       
async_tx: api initialized (async)
Key type asymmetric registered
Asymmetric key parser 'x509' registered
Asymmetric key parser 'pkcs8' registered
Key type pkcs7_test registered
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 238)
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
ACPI: \_SB_.GSIE: Enabled at IRQ 20
pcieport 0000:00:04.0: PME: Signaling with IRQ 25
pcieport 0000:00:04.0: AER: enabled with IRQ 26
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
ACPI: button: Power Button [PWRF]
ioatdma: Intel(R) QuickData Technology Driver 5.00
ACPI: \_SB_.GSIF: Enabled at IRQ 21
ACPI: \_SB_.GSIH: Enabled at IRQ 23
N_HDLC line discipline registered with maxframe=4096
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
usbcore: registered new interface driver xillyusb
ACPI: bus type drm_connector registered
[drm] Initialized vgem 1.0.0 for vgem on minor 0
[drm] Initialized vkms 1.0.0 for vkms on minor 1
Console: switching to colour frame buffer device 128x48
faux_driver vkms: [drm] fb0: vkmsdrmfb frame buffer device
usbcore: registered new interface driver udl
[drm] pci: virtio-vga detected at 0000:00:01.0
virtio-pci 0000:00:01.0: vgaarb: deactivate vga console
[drm] features: -virgl +edid -resource_blob -host_visible
[drm] features: -context_init
[drm] number of scanouts: 1
[drm] number of cap sets: 0
[drm] Initialized virtio_gpu 0.1.0 for 0000:00:01.0 on minor 2
fbcon: virtio_gpudrmfb (fb1) is primary device
fbcon: Remapping primary device, fb1, to tty 1-63
------------[ cut here ]------------
WARNING: CPU: 2 PID: 1 at ./include/linux/sched.h:2180 __clear_task_blocked_on include/linux/sched.h:2180 [inline]
WARNING: CPU: 2 PID: 1 at ./include/linux/sched.h:2180 __ww_mutex_wound+0x23b/0x3e0 kernel/locking/ww_mutex.h:346
Modules linked in:
CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-syzkaller-10355-gf2d282e1dfb3 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:__clear_task_blocked_on include/linux/sched.h:2180 [inline]
RIP: 0010:__ww_mutex_wound+0x23b/0x3e0 kernel/locking/ww_mutex.h:346
Code: 00 00 00 00 fc ff df 48 89 ea 48 c1 ea 03 80 3c 02 00 0f 85 85 01 00 00 48 8b 81 78 0a 00 00 48 85 c0 74 09 48 39 c3 74 04 90 <0f> 0b 90 48 b8 00 00 00 00 00 fc ff df 48 89 ea 48 c1 ea 03 80 3c
RSP: 0000:ffffc90000046e58 EFLAGS: 00010002
RAX: ffff888026fa4048 RBX: ffff888027180068 RCX: ffff888022320000
RDX: 1ffff1100446414f RSI: ffffffff8ddf7d2d RDI: ffffffff8c15fb80
RBP: ffff888022320a78 R08: 0000000000000000 R09: ffffed1004e3000d
R10: ffff88802718006f R11: 0000000000000001 R12: ffffc90000adfa30
R13: 0000000000000001 R14: 0000000000000007 R15: ffffc90000046f50
FS:  0000000000000000(0000) GS:ffff8880d68fe000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000e380000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __ww_mutex_add_waiter kernel/locking/ww_mutex.h:574 [inline]
 __mutex_lock_common kernel/locking/mutex.c:638 [inline]
 __ww_mutex_lock.constprop.0+0x1a3e/0x3110 kernel/locking/mutex.c:767
 ww_mutex_lock+0x37/0x160 kernel/locking/mutex.c:885
 modeset_lock+0x4a0/0x6e0 drivers/gpu/drm/drm_modeset_lock.c:316
 drm_modeset_lock drivers/gpu/drm/drm_modeset_lock.c:398 [inline]
 drm_modeset_lock+0x59/0x90 drivers/gpu/drm/drm_modeset_lock.c:394
 drm_atomic_get_crtc_state+0x100/0x450 drivers/gpu/drm/drm_atomic.c:356
 drm_atomic_get_plane_state+0x436/0x590 drivers/gpu/drm/drm_atomic.c:561
 drm_client_modeset_commit_atomic+0x237/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1055
 drm_client_modeset_commit_locked+0x14d/0x580 drivers/gpu/drm/drm_client_modeset.c:1206
 pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1388 [inline]
 drm_fb_helper_pan_display+0x32d/0xa40 drivers/gpu/drm/drm_fb_helper.c:1448
 fb_pan_display+0x47c/0x7d0 drivers/video/fbdev/core/fbmem.c:193
 bit_update_start+0x49/0x1f0 drivers/video/fbdev/core/bitblit.c:380
 fbcon_switch+0xbf8/0x14c0 drivers/video/fbdev/core/fbcon.c:2193
 redraw_screen+0x2c1/0x760 drivers/tty/vt/vt.c:965
 con2fb_init_display drivers/video/fbdev/core/fbcon.c:829 [inline]
 set_con2fb_map+0x79b/0x1060 drivers/video/fbdev/core/fbcon.c:890
 do_fb_registered drivers/video/fbdev/core/fbcon.c:2999 [inline]
 fbcon_fb_registered+0x21d/0x6a0 drivers/video/fbdev/core/fbcon.c:3015
 do_register_framebuffer+0x500/0x870 drivers/video/fbdev/core/fbmem.c:509
 register_framebuffer+0x23/0x40 drivers/video/fbdev/core/fbmem.c:575
 __drm_fb_helper_initial_config_and_unlock+0xdb7/0x17b0 drivers/gpu/drm/drm_fb_helper.c:1852
 drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1917 [inline]
 drm_fb_helper_initial_config+0x44/0x60 drivers/gpu/drm/drm_fb_helper.c:1909
 drm_fbdev_client_hotplug+0x1a6/0x280 drivers/gpu/drm/clients/drm_fbdev_client.c:52
 drm_client_register+0x197/0x280 drivers/gpu/drm/drm_client.c:141
 drm_fbdev_client_setup+0x1bd/0x480 drivers/gpu/drm/clients/drm_fbdev_client.c:159
 drm_client_setup drivers/gpu/drm/clients/drm_client_setup.c:46 [inline]
 drm_client_setup+0x19f/0x240 drivers/gpu/drm/clients/drm_client_setup.c:35
 virtio_gpu_probe+0x29e/0x500 drivers/gpu/drm/virtio/virtgpu_drv.c:110
 virtio_dev_probe+0x69d/0xbe0 drivers/virtio/virtio.c:347
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
 __driver_attach+0x283/0x580 drivers/base/dd.c:1217
 bus_for_each_dev+0x13b/0x1d0 drivers/base/bus.c:370
 bus_add_driver+0x2e9/0x690 drivers/base/bus.c:678
 driver_register+0x15c/0x4b0 drivers/base/driver.c:249
 virtio_gpu_driver_init+0xa8/0x1b0 drivers/gpu/drm/virtio/virtgpu_drv.c:194
 do_one_initcall+0x120/0x6e0 init/main.c:1269
 do_initcall_level init/main.c:1331 [inline]
 do_initcalls init/main.c:1347 [inline]
 do_basic_setup init/main.c:1366 [inline]
 kernel_init_freeable+0x5c2/0x900 init/main.c:1579
 kernel_init+0x1c/0x2b0 init/main.c:1469
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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

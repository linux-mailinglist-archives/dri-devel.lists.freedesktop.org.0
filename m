Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB768464F0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 01:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9362110E8D8;
	Fri,  2 Feb 2024 00:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BAF10E8D8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 00:13:40 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-36387d42a2bso13162805ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 16:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706832820; x=1707437620;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/PnvQSHNDrcIgRtiFynMLpwWhhCzB+zZK6QHF3mqLA=;
 b=w8WJYlKArtfHttbUc8lBswWglKlU8R0D5jXw7CjPywWNXg04srWSHhVzCdWqCEzX73
 /QNwwQFSITtaJ9o5yldEXWLiKAac3dEiYFKLwF8vzqhPenQrtGvsMXyqBkbpcwUWLyYT
 +R8gZXgR3YHd8gxWXbkTDHzWqskcPkKqhBj6EQ/UH7uIcl79UVf+qHbMb0nWmPuJqdnt
 MNhRnTqWpr3QenaMuNXk+DIHtoLu6/gLGD+hNaa39I3+UKGG0eRa6/D4lHm5BJiGXoGK
 0n9Y7H02yRWwzQ/tNwOxzThh6hXHovFKqB5i8JpP/zypSUCCoYF6dNgYHwPY6EHzi7vZ
 bZZA==
X-Gm-Message-State: AOJu0YzT8VZ/92V9piJPRu0HkHBudqEARvRiBCJp4h/SQ2o/BuXNzUAW
 lQlcwKB7JOb8vE4JlS8QHETZXEKOT+v0qRljx7+/cc0ESrBzS0sthdvhQ60GEoSzHzojEPrSuB4
 LhnYf6cBWpkqM1HI5BYZWKjsMoqE3owVKeWE4l8gPqN9OTpDM9JudkB8=
X-Google-Smtp-Source: AGHT+IHXZ/12Vxw15AEPf8zwMz79r4Df40krbxQESHcBW1qoaUmBAN/JjVrfDiwPqGFb9NSKgp7tOd+hNMEIVdWeo5BsQg+ZMb8Q
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4c:b0:363:812d:d6a5 with SMTP id
 u12-20020a056e021a4c00b00363812dd6a5mr23298ilv.0.1706832820038; Thu, 01 Feb
 2024 16:13:40 -0800 (PST)
Date: Thu, 01 Feb 2024 16:13:40 -0800
In-Reply-To: <00000000000067322b05fdfa973f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000edf6a306105afb50@google.com>
Subject: Re: [syzbot] [dri?] WARNING in vkms_get_vblank_timestamp (2)
From: syzbot <syzbot+93bd128a383695391534@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net, 
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    6764c317b6bb Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12be3328180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c0ac5dfae6ecc58
dashboard link: https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12067e60180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=102774b7e80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/90c636d7609b/disk-6764c317.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9d76784c4adc/vmlinux-6764c317.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4fa116a29660/bzImage-6764c317.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+93bd128a383695391534@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 5107 at drivers/gpu/drm/vkms/vkms_crtc.c:103 vkms_get_vblank_timestamp+0x1dc/0x250 drivers/gpu/drm/vkms/vkms_crtc.c:103
Modules linked in:
CPU: 1 PID: 5107 Comm: syz-executor297 Not tainted 6.8.0-rc2-syzkaller-00055-g6764c317b6bb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
RIP: 0010:vkms_get_vblank_timestamp+0x1dc/0x250 drivers/gpu/drm/vkms/vkms_crtc.c:103
Code: 08 fc e8 a7 f4 f6 fb 4c 89 e1 48 ba 00 00 00 00 00 fc ff df 48 c1 e9 03 80 3c 11 00 75 67 49 89 04 24 eb c0 e8 c5 0f 08 fc 90 <0f> 0b 90 eb b5 e8 6a bf 61 fc e9 d8 fe ff ff e8 c0 bf 61 fc e9 6a
RSP: 0018:ffffc9000473f5d8 EFLAGS: 00010093
RAX: 0000000000000000 RBX: 0000001a34a6b1e9 RCX: ffffffff8584597f
RDX: ffff888023a30000 RSI: ffffffff858459fb RDI: 0000000000000006
RBP: ffff88801fab0000 R08: 0000000000000006 R09: 0000001a34a6b1e9
R10: 0000001a34a6b1e9 R11: 0000000000000004 R12: ffffc9000473f700
R13: 0000001a34a6b1e9 R14: 0000000000004e20 R15: ffffffff85845820
FS:  0000555555568380(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000240 CR3: 0000000022742000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 drm_crtc_get_last_vbltimestamp+0x106/0x1b0 drivers/gpu/drm/drm_vblank.c:867
 drm_get_last_vbltimestamp drivers/gpu/drm/drm_vblank.c:886 [inline]
 drm_update_vblank_count+0x1b1/0x9d0 drivers/gpu/drm/drm_vblank.c:298
 drm_crtc_accurate_vblank_count+0xc2/0x260 drivers/gpu/drm/drm_vblank.c:411
 drm_crtc_arm_vblank_event+0xfb/0x2b0 drivers/gpu/drm/drm_vblank.c:1097
 vkms_crtc_atomic_flush+0x10b/0x2b0 drivers/gpu/drm/vkms/vkms_crtc.c:258
 drm_atomic_helper_commit_planes+0x61f/0x1000 drivers/gpu/drm/drm_atomic_helper.c:2820
 vkms_atomic_commit_tail+0x5e/0x240 drivers/gpu/drm/vkms/vkms_drv.c:73
 commit_tail+0x287/0x410 drivers/gpu/drm/drm_atomic_helper.c:1832
 drm_atomic_helper_commit+0x2fd/0x380 drivers/gpu/drm/drm_atomic_helper.c:2072
 drm_atomic_commit+0x20e/0x2e0 drivers/gpu/drm/drm_atomic.c:1514
 drm_atomic_helper_set_config+0x141/0x1c0 drivers/gpu/drm/drm_atomic_helper.c:3271
 drm_mode_setcrtc+0xd0a/0x1690 drivers/gpu/drm/drm_crtc.c:886
 drm_ioctl_kernel+0x1ef/0x3e0 drivers/gpu/drm/drm_ioctl.c:744
 drm_ioctl+0x5d8/0xc00 drivers/gpu/drm/drm_ioctl.c:841
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x196/0x220 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd8/0x270 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x6f/0x77
RIP: 0033:0x7f0d5d4bdd89
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 71 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe26838708 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0d5d4bdd89
RDX: 0000000020000300 RSI: 00000000c06864a2 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000555555569610
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

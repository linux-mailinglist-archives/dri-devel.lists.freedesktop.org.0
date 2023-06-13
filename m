Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53AF72D82A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 05:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAB010E303;
	Tue, 13 Jun 2023 03:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com
 [209.85.166.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE0E10E303
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 03:40:08 +0000 (UTC)
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-33d232a2de4so50245025ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 20:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686627607; x=1689219607;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DXywynC1bxBtHFWAn2hw4894b5cewmcU8FEK5+mmR9c=;
 b=UlE9rPFZtf966Dr4zJ6sYcqXmPCCaTw6ZMski7SE3uy8c+icS/1p4eFh35wJ2Izox6
 WsMEaXYjO1i9G991eT3ld7fTWPjMN/dqVTqfH2GXCbqmud6CCxAwtdojxr+ERxEu7BKA
 qLx3vZeL5j/LjDx2pzDdR3o7cZlS8ur0wBcIJIbr1+yr3QUpWIlU8vyOWtH94ioynRdQ
 bJrQRYrSQXm5pHzvWwMQ40nBQ8j4mb3zx96aImyFbVjmtNOWkvsNQRx3tzL9NnxdzVro
 PqQSc0RcXHg192A1E6YDG9cqw6d51wj1cxoIAhGS5RrCX3Z3agPuYaOcwgxTioqlbnHb
 ol9Q==
X-Gm-Message-State: AC+VfDzPVbe1fzMsJ192reOdHuFZxV+k50Mg31vqLJ0njlHQ5NePF9kq
 PmDBfHad1Q5xPiGTxd07uUnswRlUc/7igNr5WsP1MlxCQmR9
X-Google-Smtp-Source: ACHHUZ6ZYAZTb7FLU+jJS4o6gOfL0/6Sb4KEhmxXmIjRPpf+s9NeaVLX37QwnXBL2wUMbWWmSxS0GGIKWwyJ1m/nLLs1EYk6i+6+
MIME-Version: 1.0
X-Received: by 2002:a92:c70b:0:b0:335:de72:23c7 with SMTP id
 a11-20020a92c70b000000b00335de7223c7mr4984643ilp.5.1686627607325; Mon, 12 Jun
 2023 20:40:07 -0700 (PDT)
Date: Mon, 12 Jun 2023 20:40:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000067322b05fdfa973f@google.com>
Subject: [syzbot] [dri?] WARNING in vkms_get_vblank_timestamp (2)
From: syzbot <syzbot+93bd128a383695391534@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, melissa.srw@gmail.com, 
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com
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

HEAD commit:    022ce8862dff Merge tag 'i2c-for-6.4-rc6' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10481853280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c980bfe8b399968
dashboard link: https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e269ece6e54d/disk-022ce886.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/06666cf01bd0/vmlinux-022ce886.xz
kernel image: https://storage.googleapis.com/syzbot-assets/07fc105d62a4/bzImage-022ce886.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+93bd128a383695391534@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 2682 at drivers/gpu/drm/vkms/vkms_crtc.c:103 vkms_get_vblank_timestamp+0x1cf/0x240 drivers/gpu/drm/vkms/vkms_crtc.c:103
Modules linked in:
CPU: 0 PID: 2682 Comm: syz-executor.0 Not tainted 6.4.0-rc5-syzkaller-00305-g022ce8862dff #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/25/2023
RIP: 0010:vkms_get_vblank_timestamp+0x1cf/0x240 drivers/gpu/drm/vkms/vkms_crtc.c:103
Code: 8d 70 fc e8 f3 97 60 fc 4c 89 e1 48 ba 00 00 00 00 00 fc ff df 48 c1 e9 03 80 3c 11 00 75 65 49 89 04 24 eb c4 e8 c1 8d 70 fc <0f> 0b eb bb e8 58 57 c3 fc e9 de fe ff ff e8 8e 57 c3 fc e9 78 fe
RSP: 0018:ffffc90015a47268 EFLAGS: 00010212
RAX: 0000000000003abb RBX: 000002914d969319 RCX: ffffc90003d42000
RDX: 0000000000040000 RSI: ffffffff8513b91f RDI: 0000000000000006
RBP: ffff88801e794000 R08: 0000000000000006 R09: 000002914d969319
R10: 000002914d969319 R11: 0000000000000000 R12: ffffc90015a473d0
R13: 000002914d969319 R14: 0000000000004e20 R15: ffffffff8513b750
FS:  00007f166b7c6700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd002c54fc0 CR3: 000000007a976000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_crtc_get_last_vbltimestamp+0x102/0x1a0 drivers/gpu/drm/drm_vblank.c:877
 drm_crtc_next_vblank_start+0x186/0x300 drivers/gpu/drm/drm_vblank.c:1012
 set_fence_deadline drivers/gpu/drm/drm_atomic_helper.c:1537 [inline]
 drm_atomic_helper_wait_for_fences+0x1f3/0x840 drivers/gpu/drm/drm_atomic_helper.c:1584
 drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:2013 [inline]
 drm_atomic_helper_commit+0x1bd/0x370 drivers/gpu/drm/drm_atomic_helper.c:1985
 drm_atomic_commit+0x20a/0x300 drivers/gpu/drm/drm_atomic.c:1503
 drm_client_modeset_commit_atomic+0x69b/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1045
 drm_client_modeset_commit_locked+0x149/0x580 drivers/gpu/drm/drm_client_modeset.c:1148
 pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1728 [inline]
 drm_fb_helper_pan_display+0x28f/0x970 drivers/gpu/drm/drm_fb_helper.c:1788
 fb_pan_display+0x2fb/0x6c0 drivers/video/fbdev/core/fbmem.c:924
 bit_update_start+0x49/0x1f0 drivers/video/fbdev/core/bitblit.c:390
 fbcon_switch+0xbcf/0x1380 drivers/video/fbdev/core/fbcon.c:2169
 redraw_screen+0x2bd/0x740 drivers/tty/vt/vt.c:970
 vc_do_resize+0xee5/0x1180 drivers/tty/vt/vt.c:1292
 fbcon_modechanged+0x32d/0x620 drivers/video/fbdev/core/fbcon.c:2693
 fbcon_update_vcs+0x3e/0x50 drivers/video/fbdev/core/fbcon.c:2749
 do_fb_ioctl+0x6e2/0x750 drivers/video/fbdev/core/fbmem.c:1127
 fb_ioctl+0xeb/0x150 drivers/video/fbdev/core/fbmem.c:1204
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f166aa8c169
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f166b7c6168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f166ababf80 RCX: 00007f166aa8c169
RDX: 0000000020000040 RSI: 0000000000004601 RDI: 0000000000000005
RBP: 00007f166aae7ca1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f166accfb1f R14: 00007f166b7c6300 R15: 0000000000022000
 </TASK>


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

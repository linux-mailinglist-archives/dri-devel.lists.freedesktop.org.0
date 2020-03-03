Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91E17711E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186F96EA15;
	Tue,  3 Mar 2020 08:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EBD6E4CA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:49:13 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id x2so1986724ila.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 23:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=ZGg9d9RlpkSp9tiCdOBj7hjE3h8DLuUCRNUsn/fFdXk=;
 b=Lc9J0jKz0zcTNVQ1Oo3jSUI8kQQGAlM6xwW2jvyXfFBFik9V7tWtQ5gB2oD4+VfMJ9
 iVEtrUJLkDe3bQicbmKHRYL2vfD6b9jUTYRV3aOJaUqovh/UO5udXK+w7PbhJXphRKCv
 XR6qmFoOpPFRF7yW3uKhFQA9v6BjtPd+31RFZlvHxIfdO0n1YU5ZjI+U0yowcSeu0rbo
 2Hxbi6Mp1buVCjn63PIJ8TXWE8ezs36cDzrzMMjr5lRwupxZ3Ieb3FGgq6GWKpOhZ++H
 8JPCtqqpTdv3hW5AtCEGcE4C3p+89ObzUAYGyZDOcez6P//LQDW+XDf3KWynU4vpHo7u
 0pEQ==
X-Gm-Message-State: ANhLgQ1slYtw9AlxitYjhHSlS1Vn08S53mGPiSJJ7oQc9QgnrjKpLoXh
 zKb443UUtyutsIrxhQFnMHY1jMx2ibewiCrlc9V3qvlTd1tl
X-Google-Smtp-Source: ADFU+vtq+Z0tEgLDgWc5E+/2DcRrLjUJQjPO+lwYFDXxBFzQQa9nltg2I6T05x3FDEkDFpd29Ba1cz1kElMF5vTpjV48wKj1xo52
MIME-Version: 1.0
X-Received: by 2002:a6b:2c0c:: with SMTP id s12mr2801014ios.91.1583221752863; 
 Mon, 02 Mar 2020 23:49:12 -0800 (PST)
Date: Mon, 02 Mar 2020 23:49:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002e20b9059fee8a94@google.com>
Subject: WARNING in idr_destroy
From: syzbot <syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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

syzbot found the following crash on:

HEAD commit:    63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10e978e3e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d2e033af114153f
dashboard link: https://syzkaller.appspot.com/bug?extid=05835159fe322770fe3d
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e978e3e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10b1a819e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dbc2c
R13: 00007fc6b3362d90 R14: 0000000000000004 R15: 000000000000002d
------------[ cut here ]------------
WARNING: CPU: 0 PID: 12260 at lib/radix-tree.c:682 radix_tree_free_nodes lib/radix-tree.c:682 [inline]
WARNING: CPU: 0 PID: 12260 at lib/radix-tree.c:682 idr_destroy+0x1ae/0x260 lib/radix-tree.c:1572
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12260 Comm: syz-executor386 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1fb/0x318 lib/dump_stack.c:118
 panic+0x264/0x7a9 kernel/panic.c:221
 __warn+0x209/0x210 kernel/panic.c:582
 report_bug+0x1b6/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:174 [inline]
 do_error_trap+0xcf/0x1c0 arch/x86/kernel/traps.c:267
 do_invalid_op+0x36/0x40 arch/x86/kernel/traps.c:286
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:radix_tree_free_nodes lib/radix-tree.c:682 [inline]
RIP: 0010:idr_destroy+0x1ae/0x260 lib/radix-tree.c:1572
Code: b5 63 f9 48 89 df 48 c7 c6 c0 0a 13 88 e8 6a ce 50 f9 4c 3b 65 b8 74 57 e8 cf b5 63 f9 4d 89 fc e9 67 ff ff ff e8 c2 b5 63 f9 <0f> 0b eb d5 89 f9 80 e1 07 38 c1 7c 84 e8 c0 de a0 f9 e9 7a ff ff
RSP: 0018:ffffc90005107ba0 EFLAGS: 00010293
RAX: ffffffff881363be RBX: ffff888087dba998 RCX: ffff888094062300
RDX: 0000000000000000 RSI: 0000000000000040 RDI: ffff888087dba988
RBP: ffffc90005107be8 R08: ffffffff88136330 R09: ffffed1012a78181
R10: ffffed1012a78181 R11: 0000000000000000 R12: ffff888087dba980
R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
 drm_mode_create_lease_ioctl+0x1347/0x1860 drivers/gpu/drm/drm_lease.c:583
 drm_ioctl_kernel+0x2cf/0x410 drivers/gpu/drm/drm_ioctl.c:786
 drm_ioctl+0x52f/0x890 drivers/gpu/drm/drm_ioctl.c:886
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl fs/ioctl.c:763 [inline]
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl+0x113/0x190 fs/ioctl.c:770
 __x64_sys_ioctl+0x7b/0x90 fs/ioctl.c:770
 do_syscall_64+0xf7/0x1c0 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x44a4b9
Code: e8 0c e8 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 9b cc fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fc6b3362d88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000006dbc28 RCX: 000000000044a4b9
RDX: 0000000020000040 RSI: ffffffffffffffc6 RDI: 0000000000000003
RBP: 00000000006dbc20 R08: 0000000000000001 R09: 0000000000000039
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dbc2c
R13: 00007fc6b3362d90 R14: 0000000000000004 R15: 000000000000002d
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

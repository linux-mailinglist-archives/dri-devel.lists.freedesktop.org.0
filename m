Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFD64717E3
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 03:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CF210E364;
	Sun, 12 Dec 2021 02:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA1D10E364
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 02:51:19 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 q6-20020a056e0220e600b002aacc181abaso574833ilv.13
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 18:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=uB5Jdsje4JN6M1/82VYRWHK18o4JcPhdNLA9XDBXTS4=;
 b=BGdslzLTsMGhXn4wmvPmmkiHAhCKpW6a9XmgVDB58CGeWuvjFWAztnVtptuV5L8gSF
 usoN8frfD5ZTXj6F3mxfCjL9cFlIf4cu7ztAtIndMoHdB+y8vv+9rWmbs5PMMCWaD2Me
 z52NG3LUVUGU5Cbcu4ytK3l+lvtXruqoLP2AM8laWN257Dq9XEuYpuVZss1LKNTsFQvR
 2nkCKb9/ZB6C1m4u+Ih67pXkcHK+g9fYIZcOxhkIh7UU6GkVdAWiw+IpwGPQAx4C3x9/
 t3aoEdCHVQWdn5rRFb/8jrVkW8NBfZ872VvIpoLMzqiS3fsOqvEotQN8Upt7DhJ/yz0D
 9zGg==
X-Gm-Message-State: AOAM530g4qotfGAKbRATGt/rElH9QO9P9WHJgCbnZVOciUOkStGKaNx0
 vR8piqObVnMAu5pSoO3winFAqwY3RTxaJsGDwWRbjWOk7SfY
X-Google-Smtp-Source: ABdhPJxwVJmREkFRx8hbIpmyUBRmzr8vDDhKa61kyixMsiLIW7QtNWbNcZTi8bY1XtwPT8W9uTzYBYkEugpP0bA1v2BnbIE7X9AL
MIME-Version: 1.0
X-Received: by 2002:a05:6638:d84:: with SMTP id
 l4mr25947896jaj.18.1639277478463; 
 Sat, 11 Dec 2021 18:51:18 -0800 (PST)
Date: Sat, 11 Dec 2021 18:51:18 -0800
In-Reply-To: <0000000000006438bb05c195a467@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cad06305d2ea0750@google.com>
Subject: Re: [syzbot] WARNING in drm_wait_one_vblank
From: syzbot <syzbot+6f7fe2dbc479dca0ed17@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    6f513529296f Merge tag 'for-5.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16499fc5b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=221ffc09e39ebbd1
dashboard link: https://syzkaller.appspot.com/bug?extid=6f7fe2dbc479dca0ed17
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ab646db00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17767fc5b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6f7fe2dbc479dca0ed17@syzkaller.appspotmail.com

platform vkms: vblank wait timed out on crtc 0
WARNING: CPU: 1 PID: 3708 at drivers/gpu/drm/drm_vblank.c:1269 drm_wait_one_vblank+0x2bc/0x500 drivers/gpu/drm/drm_vblank.c:1269
Modules linked in:

CPU: 1 PID: 3708 Comm: syz-executor955 Not tainted 5.16.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:drm_wait_one_vblank+0x2bc/0x500 drivers/gpu/drm/drm_vblank.c:1269
Code: 85 f6 0f 84 a3 01 00 00 e8 11 4c 1a fd 4c 89 ef e8 f9 34 13 00 44 89 e1 4c 89 f2 48 c7 c7 40 7d 1a 8a 48 89 c6 e8 7f 61 a3 04 <0f> 0b e9 87 fe ff ff e8 e8 4b 1a fd 31 ff 4c 89 ee e8 6e 4e 1a fd
RSP: 0018:ffffc9000298fb40 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000596 RCX: 0000000000000000
RDX: ffff8880766f3a00 RSI: ffffffff815f1e08 RDI: fffff52000531f5a
RBP: ffff8881469f4000 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff815ebbae R11: 0000000000000000 R12: 0000000000000000
R13: ffff888146e02010 R14: ffff888146cc7500 R15: ffff888146e10030
FS:  00005555572d9300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa33cdb0290 CR3: 0000000079034000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_fb_helper_ioctl+0x159/0x1a0 drivers/gpu/drm/drm_fb_helper.c:1197
 do_fb_ioctl+0x1d5/0x690 drivers/video/fbdev/core/fbmem.c:1175
 fb_ioctl+0xe7/0x150 drivers/video/fbdev/core/fbmem.c:1189
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fa33cd3c1c9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc7e8b9d98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000000f4240 RCX: 00007fa33cd3c1c9
RDX: 0000000000000000 RSI: 0000000040044620 RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000016e91
R13: 00007ffc7e8b9dac R14: 00007ffc7e8b9dd0 R15: 00007ffc7e8b9dc0
 </TASK>


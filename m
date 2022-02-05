Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C53F4AB739
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575D910E206;
	Mon,  7 Feb 2022 09:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA9810E133
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 20:18:24 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 n20-20020a6bed14000000b0060faa0aefd3so6011060iog.20
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Feb 2022 12:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=//IpWN0Kyb3zdaJDZWQVUdBv0C1amCkj+8BKi6AK2E8=;
 b=SIkLatNToronl7nRXANijuVWYGg+TFsvqE3b20yeT9nEy2aMlAcMKqYbA+WprxZhKj
 UJ70XOvFdfLSj9NImdJDtAIFzhXaw9EYJ25PtkYUa/4qklHfwV1CM7lrR1IIFy7IICT8
 XlQUiE9wwAn+gJPQ0pGzI6a8dWiC+GqvdsB76NnBd73L1YAyovAK6haD1p/N8M8QIKyJ
 aYNnIj2zw4tpd5efSlGqUPcKReqgN5w8t4ileF/00zu7KWy6JV+4rOlqhj3GV2yZmt2j
 zvZtaIVxyF0eAvobvLveqpqmP6v6vMGXugauHtqr9Dhvtj77xyYo/51REsr9upSKgGq6
 uRIA==
X-Gm-Message-State: AOAM531a2EsFzGCkxolgINZ95LsxBSYvJMD9Nut3KVK1V8gw+cCaiani
 K6LszUGf6u3QYMsjBDZH+4fSyjK3olwW0htBI6JHjgG/D7Tn
X-Google-Smtp-Source: ABdhPJzhnyzMxtbaHXNJiT1k74YVxhCWjxXPME4lFoT8tI7K+SyNyfciNozxXMu79sQ46O/u0++E7iSm/HIuYe/CYp/FV8FIddR+
MIME-Version: 1.0
X-Received: by 2002:a05:6638:389a:: with SMTP id
 b26mr2580834jav.158.1644092303434; 
 Sat, 05 Feb 2022 12:18:23 -0800 (PST)
Date: Sat, 05 Feb 2022 12:18:23 -0800
In-Reply-To: <000000000000f0196305d219b2fe@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b968f305d74b1195@google.com>
Subject: Re: [syzbot] WARNING in __dma_map_sg_attrs
From: syzbot <syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, hch@lst.de, 
 iommu@lists.linux-foundation.org, linaro-mm-sig-owner@lists.linaro.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, m.szyprowski@samsung.com, robin.murphy@arm.com, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 07 Feb 2022 09:09:20 +0000
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

HEAD commit:    0457e5153e0e Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11b2637c700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f043113811433a5
dashboard link: https://syzkaller.appspot.com/bug?extid=10e27961f4da37c443b2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c65542700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1163f480700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 3595 at kernel/dma/mapping.c:188 __dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Modules linked in:
CPU: 0 PID: 3595 Comm: syz-executor249 Not tainted 5.17.0-rc2-syzkaller-00316-g0457e5153e0e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Code: 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c 10 00 75 71 4c 8b 3d c0 83 b5 0d e9 db fe ff ff e8 b6 0f 13 00 0f 0b e8 af 0f 13 00 <0f> 0b 45 31 e4 e9 54 ff ff ff e8 a0 0f 13 00 49 8d 7f 50 48 b8 00
RSP: 0018:ffffc90002a07d68 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88807e25e2c0 RSI: ffffffff81649e91 RDI: ffff88801b848408
RBP: ffff88801b848000 R08: 0000000000000002 R09: ffff88801d86c74f
R10: ffffffff81649d72 R11: 0000000000000001 R12: 0000000000000002
R13: ffff88801d86c680 R14: 0000000000000001 R15: 0000000000000000
FS:  0000555556e30300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200000cc CR3: 000000001d74a000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dma_map_sgtable+0x70/0xf0 kernel/dma/mapping.c:264
 get_sg_table.isra.0+0xe0/0x160 drivers/dma-buf/udmabuf.c:72
 begin_cpu_udmabuf+0x130/0x1d0 drivers/dma-buf/udmabuf.c:126
 dma_buf_begin_cpu_access+0xfd/0x1d0 drivers/dma-buf/dma-buf.c:1164
 dma_buf_ioctl+0x259/0x2b0 drivers/dma-buf/dma-buf.c:363
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f62fcf530f9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe3edab9b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f62fcf530f9
RDX: 0000000020000200 RSI: 0000000040086200 RDI: 0000000000000006
RBP: 00007f62fcf170e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f62fcf17170
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8507B495BC6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 09:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D219410E971;
	Fri, 21 Jan 2022 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13AC10E6D7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 12:18:21 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e15-20020a92de4f000000b002b930c4d727so3557266ilr.20
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 04:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=pQ7xOOQh9MziPMJQrqKb5S9rgs/wOTuUDyObBUnxmus=;
 b=M2VHWAm6AUMRPxZULaoTzrTALaxGvweX2I5c20c26VRPd+iefvMLEMW5DxmNcuRTmp
 TykcUBzO3+X4diKP8kOds/YfvLeXY8fx21XPHSr6z9g7+ywQtKxG5Ar0gbH04zTNAJ1N
 F3q6ipMThtDi/TPVtsWpdmhoZlrwYRxdSHn2radTa6cyA8xzIMTENtNN0Bx82oK/FKXC
 Td7ekt+Fig01qYISl35AljDBTqdBykEYXTYJCWQablOAnXKZZY9ZqQ3WNsldTn240mBb
 fVXWTOva+FdSAcp2SO90O0855XTAmt3x9JzwSq9UORtECDF4GiZSTL60dS81bE+bgDLa
 ec/g==
X-Gm-Message-State: AOAM530170ewW6w82Ae4ir+jvfMcST7TsVox0pxe1/hRDkGxY+whqFr6
 PmAFUQEOXeeB5Dtl2yMR1gYO6KKGO8XqB664R5Uw/3lk8ot5
X-Google-Smtp-Source: ABdhPJyFSM+FQhDMgiEsmaKTyyPQkdeI8y3gWaSaHdlrQgiAR/BLbYR+YC6wicyEQrtYgOmIPmX72dUHO262qpUvDWnByCqzIo7k
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3450:: with SMTP id
 q16mr14470241jav.311.1642681101166; 
 Thu, 20 Jan 2022 04:18:21 -0800 (PST)
Date: Thu, 20 Jan 2022 04:18:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000083ab5e05d6027f02@google.com>
Subject: [syzbot] WARNING in dma_map_sgtable
From: syzbot <syzbot+d03b64357793677f0080@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, hch@lst.de, 
 iommu@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 m.szyprowski@samsung.com, robin.murphy@arm.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Jan 2022 08:20:39 +0000
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

HEAD commit:    e3a8b6a1e70c Merge tag 'slab-for-5.17-part2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1507e01fb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=73c17fd2d4a060fe
dashboard link: https://syzkaller.appspot.com/bug?extid=d03b64357793677f0080
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d03b64357793677f0080@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 21150 at kernel/dma/mapping.c:188 __dma_map_sg_attrs kernel/dma/mapping.c:188 [inline]
WARNING: CPU: 1 PID: 21150 at kernel/dma/mapping.c:188 dma_map_sgtable+0x203/0x260 kernel/dma/mapping.c:264
Modules linked in:
CPU: 1 PID: 21150 Comm: syz-executor.5 Not tainted 5.16.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__dma_map_sg_attrs kernel/dma/mapping.c:188 [inline]
RIP: 0010:dma_map_sgtable+0x203/0x260 kernel/dma/mapping.c:264
Code: 75 15 e8 50 b2 13 00 eb cb e8 49 b2 13 00 eb c4 e8 42 b2 13 00 eb bd e8 3b b2 13 00 0f 0b bd fb ff ff ff eb af e8 2d b2 13 00 <0f> 0b 31 ed 48 bb 00 00 00 00 00 fc ff df e9 7b ff ff ff 89 e9 80
RSP: 0018:ffffc9000969fd20 EFLAGS: 00010287
RAX: ffffffff8171ee13 RBX: dffffc0000000000 RCX: 0000000000040000
RDX: ffffc900056f9000 RSI: 000000000000079b RDI: 000000000000079c
RBP: ffff888147437408 R08: ffffffff8171ece3 R09: ffffed100d4e6956
R10: ffffed100d4e6956 R11: 0000000000000000 R12: ffff888147437000
R13: ffff88806a734aa0 R14: 0000000000000000 R15: 0000000000000002
FS:  00007f009bbc7700(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055555641b108 CR3: 000000001901b000 CR4: 00000000003506e0
DR0: 0000000020000100 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600
Call Trace:
 <TASK>
 get_sg_table+0xfc/0x150 drivers/dma-buf/udmabuf.c:72
 begin_cpu_udmabuf+0xf5/0x160 drivers/dma-buf/udmabuf.c:126
 dma_buf_begin_cpu_access+0xd8/0x170 drivers/dma-buf/dma-buf.c:1164
 dma_buf_ioctl+0x2a0/0x2f0 drivers/dma-buf/dma-buf.c:363
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl+0xfb/0x170 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x44/0xd0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f009d251fe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f009bbc7168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f009d364f60 RCX: 00007f009d251fe9
RDX: 0000000020000040 RSI: 0000000040086200 RDI: 000000000000000b
RBP: 00007f009d2ac08d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc7751fd4f R14: 00007f009bbc7300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

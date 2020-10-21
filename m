Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9F29592C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572266F527;
	Thu, 22 Oct 2020 07:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB826F4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 19:03:20 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id e65so2287519iof.18
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 12:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=UZ+enrykDZn0RBAehZWXA0bKtfaNR6wmh3gkDAdQ0qU=;
 b=F+aFxwWjELtnXl1FmliICrFHZWFBA/o2cnte8OZQesMh3ItWxa5S3MUwky/0qrbq57
 O8ghfxnwc/QKsLEe1k/R43PUAQznPI1W1wFS74ORmrS+JtLhbkE+r8F8V4LGE6BRcOao
 4ytAl0myB+OUKpd6f+whwWnD+7ntYxF0MkSXFhjHkehgn5wpDelcfAywgPi5iQkXshKO
 pOqhZEyaf4t7h2xZdmCKuRgvyc8Ou1IoMovWxQA+0zr8zpGgUMuz0tlcCs6uTH+7jQno
 EXjtetyDOivuphp25EpQT2cM22bkskSyTQiSry3vS72K+OC748kgj95DrMCU+F6r3OJo
 W6Vg==
X-Gm-Message-State: AOAM532RyCDFVd0vxmpJvFQWSVZ6ONCabNkpf4eAn+r8jF4x3LL1OxEW
 PV758vc/LLj3kNvaamUocSlt4ssxRYkfNffSCoWBJvoDjNrX
X-Google-Smtp-Source: ABdhPJz2DS8buf571WovUNMKHuSLSF76DGgezNV/agArJmCbhllMoFPN7q2PFS7kA5XVwafLNLZkSOV+4eJYXHkyl2WL1jnLWRkI
MIME-Version: 1.0
X-Received: by 2002:a02:8661:: with SMTP id e88mr4055127jai.43.1603306999991; 
 Wed, 21 Oct 2020 12:03:19 -0700 (PDT)
Date: Wed, 21 Oct 2020 12:03:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000335adc05b23300f6@google.com>
Subject: WARNING in dma_map_page_attrs
From: syzbot <syzbot+34dc2fea3478e659af01@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, hch@lst.de, 
 iommu@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 m.szyprowski@samsung.com, robin.murphy@arm.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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

HEAD commit:    c4d6fe73 Merge tag 'xarray-5.9' of git://git.infradead.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14862ff0500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d790573d3e379c4
dashboard link: https://syzkaller.appspot.com/bug?extid=34dc2fea3478e659af01
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+34dc2fea3478e659af01@syzkaller.appspotmail.com

infiniband syz1: set active
infiniband syz1: added vcan0
------------[ cut here ]------------
WARNING: CPU: 1 PID: 9851 at kernel/dma/mapping.c:149 dma_map_page_attrs+0x493/0x700 kernel/dma/mapping.c:149
Modules linked in:
CPU: 1 PID: 9851 Comm: syz-executor.1 Not tainted 5.9.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:dma_map_page_attrs+0x493/0x700 kernel/dma/mapping.c:149
Code: 80 3c 10 00 0f 85 ed 01 00 00 48 8b 1d 36 c3 fa 0c e9 2d fc ff ff 48 89 c3 e9 d1 fd ff ff e8 04 12 12 00 0f 0b e8 fd 11 12 00 <0f> 0b 49 c7 c4 ff ff ff ff e9 d5 fd ff ff e8 ea 11 12 00 48 8d 7b
RSP: 0018:ffffc90001546c68 EFLAGS: 00010246
RAX: 0000000000040000 RBX: ffffffff894d0040 RCX: ffffc9000dbe4000
RDX: 0000000000040000 RSI: ffffffff815d3b03 RDI: ffff88806a988b00
RBP: ffff8880236cc400 R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000000 R12: ffffea00008db300
R13: ffff88806a9886e8 R14: 00000000000004b8 R15: 0000000000000002
FS:  00007f678fae2700(0000) GS:ffff88802ce00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f299a39b190 CR3: 0000000069f31000 CR4: 0000000000350ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 dma_map_single_attrs include/linux/dma-mapping.h:279 [inline]
 ib_dma_map_single include/rdma/ib_verbs.h:3967 [inline]
 ib_mad_post_receive_mads+0x23f/0xd60 drivers/infiniband/core/mad.c:2715
 ib_mad_port_start drivers/infiniband/core/mad.c:2862 [inline]
 ib_mad_port_open drivers/infiniband/core/mad.c:3016 [inline]
 ib_mad_init_device+0x72b/0x1400 drivers/infiniband/core/mad.c:3092
 add_client_context+0x405/0x5e0 drivers/infiniband/core/device.c:680
 enable_device_and_get+0x1d5/0x3c0 drivers/infiniband/core/device.c:1301
 ib_register_device drivers/infiniband/core/device.c:1376 [inline]
 ib_register_device+0x7a7/0xa40 drivers/infiniband/core/device.c:1335
 rxe_register_device+0x46d/0x570 drivers/infiniband/sw/rxe/rxe_verbs.c:1182
 rxe_add+0x12fe/0x16d0 drivers/infiniband/sw/rxe/rxe.c:247
 rxe_net_add+0x8c/0xe0 drivers/infiniband/sw/rxe/rxe_net.c:507
 rxe_newlink drivers/infiniband/sw/rxe/rxe.c:269 [inline]
 rxe_newlink+0xb7/0xe0 drivers/infiniband/sw/rxe/rxe.c:250
 nldev_newlink+0x30e/0x540 drivers/infiniband/core/nldev.c:1555
 rdma_nl_rcv_msg+0x367/0x690 drivers/infiniband/core/netlink.c:195
 rdma_nl_rcv_skb drivers/infiniband/core/netlink.c:239 [inline]
 rdma_nl_rcv+0x2f2/0x440 drivers/infiniband/core/netlink.c:259
 netlink_unicast_kernel net/netlink/af_netlink.c:1304 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1330
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec net/socket.c:651 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:671
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2353
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2407
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2440
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45d9f9
Code: bd b1 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 8b b1 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f678fae1c88 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 000000000071f480 RCX: 000000000045d9f9
RDX: 0000000000000000 RSI: 0000000020000200 RDI: 0000000000000003
RBP: 00000000004aab13 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000075bf00
R13: 00007ffc6f9b8bbf R14: 00007f678fac2000 R15: 0000000000000003


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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9889D760
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD0010E62F;
	Tue,  9 Apr 2024 10:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ai+3/8Ko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9221B10FA34
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 09:15:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a51c37a5025so320857666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712654147; x=1713258947; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uC5MBK9pYcx6MJb1uZ3WvKJ1p/bCIAlzCE806xxtHIs=;
 b=Ai+3/8KoAqQxeDdgR/xpIbQ6e/kYEfVr7/zotRqODtMJae/BADhURHohYG0IrdGExI
 oCZalv0xsclNZ/8LAAmUKCK0jswC6ljaCpSmuI6xf2KvjGzJmHbj+MPrv9cpscbPUIKv
 q0vn9cC3/0gahijuK7lPgQrLcbIbhxUgthhaA6hNaBVw4J3OdaP87OepjIPw7HouSobK
 nxdlJl/jMCneeQxqbkMExVGSa8EBzZn5AZ6dUZKiXL+oZIR5Eq8sgSZ4kT7Wck1n8m3I
 jz4cGtipepM7x74A+nYHG1XWvkOmDJtVv7V5xh1O60CgSk3fsgIRfB2iaTU2+ZuvzON1
 /npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712654147; x=1713258947;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uC5MBK9pYcx6MJb1uZ3WvKJ1p/bCIAlzCE806xxtHIs=;
 b=OGBuJgF8EA1RB5N02bC9UNL5xoLQKPmovZUlfbXWDAzQ7aIigDaemmF8W88E7b5xde
 NlxiVgcGhDoH2dG0+eAMwm6+wnvOGeAjiWmQeGj0e0d2AKgntUV4TWpWsNn3Qb4SgbZl
 HHQZ0XyPQFLroBBfUQ6ECJV7i/P96I6g9sAZJNXpVRN6ywLQTXCkbFvWrc23Z3Ys9heQ
 hRpeXUucWSJ5Z0hcJbXo0eAbRXpVNc0z/GOnz+xp8YHNcxfZzBQKr91zYnPj9guHrVvQ
 4qH+AfY6cWsUEk+dKtxJX3aJfrFBGn/nOPhmKHjao3JLzLPSTSgwtnxKt7Gz0o9bj0YA
 mJng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7UG6T1sXIP8oD8iLNtSbHSIfcUAHvRzfO1+9GUyad40PNBIVm8Ak0AfiKR9YSDHk4naD5+ZSQZ8+8zaQ0qEha0u6dcBXZMCyfYk6cD4/3
X-Gm-Message-State: AOJu0YwSFHn03XoPeAAuKR4WV2NJowhwgscNGyvV2VOTJUtI6hSVh4/9
 ww/y4Kd+k47MxR+t5pUil5Yx+T3ZMQu+IO8/Scb9ivE6RKhGROUPT5KKbUo4FAlxvsfvf04TJfZ
 8U2wA8DwgdsQTgjgf9eNrs8sfz3k=
X-Google-Smtp-Source: AGHT+IF/Rv+ThPnDz5UILPZSdMxfkMhkOmO5H2OnwfyNJLi9nsrAR29m7yO2G8Y6VWhsJdkGRMrvoV/aZFO3F3U57o8=
X-Received: by 2002:a17:907:728e:b0:a51:d136:affb with SMTP id
 dt14-20020a170907728e00b00a51d136affbmr5282552ejc.40.1712654147295; Tue, 09
 Apr 2024 02:15:47 -0700 (PDT)
MIME-Version: 1.0
From: Sam Sun <samsun1006219@gmail.com>
Date: Tue, 9 Apr 2024 17:15:35 +0800
Message-ID: <CAEkJfYONxEew-9-KsXG_=C-Qx5j=27CB43JEPhiLaGrXenLHpA@mail.gmail.com>
Subject: [Linux kernel bug] general protection fault in udmabuf_create
To: linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 christian.koenig@amd.com, sumit.semwal@linaro.org, kraxel@redhat.com
Cc: syzkaller-bugs@googlegroups.com, xrivendell7@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 09 Apr 2024 10:57:50 +0000
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

Dear developers and maintainers,

We encountered a general protection fault in udmabuf_create. It is
tested on latest upstream linux (6.9-rc3). The kernel log is listed
below.
```
general protection fault, probably for non-canonical address
0xdffffc0000000003: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 0 PID: 8122 Comm: syz-executor422 Not tainted 6.7.0-rc7 #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
RIP: 0010:udmabuf_create+0x220/0xe60 drivers/dma-buf/udmabuf.c:217
Code: 83 c5 18 44 89 e7 e8 cf 73 04 fc 45 39 fc 0f 84 fe 00 00 00 e8
21 78 04 fc 48 89 e8 48 b9 00 00 00 00 00 fc ff df 48 c1 e8 03 <80> 3c
08 00 0f 85 d6 08 00 00 48 8b 5d 00 31 ff 81 e3 ff 0f 00 00
RSP: 0018:ffffc90002a2fca8 EFLAGS: 00010206
RAX: 0000000000000003 RBX: dffffc0000000000 RCX: dffffc0000000000
RDX: ffff8881074a4980 RSI: ffffffff85809cef RDI: 0000000000000005
RBP: 0000000000000018 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: ffffffff8a80008b R12: 0000000000000000
R13: 0000000000004000 R14: ffff8880162ec380 R15: 0000000080000000
FS:  0000555556e1b3c0(0000) GS:ffff888063a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000000 CR3: 000000001b7ab000 CR4: 0000000000750ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <TASK>
 udmabuf_ioctl_create_list drivers/dma-buf/udmabuf.c:328 [inline]
 udmabuf_ioctl+0x26d/0x2c0 drivers/dma-buf/udmabuf.c:343
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x19d/0x210 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x40/0x110 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b
RIP: 0033:0x7fd8fab06b4d
Code: 28 c3 e8 46 1e 00 00 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffb972c428 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fffb972c628 RCX: 00007fd8fab06b4d
RDX: 0000000020000000 RSI: 0000000040087543 RDI: 0000000000000003
RBP: 0000000000000001 R08: 0074696d696c5f74 R09: 00007fffb972c628
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000001
R13: 00007fffb972c618 R14: 00007fd8fab84530 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:udmabuf_create+0x220/0xe60 drivers/dma-buf/udmabuf.c:217
Code: 83 c5 18 44 89 e7 e8 cf 73 04 fc 45 39 fc 0f 84 fe 00 00 00 e8
21 78 04 fc 48 89 e8 48 b9 00 00 00 00 00 fc ff df 48 c1 e8 03 <80> 3c
08 00 0f 85 d6 08 00 00 48 8b 5d 00 31 ff 81 e3 ff 0f 00 00
RSP: 0018:ffffc90002a2fca8 EFLAGS: 00010206
RAX: 0000000000000003 RBX: dffffc0000000000 RCX: dffffc0000000000
RDX: ffff8881074a4980 RSI: ffffffff85809cef RDI: 0000000000000005
RBP: 0000000000000018 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: ffffffff8a80008b R12: 0000000000000000
R13: 0000000000004000 R14: ffff8880162ec380 R15: 0000000080000000
FS:  0000555556e1b3c0(0000) GS:ffff888063a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000000 CR3: 000000001b7ab000 CR4: 0000000000750ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
----------------
Code disassembly (best guess):
   0:    83 c5 18                 add    $0x18,%ebp
   3:    44 89 e7                 mov    %r12d,%edi
   6:    e8 cf 73 04 fc           call   0xfc0473da
   b:    45 39 fc                 cmp    %r15d,%r12d
   e:    0f 84 fe 00 00 00        je     0x112
  14:    e8 21 78 04 fc           call   0xfc04783a
  19:    48 89 e8                 mov    %rbp,%rax
  1c:    48 b9 00 00 00 00 00     movabs $0xdffffc0000000000,%rcx
  23:    fc ff df
  26:    48 c1 e8 03              shr    $0x3,%rax
* 2a:    80 3c 08 00              cmpb   $0x0,(%rax,%rcx,1) <--
trapping instruction
  2e:    0f 85 d6 08 00 00        jne    0x90a
  34:    48 8b 5d 00              mov    0x0(%rbp),%rbx
  38:    31 ff                    xor    %edi,%edi
  3a:    81 e3 ff 0f 00 00        and    $0xfff,%ebx
```
We analyzed the root cause of this bug. In function
udmabuf_ioctl_create_list, line 321, if list_limit is lower than 0,
list_limit will be converted to uint before comparison. This would
cause head.count to be an arbitrary large number, and the lsize
therefore will become 0 because of overflow, causing the return value
of memdup_user changed to 0x10.
One possible fix could be change list_limit from int type to uint,
since the limit should never be below 0.
If you have any questions, please contact us.
Reported by: Yue Sun <samsun1006219@gmail.com>
Reported by: xingwei lee <xrivendell7@gmail.com>

Best Regards,
Yue

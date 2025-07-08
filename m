Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C628AFCFCC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 17:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E437310E6A3;
	Tue,  8 Jul 2025 15:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gzgG4Tmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440F310E0CE;
 Tue,  8 Jul 2025 13:52:21 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b3508961d43so3459351a12.3; 
 Tue, 08 Jul 2025 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751982741; x=1752587541; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CK6vEbbhNAxWWV4SV3M70K2QlHYmbtzjgbxyw0MIuUw=;
 b=gzgG4TmuXQroqfuIoBDNvBGDdjc4b43U6/i+NAqTGtBpqifJhDq9sCESGbcmyxD0pB
 5n46QHgj+85HFdxtHhzZoMq4U1PKCD9YoPQ5Y2EczX4H1juSS+O1TbJRVk6FaeS7uup8
 0rlu0mXBjVZTyY2kTxB2mBoaqxU6+OYpmJ+RRqtbgldK+DBWmDLTNGXwdwdd3Wny+zNa
 ptjnCMs6lpglQin48/4V3kVFjquESxsaoZn7bJ4ZFNW12lhP20ILD2tscH796kYYXmvr
 d4LmpcMzxD7dlGA5RmWqB26j+HcRhDkggHJYV9icMBU2rO4gS8fa/3wjzhLr+te+MUa2
 tvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751982741; x=1752587541;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CK6vEbbhNAxWWV4SV3M70K2QlHYmbtzjgbxyw0MIuUw=;
 b=Sp0Lq4N8HIeLosrrcoHBS7NYNwfgXi0w1vQqfPMOjRkdE8kmTXs/qB1F5qesEpGNYq
 oKFqolX0/E6rwVl3YwCwgySFjQ+/yjENLxjUvqF6xQYHAP85jSWEDJFNZGW3fGUcRRjx
 HJE+s8M7SidNcYaVazPCy0KwRWWYaPGuMcz+hwU4ZgfTCfgWyuxS5bDhq6lCTarI/1/F
 xw+r/JcXrnYTaCnCbIeLnzl3HOBfOJyMgBzMaLI3NKo0umBWweRZZrRhSnZ7GYJs2cSc
 JFzx1peXzqX8B6gyENDh5oOLxHA4a5vEeGHuI57t9LrCyj0qwcdFxYKVAJORFQ4TQKxk
 D40g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoRu3baZht3fR8RuY0YuAC3F/kPsGrr1VL73S8drm6Dc8GFSl/VQyV8ODSn8j2pjXaIwwIPMGU6Qw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcl7QBO1JXkW+XNpe40GssiqzaPGX9fneraUp0p/YjZMjhYOWU
 IIZhtaCVKw+bGQcR0CXnPL8D8ebvnyxtFklhy8+DdK0ptrWEf+RhneEaNm0t70jZSQr7xa9tTzz
 HK/Yf6IZf6PBuhADy3/6IFuoxycdBrA==
X-Gm-Gg: ASbGncvAzGHJB4EhaKwQrBx0n8KG2seHgvlnXU5vscpPN+XPONZeW4ozvyb5E4d64Y7
 F5kjSf7VDF9RDvs+gUgrQJtB5KulYvV3kFxqF5heeQqQSkcjwxL81gCIYK2kzpoqvLfm3rZLf8+
 WKdqxvtr8lHNBnxiPt3IvlVkaE51MsZK5CGkhGhOeE82IXrczcZQwbX8vpAHQJ3MRWYqNuOr8Gd
 wY=
X-Google-Smtp-Source: AGHT+IEj/5jlgWc/fPP+L/dBTh5sWN0KcsabhNA8vdKTnbYNXYtORk5vIGYAxU+RZlKNXRRvcGl+wgDuh43UBUt/1jg=
X-Received: by 2002:a05:6a21:4612:b0:220:3024:3d05 with SMTP id
 adf61e73a8af0-22b1bc58967mr5520920637.16.1751982740094; Tue, 08 Jul 2025
 06:52:20 -0700 (PDT)
MIME-Version: 1.0
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Tue, 8 Jul 2025 14:52:07 +0100
X-Gm-Features: Ac12FXzyNW8BWW8z8GMQ4lxKVdUEJ3JWNIQeGt5xGVXNZl53U0W63dhY5K6m2H4
Message-ID: <CALjTZvZgH0N43rMTcZiDVSX93PFL680hsYPwtp8=Ja1OWPvZ1A@mail.gmail.com>
Subject: [REGRESSION] NVIDIA ION graphics broken with Linux 6.16-rc*
To: bskeggs@nvidia.com, airlied@gmail.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Jul 2025 15:54:34 +0000
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

Hi,


The machine (Atom 330 CPU, ION chipset, GeForce 9400M graphics) works,
but graphics are dead. Dmesg shows the following (Linux 6.16-rc5):

[   34.408331] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   34.408351] #PF: supervisor instruction fetch in kernel mode
[   34.408358] #PF: error_code(0x0010) - not-present page
[   34.408364] PGD 0 P4D 0
[   34.408373] Oops: Oops: 0010 [#1] SMP
[   34.408383] CPU: 2 UID: 0 PID: 583 Comm: Xorg Not tainted
6.16.0-rc5-dbg+ #187 PREEMPTLAZY
[   34.408393] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./To be filled by O.E.M., BIOS 080015  08/13/2009
[   34.408399] RIP: 0010:0x0
[   34.408414] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   34.408420] RSP: 0018:ffff88800378bc08 EFLAGS: 00010202
[   34.408428] RAX: ffffffff82071c60 RBX: ffff888008e6f000 RCX: 0000000000000978
[   34.408434] RDX: 0000000000000020 RSI: 0000000000000002 RDI: ffff888008e6f000
[   34.408440] RBP: ffff88800378bd18 R08: 0000000000000000 R09: 00000000000003ff
[   34.408445] R10: 0000000000000000 R11: ffff88800378bcc0 R12: ffff88800378bdb8
[   34.408451] R13: ffff888007dad9c0 R14: ffff888004285680 R15: ffff888007e671c0
[   34.408457] FS:  00007f2cc7b2eb00(0000) GS:ffff888149ecf000(0000)
knlGS:0000000000000000
[   34.408464] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   34.408469] CR2: ffffffffffffffd6 CR3: 0000000008a08000 CR4: 00000000000006f0
[   34.408475] Call Trace:
[   34.408482]  <TASK>
[   34.408486]  nouveau_gem_ioctl_pushbuf+0x10d8/0x1240
[   34.408504]  ? nouveau_gem_ioctl_new+0x160/0x160
[   34.408513]  drm_ioctl_kernel+0x7a/0xe0
[   34.408524]  drm_ioctl+0x1ef/0x490
[   34.408532]  ? nouveau_gem_ioctl_new+0x160/0x160
[   34.408541]  ? __handle_mm_fault+0xff2/0x1510
[   34.408552]  nouveau_drm_ioctl+0x50/0xa0
[   34.408560]  __x64_sys_ioctl+0x4be/0xa90
[   34.408570]  ? handle_mm_fault+0xb5/0x1a0
[   34.408578]  ? lock_mm_and_find_vma+0x34/0x170
[   34.408587]  do_syscall_64+0x51/0x1d0
[   34.408596]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   34.408605] RIP: 0033:0x7f2cc7d2f9dd
[   34.408612] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
00 00
[   34.408620] RSP: 002b:00007fff6a501ee0 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   34.408628] RAX: ffffffffffffffda RBX: 000055c7792b3f78 RCX: 00007f2cc7d2f9dd
[   34.408634] RDX: 00007fff6a501fa0 RSI: 00000000c0406481 RDI: 0000000000000011
[   34.408640] RBP: 00007fff6a501f30 R08: 0000000000000978 R09: 000055c7792af740
[   34.408645] R10: 0000000000000002 R11: 0000000000000246 R12: 00007fff6a501fa0
[   34.408651] R13: 00000000c0406481 R14: 0000000000000011 R15: 000055c7792ac700
[   34.408660]  </TASK>
[   34.408664] Modules linked in:
[   34.408671] CR2: 0000000000000000
[   34.408678] ---[ end trace 0000000000000000 ]---
[   34.408682] RIP: 0010:0x0
[   34.408691] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   34.408696] RSP: 0018:ffff88800378bc08 EFLAGS: 00010202
[   34.408703] RAX: ffffffff82071c60 RBX: ffff888008e6f000 RCX: 0000000000000978
[   34.408709] RDX: 0000000000000020 RSI: 0000000000000002 RDI: ffff888008e6f000
[   34.408715] RBP: ffff88800378bd18 R08: 0000000000000000 R09: 00000000000003ff
[   34.408720] R10: 0000000000000000 R11: ffff88800378bcc0 R12: ffff88800378bdb8
[   34.408726] R13: ffff888007dad9c0 R14: ffff888004285680 R15: ffff888007e671c0
[   34.408731] FS:  00007f2cc7b2eb00(0000) GS:ffff888149ecf000(0000)
knlGS:0000000000000000
[   34.408738] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   34.408743] CR2: ffffffffffffffd6 CR3: 0000000008a08000 CR4: 00000000000006f0
[   34.408750] note: Xorg[583] exited with irqs disabled

Unfortunately, bisecting is not feasible for me.


Best regards,

Rui

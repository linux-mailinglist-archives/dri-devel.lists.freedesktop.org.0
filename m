Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAF790A2FD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 06:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBB210E16E;
	Mon, 17 Jun 2024 04:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N3PmzqrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E7E10E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 04:05:22 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a6269885572so862766966b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 21:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718597121; x=1719201921; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wnHs+ttpIhxBtZZDEGrGjnsJJbPUFcnFdNuNGHL5qFw=;
 b=N3PmzqrSr4IrfGVflaEObGRf3A5AMf2Q2AaVB+gSsEkrdrcqaBu6Uw4YkaZWU6wOYN
 JC4aiQAH5qxSqhVwgFzk6cgsujKFqQGsfSYKHBt6ODi47Tya5AXzpzVaJIgSHK8mJkI4
 2aWYOda6gZWsMw8Lcf6iy/E9aMY0UNTb1TeoUkd/8AjDHI/hO0hF/gz9ZZckHKL33mv6
 DU2rp95XWqVeVXxGp1CX2i3l1aR343ZBIXkNGVd1bKvtcPMK9IdEGvRNbngyCh/WAVHS
 gSuMWjLBHgejUbS+SPaRt3RVBT6dOnDX0lDxrfGTVOTtFRTXIlNOJX+WmGGcO7hBBSFI
 RBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718597121; x=1719201921;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wnHs+ttpIhxBtZZDEGrGjnsJJbPUFcnFdNuNGHL5qFw=;
 b=iXkeOvxpeqyY06bOJigHCnWUVOK40Ne/Vt6JMfrmcv4V1CE9eNx9VlGY+oAzCw2OT+
 pU8DGbosobfAmN3lFjvKXTbPzRqh5j8cB7UHzhZfeA+H7Z0p/ZM1OV+8QL7Bzq9ysW4O
 GeKBZ/UDBBsY8Ffjp0RoWyr8W+AxUl9Hm0ZFeOilS2pmy3yDAqn702DGVDNa2tac2ZRg
 O8En0dGhxv0X5ZVGim2ejHf9fOBz9ROzryqri83U7emzVA9DtPvH3qtNQRQ29D64Sl7E
 a+qHX1yMS9I8QhrgHpnOKo4i5faml8/XG94/vchYW8ckwssHHdGzm99Skhs6V1Y0npaJ
 LU/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCk8pIXQpEqZ0d9KWcgBlaeD2L1u66exMlQWnvnmCL0wDFJChtG7qCtRyEQTYxrRXQABz5UhJDeBHtUhuCGhgTppquNW++S6+U4BEpfQpT
X-Gm-Message-State: AOJu0YyHOHO5tHXi/n1w7Q9kqlR+WR+Z6eMUh0dohxCOqS7c3zjBLiXx
 DgZhbS2cgWLZ7fRyrTDgalRerQJ2rQmVreI0RGDIFx5ifF/4t6NqIIlvRRj0KnEJRM1z6bvMXh+
 rrw43zXU50RSIVUFovk8DyWTgQo0=
X-Google-Smtp-Source: AGHT+IEbT+on5FURdXp9jqDXHPmoqNjT/fKeJA2db5/Rid6w7kFKR+PSWZE9DAWlIUEk1wOU9yIsBWQ/EiUsdc6bUlc=
X-Received: by 2002:a17:907:774e:b0:a6f:7902:7516 with SMTP id
 a640c23a62f3a-a6f790276a5mr300248466b.14.1718597120793; Sun, 16 Jun 2024
 21:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <5534c03a-4b8a-4ebc-aff9-2e66c7ba59d8.bugreport@ubisectech.com>
In-Reply-To: <5534c03a-4b8a-4ebc-aff9-2e66c7ba59d8.bugreport@ubisectech.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 17 Jun 2024 14:05:09 +1000
Message-ID: <CAPM=9twiDQ0Yv8p-oWWWZnnFViMiN79U6VGSC-wisSE-oYOEqg@mail.gmail.com>
Subject: Re: WARNING in drm_mode_create_lease_ioctl
To: Ubisectech Sirius <bugreport@ubisectech.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 mripard <mripard@kernel.org>, 
 tzimmermann <tzimmermann@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>
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

Cc'ing dri-devel

Does https://lore.kernel.org/dri-devel/20240617035258.2774032-1-airlied@gmail.com/T/#u
help?

Thanks,

Dave.

On Mon, 17 Jun 2024 at 13:12, Ubisectech Sirius
<bugreport@ubisectech.com> wrote:
>
> Hello.
> We are Ubisectech Sirius Team, the vulnerability lab of China ValiantSec. Recently, our team has discovered a issue in Linux kernel 6.8.  Attached to the email were a PoC file of the issue.
>
> Stack dump:
>
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 18929 at mm/page_alloc.c:4545 __alloc_pages+0x402/0x21b0 mm/page_alloc.c:4545
> Modules linked in:
> CPU: 1 PID: 18929 Comm: syz-executor.3 Not tainted 6.8.0 #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> RIP: 0010:__alloc_pages+0x402/0x21b0 mm/page_alloc.c:4545
> Code: ff 00 0f 84 15 fe ff ff 80 ce 01 e9 0d fe ff ff 83 fe 0a 0f 86 0e fd ff ff 80 3d c7 cf 6a 0d 00 75 0b c6 05 be cf 6a 0d 01 90 <0f> 0b 90 45 31 e4 e9 87 fe ff ff e8 5e 3e 9b ff 84 c0 0f 85 7a fe
> RSP: 0018:ffffc90001cc7808 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 1ffff92000398f14
> RDX: 0000000000000001 RSI: 000000000000000b RDI: 0000000000040dc0
> RBP: ffffc90001cc7ab8 R08: 0000000000000007 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 00000000007a1200
> R13: 000000000000000b R14: 0000000000040dc0 R15: 000000000000000b
> FS:  00007f1717ba5640(0000) GS:ffff88807ec00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000203d0000 CR3: 000000001f5c0000 CR4: 0000000000750ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  __alloc_pages_node include/linux/gfp.h:238 [inline]
>  alloc_pages_node include/linux/gfp.h:261 [inline]
>  __kmalloc_large_node+0x88/0x1a0 mm/slub.c:3926
>  __do_kmalloc_node mm/slub.c:3969 [inline]
>  __kmalloc+0x370/0x480 mm/slub.c:3994
>  kmalloc_array include/linux/slab.h:627 [inline]
>  kcalloc include/linux/slab.h:658 [inline]
>  fill_object_idr drivers/gpu/drm/drm_lease.c:389 [inline]
>  drm_mode_create_lease_ioctl+0x4ca/0x1f70 drivers/gpu/drm/drm_lease.c:522
>  drm_ioctl_kernel+0x1eb/0x3f0 drivers/gpu/drm/drm_ioctl.c:744
>  drm_ioctl+0x582/0xb70 drivers/gpu/drm/drm_ioctl.c:841
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:871 [inline]
>  __se_sys_ioctl fs/ioctl.c:857 [inline]
>  __x64_sys_ioctl+0x1a1/0x210 fs/ioctl.c:857
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xd5/0x270 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x6f/0x77
> RIP: 0033:0x7f1716e8eeed
> Code: c3 e8 97 2b 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f1717ba5028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f1716fe3f80 RCX: 00007f1716e8eeed
> RDX: 00000000200003c0 RSI: 00000000c01864c6 RDI: 0000000000000003
> RBP: 00007f1716f13014 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 000000000000000b R14: 00007f1716fe3f80 R15: 00007f1717b85000
>  </TASK>
>
>
> Thank you for taking the time to read this email and we look forward to working with you further.
>
>
>
>
>
>
>
>
>
>

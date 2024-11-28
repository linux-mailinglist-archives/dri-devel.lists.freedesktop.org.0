Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B220B9DBE25
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 00:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB4710E28B;
	Thu, 28 Nov 2024 23:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bS7ztBOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E6F10E28B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 23:37:58 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-84197b4e61aso44256539f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 15:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732837077; x=1733441877; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NJCMa7tKa0uFcQ65x0468JETd0q7S65/CjhWDkizItM=;
 b=bS7ztBOXQcEo3yDdMNtXHrcK6YZHo68EoWBP/lHMZMyWDU/g8+Sao8MkzzdX2J7Etf
 Csjxf103Hn7zZoTEqa6z+BGQWkithQrMCvY4+yTwsTMZWYY04QzA5NQKJ4og0NMcMFOU
 T7t1nu1ziRHflnrKiaYeUy6NTmVs9HqlGncBIrVFxMQQcKqVC2QaY9Z8JMH9UT2o88y4
 iAMBzE23Q//DEiLX01BvJ5dVRyH7tbxiMtWpx25W5KWXJIQ3VisqFHCIdqFaIhLJo1Xu
 rMIhEQRb0U2SJwvnAvb5SbNtkFfjlbWk9Vr7W/7uWrS0/w4jpInpAZal7oUoaPn1INEv
 DwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732837077; x=1733441877;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJCMa7tKa0uFcQ65x0468JETd0q7S65/CjhWDkizItM=;
 b=c8ycDI2i0k9zVx2zKlVWiOJDvKiKmeCxFi23xsREX/jwuN/NR/yqeLOZ7Vj7HXQwGb
 rSjGaG5oT156PGELKt5CcUayL/jXSRrHJeRBoFk5RsYYFYOcn5oHQH7gkx+zq7DsOBr3
 OY8l75lwPufKMRbJH6L1yy2aFKYgBYNBTmrhuwhUo6mSbXvC5/tIODcohAuv2RyNopCR
 tEeaueb8L9VxVVBD+akptNQ/AZmxH+bBla6XlDS/jlxeMQ1MkAkr2i6GCjcGbexf0c+T
 0WkU6hQdo9jM0Yjcos6zeQ7y8qT+Wgpn4KhisieezjqRcmPT9gEJIiGybxKuzHSe4VY/
 hrkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN9kL355U1t4e776lmOqWYgeQNEdzcW8DG46BMkgRS2zJwAAfbS7Aosj9LoEGfkM09rfGcwa/onIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdGds26mUVhGkNldtq94SHVzT6YA86KDcwGnTtc4glxlej9JXu
 s5RvnB1KcVeKnTfm0w0mWupH7VOYhZIfEyBpnB4IN8iDHg756dEPlPX50My1xDo4CJJOVdNNJlw
 I814KQqQNqtmsL7nkuEaIa81bMRM=
X-Gm-Gg: ASbGncuQczZ7f1/t0qtHYecTmS7LtZqze+m3vk7BC+wObgPqbUlLAz+qSnuOeGSyiQH
 MQ1/Ie/0AABa/K7TppBgJjLf1ULI=
X-Google-Smtp-Source: AGHT+IEym6VufnsEFmGGY6mV4HeLxRrI7XmFVemY7ubFIGa3fauIVUcwMnIYcwpP3G/BtvM2BxbN846qevVBu+g3JPs=
X-Received: by 2002:a05:6602:3f81:b0:843:e9a6:fd1 with SMTP id
 ca18e2360f4ac-843ece831cdmr909589739f.1.1732837077632; Thu, 28 Nov 2024
 15:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
 <da4288a6-96cc-4095-bd73-d66b68e9ed01@suse.de>
In-Reply-To: <da4288a6-96cc-4095-bd73-d66b68e9ed01@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Thu, 28 Nov 2024 23:37:46 +0000
Message-ID: <CAEXMXLQw1yqUGbWcrKZdOuGvA4eZMG0utiyQ2PVRvTeuFedGbA@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
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

> Here's a first attempt to address this bug. Could you please apply the
> attached patch and report on the results? It should work against the
> upcoming v6.13-rc1 or against a recent drm-misc-next.

Hi. No luck yet.

I collected crashes before the patch:

BUG: Bad page map in process husband  pte:60000001b46fcb pmd:800000002736403
page: refcount:1 mapcount:-1 mapping:000000005cb4182c index:0x6 pfn:0x1b46
aops:0xffff8000807722e0 ino:15 dentry name(?):"fb0"
flags: 0x14(referenced|dirty|zone=0)
raw: 0000000000000014 dead000000000100 dead000000000122 ffff0000018cf348
raw: 0000000000000006 0000000000000000 00000001fffffffe 0000000000000000
page dumped because: bad pte
addr:0000ffff87b4e000 vm_flags:040400fb anon_vma:0000000000000000
mapping:ffff0000018cf348 index:6
file:fb0 fault:fb_deferred_io_fault mmap:fb_mmap read_folio:0x0
CPU: 2 UID: 0 PID: 313 Comm: husband Not tainted 6.12.0 #1
Hardware name: Raspberry Pi Compute Module 3 Rev 1.0 (DT)
Call trace:
 show_stack+0x18/0x30 (C)
 dump_stack_lvl+0x60/0x80
 dump_stack+0x18/0x24
 print_bad_pte+0x174/0x1d0
 unmap_page_range+0x47c/0xc90
 unmap_vmas+0xa4/0x100
 exit_mmap+0xbc/0x2c0
 mmput+0x70/0x190
 do_exit+0x248/0x8f0
 do_group_exit+0x34/0x90
 get_signal+0x834/0x860
 do_signal+0xf4/0x330
 do_notify_resume+0xc0/0x140
 el0_svc+0xb8/0xd0
 el0t_64_sync_handler+0x10c/0x140
 el0t_64_sync+0x198/0x19c
Disabling lock debugging due to kernel taint

And after the patch:

lk_smartMem abort info:
 /tmp/0c  ESR = 0x0000000096000044
8081f6-1  EC = 0x25: DABT (current EL), IL = 32 bits
165-4fd2  SET = 0, FnV = 0
-5e4e03b  EA = 0, S1PTW = 0
e-57fa8e  FSC = 0x04: level 0 translation fault
22.dmp
Data abort info:
  ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
  CM = 0, WnR = 1, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[ffbf801f8e7bf010] address between user and kernel address ranges
Internal error: Oops: 0000000096000044 [#1] SMP
CPU: 1 UID: 0 PID: 260 Comm: husband Not tainted 6.12.0 #1
Hardware name: Raspberry Pi Compute Module 3 Rev 1.0 (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : tlb_remove_table+0xc8/0x1c0
lr : tlb_remove_table+0xc0/0x1c0
sp : ffff80008117b9d0
x29: ffff80008117b9d0 x28: ffff80008117bb98 x27: 0000aaaad1df8000
x26: 0000aaaad1df7fff x25: ffff0000044f4468 x24: 00000000ffffffdb
x23: fffffdffc008f2c0 x22: ffff8000808a1860 x21: 0000aaaad1c00000
x20: fffffdffc008f2c0 x19: ffff80008117bb98 x18: ffff80008117bb50
x17: ffffffffffffffff x16: 0000000000000000 x15: ffff8000807b62a8
x14: 0000ffffb7640fff x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000037b6f
x8 : ffff80008094a0e7 x7 : 0000000000000800 x6 : 0000000000000000
x5 : 0000000000000801 x4 : dead000000000122 x3 : 0000000000000000
x2 : 0000020040000000 x1 : ffff000000000000 x0 : ffbf801f8e7bf000
Call trace:
 tlb_remove_table+0xc8/0x1c0 (P)
 tlb_remove_table+0xc0/0x1c0 (L)
 free_pgd_range+0x228/0x5d0
 free_pgtables+0x1c4/0x270
 exit_mmap+0x130/0x2c0
 mmput+0x70/0x190
 do_exit+0x248/0x8f0
 do_group_exit+0x34/0x90
 get_signal+0x834/0x860
 do_signal+0x118/0x330
 do_notify_resume+0xc0/0x140
 el0_svc+0xb8/0xd0
 el0t_64_sync_handler+0x10c/0x140
 el0t_64_sync+0x198/0x19c
Code: 52850000 94006fdd f9000660 b4000080 (b900101f)
---[ end trace 0000000000000000 ]---
Fixing recursive fault but reboot is needed!
Unable to handle kernel NULL pointer dereference at virtual address
0000000000000008
Mem abort info:
  ESR = 0x0000000096000044
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
  CM = 0, WnR = 1, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000000238c000
[0000000000000008] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000044 [#2] SMP
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G      D            6.12.0 #1
Tainted: [D]=DIE
Hardware name: Raspberry Pi Compute Module 3 Rev 1.0 (DT)
pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : free_unref_page_commit+0x70/0x2c0
lr : free_unref_page+0x17c/0x400
sp : ffff800080003da0
x29: ffff800080003da0 x28: 0000000000000000 x27: 0000000000000000
x26: 0000000000000000 x25: ffff00003e39e0b8 x24: 0000000000000000
x23: 0000000000000000 x22: 00000000ffffffff x21: ffff00003e39efc0
x20: 0000000000000000 x19: ffff800080add340 x18: ffff800081163c40
x17: ffff7fffbda55000 x16: ffff800080000000 x15: 0000000000001900
x14: 00000f423fffe700 x13: 0000000000000000 x12: ffff00003e39efc0
x11: 0000000000000001 x10: 0000000000000001 x9 : ffff7fffbda55000
x8 : fffffdffc00e81c8 x7 : ffff00003e39efe0 x6 : 0000000000000020
x5 : ffff00003e39efc0 x4 : 00000000ffffffff x3 : 0000000000000000
x2 : fffffdffc00e81c0 x1 : 0000000000000000 x0 : ffff800080add340
Call trace:
 free_unref_page_commit+0x70/0x2c0 (P)
 free_unref_page+0x17c/0x400 (L)
 free_unref_page+0x17c/0x400
 __folio_put+0x50/0xb0
 tlb_remove_table_rcu+0xb0/0xc0
 rcu_core+0x1f4/0x520
 rcu_core_si+0x10/0x20
 handle_softirqs+0xf4/0x230
 __do_softirq+0x14/0x20
 ____do_softirq+0x10/0x20
 call_on_irq_stack+0x24/0x54
 do_softirq_own_stack+0x1c/0x30
 __irq_exit_rcu+0xc8/0x100
 irq_exit_rcu+0x10/0x20
 el1_interrupt+0x38/0x60
 el1h_64_irq_handler+0x18/0x30
 el1h_64_irq+0x6c/0x70
 default_idle_call+0x28/0x3c (P)
 default_idle_call+0x24/0x3c (L)
 do_idle+0x9c/0xf0
 cpu_startup_entry+0x34/0x40
 rest_init+0xb8/0xc0
 do_one_initcall+0x0/0x16c
 __primary_switched+0x88/0x90
Code: 8b2ac0e7 f8296827 8b0600a7 f9401181 (f9000428)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops: Fatal exception in interrupt
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x000,00000c00,00800000,0200420b
Memory Limit: none
---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---

Thanks,
Nuno

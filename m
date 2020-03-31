Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00DA19963A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 14:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2C56E30D;
	Tue, 31 Mar 2020 12:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2126E30D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 12:18:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200331121832euoutp029d0d4601ae4c386b03ec2aee2da273e1~BYr4VDb6M1189911899euoutp02H
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 12:18:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200331121832euoutp029d0d4601ae4c386b03ec2aee2da273e1~BYr4VDb6M1189911899euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585657112;
 bh=sITh5M73Oid1pRARXQD6dlROJi3f7AUL1m+J0rWFxrU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=fM+ozUS750csREyS94FyoOrosFpG4GexLHXzn/mOsVX1Llw4oWh7SOBiIPRvjAX2i
 Zr/qwekjSpvsHsqY3fSifd4MrFF1BNX3du97PDks2y3x730ea6RxvMKBrxaJWcbsRL
 RLVxrJs1RiDoig+w2N0mZskOQKo7gjh8eI+E/DIo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200331121832eucas1p2ee57390e9db1e95bd4d9d12998442763~BYr4EYKsv1165411654eucas1p2E;
 Tue, 31 Mar 2020 12:18:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 80.41.61286.715338E5; Tue, 31
 Mar 2020 13:18:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200331121831eucas1p19211647f7cbc6862348fdaad01b3d8c6~BYr3qhiPW2289522895eucas1p1I;
 Tue, 31 Mar 2020 12:18:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331121831eusmtrp1dbce4c19285be74e3c8fec2d02bd6118~BYr3pyJm32530225302eusmtrp1a;
 Tue, 31 Mar 2020 12:18:31 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-e4-5e833517ca3f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C1.EF.08375.715338E5; Tue, 31
 Mar 2020 13:18:31 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200331121830eusmtip11d6105dcc1cbd04f863534975d18d13d~BYr2--vkg2274922749eusmtip1F;
 Tue, 31 Mar 2020 12:18:30 +0000 (GMT)
Subject: Re: INFO: trying to register non-static key in try_to_wake_up
To: Dmitry Vyukov <dvyukov@google.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <7641fb29-20ec-0963-d04c-bfbf49fd3ebc@samsung.com>
Date: Tue, 31 Mar 2020 14:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bqBCqDPQZ1Nk8G+8y2vu8aaT2S54J4UqRPaFNUcusbYw@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUgUcRTH+83MjuOxMq7GPlSMFhKU8iijwUIMJAYJVEi6yFpzUMuLXbWU
 qLXMW/EoRbGy1fIIzdbbIsWi9cA1T7yzNKnUrPWWklxHyf8+733f9/feF34ULhoXmFOBIeGc
 LEQaJCENiNoPa5pD4qP3fBwGXjgzC5UbJNO3NE8y6Z/j9JjsV2KmNe2XgOltzCeZnuYCjFGn
 NmNM53whyQxWP8KZKtVDnFmtnBS4GrEr99MItkAVwb7JaCPZqhJbVlWWSLI/NRo99lOyGmPn
 3/aTbO6cNbugsmJbYxcFnoYXDE74cUGBkZzM3uWKQUBvaRcZti65uVE8gClQlVUS0qeAdoLU
 2mQ8CRlQIroEQW5//3axiKD7YwXBFwsIBtSz2I5lYXka44ViBMNjnSRfzCFQ3lXo6aZM6VPw
 ZLZpy2FGW0PMTMrWEE5P4bCqHUI6gaSdISO+bIuFtAuoZ7o2zRRF0AcgbcxW195LnwPtxDsB
 P2ICbblThI71aS9Y7laQOsZpMQxPPcF43gd1c/lbGYCOoWA9UUvyZ7vBSHs6wbMp/FBX6/Fs
 CR1ZKQRvqEDwN+HbtrsOQXHWxrb7OIxq1knddThtAy8b7XUI9EkoHPXk0RgG50z4G4whszYH
 59tCSIgT8W9YQ+XzSnJna1JDKZ6OJHm7kuXtSpO3K03e/7UFiChDYi5CHuzPyR1DuBt2cmmw
 PCLE3+5qaLAKbf66jg21th4t9fi2IJpCEiPhRH+Mj0ggjZRHBbcgoHCJmZD0UPiIhH7SqGhO
 FnpZFhHEyVuQBUVIxMIjyu+XRLS/NJy7znFhnGxHxSh9cwXCHJxN4M+t6kVvJeP6ZWnMnaUU
 a7c97Eoazgx573nm5XQ4syjw/PjrO00OT5VhodfcnY/1rYyNlu5nasPiW0JjbYoUgadHGi62
 J2rbvs67ZZc35dboe/pm+lo8GKaMlQfLNUX53r8fx2VPZ72PVtQIUicnDH2mneK7gkwse3Lq
 z0oIeYDU0RaXyaX/AHzTsBpxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsVy+t/xu7rips1xBnf+yFl83vCPzeLK1/ds
 FhMetrFbTNsobnGi7wOrxeVdc9gsLh1YwGRxvPcAk8XZ94vZLG5smctssXnTVGaLHxseszrw
 eHxv7WPxWLCp1GPPxJNsHptXaHlsWtXJ5vHu3Dl2j/vdx5k83u+7yuYx862ax+dNch4nWr6w
 BnBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GVc
 XnmereCXUsW/5deYGhg3y3UxcnJICJhIfP72jKmLkYtDSGApo0TfnNdADgdQQkbi+PoyiBph
 iT/Xutggal4zSvz5uZAFJCEs4CYx/81+JhBbREBNovF1D1gRs8AzZokbS59AdXQzSfTPfswG
 UsUmYCUxsX0VI4jNK2Ancfz1eXaQbSwCqhJ9d7VAwqICERKHd8yCKhGUODnzCdgyToFAiW8X
 G8DGMAuoS/yZd4kZwhaXuPVkPhOELS+x/e0c5gmMQrOQtM9C0jILScssJC0LGFlWMYqklhbn
 pucWG+oVJ+YWl+al6yXn525iBMb2tmM/N+9gvLQx+BCjAAejEg/vg6uNcUKsiWXFlbmHGCU4
 mJVEeNn8G+KEeFMSK6tSi/Lji0pzUosPMZoC/TaRWUo0OR+YdvJK4g1NDc0tLA3Njc2NzSyU
 xHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTBWTBHe+vhzt83PWXMcRa5u+6y4av4HqzYu75rQ
 9V5nt6+TLZe4s+ZAjXXlI58nu5wztb9USYWJnNl1r6dI+cQ9oQuVsj83Wdy9sOicqvQT1svv
 k5ZXq+RmCv/j7FkTuePJUZHYZecD4wUf1V9RUW0pa2Gzclmz1+ODj/2VvaFd2+2v8BntS7dQ
 YinOSDTUYi4qTgQAw9bZxQMDAAA=
X-CMS-MailID: 20200331121831eucas1p19211647f7cbc6862348fdaad01b3d8c6
X-Msg-Generator: CA
X-RootMTR: 20200331101907eucas1p1ce5d3f7c49c2c724c4e85f5c19c7108d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200331101907eucas1p1ce5d3f7c49c2c724c4e85f5c19c7108d
References: <000000000000ec257905a21f7415@google.com>
 <20200331095737.GO20730@hirez.programming.kicks-ass.net>
 <CGME20200331101907eucas1p1ce5d3f7c49c2c724c4e85f5c19c7108d@eucas1p1.samsung.com>
 <CACT4Y+bqBCqDPQZ1Nk8G+8y2vu8aaT2S54J4UqRPaFNUcusbYw@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 syzbot <syzbot+e84d7ebd1361da13c356@syzkaller.appspotmail.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/31/20 12:18 PM, Dmitry Vyukov wrote:
> On Tue, Mar 31, 2020 at 11:57 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> On Mon, Mar 30, 2020 at 10:01:12PM -0700, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following crash on:
>>>
>>> HEAD commit:    9420e8ad Merge tag 'for-linus' of git://git.kernel.org/pub..
>>> git tree:       upstream
>>> console output: https://protect2.fireeye.com/url?k=0756a78d-5a9a6c49-07572cc2-0cc47a314e9a-e4dc8b657d340686&u=https://syzkaller.appspot.com/x/log.txt?x=1206ed4be00000
>>> kernel config:  https://protect2.fireeye.com/url?k=43211072-1eeddbb6-43209b3d-0cc47a314e9a-3bd45a19932c37c8&u=https://syzkaller.appspot.com/x/.config?x=27392dd2975fd692
>>> dashboard link: https://protect2.fireeye.com/url?k=bf7a6153-e2b6aa97-bf7bea1c-0cc47a314e9a-c64073ee605efb7b&u=https://syzkaller.appspot.com/bug?extid=e84d7ebd1361da13c356
>>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>>>
>>> Unfortunately, I don't have any reproducer for this crash yet.
>>>
>>> IMPORTANT: if you fix the bug, please add the following tag to the commit:
>>> Reported-by: syzbot+e84d7ebd1361da13c356@syzkaller.appspotmail.com
>>>
>>> INFO: trying to register non-static key.
>>> the code is fine but needs lockdep annotation.
>>> turning off the locking correctness validator.
>>> CPU: 1 PID: 1014 Comm: syz-executor.0 Not tainted 5.6.0-rc7-syzkaller #0
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>>> Call Trace:
>>>  <IRQ>
>>>  __dump_stack lib/dump_stack.c:77 [inline]
>>>  dump_stack+0x188/0x20d lib/dump_stack.c:118
>>>  assign_lock_key kernel/locking/lockdep.c:880 [inline]
>>>  register_lock_class+0x14c4/0x1540 kernel/locking/lockdep.c:1189
>>>  __lock_acquire+0xfc/0x3ca0 kernel/locking/lockdep.c:3836
>>>  lock_acquire+0x197/0x420 kernel/locking/lockdep.c:4484
>>>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>>>  _raw_spin_lock_irqsave+0x8c/0xbf kernel/locking/spinlock.c:159
>>>  try_to_wake_up+0x9f/0x17c0 kernel/sched/core.c:2547
>>
>> That's p->pi_lock, which gets initialized in rt_mutex_init_task() in
>> copy_process(). This should be impossible. Very odd.
> 
> The stack mentions fbdev, which is a red flag at the moment. There are
> a dozen of bad bugs in fbdev and around. Just few days ago Andy
> pointed to another "impossible" crash "general protection fault in
> do_syscall_64" which is related to dri:
> https://protect2.fireeye.com/url?k=0cb8ad06-517466c2-0cb92649-0cc47a314e9a-a20c11191483c65b&u=https://syzkaller.appspot.com/bug?id=0ec7b2602b1ff40f0d34f38baa4ba1640727c3d9
> https://protect2.fireeye.com/url?k=614292e3-3c8e5927-614319ac-0cc47a314e9a-aeda6d72c01a7b0e&u=https://groups.google.com/forum/#!msg/syzkaller-bugs/ePqhfYx0-8M/Q_Urt97iAAAJ
> 
> There are probably more random manifestations of these bugs already,
> and I guess we will be getting more.
> 
> +fbdev maintainers

Thank you for the report.

fbdev is in the maintenance mode and no new features or drivers are
being added so syzbot reports are not for a new bugs (regressions) and
are not a priority (at least to me).

I have only resources to review/merge pending fbdev patches from time
to time so any help in fixing these syzbot reports is welcomed (there
have been a few fbdev related syzbot reports recently).

Also please note that fbdev is maintained through drm-misc tree so
patches can also be handled by other drm-misc maintainers in case I'm
not available / busy with other things.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>>>  wake_up_worker kernel/workqueue.c:836 [inline]
>>>  insert_work+0x2ad/0x3a0 kernel/workqueue.c:1337
>>>  __queue_work+0x50d/0x1280 kernel/workqueue.c:1488
>>>  call_timer_fn+0x195/0x760 kernel/time/timer.c:1404
>>>  expire_timers kernel/time/timer.c:1444 [inline]
>>>  __run_timers kernel/time/timer.c:1773 [inline]
>>>  __run_timers kernel/time/timer.c:1740 [inline]
>>>  run_timer_softirq+0x412/0x1600 kernel/time/timer.c:1786
>>>  __do_softirq+0x26c/0x99d kernel/softirq.c:292
>>>  invoke_softirq kernel/softirq.c:373 [inline]
>>>  irq_exit+0x192/0x1d0 kernel/softirq.c:413
>>>  exiting_irq arch/x86/include/asm/apic.h:546 [inline]
>>>  smp_apic_timer_interrupt+0x19e/0x600 arch/x86/kernel/apic/apic.c:1146
>>>  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
>>>  </IRQ>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

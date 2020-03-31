Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF901996A8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 14:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64C56E2F8;
	Tue, 31 Mar 2020 12:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB7E6E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 12:38:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200331123852euoutp02c96012cfbcf6cbd362a83a1b8a3064fc~BY9o1-6W82461324613euoutp02k
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 12:38:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200331123852euoutp02c96012cfbcf6cbd362a83a1b8a3064fc~BY9o1-6W82461324613euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585658332;
 bh=rNdXJS4MXW8cNtTZCbFCCyOmpxjR6tPPz+p+Bu2NCQw=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=mUZM78IWR68F/3xYdGNVtm7875M7FpuQhUFfFkrHZpzFSZb21PT+eNg3fs1L47bUV
 uVnPuaOhO/ALTC6mKm3dDLf93/tq0AoWWRFGz+6omI4Ir303SPjiLM+KpfhYG5CXSd
 /y/av5DBDsG5RvU10CVy6zbdtt5Gc8/XrTWsKdAU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200331123852eucas1p28dbd582ee95cdd6897b89101d80166f9~BY9omftse1768217682eucas1p2f;
 Tue, 31 Mar 2020 12:38:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 25.36.60698.CD9338E5; Tue, 31
 Mar 2020 13:38:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200331123852eucas1p26ff70e24feaea115e8228d9a9484c8d2~BY9oQz05k1768217682eucas1p2e;
 Tue, 31 Mar 2020 12:38:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331123852eusmtrp10f240d332b2fc9c8279de5e8d5013d05~BY9oQEu2K0604806048eusmtrp15;
 Tue, 31 Mar 2020 12:38:52 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-14-5e8339dc92b4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 75.73.07950.BD9338E5; Tue, 31
 Mar 2020 13:38:51 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200331123851eusmtip2705aec2c997d55cca778717b4afa3ab7~BY9nyFrAa2422324223eusmtip25;
 Tue, 31 Mar 2020 12:38:51 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: framebuffer bug (Re: general protection fault in do_syscall_64)
To: Andy Lutomirski <luto@kernel.org>
Message-ID: <9ce9e822-45f6-b863-1517-e11d0061b79e@samsung.com>
Date: Tue, 31 Mar 2020 14:38:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CALCETrVR_qcUPpi2=5QYUVu8VugouYcJ_j4R2jsG4QzggowGsA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7djPc7p3LJvjDPpbxCw+b/jHZnHl63s2
 i2kbxS1O9H1gtbi8aw6bxflda1ktLh1YwGTx6/1LJosbW+YyW2zeNJXZ4seGx6wO3B7fW/tY
 PPZMPMnmsWlVJ5vHu3Pn2D3udx9n8ni/7yqbx8y3ah6fN8l5nGj5whrAGcVlk5Kak1mWWqRv
 l8CVsfDIBJaCu7oVB7d/YW9gnKrWxcjJISFgIjH39yG2LkYuDiGBFYwSh9vPskI4Xxgldvd8
 hXI+M0osOdDJCNPS0vidHSKxnFFi3/KvTBDOW0aJ9b92M4FUsQlYSUxsXwXWISzgI7G3eTUL
 iC0ioCrx+vQOsLHMAtOYJW49m8gGkuAVsJPYt/4qO4jNAlS0tq2ZFcQWFYiQ+PTgMCtEjaDE
 yZlPwAZxCgRKPLn7AKyeWUBc4taT+UwQtrzE9rdzmEEWSAh8ZJf4fGM3M8TdLhLPZ6xmg7CF
 JV4d38IOYctInJ7cwwLRsI5R4m/HC6ju7YwSyyf/g+qwlrhz7heQzQG0QlNi/S59iLCjxPPT
 y9hBwhICfBI33gpCHMEnMWnbdGaIMK9ER5sQRLWaxIZlG9hg1nbtXMk8gVFpFpLXZiF5ZxaS
 d2Yh7F3AyLKKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMKmd/nf86w7GfX+SDjEKcDAq
 8fA+uNoYJ8SaWFZcmXuIUYKDWUmEl82/IU6INyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FC
 AumJJanZqakFqUUwWSYOTqkGxoMnbud//sc9Tc4z0Fvx/t41u0wFVTKuf+KdsmqdfIVFt2CN
 o4MkF4tK/E/xvukZjz21Jdk5Jr469ifZkG+POsc0nT/KqSbB0r4qIau6wpeyOLh8+XYxcZn8
 01+MMjHPanWP3Bc6o3Fre5218x0m5rsB7+/cWvs3R6/cSHxxeN6inZmOk+Q0lViKMxINtZiL
 ihMBTAahaGYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7q3LZvjDNbssrb4vOEfm8WVr+/Z
 LKZtFLc40feB1eLyrjlsFud3rWW1uHRgAZPFr/cvmSxubJnLbLF501Rmix8bHrM6cHt8b+1j
 8dgz8SSbx6ZVnWwe786dY/e4332cyeP9vqtsHjPfqnl83iTncaLlC2sAZ5SeTVF+aUmqQkZ+
 cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexsIjE1gK7upWHNz+hb2B
 capaFyMnh4SAiURL43f2LkYuDiGBpYwSEzevZ+li5ABKyEgcX18GUSMs8edaFxtEzWtGiflX
 3zGCJNgErCQmtq8Cs4UFfCT2Nq9mAbFFBFQlXp/ewQrSwCwwjVni7tFdbCAJIYEaiY0LfjCD
 2LwCdhL71l9lB7FZgBrWtjWzgtiiAhESh3fMYoSoEZQ4OfMJ2FBOgUCJJ3cfgNUzC6hL/Jl3
 iRnCFpe49WQ+E4QtL7H97RzmCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX
 5qXrJefnbmIERvC2Yz+37GDsehd8iFGAg1GJh/fB1cY4IdbEsuLK3EOMEhzMSiK8bP4NcUK8
 KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0wueSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNIT
 S1KzU1MLUotg+pg4OKUaGNculfitPd9fflvr+7fJDYrOoSzSL4TVT/I3/i17mn+ogiEsde6N
 7xV/fqlWd6bo250+90Q4fDfT9QWbznyaP2vGi4X8wuIJFjMDr+ot+dhW6zdp64+/jleOmVk3
 9F4S9lnY/LJTQV/e9VDvaeX7hzMsTni9qNZVda+JPnlptusWr2uzWyI8bZRYijMSDbWYi4oT
 AWmIvSL2AgAA
X-CMS-MailID: 20200331123852eucas1p26ff70e24feaea115e8228d9a9484c8d2
X-Msg-Generator: CA
X-RootMTR: 20200331123852eucas1p26ff70e24feaea115e8228d9a9484c8d2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200331123852eucas1p26ff70e24feaea115e8228d9a9484c8d2
References: <000000000000960ee605a1ef4d4e@google.com>
 <CALCETrVR_qcUPpi2=5QYUVu8VugouYcJ_j4R2jsG4QzggowGsA@mail.gmail.com>
 <CGME20200331123852eucas1p26ff70e24feaea115e8228d9a9484c8d2@eucas1p2.samsung.com>
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
 X86 ML <x86@kernel.org>, syzkaller-bugs@googlegroups.com,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 syzbot <syzbot+f9b2c53f55a9270fc778@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ please remember to include dri-devel ML & me on fbdev issues, thank you ]

On 3/29/20 1:37 AM, Andy Lutomirski wrote:
> On Sat, Mar 28, 2020 at 12:34 PM syzbot
> <syzbot+f9b2c53f55a9270fc778@syzkaller.appspotmail.com> wrote:
>>
>> Hello,
>>
>> syzbot found the following crash on:
>>
>> HEAD commit:    69c5eea3 Merge branch 'parisc-5.6-2' of git://git.kernel.o..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=14d3517be00000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=4ac76c43beddbd9
>> dashboard link: https://syzkaller.appspot.com/bug?extid=f9b2c53f55a9270fc778
>> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15059d05e00000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e5d5a3e00000
>>
>> IMPORTANT: if you fix the bug, please add the following tag to the commit:
>> Reported-by: syzbot+f9b2c53f55a9270fc778@syzkaller.appspotmail.com
> 
> Hi framebuffer people-

Hi Andy,

> Somewhere in the framebuffer code is a horrible bug that spews zeros
> over kernel memory (including text, suggesting a *physical* memory
> overrun).  My suspicion is that there is insufficient validation in
> the ioctls that set font parameters.

fbdev is in the maintenance mode and no new features or drivers are
being added so syzbot reports are not for a new bugs (regressions) and
are not a priority (at least to me).

> Could someone who is actually familiar with this code take a look?

Unfortunately I'm not familiar with this part of fbdev and I have only
resources to review/merge pending fbdev patches from time to time so
any help in fixing this and other syzbot reports is welcomed.

PS fbdev is maintained through drm-misc tree so patches can also be
handled by other drm-misc maintainers in case I'm not available.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> --Andy
> 
>>
>> general protection fault, probably for non-canonical address 0x1ffffffff1215a85: 0000 [#1] PREEMPT SMP KASAN
>> CPU: 1 PID: 7207 Comm: syz-executor045 Not tainted 5.6.0-rc7-syzkaller #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>> RIP: 0010:__read_once_size include/linux/compiler.h:199 [inline]
>> RIP: 0010:do_syscall_64+0x5f/0x1b0 arch/x86/entry/common.c:289
>> Code: 48 c7 c7 28 d4 0a 89 e8 bf 5d b0 00 48 83 3d af 5b 0a 08 00 0f 84 58 01 00 00 fb 66 0f 1f 44 00 00 65 48 8b 1c 25 c0 1d 02 00 <48> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> RSP: 0018:ffffc90001617f28 EFLAGS: 00010282
>> RAX: 1ffffffff1215a85 RBX: ffff888095530380 RCX: ffff888095530380
>> RDX: dffffc0000000000 RSI: 0000000000000000 RDI: ffff888095530bc4
>> RBP: 0000000000000000 R08: ffffffff817a2210 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000023
>> R13: dffffc0000000000 R14: ffffc90001617f58 R15: 0000000000000000
>> FS:  0000000001333880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f87bf9aae78 CR3: 00000000a6a3f000 CR4: 00000000001406e0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Call Trace:
>>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> RIP: 0033:0x4454e1
>> Code: 75 14 b8 23 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 64 1f fc ff c3 48 83 ec 08 e8 9a 42 00 00 48 89 04 24 b8 23 00 00 00 0f 05 <48> 8b 3c 24 48 89 c2 e8 e3 42 00 00 48 89 d0 48 83 c4 08 48 3d 01
>> RSP: 002b:00007ffd72d164b0 EFLAGS: 00000293 ORIG_RAX: 0000000000000023
>> RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00000000004454e1
>> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ffd72d164c0
>> RBP: 00000000006dbc20 R08: 0000000000000000 R09: 0000000000000000
>> R10: 00007ffd72d164e0 R11: 0000000000000293 R12: 0000000000000000
>> R13: 00000000006dbc2c R14: 000000000000000a R15: 0000000000000000
>> Modules linked in:
>> ---[ end trace 3da67f82bf6bae14 ]---
>> RIP: 0010:__read_once_size include/linux/compiler.h:199 [inline]
>> RIP: 0010:do_syscall_64+0x5f/0x1b0 arch/x86/entry/common.c:289
>> Code: 48 c7 c7 28 d4 0a 89 e8 bf 5d b0 00 48 83 3d af 5b 0a 08 00 0f 84 58 01 00 00 fb 66 0f 1f 44 00 00 65 48 8b 1c 25 c0 1d 02 00 <48> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> RSP: 0018:ffffc90001617f28 EFLAGS: 00010282
>> RAX: 1ffffffff1215a85 RBX: ffff888095530380 RCX: ffff888095530380
>> RDX: dffffc0000000000 RSI: 0000000000000000 RDI: ffff888095530bc4
>> RBP: 0000000000000000 R08: ffffffff817a2210 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000023
>> R13: dffffc0000000000 R14: ffffc90001617f58 R15: 0000000000000000
>> FS:  0000000001333880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f87bf9aae78 CR3: 00000000a6a3f000 CR4: 00000000001406e0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>
>>
>> ---
>> This bug is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this bug report. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> syzbot can test patches for this bug, for details see:
>> https://goo.gl/tpsmEJ#testing-patches

-- 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
